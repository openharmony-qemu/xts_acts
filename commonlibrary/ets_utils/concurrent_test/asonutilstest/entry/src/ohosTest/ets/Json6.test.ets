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

interface HasUppercaseCompare {
  strings: string[];
  filtered: string[];
}

interface Test2_Obj1 {
  name: string;
  age: number;
}

interface AgeDiffCompare {
  people: Test2_Obj1[];
  diffs: number[];
}

interface SumCountCompare {
  numbers: number[];
  sum: number;
  count: number;
}

interface SentenceCompare {
  words: string[];
  sentence: string;
}

interface Test5_Obj1 {
  name: string;
  price: number;
}

interface PriceRangeCompare {
  products: Test5_Obj1[];
  inRange: Test5_Obj1[];
}

interface PercentCompare {
  ratios: number[];
  percentages: string[];
}

interface CharFrequencyCompare {
  strings: string[];
  counts: number[];
}

interface Test8_Obj1 {
  category: string;
}

interface Test8_Obj2 {
  category: string;
  count: number;
}

interface GroupCountCompare {
  items: Test8_Obj1[];
  counts: Test8_Obj2[];
}

interface CumulativeSumCompare {
  numbers: number[];
  sums: number[];
}

interface TruncateCompare {
  strings: string[];
  truncated: string[];
}

interface Test11_Obj1 {
  name: string;
  quantity: number;
}

interface InStockCompare {
  products: Test11_Obj1[];
  inStock: Test11_Obj1[];
}

interface NumberToBoolCompare {
  numbers: number[];
  booleans: boolean[];
}

interface HasSubstringCompare {
  strings: string[];
  hasSub: boolean[];
}

interface Test14_Obj1 {
  id: number;
  amount: number;
}

interface TotalAmountCompare {
  orders: Test14_Obj1[];
  total: number;
}

interface OddEvenClassifyCompare {
  numbers: number[];
  odd: number[];
  even: number[];
}

interface ReversedLengthCompare {
  strings: string[];
  reversed: string[];
}

interface Test17_Obj1 {
  name: string;
  role: string;
}

interface RoleFilterCompare {
  users: Test17_Obj1[];
  admins: Test17_Obj1[];
}

interface SqrtOfSquaresCompare {
  numbers: number[];
  result: number;
}

interface WrapStringsCompare {
  strings: string[];
  wrapped: string[];
}

interface Test20_Obj1 {
  name: string;
  date: string;
}

interface Year2024FilterCompare {
  events: Test20_Obj1[];
  filtered: Test20_Obj1[];
}

interface ThousandsFormatCompare {
  numbers: number[];
  formatted: string[];
}

interface IsEmptyCompare {
  strings: string[];
  isEmpty: boolean[];
}

interface Test23_Obj1 {
  title: string;
  rating: number;
}

interface AvgRatingCompare {
  movies: Test23_Obj1[];
  avg: number;
}

interface PrimeNumbersCompare {
  numbers: number[];
  primes: number[];
}

interface TitleCaseCompare {
  strings: string[];
  titles: string[];
}

interface RotateFirstCharCompare {
  strings: string[];
  rotated: string[];
}

interface GCDCompare {
  numbers: number[];
  gcd: number;
}

interface AnagramCheckCompare {
  stringPairs: [string, string][];
  isAnagram: boolean[];
}

interface PrefixSuffixProductCompare {
  numbers: number[];
  products: number[];
}

interface ConsonantCountCompare {
  strings: string[];
  counts: number[];
}

interface Test30_Obj1 {
  region: string;
  amount: number;
}

interface FilteredMaxCompare {
  sales: Test30_Obj1[];
  westMax: number;
}

interface LCMCompare {
  numbers: number[];
  lcm: number;
}

interface EndsWithCheckCompare {
  strings: string[];
  char: string;
  results: boolean[];
}

interface Test33_Obj1 {
  type: string;
  value: number;
}

