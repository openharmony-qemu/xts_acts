/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, lang} from '@kit.ArkTS';
function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

interface Test3_Obj1 {
  value: string;
}

interface RootNestedReplaceObj {
  container: Test3_Obj1;
}

interface Test3_Obj3 {
  value: number;
}

interface Test3_Obj2 {
  container: Test3_Obj3;
}

interface TypePreserveObj {
  num: number;
  str: string;
  bool?: boolean;
  nil?: null;
}

interface Test6_Obj2 {
  c: number;
}

interface Test6_Obj1 {
  b: Test6_Obj2;
}

interface DeepKeyConflictObj {
  a: Test6_Obj1;
}

interface Test10_Obj2 {
  city: string;
  street?: string;
}

interface Test10_Obj1 {
  address: Test10_Obj2;
}

interface PathFilterObj {
  user: Test10_Obj1;
}

interface Test11_Obj1 {
  id: number;
  active: boolean;
}

interface ArrWithObj {
  items: Test11_Obj1[];
}

interface Test14_Obj1 {
  a: number;
  b: number;
}

interface Test14_Obj2 extends Test14_Obj1 {
  sum: number;
}

interface StrTruncateObj {
  short: string;
  long: string;
}

interface Test17_Obj1 {
  id: number;
  value: number;
}

interface FilteredObjArr {
  data: Test17_Obj1[];
}

interface Test19_Obj1 {
  level2: string;
}

interface NestedNewlineObj {
  level1: Test19_Obj1;
}

interface RenamePropObj {
  newKey: string;
}

interface Test20_Obj1 {
  oldKey: string;
}

interface Test20_Obj2 {
  temp: string;
}

type SpecialCharArr = (string | string[])[];

interface Test24_Obj1 {
  id: number;
}

interface EmptyObjFilter {
  valid: Test24_Obj1;
  empty?: Record<string, never>;
}

interface CharTypeCountCompare {
  strings: string[];
  typesCount: number[];
}

type Status = "active" | "inactive" | "pending";

interface StatusMapObj {
  status: Status;
}

interface Test27_Obj1 {
  status: number;
}

interface MultiLangObj {
  en: string;
  zh: string;
  ja: string;
}

interface ProductCompare {
  numbers: number[];
  product: number;
}

type NestedNumberArray = number | NestedNumberArray[];

interface SensitiveDataObj {
  username: string;
  password?: string;
  email: string;
}

interface Test35_Obj2 {
  token?: string;
  role: string;
}

interface Test35_Obj1 {
  name: string;
  auth: Test35_Obj2;
}

interface DeepSensitiveObj {
  user: Test35_Obj1;
}

interface Test37_Obj1 {
  id: number;
  name: string;
  age: number;
}

interface MergedObj {
  fullInfo: Test37_Obj1;
}

interface Test37_Obj2 {
  id: number;
  name: string;
  age: number;
}

interface Test39_Obj1 {
  event: string;
  time: number;
}

interface DateToTimestampObj {
  logs: Test39_Obj1[];
}

interface Test39_Obj3 {
  event: string;
  time: string;
}

interface Test39_Obj2 {
  logs: Test39_Obj3[];
}

interface ValidatedObj {
  score: number;
}

type UserMapArray = Map<string, string>[];

interface Test44_Obj1 {
  id: string;
  name: string;
}

interface Test45_Obj1 {
  id: number;
  name: string;
}

interface UniqueObjArr {
  items: Test45_Obj1[];
}

interface Test45_Obj2 {
  id: number;
}

interface EncryptedObj {
  username: string;
  email: string;
}

interface FrequencyObj {
  frequency: Record<number, number>;
}

interface Test50_Obj2 {
  key232: number;
}

interface Test50_Obj1 {
  key401: string;
  level2: Test50_Obj2;
}

interface DeepSpecialCharObj {
  level1: Test50_Obj1;
}

interface EmptyArrFilterObj {
  valid: number[];
  empty?: never[];
}

interface ExtractNumbersSumCompare {
  strings: string[];
  sum: number;
}

