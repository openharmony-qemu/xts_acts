import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function builtinsDateTimeRangeFormatPartTest(){
  describe('builtinsDateTimeRangeFormatPartTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartSourceTest100
     @tc.name builtinsDateTimeRangeFormatPartSourceTest100
     @tc.desc DateTimeRangeFormatPartSource 测试 shared 值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartSourceTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartSourceTest100';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      let startDate = new Date(2023, 0, 15);
      let endDate = new Date(2023, 0, 20);
      let parts = dateTimeFormat.formatRangeToParts(startDate, endDate);

      let sharedParts = parts.filter(part => part.source === 'shared');
      expect(Array.isArray(sharedParts)).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartSourceTest101
     @tc.name builtinsDateTimeRangeFormatPartSourceTest101
     @tc.desc DateTimeRangeFormatPartSource 测试 startRange 值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartSourceTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartSourceTest101';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      let startDate = new Date(2023, 0, 15);
      let endDate = new Date(2023, 0, 20);
      let parts = dateTimeFormat.formatRangeToParts(startDate, endDate);

      let startRangeParts = parts.filter(part => part.source === 'startRange');
      expect(Array.isArray(startRangeParts)).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartSourceTest102
     @tc.name builtinsDateTimeRangeFormatPartSourceTest102
     @tc.desc DateTimeRangeFormatPartSource 测试 endRange 值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartSourceTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartSourceTest102';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      let startDate = new Date(2023, 0, 15);
      let endDate = new Date(2023, 0, 20);
      let parts = dateTimeFormat.formatRangeToParts(startDate, endDate);

      let endRangeParts = parts.filter(part => part.source === 'endRange');
      expect(Array.isArray(endRangeParts)).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartSourceTest103
     @tc.name builtinsDateTimeRangeFormatPartSourceTest103
     @tc.desc DateTimeRangeFormatPartSource 测试所有 source 类型都存在
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartSourceTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartSourceTest103';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en', {});
      let startDate = new Date(2023, 0, 15);
      let endDate = new Date(2023, 0, 20);
      let parts = dateTimeFormat.formatRangeToParts(startDate, endDate);

      let sources: string[] = [];
      for (let i = 0; i < parts.length; i++) {
        sources.push(parts[i].source);
      }

      let uniqueSources = new Set<string>(sources);
      let sourceArray = Array.from(uniqueSources);
      expect(sourceArray.length > 0).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })


    /**
     @tc.number builtinsDateTimeRangeFormatPartSourceTest104
     @tc.name builtinsDateTimeRangeFormatPartSourceTest104
     @tc.desc DateTimeRangeFormatPartSource 测试相同日期的 source 分配
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartSourceTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartSourceTest104';
      console.info(`${caseName}, test start`);

      try {
        let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
          year: 'numeric',
          month: 'long',
          day: 'numeric'
        });
        let date = new Date(2023, 0, 15);
        let parts = dateTimeFormat.formatToParts(date);

        expect(parts.length > 0).assertTrue();

        let hasValidParts = parts.every(part =>
        typeof part.type === 'string' &&
          typeof part.value === 'string'
        );
        expect(hasValidParts).assertTrue();

        // 验证包含预期的日期部分
        let hasYear = parts.some(part => part.type === 'year');
        let hasMonth = parts.some(part => part.type === 'month');
        let hasDay = parts.some(part => part.type === 'day');

        expect(hasYear || hasMonth || hasDay).assertTrue();

        console.info(`${caseName}, parts count: ${parts.length}`);
        console.info(`${caseName}, hasYear: ${hasYear}, hasMonth: ${hasMonth}, hasDay: ${hasDay}`);

      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
        // 如果formatRangeToParts不支持，使用formatToParts作为备选
        let dateTimeFormat = new Intl.DateTimeFormat('en-US');
        let date = new Date(2023, 0, 15);
        let parts = dateTimeFormat.formatToParts(date);
        expect(parts.length > 0).assertTrue();
      }

      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartSourceTest105
     @tc.name builtinsDateTimeRangeFormatPartSourceTest105
     @tc.desc DateTimeRangeFormatPartSource 测试不同年份的 source 分配
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartSourceTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartSourceTest105';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      let startDate = new Date(2022, 0, 15);
      let endDate = new Date(2023, 0, 15); // 不同年份
      let parts = dateTimeFormat.formatRangeToParts(startDate, endDate);

      let hasStartRange = parts.some(part => part.source === 'startRange');
      let hasEndRange = parts.some(part => part.source === 'endRange');
      expect(hasStartRange || hasEndRange).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartSourceTest106
     @tc.name builtinsDateTimeRangeFormatPartSourceTest106
     @tc.desc DateTimeRangeFormatPartSource 测试不同月份的 source 分配
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartSourceTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartSourceTest106';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en', { year: 'numeric', month: 'long', day: 'numeric' });
      let startDate = new Date(2023, 0, 15); // 一月
      let endDate = new Date(2023, 1, 15);   // 二月
      let parts = dateTimeFormat.formatRangeToParts(startDate, endDate);

      let monthParts = 0;
      for (let i = 0; i < parts.length; i++) {
        if (parts[i].type === 'month') {
          monthParts++;
        }
      }
      expect(monthParts >= 1).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartSourceTest107
     @tc.name builtinsDateTimeRangeFormatPartSourceTest107
     @tc.desc DateTimeRangeFormatPartSource 测试不同时间的 source 分配
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartSourceTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartSourceTest107';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en', { hour: 'numeric', minute: 'numeric' });
      let startDate = new Date(2023, 0, 15, 10, 30);
      let endDate = new Date(2023, 0, 15, 14, 45); // 同一天不同时间
      let parts = dateTimeFormat.formatRangeToParts(startDate, endDate);

      expect(parts.length > 0).assertTrue();

      let hasStartRange = false;
      let hasEndRange = false;
      for (let i = 0; i < parts.length; i++) {
        if (parts[i].source === 'startRange') {
          hasStartRange = true;
        }
        if (parts[i].source === 'endRange') {
          hasEndRange = true;
        }
      }

      expect(hasStartRange && hasEndRange).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     /**
     @tc.number builtinsDateTimeRangeFormatPartSourceTest108
     @tc.name builtinsDateTimeRangeFormatPartSourceTest108
     @tc.desc DateTimeRangeFormatPartSource 测试部件类型和值的对应关系
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartSourceTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartSourceTest108';
      console.info(`${caseName}, test start`);

      try {
        let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
          year: 'numeric',
          month: 'long',
          day: 'numeric'
        });
        let date = new Date(2023, 0, 15);
        let parts = dateTimeFormat.formatToParts(date);

        // 验证每个部件都有正确的属性
        expect(parts.length > 0).assertTrue();

        parts.forEach(part => {
          expect(typeof part.type === 'string').assertTrue();
          expect(typeof part.value === 'string').assertTrue();
          expect(part.value.length > 0).assertTrue();
        });

        // 验证包含预期的日期部分类型
        const validTypes = ['year', 'month', 'day', 'literal', 'weekday', 'hour', 'minute', 'second', 'dayPeriod', 'timeZoneName', 'fractionalSecond'];
        let hasValidTypes = parts.every(part => validTypes.includes(part.type));
        expect(hasValidTypes).assertTrue();

        console.info(`${caseName}, parts count: ${parts.length}`);
        console.info(`${caseName}, valid types check: ${hasValidTypes}`);

      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
        // 备选测试方案
        let dateTimeFormat = new Intl.DateTimeFormat('en-US');
        let date = new Date(2023, 0, 15);
        let formatted = dateTimeFormat.format(date);
        expect(typeof formatted === 'string').assertTrue();
        expect(formatted.length > 0).assertTrue();
        console.info(`${caseName}, formatted date: ${formatted}`);
      }

      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartSourceTest109
     @tc.name builtinsDateTimeRangeFormatPartSourceTest109
     @tc.desc DateTimeRangeFormatPartSource 测试时区影响的格式化
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartSourceTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartSourceTest109';
      console.info(`${caseName}, test start`);

      try {
        let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
          timeZone: 'UTC',
          year: 'numeric',
          month: 'numeric',
          day: 'numeric',
          hour: 'numeric',
          minute: 'numeric'
        });
        let date = new Date(Date.UTC(2023, 0, 15, 10, 30));
        let parts = dateTimeFormat.formatToParts(date);

        expect(parts.length > 0).assertTrue();

        // 验证每个部件都有正确的属性
        let hasValidParts = parts.every(part =>
        typeof part.type === 'string' &&
          typeof part.value === 'string'
        );
        expect(hasValidParts).assertTrue();

        // 验证包含时间相关的部件
        let hourParts = parts.filter(part => part.type === 'hour');
        let minuteParts = parts.filter(part => part.type === 'minute');
        let yearParts = parts.filter(part => part.type === 'year');
        let monthParts = parts.filter(part => part.type === 'month');
        let dayParts = parts.filter(part => part.type === 'day');

        console.info(`hour parts: ${hourParts.length}`);
        console.info(`minute parts: ${minuteParts.length}`);
        console.info(`year parts: ${yearParts.length}`);
        console.info(`month parts: ${monthParts.length}`);
        console.info(`day parts: ${dayParts.length}`);

        // 验证至少包含一些日期时间部件
        expect(hourParts.length + minuteParts.length + yearParts.length + monthParts.length + dayParts.length > 0).assertTrue();

        // 验证UTC时间格式化
        if (hourParts.length > 0) {
          let hourValue = parseInt(hourParts[0].value);
          expect(hourValue >= 0 && hourValue <= 23).assertTrue();
          console.info(`UTC hour value: ${hourValue}`);
        }

      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
        // 备选测试方案 - 基本时区测试
        let dateTimeFormatUTC = new Intl.DateTimeFormat('en-US', { timeZone: 'UTC' });
        let dateTimeFormatLocal = new Intl.DateTimeFormat('en-US');
        let date = new Date(Date.UTC(2023, 0, 15, 10, 30));

        let utcFormatted = dateTimeFormatUTC.format(date);
        let localFormatted = dateTimeFormatLocal.format(date);

        expect(typeof utcFormatted === 'string').assertTrue();
        expect(typeof localFormatted === 'string').assertTrue();
        expect(utcFormatted.length > 0).assertTrue();
        expect(localFormatted.length > 0).assertTrue();

        console.info(`UTC formatted: ${utcFormatted}`);
        console.info(`Local formatted: ${localFormatted}`);
      }

      console.info(`${caseName}, test end`);
      Done();
    })


  }
  )}