interface Test33_Obj2 {
  type: string;
  total: number;
}

interface HexStringCompare {
  numbers: number[];
  hexStrings: string[];
}

interface AsciiConvertCompare {
  codes: number[];
  chars: string[];
}

interface UniqueCharsCompare {
  strings: string[];
  unique: string[];
}

interface Test35_Obj1 {
  name: string;
  price: number;
}

interface BelowAvgPriceCompare {
  products: Test35_Obj1[];
  belowAvg: Test35_Obj1[];
}

interface AdjacentProductCompare {
  numbers: number[];
  products: number[];
}

interface MiddleSubstringCompare {
  strings: string[];
  middles: string[];
}

interface MinValueIndexCompare {
  numbers: number[];
  min: number;
  index: number;
}

interface ReverseCharsCompare {
  strings: string[];
  reversed: string[];
}

interface NaturalLogCompare {
  numbers: number[];
  logs: number[];
}

interface SumOfSquaresCompare {
  numbers: number[];
  sum: number;
}

interface ReplaceSpaceCompare {
  strings: string[];
  replaced: string[];
}

interface ExponentialCompare {
  numbers: number[];
  results: number[];
}

interface LowerCountCompare {
  strings: string[];
  counts: number[];
}

interface Test45_Obj1 {
  name: string;
  date: string;
}

interface DateFormatCompare {
  events: Test45_Obj1[];
  formatted: Test45_Obj1[];
}

interface AboveAvgElementsCompare {
  numbers: number[];
  aboveAvg: number[];
}

interface ProperCaseCompare {
  strings: string[];
  proper: string[];
}

interface SineCompare {
  angles: number[];
  sines: number[];
}

interface IsAlphaCompare {
  strings: string[];
  results: boolean[];
}

interface Test50_Obj1 {
  status: string;
  amount: number;
}

interface FilteredTotalCompare {
  orders: Test50_Obj1[];
  completedTotal: number;
}

interface SumOverMaxCompare {
  numbers: number[];
  ratio: number;
}

interface SpecificCharCountCompare {
  strings: string[];
  char: string;
  counts: number[];
}

interface Test53_Obj1 {
  name: string;
  price: number;
}

interface PriceRangeCountCompare {
  products: Test53_Obj1[];
  range: [number, number];
  count: number;
}

interface SumOfSquareRootsCompare {
  numbers: number[];
  sum: number;
}

interface StartsWithCheckCompare {
  strings: string[];
  prefix: string;
  results: boolean[];
}

interface MonthNameCompare {
  months: number[];
  names: string[];
}

interface Test57_Obj1 {
  title: string;
  rating: number;
}

interface HighRatingFilterCompare {
  movies: Test57_Obj1[];
  threshold: number;
  highRated: Test57_Obj1[];
}

interface CosineCompare {
  angles: number[];
  cosines: number[];
}

interface ReplaceAtPositionCompare {
  strings: string[];
  position: number;
  char: string;
  replaced: string[];
}

interface EvenSquareSumCompare {
  numbers: number[];
  sum: number;
}

interface HasConsecutiveCharsCompare {
  strings: string[];
  results: boolean[];
}

interface Test68_Obj1 {
  name: string;
  date: string;
}

interface DateTopNCompare {
  events: Test68_Obj1[];
  n: number;
  latest: Test68_Obj1[];
}

interface TangentCompare {
  angles: number[];
  tangents: number[];
}

interface NonAlphaCountCompare {
  strings: string[];
  counts: number[];
}

interface AsciiSortCompare {
  strings: string[];
  sorted: string[];
}

interface SumOfAbsCompare {
  numbers: number[];
  sum: number;
}

interface IsNumericCompare {
  strings: string[];
  results: boolean[];
}

interface ExpCompare {
  numbers: number[];
  results: number[];
}

interface SwapFirstLastCompare {
  strings: string[];
  swapped: string[];
}

