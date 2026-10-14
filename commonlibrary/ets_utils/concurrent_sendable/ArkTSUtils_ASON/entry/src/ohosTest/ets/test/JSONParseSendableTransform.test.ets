/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, JSON } from '@kit.ArkTS';

interface Test2_Obj1 {
  lang: string;
  symbol: string;
}

interface MultiLangArrObj {
  labels: Test2_Obj1[];
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

interface Test9_Obj1 {
  id: number;
  expression: string;
}

interface MathFormulaArrObj {
  formulas: Test9_Obj1[];
}

interface Ason5_Test10_Obj1 {
  withJoiner: string;
  withSpace: string;
}

interface ZeroWidthCharObj {
  text: Ason5_Test10_Obj1;
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

interface Ason5_Test14_Obj1 {
  name: string;
  value: string;
}

interface UnitValueObj {
  measurements: Ason5_Test14_Obj1[];
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

interface Ason5_Test17_Obj1 {
  emoji: string;
  count: number;
}

interface EmojiArrObj {
  reactions: Ason5_Test17_Obj1[];
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

interface Ason5_Test19_Obj1 {
  metadata: undefined;
  id: number;
  profile: Test19_Obj2;
}

interface FilteredDeepPropsObj {
  user: Ason5_Test19_Obj1;
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

interface Ason5_Test24_Obj1 {
  name: string;
  number: number;
}

interface ScientificNotationObj {
  values: Ason5_Test24_Obj1[];
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

interface Ason5_Test27_Obj1 {
  name: string;
  regex: string;
}

interface RegexPatternObj {
  patterns: Ason5_Test27_Obj1[];
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

interface Ason5_Test37_Obj1 {
  name: string;
  yaml: string;
}

interface YamlContentObj {
  configs: Ason5_Test37_Obj1[];
}

interface Test38_Obj1 {
  name: string;
  query: string;
}

interface GraphqlQueryObj {
  queries: Test38_Obj1[];
}

interface Ason5_Test39_Obj1 {
  name: string;
  emoji: string;
}

interface TransportEmojiObj {
  vehicles: Ason5_Test39_Obj1[];
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

interface Ason5_Test44_Obj1 {
  values: number[];
  maxValue: number;
}

interface DeepMaxObj {
  datasets: Ason5_Test44_Obj1[];
}

interface Test44_Obj3 {
  values: number[];
}

interface Test44_Obj2 {
  datasets: Test44_Obj3[];
}

interface Ason5_Test45_Obj1 {
  name: string;
  emoji: string;
}

interface TransportEmojiObj1 {
  vehicles: Ason5_Test45_Obj1[];
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

interface Ason5_ProductObj {
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

interface Ason5_Test73_Obj2 {
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

interface Ason5_Test78_Obj1 {
  id: number;
  active: boolean;
}

interface FilterActiveUsers {
  users: Ason5_Test78_Obj1[];
  active: Ason5_Test78_Obj1[];
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

interface Ason5_Test104_Obj1 {
  id: number;
}

interface Ason5_Test104_Obj2 {
  id: number;
  type: string;
}

interface AddPropCompare {
  items: Ason5_Test104_Obj1[];
  withProp: Ason5_Test104_Obj2[];
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

interface Ason5_Test124_Obj1 {
  id: number;
  name: string;
}

interface ExtractNamesCompare {
  employees: Ason5_Test124_Obj1[];
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

interface Ason5_Test134_Obj1 {
  name: string;
}

interface Test134_Obj2 {
  name: string;
  index: number;
}

interface AddIndexCompare {
  items: Ason5_Test134_Obj1[];
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

interface Ason5_GeneratedTypeLiteralInterface_1 {
  sets: string[][];
}

interface Ason5_GeneratedTypeLiteralInterface_2 {
  a: string[];
  b: string[];
}

interface Ason5_GeneratedObjectLiteralInterface_1 {
  a: Set<string>;
  b: Set<string>;
}

interface Ason5_GeneratedObjectLiteralInterface_2 {
  name: string;
  active: boolean;
}

interface Ason5_GeneratedObjectLiteralInterface_3 {
  name: string;
  price: number;
}

interface Ason5_GeneratedObjectLiteralInterface_4 {
  numbers: number[];
  frequency: Record<number, number>;
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function JSONParseSendableTransformTest() {
  describe('JSONParseSendableTransformTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(async () => {
      await sleep(30);
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0001
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
        const parsedObj = JSON.parseSendable(jsonStr) as object;
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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0002
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as MultiLangArrObj;

      expect(parsedObj.labels[0].symbol).assertEqual("Ω");
      expect(parsedObj.labels[1].symbol).assertEqual("Ё");
      expect(parsedObj.labels[2].symbol).assertEqual("ض");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0003
     * @tc.name Json5Test003
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = ["$100", "€50", "¥1000", "£20"];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr = JSON.parseSendable(jsonStr) as String[];
      expect(parsedArr[0]).assertEqual("$100");
      expect(parsedArr[1]).assertEqual("€50");
      expect(parsedArr[2]).assertEqual("¥1000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0004
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
      const parsedArr = JSON.parseSendable(jsonStr) as object[];
      expect(JSON.stringify(parsedArr)).assertEqual('[{"a":1,"b":2},{"c":3}]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0005
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
      const jsonStr: string = JSON.stringify(filteredObj);
      const parsedObj = JSON.parseSendable(jsonStr) as FilteredPropsArr;
      expect(parsedObj.users[1].name).assertEqual("Grace");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0006
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as EmojiNestedObj;

      expect(parsedObj.user.name).assertEqual("😊 Alice");
      expect(parsedObj.user.status).assertEqual("🎉 Online");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0007
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as DefaultValueDeepObj;
      expect(parsedObj.config.layout).assertEqual(undefined);
      expect(parsedObj.config.nested.timeout).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0008
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
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as AgeDiffCompare;
      if (parsed.people.length >= 2) {
        parsed.diffs.push(Math.abs(parsed.people[0].age - parsed.people[1].age));
      }
      expect(parsed.diffs.length).assertEqual(1);
      expect(parsed.diffs[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0009
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as MathFormulaArrObj;

      expect(parsedObj.formulas[0].expression).assertEqual("a² + b² = c²");
      expect(parsedObj.formulas[1].expression).assertEqual("E = mc²");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0010
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as ZeroWidthCharObj;

      expect(parsedObj.text.withJoiner).assertEqual("a\u200Db");
      expect(parsedObj.text.withSpace).assertEqual("x\u200By");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0011
     * @tc.name Json5Test011
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: CaseConvertArr = {
        tags: ["js", "Ason", "TypeScript"]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj =  JSON.parseSendable(jsonStr) as CaseConvertArr;
      if (parsedObj.tags && Array.isArray(parsedObj.tags)) {
        parsedObj.tags = parsedObj.tags.map(tag => tag.toUpperCase());
      }

      expect(JSON.stringify(parsedObj.tags)).assertEqual(JSON.stringify(["js", "Ason", "TypeScript"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0012
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as SpecialCharConfigObj;

      expect(parsedObj.settings.api_endpoint).assertEqual("https://api.example.com/v1");
      expect(parsedObj.settings.nested.timeout_ms).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0013
     * @tc.name Json5Test013
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalSet: Set<string> = new Set(["b", "a", "c"]);
      const jsonStr: string = ArkTSUtils.ASON.stringify(originalSet);
      const parsedArr = JSON.parseSendable(jsonStr) as string[];

      expect(JSON.stringify(parsedArr)).assertEqual(JSON.stringify(["b", "a", "c"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0014
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as UnitValueObj;

      expect(parsedObj.measurements[0].value).assertEqual("180cm");
      expect(parsedObj.measurements[2].value).assertEqual("36.5°C");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0015
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as ElementFrequencyObj;
      const freq = parsedObj.numbers.reduce((map, num) => {
        map[num] = (map[num] || 0) + 1;
        return map;
      }, {} as Record<number, number>);
      const result: Ason5_GeneratedObjectLiteralInterface_4 = {
        numbers: parsedObj.numbers,
        frequency: freq
      };
      expect(result.frequency[1]).assertEqual(2);
      expect(result.frequency[2]).assertEqual(2);
      expect(result.frequency[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0016
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as DeepAvgObj;


      expect(parsedObj.groups[0].avgScore).assertEqual(undefined);
      expect(parsedObj.groups[1].avgScore).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0017
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as EmojiArrObj;

      expect(parsedObj.reactions[0].emoji).assertEqual("👍");
      expect(parsedObj.reactions[1].count).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0018
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
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as SumCountCompare;
      let sum = 0;
      parsed.numbers.forEach(n => sum += n);
      parsed.sum = sum;
      parsed.count = parsed.numbers.length;
      expect(parsed.sum).assertEqual(6);
      expect(parsed.count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0019
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

      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj  = JSON.parseSendable(jsonStr) as FilteredDeepPropsObj;

      expect(parsedObj.user.profile.age === 35).assertEqual(true);
      expect(parsedObj.user.metadata === 123456).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0020
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
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr = JSON.parseSendable(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual("/home/user/docs/file name.txt");
      expect(parsedArr[2]).assertEqual("C:\\Program Files\\app.exe");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0021
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
      const parsedObj = JSON.parseSendable(jsonStr) as Ason5_GeneratedTypeLiteralInterface_1;
      const unionSet = new Set<string>();
      parsedObj.sets.forEach(arr => arr.forEach(item => unionSet.add(item)));
      const unionObj: SetUnionObj = { union: Array.from(unionSet) };

      expect(JSON.stringify(unionObj.union.sort())).assertEqual(JSON.stringify(["a", "b", "c", "d", "e"].sort()));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0022
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as MultiPunctuationObj;

      expect(parsedObj.texts[0].content).assertEqual("你好！这是中文标点。");
      expect(parsedObj.texts[1].content).assertEqual("こんにちは！日本語の句読点です。");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0023
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
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr = JSON.parseSendable(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual("?q=json&page=1&limit=10");
      expect(parsedArr[1]).assertEqual("?category=books&sort=price&order=asc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0024
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as ScientificNotationObj;

      expect(parsedObj.values[0].number).assertEqual(6.022e23);
      expect(parsedObj.values[1].number).assertEqual(6.626e-34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0025
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as ZeroWidthNonJoinerObj;
      expect(parsedObj.texts.original).assertEqual("a\u200Cb");
      expect(parsedObj.texts.nested.combined).assertEqual("x\u200Cy");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0026
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as ValueRangeCheckObj;

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
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0027
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as RegexPatternObj;

      expect(parsedObj.patterns[0].regex).assertEqual("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0028
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as AnimalEmojiObj;

      expect(parsedObj.zoo[0].emoji).assertEqual("🦁");
      expect(parsedObj.zoo[2].animal).assertEqual("Penguin");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0029
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
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr = JSON.parseSendable(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual(".class-name > .child:nth-child(2)");
      expect(parsedArr[1]).assertEqual("#id-name[data-attr='value']");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0030
     * @tc.name Json5Test030
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const setA: Set<string> = new Set(["a", "b", "c"]);
      const setB: Set<string> = new Set(["b", "c", "d"]);
      const originalObj: Ason5_GeneratedObjectLiteralInterface_1 = { a: setA, b: setB };

      const jsonStr: string = ArkTSUtils.ASON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as Ason5_GeneratedTypeLiteralInterface_2;

      const a = new Set(parsedObj.a);
      const b = new Set(parsedObj.b);
      const diffA = Array.from(a).filter(x => !b.has(x));
      const diffB = Array.from(b).filter(x => !a.has(x));
      const symmetricDiffObj: SetSymmetricDiffObj = { symmetricDiff: [...diffA, ...diffB] };

      expect(JSON.stringify(symmetricDiffObj.symmetricDiff)).assertEqual(JSON.stringify(["a", "d"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0031
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as GreetingObj;

      expect(parsedObj.greetings[0].text).assertEqual("¡Hola Mundo!");
      expect(parsedObj.greetings[2].text).assertEqual("안녕하세요 세계!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0032
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as SqlQueryObj;

      expect(parsedObj.queries[0].sql).assertEqual("SELECT id, name FROM users WHERE age > 18;");
      expect(parsedObj.queries[1].sql).assertEqual("INSERT INTO logs (message) VALUES ('error');");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0033
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
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr = JSON.parseSendable(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual("npm install --save-dev typescript");
      expect(parsedArr[1]).assertEqual("git commit -m 'fix: resolve issue'");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0034
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as WeatherEmojiObj;

      expect(parsedObj.forecasts[0].emoji).assertEqual("☀️");
      expect(parsedObj.forecasts[2].day).assertEqual("Wednesday");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0035
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as MultiLangNumberObj;

      expect(parsedObj.numbers[0].symbol).assertEqual("١٢٣");
      expect(parsedObj.numbers[2].symbol).assertEqual("一二三");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0036
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
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as XmlTagObj;

      expect(parsedObj.elements[0].xml).assertEqual("<root xmlns='http://example.com'><child>Text</child></root>");
      expect(parsedObj.elements[1].xml).assertEqual("<data id='123' active='true'/>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0037
     * @tc.name Json5Test037
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: YamlContentObj = {
        configs: [
          { name: "App", yaml: "app:\n  name: myapp\n  version: 1.0.0\n  enabled: true" },
          { name: "DB", yaml: "database:\n  host: localhost\n  port: 5432" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as YamlContentObj;

      expect(parsedObj.configs[0].yaml).assertEqual("app:\n  name: myapp\n  version: 1.0.0\n  enabled: true");
      expect(parsedObj.configs[1].yaml).assertEqual("database:\n  host: localhost\n  port: 5432");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0038
     * @tc.name Json5Test038
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: GraphqlQueryObj = {
        queries: [
          { name: "Users", query: "query Users($limit: Int) { users(limit: $limit) { id name email } }" },
          { name: "Post", query: "mutation CreatePost($title: String!) { createPost(title: $title) { id } }" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as GraphqlQueryObj;

      expect(parsedObj.queries[0].query)
        .assertEqual("query Users($limit: Int) { users(limit: $limit) { id name email } }");
      expect(parsedObj.queries[1].query)
        .assertEqual("mutation CreatePost($title: String!) { createPost(title: $title) { id } }");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0039
     * @tc.name Json5Test039
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: TransportEmojiObj = {
        vehicles: [
          { name: "Car", emoji: "🚗" },
          { name: "Train", emoji: "🚂" },
          { name: "Plane", emoji: "✈️" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as TransportEmojiObj1;
      expect(parsedObj.vehicles[0].emoji).assertEqual("🚗");
      expect(parsedObj.vehicles[2].name).assertEqual("Plane");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0040
     * @tc.name Json5Test040
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalArr: string[] = [
        "$.store.book[0].title",
        "$.store.book[*].author",
        "$.store..price"
      ];
      const jsonStr: string = JSON.stringify(originalArr);
      const parsedArr = JSON.parseSendable(jsonStr) as string[];

      expect(parsedArr[0]).assertEqual("$.store.book[0].title");
      expect(parsedArr[2]).assertEqual("$.store..price");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0041
     * @tc.name Json5Test041
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: MultiLangPunctObj = {
        messages: {
          en: "Hello! How are you?",
          fr: "Bonjour ! Comment allez-vous ?",
          zh: "你好！你怎么样？"
        }
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as MultiLangPunctObj;

      expect(parsedObj.messages.fr).assertEqual("Bonjour ! Comment allez-vous ?");
      expect(parsedObj.messages.zh).assertEqual("你好！你怎么样？");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0042
     * @tc.name Json5Test042
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: DockerCommandObj = {
        commands: [
          { name: "Build", cmd: "docker build -t myapp:1.0 -f Dockerfile ." },
          { name: "Run", cmd: "docker run -d -p 80:80 --name app myapp:1.0" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as DockerCommandObj;

      expect(parsedObj.commands[0].cmd).assertEqual("docker build -t myapp:1.0 -f Dockerfile .");
      expect(parsedObj.commands[1].cmd).assertEqual("docker run -d -p 80:80 --name app myapp:1.0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0043
     * @tc.name Json5Test043
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: JavaAnnotationObj = {
        annotations: [
          { name: "Controller", code: "@RestController\n@RequestMapping(\"/api/users\")" },
          { name: "Service", code: "@Service\npublic class UserService {}" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as JavaAnnotationObj;

      expect(parsedObj.annotations[0].code).assertEqual("@RestController\n@RequestMapping(\"/api/users\")");
      expect(parsedObj.annotations[1].code).assertEqual("@Service\npublic class UserService {}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0044
     * @tc.name Json5Test044
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: Test44_Obj2 = {
        datasets: [
          { values: [5, 2, 8, 1] },
          { values: [10, 3, 7] }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as DeepMaxObj;

      expect(parsedObj.datasets[0].maxValue).assertEqual(undefined);
      expect(parsedObj.datasets[1].maxValue).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0045
     * @tc.name Json5Test045
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const originalObj: TransportEmojiObj1 = {
        vehicles: [
          { name: "Car", emoji: "🚗" },
          { name: "Train", emoji: "🚂" },
          { name: "Plane", emoji: "✈️" }
        ]
      };
      const jsonStr: string = JSON.stringify(originalObj);
      const parsedObj = JSON.parseSendable(jsonStr) as TransportEmojiObj1;

      expect(parsedObj.vehicles[0].emoji).assertEqual("🚗");
      expect(parsedObj.vehicles[2].name).assertEqual("Plane");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0046
     * @tc.name Json5Test047
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PositiveSumObj = { numbers: [1, -2, 3], sum: 0 };
      const json = JSON.stringify(obj);
      const parsed: PositiveSumObj = JSON.parseSendable(json) as PositiveSumObj;

      let sum = 0;
      parsed.numbers.forEach((n: number) => {
        if (n >= 0) {
          sum += n;
        }
      });
      parsed.sum = sum;

      expect(parsed.sum).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0047
     * @tc.name Json5Test048
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UpperCaseArr = { words: ["a", "b"], upper: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as UpperCaseArr;

      const result: UpperCaseArr = {
        words: parsed.words,
        upper: parsed.words.map(w => w.toUpperCase())
      };

      expect(JSON.stringify(result.upper)).assertEqual(JSON.stringify(["A", "B"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0048
     * @tc.name Json5Test049
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: EvenNumbers = { data: [1, 2, 3], evens: [] };

      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as EvenNumbers;

      const evens: number[] = [];
      parsed.data.forEach((n: number) => {
        if (n % 2 === 0) {
          evens.push(n);
        }
      });
      const result: EvenNumbers = {
        data: parsed.data,
        evens: evens
      };

      expect(JSON.stringify(result.evens)).assertEqual(JSON.stringify([2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0049
     * @tc.name Json5Test050
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AverageObj = { values: [2, 4, 6], avg: 0 };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as AverageObj;

      let sum = 0;
      parsed.values.forEach((n: number) => sum += n);
      const average = sum / parsed.values.length;

      const result: AverageObj = {
        values: parsed.values,
        avg: average
      };
      expect(result.avg).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0050
     * @tc.name Json5Test051
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: StringLengths = { texts: ["a", "bb"], lengths: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as StringLengths;
      const lengths: number[] = [];
      parsed.texts.forEach((t: string) => lengths.push(t.length));

      const result: StringLengths = {
        texts: parsed.texts,
        lengths: lengths
      };;
      expect(JSON.stringify(result.lengths)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0051
     * @tc.name Json5Test052
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: HourExtract = { times: ["12:30", "15:45"], hours: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as HourExtract;

      const hours: number[] = [];
      parsed.times.forEach((t: string) => {
        const hourPart = t.split(":")[0];
        hours.push(parseInt(hourPart));
      });

      const result: HourExtract = {
        times: parsed.times,
        hours: hours
      };
      expect(JSON.stringify(result.hours)).assertEqual(JSON.stringify([12, 15]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0052
     * @tc.name Json5Test053
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LongStrings = { strings: ["a", "abc"], long: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as LongStrings;
      const longStrings: string[] = [];
      parsed.strings.forEach((s: string) => {
        if (s.length > 2) {
          longStrings.push(s);
        }
      });

      const result: LongStrings = {
        strings: parsed.strings,
        long: longStrings
      };
      expect(JSON.stringify(result.long)).assertEqual(JSON.stringify(["abc"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0053
     * @tc.name Json5Test054
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RoundedNumbers = { nums: [1.2, 2.8], rounded: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as RoundedNumbers;

      const rounded: number[] = [];
      parsed.nums.forEach((n: number) => rounded.push(Math.round(n)));
      const result: RoundedNumbers = {
        nums: parsed.nums,
        rounded: rounded
      };
      expect(JSON.stringify(result.rounded)).assertEqual(JSON.stringify([1, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0054
     * @tc.name Json5Test055
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PositiveCount = { numbers: [-1, 2, 3], count: 0 };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as PositiveCount;
      let count = 0;
      parsed.numbers.forEach((n: number) => {
        if (n > 0) {
          count++;
        }
      });

      const result: PositiveCount = {
        numbers: parsed.numbers,
        count: count
      };
      expect(result.count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0055
     * @tc.name Json5Test056
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      const obj: FirstLetters = { words: ["apple", "banana"], letters: [] };
      const json = JSON.stringify(obj);
      const parsed: FirstLetters = JSON.parseSendable(json) as FirstLetters;

      const letters: string[] = [];
      parsed.words.forEach((w: string) => letters.push(w[0]));

      const result: FirstLetters = {
        words: parsed.words,
        letters: letters
      };
      expect(JSON.stringify(result.letters)).assertEqual(JSON.stringify(["a", "b"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0056
     * @tc.name Json5Test057
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReversedArr = { data: ["a", "b"], reversed: [] };
      const json = JSON.stringify(obj);
      const parsed: ReversedArr = JSON.parseSendable(json) as ReversedArr;
      const reversed: string[] = [];
      for (let i = parsed.data.length - 1; i >= 0; i--) {
        reversed.push(parsed.data[i]);
      }

      const result: ReversedArr = {
        data: parsed.data,
        reversed: reversed
      };
      expect(JSON.stringify(result.reversed)).assertEqual(JSON.stringify(["b", "a"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0057
     * @tc.name Json5Test058
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SquaredNumbers = { numbers: [2, 3], squares: [] };
      const json = JSON.stringify(obj);
      const parsed: SquaredNumbers = JSON.parseSendable(json) as SquaredNumbers;

      const squares: number[] = [];
      parsed.numbers.forEach((n: number) => squares.push(n * n));

      const result: SquaredNumbers = {
        numbers: parsed.numbers,
        squares: squares
      };

      expect(JSON.stringify(result.squares)).assertEqual(JSON.stringify([4, 9]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0058
     * @tc.name Json5Test059
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SubstringFilter = { strings: ["abc", "def"], filtered: [] };
      const json = JSON.stringify(obj);
      const parsed: SubstringFilter = JSON.parseSendable(json) as SubstringFilter;

      const filtered: string[] = [];
      parsed.strings.forEach((s: string) => {
        if (s.includes("b")) {
          filtered.push(s);
        }
      });
      const result: SubstringFilter = {
        strings: parsed.strings,
        filtered: filtered
      };
      expect(JSON.stringify(result.filtered)).assertEqual(JSON.stringify(["abc"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0059
     * @tc.name Json5Test060
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: YearExtract = { dates: ["2020-01-01", "2021-02-02"], years: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as YearExtract;

      const years: number[] = [];
      parsed.dates.forEach((d: string) => {
        const yearPart = d.split("-")[0];
        years.push(parseInt(yearPart));
      });

      const result: YearExtract = {
        dates: parsed.dates,
        years: years
      };
      expect(JSON.stringify(result.years)).assertEqual(JSON.stringify([2020, 2021]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0060
     * @tc.name Json5Test061
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumSkipZero = { values: [1, 0, 2], sum: 0 };
      const json = JSON.stringify(obj);
      const parsed: SumSkipZero = JSON.parseSendable(json) as SumSkipZero;
      let sum = 0;
      parsed.values.forEach((n: number) => {
        if (n !== 0) {
          sum += n;
        }
      });
      const result: SumSkipZero = {
        values: parsed.values,
        sum: sum
      };
      expect(result.sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0061
     * @tc.name Json5Test062
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: StringConcat = { parts: ["a", "b"], combined: "" };
      const json = JSON.stringify(obj);
      const parsed: StringConcat = JSON.parseSendable(json) as StringConcat;

      let combined = "";
      parsed.parts.forEach((p: string) => combined += p);

      const result: StringConcat = {
        parts: parsed.parts,
        combined: combined
      };
      expect(result.combined).assertEqual("ab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0062
     * @tc.name Json5Test063
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ThresholdFilter = { numbers: [5, 10, 15], above: [] };
      const json = JSON.stringify(obj);
      const parsed: ThresholdFilter = JSON.parseSendable(json) as ThresholdFilter;

      const above: number[] = [];
      parsed.numbers.forEach((n: number) => {
        if (n > 10) {
          above.push(n);
        }
      });

      const result: ThresholdFilter = {
        numbers: parsed.numbers,
        above: above
      };
      expect(JSON.stringify(result.above)).assertEqual(JSON.stringify([15]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0063
     * @tc.name Json5Test064
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LowerCaseArr = { words: ["A", "B"], lower: [] };
      const json = JSON.stringify(obj);
      const parsed: LowerCaseArr = JSON.parseSendable(json) as LowerCaseArr;

      const lower: string[] = [];
      parsed.words.forEach((w: string) => lower.push(w.toLowerCase()));

      const result: LowerCaseArr = {
        words: parsed.words,
        lower: lower
      };
      expect(JSON.stringify(result.lower)).assertEqual(JSON.stringify(["a", "b"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0064
     * @tc.name Json5Test065
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: Ason5_ProductObj = { factors: [2, 3], product: 1 };
      const json = JSON.stringify(obj);
      const parsed: Ason5_ProductObj = JSON.parseSendable(json) as Ason5_ProductObj;

      let product = 1;
      parsed.factors.forEach((n: number) => product *= n);
      const result: Ason5_ProductObj = {
        factors: parsed.factors,
        product: product
      };

      expect(result.product).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0065
     * @tc.name Json5Test066
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LastElement = { items: ["a", "b"], last: "" };
      const json = JSON.stringify(obj);
      const parsed: LastElement = JSON.parseSendable(json) as LastElement;

      const last = parsed.items.length > 0 ? parsed.items[parsed.items.length - 1] : "";
      const result: LastElement = {
        items: parsed.items,
        last: last
      };
      expect(result.last).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0066
     * @tc.name Json5Test067
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CharCount = { text: "abac", count: 0 };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as CharCount;

      let count = 0;
      for (let i = 0; i < parsed.text.length; i++) {
        if (parsed.text[i] === "a") {
          count++;
        }
      }
      const result: CharCount = {
        text: parsed.text,
        count: count
      };
      expect(result.count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0067
     * @tc.name Json5Test068
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: BinaryNumbers = { numbers: [2, 3], binary: [] };
      const json = JSON.stringify(obj);
      const parsed: BinaryNumbers = JSON.parseSendable(json) as BinaryNumbers;

      const binary: string[] = [];
      parsed.numbers.forEach((n: number) => binary.push(n.toString(2)));
      const result: BinaryNumbers = {
        numbers: parsed.numbers,
        binary: binary
      };
      expect(JSON.stringify(result.binary)).assertEqual(JSON.stringify(["10", "11"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0068
     * @tc.name Json5Test070
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ArrayLength = { data: [1, 2, 3], length: 0 };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ArrayLength;

      const result: ArrayLength = {
        data: parsed.data,
        length: parsed.data.length
      };
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0069
     * @tc.name Json5Test071
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: StringReplace = { text: "abc", replaced: "" };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as StringReplace;

      const replaced = parsed.text.replace("a", "x");
      const result: StringReplace = {
        text: parsed.text,
        replaced: replaced
      };
      expect(result.replaced).assertEqual("xbc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0070
     * @tc.name Json5Test072
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RangeCheck = { numbers: [5, 15, 25], inRange: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as RangeCheck;

      const inRange: number[] = [];
      parsed.numbers.forEach((n: number) => {
        if (n >= 10 && n <= 20) {
          inRange.push(n);
        }
      });
      const result: RangeCheck = {
        numbers: parsed.numbers,
        inRange: inRange
      };
      expect(JSON.stringify(result.inRange)).assertEqual(JSON.stringify([15]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0071
     * @tc.name Json5Test073
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractProps = { items: [{ name: "a" }, { name: "b" }], names: [] };
      const json = JSON.stringify(obj);
      const parsed: ExtractProps = JSON.parseSendable(json) as ExtractProps;

      const names: string[] = [];
      parsed.items.forEach((i: Ason5_Test73_Obj2) => names.push(i.name));
      const result: ExtractProps = {
        items: parsed.items,
        names: names
      };
      expect(JSON.stringify(result.names)).assertEqual(JSON.stringify(["a", "b"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0072
     * @tc.name Json5Test074
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TrimStrings = { texts: [" a ", "b "], trimmed: [] };
      const json = JSON.stringify(obj);
      const parsed: TrimStrings = JSON.parseSendable(json) as TrimStrings;

      const trimmed: string[] = [];
      parsed.texts.forEach((s: string) => trimmed.push(s.trim()));
      const result: TrimStrings = {
        texts: parsed.texts,
        trimmed: trimmed
      };
      expect(JSON.stringify(result.trimmed)).assertEqual(JSON.stringify(["a", "b"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0073
     * @tc.name Json5Test075
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MaxValue = { numbers: [3, 1, 4], max: 0 };
      const json = JSON.stringify(obj);
      const parsed: MaxValue = JSON.parseSendable(json) as MaxValue;

      let max = parsed.numbers[0];
      parsed.numbers.forEach((n: number) => {
        if (n > max) {
          max = n;
        }
      });
      const result: MaxValue = {
        numbers: parsed.numbers,
        max: max
      };
      expect(result.max).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0074
     * @tc.name Json5Test076
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UniqueElements = { data: [1, 2, 2], unique: [] };
      const json = JSON.stringify(obj);
      const parsed: UniqueElements = JSON.parseSendable(json) as UniqueElements;

      const unique: number[] = [];
      parsed.data.forEach((n: number) => {
        if (!unique.includes(n)) {
          unique.push(n);
        }
      });
      const result: UniqueElements = {
        data: parsed.data,
        unique: unique
      };
      expect(JSON.stringify(result.unique)).assertEqual("[1,2]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0075
     * @tc.name Json5Test077
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: NumToStringArr = { numbers: [10, 20], strings: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as NumToStringArr;


      const strings: string[] = [];
      parsed.numbers.forEach(n => strings.push(n.toString()));
      const result: NumToStringArr = {
        numbers: parsed.numbers,
        strings: strings
      };
      expect(JSON.stringify(result.strings)).assertEqual('["10","20"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0076
     * @tc.name Json5Test078
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FilterActiveUsers = {
        users: [{ id: 1, active: true }, { id: 2, active: false }],
        active: []
      };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as FilterActiveUsers;

      const active: Ason5_Test78_Obj1[] = [];
      parsed.users.forEach(u => {
        if (u.active) {
          active.push(u);
        }
      });
      const result: FilterActiveUsers = {
        users: parsed.users,
        active: active
      };
      expect(JSON.stringify(result.active)).assertEqual("[{\"id\":1,\"active\":true}]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0077
     * @tc.name Json5Test079
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TotalStringLength = { words: ["a", "bc"], total: 0 };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as TotalStringLength;

      let total = 0;
      parsed.words.forEach(w => total += w.length);
      const result: TotalStringLength = {
        words: parsed.words,
        total: total
      };

      expect(result.total).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0078
     * @tc.name Json5Test080
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ToPercentage = { values: [0.1, 0.5], percentages: [] };
      const json = JSON.stringify(obj);
      const parsed: ToPercentage = JSON.parseSendable(json) as ToPercentage;

      const percentages: string[] = [];
      parsed.values.forEach(n => percentages.push((n * 100) + "%"));
      const result: ToPercentage = {
        values: parsed.values,
        percentages: percentages
      };

      expect(JSON.stringify(result.percentages)).assertEqual('["10%","50%"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0079
     * @tc.name Json5Test081
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: EvenLengthStrings = { strings: ["a", "bb", "ccc"], even: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as EvenLengthStrings;

      const even: string[] = [];
      parsed.strings.forEach(s => {
        if (s.length % 2 === 0) {
          even.push(s);
        }
      });
      const result: EvenLengthStrings = {
        strings: parsed.strings,
        even: even
      };
      expect(JSON.stringify(result.even)).assertEqual('["bb"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0080
     * @tc.name Json5Test082
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractMonths = { dates: ["2024-03-01", "2024-09-15"], months: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ExtractMonths;

      const months: string[] = [];
      parsed.dates.forEach(d => months.push(d.split("-")[1]));
      const result: ExtractMonths = {
        dates: parsed.dates,
        months: months
      };
      expect(JSON.stringify(result.months)).assertEqual('["03","09"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0081
     * @tc.name Json5Test083
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CubedNumbers = { numbers: [2, 3], cubes: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as CubedNumbers;

      const cubes: number[] = [];
      parsed.numbers.forEach(n => cubes.push(n * n * n));
      const result: CubedNumbers = {
        numbers: parsed.numbers,
        cubes: cubes
      };
      expect(JSON.stringify(result.cubes)).assertEqual("[8,27]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0082
     * @tc.name Json5Test084
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CapitalizedWords = { words: ["apple", "banana"], capitalized: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as CapitalizedWords;

      const capitalized: string[] = [];
      parsed.words.forEach(w => {
        capitalized.push(w.charAt(0).toUpperCase() + w.slice(1));
      });
      const result: CapitalizedWords = {
        words: parsed.words,
        capitalized: capitalized
      };
      expect(JSON.stringify(result.capitalized)).assertEqual('["Apple","Banana"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0083
     * @tc.name Json5Test085
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: RoundedAverage = { values: [1, 2, 3, 4], avg: 0 };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as RoundedAverage;

      let sum = 0;
      parsed.values.forEach(n => sum += n);
      const average = sum / parsed.values.length;
      const roundedAvg = Math.round(average * 10) / 10;
      const result: RoundedAverage = {
        values: parsed.values,
        avg: roundedAvg
      };
      expect(result.avg).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0084
     * @tc.name Json5Test086
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: NegativeCount = { numbers: [-1, 2, -3], count: 0 };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as NegativeCount;

      let count = 0;
      parsed.numbers.forEach(n => {
        if (n < 0) {
          count++;
        }
      });
      const result: NegativeCount = {
        numbers: parsed.numbers,
        count: count
      };
      expect(result.count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0085
     * @tc.name Json5Test087
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: JoinedWithSeparator = { words: ["a", "b", "c"], joined: "" };
      const json = JSON.stringify(obj);
      const parsed: JoinedWithSeparator = JSON.parseSendable(json) as JoinedWithSeparator;

      let joined = "";
      for (let i = 0; i < parsed.words.length; i++) {
        joined += parsed.words[i];
        if (i < parsed.words.length - 1) {
          joined += "-";
        }
      }
      const result: JoinedWithSeparator = {
        words: parsed.words,
        joined: joined
      };

      expect(result.joined).assertEqual("a-b-c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0086
     * @tc.name Json5Test088
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumOfSquares = { numbers: [1, 2, 3], sum: 0 };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as SumOfSquares;

      let sum = 0;
      parsed.numbers.forEach(n => sum += n * n);
      const result: SumOfSquares = {
        numbers: parsed.numbers,
        sum: sum
      };
      expect(result.sum).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0087
     * @tc.name Json5Test089
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumByProperty = {
        orders: [{ id: 1, amount: 10 }, { id: 2, amount: 20 }],
        total: 0
      };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as SumByProperty;

      let total = 0;
      parsed.orders.forEach(o => total += o.amount);
      const result: SumByProperty = {
        orders: parsed.orders,
        total: total
      };
      expect(result.total).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0088
     * @tc.name Json5Test090
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ConditionalSum = {
        transactions: [{ type: "income", amount: 100 }, { type: "expense", amount: 50 }],
        income: 0
      };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ConditionalSum;

      let income = 0;
      parsed.transactions.forEach(t => {
        if (t.type === "income") {
          income += t.amount;
        }
      });
      const result: ConditionalSum = {
        transactions: parsed.transactions,
        income: income
      };
      expect(result.income).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0089
     * @tc.name Json5Test091
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MinValue = { numbers: [3, 1, 4], min: 0 };
      const json = JSON.stringify(obj);
      const parsed: MinValue = JSON.parseSendable(json) as MinValue;

      let min = parsed.numbers[0];
      parsed.numbers.forEach(n => {
        if (n < min) {
          min = n;
        }
      });
      const result: MinValue = {
        numbers: parsed.numbers,
        min: min
      };
      expect(result.min).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0090
     * @tc.name Json5Test092
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LowercaseCompare = { words: ["Apple", "BANANA"], lowercase: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as LowercaseCompare;

      const lowercase: string[] = [];
      parsed.words.forEach(w => lowercase.push(w.toLowerCase()));
      const result: LowercaseCompare = {
        words: parsed.words,
        lowercase: lowercase
      };
      expect(JSON.stringify(result.lowercase)).assertEqual(JSON.stringify(["apple", "banana"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0091
     * @tc.name Json5Test093
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: EvenCompare = { numbers: [1, 2, 3, 4], evens: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as EvenCompare;

      const evens: number[] = [];
      parsed.numbers.forEach(n => {
        if (n % 2 === 0) {
          evens.push(n);
        }
      });
      const result: EvenCompare = {
        numbers: parsed.numbers,
        evens: evens
      };
      expect(JSON.stringify(result.evens)).assertEqual(JSON.stringify([2, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0092
     * @tc.name Json5Test094
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractIdCompare = {
        users: [{ id: 1, name: "A" }, { id: 2, name: "B" }],
        ids: []
      };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ExtractIdCompare;

      const ids: number[] = [];
      parsed.users.forEach(u => ids.push(u.id));
      const result: ExtractIdCompare = {
        users: parsed.users,
        ids: ids
      };

      expect(JSON.stringify(result.ids)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0093
     * @tc.name Json5Test095
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SquareCompare = { numbers: [2, 3, 4], squares: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as SquareCompare;

      const squares: number[] = [];
      parsed.numbers.forEach(n => squares.push(n * n));
      const result: SquareCompare = {
        numbers: parsed.numbers,
        squares: squares
      };

      expect(JSON.stringify(result.squares)).assertEqual(JSON.stringify([4, 9, 16]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0094
     * @tc.name Json5Test096
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ConcatCompare = { parts: ["a", "b", "c"], combined: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ConcatCompare;

      const combined: string[] = [];
      combined.push(parsed.parts[0] + parsed.parts[1] + parsed.parts[2]);

      const result: ConcatCompare = {
        parts: parsed.parts,
        combined: combined
      };
      expect(JSON.stringify(result.combined)).assertEqual(JSON.stringify(["abc"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0095
     * @tc.name Json5Test097
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractDayCompare = { dates: ["2024-03-05", "2024-09-12"], days: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ExtractDayCompare;

      const days: string[] = [];
      parsed.dates.forEach(date => days.push(date.split("-")[2]));

      const result: ExtractDayCompare = {
        dates: parsed.dates,
        days: days
      };

      expect(JSON.stringify(result.days)).assertEqual(JSON.stringify(["05", "12"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0096
     * @tc.name Json5Test098
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GreaterThanTenCompare = { numbers: [5, 12, 8, 15], result: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as GreaterThanTenCompare;

      const resultArr: number[] = [];
      parsed.numbers.forEach(n => {
        if (n > 10) {
          resultArr.push(n);
        }
      });

      const result: GreaterThanTenCompare = {
        numbers: parsed.numbers,
        result: resultArr
      };
      expect(JSON.stringify(result.result)).assertEqual(JSON.stringify([12, 15]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0097
     * @tc.name Json5Test099
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CapitalCompare = { words: ["apple", "banana"], capitalized: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as CapitalCompare;

      const capitalized: string[] = [];
      parsed.words.forEach(w => {
        capitalized.push(w.charAt(0).toUpperCase() + w.slice(1));
      });

      const result: CapitalCompare = {
        words: parsed.words,
        capitalized: capitalized
      };
      expect(JSON.stringify(result.capitalized)).assertEqual(JSON.stringify(["Apple", "Banana"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0098
     * @tc.name Json5Test100
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ActiveUserCompare = {
        users: [{ name: "A", active: true }, { name: "B", active: false }],
        active: []
      };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ActiveUserCompare;

      const active: Test100_Obj1[] = [];
      parsed.users.forEach(u => {
        if (u.active) {
          active.push(u);
        }
      });
      const result: ActiveUserCompare = {
        users: parsed.users,
        active: active
      };

      expect(JSON.stringify(result.active)).assertEqual(JSON.stringify([({
        name: "A",
        active: true
      } as Ason5_GeneratedObjectLiteralInterface_2)]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0099
     * @tc.name Json5Test101
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumToArrayCompare = { numbers: [1, 2, 3], sum: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as SumToArrayCompare;

      let sum = 0;
      parsed.numbers.forEach(n => sum += n);
      const result: SumToArrayCompare = {
        numbers: parsed.numbers,
        sum: [sum]
      };

      expect(JSON.stringify(result.sum)).assertEqual(JSON.stringify([6]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0100
     * @tc.name Json5Test102
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReverseElementsCompare = { strings: ["abc", "de"], reversed: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ReverseElementsCompare;

      const reversed: string[] = [];
      parsed.strings.forEach(s => {
        let rev = "";
        for (let i = s.length - 1; i >= 0; i--) {
          rev += s[i];
        }
        reversed.push(rev);
      });
      const result: ReverseElementsCompare = {
        strings: parsed.strings,
        reversed: reversed
      };
      expect(JSON.stringify(result.reversed)).assertEqual(JSON.stringify(["cba", "ed"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0101
     * @tc.name Json5Test103
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: DivisibleByFiveCompare = { numbers: [5, 12, 15, 7], result: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as DivisibleByFiveCompare;

      const resultArr: number[] = [];
      parsed.numbers.forEach(n => {
        if (n % 5 === 0) {
          resultArr.push(n);
        }
      });
      const result: DivisibleByFiveCompare = {
        numbers: parsed.numbers,
        result: resultArr
      };
      expect(JSON.stringify(result.result)).assertEqual(JSON.stringify([5, 15]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0102
     * @tc.name Json5Test104
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AddPropCompare = { items: [{ id: 1 }, { id: 2 }], withProp: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as AddPropCompare;

      const withProp: Ason5_Test104_Obj2[] = [];
      parsed.items.forEach(i => withProp.push({ id: i.id, type: "test" }));
      const result: AddPropCompare = {
        items: parsed.items,
        withProp: withProp
      };

      expect(JSON.stringify(result.withProp))
        .assertEqual('[{"id":1,"type":"test"},{"id":2,"type":"test"}]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0103
     * @tc.name Json5Test105
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LengthStatsCompare = { strings: ["a", "bb", "ccc"], lengths: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as LengthStatsCompare;

      const lengths: number[] = [];
      parsed.strings.forEach(s => lengths.push(s.length));
      const result: LengthStatsCompare = {
        strings: parsed.strings,
        lengths: lengths
      };
      expect(JSON.stringify(result.lengths)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0104
     * @tc.name Json5Test106
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: WithUnitCompare = { values: [10, 20], withUnit: [] };
      const json = JSON.stringify(obj);
      const parsed: WithUnitCompare = JSON.parseSendable(json) as WithUnitCompare;

      const withUnit: string[] = [];
      parsed.values.forEach(n => withUnit.push(n + "kg"));
      const result: WithUnitCompare = {
        values: parsed.values,
        withUnit: withUnit
      };
      expect(JSON.stringify(result.withUnit)).assertEqual(JSON.stringify(["10kg", "20kg"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0105
     * @tc.name Json5Test107
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LongStringsCompare = { strings: ["a", "bc", "def"], long: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as LongStringsCompare;

      const long: string[] = [];
      parsed.strings.forEach(s => {
        if (s.length > 2) {
          long.push(s);
        }
      });
      const result: LongStringsCompare = {
        strings: parsed.strings,
        long: long
      };
      expect(JSON.stringify(result.long)).assertEqual(JSON.stringify(["def"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0106
     * @tc.name Json5Test108
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SortedCompare = {
        items: [{ name: "B", value: 2 }, { name: "A", value: 1 }],
        sorted: []
      };
      const json = JSON.stringify(obj);
      const parsed: SortedCompare = JSON.parseSendable(json) as SortedCompare;

      const itemsCopy = [...parsed.items];
      const sorted: Test108_Obj1[] = [];
      for (let i = 0; i < itemsCopy.length; i++) {
        let minIdx = i;
        for (let j = i + 1; j < itemsCopy.length; j++) {
          if (itemsCopy[j].value < itemsCopy[minIdx].value) {
            minIdx = j;
          }
        }
        const temp = itemsCopy[i];
        itemsCopy[i] = itemsCopy[minIdx];
        itemsCopy[minIdx] = temp;
      }
      itemsCopy.forEach(item => sorted.push(item));
      const result: SortedCompare = {
        items: parsed.items,
        sorted: sorted
      };
      const expectedArray: Test108_Obj1[] = [
        { name: "A", value: 1 } as Test108_Obj1,
        { name: "B", value: 2 } as Test108_Obj1
      ];

      expect(JSON.stringify(result.sorted))
        .assertEqual(JSON.stringify(expectedArray));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0107
     * @tc.name Json5Test109
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AbsoluteCompare = { numbers: [-1, 2, -3], absolute: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as AbsoluteCompare;
      const  absolute: number[] = [];
      parsed.numbers.forEach(n => absolute.push(n < 0 ? -n : n));

      const result: AbsoluteCompare = {
        numbers: parsed.numbers,
        absolute: absolute
      };
      expect(JSON.stringify(result.absolute)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0108
     * @tc.name Json5Test110
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReplaceCharCompare = { strings: ["a-b", "c-d"], replaced: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ReplaceCharCompare;

      const replaced: string[] = [];
      parsed.strings.forEach(s => replaced.push(s.replace("-", "_")));

      const result: ReplaceCharCompare = {
        strings: parsed.strings,
        replaced: replaced
      };
      expect(JSON.stringify(result.replaced)).assertEqual(JSON.stringify(["a_b", "c_d"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0109
     * @tc.name Json5Test111
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SumPropCompare = {
        orders: [{ id: 1, amount: 10 }, { id: 2, amount: 20 }],
        total: []
      };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as SumCountCompare;
      let total = 0;
      parsed.orders.forEach(o => total += o.amount);

      const result: SumPropCompare = {
        orders: parsed.orders,
        total: [total]
      };
      expect(JSON.stringify(result.total)).assertEqual(JSON.stringify([30]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0110
     * @tc.name Json5Test112
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UniqueCompare = { numbers: [1, 2, 2, 3], unique: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as UniqueCompare;
      const unique: number[] = [];
      parsed.numbers.forEach(n => {
        if (!unique.includes(n)) {
          unique.push(n);
        }
      });
      const result: UniqueCompare = {
        numbers: parsed.numbers,
        unique: unique
      };
      expect(JSON.stringify(result.unique)).assertEqual(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0111
     * @tc.name Json5Test113
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FirstCharCompare = { words: ["apple", "banana", "cat"], firstChars: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as FirstCharCompare;

      const firstChars: string[] = [];
      parsed.words.forEach(w => firstChars.push(w.charAt(0)));
      const result: FirstCharCompare = {
        words: parsed.words,
        firstChars: firstChars
      };

      expect(JSON.stringify(result.firstChars)).assertEqual(JSON.stringify(["a", "b", "c"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0112
     * @tc.name Json5Test114
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: BinaryStrCompare = { numbers: [3, 5], binary: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as BinaryStrCompare;

      const binary: string[] = [];
      parsed.numbers.forEach(n => {
        let bin = "";
        let num = n;
        while (num > 0) {
          bin = (num % 2) + bin;
          num = Math.floor(num / 2);
        }
        binary.push(bin);
      });
      const result: BinaryStrCompare = {
        numbers: parsed.numbers,
        binary: binary
      };

      expect(JSON.stringify(result.binary)).assertEqual(JSON.stringify(["11", "101"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0113
     * @tc.name Json5Test115
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PriceFilterCompare = {
        products: [{ name: "A", price: 40 }, { name: "B", price: 60 }],
        expensive: []
      };

      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as PriceFilterCompare;

      const expensive: Test115_Obj1[] = [];
      parsed.products.forEach(p => {
        if (p.price > 50) {
          expensive.push(p);
        }
      });
      const result: PriceFilterCompare = {
        products: parsed.products,
        expensive: expensive
      };

      expect(JSON.stringify(result.expensive)).assertEqual(JSON.stringify([({
        name: "B",
        price: 60
      } as Ason5_GeneratedObjectLiteralInterface_3)]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0114
     * @tc.name Json5Test116
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CubeCompare = { numbers: [2, 3], cubes: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as CubeCompare;

      const cubes: number[] = [];
      parsed.numbers.forEach(n => cubes.push(n * n * n));
      const result: CubeCompare = {
        numbers: parsed.numbers,
        cubes: cubes
      };

      expect(JSON.stringify(result.cubes)).assertEqual(JSON.stringify([8, 27]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0115
     * @tc.name Json5Test117
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: JoinWithSepCompare = { words: ["a", "b", "c"], joined: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as JoinWithSepCompare;

      let joined = "";
      for (let i = 0; i < parsed.words.length; i++) {
        joined += parsed.words[i];
        if (i < parsed.words.length - 1) {
          joined += ",";
        }
      }
      const result: JoinWithSepCompare = {
        words: parsed.words,
        joined: [joined]
      };

      expect(JSON.stringify(result.joined)).assertEqual(JSON.stringify(["a,b,c"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0116
     * @tc.name Json5Test118
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FixedTwoCompare = { numbers: [1.234, 5.678], fixed: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as FixedTwoCompare;

      const fixed: number[] = [];
      parsed.numbers.forEach(n => fixed.push(Math.round(n * 100) / 100));
      const result: FixedTwoCompare = {
        numbers: parsed.numbers,
        fixed: fixed
      };

      expect(JSON.stringify(result.fixed)).assertEqual(JSON.stringify([1.23, 5.68]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0117
     * @tc.name Json5Test119
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SubstrFilterCompare = { strings: ["apple", "banana", "grape"], filtered: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as SubstrFilterCompare;

      const filtered: string[] = [];
      parsed.strings.forEach(s => {
        if (s.includes("ap")) {
          filtered.push(s);
        }
      });
      const result: SubstrFilterCompare = {
        strings: parsed.strings,
        filtered: filtered
      };

      expect(JSON.stringify(result.filtered)).assertEqual(JSON.stringify(["apple", "grape"]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0118
     * @tc.name Json5Test120
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UpdatePriceCompare = {
        items: [{ id: 1, price: 100 }, { id: 2, price: 200 }],
        updated: []
      };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as UpdatePriceCompare;

      const updated: Test120_Obj1[] = [];
      parsed.items.forEach(i => updated.push({ id: i.id, price: i.price * 0.9 }));
      const result: UpdatePriceCompare = {
        items: parsed.items,
        updated: updated
      };
      expect(JSON.stringify(result.updated)).assertEqual('[{"id":1,"price":90},{"id":2,"price":180}]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0119
     * @tc.name Json5Test121
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MinToArrayCompare = { numbers: [5, 2, 8, 1], min: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as MinToArrayCompare;

      let min = parsed.numbers[0];
      parsed.numbers.forEach(n => {
        if (n < min) {
          min = n;
        }
      });
      const result: MinToArrayCompare = {
        numbers: parsed.numbers,
        min: [min]
      };

      expect(JSON.stringify(result.min)).assertEqual('[1]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0120
     * @tc.name Json5Test122
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TrimmedCompare = { strings: ["  a ", "b  ", "  c  "], trimmed: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as TrimmedCompare;

      const trimmed: string[] = [];
      parsed.strings.forEach(s => {
        let trim = "";
        let start = 0;
        let end = s.length - 1;
        while (start <= end && s[start] === " ") {
          start++;
        }
        while (end >= start && s[end] === " ") {
          end--;
        }
        for (let i = start; i <= end; i++) {
          trim += s[i];
        }
        trimmed.push(trim);
      });
      const result: TrimmedCompare = {
        strings: parsed.strings,
        trimmed: trimmed
      };

      expect(JSON.stringify(result.trimmed)).assertEqual('["a","b","c"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0121
     * @tc.name Json5Test123
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: OddNumbersCompare = { numbers: [1, 2, 3, 4, 5], odds: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as OddNumbersCompare;

      const odds: number[] = [];
      parsed.numbers.forEach(n => {
        if (n % 2 !== 0) {
          odds.push(n);
        }
      });
      const result: OddNumbersCompare = {
        numbers: parsed.numbers,
        odds: odds
      };

      expect(JSON.stringify(result.odds)).assertEqual('[1,3,5]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0122
     * @tc.name Json5Test124
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractNamesCompare = {
        employees: [{ id: 1, name: "Alice" }, { id: 2, name: "Bob" }],
        names: []
      };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ExtractNamesCompare;

      const names: string[] = [];
      parsed.employees.forEach(e => names.push(e.name));
      const result: ExtractNamesCompare = {
        employees: parsed.employees,
        names: names
      };
      expect(JSON.stringify(result.names)).assertEqual('["Alice","Bob"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0123
     * @tc.name Json5Test125
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: SquareRootCompare = { numbers: [4, 9, 16], roots: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as SquareRootCompare;

      const roots: number[] = [];
      parsed.numbers.forEach(n => roots.push(Math.sqrt(n)));
      const result: SquareRootCompare = {
        numbers: parsed.numbers,
        roots: roots
      };

      expect(JSON.stringify(result.roots)).assertEqual('[2,3,4]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0124
     * @tc.name Json5Test126
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CapitalFirstCompare = { words: ["hello", "world"], capitalized: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as CapitalFirstCompare;

      const capitalized: string[] = [];
      parsed.words.forEach(w => {
        capitalized.push(w.charAt(0).toUpperCase() + w.slice(1));
      });
      const result: CapitalFirstCompare = {
        words: parsed.words,
        capitalized: capitalized
      };

      expect(result.capitalized.length).assertEqual(2);
      expect(result.capitalized[0]).assertEqual("Hello");
      expect(result.capitalized[1]).assertEqual("World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0125
     * @tc.name Json5Test127
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MonthNameCompare = { dates: ["2024-01-05", "2024-03-12"], months: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as MonthNameCompare;

      const months: string[] = [];
      const names = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
      parsed.dates.forEach(date => {
        const month = parseInt(date.split("-")[1]) - 1;
        months.push(names[month]);
      });
      const result: MonthNameCompare = {
        dates: parsed.dates,
        months: months
      };

      expect(JSON.stringify(result.months)).assertEqual('["Jan","Mar"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0126
     * @tc.name Json5Test128
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: NegativeNumbersCompare = { numbers: [-1, 2, -3, 4], negatives: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as NegativeNumbersCompare;

      const negatives: number[] = [];
      parsed.numbers.forEach(num => {
        if (num < 0) {
          negatives.push(num);
        }
      });
      const result: NegativeNumbersCompare = {
        numbers: parsed.numbers,
        negatives: negatives
      };
      expect(JSON.stringify(result.negatives)).assertEqual('[-1,-3]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0127
     * @tc.name Json5Test129
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UppercaseCompare = { words: ["apple", "Banana"], uppercase: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as UppercaseCompare;

      const uppercase: string[] = [];
      parsed.words.forEach(w => uppercase.push(w.toUpperCase()));
      const result: UppercaseCompare = {
        words: parsed.words,
        uppercase: uppercase
      };

      expect(JSON.stringify(result.uppercase)).assertEqual('["APPLE","BANANA"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0128
     * @tc.name Json5Test130
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AgeFilterCompare = {
        people: [{ name: "A", age: 25 }, { name: "B", age: 35 }],
        adults: []
      };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as AgeFilterCompare;

      const adults: Test130_Obj1[] = [];
      parsed.people.forEach(p => {
        if (p.age > 30) {
          adults.push(p);
        }
      });
      const result: AgeFilterCompare = {
        people: parsed.people,
        adults: adults
      };
      expect(JSON.stringify(result.adults)).assertEqual('[{"name":"B","age":35}]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0129
     * @tc.name Json5Test131
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: DoubleSumCompare = { numbers: [1, 2, 3], doubledSum: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as DoubleSumCompare;

      let sum = 0;
      parsed.numbers.forEach(n => sum += n);
      const result: DoubleSumCompare = {
        numbers: parsed.numbers,
        doubledSum: [sum * 2]
      };
      expect(JSON.stringify(result.doubledSum)).assertEqual('[12]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0130
     * @tc.name Json5Test132
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReverseArrayCompare = { strings: ["a", "b", "c"], reversed: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ReverseArrayCompare;

      const reversed: string[] = [];
      for (let i = parsed.strings.length - 1; i >= 0; i--) {
        reversed.push(parsed.strings[i]);
      }
      const result: ReverseArrayCompare = {
        strings: parsed.strings,
        reversed: reversed
      };

      expect(JSON.stringify(result.reversed)).assertEqual('["c","b","a"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0131
     * @tc.name Json5Test133
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: DivisibleBySevenCompare = { numbers: [7, 14, 20, 21], result: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as DivisibleBySevenCompare;

      const resultArr: number[] = [];
      parsed.numbers.forEach(n => {
        if (n % 7 === 0) {
          resultArr.push(n);
        }
      });
      const result: DivisibleBySevenCompare = {
        numbers: parsed.numbers,
        result: resultArr
      };

      expect(JSON.stringify(result.result)).assertEqual('[7,14,21]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0132
     * @tc.name Json5Test134
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: AddIndexCompare = { items: [{ name: "A" }, { name: "B" }], indexed: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as AddIndexCompare;

      const indexed: Test134_Obj2[] = [];
      for (let idx = 0; idx < parsed.items.length; idx++) {
        indexed.push({ name: parsed.items[idx].name, index: idx });
      }
      const result: AddIndexCompare = {
        items: parsed.items,
        indexed: indexed
      };

      expect(JSON.stringify(result.indexed))
        .assertEqual('[{"name":"A","index":0},{"name":"B","index":1}]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0133
     * @tc.name Json5Test135
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CharIncludeCountCompare = { strings: ["apple", "banana", "grape"], counts: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as CharIncludeCountCompare;

      const counts: number[] = [];
      parsed.strings.forEach(s => {
        let count = 0;
        for (let i = 0; i < s.length; i++) {
          if (s[i] === "a") {
            count++;
          }
        }
        counts.push(count);
      });
      const result: CharIncludeCountCompare = {
        strings: parsed.strings,
        counts: counts
      };

      expect(JSON.stringify(result.counts)).assertEqual('[1,3,1]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0134
     * @tc.name Json5Test136
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ScientificCompare = { numbers: [1000, 0.001], scientific: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ScientificCompare;

      const scientific: string[] = [];
      parsed.numbers.forEach(n => scientific.push(n.toExponential()));
      const result: ScientificCompare = {
        numbers: parsed.numbers,
        scientific: scientific
      };

      expect(JSON.stringify(result.scientific)).assertEqual('["1e+3","1e-3"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0135
     * @tc.name Json5Test137
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: OddLengthCompare = { strings: ["a", "bb", "ccc", "dddd"], oddLength: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as OddLengthCompare;

      const oddLength: string[] = [];
      parsed.strings.forEach(s => {
        if (s.length % 2 !== 0) {
          oddLength.push(s);
        }
      });
      const result: OddLengthCompare = {
        strings: parsed.strings,
        oddLength: oddLength
      };

      expect(JSON.stringify(result.oddLength)).assertEqual('["a","ccc"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0136
     * @tc.name Json5Test138
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: DivisibleBy15Compare = { numbers: [10, 15, 30, 25], result: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as DivisibleBy15Compare;

      const resultArr: number[] = [];
      parsed.numbers.forEach(n => {
        if (n % 3 === 0 && n % 5 === 0) {
          resultArr.push(n);
        }
      });
      const result: DivisibleBy15Compare = {
        numbers: parsed.numbers,
        result: resultArr
      };
      expect(result.result.length).assertEqual(2);
      expect(result.result[0]).assertEqual(15);
      expect(result.result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0137
     * @tc.name Json5Test139
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReciprocalCompare = { numbers: [2, 3, 4], reciprocals: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ReciprocalCompare;

      const reciprocals: number[] = [];
      parsed.numbers.forEach(n => reciprocals.push(1 / n));
      const result: ReciprocalCompare = {
        numbers: parsed.numbers,
        reciprocals: reciprocals
      };

      expect(JSON.stringify(result.reciprocals)).assertEqual('[0.5,0.3333333333333333,0.25]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0138
     * @tc.name Json5Test140
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ReplaceSubstrCompare = { strings: ["cat", "catch", "category"], replaced: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ReplaceSubstrCompare;
      const replaced: string[] = [];
      parsed.strings.forEach(s => replaced.push(s.replace("cat", "dog")));

      const result: ReplaceSubstrCompare = {
        strings: parsed.strings,
        replaced: replaced
      };

      expect(JSON.stringify(result.replaced)).assertEqual('["dog","dogch","dogegory"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0139
     * @tc.name Json5Test141
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UniqueSortedCompare = {
        numbers: [3, 1, 2, 2, 3],
        result: []
      };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as UniqueSortedCompare;

      expect(JSON.stringify(parsed.result)).assertEqual('[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0140
     * @tc.name Json5Test142
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: LastCharCompare = { words: ["apple", "banana", "cat"], lastChars: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as LastCharCompare;

      const lastChars: string[] = [];
      parsed.words.forEach(w => lastChars.push(w[w.length - 1]));
      const result: LastCharCompare = {
        words: parsed.words,
        lastChars: lastChars
      };

      expect(JSON.stringify(result.lastChars)).assertEqual('["e","a","t"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0141
     * @tc.name Json5Test143
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: CelsiusCompare = { temps: [20, 30], formatted: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as CelsiusCompare;

      const formatted: string[] = [];
      parsed.temps.forEach(t => formatted.push(t + "°C"));
      const result: CelsiusCompare = {
        temps: parsed.temps,
        formatted: formatted
      };
      expect(result.formatted[0]).assertEqual("20°C");
      expect(result.formatted[1]).assertEqual("30°C");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0142
     * @tc.name Json5Test144
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: ExtractDomainCompare = {
        users: [
          { name: "A", email: "a@example.com" },
          { name: "B", email: "b@test.org" }
        ],
        domains: []
      };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as ExtractDomainCompare;

      const domains: string[] = [];
      parsed.users.forEach(u => {
        domains.push(u.email.split("@")[1]);
      });
      const result: ExtractDomainCompare = {
        users: parsed.users,
        domains: domains
      };

      expect(result.domains[0]).assertEqual("example.com");
      expect(result.domains[1]).assertEqual("test.org");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0143
     * @tc.name Json5Test145
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FourthPowerCompare = { numbers: [2, 3], powers: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as FourthPowerCompare;

      const powers: number[] = [];
      parsed.numbers.forEach(n => powers.push(n * n * n * n));
      const result: FourthPowerCompare = {
        numbers: parsed.numbers,
        powers: powers
      };
      expect(JSON.stringify(result.powers)).assertEqual('[16,81]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0144
     * @tc.name Json5Test146
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MaskMiddleCompare = { strings: ["apple", "banana", "cat"], masked: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as MaskMiddleCompare;

      const masked: string[] = [];
      parsed.strings.forEach(s => {
        if (s.length <= 2) {
          masked.push(s);
        } else {
          let maskedStr = s[0];
          for (let i = 1; i < s.length - 1; i++) {
            maskedStr += "*";
          }
          maskedStr += s[s.length - 1];
          masked.push(maskedStr);
        }
      });

      const result: MaskMiddleCompare = {
        strings: parsed.strings,
        masked: masked
      };

      expect(JSON.stringify(result.masked)).assertEqual('["a***e","b****a","c*t"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0145
     * @tc.name Json5Test147
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FixedOneCompare = { numbers: [1.23, 4.567], fixed: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as FixedOneCompare;

      const fixed: number[] = [];
      parsed.numbers.forEach(n => fixed.push(Math.round(n * 10) / 10));
      const result: FixedOneCompare = {
        numbers: parsed.numbers,
        fixed: fixed
      };

      expect(JSON.stringify(result.fixed)).assertEqual('[1.2,4.6]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0146
     * @tc.name Json5Test148
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: NoNumbersCompare = { strings: ["abc", "d1e", "fgh"], filtered: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as NoNumbersCompare;

      const filtered: string[] = [];
      parsed.strings.forEach(s => {
        let hasNum = false;
        for (let i = 0; i < s.length; i++) {
          if (!isNaN(parseInt(s[i]))) {
            hasNum = true;
            break;
          }
        }
        if (!hasNum) {
          filtered.push(s);
        }
      });

      const result: NoNumbersCompare = {
        strings: parsed.strings,
        filtered: filtered
      };

      expect(JSON.stringify(result.filtered)).assertEqual('["abc","fgh"]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0147
     * @tc.name Json5Test149
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: UpdateStatusCompare = {
        orders: [{ id: 1, status: "pending" }, { id: 2, status: "pending" }],
        updated: []
      };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as UpdateStatusCompare;
      const updated: Test149_Obj1[] = [];
      parsed.orders.forEach(o => updated.push({ id: o.id, status: "shipped" }));

      const result: UpdateStatusCompare = {
        orders: parsed.orders,
        updated: updated
      };

      expect(JSON.stringify(result.updated))
        .assertEqual('[{"id":1,"status":"shipped"},{"id":2,"status":"shipped"}]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ARKTS_JSON_PARSESENDABLE_TRANSFORM_0148
     * @tc.name Json5Test150
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json5Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TripleMaxCompare = { numbers: [5, 8, 3, 10], result: [] };
      const json = JSON.stringify(obj);
      const parsed = JSON.parseSendable(json) as TripleMaxCompare;

      let max = parsed.numbers[0];
      parsed.numbers.forEach(n => {
        if (n > max) {
          max = n;
        }
      });
      const result: TripleMaxCompare = {
        numbers: parsed.numbers,
        result: [max * 3]
      };

      expect(JSON.stringify(result.result)).assertEqual('[30]');
    });

  })
}