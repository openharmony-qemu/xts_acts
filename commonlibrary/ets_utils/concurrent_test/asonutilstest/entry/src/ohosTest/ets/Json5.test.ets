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


interface SetToKeyMap {
  exists: Record<string, boolean>;
}

interface Test2_Obj1 {
  lang: string;
  symbol: string;
}

interface MultiLangArrObj {
  labels: Test2_Obj1[];
}

interface MapEntriesArr {
  entries: [string, number][];
}

interface Test4_Obj1 {
  name: string;
  age: number;
}

interface AgeDiffCompare {
  people: Test4_Obj1[];
  diffs: number[];
}

interface FilteredUser {
  id: number;
  name: string;
}

interface FilteredPropsArr {
  users: FilteredUser[];
}

interface Test5_Obj3 {
  id: number;
  name: string;
  age: number;
  email: string;
}

interface Test5_Obj2 {
  users: Test5_Obj3[];
}

interface Test5_Obj1 {
  name: string;
  status: string;
}

interface EmojiNestedObj {
  user: Test5_Obj1;
}

interface Test7_Obj2 {
  enabled: boolean;
  timeout: number;
}

interface Test7_Obj1 {
  theme: string;
  layout: string;
  nested: Test7_Obj2;
}

interface DefaultValueDeepObj {
  config: Test7_Obj1;
}


interface Test7_Obj4 {
  enabled: boolean;
}

interface Test7_Obj5 {
  theme: string;
  nested: Test7_Obj4;
}

interface Test7_Obj3 {
  config: Test7_Obj5;
}

interface Test8_Obj1 {
  name: string;
  timestamp: number;
  localDate: string;
}

interface LocalizedDateObj {
  events: Test8_Obj1[];
}

interface Test8_Obj3 {
  name: string;
  timestamp: number;
}

interface Test8_Obj2 {
  events: Test8_Obj3[];
}

interface Test9_Obj1 {
  id: number;
  expression: string;
}

interface MathFormulaArrObj {
  formulas: Test9_Obj1[];
}

interface Test10_Obj1 {
  withJoiner: string;
  withSpace: string;
}

interface ZeroWidthCharObj {
  text: Test10_Obj1;
}

interface CaseConvertArr {
  tags: string[];
}

interface Test12_Obj2 {
  "enable_ssl": boolean;
  timeout_ms: number;
}

interface Test12_Obj1 {
  api_endpoint: string;
  "max_size": string;
  nested: Test12_Obj2;
}

interface SpecialCharConfigObj {
  settings: Test12_Obj1;
}

interface Test14_Obj1 {
  name: string;
  value: string;
}

interface UnitValueObj {
  measurements: Test14_Obj1[];
}

interface ElementFrequencyObj {
  numbers: number[];
  frequency: Record<number, number>;
}

interface Test16_Obj2 {
  score: number;
}

interface Test16_Obj1 {
  values: Test16_Obj2[];
  avgScore: number;
}

interface DeepAvgObj {
  groups: Test16_Obj1[];
}


interface Test16_Obj5 {
  score: number;
}

interface Test16_Obj4 {
  values: Test16_Obj5[];
}

interface Test16_Obj3 {
  groups: Test16_Obj4[];
}

interface Test17_Obj1 {
  emoji: string;
  count: number;
}

interface EmojiArrObj {
  reactions: Test17_Obj1[];
}

interface SumCountCompare {
  orders: Test111_Obj1[];
  numbers: number[];
  sum: number;
  count: number;
}


interface Test19_Obj2 {
  age: undefined;
  name: string;
}

interface Test19_Obj1 {
  metadata: undefined;
  id: number;
  profile: Test19_Obj2;
}

interface FilteredDeepPropsObj {
  user: Test19_Obj1;
}

interface Test19_Obj5 {
  name: string;
  age: number;
  address: string;
}

interface Test19_Obj6 {
  timestamp: number;
}

interface Test19_Obj4 {
  id: number;
  profile: Test19_Obj5;
  metadata: Test19_Obj6;
}

interface Test19_Obj3 {
  user: Test19_Obj4;
}

interface SetUnionObj {
  union: string[];
}
interface ParsedSets {
  sets: string[][];
}

interface Test21_Obj1 {
  sets: Set<string>[];
}

interface Test22_Obj1 {
  lang: string;
  content: string;
}

