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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function DateSetUTCDayTest(): void {
  describe('DateSetUTCDayTest' as string, () => {
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
     * @tc.number SUB_DATE_SET_UTC_DAY_0100
     * @tc.name testDateSetUTCDay0001
     * @tc.desc Verify standard setUTCDate can move Date to target UTC day of month
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 1));
      date.setUTCDate(3);
      expect(date.getTime()).assertEqual(Date.UTC(2024, 0, 3));
      expect(date.getUTCDate()).assertEqual(3);
      expect(date.getUTCDay()).assertEqual(3);
    });

    /**
     * @tc.number SUB_DATE_SET_UTC_DAY_0200
     * @tc.name testDateSetUTCDay0002
     * @tc.desc Verify standard setUTCDate normalizes across month boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateSetUTCDay0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(Date.UTC(2024, 0, 31));
      date.setUTCDate(32);
      expect(date.getTime()).assertEqual(Date.UTC(2024, 1, 1));
      expect(date.getUTCMonth()).assertEqual(1);
      expect(date.getUTCDate()).assertEqual(1);
      expect(date.getUTCDay()).assertEqual(4);
    });
  });
}
