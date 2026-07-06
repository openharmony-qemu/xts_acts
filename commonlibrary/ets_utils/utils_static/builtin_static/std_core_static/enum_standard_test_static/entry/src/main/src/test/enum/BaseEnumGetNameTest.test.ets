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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import {
  GetNameByteEnum,
  GetNameDoubleEnum,
  GetNameFloatEnum,
  GetNameIntEnum,
  GetNameLongEnum,
  GetNameShortEnum,
  GetNameStringEnum
} from './EnumDefine.test';
import Utils from './../Util.test';

export default function BaseEnumGetNameTest(): void {
  describe('BaseEnumGetNameTest', (): void => {
    // yield to coroutine scheduler for proper async test execution
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(1);
    });

    /**
     * @tc.name testBaseEnumGetName001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_0100
     * @tc.desc Verify BaseEnum getName with no arguments returns correct name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = GetNameIntEnum.OK;
      let name: string = e.getName();
      expect(name).assertEqual("OK");
    });

    /**
     * @tc.name testBaseEnumGetName002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_0200
     * @tc.desc Verify BaseEnum getName works correctly for int generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = GetNameIntEnum.INFO;
      expect(e.getName()).assertEqual("INFO");
    });

    /**
     * @tc.name testBaseEnumGetName003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_0300
     * @tc.desc Verify BaseEnum getName works correctly for byte generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = GetNameByteEnum.DEBUG;
      expect(e.getName()).assertEqual("DEBUG");
    });

    /**
     * @tc.name testBaseEnumGetName004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_0400
     * @tc.desc Verify BaseEnum getName works correctly for short generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = GetNameShortEnum.TRACE;
      expect(e.getName()).assertEqual("TRACE");
    });

    /**
     * @tc.name testBaseEnumGetName005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_0500
     * @tc.desc Verify BaseEnum getName works correctly for long generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = GetNameLongEnum.ERROR;
      expect(e.getName()).assertEqual("ERROR");
    });

    /**
     * @tc.name testBaseEnumGetName006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_0600
     * @tc.desc Verify BaseEnum getName works correctly for float generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = GetNameFloatEnum.LEVEL_A;
      expect(e.getName()).assertEqual("LEVEL_A");
    });

    /**
     * @tc.name testBaseEnumGetName007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_0700
     * @tc.desc Verify BaseEnum getName works correctly for double generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = GetNameDoubleEnum.LEVEL_B;
      expect(e.getName()).assertEqual("LEVEL_B");
    });

    /**
     * @tc.name testBaseEnumGetName008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_0800
     * @tc.desc Verify BaseEnum getName works correctly for string generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = GetNameStringEnum.LEVEL_C;
      expect(e.getName()).assertEqual("LEVEL_C");
    });

    /**
     * @tc.name testBaseEnumGetName009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_0900
     * @tc.desc Verify BaseEnum getName returns single character name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = GetNameIntEnum.A;
      expect(e.getName()).assertEqual("A");
      expect(e.getName().length).assertEqual(1);
    });

    /**
     * @tc.name testBaseEnumGetName010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_1000
     * @tc.desc Verify BaseEnum getName handles names with numeric characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e2 = GetNameIntEnum.LEVEL_100;
      expect(e2.getName()).assertEqual("LEVEL_100");
    });

    /**
     * @tc.name testBaseEnumGetName011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_1100
     * @tc.desc Verify BaseEnum getName return value type is string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = GetNameIntEnum.OK;
      let name: string = e.getName();
      expect(typeof name).assertEqual("string");
    });

    /**
     * @tc.name testBaseEnumGetName012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_1200
     * @tc.desc Verify BaseEnum getName return value is not undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = GetNameIntEnum.OK;
      let name: string = e.getName();
      expect(name !== undefined).assertTrue();
    });

    /**
     * @tc.name testBaseEnumGetName013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_1300
     * @tc.desc Verify BaseEnum getName returns independent values for different instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = GetNameIntEnum.ALPHA;
      const e2 = GetNameIntEnum.BETA;
      const e3 = GetNameIntEnum.GAMMA;
      expect(e1.getName()).assertEqual("ALPHA");
      expect(e2.getName()).assertEqual("BETA");
      expect(e3.getName()).assertEqual("GAMMA");
    });

    /**
     * @tc.name testBaseEnumGetName014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_1400
     * @tc.desc Verify BaseEnum getName returns same name across different generic types
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ei = GetNameIntEnum.SAME_NAME;
      const es = GetNameStringEnum.SAME_NAME;
      const el = GetNameLongEnum.SAME_NAME;
      expect(ei.getName()).assertEqual("SAME_NAME");
      expect(es.getName()).assertEqual("SAME_NAME");
      expect(el.getName()).assertEqual("SAME_NAME");
    });

    /**
     * @tc.name testBaseEnumGetName015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_1500
     * @tc.desc Verify BaseEnum getName returns different names for same value with different names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = GetNameIntEnum.FIRST;
      const e2 = GetNameIntEnum.SECOND;
      expect(e1.getName()).assertEqual("FIRST");
      expect(e2.getName()).assertEqual("SECOND");
    });

    /**
     * @tc.name testBaseEnumGetName016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASEENUM_GETNAME_1600
     * @tc.desc Verify BaseEnum getName remains immutable after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = GetNameIntEnum.IMMUTABLE;
      for (let i: int = 0; i < 100; i++) {
        expect(e.getName()).assertEqual("IMMUTABLE");
      }
    });
  });
}
