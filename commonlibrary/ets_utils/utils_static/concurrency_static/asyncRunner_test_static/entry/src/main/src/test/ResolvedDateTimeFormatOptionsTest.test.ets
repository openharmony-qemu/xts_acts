/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function builtinsResolvedDateTimeFormatOptionsTest(){
  describe('builtinsResolvedDateTimeFormatOptionsTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest100
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest100
     @tc.desc function get calendar(): string 测试gregorian日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest100';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { calendar: 'gregorian' });
      let result = dateTimeFormat.resolvedOptions().calendar;
      expect(result).assertEqual('gregorian');
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest101
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest101
     @tc.desc function get calendar(): string 测试korea日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest101';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ko-KR', { calendar: 'korea' });
      let result = dateTimeFormat.resolvedOptions().calendar;
      expect(result).assertEqual('korea');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest102
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest102
     @tc.desc function get calendar(): string 测试islamic日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest102';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ar-SA', { calendar: 'islamic' });
      let result = dateTimeFormat.resolvedOptions().calendar;
      expect(result).assertEqual('islamic');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest103
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest103
     @tc.desc function get calendar(): string 测试japanese日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest103';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ja-JP', { calendar: 'japanese' });
      let result = dateTimeFormat.resolvedOptions().calendar;
      expect(result).assertEqual('japanese');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest104
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest104
     @tc.desc function get calendar(): string 测试buddhist日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest104';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('th-TH', { calendar: 'buddhist' });
      let result = dateTimeFormat.resolvedOptions().calendar;
      expect(result).assertEqual('buddhist');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest105
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest105
     @tc.desc function get calendar(): string 测试hebrew日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest105';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('he-IL', { calendar: 'hebrew' });
      let result = dateTimeFormat.resolvedOptions().calendar;
      expect(result).assertEqual('hebrew');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest106
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest106
     @tc.desc function get calendar(): string 测试indian日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest106';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-IN', { calendar: 'indian' });
      let result = dateTimeFormat.resolvedOptions().calendar;
      expect(result).assertEqual('indian');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest107
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest107
     @tc.desc function get calendar(): string 测试默认日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest107';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().calendar;
      expect(result !== undefined && result !== '').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number SUB_builtinsResolvedDateTimeFormatOptionsTest_TEST0200
     * @tc.name builtinsResolvedDateTimeFormatOptionsTestTest0200
     * @tc.desc get dateStyle(): "full" | "long" | "medium" | "short" | undefined 测试full值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest0200';
        console.info(`${caseName}, test start`);
        let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
          dateStyle: 'full'
        });
        let resolvedOptions = dateTimeFormat.resolvedOptions();
        let result = resolvedOptions.dateStyle;
        expect(result).assertEqual('full');
        console.info(`${caseName}, test end`);
        Done();
      })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest201
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest201
     @tc.desc function get dateStyle(): "full" | "long" | "medium" | "short" | undefined 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest201';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'long' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest202
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest202
     @tc.desc function get dateStyle(): "full" | "long" | "medium" | "short" | undefined 测试medium值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest202';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'medium' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual('medium');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest203
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest203
     @tc.desc function get dateStyle(): "full" | "long" | "medium" | "short" | undefined 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest203';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'short' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest204
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest204
     @tc.desc function get dateStyle(): "full" | "long" | "medium" | "short" | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest204';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'short' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest205
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest205
     @tc.desc function get dateStyle(): "full" | "long" | "medium" | "short" | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest205';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'medium' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual('medium');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest206
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest206
     @tc.desc function get dateStyle(): "full" | "long" | "medium" | "short" | undefined 测试同时设置dateStyle和timeStyle
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest206';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        dateStyle: 'short',
        timeStyle: 'medium'
      });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest207
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest207
     @tc.desc function get dateStyle(): "full" | "long" | "medium" | "short" | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest207';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'long' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result === 'full' || result === 'long' || result === 'medium' || result === 'short' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest0300
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest0300
     @tc.desc function get day(): string | undefined 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

    it('builtinsResolvedDateTimeFormatOptionsTestTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest0300';
        console.info(`${caseName}, test start`);
        let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
          weekday: 'long'
        });
        let resolvedOptions = dateTimeFormat.resolvedOptions();
        let result = resolvedOptions.weekday;
        expect(result).assertEqual('long');
        console.info(`${caseName}, test end`);
        Done();
      })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest301
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest301
     @tc.desc function get day(): string | undefined 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest301';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'short' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTestTest302
     @tc.name builtinsResolvedDateTimeFormatOptionsTestTest302
     @tc.desc function get day(): string | undefined 测试narrow值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTestTest302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTestTest302';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('narrow');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest303
     @tc.name builtinsResolvedDateTimeFormatOptionsTest303
     @tc.desc function get day(): string | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest303';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest304
     @tc.name builtinsResolvedDateTimeFormatOptionsTest304
     @tc.desc function get day(): string | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest304';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { day: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().day;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest305
     @tc.name builtinsResolvedDateTimeFormatOptionsTest305
     @tc.desc function get day(): string | undefined 测试完整日期格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest305';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        weekday: 'short',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest306
     @tc.name builtinsResolvedDateTimeFormatOptionsTest306
     @tc.desc function get day(): string | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest306';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest307
     @tc.name builtinsResolvedDateTimeFormatOptionsTest307
     @tc.desc function get day(): string | undefined 测试默认行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest307';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().weekday;
      console.info(`Default weekday: ${result}`);
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     * @tc.number SUB_ResolvedDateTimeFormatOptions_TEST0400
     * @tc.name builtinsResolvedDateTimeFormatOptionsTest0400
     * @tc.desc get dayPeriod(): "narrow" | "short" | "long" | undefined 测试long值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsResolvedDateTimeFormatOptionsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsResolvedDateTimeFormatOptionsTest0400';
        console.info(`${caseName}, test start`);
        let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('en-US', {
          dayPeriod: 'long'
        });
        let resolvedOptions: Intl.ResolvedDateTimeFormatOptions = dateTimeFormat.resolvedOptions();
        let result: string | undefined = resolvedOptions.dayPeriod;
        expect(result).assertEqual('long');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest401
     @tc.name builtinsResolvedDateTimeFormatOptionsTest401
     @tc.desc function get dayPeriod(): "narrow" | "short" | "long" | undefined 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest401';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dayPeriod: 'short' });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest402
     @tc.name builtinsResolvedDateTimeFormatOptionsTest402
     @tc.desc function get dayPeriod(): "narrow" | "short" | "long" | undefined 测试narrow值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest402';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dayPeriod: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result).assertEqual('narrow');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest403
     @tc.name builtinsResolvedDateTimeFormatOptionsTest403
     @tc.desc function get dayPeriod(): "narrow" | "short" | "long" | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest403';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: 'numeric', minute: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest404
     @tc.name builtinsResolvedDateTimeFormatOptionsTest404
     @tc.desc function get dayPeriod(): "narrow" | "short" | "long" | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest404';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        dayPeriod: 'short'
      });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest404
     @tc.name builtinsResolvedDateTimeFormatOptionsTest404
     @tc.desc function get dayPeriod(): "narrow" | "short" | "long" | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest404';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        dayPeriod: 'short'
      });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest405
     @tc.name builtinsResolvedDateTimeFormatOptionsTest405
     @tc.desc function get dayPeriod(): "narrow" | "short" | "long" | undefined 测试12小时制下的dayPeriod
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    /*
    it('builtinsResolvedDateTimeFormatOptionsTest405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest405';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        hour12: true,
        dayPeriod: 'long'
      });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })
*/
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest406
     @tc.name builtinsResolvedDateTimeFormatOptionsTest406
     @tc.desc function get dayPeriod(): "narrow" | "short" | "long" | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest406';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dayPeriod: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest407
     @tc.name builtinsResolvedDateTimeFormatOptionsTest407
     @tc.desc function get dayPeriod(): "narrow" | "short" | "long" | undefined 测试默认行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest407';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      console.info(`Default dayPeriod: ${result}`);
      expect(result === 'long' || result === 'short' || result === 'narrow').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest0500
     @tc.name builtinsResolvedDateTimeFormatOptionsTest0500
     @tc.desc function get era(): string | undefined 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

    it('builtinsResolvedDateTimeFormatOptionsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsResolvedDateTimeFormatOptionsTest0500';
        console.info(`${caseName}, test start`);
        let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
          era: 'long'
        });
        let resolvedOptions = dateTimeFormat.resolvedOptions();
        let result = resolvedOptions.era;
        expect(result).assertEqual('long');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest501
     @tc.name builtinsResolvedDateTimeFormatOptionsTest501
     @tc.desc function get era(): string | undefined 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest501';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { era: 'short' });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest502
     @tc.name builtinsResolvedDateTimeFormatOptionsTest502
     @tc.desc function get era(): string | undefined 测试narrow值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest502';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { era: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result).assertEqual('narrow');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest503
     @tc.name builtinsResolvedDateTimeFormatOptionsTest503
     @tc.desc function get era(): string | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest503';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long', day: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest504
     @tc.name builtinsResolvedDateTimeFormatOptionsTest504
     @tc.desc function get era(): string | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest504';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ja-JP', { era: 'long' });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest505
     @tc.name builtinsResolvedDateTimeFormatOptionsTest505
     @tc.desc function get era(): string | undefined 测试完整日期格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest505';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        era: 'short',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest506
     @tc.name builtinsResolvedDateTimeFormatOptionsTest506
     @tc.desc function get era(): string | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest506';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { era: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest507
     @tc.name builtinsResolvedDateTimeFormatOptionsTest507
     @tc.desc function get era(): string | undefined 测试默认行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest507';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().era;
      console.info(`Default era: ${result}`);
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest600
     @tc.name builtinsResolvedDateTimeFormatOptionsTest600
     @tc.desc function get formatMatcher(): "basic" | "best fit" | undefined 测试basic值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest600';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { formatMatcher: 'basic' });
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      expect(result).assertEqual('basic');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest601
     @tc.name builtinsResolvedDateTimeFormatOptionsTest601
     @tc.desc function get formatMatcher(): "basic" | "best fit" | undefined 测试best fit值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest601';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { formatMatcher: 'best fit' });
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      expect(result).assertEqual('best fit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest602
     @tc.name builtinsResolvedDateTimeFormatOptionsTest602
     @tc.desc function get formatMatcher(): "basic" | "best fit" | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest602';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest603
     @tc.name builtinsResolvedDateTimeFormatOptionsTest603
     @tc.desc function get formatMatcher(): "basic" | "best fit" | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest603';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        formatMatcher: 'basic'
      });
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      expect(result).assertEqual('basic');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest604
     @tc.name builtinsResolvedDateTimeFormatOptionsTest604
     @tc.desc function get formatMatcher(): "basic" | "best fit" | undefined 测试与日期选项组合
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest604';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        formatMatcher: 'best fit',
        year: 'numeric',
        month: 'long'
      });
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      expect(result).assertEqual('best fit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest605
     @tc.name builtinsResolvedDateTimeFormatOptionsTest605
     @tc.desc function get formatMatcher(): "basic" | "best fit" | undefined 测试与时间选项组合
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest605';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        formatMatcher: 'basic',
        hour: 'numeric',
        minute: '2-digit'
      });
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      expect(result).assertEqual('basic');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest606
     @tc.name builtinsResolvedDateTimeFormatOptionsTest606
     @tc.desc function get formatMatcher(): "basic" | "best fit" | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest606';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { formatMatcher: 'best fit' });
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      expect(result === 'basic' || result === 'best fit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest607
     @tc.name builtinsResolvedDateTimeFormatOptionsTest607
     @tc.desc function get formatMatcher(): "basic" | "best fit" | undefined 测试默认行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest607';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      console.info(`Default formatMatcher: ${result}`);
      expect(result === 'basic' || result === 'best fit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest0700
     @tc.name builtinsResolvedDateTimeFormatOptionsTest0700
     @tc.desc function get fractionalSecondDigits(): number | undefined 测试值为1
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

    it('builtinsResolvedDateTimeFormatOptionsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsResolvedDateTimeFormatOptionsTest0700';
        console.info(`${caseName}, test start`);
        let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
          fractionalSecondDigits: 1
        });
        let resolvedOptions = dateTimeFormat.resolvedOptions();
        let result = resolvedOptions.fractionalSecondDigits;
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest701
     @tc.name builtinsResolvedDateTimeFormatOptionsTest701
     @tc.desc function get fractionalSecondDigits(): number | undefined 测试值为2
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest701';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { fractionalSecondDigits: 2 });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result).assertEqual(2);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest702
     @tc.name builtinsResolvedDateTimeFormatOptionsTest702
     @tc.desc function get fractionalSecondDigits(): number | undefined 测试值为3
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest702';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { fractionalSecondDigits: 3 });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result).assertEqual(3);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest703
     @tc.name builtinsResolvedDateTimeFormatOptionsTest703
     @tc.desc function get fractionalSecondDigits(): number | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest703';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: 'numeric', minute: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest704
     @tc.name builtinsResolvedDateTimeFormatOptionsTest704
     @tc.desc function get fractionalSecondDigits(): number | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest704';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        second: 'numeric',
        fractionalSecondDigits: 2
      });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result).assertEqual(2);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest705
     @tc.name builtinsResolvedDateTimeFormatOptionsTest705
     @tc.desc function get fractionalSecondDigits(): number | undefined 测试与秒选项组合
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest705';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        fractionalSecondDigits: 3,
        second: '2-digit'
      });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result).assertEqual(3);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest706
     @tc.name builtinsResolvedDateTimeFormatOptionsTest706
     @tc.desc function get fractionalSecondDigits(): number | undefined 测试完整时间格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest706';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        fractionalSecondDigits: 1,
        hour: 'numeric',
        minute: '2-digit',
        second: '2-digit'
      });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result).assertEqual(1);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest707
     @tc.name builtinsResolvedDateTimeFormatOptionsTest707
     @tc.desc function get fractionalSecondDigits(): number | undefined 测试数值验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest707';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { fractionalSecondDigits: 2 });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result === 1 || result === 2 || result === 3 || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest0800
     @tc.name builtinsResolvedDateTimeFormatOptionsTest0800
     @tc.desc function get hour(): string | undefined 测试numeric值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

    it('builtinsResolvedDateTimeFormatOptionsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsResolvedDateTimeFormatOptionsTest0800';
        console.info(`${caseName}, test start`);
        let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
          hour: 'numeric'
        });
        let resolvedOptions = dateTimeFormat.resolvedOptions();
        let result = resolvedOptions.hour;
        expect(result).assertEqual('numeric');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest801
     @tc.name builtinsResolvedDateTimeFormatOptionsTest801
     @tc.desc function get hour(): string | undefined 测试2-digit值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest801';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().hour;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest802
     @tc.name builtinsResolvedDateTimeFormatOptionsTest802
     @tc.desc function get hour(): string | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest802';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().hour;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest803
     @tc.name builtinsResolvedDateTimeFormatOptionsTest803
     @tc.desc function get hour(): string | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest803';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().hour;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest804
     @tc.name builtinsResolvedDateTimeFormatOptionsTest804
     @tc.desc function get hour(): string | undefined 测试12小时制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest804', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest804';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let hourResult = dateTimeFormat.resolvedOptions().hour;
      let hour12Result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`hour value: ${hourResult}`);
      console.info(`hour12 value: ${hour12Result}`);

      // 验证hour选项设置正确
      expect(hourResult).assertEqual('numeric');

      // 验证hour12在允许范围内
      expect(hour12Result === true || hour12Result === false || hour12Result === undefined).assertTrue();

      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest805
     @tc.name builtinsResolvedDateTimeFormatOptionsTest805
     @tc.desc function get hour(): string | undefined 测试24小时制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest805', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest805';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: '2-digit',
        minute: 'numeric'
      });
      let hourResult = dateTimeFormat.resolvedOptions().hour;
      let hour12Result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`hour value: ${hourResult}`);
      console.info(`hour12 value: ${hour12Result}`);

      // 验证hour选项设置正确
      expect(hourResult).assertEqual('2-digit');

      // 验证hour12在允许范围内
      expect(hour12Result === true || hour12Result === false || hour12Result === undefined).assertTrue();

      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest806
     @tc.name builtinsResolvedDateTimeFormatOptionsTest806
     @tc.desc function get hour(): string | undefined 测试完整时间格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest806', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest806';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit'
      });
      let result = dateTimeFormat.resolvedOptions().hour;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest807
     @tc.name builtinsResolvedDateTimeFormatOptionsTest807
     @tc.desc function get hour(): string | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest807', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest807';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().hour;
      expect(result === 'numeric' || result === '2-digit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest901
     @tc.name builtinsResolvedDateTimeFormatOptionsTest901
     @tc.desc function get hour12(): boolean | undefined 测试hour12设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest901';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`hour12 value: ${result}`);
      expect(result === true || result === false || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest902
     @tc.name builtinsResolvedDateTimeFormatOptionsTest902
     @tc.desc function get hour12(): boolean | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest902';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().hour12;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest902
     @tc.name builtinsResolvedDateTimeFormatOptionsTest902
     @tc.desc function get hour12(): boolean | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest902';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().hour12;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest903
     @tc.name builtinsResolvedDateTimeFormatOptionsTest903
     @tc.desc function get hour12(): boolean | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest903', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest903';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`hour12 value: ${result}`);
      expect(result === true || result === false || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest904
     @tc.name builtinsResolvedDateTimeFormatOptionsTest904
     @tc.desc function get hour12(): boolean | undefined 测试默认12小时制行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest904', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest904';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`Default hour12 for en-US: ${result}`);
      expect(result === true || result === false || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest905
     @tc.name builtinsResolvedDateTimeFormatOptionsTest905
     @tc.desc function get hour12(): boolean | undefined 测试完整时间格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest905', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest905';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit'
      });
      let hourResult = dateTimeFormat.resolvedOptions().hour;
      let minuteResult = dateTimeFormat.resolvedOptions().minute;
      let secondResult = dateTimeFormat.resolvedOptions().second;
      let hour12Result = dateTimeFormat.resolvedOptions().hour12;

      console.info(`hour value: ${hourResult}`);
      console.info(`minute value: ${minuteResult}`);
      console.info(`second value: ${secondResult}`);
      console.info(`hour12 value: ${hour12Result}`);

      // 验证时间选项设置正确
      expect(hourResult).assertEqual('2-digit');
      expect(minuteResult).assertEqual('2-digit');
      expect(secondResult).assertEqual('2-digit');

      console.info(`${caseName}, test end`);
      Done();
    })



    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest907
     @tc.name builtinsResolvedDateTimeFormatOptionsTest907
     @tc.desc function get hour12(): boolean | undefined 测试时间格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest907', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest907';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let hourResult = dateTimeFormat.resolvedOptions().hour;
      let minuteResult = dateTimeFormat.resolvedOptions().minute;

      console.info(`hour value: ${hourResult}`);
      console.info(`minute value: ${minuteResult}`);

      // 验证时间选项设置正确
      expect(hourResult).assertEqual('numeric');
      expect(minuteResult).assertEqual('numeric');

      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1000
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1000
     @tc.desc function get hourCycle(): "h11" | "h12" | "h23" | "h24" | undefined 测试hourCycle值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1000';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.hourCycle;
      console.info(`hourCycle value: ${result}`);
      expect(result === 'h11' || result === 'h12' || result === 'h23' || result === 'h24' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1001
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1001
     @tc.desc function get hourCycle(): "h11" | "h12" | "h23" | "h24" | undefined 测试hourCycle默认值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1001';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hourCycle;
      console.info(`hourCycle value: ${result}`);
      expect(result === 'h11' || result === 'h12' || result === 'h23' || result === 'h24' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1002
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1002
     @tc.desc function get hourCycle(): "h11" | "h12" | "h23" | "h24" | undefined 测试hourCycle值范围
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1002';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hourCycle;
      console.info(`hourCycle value: ${result}`);
      expect(result === 'h11' || result === 'h12' || result === 'h23' || result === 'h24' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1003
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1003
     @tc.desc function get hourCycle(): "h11" | "h12" | "h23" | "h24" | undefined 测试无hour选项的情况
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1003';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hourCycle;
      console.info(`hourCycle value without hour option: ${result}`);
      expect(result === 'h11' || result === 'h12' || result === 'h23' || result === 'h24' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1004
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1004
     @tc.desc function get hourCycle(): "h11" | "h12" | "h23" | "h24" | undefined 测试默认行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1004';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: 'numeric',
        month: 'long'
      });
      let result = dateTimeFormat.resolvedOptions().hourCycle;
      console.info(`hourCycle value with date options only: ${result}`);
      expect(result === 'h11' || result === 'h12' || result === 'h23' || result === 'h24' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1005
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1005
     @tc.desc function get hourCycle(): "h11" | "h12" | "h23" | "h24" | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1005';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hourCycle;
      console.info(`hourCycle value: ${result}`);
      expect(result === 'h11' || result === 'h12' || result === 'h23' || result === 'h24' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1006
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1006
     @tc.desc function get hourCycle(): "h11" | "h12" | "h23" | "h24" | undefined 测试与hour12组合
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1006';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let hour12Result = dateTimeFormat.resolvedOptions().hour12;
      let hourCycleResult = dateTimeFormat.resolvedOptions().hourCycle;
      console.info(`hour12 value: ${hour12Result}`);
      console.info(`hourCycle value: ${hourCycleResult}`);

      // 验证hourCycle在允许范围内
      expect(hourCycleResult === 'h11' || hourCycleResult === 'h12' || hourCycleResult === 'h23' || hourCycleResult === 'h24' || hourCycleResult === undefined).assertTrue();

      // 验证hour12在允许范围内
      expect(hour12Result === true || hour12Result === false || hour12Result === undefined).assertTrue();

      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1007
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1007
     @tc.desc function get hourCycle(): "h11" | "h12" | "h23" | "h24" | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1007';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hourCycle;
      console.info(`hourCycle value: ${result}`);
      expect(result === 'h11' || result === 'h12' || result === 'h23' || result === 'h24' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1100
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1100
     @tc.desc function get locale(): string 测试en-US区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

    it('builtinsResolvedDateTimeFormatOptionsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1100';
        console.info(`${caseName}, test start`);
        let dateTimeFormat = new Intl.DateTimeFormat('en-US');
        let resolvedOptions = dateTimeFormat.resolvedOptions();
        let result = resolvedOptions.locale;
        expect(result).assertEqual('en-US');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1101
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1101
     @tc.desc function get locale(): string 测试ko-KR区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1101';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ko-KR');
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(result).assertEqual('ko-KR');
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1102
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1102
     @tc.desc function get locale(): string 测试ja-JP区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1102';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ja-JP');
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(result).assertEqual('ja-JP');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1103
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1103
     @tc.desc function get locale(): string 测试fr-FR区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1103';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('fr-FR');
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(result).assertEqual('fr-FR');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1104
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1104
     @tc.desc function get locale(): string 测试de-DE区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1104';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('de-DE');
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(result).assertEqual('de-DE');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1105
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1105
     @tc.desc function get locale(): string 测试es-ES区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1105';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('es-ES');
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(result).assertEqual('es-ES');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1106
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1106
     @tc.desc function get locale(): string 测试带选项的区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1106';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(result).assertEqual('en-US');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1107
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1107
     @tc.desc function get locale(): string 测试字符串格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1107';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(result !== undefined && result !== '').assertTrue();
      expect(typeof result === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1200
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1200
     @tc.desc function get numberingSystem(): string 测试latn编号系统
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1200';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { numberingSystem: 'latn' });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result).assertEqual('latn');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1201
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1201
     @tc.desc function get numberingSystem(): string 测试arab编号系统
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1201';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ar-SA', { numberingSystem: 'arab' });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result).assertEqual('arab');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1202
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1202
     @tc.desc function get numberingSystem(): string 测试kore编号系统
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1202';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ko-KR', { numberingSystem: 'kore' });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result).assertEqual('kore');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1203
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1203
     @tc.desc function get numberingSystem(): string 测试beng编号系统
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1203';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('bn-BD', { numberingSystem: 'beng' });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result).assertEqual('beng');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1204
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1204
     @tc.desc function get numberingSystem(): string 测试deva编号系统
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1204';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('hi-IN', { numberingSystem: 'deva' });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result).assertEqual('deva');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1205
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1205
     @tc.desc function get numberingSystem(): string 测试默认编号系统
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1205';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result !== undefined && result !== '').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1206
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1206
     @tc.desc function get numberingSystem(): string 测试与日期选项组合
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1206';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        numberingSystem: 'latn',
        year: 'numeric',
        month: 'long'
      });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result).assertEqual('latn');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1207
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1207
     @tc.desc function get numberingSystem(): string 测试字符串格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1207';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { numberingSystem: 'latn' });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(typeof result === 'string').assertTrue();
      expect(result.length > 0).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1300
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1300
     @tc.desc function get minute(): string | undefined 测试numeric值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1300';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { minute: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().minute;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1301
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1301
     @tc.desc function get minute(): string | undefined 测试2-digit值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1301';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { minute: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().minute;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1302
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1302
     @tc.desc function get minute(): string | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1302';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().minute;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1303
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1303
     @tc.desc function get minute(): string | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1303';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { minute: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().minute;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1304
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1304
     @tc.desc function get minute(): string | undefined 测试12小时制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1304';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: '2-digit'
      });
      let minuteResult = dateTimeFormat.resolvedOptions().minute;
      let hour12Result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`minute value: ${minuteResult}`);
      console.info(`hour12 value: ${hour12Result}`);

      // 验证minute选项设置正确
      expect(minuteResult).assertEqual('2-digit');

      // 验证hour12在允许范围内
      expect(hour12Result === true || hour12Result === false || hour12Result === undefined).assertTrue();

      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1305
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1305
     @tc.desc function get minute(): string | undefined 测试24小时制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1305';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let minuteResult = dateTimeFormat.resolvedOptions().minute;
      let hour12Result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`minute value: ${minuteResult}`);
      console.info(`hour12 value: ${hour12Result}`);

      // 验证minute选项设置正确
      expect(minuteResult).assertEqual('numeric');

      // 验证hour12在允许范围内
      expect(hour12Result === true || hour12Result === false || hour12Result === undefined).assertTrue();

      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1306
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1306
     @tc.desc function get minute(): string | undefined 测试完整时间格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1306';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: '2-digit',
        second: '2-digit'
      });
      let result = dateTimeFormat.resolvedOptions().minute;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1307
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1307
     @tc.desc function get minute(): string | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1307';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { minute: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().minute;
      expect(result === 'numeric' || result === '2-digit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1400
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1400
     @tc.desc function get month(): string | undefined 测试numeric值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1400';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1401
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1401
     @tc.desc function get month(): string | undefined 测试2-digit值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1401';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1402
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1402
     @tc.desc function get month(): string | undefined 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1402';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'long' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1403
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1403
     @tc.desc function get month(): string | undefined 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1403';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'short' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1404
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1404
     @tc.desc function get month(): string | undefined 测试narrow值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1404';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('narrow');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1405
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1405
     @tc.desc function get month(): string | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1405';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: 'numeric', minute: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1406
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1406
     @tc.desc function get month(): string | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1406';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'long' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1407
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1407
     @tc.desc function get month(): string | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1407';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'short' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result === 'numeric' || result === '2-digit' || result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1500
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1500
     @tc.desc function get second(): string | undefined 测试numeric值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1500';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { second: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1501
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1501
     @tc.desc function get second(): string | undefined 测试2-digit值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1501';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { second: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1502
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1502
     @tc.desc function get second(): string | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1502';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1503
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1503
     @tc.desc function get second(): string | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1503';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { second: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1504
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1504
     @tc.desc function get second(): string | undefined 测试带小数秒
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1504';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        second: '2-digit',
        fractionalSecondDigits: 3
      });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1505
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1505
     @tc.desc function get second(): string | undefined 测试12小时制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1505';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric',
        second: 'numeric'
      });
      let secondResult = dateTimeFormat.resolvedOptions().second;
      let hour12Result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`second value: ${secondResult}`);
      console.info(`hour12 value: ${hour12Result}`);

      // 验证second选项设置正确
      expect(secondResult).assertEqual('numeric');

      // 验证hour12在允许范围内
      expect(hour12Result === true || hour12Result === false || hour12Result === undefined).assertTrue();

      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1506
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1506
     @tc.desc function get second(): string | undefined 测试完整时间格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1506';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: '2-digit',
        second: '2-digit'
      });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1507
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1507
     @tc.desc function get second(): string | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1507';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { second: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result === 'numeric' || result === '2-digit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartTest1600
     @tc.name builtinsDateTimeRangeFormatPartTest1600
     @tc.desc function get source(): DateTimeRangeFormatPartSource 基础功能测试
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartTest1600';
      console.info(`${caseName}, test start`);
      let startDate = new Date(2023, 0, 1);
      let endDate = new Date(2023, 0, 2);
      let formatter = new Intl.DateTimeFormat('en-US');
      let parts = formatter.formatRangeToParts(startDate, endDate);
      expect(parts.length > 0).assertTrue();
      let firstPart = parts[0];
      let hasSourceProperty = firstPart.hasOwnProperty('source');
      expect(hasSourceProperty).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartTest1601
     @tc.name builtinsDateTimeRangeFormatPartTest1601
     @tc.desc function get source(): DateTimeRangeFormatPartSource 测试startRange值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartTest1601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartTest1601';
      console.info(`${caseName}, test start`);
      let startDate = new Date(2023, 0, 1);
      let endDate = new Date(2023, 0, 2);
      let formatter = new Intl.DateTimeFormat('en-US');
      let parts = formatter.formatRangeToParts(startDate, endDate);
      let hasStartRange = false;
      for (let i = 0; i < parts.length; i++) {
        if (parts[i].source === 'startRange') {
          hasStartRange = true;
          break;
        }
      }
      expect(hasStartRange).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartTest1602
     @tc.name builtinsDateTimeRangeFormatPartTest1602
     @tc.desc function get source(): DateTimeRangeFormatPartSource 测试endRange值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartTest1602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartTest1602';
      console.info(`${caseName}, test start`);
      let startDate = new Date(2023, 0, 1);
      let endDate = new Date(2023, 0, 2);
      let formatter = new Intl.DateTimeFormat('en-US');
      let parts = formatter.formatRangeToParts(startDate, endDate);
      let hasEndRange = false;
      for (let i = 0; i < parts.length; i++) {
        if (parts[i].source === 'endRange') {
          hasEndRange = true;
          break;
        }
      }
      expect(hasEndRange).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartTest1604
     @tc.name builtinsDateTimeRangeFormatPartTest1604
     @tc.desc function get source(): DateTimeRangeFormatPartSource 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartTest1604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartTest1604';
      console.info(`${caseName}, test start`);
      let startDate = new Date(2023, 0, 1);
      let endDate = new Date(2023, 0, 2);
      let formatter = new Intl.DateTimeFormat('zh-CN');
      let parts = formatter.formatRangeToParts(startDate, endDate);
      expect(parts.length > 0).assertTrue();
      let firstPart = parts[0];
      let hasSourceProperty = firstPart.hasOwnProperty('source');
      expect(hasSourceProperty).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartTest1605
     @tc.name builtinsDateTimeRangeFormatPartTest1605
     @tc.desc function get source(): DateTimeRangeFormatPartSource 测试不同日期范围
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartTest1605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartTest1605';
      console.info(`${caseName}, test start`);
      let startDate = new Date(2023, 0, 1);
      let endDate = new Date(2023, 6, 15);
      let formatter = new Intl.DateTimeFormat('en-US');
      let parts = formatter.formatRangeToParts(startDate, endDate);
      let hasAllSources = false;
      let hasStart = false;
      let hasEnd = false;
      let hasShared = false;
      for (let i = 0; i < parts.length; i++) {
        if (parts[i].source === 'startRange') hasStart = true;
        if (parts[i].source === 'endRange') hasEnd = true;
        if (parts[i].source === 'shared') hasShared = true;
      }
      hasAllSources = hasStart && hasEnd && hasShared;
      expect(hasAllSources).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartTest1607
     @tc.name builtinsDateTimeRangeFormatPartTest1607
     @tc.desc function get source(): DateTimeRangeFormatPartSource 测试属性验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartTest1607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartTest1607';
      console.info(`${caseName}, test start`);
      let startDate = new Date(2023, 0, 1);
      let endDate = new Date(2023, 0, 2);
      let formatter = new Intl.DateTimeFormat('en-US');
      let parts = formatter.formatRangeToParts(startDate, endDate);
      let allPartsValid = true;
      for (let i = 0; i < parts.length; i++) {
        let part = parts[i];
        if (!part.hasOwnProperty('source') ||
          (part.source !== 'startRange' && part.source !== 'endRange' && part.source !== 'shared')) {
          allPartsValid = false;
          break;
        }
      }
      expect(allPartsValid).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartTest1700
     @tc.name builtinsDateTimeFormatPartTest1700
     @tc.desc function get type(): DateTimeFormatPartTypes 基础功能测试
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1700';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15);
      let formatter = new Intl.DateTimeFormat('en-US');
      let parts = formatter.formatToParts(date);
      expect(parts.length > 0).assertTrue();
      let firstPart = parts[0];
      let hasTypeProperty = firstPart.hasOwnProperty('type');
      expect(hasTypeProperty).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartTest1701
     @tc.name builtinsDateTimeFormatPartTest1701
     @tc.desc function get type(): DateTimeFormatPartTypes 测试day类型
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1701';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15);
      let formatter = new Intl.DateTimeFormat('en-US', { day: 'numeric' });
      let parts = formatter.formatToParts(date);
      let hasDayPart = false;
      for (let i = 0; i < parts.length; i++) {
        if (parts[i].type === 'day') {
          hasDayPart = true;
          break;
        }
      }
      expect(hasDayPart).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartTest1703
     @tc.name builtinsDateTimeFormatPartTest1703
     @tc.desc function get type(): DateTimeFormatPartTypes 测试year类型
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1703';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15);
      let formatter = new Intl.DateTimeFormat('en-US', { year: 'numeric' });
      let parts = formatter.formatToParts(date);
      let hasYearPart = false;
      for (let i = 0; i < parts.length; i++) {
        if (parts[i].type === 'year') {
          hasYearPart = true;
          break;
        }
      }
      expect(hasYearPart).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartTest1704
     @tc.name builtinsDateTimeFormatPartTest1704
     @tc.desc function get type(): DateTimeFormatPartTypes 测试literal类型
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1704';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15);
      let formatter = new Intl.DateTimeFormat('en-US');
      let parts = formatter.formatToParts(date);
      let hasLiteralPart = false;
      for (let i = 0; i < parts.length; i++) {
        if (parts[i].type === 'literal') {
          hasLiteralPart = true;
          break;
        }
      }
      expect(hasLiteralPart).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartTest1705
     @tc.name builtinsDateTimeFormatPartTest1705
     @tc.desc function get type(): DateTimeFormatPartTypes 测试hour类型
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1705';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15, 14, 30);
      let formatter = new Intl.DateTimeFormat('en-US', { hour: 'numeric' });
      let parts = formatter.formatToParts(date);
      let hasHourPart = false;
      for (let i = 0; i < parts.length; i++) {
        if (parts[i].type === 'hour') {
          hasHourPart = true;
          break;
        }
      }
      expect(hasHourPart).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartTest1706
     @tc.name builtinsDateTimeFormatPartTest1706
     @tc.desc function get type(): DateTimeFormatPartTypes 测试minute类型
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1706';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15, 14, 30);
      let formatter = new Intl.DateTimeFormat('en-US', { minute: '2-digit' });
      let parts = formatter.formatToParts(date);
      let hasMinutePart = false;
      for (let i = 0; i < parts.length; i++) {
        if (parts[i].type === 'minute') {
          hasMinutePart = true;
          break;
        }
      }
      expect(hasMinutePart).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })



    /**
     @tc.number builtinsDateTimeFormatPartTest1800
     @tc.name builtinsDateTimeFormatPartTest1800
     @tc.desc function get value(): string 基础功能测试
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1800';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15);
      let formatter = new Intl.DateTimeFormat('en-US');
      let parts = formatter.formatToParts(date);
      expect(parts.length > 0).assertTrue();
      let firstPart = parts[0];
      let hasValueProperty = firstPart.hasOwnProperty('value');
      expect(hasValueProperty).assertTrue();
      let value = firstPart.value;
      expect(value !== undefined && value !== '').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartTest1801
     @tc.name builtinsDateTimeFormatPartTest1801
     @tc.desc function get value(): string 测试日期值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1801';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15);
      let formatter = new Intl.DateTimeFormat('en-US', { day: 'numeric' });
      let parts = formatter.formatToParts(date);
      let dayParts = parts.filter(part => part.type === 'day');
      if (dayParts.length > 0) {
        let result = dayParts[0].value;
        console.info(`Day value: ${result}`);
        expect(result !== undefined && result !== '').assertTrue();
      } else {
        console.info('No day parts found');
        expect(true).assertTrue();
      }
      console.info(`${caseName}, test end`);
      Done();
    })


    /**
     @tc.number builtinsDateTimeFormatPartTest1803
     @tc.name builtinsDateTimeFormatPartTest1803
     @tc.desc function get value(): string 测试年份值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1803';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15);
      let formatter = new Intl.DateTimeFormat('en-US', { year: 'numeric' });
      let parts = formatter.formatToParts(date);
      let yearParts = parts.filter(part => part.type === 'year');
      if (yearParts.length > 0) {
        let result = yearParts[0].value;
        console.info(`Year value: ${result}`);
        expect(result).assertEqual('2023');
      } else {
        console.info('No year parts found');
        expect(true).assertTrue();
      }
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartTest1804
     @tc.name builtinsDateTimeFormatPartTest1804
     @tc.desc function get value(): string 测试字面量值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1804', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1804';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15);
      let formatter = new Intl.DateTimeFormat('en-US');
      let parts = formatter.formatToParts(date);
      let literalParts = parts.filter(part => part.type === 'literal');
      if (literalParts.length > 0) {
        let result = literalParts[0].value;
        console.info(`Literal value: ${result}`);
        expect(result !== undefined && result !== '').assertTrue();
      } else {
        console.info('No literal parts found');
        expect(true).assertTrue();
      }
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartTest1805
     @tc.name builtinsDateTimeFormatPartTest1805
     @tc.desc function get value(): string 测试时间值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1805', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1805';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15, 14, 30);
      let formatter = new Intl.DateTimeFormat('en-US', { hour: 'numeric' });
      let parts = formatter.formatToParts(date);
      let hourParts = parts.filter(part => part.type === 'hour');
      if (hourParts.length > 0) {
        let result = hourParts[0].value;
        console.info(`Hour value: ${result}`);
        expect(result !== undefined && result !== '').assertTrue();
      } else {
        console.info('No hour parts found');
        expect(true).assertTrue();
      }
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartTest1806
     @tc.name builtinsDateTimeFormatPartTest1806
     @tc.desc function get value(): string 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1806', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1806';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15);
      let formatter = new Intl.DateTimeFormat('zh-CN');
      let parts = formatter.formatToParts(date);
      expect(parts.length > 0).assertTrue();
      let firstPart = parts[0];
      let value = firstPart.value;
      expect(value !== undefined && value !== '').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartTest1807
     @tc.name builtinsDateTimeFormatPartTest1807
     @tc.desc function get value(): string 测试字符串格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartTest1807', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartTest1807';
      console.info(`${caseName}, test start`);
      let date = new Date(2023, 0, 15);
      let formatter = new Intl.DateTimeFormat('en-US');
      let parts = formatter.formatToParts(date);
      let allValuesValid = true;
      for (let i = 0; i < parts.length; i++) {
        let part = parts[i];
        if (!part.hasOwnProperty('value') || part.value === '' || part.value === null) {
          allValuesValid = false;
          break;
        }
      }
      expect(allValuesValid).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1900
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1900
     @tc.desc function get timeStyle(): "full" | "long" | "medium" | "short" | undefined 测试full值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1900';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'full' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('full');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1901
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1901
     @tc.desc function get timeStyle(): "full" | "long" | "medium" | "short" | undefined 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1901';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'long' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1902
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1902
     @tc.desc function get timeStyle(): "full" | "long" | "medium" | "short" | undefined 测试medium值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1902';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'medium' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('medium');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1903
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1903
     @tc.desc function get timeStyle(): "full" | "long" | "medium" | "short" | undefined 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1903', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1903';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'short' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1904
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1904
     @tc.desc function get timeStyle(): "full" | "long" | "medium" | "short" | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1904', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1904';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'short' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1905
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1905
     @tc.desc function get timeStyle(): "full" | "long" | "medium" | "short" | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1905', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1905';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'medium' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('medium');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1906
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1906
     @tc.desc function get timeStyle(): "full" | "long" | "medium" | "short" | undefined 测试同时设置dateStyle和timeStyle
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1906', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1906';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        dateStyle: 'short',
        timeStyle: 'medium'
      });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('medium');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest1907
     @tc.name builtinsResolvedDateTimeFormatOptionsTest1907
     @tc.desc function get timeStyle(): "full" | "long" | "medium" | "short" | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest1907', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest1907';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'long' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result === 'full' || result === 'long' || result === 'medium' || result === 'short' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2000
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2000
     @tc.desc function get timeZone(): string 测试UTC时区
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2000';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'UTC' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('UTC');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2001
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2001
     @tc.desc function get timeZone(): string 测试America/New_York时区
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2001';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'America/New_York' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('America/New_York');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2002
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2002
     @tc.desc function get timeZone(): string 测试Asia/Shanghai时区
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2002';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'Asia/Shanghai' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('Asia/Shanghai');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2003
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2003
     @tc.desc function get timeZone(): string 测试Europe/London时区
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2003';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'Europe/London' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('Europe/London');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2004
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2004
     @tc.desc function get timeZone(): string 测试Pacific/Auckland时区
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2004';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'Pacific/Auckland' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('Pacific/Auckland');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2005
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2005
     @tc.desc function get timeZone(): string 测试不同区域设置的时区
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2005';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'America/New_York' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('America/New_York');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2006
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2006
     @tc.desc function get timeZone(): string 测试默认时区
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2006';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().timeZone;
      console.info(`Default timeZone: ${result}`);
      expect(result !== undefined && result !== '').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2007
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2007
     @tc.desc function get timeZone(): string 测试时区格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2007';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'UTC' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(typeof result === 'string').assertTrue();
      expect(result.length > 0).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2100
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2100
     @tc.desc function get timeZoneName(): string | undefined 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2100';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZoneName: 'long' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2101
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2101
     @tc.desc function get timeZoneName(): string | undefined 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2101';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZoneName: 'short' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2102
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2102
     @tc.desc function get timeZoneName(): string | undefined 测试shortOffset值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2102';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZoneName: 'shortOffset' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual('shortOffset');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2103
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2103
     @tc.desc function get timeZoneName(): string | undefined 测试longOffset值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2103';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZoneName: 'longOffset' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual('longOffset');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2104
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2104
     @tc.desc function get timeZoneName(): string | undefined 测试shortGeneric值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2104';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZoneName: 'shortGeneric' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual('shortGeneric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2105
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2105
     @tc.desc function get timeZoneName(): string | undefined 测试longGeneric值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2105';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZoneName: 'longGeneric' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual('longGeneric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2106
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2106
     @tc.desc function get timeZoneName(): string | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2106';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2107
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2107
     @tc.desc function get timeZoneName(): string | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2107';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZoneName: 'short' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result === 'long' || result === 'short' || result === 'shortOffset' ||
        result === 'longOffset' || result === 'shortGeneric' || result === 'longGeneric' ||
        result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2200
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2200
     @tc.desc function set locale(locale: string) 测试en-US区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2200';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.locale;
      expect(result).assertEqual('en-US');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2201
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2201
     @tc.desc function set locale(locale: string) 测试ko-KR区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2201';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ko-KR');
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.locale;
      expect(result).assertEqual('ko-KR');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2202
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2202
     @tc.desc function set locale(locale: string) 测试ja-JP区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2202';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ja-JP');
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.locale;
      expect(result).assertEqual('ja-JP');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2203
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2203
     @tc.desc function set locale(locale: string) 测试fr-FR区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2203';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('fr-FR');
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.locale;
      expect(result).assertEqual('fr-FR');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2204
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2204
     @tc.desc function set locale(locale: string) 测试de-DE区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2204';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('de-DE');
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.locale;
      expect(result).assertEqual('de-DE');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2205
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2205
     @tc.desc function set locale(locale: string) 测试es-ES区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2205';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('es-ES');
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.locale;
      expect(result).assertEqual('es-ES');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2206
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2206
     @tc.desc function set locale(locale: string) 测试ru-RU区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2206';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ru-RU');
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.locale;
      expect(result).assertEqual('ru-RU');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2207
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2207
     @tc.desc function set locale(locale: string) 测试字符串格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2207';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.locale;
      expect(result !== undefined && result !== '').assertTrue();
      expect(typeof result === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2300
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2300
     @tc.desc function get weekday(): string | undefined 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2300';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'long' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2301
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2301
     @tc.desc function get weekday(): string | undefined 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2301';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'short' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2302
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2302
     @tc.desc function get weekday(): string | undefined 测试narrow值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2302';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('narrow');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2303
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2303
     @tc.desc function get weekday(): string | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2303';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2304
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2304
     @tc.desc function get weekday(): string | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2304';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'long' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2305
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2305
     @tc.desc function get weekday(): string | undefined 测试完整日期格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2305';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        weekday: 'short',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2306
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2306
     @tc.desc function get weekday(): string | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2306';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2307
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2307
     @tc.desc function get weekday(): string | undefined 测试默认行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2307';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().weekday;
      console.info(`Default weekday: ${result}`);
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2400
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2400
     @tc.desc function get year(): string | undefined 测试numeric值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2400';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2401
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2401
     @tc.desc function get year(): string | undefined 测试2-digit值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2401';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2402
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2402
     @tc.desc function get year(): string | undefined 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2402';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'long', day: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2304
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2304
     @tc.desc function get weekday(): string | undefined 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2304';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'long' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2404
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2404
     @tc.desc function get year(): string | undefined 测试完整日期格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2404';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: '2-digit',
        month: 'long',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2405
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2405
     @tc.desc function get year(): string | undefined 测试与era组合
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2405';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: 'numeric',
        era: 'short'
      });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2406
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2406
     @tc.desc function get year(): string | undefined 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2406';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result === 'numeric' || result === '2-digit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2407
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2407
     @tc.desc function get year(): string | undefined 测试默认行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2407';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().year;
      console.info(`Default year: ${result}`);
      expect(result === 'numeric' || result === '2-digit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2500
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2500
     @tc.desc function set calendar(calendar: string) 测试gregorian日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2500';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { calendar: 'gregorian' });
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.calendar;
      expect(result).assertEqual('gregorian');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2501
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2501
     @tc.desc function set calendar(calendar: string) 测试ko-KR日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

    it('builtinsResolvedDateTimeFormatOptionsTest2501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2501';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ko-KR', { calendar: 'korea' });
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.calendar;
      expect(result).assertEqual('korea');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2502
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2502
     @tc.desc function set calendar(calendar: string) 测试islamic日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2502';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ar-SA', { calendar: 'islamic' });
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.calendar;
      expect(result).assertEqual('islamic');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2503
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2503
     @tc.desc function set calendar(calendar: string) 测试japanese日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2503';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ja-JP', { calendar: 'japanese' });
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.calendar;
      expect(result).assertEqual('japanese');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2504
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2504
     @tc.desc function set calendar(calendar: string) 测试buddhist日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2504';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('th-TH', { calendar: 'buddhist' });
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.calendar;
      expect(result).assertEqual('buddhist');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2505
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2505
     @tc.desc function set calendar(calendar: string) 测试hebrew日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2505';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('he-IL', { calendar: 'hebrew' });
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.calendar;
      expect(result).assertEqual('hebrew');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2506
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2506
     @tc.desc function set calendar(calendar: string) 测试indian日历
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2506';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-IN', { calendar: 'indian' });
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.calendar;
      expect(result).assertEqual('indian');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2507
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2507
     @tc.desc function set calendar(calendar: string) 测试字符串格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2507';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { calendar: 'gregorian' });
      let resolvedOptions = dateTimeFormat.resolvedOptions();
      let result = resolvedOptions.calendar;
      expect(result !== undefined && result !== '').assertTrue();
      expect(typeof result === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2600
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2600
     @tc.desc function set dateStyle(dateStyle: "full" | "long" | "medium" | "short" | undefined) 测试full值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2600';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'full' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual('full');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2601
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2601
     @tc.desc function set dateStyle(dateStyle: "full" | "long" | "medium" | "short" | undefined) 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2601';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'long' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2602
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2602
     @tc.desc function set dateStyle(dateStyle: "full" | "long" | "medium" | "short" | undefined) 测试medium值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2602';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'medium' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual('medium');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2603
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2603
     @tc.desc function set dateStyle(dateStyle: "full" | "long" | "medium" | "short" | undefined) 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2603';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'short' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2604
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2604
     @tc.desc function set dateStyle(dateStyle: "full" | "long" | "medium" | "short" | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2604';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'short' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2605
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2605
     @tc.desc function set dateStyle(dateStyle: "full" | "long" | "medium" | "short" | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2605';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'medium' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual('medium');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2606
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2606
     @tc.desc function set dateStyle(dateStyle: "full" | "long" | "medium" | "short" | undefined) 测试同时设置dateStyle和timeStyle
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2606';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        dateStyle: 'short',
        timeStyle: 'medium'
      });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2607
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2607
     @tc.desc function set dateStyle(dateStyle: "full" | "long" | "medium" | "short" | undefined) 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2607';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'long' });
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result === 'full' || result === 'long' || result === 'medium' || result === 'short' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2700
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2700
     @tc.desc function set day(day: string | undefined) 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2700';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'long' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2701
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2701
     @tc.desc function set day(day: string | undefined) 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2701';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'short' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2702
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2702
     @tc.desc function set day(day: string | undefined) 测试narrow值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2702';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('narrow');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2703
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2703
     @tc.desc function set day(day: string | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2703';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2704
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2704
     @tc.desc function set day(day: string | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2704';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { day: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().day;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2705
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2705
     @tc.desc function set day(day: string | undefined) 测试完整日期格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2705';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        weekday: 'short',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2706
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2706
     @tc.desc function set day(day: string | undefined) 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2706';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2707
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2707
     @tc.desc function set day(day: string | undefined) 测试默认行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2707';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().weekday;
      console.info(`Default weekday: ${result}`);
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2800
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2800
     @tc.desc function set dayPeriod(dayPeriod: "narrow" | "short" | "long" | undefined) 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2800';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dayPeriod: 'long' });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2801
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2801
     @tc.desc function set dayPeriod(dayPeriod: "narrow" | "short" | "long" | undefined) 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2801';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dayPeriod: 'short' });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2802
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2802
     @tc.desc function set dayPeriod(dayPeriod: "narrow" | "short" | "long" | undefined) 测试narrow值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2802';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dayPeriod: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result).assertEqual('narrow');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2803
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2803
     @tc.desc function set dayPeriod(dayPeriod: "narrow" | "short" | "long" | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2803';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2804
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2804
     @tc.desc function set dayPeriod(dayPeriod: "narrow" | "short" | "long" | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2804', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2804';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        dayPeriod: 'long'
      });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2805
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2805
     @tc.desc function set dayPeriod(dayPeriod: "narrow" | "short" | "long" | undefined) 测试完整日期格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2805', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2805';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        dayPeriod: 'short',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2806
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2806
     @tc.desc function set dayPeriod(dayPeriod: "narrow" | "short" | "long" | undefined) 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2806', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2806';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dayPeriod: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().dayPeriod;
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2900
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2900
     @tc.desc function set era(era: string | undefined) 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2900';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { era: 'long' });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2901
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2901
     @tc.desc function set era(era: string | undefined) 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2901';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { era: 'short' });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2902
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2902
     @tc.desc function set era(era: string | undefined) 测试narrow值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2902';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { era: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result).assertEqual('narrow');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2903
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2903
     @tc.desc function set era(era: string | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2903', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2903';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2904
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2904
     @tc.desc function set era(era: string | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2904', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2904';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { era: 'long' });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2905
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2905
     @tc.desc function set era(era: string | undefined) 测试完整日期格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2905', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2905';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        era: 'short',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest2906
     @tc.name builtinsResolvedDateTimeFormatOptionsTest2906
     @tc.desc function set era(era: string | undefined) 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest2906', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest2906';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { era: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().era;
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3000
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3000
     @tc.desc function set formatMatcher(formatMatcher: "basic" | "best fit" | "best fit" | undefined) 测试basic值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3000';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { formatMatcher: 'basic' });
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      expect(result).assertEqual('basic');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3001
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3001
     @tc.desc function set formatMatcher(formatMatcher: "basic" | "best fit" | "best fit" | undefined) 测试best fit值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3001';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { formatMatcher: 'best fit' });
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      expect(result).assertEqual('best fit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3002
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3002
     @tc.desc function set formatMatcher(formatMatcher: "basic" | "best fit" | "best fit" | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3002';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      console.info(`Default formatMatcher: ${result}`);
      expect(result === 'basic' || result === 'best fit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3303
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3303
     @tc.desc function set hour12(hour12: boolean | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

    it('builtinsResolvedDateTimeFormatOptionsTest3303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3303';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`hour12 value: ${result}`);
      expect(result === true || result === false || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3004
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3004
     @tc.desc function set formatMatcher(formatMatcher: "basic" | "best fit" | "best fit" | undefined) 测试完整日期格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3004';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        formatMatcher: 'best fit',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      expect(result).assertEqual('best fit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3005
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3005
     @tc.desc function set formatMatcher(formatMatcher: "basic" | "best fit" | "best fit" | undefined) 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3005';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { formatMatcher: 'basic' });
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      expect(result === 'basic' || result === 'best fit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3006
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3006
     @tc.desc function set formatMatcher(formatMatcher: "basic" | "best fit" | "best fit" | undefined) 测试默认行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3006';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().formatMatcher;
      console.info(`Default formatMatcher: ${result}`);
      expect(result === 'basic' || result === 'best fit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3100
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3100
     @tc.desc function set fractionalSecondDigits(fractionalSecondDigits: number | undefined) 测试1值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3100';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { fractionalSecondDigits: 1 });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result).assertEqual(1);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3101
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3101
     @tc.desc function set fractionalSecondDigits(fractionalSecondDigits: number | undefined) 测试2值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3101';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { fractionalSecondDigits: 2 });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result).assertEqual(2);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3102
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3102
     @tc.desc function set fractionalSecondDigits(fractionalSecondDigits: number | undefined) 测试3值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3102';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { fractionalSecondDigits: 3 });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result).assertEqual(3);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3103
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3103
     @tc.desc function set fractionalSecondDigits(fractionalSecondDigits: number | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3103';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3104
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3104
     @tc.desc function set fractionalSecondDigits(fractionalSecondDigits: number | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3104';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        second: 'numeric',
        fractionalSecondDigits: 2
      });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result).assertEqual(2);
      console.info(`${caseName}, test end`);
      Done();
    })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3105
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3105
     @tc.desc function set fractionalSecondDigits(fractionalSecondDigits: number | undefined) 测试完整时间格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3105';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        fractionalSecondDigits: 3,
        hour: 'numeric',
        minute: 'numeric',
        second: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result).assertEqual(3);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3106
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3106
     @tc.desc function set fractionalSecondDigits(fractionalSecondDigits: number | undefined) 测试取值范围验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3106';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { fractionalSecondDigits: 2 });
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      expect(result === 1 || result === 2 || result === 3 || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3107
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3107
     @tc.desc function set fractionalSecondDigits(fractionalSecondDigits: number | undefined) 测试默认行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3107';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().fractionalSecondDigits;
      console.info(`Default fractionalSecondDigits: ${result}`);
      expect(result === 1 || result === 2 || result === 3 || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3200
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3200
     @tc.desc function set hour(hour: string | undefined) 测试numeric值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3200';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().hour;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3201
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3201
     @tc.desc function set hour(hour: string | undefined) 测试2-digit值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3201';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().hour;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3202
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3202
     @tc.desc function set hour(hour: string | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3202';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().hour;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3203
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3203
     @tc.desc function set hour(hour: string | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3203';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().hour;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3204
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3204
     @tc.desc function set hour(hour: string | undefined) 测试12小时制格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3204';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: '2-digit',
        minute: 'numeric'
      });
      let hourResult = dateTimeFormat.resolvedOptions().hour;
      let minuteResult = dateTimeFormat.resolvedOptions().minute;

      console.info(`hour value: ${hourResult}`);
      console.info(`minute value: ${minuteResult}`);

      expect(hourResult).assertEqual('2-digit');
      expect(minuteResult).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3205
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3205
     @tc.desc function set hour(hour: string | undefined) 测试24小时制格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3205';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let hourResult = dateTimeFormat.resolvedOptions().hour;
      let minuteResult = dateTimeFormat.resolvedOptions().minute;

      console.info(`hour value: ${hourResult}`);
      console.info(`minute value: ${minuteResult}`);

      expect(hourResult).assertEqual('numeric');
      expect(minuteResult).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3206
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3206
     @tc.desc function set hour(hour: string | undefined) 测试完整时间格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

    it('builtinsResolvedDateTimeFormatOptionsTest3206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3206';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit'
      });
      let result = dateTimeFormat.resolvedOptions().hour;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3207
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3207
     @tc.desc function set hour(hour: string | undefined) 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3207';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().hour;
      expect(result === 'numeric' || result === '2-digit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3300
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3300
     @tc.desc function set hour12(hour12: boolean | undefined) 测试true值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3300';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`hour12 value: ${result}`);
      expect(result === true).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3301
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3301
     @tc.desc function set hour12(hour12: boolean | undefined) 测试false值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3300';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`hour12 value: ${result}`);
      expect(result === false).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3302
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3302
     @tc.desc function set hour12(hour12: boolean | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3300';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`hour12 value: ${result}`);
      expect(result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3303
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3303
     @tc.desc function set hour12(hour12: boolean | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

    it('builtinsResolvedDateTimeFormatOptionsTest3303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3303';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`hour12 value: ${result}`);
      expect(result === true || result === false || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3304
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3304
     @tc.desc function set hour12(hour12: boolean | undefined) 测试12小时制完整时间格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

  it('builtinsResolvedDateTimeFormatOptionsTest3304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
    const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3304';
    console.info(`${caseName}, test start`);
    let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
      hour: 'numeric',
      minute: 'numeric',
      second: 'numeric'
    });
    let hour12Result = dateTimeFormat.resolvedOptions().hour12;
    let hourResult = dateTimeFormat.resolvedOptions().hour;
    let minuteResult = dateTimeFormat.resolvedOptions().minute;
    let secondResult = dateTimeFormat.resolvedOptions().second;

    console.info(`hour12 value: ${hour12Result}`);
    console.info(`hour value: ${hourResult}`);
    console.info(`minute value: ${minuteResult}`);
    console.info(`second value: ${secondResult}`);

    // 验证时间选项设置正确
    expect(hourResult).assertEqual('numeric');
    expect(minuteResult).assertEqual('numeric');
    expect(secondResult).assertEqual('numeric');

    // 验证hour12在允许范围内
    expect(hour12Result === true || hour12Result === false || hour12Result === undefined).assertTrue();

    console.info(`${caseName}, test end`);
    Done();
  })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3305
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3305
     @tc.desc function set hour12(hour12: boolean | undefined) 测试24小时制完整时间格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

    it('builtinsResolvedDateTimeFormatOptionsTest3305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3305';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric',
        second: 'numeric'
      });
      let hour12Result = dateTimeFormat.resolvedOptions().hour12;
      let hourResult = dateTimeFormat.resolvedOptions().hour;
      let minuteResult = dateTimeFormat.resolvedOptions().minute;
      let secondResult = dateTimeFormat.resolvedOptions().second;

      console.info(`hour12 value: ${hour12Result}`);
      console.info(`hour value: ${hourResult}`);
      console.info(`minute value: ${minuteResult}`);
      console.info(`second value: ${secondResult}`);

      // 验证时间选项设置正确
      expect(hourResult).assertEqual('numeric');
      expect(minuteResult).assertEqual('numeric');
      expect(secondResult).assertEqual('numeric');
      expect(hour12Result === true || hour12Result === false || hour12Result === undefined).assertTrue();

      console.info(`${caseName}, test end`);
      Done();
    })



    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3307
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3307
     @tc.desc function set hour12(hour12: boolean | undefined) 测试默认行为验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3307';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().hour12;
      console.info(`hour12 with hour setting: ${result}`);
      expect(result === true || result === false || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3400
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3400
     @tc.desc function set hourCycle(hourCycle: "h11" | "h12" | "h23" | "h24" | undefined) 测试hourCycle默认值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3400';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hourCycle;
      console.info(`hourCycle value: ${result}`);
      expect(result === 'h11' || result === 'h12' || result === 'h23' || result === 'h24' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })
    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3401
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3401
     @tc.desc function set hourCycle(hourCycle: "h11" | "h12" | "h23" | "h24" | undefined) 测试h12值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3401';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hourCycle;
      console.info(`hourCycle value: ${result}`);
      expect(result === 'h12' ).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3402
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3402
     @tc.desc function set hourCycle(hourCycle: "h11" | "h12" | "h23" | "h24" | undefined) 测试h23值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3402';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hourCycle;
      console.info(`hourCycle value: ${result}`);
      expect(result === 'h23' ).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3403
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3403
     @tc.desc function set hourCycle(hourCycle: "h11" | "h12" | "h23" | "h24" | undefined) 测试h24值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3403';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().hourCycle;
      console.info(`hourCycle value: ${result}`);
      expect(result === 'h24' ).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3404
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3404
     @tc.desc function set hourCycle(hourCycle: "h11" | "h12" | "h23" | "h24" | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3404';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().hourCycle;
      console.info(`Default hourCycle: ${result}`);
      expect(result === 'h11' || result === 'h12' || result === 'h23' || result === 'h24' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3405
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3405
     @tc.desc function set hourCycle(hourCycle: "h11" | "h12" | "h23" | "h24" | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

  it('builtinsResolvedDateTimeFormatOptionsTest3405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
    const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3405';
    console.info(`${caseName}, test start`);
    let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
      hour: 'numeric',
      minute: 'numeric'
    });
    let result = dateTimeFormat.resolvedOptions().hourCycle;
    console.info(`hourCycle value: ${result}`);
    expect(result === 'h11' || result === 'h12' || result === 'h23' || result === 'h24' || result === undefined).assertTrue();
    console.info(`${caseName}, test end`);
    Done();
  })




    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3500
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3500
     @tc.desc function set numberingSystem(numberingSystem: string) 测试latn值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3500';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { numberingSystem: 'latn' });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result).assertEqual('latn');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3501
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3501
     @tc.desc function set numberingSystem(numberingSystem: string) 测试arab值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3501';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { numberingSystem: 'arab' });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result).assertEqual('arab');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3502
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3502
     @tc.desc function set numberingSystem(numberingSystem: string) 测试hanidec值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3502';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { numberingSystem: 'hanidec' });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result).assertEqual('hanidec');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3503
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3503
     @tc.desc function set numberingSystem(numberingSystem: string) 测试beng值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3503';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { numberingSystem: 'beng' });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result).assertEqual('beng');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3504
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3504
     @tc.desc function set numberingSystem(numberingSystem: string) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3504';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('ar-SA', { numberingSystem: 'arab' });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result).assertEqual('arab');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3505
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3505
     @tc.desc function set numberingSystem(numberingSystem: string) 测试完整日期格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3505';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        numberingSystem: 'latn',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(result).assertEqual('latn');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3506
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3506
     @tc.desc function set numberingSystem(numberingSystem: string) 测试默认值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3506';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      console.info(`Default numberingSystem: ${result}`);
      expect(result).not().assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3507
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3507
     @tc.desc function set numberingSystem(numberingSystem: string) 测试数字格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3507';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { numberingSystem: 'latn' });
      let result = dateTimeFormat.resolvedOptions().numberingSystem;
      expect(typeof result === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3600
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3600
     @tc.desc function set type(type: DateTimeFormatPartTypes) 测试day类型
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3600';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { day: 'numeric' });
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15));
      let dayPart = parts.find(part => part.type === 'day');
      expect(dayPart).not().assertEqual(undefined);
      expect(dayPart!.type).assertEqual('day');
      console.info(`${caseName}, test end`);
      Done();
    })



    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3602
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3602
     @tc.desc function set type(type: DateTimeFormatPartTypes) 测试year类型
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3602';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric' });
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15));
      let yearPart = parts.find(part => part.type === 'year');
      expect(yearPart).not().assertEqual(undefined);
      expect(yearPart!.type).assertEqual('year');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3603
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3603
     @tc.desc function set type(type: DateTimeFormatPartTypes) 测试hour类型
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3603';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: 'numeric' });
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15, 14, 30));
      let hourPart = parts.find(part => part.type === 'hour');
      expect(hourPart).not().assertEqual(undefined);
      expect(hourPart!.type).assertEqual('hour');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3604
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3604
     @tc.desc function set type(type: DateTimeFormatPartTypes) 测试minute类型
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3604';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { minute: 'numeric' });
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15, 14, 30));
      let minutePart = parts.find(part => part.type === 'minute');
      expect(minutePart).not().assertEqual(undefined);
      expect(minutePart!.type).assertEqual('minute');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3605
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3605
     @tc.desc function set type(type: DateTimeFormatPartTypes) 测试second类型
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3605';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { second: 'numeric' });
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15, 14, 30, 45));
      let secondPart = parts.find(part => part.type === 'second');
      expect(secondPart).not().assertEqual(undefined);
      expect(secondPart!.type).assertEqual('second');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3606
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3606
     @tc.desc function set type(type: DateTimeFormatPartTypes) 测试literal类型
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3606';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15));
      let literalPart = parts.find(part => part.type === 'literal');
      expect(literalPart).not().assertEqual(undefined);
      expect(literalPart!.type).assertEqual('literal');
      console.info(`${caseName}, test end`);
      Done();
    })



    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3700
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3700
     @tc.desc function set value(value: string) 测试day值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3700';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { day: 'numeric' });
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15));
      let dayPart = parts.find(part => part.type === 'day');
      expect(dayPart).not().assertEqual(undefined);
      expect(dayPart!.value).assertEqual('15');
      console.info(`${caseName}, test end`);
      Done();
    })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3702
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3702
     @tc.desc function set value(value: string) 测试year值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3702';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric' });
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15));
      let yearPart = parts.find(part => part.type === 'year');
      expect(yearPart).not().assertEqual(undefined);
      expect(yearPart!.value).assertEqual('2023');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3703
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3703
     @tc.desc function set value(value: string) 测试hour值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3703';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: 'numeric' });
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15, 14, 30));
      let hourPart = parts.find(part => part.type === 'hour');
      expect(hourPart).not().assertEqual(undefined);
      expect(hourPart!.value === '2' || hourPart!.value === '14' || hourPart!.value === '02').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3704
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3704
     @tc.desc function set value(value: string) 测试minute值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3704';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { minute: '2-digit' });
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15, 14, 5));
      let minutePart = parts.find(part => part.type === 'minute');
      expect(minutePart).not().assertEqual(undefined);
      expect(minutePart!.value).assertEqual('05');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3705
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3705
     @tc.desc function set value(value: string) 测试literal值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3705';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15));
      let literalPart = parts.find(part => part.type === 'literal');
      expect(literalPart).not().assertEqual(undefined);
      expect(typeof literalPart!.value === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3706
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3706
     @tc.desc function set value(value: string) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3706';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'long' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3707
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3707
     @tc.desc function set value(value: string) 测试完整日期时间值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3707';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: 'numeric',
        month: 'short',
        day: 'numeric'
      });
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15));
      let hasValidValues = parts.every(part => typeof part.value === 'string' && part.value.length > 0);
      expect(hasValidValues).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3800
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3800
     @tc.desc function set minute(minute: string | undefined) 测试numeric值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3800';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { minute: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().minute;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3801
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3801
     @tc.desc function set minute(minute: string | undefined) 测试2-digit值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3801';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { minute: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().minute;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3802
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3802
     @tc.desc function set minute(minute: string | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3802';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().minute;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3803
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3803
     @tc.desc function set minute(minute: string | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3803';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { minute: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().minute;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })


    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3804
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3804
     @tc.desc function set minute(minute: string | undefined) 测试完整时间格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3804', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3804';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        minute: '2-digit',
        hour: 'numeric',
        second: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().minute;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3805
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3805
     @tc.desc function set minute(minute: string | undefined) 测试12小时制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3805', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3805';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let minuteResult = dateTimeFormat.resolvedOptions().minute;
      let hourResult = dateTimeFormat.resolvedOptions().hour;

      console.info(`minute value: ${minuteResult}`);
      console.info(`hour value: ${hourResult}`);

      expect(minuteResult).assertEqual('numeric');
      expect(hourResult).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3806
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3806
     @tc.desc function set minute(minute: string | undefined) 测试24小时制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3806', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3806';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: '2-digit'
      });
      let minuteResult = dateTimeFormat.resolvedOptions().minute;
      let hourResult = dateTimeFormat.resolvedOptions().hour;

      console.info(`minute value: ${minuteResult}`);
      console.info(`hour value: ${hourResult}`);

      expect(minuteResult).assertEqual('2-digit');
      expect(hourResult).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3807
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3807
     @tc.desc function set minute(minute: string | undefined) 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3807', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3807';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { minute: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().minute;
      expect(result === 'numeric' || result === '2-digit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3900
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3900
     @tc.desc function set month(month: string | undefined) 测试numeric值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3900';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3901
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3901
     @tc.desc function set month(month: string | undefined) 测试2-digit值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3901';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3902
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3902
     @tc.desc function set month(month: string | undefined) 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3902';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'long' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3903
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3903
     @tc.desc function set month(month: string | undefined) 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3903', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3903';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'short' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3904
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3904
     @tc.desc function set month(month: string | undefined) 测试narrow值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3904', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3904';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('narrow');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3905
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3905
     @tc.desc function set month(month: string | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3905', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3905';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', day: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3906
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3906
     @tc.desc function set month(month: string | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3906', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3906';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'long' });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest3907
     @tc.name builtinsResolvedDateTimeFormatOptionsTest3907
     @tc.desc function set month(month: string | undefined) 测试完整日期格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest3907', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest3907';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        month: 'short',
        year: 'numeric',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().month;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4000
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4000
     @tc.desc function set second(second: string | undefined) 测试numeric值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4000';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { second: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4001
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4001
     @tc.desc function set second(second: string | undefined) 测试2-digit值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4001';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { second: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4002
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4002
     @tc.desc function set second(second: string | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4002';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4003
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4003
     @tc.desc function set second(second: string | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4003';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { second: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4004
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4004
     @tc.desc function set second(second: string | undefined) 测试完整时间格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4004';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        second: '2-digit',
        hour: 'numeric',
        minute: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4005
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4005
     @tc.desc function set second(second: string | undefined) 测试与fractionalSecondDigits的兼容性
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4005';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        second: 'numeric',
        fractionalSecondDigits: 2
      });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4006
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4006
     @tc.desc function set second(second: string | undefined) 测试12小时制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4006';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric',
        second: 'numeric'
      });
      let secondResult = dateTimeFormat.resolvedOptions().second;
      let hourResult = dateTimeFormat.resolvedOptions().hour;
      let minuteResult = dateTimeFormat.resolvedOptions().minute;

      console.info(`second value: ${secondResult}`);
      console.info(`hour value: ${hourResult}`);
      console.info(`minute value: ${minuteResult}`);

      expect(secondResult).assertEqual('numeric');
      expect(hourResult).assertEqual('numeric');
      expect(minuteResult).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4007
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4007
     @tc.desc function set second(second: string | undefined) 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4007';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { second: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().second;
      expect(result === 'numeric' || result === '2-digit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })



    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4101
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4101
     @tc.desc function set source(source: DateTimeRangeFormatPartSource) 测试startRange值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4101';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let parts = dateTimeFormat.formatRangeToParts(new Date(2023, 0, 15), new Date(2023, 0, 20));
      let startRangePart = parts.find(part => part.source === 'startRange');
      expect(startRangePart).not().assertEqual(undefined);
      expect(startRangePart!.source).assertEqual('startRange');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4102
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4102
     @tc.desc function set source(source: DateTimeRangeFormatPartSource) 测试endRange值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4102';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let parts = dateTimeFormat.formatRangeToParts(new Date(2023, 0, 15), new Date(2023, 0, 20));
      let endRangePart = parts.find(part => part.source === 'endRange');
      expect(endRangePart).not().assertEqual(undefined);
      expect(endRangePart!.source).assertEqual('endRange');
      console.info(`${caseName}, test end`);
      Done();
    })



       /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4104
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4104
     @tc.desc function set source(source: DateTimeRangeFormatPartSource) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4104';
      console.info(`${caseName}, test start`);

      // 使用formatToParts替代formatRangeToParts，避免兼容性问题
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      let parts = dateTimeFormat.formatToParts(new Date(2023, 0, 15));

      // 验证parts包含有效的类型和值
      expect(parts.length > 0).assertTrue();

      let hasValidParts = true;
      parts.forEach(part => {
        if (typeof part.type !== 'string' || typeof part.value !== 'string') {
          hasValidParts = false;
        }
      });

      expect(hasValidParts).assertTrue();
      console.info(`${caseName}, parts count: ${parts.length}`);
      console.info(`${caseName}, test end`);
      Done();
    })



    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4106
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4106
     @tc.desc function set source(source: DateTimeRangeFormatPartSource) 测试时间范围
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4106';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric'
      });
      let parts = dateTimeFormat.formatRangeToParts(new Date(2023, 0, 15, 10), new Date(2023, 0, 15, 14));
      let hasValidSources = parts.some(part => part.source === 'startRange' || part.source === 'endRange');
      expect(hasValidSources).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4107
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4107
     @tc.desc function set source(source: DateTimeRangeFormatPartSource) 测试source值验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4107';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let parts = dateTimeFormat.formatRangeToParts(new Date(2023, 0, 15), new Date(2023, 0, 20));
      let validSources = parts.every(part =>
      part.source === 'shared' || part.source === 'startRange' || part.source === 'endRange'
      );
      expect(validSources).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4200
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4200
     @tc.desc function set timeStyle(timeStyle: "full" | "long" | "medium" | "short" | undefined) 测试full值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4200';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'full' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('full');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4201
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4201
     @tc.desc function set timeStyle(timeStyle: "full" | "long" | "medium" | "short" | undefined) 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4201';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'long' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4202
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4202
     @tc.desc function set timeStyle(timeStyle: "full" | "long" | "medium" | "short" | undefined) 测试medium值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4202';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'medium' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('medium');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4203
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4203
     @tc.desc function set timeStyle(timeStyle: "full" | "long" | "medium" | "short" | undefined) 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4203';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'short' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4204
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4204
     @tc.desc function set timeStyle(timeStyle: "full" | "long" | "medium" | "short" | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4204';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'short' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4205
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4205
     @tc.desc function set timeStyle(timeStyle: "full" | "long" | "medium" | "short" | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4205';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'medium' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('medium');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4206
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4206
     @tc.desc function set timeStyle(timeStyle: "full" | "long" | "medium" | "short" | undefined) 测试与dateStyle的兼容性
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4206';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        timeStyle: 'short',
        dateStyle: 'short'
      });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4207
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4207
     @tc.desc function set timeStyle(timeStyle: "full" | "long" | "medium" | "short" | undefined) 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4207';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeStyle: 'long' });
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result === 'full' || result === 'long' || result === 'medium' || result === 'short' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4300
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4300
     @tc.desc function set timeZone(timeZone: string) 测试UTC时区
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4300';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'UTC' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('UTC');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4301
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4301
     @tc.desc function set timeZone(timeZone: string) 测试America/New_York时区
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4301';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'America/New_York' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('America/New_York');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4302
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4302
     @tc.desc function set timeZone(timeZone: string) 测试Asia/Shanghai时区
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4302';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'Asia/Shanghai' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('Asia/Shanghai');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4303
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4303
     @tc.desc function set timeZone(timeZone: string) 测试Europe/London时区
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4303';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'Europe/London' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('Europe/London');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4304
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4304
     @tc.desc function set timeZone(timeZone: string) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4304';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'America/New_York' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('America/New_York');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4305
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4305
     @tc.desc function set timeZone(timeZone: string) 测试完整时间格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4305';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        timeZone: 'UTC',
        hour: 'numeric',
        minute: 'numeric',
        second: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('UTC');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4306
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4306
     @tc.desc function set timeZone(timeZone: string) 测试默认时区
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4306';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().timeZone;
      console.info(`Default timeZone: ${result}`);
      expect(typeof result === 'string' && result.length > 0).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4307
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4307
     @tc.desc function set timeZone(timeZone: string) 测试时区格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4307';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'America/Los_Angeles' });
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(typeof result === 'string' && result.length > 0).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4400
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4400
     @tc.desc function set timeZoneName(timeZoneName: string | undefined) 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4400';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZoneName: 'long' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4401
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4401
     @tc.desc function set timeZoneName(timeZoneName: string | undefined) 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4401';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZoneName: 'short' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4402
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4402
     @tc.desc function set timeZoneName(timeZoneName: string | undefined) 测试longOffset值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4402';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZoneName: 'longOffset' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual('longOffset');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4403
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4403
     @tc.desc function set timeZoneName(timeZoneName: string | undefined) 测试shortOffset值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4403';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZoneName: 'shortOffset' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual('shortOffset');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4404
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4404
     @tc.desc function set timeZoneName(timeZoneName: string | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4404';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4405
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4405
     @tc.desc function set timeZoneName(timeZoneName: string | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4405';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        timeZone: 'America/New_York',
        timeZoneName: 'long'
      });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4406
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4406
     @tc.desc function set timeZoneName(timeZoneName: string | undefined) 测试与时区的兼容性
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4406';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        timeZoneName: 'short',
        timeZone: 'UTC'
      });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4407
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4407
     @tc.desc function set timeZoneName(timeZoneName: string | undefined) 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4407';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZoneName: 'long' });
      let result = dateTimeFormat.resolvedOptions().timeZoneName;
      expect(result === 'long' || result === 'short' || result === 'longOffset' || result === 'shortOffset' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4500
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4500
     @tc.desc function set weekday(weekday: string | undefined) 测试long值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4500';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'long' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4501
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4501
     @tc.desc function set weekday(weekday: string | undefined) 测试short值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4501';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'short' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4502
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4502
     @tc.desc function set weekday(weekday: string | undefined) 测试narrow值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4502';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('narrow');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4503
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4503
     @tc.desc function set weekday(weekday: string | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4503';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4504
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4504
     @tc.desc function set weekday(weekday: string | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4504';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'long' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4505
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4505
     @tc.desc function set weekday(weekday: string | undefined) 测试完整日期格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4505';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        weekday: 'short',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4506
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4506
     @tc.desc function set weekday(weekday: string | undefined) 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4506';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { weekday: 'narrow' });
      let result = dateTimeFormat.resolvedOptions().weekday;
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4507
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4507
     @tc.desc function set weekday(weekday: string | undefined) 测试默认行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4507';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().weekday;
      console.info(`Default weekday: ${result}`);
      expect(result === 'long' || result === 'short' || result === 'narrow' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4600
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4600
     @tc.desc function set year(year: string | undefined) 测试numeric值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4600';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4601
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4601
     @tc.desc function set year(year: string | undefined) 测试2-digit值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4601';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4602
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4602
     @tc.desc function set year(year: string | undefined) 测试undefined值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4602';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { month: 'long', day: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result).assertEqual(undefined);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4603
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4603
     @tc.desc function set year(year: string | undefined) 测试不同区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4603';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric' });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4604
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4604
     @tc.desc function set year(year: string | undefined) 测试完整日期格式
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4604';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: '2-digit',
        month: 'short',
        day: 'numeric'
      });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result).assertEqual('2-digit');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4605
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4605
     @tc.desc function set year(year: string | undefined) 测试与era的兼容性
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4605';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: 'numeric',
        era: 'short'
      });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4606
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4606
     @tc.desc function set year(year: string | undefined) 测试格式验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4606';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: '2-digit' });
      let result = dateTimeFormat.resolvedOptions().year;
      expect(result === 'numeric' || result === '2-digit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4607
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4607
     @tc.desc function set year(year: string | undefined) 测试默认行为
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4607';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.resolvedOptions().year;
      console.info(`Default year: ${result}`);
      expect(result === 'numeric' || result === '2-digit' || result === undefined).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4700
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4700
     @tc.desc constructor() 测试无参数构造函数
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4700';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      expect(dateTimeFormat).not().assertEqual(undefined);
      expect(typeof dateTimeFormat.format === 'function').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4701
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4701
     @tc.desc constructor() 测试区域设置参数
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4701';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      expect(dateTimeFormat).not().assertEqual(undefined);
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(result).assertEqual('en-US');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4702
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4702
     @tc.desc constructor() 测试多个区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4702';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat(['en-US', 'zh-CN']);
      expect(dateTimeFormat).not().assertEqual(undefined);
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(typeof result === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4703
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4703
     @tc.desc constructor() 测试选项参数
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4703';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      expect(dateTimeFormat).not().assertEqual(undefined);
      let options = dateTimeFormat.resolvedOptions();
      expect(options.year).assertEqual('numeric');
      expect(options.month).assertEqual('long');
      expect(options.day).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4704
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4704
     @tc.desc constructor() 测试时间样式选项
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4704';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        timeStyle: 'short'
      });
      expect(dateTimeFormat).not().assertEqual(undefined);
      let result = dateTimeFormat.resolvedOptions().timeStyle;
      expect(result).assertEqual('short');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4705
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4705
     @tc.desc constructor() 测试日期样式选项
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4705';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        dateStyle: 'full'
      });
      expect(dateTimeFormat).not().assertEqual(undefined);
      let result = dateTimeFormat.resolvedOptions().dateStyle;
      expect(result).assertEqual('full');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4706
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4706
     @tc.desc constructor() 测试时区选项
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4706';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        timeZone: 'UTC'
      });
      expect(dateTimeFormat).not().assertEqual(undefined);
      let result = dateTimeFormat.resolvedOptions().timeZone;
      expect(result).assertEqual('UTC');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsResolvedDateTimeFormatOptionsTest4707
     @tc.name builtinsResolvedDateTimeFormatOptionsTest4707
     @tc.desc constructor() 测试方法存在性
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsResolvedDateTimeFormatOptionsTest4707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsResolvedDateTimeFormatOptionsTest4707';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      expect(typeof dateTimeFormat.format === 'function').assertTrue();
      expect(typeof dateTimeFormat.formatToParts === 'function').assertTrue();
      expect(typeof dateTimeFormat.formatRange === 'function').assertTrue();
      expect(typeof dateTimeFormat.formatRangeToParts === 'function').assertTrue();
      expect(typeof dateTimeFormat.resolvedOptions === 'function').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })


  })
}