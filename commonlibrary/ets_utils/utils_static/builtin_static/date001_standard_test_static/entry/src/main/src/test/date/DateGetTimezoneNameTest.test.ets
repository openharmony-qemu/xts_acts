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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function DateGetTimezoneNameTest(): void {
  describe('DateGetTimezoneNameTest', () => {
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
     * @tc.number SUB_DATE_GET_TMZN_NAME_0100
     * @tc.name testDateGetTimezoneName0001
     * @tc.desc Verify standard Date.toString returns timezone information text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result: string = date.toString();
      expect(result.indexOf("GMT") >= 0 || result.indexOf("UTC") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_GET_TMZN_NAME_0200
     * @tc.name testDateGetTimezoneName0002
     * @tc.desc Verify standard Date.toLocaleString returns a non-empty localized string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateGetTimezoneName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1000);
      let result: string = date.toLocaleString();
      expect(result !== date.toString()).assertTrue();
    });
  });
}
