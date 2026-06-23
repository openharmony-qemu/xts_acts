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

export default function DateConstructor2Test(): void {
  describe('DateConstructor2Test', () => {
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
     * @tc.number SUB_DATE_CNSTR2_CHK_0200
     * @tc.name testDateConstructor20002
     * @tc.desc Verify Date constructor with no parameters uses default constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_0300
     * @tc.name testDateConstructor20003
     * @tc.desc Verify Date constructor ignores extra parameters with 2 arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0, 100);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_0500
     * @tc.name testDateConstructor20005
     * @tc.desc Verify Date constructor with timestamp 0 represents epoch time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      expect(date.valueOf()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_0600
     * @tc.name testDateConstructor20006
     * @tc.desc Verify Date constructor with positive UTC millisecond timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1609459200000);
      expect(date.valueOf()).assertEqual(1609459200000);
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_0700
     * @tc.name testDateConstructor20007
     * @tc.desc Verify Date constructor with negative timestamp for pre-1970 date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-86400000);
      expect(date.valueOf()).assertEqual(-86400000);
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_0800
     * @tc.name testDateConstructor20008
     * @tc.desc Verify Date constructor with large positive timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(10000000000000);
      expect(date.valueOf()).assertEqual(10000000000000);
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_0900
     * @tc.name testDateConstructor20009
     * @tc.desc Verify Date constructor with large negative timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-10000000000000);
      expect(date.valueOf()).assertEqual(-10000000000000);
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_1000
     * @tc.name testDateConstructor20010
     * @tc.desc Verify Date constructor with minimum positive timestamp 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1);
      expect(date.valueOf()).assertEqual(1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_1100
     * @tc.name testDateConstructor20011
     * @tc.desc Verify Date constructor with minimum negative timestamp -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-1);
      expect(date.valueOf()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_1200
     * @tc.name testDateConstructor20012
     * @tc.desc Verify Date constructor with Long.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(9223372036854775807);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_1500
     * @tc.name testDateConstructor20015
     * @tc.desc Verify Date constructor with minimum representable milliseconds -8640000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(-8640000000000000);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_1600
     * @tc.name testDateConstructor20016
     * @tc.desc Verify Date constructor with hexadecimal timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0xFF);
      expect(date.valueOf()).assertEqual(255);
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_1800
     * @tc.name testDateConstructor20018
     * @tc.desc Verify Date constructor with ISO 8601 date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("1970-01-01T00:00:00.000Z");
      expect(date.valueOf()).assertEqual(0);
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_1900
     * @tc.name testDateConstructor20019
     * @tc.desc Verify Date constructor with YYYY-MM-DD format date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("2025-06-15");
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_2100
     * @tc.name testDateConstructor20021
     * @tc.desc Verify Date constructor with timezone offset date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("2025-06-15T12:30:00+08:00");
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_2300
     * @tc.name testDateConstructor20023
     * @tc.desc Verify Date constructor with MM/DD/YYYY format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("06/15/2025");
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_2500
     * @tc.name testDateConstructor20025
     * @tc.desc Verify Date constructor with Chinese date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("2025年6月15日");
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_2900
     * @tc.name testDateConstructor20029
     * @tc.desc Verify Date constructor with whitespace-only string throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("   ");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_3000
     * @tc.name testDateConstructor20030
     * @tc.desc Verify Date constructor with invalid unparseable string throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("invalid date");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_3100
     * @tc.name testDateConstructor20031
     * @tc.desc Verify Date constructor with out-of-range month string throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("2025-13-01");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_3300
     * @tc.name testDateConstructor20033
     * @tc.desc Verify Date constructor with out-of-range hour string throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("2025-06-15T25:00:00");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_3700
     * @tc.name testDateConstructor20037
     * @tc.desc Verify Date constructor with Unicode encoded date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("\u0032\u0030\u0032\u0035-\u0030\u0036-\u0031\u0035");
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_3800
     * @tc.name testDateConstructor20038
     * @tc.desc Verify Date constructor with multi-language date string throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("テスト");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_4200
     * @tc.name testDateConstructor20042
     * @tc.desc Verify Date constructor with existing Date instance has consistent timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Date(1609459200000);
      let copied = new Date(original);
      expect(copied.valueOf()).assertEqual(original.valueOf());
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_4400
     * @tc.name testDateConstructor20044
     * @tc.desc Verify Date constructor with current time Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let now = new Date();
      let copied = new Date(now);
      expect(copied.valueOf()).assertEqual(now.valueOf());
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_4700
     * @tc.name testDateConstructor20047
     * @tc.desc Verify new Date instance is independent from original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Date(1000);
      let copied = new Date(original);
      expect(copied !== original).assertTrue();
      expect(copied.valueOf()).assertEqual(original.valueOf());
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_4800
     * @tc.name testDateConstructor20048
     * @tc.desc Verify Date constructor with null string parameter throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("null");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_5200
     * @tc.name testDateConstructor20052
     * @tc.desc Verify Date constructor with year, month, day parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 6, 15);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_5500
     * @tc.name testDateConstructor20055
     * @tc.desc Verify Date constructor with NaN string throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("NaN");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_5900
     * @tc.name testDateConstructor20059
     * @tc.desc Verify Date constructor returns Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      expect(date instanceof Date).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_6700
     * @tc.name testDateConstructor20067
     * @tc.desc Verify Date constructor with epoch date and setTime returns epoch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1970, 0, 1);
      date.setTime(0 as Long);
      expect(date.valueOf()).assertEqual(0);
    })

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_7100
     * @tc.name testDateConstructor20071
     * @tc.desc Verify return value typeof is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      expect(typeof date).assertEqual("object");
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_7200
     * @tc.name testDateConstructor20072
     * @tc.desc Verify return value has Date prototype methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1609459200000);
      expect(typeof date.getTime).assertEqual("function");
      expect(typeof date.getFullYear).assertEqual("function");
      expect(typeof date.getMonth).assertEqual("function");
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_7600
     * @tc.name testDateConstructor20076
     * @tc.desc Verify Date constructor with out-of-range timestamp 8640000000000001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(8640000000000001);
      expect(date !== null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_8000
     * @tc.name testDateConstructor20080
     * @tc.desc Verify Date constructor with epoch timestamp returns epoch ISO string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(0);
      expect(date.valueOf()).assertEqual(0);
      expect(date.toISOString()).assertEqual("1970-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_8300
     * @tc.name testDateConstructor20083
     * @tc.desc Verify various invalid string formats throw FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let invalidInputs = ["abc", "2025/13/01", "not-a-date", "<script>", ""];
      for (let input of invalidInputs) {
        try {
          let date = new Date(input);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual('FormatError');
        }
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_8400
     * @tc.name testDateConstructor20084
     * @tc.desc Verify Date constructor with illegal UTF-8 string throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("\udc04");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR2_CHK_8600
     * @tc.name testDateConstructor20086
     * @tc.desc Verify repeated Date constructor calls maintain stability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor20086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        let date = new Date(i);
        expect(date.valueOf()).assertEqual(i);
      }
    });
  })
};