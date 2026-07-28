'use static';
import { afterAll, afterEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils, { sleep } from '../Utils.test';

class AsyncMethodClass {
  private value: int = 10;

  async getValue(): Promise<int> {
    return await Promise.resolve(this.value);
  }

  async addValue(num: number): Promise<number> {
    const current = await this.getValue();
    return await Promise.resolve(current + num);
  }

  async getInfo(): Promise<InfoResult> {
    const val = await this.getValue();
    const result: InfoResult = {
      value: val,
      doubled: val * 2
    };
    return await Promise.resolve(result);
  }

  async processValue(multiplier: number): Promise<number> {
    const added = await this.addValue(5);
    return await Promise.resolve(added * multiplier);
  }
}

class AsyncStaticClass {
  private static readonly defaultValue: int = 100;

  static async getDefault(): Promise<int> {
    return await Promise.resolve(AsyncStaticClass.defaultValue);
  }

  static async calculate(a: number, b: number): Promise<number> {
    const base = await AsyncStaticClass.getDefault();
    return await Promise.resolve(base + a + b);
  }

  static async wrapValue<T>(value: T): Promise<GenericResult<T>> {
    const result: GenericResult<T> = {
      data: value,
      type: typeof value
    };
    return await Promise.resolve(result);
  }

  static async processArray(numbers: number[]): Promise<number[]> {
    const promises = numbers.map(async (num: number): Promise<number> => {
      return await Promise.resolve(num * 2);
    });
    const results = await Promise.all(promises);
    return results;
  }
}

class BaseAsyncClass {
  protected value: number = 50;

  protected async getProtectedValue(): Promise<number> {
    return await Promise.resolve(this.value);
  }

  protected async processProtected(multiplier: number): Promise<number> {
    const val = await this.getProtectedValue();
    return await Promise.resolve(val * multiplier);
  }

  async getProcessedValue(multiplier: number): Promise<number> {
    return await this.processProtected(multiplier);
  }
}

class DerivedAsyncClass extends BaseAsyncClass {
  private secretValue: int = 25;

  private async getSecretValue(): Promise<int> {
    return await Promise.resolve(this.secretValue);
  }

  private async combineValues(): Promise<number> {
    const protectedVal = await this.getProtectedValue();
    const secretVal = await this.getSecretValue();
    return await Promise.resolve(protectedVal + secretVal);
  }

  async getCombinedResult(): Promise<number> {
    return await this.combineValues();
  }

  protected async processProtected(multiplier: number): Promise<number> {
    const combined = await this.combineValues();
    return await Promise.resolve(combined * multiplier);
  }
}

class GenericProcessor<T> {
  async process(input: T): Promise<Awaited<T>> {
    return await Promise.resolve(input);
  }

  async processArray(inputs: T[]): Promise<Awaited<T>[]> {
    const promises = inputs.map(async (input: T): Promise<Awaited<T>> => {
      return await this.process(input);
    });
    return await Promise.all(promises);
  }
}

class AsyncClass {
  async validMethod(): Promise<boolean> {
    return await Promise.resolve(true);
  }

  static async validStaticMethod(): Promise<string> {
    return await Promise.resolve('static_result');
  }
}

class AsyncDataProcessor {
  private data: number[] = [];

  async loadData(source: number[]): Promise<void> {
    const validatedData = await this.validateData(source);
    this.data = validatedData;
  }

  private async validateData(input: number[]): Promise<number[]> {
    const step1 = await this.filterValidNumbers(input);
    const step2 = await this.normalizeNumbers(step1);
    return step2;
  }

  private async filterValidNumbers(numbers: number[]): Promise<number[]> {
    const filterPromises = numbers.map(async (num: number): Promise<number | null> => {
      const isValid = await Promise.resolve(num > 0 && num < 1000);
      return isValid ? num : null;
    });

    const results = await Promise.all(filterPromises);
    const validNumbers: number[] = [];
    for (const num of results) {
      if (num !== null) {
        validNumbers.push(num);
      }
    }
    return validNumbers;
  }

  private async normalizeNumbers(numbers: number[]): Promise<number[]> {
    return await Promise.all(numbers.map(async (num: number): Promise<number> => {
      return await Promise.resolve(Math.round(num));
    }));
  }

  async processData(): Promise<ProcessedData> {
    if (this.data.length === 0) {
      throw new Error('No data loaded');
    }

    const sum = await this.calculateSum();
    const average = await this.calculateAverage();
    const processed = await this.transformData();

    const result: ProcessedData = {
      status: 'success',
      data: processed
    };
    return result;
  }

  private async calculateSum(): Promise<number> {
    return await Promise.resolve(this.data.reduce((sum, num) => sum + num, 0.));
  }

  private async calculateAverage(): Promise<number> {
    const sum: number = await this.calculateSum();
    return await Promise.resolve(sum / this.data.length);
  }

  private async transformData(): Promise<number[]> {
    return await Promise.all(this.data.map(async (num: number): Promise<number> => {
      const multiplied = await Promise.resolve(num * 2);
      const adjusted = await Promise.resolve(multiplied + 1);
      return adjusted;
    }));
  }
}


interface InfoResult {
  value: number;
  doubled: number;
}

interface ProcessedData {
  status: string;
  data: number[];
}

interface ComplexResult {
  processed: boolean;
  value: number;
}

interface GenericResult<T> {
  data: T;
  type: string;
}

interface UserInfo {
  name: string;
  age: number;
}

interface UserProfile {
  name: string;
}

interface UserData {
  id: number;
  profile: UserProfile;
}

interface NestedUser {
  user: UserData;
}

interface FilterResult {
  value: number;
  keep: boolean;
}

interface ComplexUserProfile extends HasIdAndName {
  email: string;
  age?: number;
}

interface ProductInfo {
  id: number;
  name: string;
  price: number;
  category: string;
  tags: string[];
}

interface HasId {
  id: number;
}

interface HasName {
  name: string;
}

interface HasIdAndName extends HasId, HasName {}

interface ProcessContext {
  prefix: string;
  suffix: string;
}

interface ItemWithId extends HasId {
  data: string;
}

interface ItemWithName extends HasName {
  value: number;
}

interface ItemWithBoth extends HasIdAndName {
  extra: boolean;
}

interface ConditionalResult {
  type: string;
  value: string;
  length: number;
}

interface UserSettings {
  theme: string;
  notifications: boolean;
}

interface ValidationResult {
  isValid: boolean;
  errors: string[];
}


interface TypedItem extends HasId {
  type: string;
}

interface StatusItem extends HasId {
  status: string;
}

interface UserWithProfile extends UserInfo {
  id: number;
  email: string;
}


interface UserProfileNested {
  name: string;
  settings: UserSettings;
}

interface UserMetadata {
  createdAt: string;
  lastLogin: string;
}

interface UserDataNested {
  profile: UserProfileNested;
  metadata: UserMetadata;
}

interface NestedReturnData {
  user: UserDataNested;
  permissions: string[];
}

interface MetaInfo {
  timestamp: number;
  version: string;
}

interface GenericReturnWrapper<T> {
  data: T;
  meta: MetaInfo;
}

interface SummaryInfo {
  total: number;
  average: number;
  max: number;
  min: number;
}

interface ArrayReturnResult {
  items: number[];
  summary: SummaryInfo;
}

interface TypedArrayResult<T> {
  elements: T[];
  count: number;
  type: string;
}

interface NullableResult<T> {
  value: T | null;
  hasValue: boolean;
}

interface UndefinedResult<T> {
  value: T | undefined;
  isPresent: boolean;
}

interface EmptyDataResult {
  items: string[];
  metadata: Record<string, string>;
  isEmpty: boolean;
}

interface Level3Data {
  data: string[];
  count: number;
}

interface Level2Data {
  level3: Level3Data;
  metadata: string;
}

interface Level1Data {
  level2: Level2Data;
  summary: string;
}

interface NestedDataStructure {
  level1: Level1Data;
  status: string;
}

interface UserGroups {
  active: UserInfo[];
  inactive: UserInfo[];
}

interface TestObj {
  id: number;
  val: string;
}

interface SettingsData {
  global: Record<string, boolean>;
  user: Record<string, string>;
}

interface StatisticsData {
  totalUsers: number;
  activeCount: number;
  lastUpdate: string;
}

interface ProcessConfig {
  prefix: string;
  multiplier: number;
  uppercase: boolean;
}


interface ComplexNestedStructure {
  users: UserGroups;
  settings: SettingsData;
  statistics: StatisticsData;
}

interface DefaultConfig {
  timeout: number;
  retries: number;
}


async function helperGenericReturn<T>(value: T): Promise<Awaited<T>> {
  return await Promise.resolve(value);
}

async function helperGenericTransform<T, U>(value: T, transformer: (input: T) => U): Promise<Awaited<U>> {
  const transformed = transformer(value);
  return await Promise.resolve(transformed);
}

async function helperGenericArrayProcess<T>(items: T[]): Promise<Awaited<T>[]> {
  const promises = items.map(async (item: T): Promise<Awaited<T>> => {
    return await Promise.resolve(item);
  });
  const processed = await Promise.all(promises);
  return processed;
}

async function helperGenericOptional<T>(value: T | null): Promise<Awaited<T | null>> {
  if (value === null) {
    return null;
  }
  return await Promise.resolve(value);
}

async function helperGenericConstrained<T extends string | number>(value: T): Promise<Awaited<T>> {
  return await Promise.resolve(value);
}

async function helperGenericMultiple<T, U, V>(
  first: T,
  second: U,
  combiner: (a: T, b: U) => V
): Promise<Awaited<V>> {
  const result = combiner(first, second);
  return await Promise.resolve(result);
}

async function validateArrayLength0043<T>(arr: T[], minLength: number, maxLength: number): Promise<boolean> {
  const isValid = arr.length >= minLength && arr.length <= maxLength;
  return await Promise.resolve(isValid);
}

async function processWithSyncCallback0044<T, R>(
  data: T[],
  processor: (item: T) => R
): Promise<R[]> {
  const results: R[] = [];
  for (const item of data) {
    const processed = processor(item);
    results.push(processed);
  }
  return await Promise.resolve(results);
}

async function processWithAsyncCallback0044<T, R>(
  data: T[],
  processor: (item: T) => Promise<R>
): Promise<Awaited<R>[]> {
  const results: Awaited<R>[] = [];
  for (const item of data) {
    results.push(await processor(item));
  }
  return results;
}

async function processWithValidation0045<T>(
  data: T[],
  validator: (item: T) => boolean,
  processor: (item: T) => Promise<T>
): Promise<Awaited<T>[]> {
  const validItems = data.filter((item: T): boolean => validator(item));
  const results: Awaited<T>[] = [];
  for (const item of validItems) {
    results.push(await processor(item));
  }
  return results;
}

async function processWithComplexCallback0046<T, U, R>(
  data: T[],
  context: U,
  processor: (item: T, ctx: U, index: number) => Promise<R>
): Promise<R[]> {
  const results: R[] = [];
  for (let i = 0; i < data.length; i++) {
    results.push((await processor(data[i as int], context, i)) as R);
  }
  return results;
}

async function processWithId0047<T extends HasId>(item: T): Promise<string> {
  return await Promise.resolve(`Item_${item.id}`);
}

async function processWithName0047<T extends HasName>(item: T): Promise<string> {
  return await Promise.resolve(`Name_${item.name}`);
}

async function processWithIdAndName0048<T extends HasIdAndName>(item: T): Promise<string> {
  return await Promise.resolve(`${item.name}_ID_${item.id}`);
}

async function processArrayWithConstraint0048<T extends HasId>(items: T[]): Promise<number[]> {
  const results: number[] = [];
  for (const item of items) {
    results.push(item.id * 2);
  }
  return results;
}

async function processConditionally0049<T extends HasId>(
  item: T,
  condition: (obj: T) => boolean
): Promise<T | null> {
  if (condition(item)) {
    return (await Promise.resolve(item)) as T;
  }
  return await Promise.resolve(null);
}

function highIdCondition0049(obj: HasId): boolean {
  return obj.id > 150;
}

async function processWithId0049<T extends HasId>(item: T): Promise<string> {
  return await Promise.resolve(`Item_${item.id}`);
}

async function processWithName0049<T extends HasName>(item: T): Promise<string> {
  return await Promise.resolve(`Name_${item.name}`);
}

async function processWithIdAndName0049<T extends HasIdAndName>(item: T): Promise<string> {
  return await Promise.resolve(`${item.name}_ID_${item.id}`);
}

async function genericReturn0054<T>(value: T): Promise<T> {
  return (await Promise.resolve(value)) as T;
}

async function genericWrapperReturn0054<T>(data: T): Promise<GenericReturnWrapper<T>> {
  const metaInfo: MetaInfo = {
    timestamp: Date.now(),
    version: '1.0.0'
  };
  const wrapper: GenericReturnWrapper<T> = {
    data: data,
    meta: metaInfo
  };
  return await Promise.resolve(wrapper);
}

async function genericArrayReturn0054<T>(items: T[]): Promise<TypedArrayResult<T>> {
  const result: TypedArrayResult<T> = {
    elements: items,
    count: items.length,
    type: typeof items[0]
  };
  return await Promise.resolve(result);
}

async function returnNullableResult0060<T>(value: T | null): Promise<NullableResult<T>> {
  const result: NullableResult<T> = {
    value: value,
    hasValue: value !== null
  };
  return await Promise.resolve(result);
}

async function returnUndefinedResult0063<T>(value: T | undefined): Promise<UndefinedResult<T>> {
  const result: UndefinedResult<T> = {
    value: value,
    isPresent: value !== undefined
  };
  return await Promise.resolve(result);
}

async function wrapInAsync0080<T>(item: T): Promise<T> {
  const result = await Promise.resolve(item);
  return result as T;
}

type StringOrNumber = string | number;
type ProcessingMode = 'sync' | 'async' | 'batch';

export default function asyncFirTest(): void {
  describe('asyncFirTest', (): void => {
    afterEach((): void => { })

    afterAll((): void => {
    })

    /**
     * @tc.name   asyncFirTest0001
     * @tc.number ASYNC_FIR_TEST_0001
     * @tc.desc   Must explicitly declare async to use await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const validAsyncFunction = async (): Promise<int> => {
        return await Promise.resolve(42);
      };

      const validAsyncArrow = async (): Promise<string> => {
        return await Promise.resolve('test');
      };

      const result1 = await validAsyncFunction();
      const result2 = await validAsyncArrow();

      expect(result1).assertEqual(42);
      expect(result2).assertEqual('test');
    });

    /**
     * @tc.name   asyncFirTest0002
     * @tc.number ASYNC_FIR_TEST_0002
     * @tc.desc   Regular arrow function async syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const basicAsyncArrow = async (): Promise<string> => {
        return await Promise.resolve('basic');
      };

      const paramAsyncArrow = async (value: int): Promise<int> => {
        return await Promise.resolve(value * 2);
      };

      const typedAsyncArrow = async (str: string): Promise<string> => {
        return await Promise.resolve(str.toUpperCase());
      };

      const result1 = await basicAsyncArrow();
      const result2 = await paramAsyncArrow(5);
      const result3 = await typedAsyncArrow('hello');

      expect(result1).assertEqual('basic');
      expect(result2).assertEqual(10);
      expect(result3).assertEqual('HELLO');
    });

    /**
     * @tc.name   asyncFirTest0003
     * @tc.number ASYNC_FIR_TEST_0003
     * @tc.desc   Immediately invoked async arrow function syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result1 = await (async (): Promise<string> => {
        return await Promise.resolve('iife1');
      })();

      const result2 = await (async (num: int): Promise<int> => {
        return await Promise.resolve(num + 10);
      })(5);

      const result3 = await (async (data: string[]): Promise<number> => {
        const promises = data.map(async (item: string): Promise<int> => {
          return await Promise.resolve(item.length);
        });
        const processed = await Promise.all(promises);
        return processed.reduce((sum: number, len: int) => sum + len, 0);
      })(['hello', 'world']);

      expect(result1).assertEqual('iife1');
      expect(result2).assertEqual(15);
      expect(result3).assertEqual(10);
    });

    /**
     * @tc.name   asyncFirTest0004
     * @tc.number ASYNC_FIR_TEST_0004
     * @tc.desc   Class instance method async syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const instance = new AsyncMethodClass();

      const result1 = await instance.getValue();
      const result2 = await instance.addValue(20);
      const result3 = await instance.getInfo();
      const result4 = await instance.processValue(3);

      expect(result1).assertEqual(10);
      expect(result2).assertEqual(30);
      expect(result3.value).assertEqual(10);
      expect(result3.doubled).assertEqual(20);
      expect(result4).assertEqual(45);
    });

    /**
     * @tc.name   asyncFirTest0005
     * @tc.number ASYNC_FIR_TEST_0005
     * @tc.desc   Class static method async syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result1 = await AsyncStaticClass.getDefault();
      const result2 = await AsyncStaticClass.calculate(10, 20);
      const result3 = await AsyncStaticClass.wrapValue<string>('test');
      const result4 = await AsyncStaticClass.processArray([1, 2, 3]);

      expect(result1).assertEqual(100);
      expect(result2).assertEqual(130);
      expect(result3.data).assertEqual('test');
      expect(typeof result3.type).assertEqual('string');
      let res: number[] = [2, 4, 6]
      expect(result4).assertDeepEquals(res);
    });

    /**
     * @tc.name   asyncFirTest0006
     * @tc.number ASYNC_FIR_TEST_0006
     * @tc.desc   Class private and protected async method syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const base = new BaseAsyncClass();
      const derived = new DerivedAsyncClass();

      const result1 = await base.getProcessedValue(2);
      const result2 = await derived.getCombinedResult();
      const result3 = await derived.getProcessedValue(3);

      expect(result1).assertEqual(100);
      expect(result2).assertEqual(75);
      expect(result3).assertEqual(225);
    });

    /**
     * @tc.name   asyncFirTest0007
     * @tc.number ASYNC_FIR_TEST_0007
     * @tc.desc   Generic async function basic syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const stringResult = await helperGenericReturn<string>('test');
      const numberResult = await helperGenericReturn<number>(42);
      const booleanResult = await helperGenericReturn<boolean>(true);

      expect(stringResult).assertEqual('test');
      expect(typeof stringResult).assertEqual('string');
      expect(numberResult).assertEqual(42);
      expect(typeof numberResult).assertEqual('number');
      expect(booleanResult).assertEqual(true);
      expect(typeof booleanResult).assertEqual('boolean');

      const transformResult1 =
        await helperGenericTransform<string, number>('hello', (str: string): number => str.length);
      const transformResult2 =
        await helperGenericTransform<number, string>(123, (num: number): string => num.toString());

      expect(transformResult1).assertEqual(5);
      expect(typeof transformResult1).assertEqual('number');
      expect(transformResult2).assertEqual('123');
      expect(typeof transformResult2).assertEqual('string');
    });

    /**
     * @tc.name   asyncFirTest0008
     * @tc.number ASYNC_FIR_TEST_0008
     * @tc.desc   Generic async function array and optional parameter validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const arrayResult1 = await helperGenericArrayProcess<number>([1, 2, 3]);
      const arrayResult2 = await helperGenericArrayProcess<string>(['a', 'b', 'c']);

      let res: number[] = [1, 2, 3]
      expect(arrayResult1).assertDeepEquals(res);
      expect(arrayResult2).assertDeepEquals(['a', 'b', 'c']);

      const optionalResult1 = await helperGenericOptional<string>('value');
      const optionalResult2 = await helperGenericOptional<string>(null);

      expect(optionalResult1).assertEqual('value');
      expect(optionalResult2).assertEqual(null);

      const constrainedResult1 = await helperGenericConstrained<string>('constrained');
      const constrainedResult2 = await helperGenericConstrained<number>(100);

      expect(constrainedResult1).assertEqual('constrained');
      expect(constrainedResult2).assertEqual(100);
    });

    /**
     * @tc.name   asyncFirTest0009
     * @tc.number ASYNC_FIR_TEST_0009
     * @tc.desc   Generic async class methods and multiple parameters validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const multipleResult = await helperGenericMultiple<string, number, string>(
        'Count: ',
        5,
        (str: string, num: number): string => str + num.toString()
      );

      expect(multipleResult).assertEqual('Count: 5');

      const stringProcessor = new GenericProcessor<string>();
      const numberProcessor = new GenericProcessor<number>();

      const classResult1 = await stringProcessor.process('class_test');
      const classResult2 = await numberProcessor.processArray([10, 20, 30]);

      expect(classResult1).assertEqual('class_test');
      let res: number[] = [10, 20, 30]
      expect(classResult2).assertDeepEquals(res);
    });
    /**
     * @tc.name   asyncFirTest0010
     * @tc.number ASYNC_FIR_TEST_0010
     * @tc.desc   Async function returns primitive values wrapped as Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const returnNumber = async (): Promise<number> => {
        return 42.0;
      };

      const returnString = async (): Promise<string> => {
        return 'hello';
      };

      const returnBoolean = async (): Promise<boolean> => {
        return true;
      };

      const returnBigInt = async (): Promise<bigint> => {
        return 100n;
      };

      const returnNull = async (): Promise<null> => {
        return null;
      };

      const returnUndefined = async (): Promise<undefined> => {
        return undefined;
      };

      const result1 = returnNumber();
      const result2 = returnString();
      const result3 = returnBoolean();
      const result4 = returnBigInt();
      const result5 = returnNull();
      const result6 = returnUndefined();

      expect(result1 instanceof Promise).assertEqual(true);
      expect(result2 instanceof Promise).assertEqual(true);
      expect(result3 instanceof Promise).assertEqual(true);
      expect(result4 instanceof Promise).assertEqual(true);
      expect(result5 instanceof Promise).assertEqual(true);
      expect(result6 instanceof Promise).assertEqual(true);

      expect(await result1).assertEqual(42);
      expect(await result2).assertEqual('hello');
      expect(await result3).assertEqual(true);
      expect(await result4).assertEqual(100n);
      expect(await result5).assertEqual(null);
      expect(await result6).assertEqual(undefined);
    });

    /**
     * @tc.name   asyncFirTest0011
     * @tc.number ASYNC_FIR_TEST_0011
     * @tc.desc   Async function returns objects and arrays wrapped as Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const returnObject = async (): Promise<UserInfo> => {
        const obj: UserInfo = { name: 'John', age: 30 };
        return obj;
      };

      const returnArray = async (): Promise<int[]> => {
        return [1, 2, 3, 4, 5];
      };

      const returnNestedObject = async (): Promise<NestedUser> => {
        const profile: UserProfile = { name: 'Alice' };
        const userData: UserData = {
          id: 1,
          profile: profile
        };
        const nested: NestedUser = {
          user: userData
        };
        return nested;
      };

      const returnMap = async (): Promise<Map<string, number>> => {
        const map = new Map<string, number>();
        map.set('a', 1);
        map.set('b', 2);
        return map;
      };

      const returnSet = async (): Promise<Set<string>> => {
        const set = new Set<string>();
        set.add('x');
        set.add('y');
        return set;
      };

      const returnDate = async (): Promise<Date> => {
        return new Date('2024-01-01');
      };

      const result1 = returnObject();
      const result2 = returnArray();
      const result3 = returnNestedObject();
      const result4 = returnMap();
      const result5 = returnSet();
      const result6 = returnDate();

      expect(result1 instanceof Promise).assertEqual(true);
      expect(result2 instanceof Promise).assertEqual(true);
      expect(result3 instanceof Promise).assertEqual(true);
      expect(result4 instanceof Promise).assertEqual(true);
      expect(result5 instanceof Promise).assertEqual(true);
      expect(result6 instanceof Promise).assertEqual(true);

      const obj = await result1;
      expect(obj.name).assertEqual('John');
      expect(obj.age).assertEqual(30);

      const arr = await result2;
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);

      const nested = await result3;
      expect(nested.user.profile.name).assertEqual('Alice');

      const map = await result4;
      expect(map.get('a')).assertEqual(1);
      expect(map.get('b')).assertEqual(2);

      const set = await result5;
      expect(set.has('x')).assertEqual(true);
      expect(set.has('y')).assertEqual(true);

      const date = await result6;
      expect(date instanceof Date).assertEqual(true);
    });

    /**
     * @tc.name   asyncFirTest0012
     * @tc.number ASYNC_FIR_TEST_0012
     * @tc.desc   Async function with no return statement returns Promise<undefined>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const noReturn = async (): Promise<void> => {
        const temp: int = 42;
        const result: int = temp * 2;
      };

      const emptyReturn = async (): Promise<void> => {
        const value = 'test';
        return;
      };

      const conditionalReturn = async (shouldReturn: boolean): Promise<string | undefined> => {
        if (shouldReturn) {
          return 'returned';
        }
        return undefined;
      };

      const asyncOperationsNoReturn = async (): Promise<void> => {
        await Promise.resolve(10);
        await Promise.resolve('test');
      };

      const result1 = noReturn();
      const result2 = emptyReturn();
      const result3 = conditionalReturn(false);
      const result4 = asyncOperationsNoReturn();

      expect(result1 instanceof Promise).assertEqual(true);
      expect(result2 instanceof Promise).assertEqual(true);
      expect(result3 instanceof Promise).assertEqual(true);
      expect(result4 instanceof Promise).assertEqual(true);

      expect(await result1).assertEqual(undefined);
      expect(await result2).assertEqual(undefined);
      expect(await result3).assertEqual(undefined);
      expect(await result4).assertEqual(undefined);

      const result5 = await conditionalReturn(true);
      expect(result5).assertEqual('returned');
    });

    /**
     * @tc.name   asyncFirTest0013
     * @tc.number ASYNC_FIR_TEST_0013
     * @tc.desc   Async function returns resolved Promise compatibility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnResolvedPromise = async (): Promise<int> => {
        return Promise.resolve(100);
      };

      const returnChainedPromise = async (): Promise<string> => {
        return Promise.resolve('initial')
          .then((val: string) => val + '_processed')
          .then((val: string) => val + '_final');
      };

      const returnResolvedObject = async (): Promise<ProcessedData> => {
        const data: ProcessedData = {
          status: 'success',
          data: [1, 2, 3]
        };
        return Promise.resolve(data);
      };

      const returnNestedResolved = async (): Promise<int> => {
        const innerPromise = Promise.resolve(50);
        return innerPromise;
      };

      const awaitAndReturnResolved = async (): Promise<boolean> => {
        const resolved = await Promise.resolve(true);
        return Promise.resolve(resolved);
      };

      const result1 = returnResolvedPromise();
      const result2 = returnChainedPromise();
      const result3 = returnResolvedObject();
      const result4 = returnNestedResolved();
      const result5 = awaitAndReturnResolved();

      expect(result1 instanceof Promise).assertEqual(true);
      expect(result2 instanceof Promise).assertEqual(true);
      expect(result3 instanceof Promise).assertEqual(true);
      expect(result4 instanceof Promise).assertEqual(true);
      expect(result5 instanceof Promise).assertEqual(true);

      expect(await result1).assertEqual(100);
      expect(await result2).assertEqual('initial_processed_final');

      const obj = await result3;
      expect(obj.status).assertEqual('success');
      let res: number[] = [1, 2, 3]
      expect(obj.data).assertDeepEquals(res);

      expect(await result4).assertEqual(50);
      expect(await result5).assertEqual(true);
    });

    /**
     * @tc.name   asyncFirTest0014
     * @tc.number ASYNC_FIR_TEST_0014
     * @tc.desc   Async function returns basic pending Promise compatibility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnPendingPromise = async (): Promise<string> => {
        return new Promise<string>((resolve: (value: string) => void) => {
          setTimeout(() => resolve('delayed_result'), 100);
        });
      };

      const returnAsyncOperation = async (): Promise<number> => {
        return new Promise<number>((resolve: (value: number) => void) => {
          setTimeout(() => {
            const calculation: int = 5 * 8 + 2;
            resolve(calculation);
          }, 100);
        });
      };

      const result1 = returnPendingPromise();
      const result2 = returnAsyncOperation();

      expect(result1 instanceof Promise).assertEqual(true);
      expect(result2 instanceof Promise).assertEqual(true);

      expect(await result1).assertEqual('delayed_result');
      expect(await result2).assertEqual(42);
    });

    /**
     * @tc.name   asyncFirTest0015
     * @tc.number ASYNC_FIR_TEST_0015
     * @tc.desc   Async function returns pending Promise with rejection handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnPendingWithPossibleReject = async (shouldReject: boolean): Promise<string> => {
        return new Promise<string>((resolve: (value: string) => void, reject: (reason: Error) => void) => {
          setTimeout(() => {
            if (shouldReject) {
              reject(new Error('Intentional rejection'));
            } else {
              resolve('success_result');
            }
          }, 100);
        });
      };

      const result3 = returnPendingWithPossibleReject(false);
      expect(result3 instanceof Promise).assertEqual(true);
      expect(await result3).assertEqual('success_result');

      let rejectionCaught = false;
      try {
        await returnPendingWithPossibleReject(true);
      } catch (error) {
        rejectionCaught = true;
        expect((error as Error).message).assertEqual('Intentional rejection');
      }
      expect(rejectionCaught).assertEqual(true);
    });

    /**
     * @tc.name   asyncFirTest0016
     * @tc.number ASYNC_FIR_TEST_0016
     * @tc.desc   Async function returns chained and complex pending Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const returnChainedPending = async (): Promise<number> => {
        const firstPromise = new Promise<number>((resolve: (value: number) => void) => {
          setTimeout(() => resolve(10), 100);
        });

        return firstPromise.then((val: number) => {
          return new Promise<number>((resolve: (value: number) => void) => {
            setTimeout(() => resolve(val * 3), 100);
          });
        });
      };

      const returnComplexPending = async (): Promise<ComplexResult> => {
        return new Promise<ComplexResult>((resolve: (value: ComplexResult) => void) => {
          setTimeout(() => {
            const result: ComplexResult = {
              processed: true,
              value: Math.floor(Math.random() * 100) + 1
            };
            resolve(result);
          }, 120);
        });
      };

      const result4 = returnChainedPending();
      const result5 = returnComplexPending();

      expect(result4 instanceof Promise).assertEqual(true);
      expect(result5 instanceof Promise).assertEqual(true);

      expect(await result4).assertEqual(30);

      const complexResult = await result5;
      expect(complexResult.processed).assertEqual(true);
      expect(typeof complexResult.value).assertEqual('number');
      expect(complexResult.value).assertLarger(0);
      expect(complexResult.value).assertLessOrEqual(100);
    });

    /**
     * @tc.name   asyncFirTest0017
     * @tc.number ASYNC_FIR_TEST_0017
     * @tc.desc   Generic async function basic return type validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const stringResult = await helperGenericReturn<string>('test');
      const numberResult = await helperGenericReturn<number>(42);
      const booleanResult = await helperGenericReturn<boolean>(true);

      expect(stringResult).assertEqual('test');
      expect(typeof stringResult).assertEqual('string');
      expect(numberResult).assertEqual(42);
      expect(typeof numberResult).assertEqual('number');
      expect(booleanResult).assertEqual(true);
      expect(typeof booleanResult).assertEqual('boolean');

      const transformResult1 =
        await helperGenericTransform<string, number>('hello', (str: string): number => str.length);
      const transformResult2 =
        await helperGenericTransform<number, string>(123, (num: number): string => num.toString());

      expect(transformResult1).assertEqual(5);
      expect(typeof transformResult1).assertEqual('number');
      expect(transformResult2).assertEqual('123');
      expect(typeof transformResult2).assertEqual('string');
    });

    /**
     * @tc.name   asyncFirTest0018
     * @tc.number ASYNC_FIR_TEST_0018
     * @tc.desc   Generic async function array and optional return validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const arrayResult1 = await helperGenericArrayProcess<number>([1, 2, 3]);
      const arrayResult2 = await helperGenericArrayProcess<string>(['a', 'b', 'c']);

      let res: number[] = [1, 2, 3]
      expect(arrayResult1).assertDeepEquals(res);
      expect(arrayResult2).assertDeepEquals(['a', 'b', 'c']);

      const optionalResult1 = await helperGenericOptional<string>('value');
      const optionalResult2 = await helperGenericOptional<string>(null);

      expect(optionalResult1).assertEqual('value');
      expect(optionalResult2).assertEqual(null);

      const constrainedResult1 = await helperGenericConstrained<string>('constrained');
      const constrainedResult2 = await helperGenericConstrained<number>(100);

      expect(constrainedResult1).assertEqual('constrained');
      expect(constrainedResult2).assertEqual(100);
    });

    /**
     * @tc.name   asyncFirTest0019
     * @tc.number ASYNC_FIR_TEST_0019
     * @tc.desc   Generic async class methods and multiple parameter return validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const multipleResult = await helperGenericMultiple<string, number, string>(
        'Count: ',
        5,
        (str: string, num: number): string => str + num.toString()
      );

      expect(multipleResult).assertEqual('Count: 5');

      const stringProcessor = new GenericProcessor<string>();
      const numberProcessor = new GenericProcessor<number>();

      const classResult1 = await stringProcessor.process('class_test');
      const classResult2 = await numberProcessor.processArray([10, 20, 30]);

      expect(classResult1).assertEqual('class_test');
      let res: number[] = [10, 20, 30]
      expect(classResult2).assertDeepEquals(res);
    });

    /**
     * @tc.name   asyncFirTest0020
     * @tc.number ASYNC_FIR_TEST_0020
     * @tc.desc   await only works inside async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const validAsyncFunction = async (): Promise<string> => {
        const result = await Promise.resolve('valid_await');
        return result;
      };

      const validAsyncArrow = async (): Promise<int> => {
        return await Promise.resolve(42);
      };

      const result1 = await validAsyncFunction();
      const result2 = await validAsyncArrow();

      const instance = new AsyncClass();
      const result3 = await instance.validMethod();
      const result4 = await AsyncClass.validStaticMethod();

      expect(result1).assertEqual('valid_await');
      expect(result2).assertEqual(42);
      expect(result3).assertEqual(true);
      expect(result4).assertEqual('static_result');
    });

    /**
     * @tc.name   asyncFirTest0021
     * @tc.number ASYNC_FIR_TEST_0021
     * @tc.desc   Nested async functions with multi-level await usage validity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const level1Async = async (value: int): Promise<int> => {
        const level2Async = async (innerValue: int): Promise<int> => {
          const level3Async = async (deepValue: int): Promise<int> => {
            const step1 = await Promise.resolve(deepValue * 2);
            const step2 = await Promise.resolve(step1 + 10);
            const step3 = await Promise.resolve(step2 * 3);
            return step3;
          };

          const deepResult = await level3Async(innerValue);
          const level2Result = await Promise.resolve(deepResult + 5);
          return level2Result;
        };

        const nestedResult = await level2Async(value);
        const finalResult = await Promise.resolve(nestedResult + 1);
        return finalResult;
      };

      const result = await level1Async(3);
      expect(result).assertEqual(54);

      const conditionalNested = async (usePathA: boolean): Promise<string> => {
        const pathA = async (): Promise<string> => {
          const step1 = await Promise.resolve('A1');
          const step2 = await Promise.resolve(step1 + '_A2');
          return step2;
        };

        const pathB = async (): Promise<string> => {
          const step1 = await Promise.resolve('B1');
          const step2 = await Promise.resolve(step1 + '_B2');
          return step2;
        };

        if (usePathA) {
          return await pathA();
        } else {
          return await pathB();
        }
      };

      const resultA = await conditionalNested(true);
      const resultB = await conditionalNested(false);

      expect(resultA).assertEqual('A1_A2');
      expect(resultB).assertEqual('B1_B2');
    });

    /**
     * @tc.name   asyncFirTest0022
     * @tc.number ASYNC_FIR_TEST_0022
     * @tc.desc   Array map and filter with async/await syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testData = [1, 2, 3, 4, 5];

      const mapWithAsync = async (numbers: int[]): Promise<int[]> => {
        const promises = numbers.map(async (num: int): Promise<int> => {
          return await Promise.resolve(num * 2);
        });
        return await Promise.all(promises);
      };

      const filterWithAsync = async (numbers: int[]): Promise<number[]> => {
        const filterPromises = numbers.map(async (num: int): Promise<FilterResult> => {
          const shouldKeep = await Promise.resolve(num % 2 === 0);
          const result: FilterResult = { value: num, keep: shouldKeep };
          return result;
        });

        const filterResults = await Promise.all(filterPromises);
        return filterResults.filter((result: FilterResult) => result.keep).map((result: FilterResult) => result.value);
      };

      const mapResult = await mapWithAsync(testData);
      expect(mapResult).assertDeepEquals([2, 4, 6, 8, 10]);

      const filterResult = await filterWithAsync(testData);
      let res: number[] = [2, 4]
      expect(filterResult).assertDeepEquals(res);
    });

    /**
     * @tc.name   asyncFirTest0023
     * @tc.number ASYNC_FIR_TEST_0023
     * @tc.desc   Array reduce and forEach with async/await syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const testData = [1, 2, 3, 4, 5];

      const reduceWithAsync = async (numbers: int[]): Promise<int> => {
        let accumulator: int = 0;
        for (const num of numbers) {
          const processedValue: int = await Promise.resolve(num * 3);
          accumulator += processedValue;
        }
        return accumulator;
      };

      const forEachWithAsync = async (numbers: int[]): Promise<int[]> => {
        const results: int[] = [];
        const promises = numbers.map(async (num: int): Promise<void> => {
          const processed = await Promise.resolve(num + 10);
          results.push(processed);
        });
        await Promise.all(promises);
        return results.sort((a, b) => a - b);
      };

      const reduceResult = await reduceWithAsync(testData);
      expect(reduceResult).assertEqual(45);

      const forEachResult = await forEachWithAsync(testData);
      expect(forEachResult).assertDeepEquals([11, 12, 13, 14, 15]);
    });

    /**
     * @tc.name   asyncFirTest0024
     * @tc.number ASYNC_FIR_TEST_0024
     * @tc.desc   Nested array processing with async/await syntax validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const nestedArrayAsync = async (matrix: number[][]): Promise<number[]> => {
        const flattenPromises = matrix.map(async (row: number[]): Promise<number[]> => {
          return await Promise.all(row.map(async (cell: number): Promise<number> => {
            return await Promise.resolve(cell * cell);
          }));
        });
        const processedMatrix = await Promise.all(flattenPromises);
        const flatResult: number[] = [];
        for (const row of processedMatrix) {
          for (const num of row) {
            flatResult.push(num);
          }
        }
        return flatResult;
      };

      const matrix: number[][] = [[1, 2], [3, 4], [5, 6]];
      const flatResult = await nestedArrayAsync(matrix);
      expect(flatResult).assertDeepEquals([1.0, 4.0, 9.0, 16.0, 25.0, 36.0]);
    });

    /**
     * @tc.name   asyncFirTest0025
     * @tc.number ASYNC_FIR_TEST_0025
     * @tc.desc   Complex async class with nested methods validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asyncFirTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const processor = new AsyncDataProcessor();
      const sourceData = [1.5, 2.7, 3.2, 4.8, 5.1];
      await processor.loadData(sourceData);
      const result = await processor.processData();
      expect(result.status).assertEqual('success');
      let res: number[] = [5, 7, 7, 11, 11]
      expect(result.data).assertDeepEquals(res);

      const emptyProcessor = new AsyncDataProcessor();
      let errorCaught = false;
      try {
        await emptyProcessor.processData();
      } catch (error) {
        errorCaught = true;
        expect((error as Error).message).assertEqual('No data loaded');
      }
      expect(errorCaught).assertEqual(true);
    });

    /**
     * @tc.name   asyncFirTest0026
     * @tc.number ASYNC_FIR_TEST_0026
     * @tc.desc   Await with different Promise states and timing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const awaitImmediate = async (): Promise<string> => {
        const result = await Promise.resolve('immediate');
        return result;
      };

      const awaitDelayed = async (): Promise<string> => {
        const result = await new Promise<string>((resolve) => {
          setTimeout(() => resolve('delayed'), 500);
        });
        return result;
      };

      const awaitChained = async (): Promise<int> => {
        const result = await Promise.resolve(10)
          .then((val: int) => val * 2)
          .then((val: int) => val + 5)
          .then((val: int) => val * 3);
        return result;
      };

      const multipleAwaits = async (): Promise<string[]> => {
        const results: string[] = [];

        const first = await Promise.resolve('first');
        results.push(first);

        const second = await new Promise<string>((resolve) => {
          setTimeout(() => resolve('second'), 300);
        });
        results.push(second);

        const third = await Promise.resolve('third');
        results.push(third);

        return results;
      };

      const parallelAwaits = async (): Promise<string[]> => {
        const promises = [
          Promise.resolve('parallel1'),
          new Promise<string>((resolve) => {
            setTimeout(() => resolve('parallel2'), 200)
          }),
          Promise.resolve('parallel3')
        ];

        return await Promise.all(promises);
      };

      const immediateResult = await awaitImmediate();
      expect(immediateResult).assertEqual('immediate');

      const delayedResult = await awaitDelayed();
      expect(delayedResult).assertEqual('delayed');

      const chainedResult = await awaitChained();
      expect(chainedResult).assertEqual(75);

      const sequentialResults = await multipleAwaits();
      expect(sequentialResults).assertDeepEquals(['first', 'second', 'third']);

      const parallelResults = await parallelAwaits();
      expect(parallelResults).assertDeepEquals(['parallel1', 'parallel2', 'parallel3']);
    });

    /**
     * @tc.name   asyncFirTest0027
     * @tc.number ASYNC_FIR_TEST_0027
     * @tc.desc   Await with non-Promise values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const awaitNonPromise = async (): Promise<int> => {
        const result: int = 42;
        return result;
      };

      const awaitString = async (): Promise<string> => {
        const result = 'hello';
        return result;
      };

      const awaitObject = async (): Promise<UserInfo> => {
        const obj: UserInfo = { name: 'test', age: 25 };
        const result = obj;
        return result;
      };

      const awaitNull = async (): Promise<null> => {
        const result = null;
        return result;
      };

      const awaitUndefined = async (): Promise<undefined> => {
        const result = undefined;
        return result;
      };

      const mixedAwaits = async (): Promise<string[]> => {
        const results: string[] = [];

        const nonPromise = 'direct';
        results.push(nonPromise);

        const promise = await Promise.resolve('promise');
        results.push(promise);

        const transformed = await Promise.resolve('base').then((val: string) => val + '_transformed');
        results.push(transformed);

        return results;
      };

      const nonPromiseResult = await awaitNonPromise();
      expect(nonPromiseResult).assertEqual(42);

      const stringResult = await awaitString();
      expect(stringResult).assertEqual('hello');

      const objectResult = await awaitObject();
      expect(objectResult.name).assertEqual('test');
      expect(objectResult.age).assertEqual(25);

      const nullResult = await awaitNull();
      expect(nullResult).assertEqual(null);

      const undefinedResult = await awaitUndefined();
      expect(undefinedResult).assertEqual(undefined);

      const mixedResults = await mixedAwaits();
      expect(mixedResults).assertDeepEquals(['direct', 'promise', 'base_transformed']);
    });

    /**
     * @tc.name   asyncFirTest0028
     * @tc.number ASYNC_FIR_TEST_0028
     * @tc.desc   Basic type parameters consistency with TS annotations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('asyncFirTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const processString = async (input: string): Promise<string> => {
        return await Promise.resolve(input.toUpperCase());
      };

      const processNumber = async (input: int): Promise<int> => {
        return await Promise.resolve(input * 2);
      };

      const processBoolean = async (input: boolean): Promise<string> => {
        return await Promise.resolve(input ? 'true' : 'false');
      };

      const processBigInt = async (input: bigint): Promise<bigint> => {
        return await Promise.resolve(input + 1n);
      };

      const processMultiple = async (str: string, num: int, bool: boolean): Promise<string> => {
        const result = `${str}_${num}_${bool}`;
        return await Promise.resolve(result);
      };

      const stringResult = await processString('hello');
      expect(stringResult).assertEqual('HELLO');
      expect(typeof stringResult).assertEqual('string');

      const numberResult = await processNumber(21);
      expect(numberResult).assertEqual(42);

      const booleanResult = await processBoolean(true);
      expect(booleanResult).assertEqual('true');
      expect(typeof booleanResult).assertEqual('string');

      const bigintResult = await processBigInt(99n);
      expect(bigintResult).assertEqual(100n);
      expect(typeof bigintResult).assertEqual('bigint');

      const multipleResult = await processMultiple('test', 123, false);
      expect(multipleResult).assertEqual('test_123_false');
    });

    /**
     * @tc.name   asyncFirTest0029
     * @tc.number ASYNC_FIR_TEST_0029
     * @tc.desc   Boundary value validation for basic type parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const handleEmptyString = async (input: string): Promise<int> => {
        return await Promise.resolve(input.length);
      };

      const handleZero = async (input: int): Promise<boolean> => {
        return await Promise.resolve(input === 0);
      };

      const handleNaN = async (input: number): Promise<boolean> => {
        return await Promise.resolve(Number.isNaN(input));
      };

      const handleNull = async (input: string | null): Promise<string> => {
        return await Promise.resolve(input === null ? 'null_received' : input);
      };

      const handleUndefined = async (input: int | undefined): Promise<string> => {
        return await Promise.resolve(input === undefined ? 'undefined_received' : input.toString());
      };

      const handleExtremeNumbers = async (input: number): Promise<string> => {
        if (input === Number.MAX_SAFE_INTEGER) {
          return await Promise.resolve('max_safe_integer');
        } else if (input === Number.MIN_SAFE_INTEGER) {
          return await Promise.resolve('min_safe_integer');
        } else if (input === Infinity) {
          return await Promise.resolve('positive_infinity');
        } else if (input === -Infinity) {
          return await Promise.resolve('negative_infinity');
        }
        return await Promise.resolve('normal_number');
      };

      const emptyStringResult = await handleEmptyString('');
      expect(emptyStringResult).assertEqual(0);

      const zeroResult = await handleZero(0);
      expect(zeroResult).assertEqual(true);

      const nanResult = await handleNaN(NaN);
      expect(nanResult).assertEqual(true);

      const nullResult = await handleNull(null);
      expect(nullResult).assertEqual('null_received');

      const undefinedResult = await handleUndefined(undefined);
      expect(undefinedResult).assertEqual('undefined_received');

      const maxIntResult = await handleExtremeNumbers(Number.MAX_SAFE_INTEGER);
      expect(maxIntResult).assertEqual('max_safe_integer');

      const minIntResult = await handleExtremeNumbers(Number.MIN_SAFE_INTEGER);
      expect(minIntResult).assertEqual('min_safe_integer');

      const infinityResult = await handleExtremeNumbers(Infinity);
      expect(infinityResult).assertEqual('positive_infinity');

      const negInfinityResult = await handleExtremeNumbers(-Infinity);
      expect(negInfinityResult).assertEqual('negative_infinity');
    });

    /**
     * @tc.name   asyncFirTest0030
     * @tc.number ASYNC_FIR_TEST_0030
     * @tc.desc   Optional parameters default behavior validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processOptionalString = async (required: string, optional?: string): Promise<string> => {
        const optionalValue = optional || 'default_string';
        return await Promise.resolve(`${required}_${optionalValue}`);
      };

      const processOptionalNumber = async (base: int, multiplier?: int): Promise<int> => {
        const mult = multiplier ? multiplier : 1 || 1;
        return await Promise.resolve(base * mult);
      };

      const processOptionalBoolean = async (value: string, uppercase?: boolean): Promise<string> => {
        const shouldUppercase = uppercase || false;
        return await Promise.resolve(shouldUppercase ? value.toUpperCase() : value.toLowerCase());
      };

      const processMultipleOptional = async (
        required: string,
        opt1?: int,
        opt2?: boolean,
        opt3?: string
      ): Promise<string> => {
        const num = opt1 || 0;
        const bool = opt2 || false;
        const str = opt3 || 'default';
        return await Promise.resolve(`${required}_${num}_${bool}_${str}`);
      };

      const result1 = await processOptionalString('test');
      expect(result1).assertEqual('test_default_string');

      const result2 = await processOptionalNumber(5);
      expect(result2).assertEqual(5);

      const result3 = await processOptionalBoolean('Hello');
      expect(result3).assertEqual('hello');

      const result4 = await processOptionalString('test', 'provided');
      expect(result4).assertEqual('test_provided');

      const result5 = await processOptionalNumber(5, 3);
      expect(result5).assertEqual(15);

      const result6 = await processOptionalBoolean('Hello', true);
      expect(result6).assertEqual('HELLO');

      const result7 = await processMultipleOptional('base');
      expect(result7).assertEqual('base_0_false_default');

      const result8 = await processMultipleOptional('base', 10, true, 'custom');
      expect(result8).assertEqual('base_10_true_custom');

      const result9 = await processMultipleOptional('base', 5);
      expect(result9).assertEqual('base_5_false_default');
    });

    /**
     * @tc.name   asyncFirTest0031
     * @tc.number ASYNC_FIR_TEST_0031
     * @tc.desc   Default parameters validation for basic types, objects and arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncFirTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const processWithDefaults = async (
        name: string,
        count: number = 10,
        enabled: boolean = true,
        factor: number = 1.5
      ): Promise<string> => {
        return await Promise.resolve(`${name}_${count}_${enabled}_${factor}`);
      };

      const processWithDefaultObject = async (
        id: string,
        config: DefaultConfig = { timeout: 5000, retries: 3 }
      ): Promise<string> => {
        return await Promise.resolve(`${id}_${config.timeout}_${config.retries}`);
      };

      const processWithDefaultArray = async (
        prefix: string,
        items: string[] = ['default1', 'default2']
      ): Promise<string> => {
        return await Promise.resolve(`${prefix}_${items.join('_')}`);
      };

      const processWithMixedDefaults = async (
        base: string,
        num: number = 100,
        arr: number[] = [1, 2, 3],