interface SquareCubeSumCompare {
  numbers: number[];
  results: number[];
}

interface IsEmailCompare {
  strings: string[];
  results: boolean[];
}

interface GeometricMeanCompare {
  numbers: number[];
  mean: number;
}

interface UpperCaseCountCompare {
  strings: string[];
  counts: number[];
}

interface Test74_Obj1 {
  name: string;
  price: number;
}

interface AboveAvgProductsCompare {
  products: Test74_Obj1[];
  aboveAvg: Test74_Obj1[];
}

interface SumOfSquaredDiffsCompare {
  numbers: number[];
  sum: number;
}

interface ContainsSubstringCompare {
  strings: string[];
  substring: string;
  results: boolean[];
}

interface WeekdayNameCompare {
  weekdays: number[];
  names: string[];
}

interface ReverseSortCharsCompare {
  strings: string[];
  sorted: string[];
}

interface SinhCompare {
  numbers: number[];
  results: number[];
}

interface ReplaceSubstringCompare {
  strings: string[];
  from: string;
  to: string;
  replaced: string[];
}

interface OddProductCompare {
  numbers: number[];
  product: number;
}

interface IsPalindromeCompare {
  strings: string[];
  results: boolean[];
}

interface CoshCompare {
  numbers: number[];
  results: number[];
}

interface SpaceCountCompare {
  strings: string[];
  counts: number[];
}

interface HarmonicMeanCompare {
  numbers: number[];
  mean: number;
}

interface AlternateCaseCompare {
  strings: string[];
  alternated: string[];
}

interface AcosCompare {
  numbers: number[];
  results: number[];
}

interface HasDigitCompare {
  strings: string[];
  results: boolean[];
}

interface AsinCompare {
  numbers: number[];
  results: number[];
}

interface CapitalizeWordsCompare {
  strings: string[];
  capitalized: string[];
}

interface WeightedMeanCompare {
  values: number[];
  weights: number[];
  mean: number;
}

interface TanhCompare {
  numbers: number[];
  results: number[];
}

interface SubstringExtractCompare {
  strings: string[];
  start: number;
  length: number;
  extracted: string[];
}

interface RootSumSquaresCompare {
  numbers: number[];
  result: number;
}

interface HasTripleCharsCompare {
  strings: string[];
  results: boolean[];
}

interface AsinhCompare {
  numbers: number[];
  results: number[];
}

interface GeometricStdDevCompare {
  numbers: number[];
  stdDev: number;
}

interface AcoshCompare {
  numbers: number[];
  results: number[];
}

interface Test99_Obj1 {
  type: string;
  amount: number;
}

interface FilteredCumulativeSumCompare {
  transactions: Test99_Obj1[];
  cumulative: number[];
}

interface AtanhCompare {
  numbers: number[];
  results: number[];
}

