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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function DateSetTimezoneOffsetTest(): void {
  describe('DateSetTimezoneOffsetTest' as string, () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_DATE_SET_TMZN_OFFST_0100
     * @tc.name testDateSetTimezoneOffset0001
     * @tc.desc Verify standard Date.getTimezoneOffset returns a finite offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTimezoneOffset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result: long = date.getTimezoneOffset();
      expect(Number.isFinite(result)).assertTrue();
      expect(result % 15).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_SET_TMZN_OFFST_0200
     * @tc.name testDateSetTimezoneOffset0002
     * @tc.desc Verify getTimezoneOffset is stable after changing Date time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetTimezoneOffset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      date.setTime(1000);
      let result: long = date.getTimezoneOffset();
      expect(Number.isFinite(result)).assertTrue();
    });
  });
}
