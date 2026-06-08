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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongConstructor1Test(): void {
  describe('LongConstructor1Test', () => {
    const CON1_30: int = 30;
    const CON1_STR_0: string = "0";

    beforeEach(async () => { await Utils.msSleep(CON1_30); });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0100
     * @tc.name testLongConstructor1001
     * @tc.desc Verify default constructor creates non-null, non-undefined instance with toString "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      expect(value.toString()).assertEqual(CON1_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0200
     * @tc.name testLongConstructor1002
     * @tc.desc Verify multiple default constructor instances have same toString "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: Long = new Long();
      const value2: Long = new Long();
      expect(value1.toString()).assertEqual(CON1_STR_0);
      expect(value2.toString()).assertEqual(CON1_STR_0);
      expect(value1.toString()).assertEqual(value2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0300
     * @tc.name testLongConstructor1003
     * @tc.desc Verify default constructor instances are equal via equals()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value1: Long = new Long();
      const value2: Long = new Long();
      expect(value1.equals(value2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CONSTRUCTOR1_0400
     * @tc.name testLongConstructor1004
     * @tc.desc Verify default constructor does not throw exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongConstructor1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long();
      expect(value.toString()).assertEqual(CON1_STR_0);
    });
  });
}