export default function Json6Test() {
  describe('Json6Test', () => {
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
     * @tc.number SUB_BUILTINS_Json6_TEST_0100
     * @tc.name Json6Test001
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: HasUppercaseCompare = { strings: ["test", "Test", "TEST"], filtered: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const f: string[] = [];
        
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      strings.forEach(s => {
        for (let i = 0; i < s.length; i++) {
          if (s[i] === s[i].toUpperCase() && s[i] !== s[i].toLowerCase()) {
            f.push(s);
            break;
          }
        }
      });

        
      const result: HasUppercaseCompare = {
        strings: strings,
        filtered: f
      };

      expect(result.filtered.length).assertEqual(2);
      expect(result.filtered[0]).assertEqual("Test");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_0200
     * @tc.name Json6Test002
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AgeDiffCompare = {
        people: [{ name: "A", age: 25 }, { name: "B", age: 30 }],
        diffs: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const d: number[] = [];
      const parsedObj = parsed as Record<string, Object>;
      const people = parsedObj["people"] as Test2_Obj1[];
      if (people.length >= 2) {
        d.push(Math.abs(people[0].age - people[1].age));
      }

        
      const result: AgeDiffCompare = {
        people: people,
        diffs: d
      };

      expect(result.diffs.length).assertEqual(1);
      expect(result.diffs[0]).assertEqual(5);
    });
    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_0300
     * @tc.name Json6Test003
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SumCountCompare = { numbers: [1, 2, 3], sum: 0, count: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let s = 0;
      numbers.forEach(n => s += n);

        
      const result: SumCountCompare = {
        numbers: numbers,
        sum: s,
        count: numbers.length
      };

      expect(result.sum).assertEqual(6);
      expect(result.count).assertEqual(3);
    });


    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_0400
     * @tc.name Json6Test004
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SentenceCompare = { words: ["I", "am", "happy"], sentence: "" };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const words = parsedObj["words"] as string[];
      let s = "";
      for (let i = 0; i < words.length; i++) {
        s += words[i];
        if (i < words.length - 1) {
          s += " ";
        }
      }
      s += ".";

        
      const result: SentenceCompare = {
        words: words,
        sentence: s
      };

      expect(result.sentence).assertEqual("I am happy.");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_0500
     * @tc.name Json6Test005
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: PriceRangeCompare = {
        products: [
          { name: "A", price: 15 },
          { name: "B", price: 25 },
          { name: "C", price: 35 }
        ],
        inRange: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const products = parsedObj["products"] as Test5_Obj1[];
      const r: Test5_Obj1[] = [];
      products.forEach(p => {
        if (p.price >= 20 && p.price <= 30) {
          r.push(p);
        }
      });

        
      const result: PriceRangeCompare = {
        products: products,
        inRange: r
      };

      expect(result.inRange.length).assertEqual(1);
      expect(result.inRange[0].name).assertEqual("B");
      expect(result.inRange[0].price).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_0600
     * @tc.name Json6Test006
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: PercentCompare = { ratios: [0.12, 0.345], percentages: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const ratios = parsedObj["ratios"] as number[];
      const p: string[] = [];
      ratios.forEach(r => {
        p.push(Math.round(r * 100) + "%");
      });

        
      const result: PercentCompare = {
        ratios: ratios,
        percentages: p
      };

      expect(result.percentages[0]).assertEqual("12%");
      expect(result.percentages[1]).assertEqual("35%");
    });


    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_0700
     * @tc.name Json6Test007
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: CharFrequencyCompare = { strings: ["apple", "banana"], counts: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const c: number[] = [];
      strings.forEach(s => {
        let count = 0;
        for (let i = 0; i < s.length; i++) {
          if (s[i] === "a") {
            count++;
          }
        }
        c.push(count);
      });

        
      const result: CharFrequencyCompare = {
        strings: strings,
        counts: c
      };

      expect(result.counts[0]).assertEqual(1);
      expect(result.counts[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_0800
     * @tc.name Json6Test008
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: GroupCountCompare = {
        items: [
          { category: "A" },
          { category: "A" },
          { category: "B" }
        ],
        counts: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

      const parsedObj = parsed as Record<string, Object>;
      const items = parsedObj["items"] as Test8_Obj1[];
      const map: Record<string, number> = {};
      items.forEach(i => {
        map[i.category] = (map[i.category] || 0) + 1;
      });
      const c: Test8_Obj2[] = [];
      Object.keys(map).forEach(key => {
        c.push({ category: key, count: map[key] });
      });

        
      const result: GroupCountCompare = {
        items: items,
        counts: c
      };

      expect(result.counts.length).assertEqual(2);
      expect(result.counts.find(item => item.category === "A")?.count).assertEqual(2);
      expect(result.counts.find(item => item.category === "B")?.category).assertEqual("B");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_0900
     * @tc.name Json6Test009
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: CumulativeSumCompare = { numbers: [1, 2, 3], sums: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const s: number[] = [];
      let total = 0;
      numbers.forEach(n => {
        total += n;
        s.push(total);
      });

        
      const result: CumulativeSumCompare = {
        numbers: numbers,
        sums: s
      };

      expect(result.sums[0]).assertEqual(1);
      expect(result.sums[1]).assertEqual(3);
      expect(result.sums[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_1000
     * @tc.name Json6Test010
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: TruncateCompare = { strings: ["apple", "cat", "banana"], truncated: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const t: string[] = [];
      strings.forEach(s => {
        t.push(s.substring(0, 3));
      });

        
      const result: TruncateCompare = {
        strings: strings,
        truncated: t
      };

      expect(result.truncated[0]).assertEqual("app");
      expect(result.truncated[1]).assertEqual("cat");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_1100
     * @tc.name Json6Test011
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: InStockCompare = {
        products: [
          { name: "A", quantity: 5 },
          { name: "B", quantity: 0 },
          { name: "C", quantity: 10 }
        ],
        inStock: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const products = parsedObj["products"] as Test11_Obj1[];
      const s: Test11_Obj1[] = [];
      products.forEach(p => {
        if (p.quantity > 0) {
          s.push(p);
        }
      });

        
      const result: InStockCompare = {
        products: products,
        inStock: s
      };

      expect(result.inStock.length).assertEqual(2);
      expect(result.inStock[1].name).assertEqual("C");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_1200
     * @tc.name Json6Test012
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: NumberToBoolCompare = { numbers: [0, 1, -5, 0], booleans: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const b: boolean[] = [];
      numbers.forEach(n => b.push(n !== 0));

        
      const result: NumberToBoolCompare = {
        numbers: numbers,
        booleans: b
      };

      expect(result.booleans[0]).assertEqual(false);
      expect(result.booleans[1]).assertEqual(true);
      expect(result.booleans[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_1300
     * @tc.name Json6Test013
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: HasSubstringCompare = { strings: ["apple", "banana", "grape"], hasSub: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const h: boolean[] = [];
      strings.forEach(s => h.push(s.includes("ap")));

        
      const result: HasSubstringCompare = {
        strings: strings,
        hasSub: h
      };

      expect(result.hasSub[0]).assertEqual(true);
      expect(result.hasSub[1]).assertEqual(false);
      expect(result.hasSub[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_1400
     * @tc.name Json6Test014
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: TotalAmountCompare = {
        orders: [
          { id: 1, amount: 100 },
          { id: 2, amount: 200 }
        ],
        total: 0
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const orders = parsedObj["orders"] as Test14_Obj1[];
      let t = 0;
      orders.forEach(o => t += o.amount);

        
      const result: TotalAmountCompare = {
        orders: orders,
        total: t
      };

      expect(result.total).assertEqual(300);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_1500
     * @tc.name Json6Test015
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: OddEvenClassifyCompare = { numbers: [1, 2, 3, 4], odd: [], even: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const o: number[] = [];
      const e: number[] = [];
      numbers.forEach(n => {
        if (n % 2 === 0) {
          e.push(n);
        } else {
          o.push(n);
        }
      });

        
      const result: OddEvenClassifyCompare = {
        numbers: numbers,
        odd: o,
        even: e
      };

      expect(result.odd.length).assertEqual(2);
      expect(result.even[0]).assertEqual(2);
      expect(result.odd[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_1600
     * @tc.name Json6Test016
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ReversedLengthCompare = { strings: ["abc", "de"], reversed: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: string[] = [];
      strings.forEach(s => {
        let rev = "";
        for (let i = s.length - 1; i >= 0; i--) {
          rev += s[i];
        }
        r.push(rev);
      });

        
      const result: ReversedLengthCompare = {
        strings: strings,
        reversed: r
      };

      expect(result.reversed.length).assertEqual(2);
      expect(result.reversed[0].length).assertEqual(3);
      expect(result.reversed[1]).assertEqual("ed");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_1700
     * @tc.name Json6Test017
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: RoleFilterCompare = {
        users: [
          { name: "A", role: "admin" },
          { name: "B", role: "user" },
          { name: "C", role: "admin" }
        ],
        admins: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const users = parsedObj["users"] as Test17_Obj1[];
      const a: Test17_Obj1[] = [];
      users.forEach(u => {
        if (u.role === "admin") {
          a.push(u);
        }
      });

        
      const result: RoleFilterCompare = {
        users: users,
        admins: a
      };

      expect(result.admins.length).assertEqual(2);
      expect(result.admins[0].name).assertEqual("A");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_1800
     * @tc.name Json6Test018
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: SqrtOfSquaresCompare = { numbers: [3, 4], result: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      let sum = 0;
      numbers.forEach(n => sum += n * n);

        
      const result: SqrtOfSquaresCompare = {
        numbers: numbers,
        result: Math.sqrt(sum)
      };

      expect(result.result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_1900
     * @tc.name Json6Test019
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: WrapStringsCompare = { strings: ["test", "case"], wrapped: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const w: string[] = [];
      strings.forEach(s => w.push(`[${s}]`));

        
      const result: WrapStringsCompare = {
        strings: strings,
        wrapped: w
      };

      expect(result.wrapped[0]).assertEqual("[test]");
      expect(result.wrapped[1]).assertEqual("[case]");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_2000
     * @tc.name Json6Test020
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: Year2024FilterCompare = {
        events: [
          { name: "A", date: "2024-03-01" },
          { name: "B", date: "2023-12-31" },
          { name: "C", date: "2024-05-15" }
        ],
        filtered: []
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const events = parsedObj["events"] as Test20_Obj1[];
      const f: Test20_Obj1[] = [];
      events.forEach(e => {
        if (e.date.startsWith("2024-")) {
          f.push(e);
        }
      });

        
      const result: Year2024FilterCompare = {
        events: events,
        filtered: f
      };

      expect(result.filtered.length).assertEqual(2);
      expect(result.filtered[1].name).assertEqual("C");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_2100
     * @tc.name Json6Test021
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ThousandsFormatCompare = { numbers: [1234, 1234567], formatted: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const f: string[] = [];
      numbers.forEach(n => {
        let str = n.toString();
        let result = "";
        let count = 0;
        for (let i = str.length - 1; i >= 0; i--) {
          result = str[i] + result;
          count++;
          if (count % 3 === 0 && i !== 0) {
            result = "," + result;
          }
        }
        f.push(result);
      });

        
      const result: ThousandsFormatCompare = {
        numbers: numbers,
        formatted: f
      };

      expect(result.formatted[0]).assertEqual("1,234");
      expect(result.formatted[1]).assertEqual("1,234,567");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_2200
     * @tc.name Json6Test022
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: IsEmptyCompare = { strings: ["", "test", "   "], isEmpty: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const e: boolean[] = [];
      strings.forEach(s => e.push(s.trim() === ""));

        
      const result: IsEmptyCompare = {
        strings: strings,
        isEmpty: e
      };

      expect(result.isEmpty[0]).assertEqual(true);
      expect(result.isEmpty[1]).assertEqual(false);
      expect(result.isEmpty[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_2300
     * @tc.name Json6Test023
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AvgRatingCompare = {
        movies: [
          { title: "A", rating: 8 },
          { title: "B", rating: 6 },
          { title: "C", rating: 10 }
        ],
        avg: 0
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const movies = parsedObj["movies"] as Test23_Obj1[];
      let sum = 0;
      movies.forEach(m => sum += m.rating);

        
      const result: AvgRatingCompare = {
        movies: movies,
        avg: sum / movies.length
      };

      expect(result.avg).assertEqual(8);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_2400
     * @tc.name Json6Test024
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: PrimeNumbersCompare = { numbers: [2, 4, 5, 9, 11], primes: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const p: number[] = [];
      numbers.forEach(n => {
        if (n <= 1) {
          return;
        }
        let isPrime = true;
        for (let i = 2; i < n; i++) {
          if (n % i === 0) {
            isPrime = false;
            break;
          }
        }
        if (isPrime) {
          p.push(n);
        }
      });

        
      const result: PrimeNumbersCompare = {
        numbers: numbers,
        primes: p
      };

      expect(result.primes.length).assertEqual(3);
      expect(result.primes[0]).assertEqual(2);
      expect(result.primes[2]).assertEqual(11);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_2500
     * @tc.name Json6Test025
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: TitleCaseCompare = { strings: ["hello world", "typescript is fun"], titles: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const t: string[] = [];
      strings.forEach(s => {
        const words = s.split(" ");
        const titleWords: string[] = [];
        words.forEach(w => {
          titleWords.push(w.charAt(0).toUpperCase() + w.slice(1).toLowerCase());
        });
        t.push(titleWords.join(" "));
      });

        
      const result: TitleCaseCompare = {
        strings: strings,
        titles: t
      };

      expect(result.titles[0]).assertEqual("Hello World");
      expect(result.titles[1]).assertEqual("Typescript Is Fun");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_2600
     * @tc.name Json6Test026
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: RotateFirstCharCompare = { strings: ["apple", "banana"], rotated: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const r: string[] = [];
      strings.forEach(s => {
        if (s.length === 0) {
          r.push("");
        } else {
          r.push(s.substring(1) + s.charAt(0));
        }
      });

        
      const result: RotateFirstCharCompare = {
        strings: strings,
        rotated: r
      };

      expect(result.rotated[0]).assertEqual("pplea");
      expect(result.rotated[1]).assertEqual("ananab");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_2700
     * @tc.name Json6Test027
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: GCDCompare = { numbers: [12, 18, 24], gcd: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const gcdTwo = (a: number, b: number): number => {
        while (b !== 0) {
          const temp = b;
          b = a % b;
          a = temp;
        }
        return a;
      };
      let gcd = numbers[0];
      for (let i = 1; i < numbers.length; i++) {
        gcd = gcdTwo(gcd, numbers[i]);
        if (gcd === 1) {
          break;
        }
      }

        
      const result: GCDCompare = {
        numbers: numbers,
        gcd: gcd
      };

      expect(result.gcd).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_2800
     * @tc.name Json6Test028
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: ConsonantCountCompare = { strings: ["apple", "xyz"], counts: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const c: number[] = [];
      const vowels = ["a", "e", "i", "o", "u"];
      strings.forEach(s => {
        let count = 0;
        for (let i = 0; i < s.length; i++) {
          let isVowel = false;
          for (let j = 0; j < vowels.length; j++) {
            if (s[i].toLowerCase() === vowels[j]) {
              isVowel = true;
              break;
            }
          }
          if (!isVowel) {
            count++;
          }
        }
        c.push(count);
      });

        
      const result: ConsonantCountCompare = {
        strings: strings,
        counts: c
      };

      expect(result.counts[0]).assertEqual(3);
      expect(result.counts[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_2900
     * @tc.name Json6Test029
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: PrefixSuffixProductCompare = { numbers: [1, 2, 3, 4], products: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const prefix: number[] = [];
      const suffix: number[] = [];
      const p: number[] = [];
      let sum = 0;
      numbers.forEach(n => {
        sum += n;
        prefix.push(sum);
      });
      sum = 0;
      for (let i = numbers.length - 1; i >= 0; i--) {
        sum += numbers[i];
        suffix.unshift(sum);
      }
      for (let i = 0; i < prefix.length; i++) {
        p.push(prefix[i] * suffix[i]);
      }

        
      const result: PrefixSuffixProductCompare = {
        numbers: numbers,
        products: p
      };

      expect(result.products[0]).assertEqual(1 * 10);
      expect(result.products[1]).assertEqual(3 * 9);
      expect(result.products[2]).assertEqual(6 * 7);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_3000
     * @tc.name Json6Test030
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: FilteredMaxCompare = {
        sales: [
          { region: "West", amount: 500 },
          { region: "East", amount: 700 },
          { region: "West", amount: 600 }
        ],
        westMax: 0
      };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const sales = parsedObj["sales"] as Test30_Obj1[];
      let max = 0;
      let hasWest = false;
      sales.forEach(s => {
        if (s.region === "West") {
          if (!hasWest) {
            max = s.amount;
            hasWest = true;
          } else if (s.amount > max) {
            max = s.amount;
          }
        }
      });

        
      const result: FilteredMaxCompare = {
        sales: sales,
        westMax: max
      };

      expect(result.westMax).assertEqual(600);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_3100
     * @tc.name Json6Test031
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: LCMCompare = { numbers: [4, 6, 8], lcm: 0 };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const numbers = parsedObj["numbers"] as number[];
      const gcd = (a: number, b: number): number => {
        while (b !== 0) {
          const t = b;
          b = a % b;
          a = t;
        }
        return a;
      };
      const lcmTwo = (a: number, b: number): number => a * b / gcd(a, b);

      let lcm = numbers[0];
      for (let i = 1; i < numbers.length; i++) {
        lcm = lcmTwo(lcm, numbers[i]);
      }

        
      const result: LCMCompare = {
        numbers: numbers,
        lcm: lcm
      };

      expect(result.lcm).assertEqual(24);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_3200
     * @tc.name Json6Test032
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: EndsWithCheckCompare = { strings: ["apple", "banana", "cat"], char: "t", results: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const char = parsedObj["char"] as string;
      const r: boolean[] = [];
      strings.forEach(s => {
        const len = s.length;
        const lastChar = len > 0 ? s.substring(len - 1) : "";
        r.push(lastChar === char);
      });

        
      const result: EndsWithCheckCompare = {
        strings: strings,
        char: char,
        results: r
      };

      expect(result.results[0]).assertEqual(false);
      expect(result.results[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_3300
     * @tc.name Json6Test033
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: AsciiConvertCompare = { codes: [65, 97, 48], chars: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const codes = parsedObj["codes"] as number[];
      const c: string[] = [];
      codes.forEach(code => c.push(String.fromCharCode(code)));

        
      const result: AsciiConvertCompare = {
        codes: codes,
        chars: c
      };

      expect(result.chars[0]).assertEqual("A");
      expect(result.chars[1]).assertEqual("a");
      expect(result.chars[2]).assertEqual("0");
    });

    /**
     * @tc.number SUB_BUILTINS_Json6_TEST_3400
     * @tc.name Json6Test034
     * @tc.desc test Json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Json6Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      type ISendable = lang.ISendable;
      const obj: UniqueCharsCompare = { strings: ["aabcc", "defef"], unique: [] };
      const json = ArkTSUtils.ASON.stringify(obj);
      const parsed = ArkTSUtils.ASON.parse(json) as ISendable;

       
      const parsedObj = parsed as Record<string, Object>;
      const strings = parsedObj["strings"] as string[];
      const u: string[] = [];
      strings.forEach(s => {
        const chars: string[] = [];
        for (let i = 0; i < s.length; i++) {
          let exists = false;
          for (let j = 0; j < chars.length; j++) {
            if (chars[j] === s[i]) {
              exists = true;
              break;
            }
          }
          if (!exists) {
            chars.push(s[i]);
          }
        }
        u.push(chars.join(""));
      });

        
      const result: UniqueCharsCompare = {
        strings: strings,
        unique: u
      };

      expect(result.unique[0]).assertEqual("abc");
      expect(result.unique[1]).assertEqual("def");
    });



  })
}

