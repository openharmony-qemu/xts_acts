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

export default function DateIsDateValidTest(): void {
  describe('DateIsDateValidTest', () => {
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
     * @tc.number SUB_DATE_IS_VALID_CHK_0100
     * @tc.name testDateIsDateValid0001
     * @tc.desc Verify valid Date through standard getTime finite check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateIsDateValid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      expect(Number.isFinite(date.getTime())).assertTrue();
      expect(Number.isNaN(date.getTime())).assertFalse();
    });

    /**
     * @tc.number SUB_DATE_IS_VALID_CHK_0200
     * @tc.name testDateIsDateValid0002
     * @tc.desc Verify invalid Date string throws FormatError or yields NaN time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateIsDateValid0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date('invalid');
        expect(Number.isNaN(date.getTime())).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });
  });
}
