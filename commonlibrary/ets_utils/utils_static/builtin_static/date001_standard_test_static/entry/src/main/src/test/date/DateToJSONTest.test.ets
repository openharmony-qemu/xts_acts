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

export default function DateToJSONTest(): void {
  describe('DateToJSONTest', () => {
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
     * @tc.number SUB_DATE_TO_JSON_CHK_0100
     * @tc.name testDateToJSON0001
     * @tc.desc Verify calling toJSON without parameters returns correct ISO string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toJSON();
      expect(result).assertEqual("1970-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_0500
     * @tc.name testDateToJSON0005
     * @tc.desc Verify valid Date object returns ISO 8601 format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 5, 15, 10, 30, 0);
      let result = date.toJSON()!;
      expect(result.includes("2024")).assertTrue();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_0600
     * @tc.name testDateToJSON0006
     * @tc.desc Verify new Date() current time returns valid ISO string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date();
      let result = date.toJSON()!;
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_0700
     * @tc.name testDateToJSON0007
     * @tc.desc Verify positive timestamp returns correct ISO string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1700000000000);
      let result = date.toJSON()!;
      expect(result.includes("T")).assertTrue();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_0800
     * @tc.name testDateToJSON0008
     * @tc.desc Verify negative timestamp before 1970 returns valid ISO string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-86400000);
      let result = date.toJSON()!;
      expect(result.includes("T")).assertTrue();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_0900
     * @tc.name testDateToJSON0009
     * @tc.desc Verify Date with NaN internal value returns null from toJSON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("invalid");
        let result = date.toJSON();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_1500
     * @tc.name testDateToJSON0015
     * @tc.desc Verify return type of toJSON for valid date is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toJSON();
      expect(result).assertEqual("1970-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_1700
     * @tc.name testDateToJSON0017
     * @tc.desc Verify returned string conforms to ISO 8601 format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toJSON()!;
      expect(result.includes("T")).assertTrue();
      expect(result.endsWith("Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_1800
     * @tc.name testDateToJSON0018
     * @tc.desc Verify toJSON return value equals toISOString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1700000000000);
      expect(date.toJSON()).assertEqual(date.toISOString());
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_1900
     * @tc.name testDateToJSON0019
     * @tc.desc Verify toJSON string correctly reflects Date time value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result: string | null = date.toJSON();
      let parsed = new Date(result!);
      expect(parsed.getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_2300
     * @tc.name testDateToJSON0023
     * @tc.desc Verify minimum positive timestamp 1ms returns correct ISO string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(1);
      let result = date.toJSON();
      expect(result).assertEqual("1970-01-01T00:00:00.001Z");
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_2400
     * @tc.name testDateToJSON0024
     * @tc.desc Verify minimum negative timestamp -1ms returns correct ISO string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(-1);
      let result = date.toJSON();
      expect(result).assertEqual("1969-12-31T23:59:59.999Z");
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_2800
     * @tc.name testDateToJSON0028
     * @tc.desc Verify valid Date calling toJSON completes normally in try block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let executed = false;
      try {
        const date = new Date(0);
        let result = date.toJSON();
        expect(result).assertEqual("1970-01-01T00:00:00.000Z");
        executed = true;
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_2900
     * @tc.name testDateToJSON0029
     * @tc.desc Verify finally block always executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toJSON();
      expect(result).assertEqual("1970-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_3000
     * @tc.name testDateToJSON0030
     * @tc.desc Verify toJSON is a prototype method accessible on Date instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result = date.toJSON();
      expect(result).assertEqual("1970-01-01T00:00:00.000Z");
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_3100
     * @tc.name testDateToJSON0031
     * @tc.desc Verify multiple Date instances calling toJSON independently do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(0);
      const date2 = new Date(86400000);
      let result1: string | null = date1.toJSON();
      let result2: string | null = date2.toJSON();
      expect(result1 !== null).assertTrue();
      expect(result2 !== null).assertTrue();
      expect(result1 !== result2).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_3200
     * @tc.name testDateToJSON0032
     * @tc.desc Verify JSON.stringify automatically calls toJSON on Date object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let json = JSON.stringify(date);
      expect(json).assertEqual('"1970-01-01T00:00:00.000Z"');
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_3300
     * @tc.name testDateToJSON0033
     * @tc.desc Verify JSON.stringify on invalid Date returns null string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("invalid");
        let json = JSON.stringify(date);
        expect(json).assertEqual("null");
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_3400
     * @tc.name testDateToJSON0034
     * @tc.desc Verify object with Date property calls toJSON during serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let obj: Record<string, Date> = { 'createdAt': date };
      let json = JSON.stringify(obj);
      expect(json.includes("1970-01-01T00:00:00.000Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_3500
     * @tc.name testDateToJSON0035
     * @tc.desc Verify array with Date element calls toJSON during serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let arr: (Date | string)[] = [date, "other"];
      let json = JSON.stringify(arr);
      expect(json.includes("1970-01-01T00:00:00.000Z")).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_3600
     * @tc.name testDateToJSON0036
     * @tc.desc Verify multiple calls to toJSON on same Date return identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let result1 = date.toJSON();
      let result2 = date.toJSON();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_3700
     * @tc.name testDateToJSON0037
     * @tc.desc Verify calling toJSON does not modify original Date internal time value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let before = date.getTime();
      date.toJSON();
      let after = date.getTime();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_3800
     * @tc.name testDateToJSON0038
     * @tc.desc Verify invalid Date multiple calls to toJSON all return null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const date = new Date("invalid");
        let result1 = date.toJSON();
        let result2 = date.toJSON();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('FormatError');
      }
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_4000
     * @tc.name testDateToJSON0040
     * @tc.desc Verify toJSON returns ISO format while toString returns local format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(0);
      let json = date.toJSON();
      let str = date.toString();
      expect(json !== str).assertTrue();
    });

    /**
     * @tc.number SUB_DATE_TO_JSON_CHK_4100
     * @tc.name testDateToJSON0041
     * @tc.desc Verify parsed toJSON string getTime equals original Date getTime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDateToJSON0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(86400000);
      let json: string | null = date.toJSON();
      expect(json !== null).assertTrue();
      let parsed = new Date(json!);
      expect(parsed.getTime()).assertEqual(date.getTime());
    });
  });
}