interface MultiPunctuationObj {
  texts: Test22_Obj1[];
}

interface Test24_Obj1 {
  name: string;
  number: number;
}

interface ScientificNotationObj {
  values: Test24_Obj1[];
}

interface Test25_Obj2 {
  combined: string;
}

interface Test25_Obj1 {
  original: string;
  nested: Test25_Obj2;
}

interface ZeroWidthNonJoinerObj {
  texts: Test25_Obj1;
}

interface Test26_Obj1 {
  volume: number;
  brightness: number;
}

interface ValueRangeCheckObj {
  settings: Test26_Obj1;
}

interface Test27_Obj1 {
  name: string;
  regex: string;
}

interface RegexPatternObj {
  patterns: Test27_Obj1[];
}

interface Test28_Obj1 {
  animal: string;
  emoji: string;
}

interface AnimalEmojiObj {
  zoo: Test28_Obj1[];
}

interface SetSymmetricDiffObj {
  symmetricDiff: string[];
}

interface Test30_Obj1 {
  a: Set<string>;
  b: Set<string>;
}

interface Test31_Obj1 {
  lang: string;
  text: string;
}

interface GreetingObj {
  greetings: Test31_Obj1[];
}

interface Test31_Obj2 {
  name: string;
  sql: string;
}

interface SqlQueryObj {
  queries: Test31_Obj2[];
}

interface Test32_Obj1 {
  day: string;
  emoji: string;
}

interface WeatherEmojiObj {
  forecasts: Test32_Obj1[];
}

interface Test33_Obj1 {
  lang: string;
  symbol: string;
}

interface MultiLangNumberObj {
  numbers: Test33_Obj1[];
}

interface Test36_Obj1 {
  name: string;
  xml: string;
}

interface XmlTagObj {
  elements: Test36_Obj1[];
}

interface Test37_Obj1 {
  name: string;
  yaml: string;
}

interface YamlContentObj {
  configs: Test37_Obj1[];
}

interface Test38_Obj1 {
  name: string;
  query: string;
}

interface GraphqlQueryObj {
  queries: Test38_Obj1[];
}

interface Test39_Obj1 {
  name: string;
  emoji: string;
}

interface TransportEmojiObj {
  vehicles: Test39_Obj1[];
}

interface Test41_Obj1 {
  en: string;
  fr: string;
  zh: string;
}

interface MultiLangPunctObj {
  messages: Test41_Obj1;
}

interface Test42_Obj1 {
  name: string;
  cmd: string;
}

interface DockerCommandObj {
  commands: Test42_Obj1[];
}

interface Test43_Obj1 {
  name: string;
  code: string;
}

interface JavaAnnotationObj {
  annotations: Test43_Obj1[];
}

interface Test44_Obj1 {
  values: number[];
  maxValue: number;
}

interface DeepMaxObj {
  datasets: Test44_Obj1[];
}

interface Test44_Obj3 {
  values: number[];
}

interface Test44_Obj2 {
  datasets: Test44_Obj3[];
}

interface Test45_Obj1 {
  name: string;
  emoji: string;
}

interface TransportEmojiObj1 {
  vehicles: Test45_Obj1[];
}

interface Test45_Obj2 {
  name: string;
  ounces: number;

}

interface Test45_Obj3 {
  ingredients: Test45_Obj2[];
}

interface Test45_Obj4 {
  name: string;
  ounces: number;
  grams: number;
}

interface OunceToGramObj {
  ingredients: Test45_Obj4[];
}

interface PositiveSumObj {
  numbers: number[];
  sum: number;
}

interface UpperCaseArr {
  words: string[];
  upper: string[];
}

interface EvenNumbers {
  data: number[];
  evens: number[];
}

interface AverageObj {
  values: number[];
  avg: number;
}

interface StringLengths {
  texts: string[];
  lengths: number[];
}

interface HourExtract {
  times: string[];
  hours: number[];
}

interface LongStrings {
  strings: string[];
  long: string[];
}

interface RoundedNumbers {
  nums: number[];
  rounded: number[];
}

interface PositiveCount {
  numbers: number[];
  count: number;
}

interface FirstLetters {
  words: string[];
  letters: string[];
}

interface ReversedArr {
  data: string[];
  reversed: string[];
}

interface SquaredNumbers {
  numbers: number[];
  squares: number[];
}

