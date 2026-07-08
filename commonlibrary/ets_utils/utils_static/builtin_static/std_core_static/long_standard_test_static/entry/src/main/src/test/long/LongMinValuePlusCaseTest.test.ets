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
import Utils from './../Util.test';

export default function LongMinValuePlusCaseTest(): void {
  describe('LongMinValuePlusCaseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONGADD_0100
     * @tc.name testLongMinValuePlusCaseTest001
     * @tc.desc Verify Long MIN_VALUE toString(2) produces '-' + '1' + 63 zeros (65 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongMinValuePlusCaseTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LONG_MIN: long = -9223372036854775807 - 1;
      const r: string = new Long(LONG_MIN).toString(2);
      expect(r).assertEqual('-' + '1' + '0'.repeat(63));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONGADD_0200
     * @tc.name testLongMinValuePlusCaseTest002
     * @tc.desc Verify Long MIN_VALUE toString(8) produces '-1000000000000000000000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongMinValuePlusCaseTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LONG_MIN: long = -9223372036854775807 - 1;
      const r: string = new Long(LONG_MIN).toString(8);
      expect(r).assertEqual('-1000000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONGADD_0300
     * @tc.name testLongMinValuePlusCaseTest003
     * @tc.desc Verify Long MIN_VALUE toString(10) produces '-9223372036854775808'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongMinValuePlusCaseTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LONG_MIN: long = -9223372036854775807 - 1;
      const r: string = new Long(LONG_MIN).toString(10);
      expect(r).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONGADD_0400
     * @tc.name testLongMinValuePlusCaseTest004
     * @tc.desc Verify Long MIN_VALUE toString(16) produces '-8000000000000000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongMinValuePlusCaseTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LONG_MIN: long = -9223372036854775807 - 1;
      const r: string = new Long(LONG_MIN).toString(16);
      expect(r).assertEqual('-8000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONGADD_0500
     * @tc.name testLongMinValuePlusCaseTest005
     * @tc.desc Verify Long MIN_VALUE toString(36) produces '-1y2p0ij32e8e8'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongMinValuePlusCaseTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LONG_MIN: long = -9223372036854775807 - 1;
      const r: string = new Long(LONG_MIN).toString(36);
      expect(r).assertEqual('-1y2p0ij32e8e8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONGADD_0600
     * @tc.name testLongMinValuePlusCaseTest006
     * @tc.desc Verify Long MIN_VALUE + 1 toString(10) produces '-9223372036854775807'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongMinValuePlusCaseTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LONG_MIN_PLUS_ONE: long = -9223372036854775807;
      const r: string = new Long(LONG_MIN_PLUS_ONE).toString(10);
      expect(r).assertEqual('-9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONGADD_0700
     * @tc.name testLongMinValuePlusCaseTest007
     * @tc.desc Verify Long MIN_VALUE + 1 toString(2) length equals 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongMinValuePlusCaseTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LONG_MIN_PLUS_ONE: long = -9223372036854775807;
      const r: string = new Long(LONG_MIN_PLUS_ONE).toString(2);
      expect(r.length).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONGADD_0800
     * @tc.name testLongMinValuePlusCaseTest008
     * @tc.desc Verify static Long toString(MIN_VALUE) produces '-9223372036854775808'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongMinValuePlusCaseTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LONG_MIN: long = -9223372036854775807 - 1;
      const r: string = Long.toString(LONG_MIN);
      expect(r).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONGADD_0900
     * @tc.name testLongMinValuePlusCaseTest009
     * @tc.desc Verify Long MIN_VALUE toLocaleString en-US length greater than 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLongMinValuePlusCaseTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const LONG_MIN: long = -9223372036854775807 - 1;
      const r: string = new Long(LONG_MIN).toLocaleString('en-US');
      expect(r.length > 1).assertTrue();
    });
  });
}