enum EnumStatus {
  Active = "ACTIVE",
  Inactive = "INACTIVE"
}

interface EnumMapObj {
  enumStatus: EnumStatus;
}

interface MultiPunctObj {
  en: string;
  de: string;
  fr: string;
}

interface PropLimitObj {
  a: number;
  b: number;
  c?: number;
}

interface MatrixObj {
  rows: number;
  cols: number;
  data: number[][];
}

interface LengthValidatedObj {
  codes: string[];
}

interface Test59_Obj2 {
  valid: string;
  empty?: Record<string, never>;
}

interface Test59_Obj1 {
  level2: Test59_Obj2;
}

interface DeepEmptyFilterObj {
  level1: Test59_Obj1;
}

interface Test60_Obj1 {
  id: number;
  name: string;
  password?: string;
}

interface ArrSensitiveObj {
  users: Test60_Obj1[];
}

interface Test61_Obj1 {
  id: number;
  name: string;
}

interface Test61_Obj2 {
  email: string;
}

interface RestructuredObj {
  user: Test61_Obj1;
  contact: Test61_Obj2;
}

interface NumToStringObj {
  a: string;
  b: string;
  c: string;
}

interface Test64_Obj3 {
  name: string;
  time: Date;
}

interface Test64_Obj2 {
  events: Test64_Obj3[];
}

interface DeepDateObj {
  logs: Test64_Obj2[];
}

interface FilteredArrObj {
  numbers: number[];
}

interface ISendable {
  num: number;
  str: string;
  bool: boolean;
  nil: null;
}

interface MaskedObj {
  phone: string;
  email: string;
}

interface StatsObj {
  data: number[];
  sum: number;
  avg: number;
  max: number;
}

type DeepSpecialArr = (string | string[][])[];

interface Test73_Obj2 {
  valid: number[];
  empty?: never[];
}

interface Test73_Obj1 {
  level2: Test73_Obj2[];
}

interface DeepEmptyArrFilterObj {
  level1: Test73_Obj1;
}

interface CircularSafeObj {
  name: string;
  parent?: CircularSafeObj;
}

interface MixedTypeKeyObj {
  a: string;
}

type MultiLangArr = (string | string[])[];

interface Test78_Obj2 {
  level3?: string;
}

interface Test78_Obj1 {
  level2: Test78_Obj2;
}

interface FirstGreaterCompare {
  numbers: number[];
  target: number;
  result: number | null;
}

interface TransposedMatrixObj {
  transposed: number[][];
}

interface StdDevCompare {
  numbers: number[];
  stdDev: number;
}

interface RemoveElementCompare {
  strings: string[];
  cleaned: string[];
}

interface SpecialNumFilterObj {
  nan: null;
  inf: null;
  normal: number;
}

interface Test83_Obj2 {
  inf: null;
  num: number;
}

interface Test83_Obj1 {
  nan: null;
  level2: Test83_Obj2;
}

interface DeepSpecialNumObj {
  level1: Test83_Obj1;
}

interface GradeConvertCompare {
  scores: number[];
  grades: string[];
}


interface StrLengthFilterObj {
  long: string;
  short?: string;
}

interface Test87_Obj2 {
  value: number;
}

interface Test87_Obj1 {
  items: Test87_Obj2[];
  total: number;
}

interface DeepAggregateObj {
  groups: Test87_Obj1[];
}

interface EmptyStrArrFilterObj {
  tags: string[];
}

interface PalindromeCheckCompare {
  strings: string[];
  isPalindrome: boolean[];
}

interface MaxSubarrayCompare {
  numbers: number[];
  maxSum: number;
}

interface SubstringConcatCompare {
  strings: string[];
  result: string;
}


interface KeywordArrObj {
  values: (boolean | null)[];
}

interface Test96_Obj2 {
  cxToAd: number;
}

interface Test96_Obj1 {
  axToBb: string;
  nested: Test96_Obj2;
}

interface MathSymbolObj {
  formulas: Test96_Obj1;
}

