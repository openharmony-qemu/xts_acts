
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function builtinsDateTimeFormatOptionsTest(){
  describe('builtinsDateTimeFormatOptionsTest', ():void => {
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
     @tc.number builtinsDateTimeFormatOptionsTest100
     @tc.name builtinsDateTimeFormatOptionsTest100
     @tc.desc constructor(locales: string, options?: Intl.DateTimeFormatOptions) 测试必填区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest100';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      expect(dateTimeFormat).not().assertEqual(undefined);
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(result).assertEqual('en-US');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest101
     @tc.name builtinsDateTimeFormatOptionsTest101
     @tc.desc constructor(locales: string, options?: Intl.DateTimeFormatOptions) 测试英文区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest101';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      expect(dateTimeFormat).not().assertEqual(undefined);
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(result).assertEqual('en-US');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest102
     @tc.name builtinsDateTimeFormatOptionsTest102
     @tc.desc constructor(locales: string, options?: Intl.DateTimeFormatOptions) 测试数组区域设置
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest102';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat(['en-US', 'ko-KR']);
      expect(dateTimeFormat).not().assertEqual(undefined);
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(typeof result === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest103
     @tc.name builtinsDateTimeFormatOptionsTest103
     @tc.desc constructor(locales: string, options?: Intl.DateTimeFormatOptions) 测试带日期选项
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest103';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
      expect(dateTimeFormat).not().assertEqual(undefined);
      let options = dateTimeFormat.resolvedOptions();
      expect(options.locale).assertEqual('en-US');
      expect(options.year).assertEqual('numeric');
      expect(options.month).assertEqual('long');
      expect(options.day).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest104
     @tc.name builtinsDateTimeFormatOptionsTest104
     @tc.desc constructor(locales: string, options?: Intl.DateTimeFormatOptions) 测试带时间选项
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest104';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        hour: 'numeric',
        minute: 'numeric',
        second: 'numeric'
      });
      expect(dateTimeFormat).not().assertEqual(undefined);
      let options = dateTimeFormat.resolvedOptions();
      expect(options.locale).assertEqual('en-US');
      expect(options.hour).assertEqual('numeric');
      expect(options.minute).assertEqual('numeric');
      expect(options.second).assertEqual('numeric');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest105
     @tc.name builtinsDateTimeFormatOptionsTest105
     @tc.desc constructor(locales: string, options?: Intl.DateTimeFormatOptions) 测试带时区选项
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest105';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        timeZone: 'UTC'
      });
      expect(dateTimeFormat).not().assertEqual(undefined);
      let options = dateTimeFormat.resolvedOptions();
      expect(options.locale).assertEqual('en-US');
      expect(options.timeZone).assertEqual('UTC');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest106
     @tc.name builtinsDateTimeFormatOptionsTest106
     @tc.desc constructor(locales: string, options?: Intl.DateTimeFormatOptions) 测试带样式选项
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest106';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        dateStyle: 'full',
        timeStyle: 'long'
      });
      expect(dateTimeFormat).not().assertEqual(undefined);
      let options = dateTimeFormat.resolvedOptions();
      expect(options.locale).assertEqual('en-US');
      expect(options.dateStyle).assertEqual('full');
      expect(options.timeStyle).assertEqual('long');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest107
     @tc.name builtinsDateTimeFormatOptionsTest107
     @tc.desc constructor(locales: string, options?: Intl.DateTimeFormatOptions) 测试复杂选项组合
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest107';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat(['en-US', 'ko-KR'], {
        year: 'numeric',
        month: 'short',
        day: '2-digit',
        weekday: 'long',
        hour: 'numeric',
        minute: '2-digit',
        timeZone: 'UTC'
      });
      expect(dateTimeFormat).not().assertEqual(undefined);
      let options = dateTimeFormat.resolvedOptions();

      console.info(`locale: ${options.locale}`);
      console.info(`year: ${options.year}`);
      console.info(`month: ${options.month}`);
      console.info(`day: ${options.day}`);
      console.info(`weekday: ${options.weekday}`);
      console.info(`hour: ${options.hour}`);
      console.info(`minute: ${options.minute}`);
      console.info(`timeZone: ${options.timeZone}`);
      console.info(`hour12: ${options.hour12}`);

      expect(options.locale === 'en-US' || options.locale === 'ko-KR').assertTrue();
      expect(options.year).assertEqual('numeric');
      expect(options.month).assertEqual('short');
      expect(options.day).assertEqual('2-digit');
      expect(options.weekday).assertEqual('long');
      expect(options.hour).assertEqual('numeric');
      expect(options.minute).assertEqual('2-digit');
      expect(options.timeZone).assertEqual('UTC');

      // 验证hour12在允许范围内
      expect(options.hour12 === true || options.hour12 === false || options.hour12 === undefined).assertTrue();

      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest200
     @tc.name builtinsDateTimeFormatOptionsTest200
     @tc.desc constructor() 测试无参数构造函数（使用默认区域设置）
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest200';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      expect(dateTimeFormat).not().assertEqual(undefined);
      let result = dateTimeFormat.resolvedOptions().locale;
      expect(typeof result === 'string' && result.length > 0).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest201
     @tc.name builtinsDateTimeFormatOptionsTest201
     @tc.desc constructor() 测试默认选项值
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest201';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      let options = dateTimeFormat.resolvedOptions();
      expect(typeof options.locale === 'string').assertTrue();
      expect(typeof options.calendar === 'string').assertTrue();
      expect(typeof options.numberingSystem === 'string').assertTrue();
      expect(typeof options.timeZone === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest202
     @tc.name builtinsDateTimeFormatOptionsTest202
     @tc.desc constructor() 测试格式化功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest202';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      let date = new Date(2023, 0, 15);
      let result = dateTimeFormat.format(date);
      expect(typeof result === 'string' && result.length > 0).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest203
     @tc.name builtinsDateTimeFormatOptionsTest203
     @tc.desc constructor() 测试部件格式化功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest203';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      let date = new Date(2023, 0, 15);
      let result = dateTimeFormat.formatToParts(date);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length > 0).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest204
     @tc.name builtinsDateTimeFormatOptionsTest204
     @tc.desc constructor() 测试范围格式化功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest204';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      let startDate = new Date(2023, 0, 15);
      let endDate = new Date(2023, 0, 20);
      let result = dateTimeFormat.formatRange(startDate, endDate);
      expect(typeof result === 'string' && result.length > 0).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest205
     @tc.name builtinsDateTimeFormatOptionsTest205
     @tc.desc constructor() 测试范围部件格式化功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest205';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      let startDate = new Date(2023, 0, 15);
      let endDate = new Date(2023, 0, 20);
      let result = dateTimeFormat.formatRangeToParts(startDate, endDate);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length > 0).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest206
     @tc.name builtinsDateTimeFormatOptionsTest206
     @tc.desc constructor() 测试方法存在性
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest206';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      expect(typeof dateTimeFormat.format === 'function').assertTrue();
      expect(typeof dateTimeFormat.formatToParts === 'function').assertTrue();
      expect(typeof dateTimeFormat.formatRange === 'function').assertTrue();
      expect(typeof dateTimeFormat.formatRangeToParts === 'function').assertTrue();
      expect(typeof dateTimeFormat.resolvedOptions === 'function').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest207
     @tc.name builtinsDateTimeFormatOptionsTest207
     @tc.desc constructor() 测试实例类型
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest207';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat();
      expect(dateTimeFormat instanceof Intl.DateTimeFormat).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })


    /**
     @tc.number builtinsDateTimeFormatOptionsTest300
     @tc.name builtinsDateTimeFormatOptionsTest300
     @tc.desc 测试空选项对象的属性检查
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName: string = 'builtinsDateTimeFormatOptionsTest300';
      console.info(`${caseName}, test start`);
      let options: Intl.DateTimeFormatOptions = {};

      // 使用 Object.keys() 并明确检查长度
      let keys: Array<string> = Object.keys(options);
      let hasProperties: boolean = keys.length > 0;

      expect(hasProperties).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    });

    /**
     @tc.number builtinsDateTimeFormatOptionsTest301
     @tc.name builtinsDateTimeFormatOptionsTest301
     @tc.desc 测试非空选项对象的属性检查
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName: string = 'builtinsDateTimeFormatOptionsTest301';
      console.info(`${caseName}, test start`);
      let options: Intl.DateTimeFormatOptions = { year: 'numeric' };
      let hasProperties: boolean = Object.keys(options).length > 0;
      expect(hasProperties).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest302
     @tc.name builtinsDateTimeFormatOptionsTest302
     @tc.desc 测试日期选项对象的属性检查
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName: string = 'builtinsDateTimeFormatOptionsTest302';
      console.info(`${caseName}, test start`);
      let options: Intl.DateTimeFormatOptions = {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      };
      let propertyCount: number = Object.keys(options).length;
      expect(propertyCount).assertEqual(20);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest303
     @tc.name builtinsDateTimeFormatOptionsTest303
     @tc.desc 测试时间选项对象的属性检查
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName: string = 'builtinsDateTimeFormatOptionsTest303';
      console.info(`${caseName}, test start`);
      let options: Intl.DateTimeFormatOptions = {
        hour: 'numeric',
        minute: 'numeric',
        second: 'numeric'
      };
      let propertyCount: number = Object.keys(options).length;
      expect(propertyCount).assertEqual(20);
      console.info(`${caseName}, test end`);
      Done();
    })



    /**
     @tc.number builtinsDateTimeFormatOptionsTest304
     @tc.name builtinsDateTimeFormatOptionsTest304
     @tc.desc 测试复杂选项对象的属性检查
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName: string = 'builtinsDateTimeFormatOptionsTest304';
      console.info(`${caseName}, test start`);
      let options: Intl.DateTimeFormatOptions = {
        year: 'numeric',
        month: 'short',
        day: '2-digit',
        weekday: 'long',
        hour: 'numeric',
        minute: '2-digit',
        timeZone: 'Asia/Shanghai',
        hour12: true
      };
      let propertyCount: number = Object.keys(options).length;
      expect(propertyCount).assertEqual(20);
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest305
     @tc.name builtinsDateTimeFormatOptionsTest305
     @tc.desc 测试undefined选项的处理
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName: string = 'builtinsDateTimeFormatOptionsTest305';
      console.info(`${caseName}, test start`);
      let options: Intl.DateTimeFormatOptions | undefined = undefined;
      let dateTimeFormat: Intl.DateTimeFormat = new Intl.DateTimeFormat('en-US', options);
      expect(dateTimeFormat).not().assertEqual(undefined);
      let result: string = dateTimeFormat.resolvedOptions().locale;
      expect(result).assertEqual('en-US');
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest400
     @tc.name builtinsDateTimeFormatOptionsTest400
     @tc.desc public toString(): string 测试默认实例
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest400';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.toString();
      expect(typeof result === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest401
     @tc.name builtinsDateTimeFormatOptionsTest401
     @tc.desc public toString(): string 测试带选项实例
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest401';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { year: 'numeric', month: 'long' });
      let result = dateTimeFormat.toString();
      expect(typeof result === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest402
     @tc.name builtinsDateTimeFormatOptionsTest402
     @tc.desc public toString(): string 测试不同区域设置实例
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest402';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.toString();
      expect(typeof result === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest403
     @tc.name builtinsDateTimeFormatOptionsTest403
     @tc.desc public toString(): string 测试时区实例
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest403';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { timeZone: 'UTC' });
      let result = dateTimeFormat.toString();
      expect(typeof result === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest404
     @tc.name builtinsDateTimeFormatOptionsTest404
     @tc.desc public toString(): string 测试完整选项实例
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest404';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        weekday: 'short',
        hour: 'numeric',
        minute: 'numeric',
        timeZone: 'America/New_York'
      });
      let result = dateTimeFormat.toString();
      expect(typeof result === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest405
     @tc.name builtinsDateTimeFormatOptionsTest405
     @tc.desc public toString(): string 测试样式选项实例
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest405';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US', { dateStyle: 'full', timeStyle: 'long' });
      let result = dateTimeFormat.toString();
      expect(typeof result === 'string').assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest406
     @tc.name builtinsDateTimeFormatOptionsTest406
     @tc.desc public toString(): string 测试返回值非空
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest406';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result = dateTimeFormat.toString();
      expect(result.length > 0).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })

    /**
     @tc.number builtinsDateTimeFormatOptionsTest407
     @tc.name builtinsDateTimeFormatOptionsTest407
     @tc.desc public toString(): string 测试多次调用
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level1
     */
    it('builtinsDateTimeFormatOptionsTest407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsDateTimeFormatOptionsTest407';
      console.info(`${caseName}, test start`);
      let dateTimeFormat = new Intl.DateTimeFormat('en-US');
      let result1 = dateTimeFormat.toString();
      let result2 = dateTimeFormat.toString();
      expect(result1 === result2).assertTrue();
      console.info(`${caseName}, test end`);
      Done();
    })



  }
  )}