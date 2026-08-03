'use static'

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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function mapToStringPart03TestTest(): void {
  describe('MapToStringPart03TestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART03_TEST_0100
     * @tc.name mapToStringPart03Test001
     * @tc.desc Verify toString == 'string'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      const result = map.toString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART03_TEST_0200
     * @tc.name mapToStringPart03Test002
     * @tc.desc Verify Map toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map<string, int>();
      const map2 = new Map<int, string>();
      const r1 = map1.toString();
      const r2 = map2.toString();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART03_TEST_0300
     * @tc.name mapToStringPart03Test003
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      map.toString();
      expect(map.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_TO_STRING_PART03_TEST_0400
     * @tc.name mapToStringPart03Test004
     * @tc.desc Verify size 0 Map clear toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapToStringPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.clear();
      const r1 = map.toString();
      const r2 = map.toString();
      expect(r1).assertEqual(r2);
    });

  });
}