interface Test97_Obj1 {
  level2: string[];
}

interface DeepEmptyStrFilterObj {
  level1: Test97_Obj1[];
}

type NestedSetArr = (number | Set<number> | NestedSetArr)[];

enum Priority {
  Low = 1,
  Medium = 2,
  High = 3
}

interface Test99_Obj2 {
  name: string;
  priority: Priority;
}

interface PriorityMapObj {
  tasks: Test99_Obj2[];
}

interface MultiBracketObj {
  text: string;
}

interface ValueClampObj {
  score: number;
  age: number;
}

interface Flatten3DObj {
  flattened: number[];
}

type DeepZeroWidthArr = (string | string[][])[];

interface Test104_Obj2 {
  valid: string;
  undef?: undefined;
}

interface Test104_Obj1 {
  level2: Test104_Obj2;
}

interface DeepUndefinedFilterObj {
  level1: Test104_Obj1;
}

interface MultiReplaceCompare {
  strings: string[];
  replaced: string[];
}

class Product {
  public id: number;
  public name: string;
  public price: number;

  constructor(id: number, name: string, price: number) {
    this.id = id;
    this.name = name;
    this.price = price;
  }

  getTax(): number {
    return this.price * 0.1;
  }
}

interface ProductObj {
  item: Product | Test107_Obj1;
}

interface VowelRatioCompare {
  strings: string[];
  ratios: number[];
}

interface Test109_Obj1 {
  id: string;
  age: number;
}

interface DeepPropConvertObj {
  users: Test109_Obj1[];
}

interface Test110_Obj1 {
  id: number;
  name: string;
}

interface UniqueDeepObjArr {
  items: Test110_Obj1[];
}

interface AbsoluteDiffsCompare {
  numbers: number[];
  diffs: number[];
}

interface Test113_Obj1 {
  value: number;
}

interface SumAvgCompare {
  data: Test113_Obj1[];
  sum: number;
  avg: number;
}

type MixedSpecialArr = (string | string[][])[];

interface PartialMaskObj {
  cardNumber: string;
  phone: string;
}

interface Test116_Obj1 {
  id: number;
  diff: number;
}

interface DiffObj {
  changes: Test116_Obj1[];
}

interface Test117_Obj2 {
  formula: string;
  variables: string[];
}

interface Test117_Obj1 {
  linear: string;
  quadratic: Test117_Obj2;
}

interface MathFormulaObj {
  equations: Test117_Obj1;
}

interface Test118_Obj2 {
  valid: number[];
  empty: never[];
}

interface Test118_Obj1 {
  level2: Test118_Obj2[];
}

interface DeepEmptyArrCleanObj {
  level1: Test118_Obj1;
}

interface BinaryOneCountCompare {
  numbers: number[];
  counts: number[];
}

interface VowelSortCompare {
  words: string[];
  sorted: string[];
}

interface MultiQuoteObj {
  text: string;
}

interface FrequencyDistObj {
  distribution: Record<string, number>;
}

interface Test124_Obj2 {
  keyx: number;
}

interface Test124_Obj1 {
  keyy: string;
  level2: Test124_Obj2;
}

interface DeepZeroWidthObj {
  level1: Test124_Obj1;
}

interface Test125_Obj2 {
  valid: string;
  empty: string;
}

interface Test125_Obj1 {
  level2: Test125_Obj2;
}

interface DeepEmptyStrCleanObj {
  level1: Test125_Obj1;
}

interface Test126_Obj2 {
  sku: string;
}

interface Test126_Obj1 {
  id: number;
  details: Test126_Obj2;
}

interface DeepUniqueObjArr {
  products: Test126_Obj1[];
}

interface Test128_Obj1 {
  message: string;
  timestamp: number;
}

interface ApiResponse {
  code: number;
  data: Test128_Obj1;
}

interface RegexFilterObj {
  email: string;
  phone?: string;
}

interface UpperCountCompare {
  strings: string[];
  counts: number[];
}

interface CubeRootCompare {
  numbers: number[];
  roots: number[];
}