interface SubstringFilter {
  strings: string[];
  filtered: string[];
}

interface YearExtract {
  dates: string[];
  years: number[];
}

interface SumSkipZero {
  values: number[];
  sum: number;
}

interface StringConcat {
  parts: string[];
  combined: string;
}

interface ThresholdFilter {
  numbers: number[];
  above: number[];
}

interface LowerCaseArr {
  words: string[];
  lower: string[];
}

interface ProductObj {
  factors: number[];
  product: number;
}

interface LastElement {
  items: string[];
  last: string;
}

interface CharCount {
  text: string;
  count: number;
}

interface BinaryNumbers {
  numbers: number[];
  binary: string[];
}

interface Test68_Obj1 {
  id: number;
}

interface FilterObjects {
  items: Test68_Obj1[];
  filtered: Test68_Obj1[];
}

interface ArrayLength {
  data: number[];
  length: number;
}

interface StringReplace {
  text: string;
  replaced: string;
}

interface RangeCheck {
  numbers: number[];
  inRange: number[];
}

interface Test74_Obj1 {
  name: string;
}

interface ExtractProps {
  items: Test74_Obj1[];
  names: string[];
}

interface Test69_Obj2 {
  id: number;
}

interface Test73_Obj2 {
  name: string;
}

interface TrimStrings {
  texts: string[];
  trimmed: string[];
}

interface MaxValue {
  numbers: number[];
  max: number;
}

interface UniqueElements {
  data: number[];
  unique: number[];
}

interface NumToStringArr {
  numbers: number[];
  strings: string[];
}

interface Test78_Obj1 {
  id: number;
  active: boolean;
}

interface FilterActiveUsers {
  users: Test78_Obj1[];
  active: Test78_Obj1[];
}

interface TotalStringLength {
  words: string[];
  total: number;
}

interface ToPercentage {
  values: number[];
  percentages: string[];
}

interface EvenLengthStrings {
  strings: string[];
  even: string[];
}

interface ExtractMonths {
  dates: string[];
  months: string[];
}

interface CubedNumbers {
  numbers: number[];
  cubes: number[];
}

interface CapitalizedWords {
  words: string[];
  capitalized: string[];
}

interface RoundedAverage {
  values: number[];
  avg: number;
}

interface NegativeCount {
  numbers: number[];
  count: number;
}

interface JoinedWithSeparator {
  words: string[];
  joined: string;
}

interface SumOfSquares {
  numbers: number[];
  sum: number;
}

interface Test89_Obj1 {
  id: number;
  amount: number;
}

interface SumByProperty {
  orders: Test89_Obj1[];
  total: number;
}

interface Test90_Obj1 {
  type: string;
  amount: number;
}

interface ConditionalSum {
  transactions: Test90_Obj1[];
  income: number;
}

interface MinValue {
  numbers: number[];
  min: number;
}

interface LowercaseCompare {
  words: string[];
  lowercase: string[];
}

interface EvenCompare {
  numbers: number[];
  evens: number[];
}

interface Test94_Obj1 {
  id: number;
  name: string;
}

interface ExtractIdCompare {
  users: Test94_Obj1[];
  ids: number[];
}

interface SquareCompare {
  numbers: number[];
  squares: number[];
}

interface ConcatCompare {
  parts: string[];
  combined: string[];
}

interface ExtractDayCompare {
  dates: string[];
  days: string[];
}

interface GreaterThanTenCompare {
  numbers: number[];
  result: number[];
}

interface CapitalCompare {
  words: string[];
  capitalized: string[];
}

interface Test100_Obj1 {
  name: string;
  active: boolean;
}

interface ActiveUserCompare {
  users: Test100_Obj1[];
  active: Test100_Obj1[];
}

interface SumToArrayCompare {
  numbers: number[];
  sum: number[];
}

interface ReverseElementsCompare {
  strings: string[];
  reversed: string[];
}

interface DivisibleByFiveCompare {
  numbers: number[];
  result: number[];
}

interface Test104_Obj1 {
  id: number;
}

interface Test104_Obj2 {
  id: number;
  type: string;
}

interface AddPropCompare {
  items: Test104_Obj1[];
  withProp: Test104_Obj2[];
}

interface LengthStatsCompare {
  strings: string[];
  lengths: number[];
}

interface WithUnitCompare {
  values: number[];
  withUnit: string[];
}

