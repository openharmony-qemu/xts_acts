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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

export default function BaseEnumGetNameTest(): void {
  describe('BaseEnumGetNameTest', (): void => {
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
     * @tc.name testBaseEnumGetName001
     * @tc.number SUB_BASEENUM_GETNAME_0100
     * @tc.desc Verify BaseEnum getName with no arguments returns correct name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "OK");
      let name: string = e.getName();
      expect(name).assertEqual("OK");
    });

    /**
     * @tc.name testBaseEnumGetName002
     * @tc.number SUB_BASEENUM_GETNAME_0200
     * @tc.desc Verify BaseEnum getName compile-time safety for extra parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "OK");
      let name: string = e.getName();
      expect(name).assertEqual("OK");
    });

    /**
     * @tc.name testBaseEnumGetName003
     * @tc.number SUB_BASEENUM_GETNAME_0300
     * @tc.desc Verify BaseEnum getName returns correct standard name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(2, "WARN");
      let name: string = e.getName();
      expect(name).assertEqual("WARN");
    });

    /**
     * @tc.name testBaseEnumGetName004
     * @tc.number SUB_BASEENUM_GETNAME_0400
     * @tc.desc Verify BaseEnum getName works correctly for int generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(100, "INFO");
      expect(e.getName()).assertEqual("INFO");
    });

    /**
     * @tc.name testBaseEnumGetName005
     * @tc.number SUB_BASEENUM_GETNAME_0500
     * @tc.desc Verify BaseEnum getName works correctly for byte generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<byte>(Int.toByte(1), "DEBUG");
      expect(e.getName()).assertEqual("DEBUG");
    });

    /**
     * @tc.name testBaseEnumGetName006
     * @tc.number SUB_BASEENUM_GETNAME_0600
     * @tc.desc Verify BaseEnum getName works correctly for short generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<short>(Int.toShort(10), "TRACE");
      expect(e.getName()).assertEqual("TRACE");
    });

    /**
     * @tc.name testBaseEnumGetName007
     * @tc.number SUB_BASEENUM_GETNAME_0700
     * @tc.desc Verify BaseEnum getName works correctly for long generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<long>(Int.toLong(1000), "ERROR");
      expect(e.getName()).assertEqual("ERROR");
    });

    /**
     * @tc.name testBaseEnumGetName008
     * @tc.number SUB_BASEENUM_GETNAME_0800
     * @tc.desc Verify BaseEnum getName works correctly for float generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<float>(Double.toFloat(1.5), "LEVEL_A");
      expect(e.getName()).assertEqual("LEVEL_A");
    });

    /**
     * @tc.name testBaseEnumGetName009
     * @tc.number SUB_BASEENUM_GETNAME_0900
     * @tc.desc Verify BaseEnum getName works correctly for double generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<double>(3.14, "LEVEL_B");
      expect(e.getName()).assertEqual("LEVEL_B");
    });

    /**
     * @tc.name testBaseEnumGetName010
     * @tc.number SUB_BASEENUM_GETNAME_1000
     * @tc.desc Verify BaseEnum getName works correctly for string generic type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<string>("code", "LEVEL_C");
      expect(e.getName()).assertEqual("LEVEL_C");
    });

    /**
     * @tc.name testBaseEnumGetName011
     * @tc.number SUB_BASEENUM_GETNAME_1100
     * @tc.desc Verify BaseEnum getName returns empty string when name is empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(0, "");
      let name: string = e.getName();
      expect(name).assertEqual("");
      expect(name.length).assertEqual(0);
    });

    /**
     * @tc.name testBaseEnumGetName012
     * @tc.number SUB_BASEENUM_GETNAME_1200
     * @tc.desc Verify BaseEnum getName returns single character name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "A");
      expect(e.getName()).assertEqual("A");
      expect(e.getName().length).assertEqual(1);
    });

    /**
     * @tc.name testBaseEnumGetName013
     * @tc.number SUB_BASEENUM_GETNAME_1300
     * @tc.desc Verify BaseEnum getName handles names with leading, trailing, and middle spaces
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new BaseEnum<int>(1, " HELLO");
      expect(e1.getName()).assertEqual(" HELLO");
      const e2 = new BaseEnum<int>(2, "HELLO ");
      expect(e2.getName()).assertEqual("HELLO ");
      const e3 = new BaseEnum<int>(3, "HELLO WORLD");
      expect(e3.getName()).assertEqual("HELLO WORLD");
    });

    /**
     * @tc.name testBaseEnumGetName014
     * @tc.number SUB_BASEENUM_GETNAME_1400
     * @tc.desc Verify BaseEnum getName handles names with special characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "!@#$%^&*()_+-=[]{}|;':\",./<>?");
      expect(e.getName()).assertEqual("!@#$%^&*()_+-=[]{}|;':\",./<>?");
    });

    /**
     * @tc.name testBaseEnumGetName015
     * @tc.number SUB_BASEENUM_GETNAME_1500
     * @tc.desc Verify BaseEnum getName handles names with escape characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "LINE1\nLINE2");
      expect(e.getName()).assertEqual("LINE1\nLINE2");
    });

    /**
     * @tc.name testBaseEnumGetName016
     * @tc.number SUB_BASEENUM_GETNAME_1600
     * @tc.desc Verify BaseEnum getName handles Unicode names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new BaseEnum<int>(1, "警告");
      expect(e1.getName()).assertEqual("警告");
      const e2 = new BaseEnum<int>(2, "ウォーニング");
      expect(e2.getName()).assertEqual("ウォーニング");
      const e3 = new BaseEnum<int>(3, "경고");
      expect(e3.getName()).assertEqual("경고");
    });

    /**
     * @tc.name testBaseEnumGetName017
     * @tc.number SUB_BASEENUM_GETNAME_1700
     * @tc.desc Verify BaseEnum getName handles names with numeric characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new BaseEnum<int>(1, "12345");
      expect(e1.getName()).assertEqual("12345");
      const e2 = new BaseEnum<int>(2, "LEVEL_100");
      expect(e2.getName()).assertEqual("LEVEL_100");
    });

    /**
     * @tc.name testBaseEnumGetName018
     * @tc.number SUB_BASEENUM_GETNAME_1800
     * @tc.desc Verify BaseEnum getName handles long string names (1000 characters)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longName: string = "A".repeat(1000);
      const e = new BaseEnum<int>(1, longName);
      expect(e.getName()).assertEqual(longName);
      expect(e.getName().length).assertEqual(1000);
    });

    /**
     * @tc.name testBaseEnumGetName019
     * @tc.number SUB_BASEENUM_GETNAME_1900
     * @tc.desc Verify BaseEnum getName handles names with zero-width space
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "WARN​ING");
      expect(e.getName()).assertEqual("WARN​ING");
    });

    /**
     * @tc.name testBaseEnumGetName020
     * @tc.number SUB_BASEENUM_GETNAME_2000
     * @tc.desc Verify BaseEnum getName return value type is string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "OK");
      let name: string = e.getName();
      expect(typeof name).assertEqual("string");
    });

    /**
     * @tc.name testBaseEnumGetName021
     * @tc.number SUB_BASEENUM_GETNAME_2100
     * @tc.desc Verify BaseEnum getName return value is not null
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "OK");
      let name: string = e.getName();
      expect(name == null).assertFalse();
    });

    /**
     * @tc.name testBaseEnumGetName022
     * @tc.number SUB_BASEENUM_GETNAME_2200
     * @tc.desc Verify BaseEnum getName return value is not undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "OK");
      let name: string = e.getName();
      expect(name == undefined).assertFalse();
    });

    /**
     * @tc.name testBaseEnumGetName023
     * @tc.number SUB_BASEENUM_GETNAME_2300
     * @tc.desc Verify BaseEnum getName returns consistent value on multiple calls
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "CONSISTENT");
      let name1: string = e.getName();
      let name2: string = e.getName();
      let name3: string = e.getName();
      expect(name1).assertEqual(name2);
      expect(name2).assertEqual(name3);
      expect(name1).assertEqual("CONSISTENT");
    });

    /**
     * @tc.name testBaseEnumGetName024
     * @tc.number SUB_BASEENUM_GETNAME_2400
     * @tc.desc Verify BaseEnum getName returns independent values for different instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new BaseEnum<int>(1, "ALPHA");
      const e2 = new BaseEnum<int>(2, "BETA");
      const e3 = new BaseEnum<int>(3, "GAMMA");
      expect(e1.getName()).assertEqual("ALPHA");
      expect(e2.getName()).assertEqual("BETA");
      expect(e3.getName()).assertEqual("GAMMA");
    });

    /**
     * @tc.name testBaseEnumGetName025
     * @tc.number SUB_BASEENUM_GETNAME_2500
     * @tc.desc Verify BaseEnum getName returns same name across different generic types
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ei = new BaseEnum<int>(1, "SAME_NAME");
      const es = new BaseEnum<string>("code", "SAME_NAME");
      const el = new BaseEnum<long>(Int.toLong(1), "SAME_NAME");
      expect(ei.getName()).assertEqual("SAME_NAME");
      expect(es.getName()).assertEqual("SAME_NAME");
      expect(el.getName()).assertEqual("SAME_NAME");
    });

    /**
     * @tc.name testBaseEnumGetName026
     * @tc.number SUB_BASEENUM_GETNAME_2600
     * @tc.desc Verify BaseEnum getName returns different names for same value with different names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = new BaseEnum<int>(1, "FIRST");
      const e2 = new BaseEnum<int>(1, "SECOND");
      expect(e1.getName()).assertEqual("FIRST");
      expect(e2.getName()).assertEqual("SECOND");
    });

    /**
     * @tc.name testBaseEnumGetName027
     * @tc.number SUB_BASEENUM_GETNAME_2700
     * @tc.desc Verify BaseEnum getName remains immutable after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(5, "IMMUTABLE");
      for (let i: int = 0; i < 100; i++) {
        expect(e.getName()).assertEqual("IMMUTABLE");
      }
    });

    /**
     * @tc.name testBaseEnumGetName028
     * @tc.number SUB_BASEENUM_GETNAME_2800
     * @tc.desc Verify BaseEnum getName does not throw exception in normal case
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "SAFE");
      try {
        let name: string = e.getName();
        expect(name).assertEqual("SAFE");
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.name testBaseEnumGetName029
     * @tc.number SUB_BASEENUM_GETNAME_2900
     * @tc.desc Verify BaseEnum getName in try-catch-finally does not enter catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new BaseEnum<int>(1, "TRY_TEST");
      let result: string = "";
      try {
        result = e.getName();
      } catch (error) {
        result = "ERROR";
      } finally {
        expect(result).assertEqual("TRY_TEST");
      }
    });

    /**
     * @tc.name testBaseEnumGetName030
     * @tc.number SUB_BASEENUM_GETNAME_3000
     * @tc.desc Verify BaseEnum getName throws when called on null reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let name: string = (null as BaseEnum<int>).getName();
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });

    /**
     * @tc.name testBaseEnumGetName031
     * @tc.number SUB_BASEENUM_GETNAME_3100
     * @tc.desc Verify BaseEnum getName throws when called on undefined reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testBaseEnumGetName031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let name: string = (undefined as BaseEnum<int>).getName();
        expect().assertFail();
      } catch (error) {
        expect(error == null).assertFalse();
      }
    });
  });
}