interface FibIndexCompare {
  indices: number[];
  fibValues: number[];
}

interface Test132_Obj1 {
  id: number;
  name: string;
}

interface ValidObjFilterArr {
  users: Test132_Obj1[];
}

interface Test133_Obj2 {
  active: boolean;
}

interface Test133_Obj1 {
  id: number;
  details: Test133_Obj2;
}

interface SetToObjArrDeep {
  items: Test133_Obj1[];
}

interface Test134_Obj1 {
  category: string;
}

interface UniquePropsCompare {
  items: Test134_Obj1[];
  uniqueCategories: string[];
}

interface Test135_Obj1 {
  text: string;
}

interface NestedControlCharObj {
  level1: Test135_Obj1;
}


interface FirstLettersConcatCompare {
  words: string[];
  acronym: string;
}

interface Test137_Obj2 {
  CO2: number;
}

interface Test137_Obj1 {
  H2O: string;
  nested: Test137_Obj2;
}

interface ChemicalSymbolObj {
  elements: Test137_Obj1;
}

interface Test138_Obj2 {
  num: number;
}

interface Test138_Obj1 {
  values: Test138_Obj2[];
}

interface ValidNumberFilterObj {
  level1: Test138_Obj1;
}

interface RawData {
  user_id: number;
  user_name: string;
  user_email: string;
}

interface UserDTO {
  id: number;
  name: string;
  email: string;
}

interface Test142_Obj1 {
  value: string;
}

interface Test142_Obj2 {
  id: number;
}

interface ObjectOnlyObj {
  nested: Test142_Obj1;
  otherObj?: Test142_Obj2;
  str?: string;
}

interface Test143_Obj1 {
  action: string;
  time: string;
}

interface FormattedDateObj {
  logs: Test143_Obj1[];
}

interface FactorialCompare {
  numbers: number[];
  results: number[];
}

interface RemoveVowelsCompare {
  strings: string[];
  consonants: string[];
}

interface TwoSumCompare {
  numbers: number[];
  target: number;
  indices: number[];
}

type ThreeDimSpecialArr = (string | string[][] | string[][][])[];

interface MovingAvgCompare {
  numbers: number[];
  window: number;
  averages: number[];
}


interface CharCountSortCompare {
  strings: string[];
  sorted: string[];
}

interface Test139_Obj2 {
  Dx23: number;
}

interface Test139_Obj1 {
  Cx23: string;
  nested: Test139_Obj2;
}

interface MusicSymbolObj {
  notes: Test139_Obj1;
}

interface Test53_Obj1 {
  enumStatus: string;
}

interface Test62_Obj3 {
  user_id: number;
  user_name: string;
  contact_email: string;
}

interface Test63_Obj1 {
  a: number;
  b: number;
  c: number;
}

interface Test64_Obj5 {
  name: string;
  time: string;
}

interface Test64_Obj4 {
  events: Test64_Obj5[];
}

interface Test64_Obj1 {
  logs: Test64_Obj4[];
}

interface Test68_Obj2 {
  name: string;
  price: number;
  inStock: boolean;
}

interface Test68_Obj1 {
  name: string;
  price: number;
  inStock: boolean;
}

interface MultiFilterCompare {
  products: Test68_Obj2[];
  filtered: Test68_Obj1[];
}

interface Test62_Obj1 {
  id: number;
  name: string;
}

interface Test62_Obj2 {
  email: string;
}

interface Test82_Obj1 {
  nan: number;
  inf: number;
  normal: number;
}

interface Test83_Obj5 {
  inf: number;
  num: number;
}

interface Test83_Obj4 {
  nan: number;
  level2: Test83_Obj5;
}

interface Test83_Obj3 {
  level1: Test83_Obj4;
}

interface Test87_Obj4 {
  value: number;
}

interface Test87_Obj3 {
  items: Test87_Obj4[];
}

interface Test87_Obj5 {
  groups: Test87_Obj3[];
}

interface FibonacciCompare {
  count: number[];
  sequence: number[];
}


