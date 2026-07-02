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

export default function DateGetLocalTimezoneOffsetTest(): void {
  describe('DateGetLocalTimezoneOffsetTest', (): void => {
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
     * @tc.number SUB_DATE_GET_LOCAL_TMZN_0100
     * @tc.name testDateGetLocalTimezoneOffset0001
     * @tc.desc Verify local timezone offset through standard Date.getTimezoneOffset
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetLocalTimezoneOffset0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(0);
      let offset: long = date.getTimezoneOffset();
      expect(Number.isFinite(offset)).assertTrue();
      expect(offset % 15).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_GET_LOCAL_TMZN_0200
     * @tc.name testDateGetLocalTimezoneOffset0002
     * @tc.desc Verify timezone offset is stable for repeated calls on same Date
     * @tc.size SmallTest
     * @tc.type FunctionTest
     * @tc.level Level1
     */
    it('testDateGetLocalTimezoneOffset0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date = new Date(1000);
      let offset1: long = date.getTimezoneOffset();
      let offset2: long = date.getTimezoneOffset();
      expect(offset1).assertEqual(offset2);
    });
  });
}