interface LongStringsCompare {
  strings: string[];
  long: string[];
}

interface Test108_Obj1 {
  name: string;
  value: number;
}

interface SortedCompare {
  items: Test108_Obj1[];
  sorted: Test108_Obj1[];
}

interface AbsoluteCompare {
  numbers: number[];
  absolute: number[];
}

interface ReplaceCharCompare {
  strings: string[];
  replaced: string[];
}

interface Test111_Obj1 {
  id: number;
  amount: number;
}

interface SumPropCompare {
  orders: Test111_Obj1[];
  total: number[];
}

interface UniqueCompare {
  numbers: number[];
  unique: number[];
}

interface FirstCharCompare {
  words: string[];
  firstChars: string[];
}

interface BinaryStrCompare {
  numbers: number[];
  binary: string[];
}

interface Test115_Obj1 {
  name: string;
  price: number;
}

interface PriceFilterCompare {
  products: Test115_Obj1[];
  expensive: Test115_Obj1[];
}

interface CubeCompare {
  numbers: number[];
  cubes: number[];
}

interface JoinWithSepCompare {
  words: string[];
  joined: string[];
}

interface FixedTwoCompare {
  numbers: number[];
  fixed: number[];
}

interface SubstrFilterCompare {
  strings: string[];
  filtered: string[];
}

interface Test120_Obj1 {
  id: number;
  price: number;
}

interface UpdatePriceCompare {
  items: Test120_Obj1[];
  updated: Test120_Obj1[];
}

interface MinToArrayCompare {
  numbers: number[];
  min: number[];
}

interface TrimmedCompare {
  strings: string[];
  trimmed: string[];
}

interface OddNumbersCompare {
  numbers: number[];
  odds: number[];
}

interface Test124_Obj1 {
  id: number;
  name: string;
}

interface ExtractNamesCompare {
  employees: Test124_Obj1[];
  names: string[];
}

interface SquareRootCompare {
  numbers: number[];
  roots: number[];
}

interface CapitalFirstCompare {
  words: string[];
  capitalized: string[];
}

interface MonthNameCompare {
  dates: string[];
  months: string[];
}

interface NegativeNumbersCompare {
  numbers: number[];
  negatives: number[];
}

interface UppercaseCompare {
  words: string[];
  uppercase: string[];
}

interface Test130_Obj1 {
  name: string;
  age: number;
}

interface AgeFilterCompare {
  people: Test130_Obj1[];
  adults: Test130_Obj1[];
}

interface DoubleSumCompare {
  numbers: number[];
  doubledSum: number[];
}

interface ReverseArrayCompare {
  strings: string[];
  reversed: string[];
}

interface DivisibleBySevenCompare {
  numbers: number[];
  result: number[];
}

interface Test134_Obj1 {
  name: string;
}

interface Test134_Obj2 {
  name: string;
  index: number;
}

interface AddIndexCompare {
  items: Test134_Obj1[];
  indexed: Test134_Obj2[];
}

interface CharIncludeCountCompare {
  strings: string[];
  counts: number[];
}

interface ScientificCompare {
  numbers: number[];
  scientific: string[];
}

interface OddLengthCompare {
  strings: string[];
  oddLength: string[];
}


interface DivisibleBy15Compare {
  numbers: number[];
  result: number[];
}

interface ReciprocalCompare {
  numbers: number[];
  reciprocals: number[];
}

interface ReplaceSubstrCompare {
  strings: string[];
  replaced: string[];
}

interface UniqueSortedCompare {
  numbers: number[];
  result: number[];
}

interface LastCharCompare {
  words: string[];
  lastChars: string[];
}

interface CelsiusCompare {
  temps: number[];
  formatted: string[];
}

interface Test144_Obj1 {
  name: string;
  email: string;
}

interface ExtractDomainCompare {
  users: Test144_Obj1[];
  domains: string[];
}

interface FourthPowerCompare {
  numbers: number[];
  powers: number[];
}

interface MaskMiddleCompare {
  strings: string[];
  masked: string[];
}

interface FixedOneCompare {
  numbers: number[];
  fixed: number[];
}

interface NoNumbersCompare {
  strings: string[];
  filtered: string[];
}

interface Test149_Obj1 {
  id: number;
  status: string;
}

interface UpdateStatusCompare {
  orders: Test149_Obj1[];
  updated: Test149_Obj1[];
}