interface Test99_Obj3 {
  name: string;
  priority: string;
}

interface Test99_Obj1 {
  tasks: Test99_Obj3[];
}

interface Test107_Obj1 {
  id: number;
  name: string;
  price: number;
}

interface Test109_Obj3 {
  id: number;
  age: number;
}

interface Test109_Obj2 {
  users: Test109_Obj3[];
}

interface Test111_Obj3 {
  id: number;
}

interface Test112_Obj1 {
  id: number;
  name: string;
}


interface Test116_Obj3 {
  id: number;
  old: number;
  new: number;
}

interface Test116_Obj2 {
  items: Test116_Obj3[];
}

interface Test130_Obj6 {
  salary: number;
}

interface Test130_Obj5 {
  employees: Test130_Obj6[];
}

interface Test130_Obj4 {
  departments: Test130_Obj5[];
}

interface Test133_Obj4 {
  active: boolean;
}

interface Test133_Obj3 {
  id: number;
  details: Test133_Obj4;
}


interface Test143_Obj3 {
  action: string;
  time: number;
}

interface Test143_Obj2 {
  logs: Test143_Obj3[];
}


interface GeneratedTypeLiteralInterface_1 {
  status: number;
}

interface GeneratedObjectLiteralInterface_1 {
  numbers: number[];
  product: number;
}

interface GeneratedObjectLiteralInterface_2 {
  username: string;
  email: string;
}

interface GeneratedObjectLiteralInterface_3 {
  role: string;
}

interface GeneratedObjectLiteralInterface_4 {
  name: string;
  auth: GeneratedObjectLiteralInterface_3;
}

interface GeneratedObjectLiteralInterface_5 {
  user: GeneratedObjectLiteralInterface_4;
}

interface GeneratedObjectLiteralInterface_6 {
  fullInfo: Test37_Obj2;
}

interface GeneratedObjectLiteralInterface_7 {
  username: string;
  email: string;
}

interface GeneratedTypeLiteralInterface_2 {
  value: number;
}

