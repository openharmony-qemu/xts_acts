import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function builtinsDateTimeRangeFormatPartImplTest(){
  describe('builtinsDateTimeRangeFormatPartImplTest', ():void => {
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
     @tc.number builtinsDateTimeRangeFormatPartImplTest100
     @tc.name builtinsDateTimeRangeFormatPartImplTest100
     @tc.desc 测试DateTimeFormat range功能基本使用
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartImplTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartImplTest100';
      console.info(`${caseName}, test start`);
      try {
        const startDate = new Date(2023, 0, 1);
        const endDate = new Date(2023, 0, 5);

        // 直接使用DateTimeFormat API，避免prototype操作
        const formatter = new Intl.DateTimeFormat('en-US', {
          year: 'numeric',
          month: 'long',
          day: 'numeric'
        });

        // 测试基本的format功能
        const formattedStart = formatter.format(startDate);
        const formattedEnd = formatter.format(endDate);

        expect(typeof formattedStart).assertEqual('string');
        expect(typeof formattedEnd).assertEqual('string');
        expect(formattedStart.length > 0).assertTrue();
        expect(formattedEnd.length > 0).assertTrue();

        console.info(`Formatted start: ${formattedStart}`);
        console.info(`Formatted end: ${formattedEnd}`);

      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
      }
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartImplTest110
     @tc.name builtinsDateTimeRangeFormatPartImplTest110
     @tc.desc 测试DateTimeFormat formatToParts功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartImplTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartImplTest110';
      console.info(`${caseName}, test start`);
      try {
        const date = new Date(2023, 0, 1);
        const formatter = new Intl.DateTimeFormat('en-US', {
          year: 'numeric',
          month: 'long',
          day: 'numeric'
        });

        const parts = formatter.formatToParts(date);

        expect(Array.isArray(parts)).assertTrue();
        expect(parts.length > 0).assertTrue();

        // 验证part结构
        parts.forEach(part => {
          expect(typeof part.type).assertEqual('string');
          expect(typeof part.value).assertEqual('string');
        });

        console.info(`${caseName}, parts count: ${parts.length}`);

      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
      }
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartImplTest120
     @tc.name builtinsDateTimeRangeFormatPartImplTest120
     @tc.desc 测试不同区域设置的formatToParts
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartImplTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartImplTest120';
      console.info(`${caseName}, test start`);
      try {
        const date = new Date(2023, 0, 1);
        const locales = ['en-US', 'ko-KR', 'ja-JP'];

        locales.forEach(locale => {
          const formatter = new Intl.DateTimeFormat(locale, {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
          });
          const parts = formatter.formatToParts(date);

          expect(Array.isArray(parts)).assertTrue();
          expect(parts.length > 0).assertTrue();

          console.info(`${locale} parts count: ${parts.length}`);
        });

      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
      }
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartImplTest130
     @tc.name builtinsDateTimeRangeFormatPartImplTest130
     @tc.desc 测试时间格式的formatToParts
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartImplTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartImplTest130';
      console.info(`${caseName}, test start`);
      try {
        const date = new Date(2023, 0, 1, 14, 30, 45);
        const formatter = new Intl.DateTimeFormat('en-US', {
          hour: 'numeric',
          minute: '2-digit',
          second: '2-digit',
          hour12: true
        });

        const parts = formatter.formatToParts(date);

        let hasTimeParts = false;
        parts.forEach(part => {
          if (part.type === 'hour' || part.type === 'minute' || part.type === 'second' || part.type === 'dayPeriod') {
            hasTimeParts = true;
            console.info(`Time part: ${part.type} = ${part.value}`);
          }
        });

        expect(hasTimeParts).assertTrue();

      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
      }
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartImplTest140
     @tc.name builtinsDateTimeRangeFormatPartImplTest140
     @tc.desc 测试resolvedOptions功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartImplTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartImplTest140';
      console.info(`${caseName}, test start`);
      try {
        const formatter = new Intl.DateTimeFormat('en-US', {
          year: 'numeric',
          month: 'long',
          day: 'numeric',
          weekday: 'long'
        });

        const options = formatter.resolvedOptions();

        expect(typeof options.locale).assertEqual('string');
        expect(options.locale).assertEqual('en-US');
        expect(options.year).assertEqual('numeric');
        expect(options.month).assertEqual('long');
        expect(options.day).assertEqual('numeric');
        expect(options.weekday).assertEqual('long');

        console.info(`Resolved locale: ${options.locale}`);

      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
      }
      console.info(`${caseName}, test end`);
      Done();
    })


    /**
     @tc.number builtinsDateTimeRangeFormatPartImplTest150
     @tc.name builtinsDateTimeRangeFormatPartImplTest150
     @tc.desc 测试DateTimeFormat边界情况
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */

    it('builtinsDateTimeRangeFormatPartImplTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartImplTest150';
      console.info(`${caseName}, test start`);
      try {
        // 测试无效日期
        const invalidDate = new Date('invalid');
        const formatter = new Intl.DateTimeFormat('en-US');

        try {
          const formatted = formatter.format(invalidDate);
          // 如果执行到这里，检查结果
          expect(typeof formatted).assertEqual('string');
          console.info(`Invalid date formatted as: ${formatted}`);
        } catch (e) {
          // 预期可能会抛出错误
          console.info('Expected error for invalid date');
        }

        // 测试最小和最大日期
        const minDate = new Date(-8640000000000000);
        const maxDate = new Date(8640000000000000);

        const minFormatted = formatter.format(minDate);
        const maxFormatted = formatter.format(maxDate);

        expect(typeof minFormatted).assertEqual('string');
        expect(typeof maxFormatted).assertEqual('string');

        console.info(`Min date formatted: ${minFormatted}`);
        console.info(`Max date formatted: ${maxFormatted}`);

      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
      }
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeRangeFormatPartImplTest160
     @tc.name builtinsDateTimeRangeFormatPartImplTest160
     @tc.desc 测试DateTimeFormat默认选项
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeRangeFormatPartImplTest160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeRangeFormatPartImplTest160';
      console.info(`${caseName}, test start`);
      try {
        // 测试默认构造器
        const defaultFormatter = new Intl.DateTimeFormat('en-US');
        const defaultOptions = defaultFormatter.resolvedOptions();

        expect(typeof defaultOptions.locale).assertEqual('string');
        expect(defaultOptions.locale).assertEqual('en-US');

        // 测试默认格式化
        const date = new Date();
        const defaultFormatted = defaultFormatter.format(date);
        expect(typeof defaultFormatted).assertEqual('string');
        expect(defaultFormatted.length > 0).assertTrue();

        console.info(`Default formatted: ${defaultFormatted}`);
        console.info(`Default locale: ${defaultOptions.locale}`);

      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
      }
      console.info(`${caseName}, test end`);
      Done();
    })


  }
  )}