interface TripleMaxCompare {
  numbers: number[];
  result: number[];
}

interface GeneratedTypeLiteralInterface_1 {
  sets: string[][];
}

interface GeneratedTypeLiteralInterface_2 {
  a: string[];
  b: string[];
}

interface GeneratedObjectLiteralInterface_1 {
  a: Set<string>;
  b: Set<string>;
}

interface GeneratedObjectLiteralInterface_2 {
  name: string;
  active: boolean;
}

interface GeneratedObjectLiteralInterface_3 {
  name: string;
  price: number;
}

interface GeneratedObjectLiteralInterface_4 {
  numbers: number[];
  frequency: Record<number, number>;
}

export default function Json5Test() {
  describe('Json5Test', () => {
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
     * @tc.number SUB_BUILTINS_Json5_TEST_0100
     * @tc.name Json5Test001
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */

    it('Json5Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      {
        const originalSet: Set<string> = new Set(["apple", "banana", "cherry"]);
        const jsonStr: string = ArkTSUtils.ASON.stringify(originalSet);
        const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as object;
        const exists = (parsedObj as string[]).reduce((map, item) => {
          map[item] = true;
          return map;
        }, {} as Record<string, boolean>);

        expect(exists.apple).assertEqual(true);
        expect(exists.banana).assertEqual(true);
        expect(exists.orange).assertEqual(undefined);
      }
    });
    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_0200
     * @tc.name Json5Test002
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiLangArrObj = {
        labels: [
          { lang: "Greek", symbol: "Ω" },
          { lang: "Russian", symbol: "Ё" },
          { lang: "Arabic", symbol: "ض" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as MultiLangArrObj;

      expect(parsedObj.labels[0].symbol).assertEqual("Ω");
      expect(parsedObj.labels[1].symbol).assertEqual("Ё");
      expect(parsedObj.labels[2].symbol).assertEqual("ض");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_0300
     * @tc.name Json5Test003
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = ["$100", "€50", "¥1000", "£20"];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as String[];
      expect(parsedArr[0]).assertEqual("$100");
      expect(parsedArr[1]).assertEqual("€50");
      expect(parsedArr[2]).assertEqual("¥1000");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_0400
     * @tc.name Json5Test004
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: Map<string, number>[] = [
        new Map([["a", 1], ["b", 2]]),
        new Map([["c", 3]])
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as object[];
      expect(ArkTSUtils.ASON.stringify(parsedArr)).assertEqual('[{"a":1,"b":2},{"c":3}]');
    });
    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_0500
     * @tc.name Json5Test005
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test5_Obj2 = {
        users: [
          {
            id: 1,
            name: "Frank",
            age: 25,
            email: "f@x.com"
          },
          {
            id: 2,
            name: "Grace",
            age: 30,
            email: "g@x.com"
          }
        ]
      };
      const filteredObj: FilteredPropsArr = {
        users: originalObj.users.map(user => ({
          id: user.id,
          name: user.name
        } as FilteredUser))
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(filteredObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as FilteredPropsArr;
      expect(parsedObj.users[1].name).assertEqual("Grace");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_0600
     * @tc.name Json5Test006
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: EmojiNestedObj = {
        user: {
          name: "😊 Alice",
          status: "🎉 Online"
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as EmojiNestedObj;

      expect(parsedObj.user.name).assertEqual("😊 Alice");
      expect(parsedObj.user.status).assertEqual("🎉 Online");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_0700
     * @tc.name Json5Test007
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test7_Obj3 = {
        config: {
          theme: "light",
          nested: { enabled: true }
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as DefaultValueDeepObj;
      expect(parsedObj.config.layout).assertEqual(undefined);
      expect(parsedObj.config.nested.timeout).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_0800
     * @tc.name Json5Test008
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AgeDiffCompare = {
        people: [{ name: "A", age: 25 }, { name: "B", age: 30 }],
        diffs: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as AgeDiffCompare;
      if (parsed.people.length >= 2) {
        parsed.diffs.push(Math.abs(parsed.people[0].age - parsed.people[1].age));
      }
      expect(parsed.diffs.length).assertEqual(1);
      expect(parsed.diffs[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_0900
     * @tc.name Json5Test009
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MathFormulaArrObj = {
        formulas: [
          { id: 1, expression: "a² + b² = c²" },
          { id: 2, expression: "E = mc²" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as MathFormulaArrObj;

      expect(parsedObj.formulas[0].expression).assertEqual("a² + b² = c²");
      expect(parsedObj.formulas[1].expression).assertEqual("E = mc²");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_1000
     * @tc.name Json5Test010
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ZeroWidthCharObj = {
        text: {
          withJoiner: "a\u200Db",
          withSpace: "x\u200By"
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as ZeroWidthCharObj;

      expect(parsedObj.text.withJoiner).assertEqual("a\u200Db");
      expect(parsedObj.text.withSpace).assertEqual("x\u200By");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_1100
     * @tc.name Json5Test011
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: CaseConvertArr = {
        tags: ["js", "Json", "TypeScript"]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj =  ArkTSUtils.ASON.parse(jsonStr) as CaseConvertArr;
      if (parsedObj.tags && Array.isArray(parsedObj.tags)) {
        parsedObj.tags = parsedObj.tags.map(tag => tag.toUpperCase());
      }

      expect(ArkTSUtils.ASON.stringify(parsedObj.tags)).assertEqual(ArkTSUtils.ASON.stringify(["js", "Json", "TypeScript"]));
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_1200
     * @tc.name Json5Test012
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: SpecialCharConfigObj = {
        settings: {
          api_endpoint: "https://api.example.com/v1",
          "max_size": "10MB",
          nested: { "enable_ssl": true, timeout_ms: 5000 }
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as SpecialCharConfigObj;

      expect(parsedObj.settings.api_endpoint).assertEqual("https://api.example.com/v1");
      expect(parsedObj.settings.nested.timeout_ms).assertEqual(5000);
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_1300
     * @tc.name Json5Test013
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalSet: Set<string> = new Set(["b", "a", "c"]);
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalSet);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as string[];

      expect(ArkTSUtils.ASON.stringify(parsedArr)).assertEqual(ArkTSUtils.ASON.stringify(["b", "a", "c"]));
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_1400
     * @tc.name Json5Test014
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: UnitValueObj = {
        measurements: [
          { name: "Height", value: "180cm" },
          { name: "Weight", value: "75kg" },
          { name: "Temperature", value: "36.5°C" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as UnitValueObj;

      expect(parsedObj.measurements[0].value).assertEqual("180cm");
      expect(parsedObj.measurements[2].value).assertEqual("36.5°C");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_1500
     * @tc.name Json5Test015
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ElementFrequencyObj = {
        numbers: [1, 2, 2, 3, 3, 3, 1],
        frequency: {}
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as ElementFrequencyObj;
      const freq = parsedObj.numbers.reduce((map, num) => {
        map[num] = (map[num] || 0) + 1;
        return map;
      }, {} as Record<number, number>);
      const result: GeneratedObjectLiteralInterface_4 = {
        numbers: parsedObj.numbers,
        frequency: freq
      };
      expect(result.frequency[1]).assertEqual(2);
      expect(result.frequency[2]).assertEqual(2);
      expect(result.frequency[3]).assertEqual(3);
    });
    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_1600
     * @tc.name Json5Test016
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test16_Obj3 = {
        groups: [
          { values: [{ score: 80 }, { score: 90 }, { score: 100 }] },
          { values: [{ score: 60 }, { score: 70 }] }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as DeepAvgObj;


      expect(parsedObj.groups[0].avgScore).assertEqual(undefined);
      expect(parsedObj.groups[1].avgScore).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_1700
     * @tc.name Json5Test017
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: EmojiArrObj = {
        reactions: [
          { emoji: "👍", count: 15 },
          { emoji: "❤️", count: 23 },
          { emoji: "👏", count: 8 }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as EmojiArrObj;

      expect(parsedObj.reactions[0].emoji).assertEqual("👍");
      expect(parsedObj.reactions[1].count).assertEqual(23);
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_1800
     * @tc.name Json5Test018
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumCountCompare = {
        numbers: [1, 2, 3],
        sum: 0,
        count: 0,
        orders: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as SumCountCompare;
      let sum = 0;
      parsed.numbers.forEach(n => sum += n);
      parsed.sum = sum;
      parsed.count = parsed.numbers.length;
      expect(parsed.sum).assertEqual(6);
      expect(parsed.count).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_1900
     * @tc.name Json5Test019
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test19_Obj3 = {
        user: {
          id: 5,
          profile: { name: "Hank", age: 35, address: "Street 123" },
          metadata: { timestamp: 123456 }
        }
      };

      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj  = ArkTSUtils.ASON.parse(jsonStr) as FilteredDeepPropsObj;

      expect(parsedObj.user.profile.age === 35).assertEqual(true);
      expect(parsedObj.user.metadata === 123456).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_2000
     * @tc.name Json5Test020
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        "/home/user/docs/file name.txt",
        "/var/log/app.log",
        "C:\\Program Files\\app.exe"
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual("/home/user/docs/file name.txt");
      expect(parsedArr[2]).assertEqual("C:\\Program Files\\app.exe");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_2100
     * @tc.name Json5Test021
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sets: Set<string>[] = [
        new Set(["a", "b", "c"]),
        new Set(["b", "c", "d"]),
        new Set(["c", "d", "e"])
      ];
      const originalObj: Test21_Obj1 = { sets };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as GeneratedTypeLiteralInterface_1;
      const unionSet = new Set<string>();
      parsedObj.sets.forEach(arr => arr.forEach(item => unionSet.add(item)));
      const unionObj: SetUnionObj = { union: Array.from(unionSet) };

      expect(ArkTSUtils.ASON.stringify(unionObj.union.sort())).assertEqual(ArkTSUtils.ASON.stringify(["a", "b", "c", "d", "e"].sort()));
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_2200
     * @tc.name Json5Test022
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiPunctuationObj = {
        texts: [
          { lang: "Chinese", content: "你好！这是中文标点。" },
          { lang: "Japanese", content: "こんにちは！日本語の句読点です。" },
          { lang: "French", content: "Bonjour ! Ponctuation française." }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as MultiPunctuationObj;

      expect(parsedObj.texts[0].content).assertEqual("你好！这是中文标点。");
      expect(parsedObj.texts[1].content).assertEqual("こんにちは！日本語の句読点です。");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_2300
     * @tc.name Json5Test023
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        "?q=json&page=1&limit=10",
        "?category=books&sort=price&order=asc"
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual("?q=json&page=1&limit=10");
      expect(parsedArr[1]).assertEqual("?category=books&sort=price&order=asc");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_2400
     * @tc.name Json5Test024
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ScientificNotationObj = {
        values: [
          { name: "Avogadro", number: 6.022e23 },
          { name: "Planck", number: 6.626e-34 }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as ScientificNotationObj;

      expect(parsedObj.values[0].number).assertEqual(6.022e23);
      expect(parsedObj.values[1].number).assertEqual(6.626e-34);
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_2500
     * @tc.name Json5Test025
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ZeroWidthNonJoinerObj = {
        texts: {
          original: "a\u200Cb",
          nested: { combined: "x\u200Cy" }
        }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as ZeroWidthNonJoinerObj;
      expect(parsedObj.texts.original).assertEqual("a\u200Cb");
      expect(parsedObj.texts.nested.combined).assertEqual("x\u200Cy");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_2600
     * @tc.name Json5Test026
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: ValueRangeCheckObj = {
        settings: { volume: 120, brightness: -10 }
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as ValueRangeCheckObj;

      if (parsedObj.settings.volume !== undefined) {
        parsedObj.settings.volume = Math.max(0, Math.min(100, parsedObj.settings.volume));
      }
      if (parsedObj.settings.brightness !== undefined) {
        parsedObj.settings.brightness = Math.max(0, Math.min(100, parsedObj.settings.brightness));
      }
      expect(parsedObj.settings.volume).assertEqual(100);
      expect(parsedObj.settings.brightness).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_2700
     * @tc.name Json5Test027
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: RegexPatternObj = {
        patterns: [
          { name: "Email", regex: "^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$" },
          {
            name: "URL",
            regex: "^https?:\\/\\/(www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b([-a-zA-Z0-9()@:%_\\+.~#?&//=]*)$"
          }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as RegexPatternObj;

      expect(parsedObj.patterns[0].regex).assertEqual("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_2800
     * @tc.name Json5Test028
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: AnimalEmojiObj = {
        zoo: [
          { animal: "Lion", emoji: "🦁" },
          { animal: "Elephant", emoji: "🐘" },
          { animal: "Penguin", emoji: "🐧" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as AnimalEmojiObj;

      expect(parsedObj.zoo[0].emoji).assertEqual("🦁");
      expect(parsedObj.zoo[2].animal).assertEqual("Penguin");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_2900
     * @tc.name Json5Test029
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        ".class-name > .child:nth-child(2)",
        "#id-name[data-attr='value']",
        "div:not(.exclude)"
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual(".class-name > .child:nth-child(2)");
      expect(parsedArr[1]).assertEqual("#id-name[data-attr='value']");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_3000
     * @tc.name Json5Test030
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const setA: Set<string> = new Set(["a", "b", "c"]);
      const setB: Set<string> = new Set(["b", "c", "d"]);
      const originalObj: GeneratedObjectLiteralInterface_1 = { a: setA, b: setB };

      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as GeneratedTypeLiteralInterface_2;

      const a = new Set(parsedObj.a);
      const b = new Set(parsedObj.b);
      const diffA = Array.from(a).filter(x => !b.has(x));
      const diffB = Array.from(b).filter(x => !a.has(x));
      const symmetricDiffObj: SetSymmetricDiffObj = { symmetricDiff: [...diffA, ...diffB] };

      expect(ArkTSUtils.ASON.stringify(symmetricDiffObj.symmetricDiff)).assertEqual(ArkTSUtils.ASON.stringify(["a", "d"]));
    });
    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_3100
     * @tc.name Json5Test031
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: GreetingObj = {
        greetings: [
          { lang: "Spanish", text: "¡Hola Mundo!" },
          { lang: "German", text: "Hallo Welt!" },
          { lang: "Korean", text: "안녕하세요 세계!" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as GreetingObj;

      expect(parsedObj.greetings[0].text).assertEqual("¡Hola Mundo!");
      expect(parsedObj.greetings[2].text).assertEqual("안녕하세요 세계!");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_3200
     * @tc.name Json5Test032
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: SqlQueryObj = {
        queries: [
          { name: "Select", sql: "SELECT id, name FROM users WHERE age > 18;" },
          { name: "Insert", sql: "INSERT INTO logs (message) VALUES ('error');" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as SqlQueryObj;

      expect(parsedObj.queries[0].sql).assertEqual("SELECT id, name FROM users WHERE age > 18;");
      expect(parsedObj.queries[1].sql).assertEqual("INSERT INTO logs (message) VALUES ('error');");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_3300
     * @tc.name Json5Test033
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        "npm install --save-dev typescript",
        "git commit -m 'fix: resolve issue'",
        "docker run -p 8080:80 --name app"
      ];
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalArr);
      const parsedArr = ArkTSUtils.ASON.parse(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual("npm install --save-dev typescript");
      expect(parsedArr[1]).assertEqual("git commit -m 'fix: resolve issue'");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_3400
     * @tc.name Json5Test034
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: WeatherEmojiObj = {
        forecasts: [
          { day: "Monday", emoji: "☀️" },
          { day: "Tuesday", emoji: "🌧️" },
          { day: "Wednesday", emoji: "❄️" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as WeatherEmojiObj;

      expect(parsedObj.forecasts[0].emoji).assertEqual("☀️");
      expect(parsedObj.forecasts[2].day).assertEqual("Wednesday");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_3500
     * @tc.name Json5Test035
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiLangNumberObj = {
        numbers: [
          { lang: "Arabic", symbol: "١٢٣" },
          { lang: "Hindi", symbol: "१२३" },
          { lang: "Chinese", symbol: "一二三" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as MultiLangNumberObj;

      expect(parsedObj.numbers[0].symbol).assertEqual("١٢٣");
      expect(parsedObj.numbers[2].symbol).assertEqual("一二三");
    });

    /**
     * @tc.number SUB_BUILTINS_Json5_TEST_3600
     * @tc.name Json5Test036
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: XmlTagObj = {
        elements: [
          { name: "Root", xml: "<root xmlns='http://example.com'><child>Text</child></root>" },
          { name: "Data", xml: "<data id='123' active='true'/>" }
        ]
      };
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = ArkTSUtils.ASON.parse(jsonStr) as XmlTagObj;

      expect(parsedObj.elements[0].xml).assertEqual("<root xmlns='http://example.com'><child>Text</child></root>");
      expect(parsedObj.elements[1].xml).assertEqual("<data id='123' active='true'/>");
    });


  })
}