export default function Json4Test() {

  describe('Json4Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await sleep(30);
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_0100
     * @tc.name Json4Test001
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = "[1,,2]";
      let hasError: boolean = false;

      try {
        ArkTSUtils.ASON.parse(invalidJson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }

      expect(hasError).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_0200
     * @tc.name Json4Test002
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const originalStr: string = "Hello 😊 World 🌟";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr: string = (ArkTSUtils.ASON.parse(jsonStr) as ISendable).toString();
      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("😊")).assertEqual(true);
      expect(parsedStr.includes("🌟")).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_0300
     * @tc.name Json4Test003
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const originalObj: Test3_Obj2 = {
        container: { value: 123 }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: RootNestedReplaceObj = {
        container: { value: (ArkTSUtils.ASON.parse(jsonStr) as ISendable).toString() }
      };
      expect(parsedObj.container.value).assertEqual("[object Object]");
      expect(typeof parsedObj.container.value).assertEqual("string");
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_0400
     * @tc.name Json4Test004
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const invalidJson: string = '{"num": 1e-}';
      let hasError: boolean = false;
      try {
        const parsedResult: ISendable = ArkTSUtils.ASON.parse(invalidJson) as ISendable;
        const parsedStr: string = parsedResult.toString();
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_0500
     * @tc.name Json4Test005
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: TypePreserveObj = {
        num: 10,
        str: "test",
        bool: true,
        nil: null
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedResult: ISendable = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
      const parsedObj: TypePreserveObj = {
        num: parsedResult.num,
        str: parsedResult.str,
        bool: parsedResult.bool,
        nil: parsedResult.nil
      };
      expect(parsedObj.num).assertEqual(10);
      expect(parsedObj.str).assertEqual("test");
      expect(parsedObj.bool).assertEqual(true);
      expect(parsedObj.nil).assertEqual(null);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_0600
     * @tc.name Json4Test006
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const jsonStr: string = '{"a": {"b": {"c": 1, "c": 2}}}';
      const parsedObj: DeepKeyConflictObj = ArkTSUtils.ASON.parse(jsonStr) as DeepKeyConflictObj;
      expect(parsedObj.a.b.c).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_0700
     * @tc.name Json4Test007
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "Start\u0000End";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr: string = ArkTSUtils.ASON.parse(jsonStr) as string;
      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("\u0000")).assertEqual(true);
      expect(parsedStr.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_0800
     * @tc.name Json4Test008
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const originalArr: [string, number][] = [["a", 1], ["b", 2]];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedResult = ArkTSUtils.ASON.parse(jsonStr) as ISendable as [string, number][];
      const parsedMap: Map<string, number> = new Map(parsedResult);

      expect(parsedMap instanceof Map).assertEqual(true);
      expect(parsedMap.get("a")).assertEqual(1);
      expect(parsedMap.get("b")).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_1000
     * @tc.name Json4Test010
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const originalObj: PathFilterObj = {
        user: { address: { city: "Beijing", street: "Main St" } }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedResult = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
      const parsedObj: PathFilterObj = {
        user: {
          address: {
            city: (parsedResult as PathFilterObj)?.user?.address?.city,
            street: undefined
          }
        }
      };
      expect(parsedObj.user.address.city).assertEqual("Beijing");
      expect(parsedObj.user.address.street).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_1100
     * @tc.name Json4Test011
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ArrWithObj = {
        items: [{ id: 1, active: false }, { id: 2, active: false }]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as ArrWithObj;
      expect(parsedObj.items[0].active).assertEqual(false);
      expect(parsedObj.items[1].active).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_1200
     * @tc.name Json4Test012
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = '{"valid": tru}';
      let hasError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(invalidJson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_1300
     * @tc.name Json4Test013
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "é (e\u0301)";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr: string = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("é")).assertEqual(true);
      expect(parsedStr.includes("\u0301")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_1400
     * @tc.name Json4Test014
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test14_Obj1 = { a: 5, b: 10 };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as Test14_Obj1;
      const sum = parsedObj.a + parsedObj.b;
      const result: Test14_Obj2 = {
        a: parsedObj.a,
        b: parsedObj.b,
        sum: sum
      };
      expect(result.sum).assertEqual(15);
      expect(result.sum).assertEqual(result.a + result.b);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_1500
     * @tc.name Json4Test015
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = "[() => {}]";
      let hasError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(invalidJson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_1600
     * @tc.name Json4Test016
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: StrTruncateObj = {
        short: "hello",
        long: "this is a very long string"
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as StrTruncateObj;
      const result: StrTruncateObj = {
        short: parsedObj.short,
        long: parsedObj.long.length > 10 ? parsedObj.long.slice(0, 10) : parsedObj.long
      };
      expect(result.short).assertEqual("hello");
      expect(result.long).assertEqual("this is a ");
      expect(result.long.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_1700
     * @tc.name Json4Test017
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: FilteredObjArr = {
        data: [{ id: 1, value: 5 }, { id: 2, value: 15 }, { id: 3, value: 8 }]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as FilteredObjArr;
      const filteredData = parsedObj.data.filter(item => item.value > 10);
      const result: FilteredObjArr = {
        data: filteredData
      };
      expect(result.data.length).assertEqual(1);
      expect(result.data[0].id).assertEqual(2);
      expect(result.data[0].value).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_1800
     * @tc.name Json4Test018
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = '{"num": ++123}';
      let hasError: boolean = false;

      try {
        ArkTSUtils.ASON.parse(invalidJson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }

      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_1900
     * @tc.name Json4Test019
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: NestedNewlineObj = {
        level1: { level2: "Line1\nLine2\nLine3" }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj: NestedNewlineObj = ArkTSUtils.ASON.parse(jsonStr) as NestedNewlineObj;
      expect(parsedObj.level1.level2).assertEqual("Line1\nLine2\nLine3");
      expect(parsedObj.level1.level2.split("\n").length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_2000
     * @tc.name Json4Test020
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test20_Obj1 = { oldKey: "value" };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as Test20_Obj1;
      const result: RenamePropObj = {
        newKey: parsedObj.oldKey
      };
      expect(result.newKey).assertEqual("value");
      expect(Object.keys(result).includes("newKey")).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_2100
     * @tc.name Json4Test021
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = ["10", "20", "30"];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as string[];
      const result: number[] = parsedArr.map(item => parseInt(item, 10));
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(typeof result[0]).assertEqual("number");
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_2200
     * @tc.name Json4Test022
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        const invalidJson: string = '{"a":1}}extra';
        ArkTSUtils.ASON.parse(invalidJson);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_2300
     * @tc.name Json4Test023
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: SpecialCharArr = [
        ["!@#", "$%^"],
        ["&*()", "[]{}"]
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr: SpecialCharArr = ArkTSUtils.ASON.parse(jsonStr) as SpecialCharArr;
      expect(parsedArr[0][0]).assertEqual("!@#");
      expect(parsedArr[1][1]).assertEqual("[]{}");
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_2400
     * @tc.name Json4Test024
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const originalObj: EmptyObjFilter = {
        valid: { id: 1 },
        empty: {}
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsed = ArkTSUtils.ASON.parse(jsonStr) as ISendable;
      const parsedObj = parsed as Record<string, Object>;
      const valid = parsedObj["valid"] as Record<string, number>;
      const result: EmptyObjFilter = {
        valid: { id: valid["id"] }
      };
      expect(result.valid.id).assertEqual(1);
      expect(result.empty).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_2500
     * @tc.name Json4Test025
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = '{"str": "test"string"}';
      let hasError: boolean = false;
      try {
        ArkTSUtils.ASON.parse(invalidJson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_2600
     * @tc.name Json4Test026
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CharTypeCountCompare = { strings: ["aab1", "abc", "aaa"], typesCount: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as CharTypeCountCompare;
      const typesCount: number[] = [];
      parsed.strings.forEach(s => {
        const chars: string[] = [];
        for (let i = 0; i < s.length; i++) {
          if (!chars.includes(s[i])) {
            chars.push(s[i]);
          }
        }
        typesCount.push(chars.length);
      });
      const result: CharTypeCountCompare = {
        strings: parsed.strings,
        typesCount: typesCount
      };
      expect(result.typesCount[0]).assertEqual(3);
      expect(result.typesCount[1]).assertEqual(3);
      expect(result.typesCount[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_2700
     * @tc.name Json4Test027
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Test27_Obj1 {
        status: number;
      }
      interface StatusMapObj {
        status: "inactive" | "active" | "pending";
      }

      const originalObj: Test27_Obj1 = { status: 1 };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as GeneratedTypeLiteralInterface_1;

      const statusMap: Record<number, "inactive" | "active" | "pending"> = {
        0: "inactive",
        1: "active",
        2: "pending",
      };
      const parsedObjWithStatus: StatusMapObj = {
        status: statusMap[parsedObj.status] || "inactive",
      };

      expect(parsedObjWithStatus.status).assertEqual("active");
      expect(["active", "inactive", "pending"].includes(parsedObjWithStatus.status)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_2800
     * @tc.name Json4Test028
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = "[1, undefined, 3]";
      let hasError: boolean = false;

      try {
        ArkTSUtils.ASON.parse(invalidJson);
      } catch (error) {
        hasError = error instanceof SyntaxError;
      }

      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_2900
     * @tc.name Json4Test029
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiLangObj = {
        en: "Hello",
        zh: "你好",
        ja: "こんにちは"
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as MultiLangObj;

      expect(parsedObj.en).assertEqual("Hello");
      expect(parsedObj.zh).assertEqual("你好");
      expect(parsedObj.ja).assertEqual("こんにちは");
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_3000
     * @tc.name Json4Test030
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: number[] = [1, 2, 3, 4, 5];
      const truncatedArr = originalArr.length > 3 ? originalArr.slice(0, 3) : originalArr;
      const jsonStr: string = ArkTSUtils.ASON.stringify(truncatedArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as number[];

      expect(parsedArr.length).assertEqual(3);
      expect(parsedArr[0]).assertEqual(1);
      expect(parsedArr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_3100
     * @tc.name Json4Test031
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ProductCompare = { numbers: [2, 3, 4], product: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ProductCompare;

      let product = 1;
      parsed.numbers.forEach(n => product *= n);
      const result: GeneratedObjectLiteralInterface_1 = {
        numbers: parsed.numbers,
        product: product
      };
      expect(result.product).assertEqual(24);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_3200
     * @tc.name Json4Test032
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = '{"num": 123+}';
      let errorOccurred = false;
      try {
        ArkTSUtils.ASON.parse(invalidJson);
      } catch (error) {
        errorOccurred = true;
      }
      expect(errorOccurred).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_3300
     * @tc.name Json4Test033
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalStr: string = "a\u200Cb";
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalStr);
      const parsedStr = ArkTSUtils.ASON.parse(jsonStr) as string;

      expect(parsedStr).assertEqual(originalStr);
      expect(parsedStr.includes("\u200C")).assertEqual(true);
      expect(parsedStr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_3400
     * @tc.name Json4Test034
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: SensitiveDataObj = {
        username: "user123",
        password: "secret",
        email: "user@example.com"
      };
      const filteredObj: GeneratedObjectLiteralInterface_2 = {
        username: originalObj.username,
        email: originalObj.email
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(filteredObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as SensitiveDataObj;

      expect(parsedObj.username).assertEqual("user123");
      expect(parsedObj.password).assertEqual(undefined);
      expect(parsedObj.email).assertEqual("user@example.com");
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_3500
     * @tc.name Json4Test035
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DeepSensitiveObj = {
        user: {
          name: "admin",
          auth: { token: "secret-token", role: "admin" }
        }
      };
      const filteredObj: GeneratedObjectLiteralInterface_5 = {
        user: ({
          name: originalObj.user.name,
          auth: ({ role: originalObj.user.auth.role } as GeneratedObjectLiteralInterface_3)
        } as GeneratedObjectLiteralInterface_4)
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(filteredObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as DeepSensitiveObj;
      expect(parsedObj.user.name).assertEqual("admin");
      expect(parsedObj.user.auth.token).assertEqual(undefined);
      expect(parsedObj.user.auth.role).assertEqual("admin");
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_3600
     * @tc.name Json4Test036
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = ["\x01Start", "End\x04"];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual("\x01Start");
      expect(parsedArr[1]).assertEqual("End\x04");
      expect(parsedArr[0].charCodeAt(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_3700
     * @tc.name Json4Test037
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test37_Obj2 = {
        id: 10,
        name: "Anna",
        age: 30
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as Test37_Obj2;
      const result: GeneratedObjectLiteralInterface_6 = {
        fullInfo: parsedObj
      };

      expect(result.fullInfo.id).assertEqual(10);
      expect(result.fullInfo.name).assertEqual("Anna");
      expect(result.fullInfo.age).assertEqual(30);
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_3800
     * @tc.name Json4Test038
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = "{key name: 1}";
      try {
        ArkTSUtils.ASON.parse(invalidJson) as string;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain("Unexpected Object Prop in JSON");
      }
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_3900
     * @tc.name Json4Test039
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test39_Obj2 = {
        logs: [
          { event: "login", time: "2024-01-01T00:00:00Z" },
          { event: "logout", time: "2024-01-01T01:00:00Z" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as Test39_Obj2;



      expect(parsedObj.logs[0].time).assertEqual('2024-01-01T00:00:00Z');
      expect(parsedObj.logs[1].time).assertEqual('2024-01-01T01:00:00Z');
    });

    /**
     * @tc.number SUB_BUILTINS_Json4_TEST_4000
     * @tc.name Json4Test040
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json4Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidJson: string = '{"valid": TRUE}';
      try {
        ArkTSUtils.ASON.parse(invalidJson) ;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("SyntaxError");
        expect(error.message).assertContain("Unexpected Text in JSON: Invalid Token");
      }

    });


  })
}
