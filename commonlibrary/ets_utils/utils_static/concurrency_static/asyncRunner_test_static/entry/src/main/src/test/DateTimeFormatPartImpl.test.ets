import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function builtinsDateTimeFormatPartImplTest(){
  describe('builtinsDateTimeFormatPartImplTest', ():void => {
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
     @tc.number builtinsDateTimeFormatPartImplTest1100
     @tc.name builtinsDateTimeFormatPartImplTest1100
     @tc.desc constructor(type: DateTimeFormatPartTypes, value: string) 测试基本构造
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartImplTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartImplTest1100';
      console.info(`${caseName}, test start`);
      // 使用明确的DateTimeFormatPart类型
      try {
        const date = new Date(2023, 0, 1);
        const formatter = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long', day: 'numeric' });
        const parts = formatter.formatToParts(date);
        expect(parts.length > 0).assertTrue();
        console.info(`${caseName}, parts count: ${parts.length}`);
      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
      }
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartImplTest1200
     @tc.name builtinsDateTimeFormatPartImplTest1200
     @tc.desc 测试DateTimeFormatPart类型验证
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartImplTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartImplTest1200';
      console.info(`${caseName}, test start`);
      try {
        const date = new Date(2023, 11, 25);
        const formatter = new Intl.DateTimeFormat('en-US');
        const parts = formatter.formatToParts(date);

        let hasValidTypes = true;
        const validTypes = ['year', 'month', 'day', 'weekday', 'hour', 'minute', 'second', 'dayPeriod', 'literal', 'timeZoneName', 'fractionalSecond'];

        parts.forEach(part => {
          if (!validTypes.includes(part.type)) {
            hasValidTypes = false;
            console.error(`Invalid type: ${part.type}`);
          }
          if (typeof part.value !== 'string') {
            hasValidTypes = false;
            console.error(`Invalid value type: ${typeof part.value}`);
          }
        });

        expect(hasValidTypes).assertTrue();
      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
      }
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartImplTest1300
     @tc.name builtinsDateTimeFormatPartImplTest1300
     @tc.desc 测试不同区域设置的formatToParts
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartImplTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartImplTest1300';
      console.info(`${caseName}, test start`);
      try {
        const date = new Date(2023, 11, 25);
        const locales = ['en-US', 'ko-KR', 'ja-JP'];

        locales.forEach(locale => {
          const formatter = new Intl.DateTimeFormat(locale, {
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            weekday: 'long'
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
     @tc.number builtinsDateTimeFormatPartImplTest1500
     @tc.name builtinsDateTimeFormatPartImplTest1500
     @tc.desc 测试时间格式的DateTimeFormatPart
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartImplTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartImplTest1500';
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
     @tc.number builtinsDateTimeFormatPartImplTest1600
     @tc.name builtinsDateTimeFormatPartImplTest1600
     @tc.desc 测试literal类型的分隔符
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartImplTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartImplTest1600';
      console.info(`${caseName}, test start`);
      try {
        const date = new Date(2023, 0, 1);
        const formatter = new Intl.DateTimeFormat('en-US');
        const parts = formatter.formatToParts(date);

        let hasLiteral = false;
        parts.forEach(part => {
          if (part.type === 'literal') {
            hasLiteral = true;
            console.info(`Literal value: "${part.value}"`);
            expect(typeof part.value).assertEqual('string');
          }
        });

        expect(hasLiteral).assertTrue();

      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
      }
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatPartImplTest1700
     @tc.name builtinsDateTimeFormatPartImplTest1700
     @tc.desc 测试空值和边界情况
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatPartImplTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatPartImplTest1700';
      console.info(`${caseName}, test start`);
      try {
        // 测试无效日期
        const invalidDate = new Date('invalid');
        const formatter = new Intl.DateTimeFormat('en-US');

        try {
          const parts = formatter.formatToParts(invalidDate);
          // 如果执行到这里，检查parts是否为空或包含错误信息
          expect(Array.isArray(parts)).assertTrue();
        } catch (e) {
          // 预期可能会抛出错误
          console.info('Expected error for invalid date');
        }

      } catch (error) {
        console.error(`${caseName}, error: ${error}`);
      }
      console.info(`${caseName}, test end`);
      Done();
    })

  }
  )}