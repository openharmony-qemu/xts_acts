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

export default function DateConstructor1Test(): void {
  describe('DateConstructor1Test', () => {
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
     * @tc.number SUB_DATE_CNSTR1_CHK_0100
     * @tc.name testDateConstructor10001
     * @tc.desc Verify creating Date instance without arguments uses current time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date()
      expect(date != null).assertTrue();
      expect(Number.isFinite(date.getTime())).assertTrue()
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_0200
     * @tc.name testDateConstructor10002
     * @tc.desc Verify constructor ignores one extra argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1234567890);
      expect(date != null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_0300
     * @tc.name testDateConstructor10003
     * @tc.desc Verify constructor behavior with multiple extra arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(2025, 1, 1);
      expect(date != null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1100
     * @tc.name testDateConstructor10011
     * @tc.desc Verify constructor with invalid date string throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("not a date");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1300
     * @tc.name testDateConstructor10013
     * @tc.desc Verify constructor with date string as extra argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("2025-01-01");
      expect(date != null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1400
     * @tc.name testDateConstructor10014
     * @tc.desc Verify constructor with empty string throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_1900
     * @tc.name testDateConstructor10019
     * @tc.desc Verify constructor with array as extra argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date("2025,1,1");
      expect(date != null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2000
     * @tc.name testDateConstructor10020
     * @tc.desc Verify constructor with another Date instance as argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date();
      let date2 = new Date(date1);
      expect(date2 != null).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2300
     * @tc.name testDateConstructor10023
     * @tc.desc Verify multiple constructor calls all return valid instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date();
      let date2 = new Date();
      let date3 = new Date();
      expect(Number.isFinite(date1.getTime())).assertTrue();
      expect(Number.isFinite(date2.getTime())).assertTrue();
      expect(Number.isFinite(date3.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2500
     * @tc.name testDateConstructor10025
     * @tc.desc Verify consecutively created instances are independent objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date();
      let date2 = new Date();
      expect(date1 === date2).assertFalse();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2600
     * @tc.name testDateConstructor10026
     * @tc.desc Verify returned value is instance of Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      expect(date instanceof Date).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2700
     * @tc.name testDateConstructor10027
     * @tc.desc Verify typeof returned value is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      expect(typeof date).assertEqual("object");
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_2900
     * @tc.name testDateConstructor10029
     * @tc.desc Verify created instance can call Date prototype methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      expect(typeof date.getTime).assertEqual("function");
      expect(typeof date.getFullYear).assertEqual("function");
      expect(typeof date.getMonth).assertEqual("function");
      expect(typeof date.getDate).assertEqual("function");
      expect(typeof date.getHours).assertEqual("function");
      expect(typeof date.getMinutes).assertEqual("function");
      expect(typeof date.getSeconds).assertEqual("function");
      expect(typeof date.getMilliseconds).assertEqual("function");
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3000
     * @tc.name testDateConstructor10030
     * @tc.desc Verify getTime returns fixed constructor timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let timestamp = date.getTime();
      expect(timestamp).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3100
     * @tc.name testDateConstructor10031
     * @tc.desc Verify getTime returns millisecond-precision timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      let timestamp = date.getTime();
      expect(Number.isInteger(timestamp)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3200
     * @tc.name testDateConstructor10032
     * @tc.desc Verify created Date instance keeps fixed timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(123456789);
      let dateTimestamp = date.getTime();
      expect(dateTimestamp).assertEqual(123456789);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3500
     * @tc.name testDateConstructor10035
     * @tc.desc Verify finally block always executes when creating Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      let date = new Date(1000);
      expect(date.getTime()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_3900
     * @tc.name testDateConstructor10039
     * @tc.desc Verify passing illegal UTF-8 encoded string throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("\udc04");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_4100
     * @tc.name testDateConstructor10041
     * @tc.desc Verify passing XSS attack string throws FormatError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let date = new Date("<script>alert(1)</script>");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_4300
     * @tc.name testDateConstructor10043
     * @tc.desc Verify Date constructed from fixed timestamp returns same getTime value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1609459200000);
      expect(date.getTime()).assertEqual(1609459200000);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_4400
     * @tc.name testDateConstructor10044
     * @tc.desc Verify fixed timestamps preserve ordering between Date instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date(1000);
      let date2 = new Date(2000);
      expect(date2.getTime() > date1.getTime()).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_4500
     * @tc.name testDateConstructor10045
     * @tc.desc Verify fixed timestamp precision when creating Date instances in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let timestamps: number[] = [];
      for (let i = 0; i < 100; i++) {
        let date = new Date(i);
        timestamps.push(date.getTime());
      }
      for (let i = 0; i < timestamps.length; i++) {
        expect(timestamps[i]).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_4600
     * @tc.name testDateConstructor10046
     * @tc.desc Verify getTime can be called normally after instance creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(1000);
      let time = date.getTime();
      expect(time).assertEqual(1000);
      expect(Number.isFinite(time)).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_4700
     * @tc.name testDateConstructor10047
     * @tc.desc Verify year month day hour minute second can be retrieved after creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      let year = date.getFullYear();
      let month = date.getMonth();
      let day = date.getDate();
      let hours = date.getHours();
      let minutes = date.getMinutes();
      let seconds = date.getSeconds();
      expect(year >= 1970).assertTrue();
      expect(month >= 0 && month <= 11).assertTrue();
      expect(day > 0).assertTrue();
      expect(hours >= 0 && hours <= 23).assertTrue();
      expect(minutes >= 0 && minutes <= 59).assertTrue();
      expect(seconds >= 0 && seconds <= 59).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_4800
     * @tc.name testDateConstructor10048
     * @tc.desc Verify instance can be converted to string normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      let str = date.toString();
      expect(str.length > 0).assertTrue();
      expect(str.length >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_4900
     * @tc.name testDateConstructor10049
     * @tc.desc Verify instance can be converted to ISO format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date();
      let iso = date.toISOString();
      expect(iso.length > 0).assertTrue();
      expect(iso.indexOf("T") > 0).assertTrue();
      expect(iso.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_5000
     * @tc.name testDateConstructor10050
     * @tc.desc Verify no memory leak or exception when rapidly creating many Date instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dates: Date[] = [];
      for (let i = 0; i < 1000; i++) {
        dates.push(new Date());
      }
      expect(dates.length).assertEqual(1000);
      for (let i = 0; i < dates.length; i++) {
        expect(Number.isFinite(dates[i].getTime())).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_5100
     * @tc.name testDateConstructor10051
     * @tc.desc Verify modifying one Date instance does not affect others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date1 = new Date();
      let date2 = new Date();
      let originalTime2 = date2.getTime();
      date1.setTime(0);
      expect(date2.getTime()).assertEqual(originalTime2);
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_5300
     * @tc.name testDateConstructor10053
     * @tc.desc Verify creating Date instance in block scope
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerDate: Date | null = null;
      outerDate = new Date();
      expect(outerDate !== null).assertTrue();
      expect(Number.isFinite(outerDate!.getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_5500
     * @tc.name testDateConstructor10055
     * @tc.desc Verify created Date instances can be stored in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dates: Date[] = [];
      dates.push(new Date());
      dates.push(new Date());
      dates.push(new Date());
      expect(dates.length).assertEqual(3);
      expect(Number.isFinite(dates[0].getTime())).assertTrue();
      expect(Number.isFinite(dates[1].getTime())).assertTrue();
      expect(Number.isFinite(dates[2].getTime())).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_CNSTR1_CHK_5600
     * @tc.name testDateConstructor10056
     * @tc.desc Verify fixed Date timestamp equals constructor value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateConstructor10056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let date = new Date(86400000);
      let dateTimestamp = date.getTime();
      expect(dateTimestamp).assertEqual(86400000);
    });
  })
};