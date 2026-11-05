'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from './../Util.test';

class UnsupportedLocaleOptions {
  style: string = "unsupported";
}

export default function shortToLocaleStringTest(): void {
  describe('ShortToLocaleStringTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0100
     * @tc.name testShortToLocaleString_merged1
     * @tc.desc BasicValue: covers 10 merged test points for Short.toLocaleString, including locale handling, negative values, sign handling, positive values, and zero values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString_merged1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let value: Short = new Short((-1234) as short);
        let result: String = value.toLocaleString("en-US", { useGrouping: false });
        expect(result).assertEqual("-1234");
        expect(result).assertEqual(
          new Intl.NumberFormat("en-US", { useGrouping: false }).format(-1234)
        );
      }

      {
        let value: Short = new Short((-1234) as short);
        let result: String = value.toLocaleString("en-US");
        expect(result).assertEqual("-1,234");
      }

      {
        let value: Short = new Short(Int.toShort(0));
        let result: String = value.toLocaleString("en-US");
        expect(result).assertEqual("0");
      }

      {
        let minValue: Short = new Short(Short.MIN_VALUE);
        let maxValue: Short = new Short(Short.MAX_VALUE);
        let negativeValue: Short = new Short((-12345) as short);
        let zeroValue: Short = new Short(0 as short);
  
        let minResult: String = minValue.toLocaleString();
        let maxResult: String = maxValue.toLocaleString();
        let negativeResult: String = negativeValue.toLocaleString();
        let zeroResult: String = zeroValue.toLocaleString();
  
        expect(minResult.startsWith('-')).assertTrue();
        expect(negativeResult.startsWith('-')).assertTrue();
        expect(maxResult.startsWith('-')).assertFalse();
        expect(zeroResult.startsWith('-')).assertFalse();
  
        expect(minResult).assertEqual(
          new Intl.NumberFormat().format(-32768)
        );
        expect(maxResult).assertEqual(
          new Intl.NumberFormat().format(32767)
        );
        expect(negativeResult).assertEqual(
          new Intl.NumberFormat().format(-12345)
        );
        expect(zeroResult).assertEqual(
          new Intl.NumberFormat().format(0)
        );
  
        expect(minResult === maxResult).assertFalse();
        expect(negativeResult === zeroResult).assertFalse();
      }

      {
        let posValue: Short = new Short(42 as short);
        let zeroValue: Short = new Short(0 as short);
        let negValue: Short = new Short((-42) as short);
        let posResult: String = posValue.toLocaleString("en-US", { signDisplay: "auto" });
        let zeroResult: String = zeroValue.toLocaleString("en-US", { signDisplay: "auto" });
        let negResult: String = negValue.toLocaleString("en-US", { signDisplay: "auto" });
        expect(posResult).assertEqual(new Intl.NumberFormat("en-US", { signDisplay: "auto" }).format(42));
        expect(zeroResult).assertEqual(new Intl.NumberFormat("en-US", { signDisplay: "auto" }).format(0));
        expect(negResult).assertEqual(new Intl.NumberFormat("en-US", { signDisplay: "auto" }).format(-42));
        expect(posResult).assertEqual("42");
        expect(zeroResult).assertEqual("0");
        expect(negResult).assertEqual("-42");
        expect(posResult.startsWith('-')).assertFalse();
        expect(zeroResult.startsWith('-')).assertFalse();
        expect(negResult.startsWith('-')).assertTrue();
      }

      {
        let value: Short = new Short(12345 as short);
        let result: String = value.toLocaleString("ru-RU");
        let expected: String = new Intl.NumberFormat("ru-RU").format(12345);
        expect(result).assertEqual(expected);
  
        let negativeValue: Short = new Short((-12345) as short);
        let negResult: String = negativeValue.toLocaleString("ru-RU");
        let negExpected: String = new Intl.NumberFormat("ru-RU").format(-12345);
        expect(negResult).assertEqual(negExpected);
      }

      {
        let value: Short = new Short(42 as short);
        let expectedSignResult: String = new Intl.NumberFormat(
          "en-US",
          { signDisplay: "always" }
        ).format(42);
        expect(value.toLocaleString("en-US", { signDisplay: "always" })).assertEqual(expectedSignResult);
      }

      {
        let value: Short = new Short((-42) as short);
        let signResult: String = value.toLocaleString("en-US", { signDisplay: "never" });
        let expectedSignResult: String = new Intl.NumberFormat(
          "en-US",
          { signDisplay: "never" }
        ).format(-42);
        expect(signResult).assertEqual(expectedSignResult);
      }

      {
        let testValues: short[] = [
          (-100) as short,
          (-1000) as short,
          (-12345) as short
        ];
        let caseCount: int = testValues.length;
        for (let index: int = 0; index < caseCount; index++) {
          let numValue: int = Short.toInt(testValues[index]);
          let result: String = new Short(testValues[index]).toLocaleString("fr-FR");
          let expectedResult: String = new Intl.NumberFormat("fr-FR").format(numValue);
          expect(result).assertEqual(expectedResult);
        }
      }

      {
        let negValue: Short = new Short((-5000) as short);
        let posValue: Short = new Short(5000 as short);
  
        let alwaysSignNeg: String = negValue.toLocaleString("de-DE", { signDisplay: "always" });
        let alwaysSignPos: String = posValue.toLocaleString("de-DE", { signDisplay: "always" });
        let neverSignNeg: String = negValue.toLocaleString("de-DE", { signDisplay: "never" });
  
        expect(alwaysSignNeg.startsWith('-')).assertTrue();
        expect(alwaysSignPos.startsWith('+')).assertTrue();
        expect(neverSignNeg.startsWith('5')).assertTrue();
        expect(alwaysSignNeg).assertEqual(new Intl.NumberFormat("de-DE", { signDisplay: "always" }).format(-5000));
        expect(alwaysSignPos).assertEqual(new Intl.NumberFormat("de-DE", { signDisplay: "always" }).format(5000));
        expect(neverSignNeg).assertEqual(new Intl.NumberFormat("de-DE", { signDisplay: "never" }).format(-5000));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0200
     * @tc.name testShortToLocaleString_merged2
     * @tc.desc BasicValue / BoundaryOverflow: covers 10 merged test points for Short.toLocaleString, including negative values, locale handling, sign handling, positive values, and zero values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString_merged2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let negValue: Short = new Short((-1500) as short);
        let posValue: Short = new Short(1500 as short);
  
        let negResult: String = negValue.toLocaleString("en-US", {
          style: "currency",
          currency: "USD",
          currencySign: "accounting"
        });
        let posResult: String = posValue.toLocaleString("en-US", {
          style: "currency",
          currency: "USD",
          currencySign: "accounting"
        });
  
        expect(negResult.startsWith('(')).assertTrue();
        expect(posResult.startsWith('$')).assertTrue();
  
        let expectedNeg: String = new Intl.NumberFormat("en-US", {
          style: "currency",
          currency: "USD",
          currencySign: "accounting"
        }).format(-1500);
        expect(negResult).assertEqual(expectedNeg);
      }

      {
        let values: Short[] = [new Short((-15000) as short), new Short((-2500) as short)];
        for (let v of values) {
          let result: String = v.toLocaleString("en-US", { notation: "compact", compactDisplay: "short" });
          expect(result.startsWith('-')).assertTrue();
          let expected: String = new Intl.NumberFormat("en-US", { notation: "compact", compactDisplay: "short" }).format(v.toInt());
          expect(result).assertEqual(expected);
        }
      }

      {
        let value: Short = new Short(32767 as short);
        let result: String = value.toLocaleString("en-US", {
          notation: "scientific",
          signDisplay: "always"
        });
        expect(result.startsWith('+')).assertTrue();
        let expected: String = new Intl.NumberFormat("en-US", {
          notation: "scientific",
          signDisplay: "always"
        }).format(32767);
        expect(result).assertEqual(expected);
      }

      {
        let negValue: Short = new Short((-32000) as short);
        let result: String = negValue.toLocaleString("de-DE", {
          style: "currency",
          currency: "EUR",
          currencySign: "accounting"
        });
        let expected: String = new Intl.NumberFormat("de-DE", {
          style: "currency",
          currency: "EUR",
          currencySign: "accounting"
        }).format(-32000);
        expect(result).assertEqual(expected);
        expect(result.includes('-')).assertTrue();
      }

      {
        let posVal: Short = new Short(42 as short);
        let negVal: Short = new Short((-42) as short);
        let zeroVal: Short = new Short(0 as short);
  
        let posResult: String = posVal.toLocaleString("en-US", { signDisplay: "exceptZero" });
        let negResult: String = negVal.toLocaleString("en-US", { signDisplay: "exceptZero" });
        let zeroResult: String = zeroVal.toLocaleString("en-US", { signDisplay: "exceptZero" });
  
        expect(posResult).assertEqual(new Intl.NumberFormat("en-US", { signDisplay: "exceptZero" }).format(42));
        expect(negResult).assertEqual(new Intl.NumberFormat("en-US", { signDisplay: "exceptZero" }).format(-42));
        expect(zeroResult).assertEqual(new Intl.NumberFormat("en-US", { signDisplay: "exceptZero" }).format(0));
      }

      {
        let value: Short = new Short(15000 as short);
        let result: String = value.toLocaleString("en-US", {
          notation: "engineering",
          signDisplay: "exceptZero"
        });
        let expected: String = new Intl.NumberFormat("en-US", {
          notation: "engineering",
          signDisplay: "exceptZero"
        }).format(15000);
        expect(result).assertEqual(expected);
        expect(result.includes('E') || result.includes('e')).assertTrue();
      }

      {
        let value: Short = new Short((-15000) as short);
        let result: String = value.toLocaleString("en-US", {
          notation: "compact",
          compactDisplay: "long"
        });
        let expected: String = new Intl.NumberFormat("en-US", {
          notation: "compact",
          compactDisplay: "long"
        }).format(-15000);
        expect(result).assertEqual(expected);
        expect(result.startsWith('-')).assertTrue();
      }

      {
        let s: Short = new Short((-500) as short);
        let result: string = s.toLocaleString('de-DE', { style: 'currency', currency: 'EUR' });
        let expected: string = new Intl.NumberFormat('de-DE', {
          style: 'currency', currency: 'EUR'
        }).format(s.toInt());
        expect(result).assertEqual(expected);
        expect(result.indexOf('-') >= 0).assertTrue();
      }

      {
        let s: Short = new Short(Double.toShort(3.9));
        expect(s.toInt()).assertEqual(3);
        expect(s.toLocaleString("en-US")).assertEqual("3");
  
        let neg: Short = new Short(Double.toShort(-2.7));
        expect(neg.toInt()).assertEqual(-2);
        expect(neg.toLocaleString("en-US")).assertEqual("-2");
  
        let grouped: Short = new Short(Double.toShort(1000.99));
        expect(grouped.toInt()).assertEqual(1000);
        expect(grouped.toLocaleString("en-US")).assertEqual("1,000");
        expect(grouped.toLocaleString("de-DE")).assertEqual("1.000");
  
        let maxBoundary: Short = new Short(Double.toShort(32767.9));
        expect(maxBoundary.toInt()).assertEqual(32767);
        expect(maxBoundary.toLocaleString("en-US")).assertEqual("32,767");
        expect(maxBoundary.toLocaleString("en-US")).assertEqual(
          new Intl.NumberFormat("en-US").format(maxBoundary.toInt()));
  
        let minBoundary: Short = new Short(Double.toShort(-32768.9));
        expect(minBoundary.toInt()).assertEqual(-32768);
        expect(minBoundary.toLocaleString("en-US")).assertEqual("-32,768");
        expect(minBoundary.toLocaleString("de-DE")).assertEqual("-32.768");
      }

      {
        let boundaryValues: short[] = [
          Short.MIN_VALUE,
          Short.MAX_VALUE
        ];
        let expectedValues: String[] = [
          "-32,768",
          "32,767"
        ];
        let caseCount: int = 2;
        for (let index: int = 0; index < caseCount; index++) {
          let result: String = new Short(boundaryValues[index]).toLocaleString("en-US");
          expect(result).assertEqual(expectedValues[index]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0300
     * @tc.name testShortToLocaleString_merged3
     * @tc.desc BoundaryOverflow: covers 10 merged test points for Short.toLocaleString, including boundary values, locale handling, overflow, wrapping, and bitwise operations.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString_merged3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxPlusOne: Short = new Short(Short.MAX_VALUE).add(new Short(1 as short));
        expect(maxPlusOne.toInt()).assertEqual(-32768);
        expect(maxPlusOne.toLocaleString("en-US")).assertEqual("-32,768");
  
        let maxPlusTwo: Short = new Short(Short.MAX_VALUE).add(new Short(2 as short));
        expect(maxPlusTwo.toInt()).assertEqual(-32767);
        expect(maxPlusTwo.toLocaleString("en-US")).assertEqual("-32,767");
  
        let minMinusOne: Short = new Short(Short.MIN_VALUE).sub(new Short(1 as short));
        expect(minMinusOne.toInt()).assertEqual(32767);
        expect(minMinusOne.toLocaleString("en-US")).assertEqual("32,767");
  
        let wrapAdd: Short = new Short(30000 as short).add(new Short(5000 as short));
        expect(wrapAdd.toInt()).assertEqual(-30536);
        expect(wrapAdd.toLocaleString("en-US")).assertEqual("-30,536");
  
        let wrapSub: Short = new Short((-20000) as short).sub(new Short(20000 as short));
        expect(wrapSub.toInt()).assertEqual(25536);
        expect(wrapSub.toLocaleString("en-US")).assertEqual("25,536");
  
        expect(maxPlusOne.toLocaleString("en-US")).assertEqual(
          new Intl.NumberFormat("en-US").format(maxPlusOne.toInt()));
      }

      {
        let boundaryValues: short[] = [
          Short.MIN_VALUE,
          Short.MAX_VALUE,
          (-32767) as short,
          32766 as short
        ];
        let expectedValues: String[] = [
          "-32.768",
          "32.767",
          "-32.767",
          "32.766"
        ];
        let caseCount: int = boundaryValues.length;
        for (let index: int = 0; index < caseCount; index++) {
          let actualResult: String = new Short(boundaryValues[index]).toLocaleString("de-DE");
          expect(actualResult).assertEqual(expectedValues[index]);
        }
      }

      {
        let value: Short = new Short(Int.toShort(50));
        let result: String = value.toLocaleString("en-US", { maximumFractionDigits: 0 });
        expect(result).assertEqual("50");
      }

      {
        let boundaryValues: short[] = [
          Short.MIN_VALUE,
          Short.MAX_VALUE,
          (-32767) as short,
          32766 as short
        ];
        let caseCount: int = boundaryValues.length;
        for (let index: int = 0; index < caseCount; index++) {
          let numValue: int = Short.toInt(boundaryValues[index]);
          let actualResult: String = new Short(boundaryValues[index]).toLocaleString("fr-FR");
          let expectedResult: String = new Intl.NumberFormat("fr-FR").format(numValue);
          expect(actualResult).assertEqual(expectedResult);
        }
      }

      {
        let boundaryValues: short[] = [Short.MIN_VALUE, Short.MAX_VALUE, 1000 as short, 10000 as short];
        let caseCount: int = boundaryValues.length;
        for (let index: int = 0; index < caseCount; index++) {
          let numValue: int = Short.toInt(boundaryValues[index]);
          let actualResult: String = new Short(boundaryValues[index]).toLocaleString("es-ES", {
            style: "currency",
            currency: "EUR"
          });
          let expectedResult: String = new Intl.NumberFormat("es-ES", {
            style: "currency",
            currency: "EUR"
          }).format(numValue);
          expect(actualResult).assertEqual(expectedResult);
          expect(actualResult.includes('€')).assertTrue();
        }
      }

      {
        let boundaryValues: short[] = [Short.MIN_VALUE, Short.MAX_VALUE, (-1) as short, 0 as short];
        let caseCount: int = boundaryValues.length;
        for (let index: int = 0; index < caseCount; index++) {
          let numValue: int = Short.toInt(boundaryValues[index]);
          let actualResult: String = new Short(boundaryValues[index]).toLocaleString("ko-KR", {
            notation: "scientific",
            minimumSignificantDigits: 3
          });
          let expectedResult: String = new Intl.NumberFormat("ko-KR", {
            notation: "scientific",
            minimumSignificantDigits: 3
          }).format(numValue);
          expect(actualResult).assertEqual(expectedResult);
          expect(actualResult.includes('E') || actualResult.includes('e')).assertTrue();
        }
      }

      {
        let largeValue: Short = new Short(32767 as short);
        let sciLarge: string = largeValue.toLocaleString('en-US', { notation: 'scientific' });
        expect(sciLarge.includes('E') || sciLarge.includes('e')).assertTrue();
  
        let engLarge: string = largeValue.toLocaleString('en-US', { notation: 'engineering' });
        expect(engLarge.includes('E') || engLarge.includes('e')).assertTrue();
        expect(sciLarge).assertEqual(new Intl.NumberFormat('en-US', { notation: 'scientific' }).format(32767));
        expect(engLarge).assertEqual(new Intl.NumberFormat('en-US', { notation: 'engineering' }).format(32767));
      }

      {
        let thresholdValues: short[] = [
          999 as short, 1000 as short, 9999 as short, 10000 as short, 32000 as short
        ];
        let caseCount: int = thresholdValues.length;
        for (let i: int = 0; i < caseCount; i++) {
          let s: Short = new Short(thresholdValues[i]);
          let result: String = s.toLocaleString("en-US", { notation: "compact", compactDisplay: "short" });
          let expected: String = new Intl.NumberFormat("en-US", {
            notation: "compact",
            compactDisplay: "short"
          }).format(Short.toInt(thresholdValues[i]));
          expect(result).assertEqual(expected);
        }
      }

      {
        let value: Short = new Short(Short.MAX_VALUE);
        let result: String = value.toLocaleString("en-US", { notation: "compact", compactDisplay: "short" });
        let expected: String = new Intl.NumberFormat("en-US", { notation: "compact", compactDisplay: "short" }).format(32767);
        expect(result).assertEqual(expected);
        expect(result.includes('K') || result.includes('k')).assertTrue();
      }

      {
        let value: Short = new Short(Short.MIN_VALUE);
        let result: String = value.toLocaleString("en-US", {
          style: "currency",
          currency: "USD",
          currencySign: "accounting"
        });
        let expected: String = new Intl.NumberFormat("en-US", {
          style: "currency",
          currency: "USD",
          currencySign: "accounting"
        }).format(-32768);
        expect(result).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0400
     * @tc.name testShortToLocaleString_merged4
     * @tc.desc BoundaryOverflow / ErrorException / SpecialValue / CrossTypeRoundTrip / RadixConversion: covers 10 merged test points for Short.toLocaleString, including locale handling, exceptions, fractions and rounding, division and modulo, and loop accumulation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString_merged4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(20000 as short);
        let b: Short = new Short(3 as short);
        let quot: Short = a.div(b);
        expect(quot.toLocaleString('en-US')).assertEqual('6,666');
        expect(quot.toLocaleString('en-US')).assertEqual(
          new Intl.NumberFormat('en-US').format(quot.toInt()));
      }

      {
        let value: Short = new Short(100 as short);
        try {
          value.toLocaleString("invalid_locale_string!");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      {
        let value: Short = new Short(100 as short);
        try {
          value.toLocaleString("en-US", { style: "currency" });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      {
        let value: Short = new Short(100 as short);
        try {
          value.toLocaleString("en-US", { style: "currency", currency: "INVALID" });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }

      {
        let value: Short = new Short(5678 as short);
        let result: String = value.toLocaleString(["invalid-XX", "fr-FR", "en-US"]);
        let expected: String = new Intl.NumberFormat("fr-FR").format(5678);
        expect(result).assertEqual(expected);
      }

      {
        let value: Short = new Short(1234 as short);
        let resultOmit: String = value.toLocaleString("en-US");
        let resultUndefined: String = value.toLocaleString("en-US", undefined);
        expect(resultOmit).assertEqual(resultUndefined);
        expect(resultOmit).assertEqual("1,234");
      }

      {
        let small: Short = new Short(500 as short);
        expect(small.toLocaleString('en-US')).assertEqual(small.toString());
        let large: Short = new Short(12345 as short);
        let localized: string = large.toLocaleString('en-US');
        let plain: string = large.toString();
        expect(localized !== plain).assertTrue();
        expect(localized).assertEqual('12,345');
      }

      {
        let value: Short = new Short(1234 as short);
        let currencyResult: String = value.toLocaleString("en-US", { style: "currency", currency: "USD" });
        let expectedCurrencyResult: String = new Intl.NumberFormat(
          "en-US",
          { style: "currency", currency: "USD" }
        ).format(1234);
        expect(currencyResult).assertEqual(expectedCurrencyResult);
      }

      {
        let value: Short = new Short(50 as short);
        expect(value.toLocaleString("en-US", { minimumFractionDigits: 2 })).assertEqual("50.00");
      }

      {
        let value: Short = new Short(2500 as short);
        let currencyResult: String = value.toLocaleString("de-DE", { style: "currency", currency: "EUR" });
        let expectedCurrencyResult: String = new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(2500);
        expect(currencyResult).assertEqual(expectedCurrencyResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0500
     * @tc.name testShortToLocaleString_merged5
     * @tc.desc RadixConversion: covers 10 merged test points for Short.toLocaleString, including locale handling, boundary values, fractions and rounding, sign handling, and equality consistency.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString_merged5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let value: Short = new Short(25 as short);
        let percentResult: String = value.toLocaleString("zh-CN", { style: "percent" });
        let expectedPercentResult: String = new Intl.NumberFormat(
          "zh-CN",
          { style: "percent" }
        ).format(25);
        expect(percentResult).assertEqual(expectedPercentResult);
      }

      {
        let value: Short = new Short(1000 as short);
        let resultNoGroup: String = value.toLocaleString("en-US", { useGrouping: false });
        let resultDefault: String = value.toLocaleString("en-US");
        let resultExplicitTrue: String = value.toLocaleString("en-US", { useGrouping: true });
        expect(resultNoGroup).assertEqual("1000");
        expect(resultDefault).assertEqual("1,000");
        expect(resultExplicitTrue).assertEqual("1,000");
        expect(resultNoGroup === resultDefault).assertFalse();
        expect(resultNoGroup === resultExplicitTrue).assertFalse();
        expect(resultDefault).assertEqual(resultExplicitTrue);
      }

      {
        let smallValue: Short = new Short(5 as short);
        let largeValue: Short = new Short(25 as short);
        let smallResult: String = smallValue.toLocaleString("en-US", { style: "percent", minimumIntegerDigits: 4 });
        let largeResult: String = largeValue.toLocaleString("en-US", { style: "percent", minimumIntegerDigits: 4 });
        expect(smallResult).assertEqual(new Intl.NumberFormat("en-US", { style: "percent", minimumIntegerDigits: 4 }).format(5));
        expect(largeResult).assertEqual(new Intl.NumberFormat("en-US", { style: "percent", minimumIntegerDigits: 4 }).format(25));
        expect(smallResult).assertEqual("0,500%");
        expect(largeResult).assertEqual("2,500%");
      }

      {
        let value: Short = new Short(25 as short);
        let result: String = value.toLocaleString("en-US", {
          minimumFractionDigits: 2,
          maximumFractionDigits: 4
        });
        expect(result).assertEqual("25.00");
      }

      {
        let locale: string = "en-US";
        let value: Short = new Short(42 as short);
        let result: String = value.toLocaleString(locale, { minimumIntegerDigits: 4 });
        expect(result).assertEqual("0,042");
      }

      {
        let value: Short = new Short(Short.toShort(12 as short));
        let result: String = value.toLocaleString("en-US", { minimumSignificantDigits: 3 });
        expect(result).assertEqual("12.0");
      }

      {
        let value: Short = new Short(12345 as short);
        let result: String = value.toLocaleString("en-US", { maximumSignificantDigits: 5 });
        expect(result.startsWith("12")).assertTrue();
        expect(result.endsWith("345")).assertTrue();
        expect(result.length).assertEqual(6);
      }

      {
        let value: Short = new Short(1234 as short);
        let combinedResult: String = value.toLocaleString("en-US", {
          minimumSignificantDigits: 3,
          maximumSignificantDigits: 6
        });
        let expectedCombinedResult: String = new Intl.NumberFormat(
          "en-US",
          { minimumSignificantDigits: 3, maximumSignificantDigits: 6 }
        ).format(1234);
        expect(combinedResult).assertEqual(expectedCombinedResult);
      }

      {
        let value: Short = new Short(9999 as short);
        let maxSigResult: String = value.toLocaleString("en-US", {
          maximumSignificantDigits: 4,
          useGrouping: false
        });
        let expectedMaxSigResult: String = new Intl.NumberFormat(
          "en-US",
          { maximumSignificantDigits: 4, useGrouping: false }
        ).format(9999);
        expect(maxSigResult).assertEqual(expectedMaxSigResult);
      }

      {
        let value: Short = new Short(Int.toShort(8000));
        let expectedCombinedResult: String = new Intl.NumberFormat(
          "de-DE",
          { style: "currency", currency: "EUR", minimumFractionDigits: 2 }
        ).format(8000);
        expect(value.toLocaleString("de-DE", {
          style: "currency",
          currency: "EUR",
          minimumFractionDigits: 2
        })).assertEqual(expectedCombinedResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0600
     * @tc.name testShortToLocaleString_merged6
     * @tc.desc RadixConversion: covers 10 merged test points for Short.toLocaleString, including fractions and rounding, boundary values, locale handling, zero values, and containers and references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString_merged6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let value: Short = new Short(42 as short);
  
        let fallback: string = value.toLocaleString('en-US');
        expect(fallback).assertEqual('42');
  
        for (let loc of ['en-US', 'zh-CN']) {
          let result: string = value.toLocaleString(loc, { minimumIntegerDigits: 3 });
          expect(result).assertEqual('042');
        }
      }

      {
        let value: Short = new Short(12345 as short);
  
        let defaultStr: String = value.toLocaleString('en-US');
        let usdStr: String = value.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
        let eurStr: String = value.toLocaleString('en-US', { style: 'currency', currency: 'EUR' });
        let jpyStr: String = value.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' });
        let pctStr: String = value.toLocaleString('en-US', { style: 'percent' });
        let sciStr: String = value.toLocaleString('en-US', {
          notation: 'scientific',
          minimumSignificantDigits: 4
        });
        let compStr: String = value.toLocaleString('en-US', { notation: 'compact', compactDisplay: 'short' });
  
        expect(defaultStr).assertEqual(new Intl.NumberFormat('en-US').format(value.toInt()));
        expect(usdStr).assertEqual(new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(value.toInt()));
        expect(eurStr).assertEqual(new Intl.NumberFormat('en-US', { style: 'currency', currency: 'EUR' }).format(value.toInt()));
        expect(jpyStr).assertEqual(new Intl.NumberFormat('ja-JP', { style: 'currency', currency: 'JPY' }).format(value.toInt()));
        expect(pctStr).assertEqual(new Intl.NumberFormat('en-US', { style: 'percent' }).format(value.toInt()));
        expect(sciStr).assertEqual(new Intl.NumberFormat('en-US', {
          notation: 'scientific',
          minimumSignificantDigits: 4
        }).format(value.toInt()));
        expect(compStr).assertEqual(new Intl.NumberFormat('en-US', { notation: 'compact', compactDisplay: 'short' }).format(value.toInt()));
  
        let representations: Set<string> = new Set<string>();
        representations.add(defaultStr);
        representations.add(usdStr);
        representations.add(eurStr);
        representations.add(jpyStr);
        representations.add(pctStr);
        representations.add(sciStr);
        representations.add(compStr);
  
        expect(representations.size).assertEqual(7);
  
        let allNonEmpty: boolean = true;
        representations.forEach((rep) => { if (rep.length === 0) allNonEmpty = false; });
        expect(allNonEmpty).assertTrue();
      }

      {
        let value: Short = new Short(25 as short);
        let result: String = value.toLocaleString("en-US", {
          style: "percent",
          minimumFractionDigits: 2
        });
        let expected: String = new Intl.NumberFormat("en-US", {
          style: "percent",
          minimumFractionDigits: 2
        }).format(25);
        expect(result).assertEqual(expected);
        expect(result.includes('%')).assertTrue();
        expect(result.includes('.')).assertTrue();
      }

      {
        let value: Short = new Short(33 as short);
        let result: String = value.toLocaleString("en-US", {
          style: "percent",
          useGrouping: false,
          maximumFractionDigits: 2
        });
        let expected: String = new Intl.NumberFormat("en-US", {
          style: "percent",
          useGrouping: false,
          maximumFractionDigits: 2
        }).format(33);
        expect(result).assertEqual(expected);
        expect(result.includes('%')).assertTrue();
        expect(result.includes(',')).assertFalse();
      }

      {
        let values: Short[] = [new Short(0 as short), new Short(42 as short), new Short(12345 as short)];
        for (let v of values) {
          let result: String = v.toLocaleString("en-US", {
            minimumFractionDigits: 0,
            maximumFractionDigits: 5
          });
          let expected: String = new Intl.NumberFormat("en-US", {
            minimumFractionDigits: 0,
            maximumFractionDigits: 5
          }).format(v.toInt());
          expect(result).assertEqual(expected);
        }
      }

      {
        let value: Short = new Short(32767 as short);
        let result: String = value.toLocaleString("de-DE", {
          style: "currency",
          currency: "EUR",
          currencyDisplay: "code",
          notation: "compact",
          compactDisplay: "short",
          signDisplay: "always",
          minimumFractionDigits: 0,
          maximumFractionDigits: 3,
          useGrouping: true
        });
        let expected: String = new Intl.NumberFormat("de-DE", {
          style: "currency",
          currency: "EUR",
          currencyDisplay: "code",
          notation: "compact",
          compactDisplay: "short",
          signDisplay: "always",
          minimumFractionDigits: 0,
          maximumFractionDigits: 3,
          useGrouping: true
        }).format(32767);
        expect(result).assertEqual(expected);
        expect(result.includes('EUR')).assertTrue();
        expect(result.startsWith('+')).assertTrue();
      }

      {
        let value: Short = new Short(1000 as short);
        let largeValue: Short = new Short(25000 as short);
        let result: String = value.toLocaleString("en-US", { notation: "scientific", minimumFractionDigits: 3 });
        let largeResult: String = largeValue.toLocaleString("en-US", { notation: "scientific", minimumFractionDigits: 3 });
        expect(result).assertEqual(new Intl.NumberFormat("en-US", { notation: "scientific", minimumFractionDigits: 3 }).format(1000));
        expect(largeResult).assertEqual(new Intl.NumberFormat("en-US", { notation: "scientific", minimumFractionDigits: 3 }).format(25000));
        expect(result.includes('e') || result.includes('E')).assertTrue();
        expect(result.includes('1.000')).assertTrue();
        expect(largeResult.includes('2.500')).assertTrue();
      }

      {
        let value: Short = new Short(12345 as short);
        let smallValue: Short = new Short(999 as short);
        let result: String = value.toLocaleString("en-US", { notation: "compact", compactDisplay: "short", minimumFractionDigits: 2 });
        let smallResult: String = smallValue.toLocaleString("en-US", { notation: "compact", compactDisplay: "short", minimumFractionDigits: 2 });
        expect(result).assertEqual(new Intl.NumberFormat("en-US", { notation: "compact", compactDisplay: "short", minimumFractionDigits: 2 }).format(12345));
        expect(smallResult).assertEqual(new Intl.NumberFormat("en-US", { notation: "compact", compactDisplay: "short", minimumFractionDigits: 2 }).format(999));
        expect(result).assertEqual("12.345K");
        expect(smallResult).assertEqual("999.00");
      }

      {
        let valueMb: Short = new Short(512 as short);
        let valueGb: Short = new Short(16 as short);
        let resultMb: String = valueMb.toLocaleString("en-US", { style: "unit", unit: "megabyte", unitDisplay: "short" });
        let expectedMb: String = new Intl.NumberFormat("en-US", { style: "unit", unit: "megabyte", unitDisplay: "short" }).format(512);
        expect(resultMb).assertEqual(expectedMb);
        let resultGb: String = valueGb.toLocaleString("en-US", { style: "unit", unit: "gigabyte", unitDisplay: "short" });
        let expectedGb: String = new Intl.NumberFormat("en-US", { style: "unit", unit: "gigabyte", unitDisplay: "short" }).format(16);
        expect(resultGb).assertEqual(expectedGb);
      }

      {
        let value: Short = new Short(42 as short);
        let opts: Intl.NumberFormatOptions = {
          style: 'decimal',
          minimumFractionDigits: 5,
          maximumFractionDigits: 5
        };
        let result: String = value.toLocaleString('en-US', opts);
        let expected: String = new Intl.NumberFormat('en-US', {
          style: 'decimal',
          minimumFractionDigits: 5,
          maximumFractionDigits: 5
        }).format(42);
        expect(result).assertEqual(expected);
        let decimalPart: string = result.toString().split('.')[1];
        expect(decimalPart.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0700
     * @tc.name testShortToLocaleString_merged7
     * @tc.desc RadixConversion / Idempotent: covers 10 merged test points for Short.toLocaleString, including locale handling, idempotence, equality consistency, boundary values, and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString_merged7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let value: Short = new Short(1234 as short);
        let opts: Intl.NumberFormatOptions = {
          style: 'currency',
          currency: 'USD',
          minimumFractionDigits: 3,
          maximumFractionDigits: 3
        };
        let result: String = value.toLocaleString('en-US', opts);
        let expected: String = new Intl.NumberFormat('en-US', {
          style: 'currency',
          currency: 'USD',
          minimumFractionDigits: 3,
          maximumFractionDigits: 3
        }).format(1234);
        expect(result).assertEqual(expected);
      }

      {
        let value: Short = new Short(1234 as short);
        let firstResult: String = value.toLocaleString("en-US");
        let secondResult: String = value.toLocaleString("en-US");
        let thirdResult: String = value.toLocaleString("en-US");
        expect(firstResult).assertEqual(secondResult);
        expect(secondResult).assertEqual(thirdResult);
        expect(firstResult).assertEqual("1,234");
      }

      {
        let value: Short = new Short(999 as short);
        let firstResult: String = value.toLocaleString("en-US", { style: "decimal", useGrouping: false });
        let secondResult: String = value.toLocaleString("en-US", { style: "decimal", useGrouping: false });
        let thirdResult: String = value.toLocaleString("en-US", { style: "decimal", useGrouping: false });
        expect(firstResult).assertEqual(secondResult);
        expect(secondResult).assertEqual(thirdResult);
        expect(firstResult).assertEqual("999");
      }

      {
        let value: Short = new Short(5000 as short);
        let enFirstResult: String = value.toLocaleString("en-US");
        let enSecondResult: String = value.toLocaleString("en-US");
        let deFirstResult: String = value.toLocaleString("de-DE");
        let deSecondResult: String = value.toLocaleString("de-DE");
        expect(enFirstResult).assertEqual(enSecondResult);
        expect(deFirstResult).assertEqual(deSecondResult);
      }

      {
        let firstValue: Short = new Short(256 as short);
        let secondValue: Short = new Short(256 as short);
        let thirdValue: Short = new Short(256 as short);
        let firstResult: String = firstValue.toLocaleString("en-US");
        let secondResult: String = secondValue.toLocaleString("en-US");
        let thirdResult: String = thirdValue.toLocaleString("en-US");
        expect(firstResult).assertEqual(secondResult);
        expect(secondResult).assertEqual(thirdResult);
        expect(firstResult).assertEqual("256");
      }

      {
        let value: Short = new Short(777 as short);
        let beforeValue: short = value.toShort();
        let enResult: String = value.toLocaleString("en-US");
        let deResult: String = value.toLocaleString("de-DE");
        let zhResult: String = value.toLocaleString("zh-CN");
        let afterValue: short = value.toShort();
        expect(beforeValue).assertEqual(afterValue);
        expect(enResult).assertEqual("777");
        expect(deResult).assertEqual("777");
        expect(zhResult).assertEqual("777");
      }

      {
        let value: Short = new Short(555 as short);
        let firstResult: String = value.toLocaleString();
        let secondResult: String = value.toLocaleString();
        let thirdResult: String = value.toLocaleString();
        expect(firstResult).assertEqual(secondResult);
        expect(secondResult).assertEqual(thirdResult);
      }

      {
        let value: Short = new Short(666 as short);
        let unsupportedOptions: object = new UnsupportedLocaleOptions();
        let baselineResult: String = value.toLocaleString("de-DE");
        let firstResult: String = value.toLocaleString("de-DE", unsupportedOptions);
        let secondResult: String = value.toLocaleString("de-DE", unsupportedOptions);
        let thirdResult: String = value.toLocaleString("de-DE", unsupportedOptions);
        expect(firstResult).assertEqual(baselineResult);
        expect(secondResult).assertEqual(firstResult);
        expect(thirdResult).assertEqual(secondResult);
      }

      {
        let zeroValue: Short = new Short(0 as short);
        let locales: string[] = ["en-US", "de-DE", "zh-CN", "ja-JP", "fr-FR", "es-ES", "ko-KR"];
        let caseCount: int = locales.length;
        for (let index: int = 0; index < caseCount; index++) {
          let result: String = zeroValue.toLocaleString(locales[index]);
          let expectedResult: String = new Intl.NumberFormat(locales[index]).format(0);
          expect(result).assertEqual(expectedResult);
        }
      }

      {
        let value: Short = new Short(Int.toShort(1500));
        let firstResult: String = value.toLocaleString("fr-FR",
          { style: "currency", currency: "EUR" });
        let secondResult: String = value.toLocaleString("fr-FR",
          { style: "currency", currency: "EUR" });
        let thirdResult: String = value.toLocaleString("fr-FR",
          { style: "currency", currency: "EUR" });
        expect(firstResult).assertEqual(secondResult);
        expect(secondResult).assertEqual(thirdResult);
        let expectedResult: String = new Intl.NumberFormat("fr-FR",
          { style: "currency", currency: "EUR" }
        ).format(1500);
        expect(firstResult).assertEqual(expectedResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0800
     * @tc.name testShortToLocaleString_merged8
     * @tc.desc Idempotent / ArithmeticBitwise: covers 10 merged test points for Short.toLocaleString, including locale handling, equality consistency, fractions and rounding, radix conversion, and constructor forms.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString_merged8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let literalInstance: Short = new Short(1234 as short);
        let fromIntInstance: Short = new Short(Int.toShort(1234));
        let hexInstance: Short = new Short(0x4D2 as short);
  
        let literalResult: String = literalInstance.toLocaleString("de-DE");
        let fromIntResult: String = fromIntInstance.toLocaleString("de-DE");
        let hexResult: String = hexInstance.toLocaleString("de-DE");
  
        expect(literalResult).assertEqual(fromIntResult);
        expect(fromIntResult).assertEqual(hexResult);
  
        let expectedResult: String = new Intl.NumberFormat("de-DE").format(1234);
        expect(literalResult).assertEqual(expectedResult);
      }

      {
        let value: Short = new Short(1234 as short);
        let emptyOptions: object = {} as object;
        let result: String = value.toLocaleString("en-US", emptyOptions);
        let expected: String = new Intl.NumberFormat("en-US").format(1234);
        expect(result).assertEqual(expected);
      }

      {
        let s: Short = new Short(0 as short);
        expect(s.toLocaleString('en-US')).assertEqual('0');
        expect(s.toLocaleString('en-US', { minimumFractionDigits: 2 })).assertEqual('0.00');
        expect(s.toLocaleString('de-DE', { minimumFractionDigits: 2 })).assertEqual('0,00');
        expect(s.toLocaleString('en-US', { minimumFractionDigits: 2 })).assertEqual(
          new Intl.NumberFormat('en-US', { minimumFractionDigits: 2 }).format(0));
        expect(s.toLocaleString('de-DE', { minimumFractionDigits: 2 })).assertEqual(
          new Intl.NumberFormat('de-DE', { minimumFractionDigits: 2 }).format(0));
      }

      {
        let values: short[] = [999 as short, 1000 as short, 32767 as short];
        let expectedValues: String[] = ["999", "1000", "32767"];
        let caseCount: int = 3;
        for (let index: int = 0; index < caseCount; index++) {
          let value: Short = new Short(values[index]);
          let result: String = value.toLocaleString("en-US", { useGrouping: false });
          expect(result).assertEqual(expectedValues[index]);
          expect(result).assertEqual(
            new Intl.NumberFormat("en-US", { useGrouping: false }).format(values[index])
          );
        }
      }

      {
        let value: Short = new Short(100 as short);
        let locales: string[] = ["en-US", "de-DE", "zh-CN", "ja-JP"];
        let caseCount: int = locales.length;
        for (let index: int = 0; index < caseCount; index++) {
          let result: String = value.toLocaleString(locales[index]);
          expect(result).assertEqual("100");
        }
      }

      {
        let value: Short = new Short(100 as short);
        let unsupportedStyleOptions: object = new UnsupportedLocaleOptions();
        let baselineResult: String = value.toLocaleString("en-US");
        let ignoredOptionsResult: String = value.toLocaleString("en-US", unsupportedStyleOptions);
        expect(ignoredOptionsResult).assertEqual(baselineResult);
      }

      {
        let locales: string[] = ['fr-FR', 'es-ES', 'ko-KR', 'ar-EG', 'pt-BR', 'hi-IN'];
        let value: Short = new Short(1234 as short);
        let localeCount: int = locales.length;
        for (let i: int = 0; i < localeCount; i++) {
          let result: String = value.toLocaleString(locales[i]);
          let expectedResult: String = new Intl.NumberFormat(locales[i]).format(1234);
          expect(result).assertEqual(expectedResult);
        }
      }

      {
        let value: Short = new Short(12345 as short);
        let smallValue: Short = new Short(500 as short);
        let result: String = value.toLocaleString("en-US", { style: "currency", currency: "USD", useGrouping: false });
        let smallResult: String = smallValue.toLocaleString("en-US", { style: "currency", currency: "USD", useGrouping: false });
        expect(result).assertEqual(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD", useGrouping: false }).format(12345));
        expect(smallResult).assertEqual(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD", useGrouping: false }).format(500));
        expect(result).assertEqual("$12345.00");
        expect(smallResult).assertEqual("$500.00");
        expect(result.includes(',')).assertFalse();
      }

      {
        let testValues: short[] = [
          100 as short,
          1000 as short,
          10000 as short,
          Short.MAX_VALUE
        ];
        let caseCount: int = testValues.length;
        for (let index: int = 0; index < caseCount; index++) {
          let numValue: int = Short.toInt(testValues[index]);
          let result: String = new Short(testValues[index]).toLocaleString("fr-FR");
          let expectedResult: String = new Intl.NumberFormat("fr-FR").format(numValue);
          expect(result).assertEqual(expectedResult);
        }
      }

      {
        let testValues: short[] = [1000 as short, 5000 as short, 15000 as short, 30000 as short];
        let caseCount: int = testValues.length;
        for (let index: int = 0; index < caseCount; index++) {
          let numValue: int = Short.toInt(testValues[index]);
          let result: String = new Short(testValues[index]).toLocaleString("ko-KR", {
            style: "currency",
            currency: "KRW",
            notation: "compact",
            compactDisplay: "short"
          });
          let expectedResult: String = new Intl.NumberFormat("ko-KR", {
            style: "currency",
            currency: "KRW",
            notation: "compact",
            compactDisplay: "short"
          }).format(numValue);
          expect(result).assertEqual(expectedResult);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_0900
     * @tc.name testShortToLocaleString_merged9
     * @tc.desc ArithmeticBitwise: covers 10 merged test points for Short.toLocaleString, including locale handling, fractions and rounding, comparison and ordering, and containers and references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString_merged9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let value: Short = new Short(15000 as short);
        let compactCurrencyResult: String = value.toLocaleString("en-US", {
          style: "currency",
          currency: "USD",
          notation: "compact",
          compactDisplay: "short"
        });
        let expectedCompactCurrencyResult: String = new Intl.NumberFormat(
          "en-US",
          { style: "currency", currency: "USD", notation: "compact", compactDisplay: "short" }
        ).format(15000);
        expect(compactCurrencyResult).assertEqual(expectedCompactCurrencyResult);
      }

      {
        let value: Short = new Short(12345 as short);
  
        let percent: string = value.toLocaleString('en-US', { style: 'percent' });
        expect(percent.includes('%')).assertTrue();
  
        let deGrouped: string = value.toLocaleString('de-DE');
        expect(deGrouped.includes('.')).assertTrue();
  
        let enGrouped: string = value.toLocaleString('en-US');
        expect(enGrouped.includes(',')).assertTrue();
  
        let compact: string = value.toLocaleString('en-US', { notation: 'compact', compactDisplay: 'short' });
        expect(compact.includes('K') || compact.includes('k')).assertTrue();
        expect(percent).assertEqual(new Intl.NumberFormat('en-US', { style: 'percent' }).format(12345));
        expect(deGrouped).assertEqual(new Intl.NumberFormat('de-DE').format(12345));
        expect(enGrouped).assertEqual(new Intl.NumberFormat('en-US').format(12345));
        expect(compact).assertEqual(new Intl.NumberFormat('en-US', { notation: 'compact', compactDisplay: 'short' }).format(12345));
      }

      {
        let testValue: Short = new Short(12345 as short);
        let locales: string[] = ['en-US', 'de-DE', 'zh-CN', 'ja-JP', 'fr-FR'];
  
        for (let locale of locales) {
          let viaToLocaleString: string = testValue.toLocaleString(locale);
          let viaIntl: string = new Intl.NumberFormat(locale).format(testValue.toInt());
          expect(viaToLocaleString).assertEqual(viaIntl);
        }
  
        let moneyValue: Short = new Short(9999 as short);
        let currencyLocales: [string, string][] = [
          ['en-US', 'USD'], ['de-DE', 'EUR'], ['ja-JP', 'JPY']
        ];
  
        for (let i: int = 0; i < currencyLocales.length; i++) {
          let loc: string = currencyLocales[i][0];
          let cur: string = currencyLocales[i][1];
          let viaMethod: string = moneyValue.toLocaleString(loc, { style: 'currency', currency: cur });
          let viaIntl: string = new Intl.NumberFormat(loc, { style: 'currency', currency: cur }).format(moneyValue.toInt());
          expect(viaMethod).assertEqual(viaIntl);
        }
      }

      {
        let localeGroups: Map<string, Short[]> = new Map<string, Short[]>();
        localeGroups.set('en-US', [new Short(1000 as short), new Short(25000 as short)]);
        localeGroups.set('fr-FR', [new Short(1000 as short), new Short(25000 as short)]);
  
        let allFormatted: Map<string, string[]> = new Map<string, string[]>();
  
        localeGroups.forEach((shortList, locale): void => {
          let formatted: string[] = [];
          for (let s of shortList) {
            formatted.push(s.toLocaleString(locale));
          }
          allFormatted.set(locale, formatted);
        });
  
        let enResults: string[] | undefined = allFormatted.get('en-US');
        expect(enResults![0].includes('1')).assertTrue();
        expect(enResults![1].includes('25')).assertTrue();
  
        let frResults: string[] | undefined = allFormatted.get('fr-FR');
        expect(frResults![0].includes('1')).assertTrue();
        expect(frResults![1].includes('25')).assertTrue();
  
        for (let s of localeGroups.get('en-US')!) {
          let viaMethod: string = s.toLocaleString('en-US');
          let viaIntl: string = new Intl.NumberFormat('en-US').format(s.toInt());
          expect(viaMethod).assertEqual(viaIntl);
        }
      }

      {
        let value: Short = new Short(5000 as short);
        let result: String = value.toLocaleString("en-US", {
          style: "unit",
          unit: "kilometer",
          unitDisplay: "short"
        });
        let expected: String = new Intl.NumberFormat("en-US", {
          style: "unit",
          unit: "kilometer",
          unitDisplay: "short"
        }).format(5000);
        expect(result).assertEqual(expected);
        expect(result.includes("km")).assertTrue();
      }

      {
        let values: Short[] = [new Short(25 as short), new Short((-10) as short)];
        for (let v of values) {
          let result: String = v.toLocaleString("en-US", {
            style: "unit",
            unit: "celsius",
            unitDisplay: "narrow"
          });
          let expected: String = new Intl.NumberFormat("en-US", {
            style: "unit",
            unit: "celsius",
            unitDisplay: "narrow"
          }).format(v.toInt());
          expect(result).assertEqual(expected);
          expect(result.includes("°")).assertTrue();
        }
      }

      {
        let value: Short = new Short(12345 as short);
  
        let shortResult: String = value.toLocaleString("en-US", {
          notation: "compact",
          compactDisplay: "short"
        });
        let longResult: String = value.toLocaleString("en-US", {
          notation: "compact",
          compactDisplay: "long"
        });
  
        expect(shortResult).assertEqual(
          new Intl.NumberFormat("en-US", { notation: "compact", compactDisplay: "short" }).format(12345)
        );
        expect(longResult).assertEqual(
          new Intl.NumberFormat("en-US", { notation: "compact", compactDisplay: "long" }).format(12345)
        );
        expect(shortResult.toString() !== longResult.toString()).assertTrue();
      }

      {
        let revenue: Short = new Short(25000 as short);
        let growth: Short = new Short(15 as short);
        let units: Short = new Short(1200 as short);
  
        let revStr: String = revenue.toLocaleString("en-US", {
          style: "currency",
          currency: "USD"
        });
        let growthStr: String = growth.toLocaleString("en-US", { style: "percent" });
        let unitsStr: String = units.toLocaleString("en-US");
  
        let report: string = `${revStr} revenue, ${growthStr} growth, ${unitsStr} units`;
        expect(report.includes('$')).assertTrue();
        expect(report.includes('%')).assertTrue();
        expect(report.includes('1,200')).assertTrue();
      }

      {
        let sizes: short[] = [1024 as short, 2048 as short, 16384 as short];
        let caseCount: int = sizes.length;
        for (let i: int = 0; i < caseCount; i++) {
          let s: Short = new Short(sizes[i]);
          let result: String = s.toLocaleString("en-US", {
            style: "unit",
            unit: "byte",
            notation: "compact",
            compactDisplay: "short"
          });
          let expected: String = new Intl.NumberFormat("en-US", {
            style: "unit",
            unit: "byte",
            notation: "compact",
            compactDisplay: "short"
          }).format(Short.toInt(sizes[i]));
          expect(result).assertEqual(expected);
        }
      }

      {
        let value: Short = new Short(42 as short);
        let expected: String = new Intl.NumberFormat("en-US", { style: "unit", unit: "kilometer", unitDisplay: "long" }).format(42);
        let result: String = value.toLocaleString("en-US", {
          style: "unit",
          unit: "kilometer",
          unitDisplay: "long"
        });
        expect(result).assertEqual(expected);
        expect(result.includes('kilometer')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1000
     * @tc.name testShortToLocaleString_merged10
     * @tc.desc ArithmeticBitwise / BatchSampling / BusinessScenario / Other: covers 10 merged test points for Short.toLocaleString, including locale handling, containers and references, radix conversion, equality consistency, and constructor forms.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString_merged10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: Short = new Short(5000 as short);
        let b: Short = new Short(7000 as short);
        let sum: Short = a.add(b);
        expect(sum.toLocaleString('en-US')).assertEqual('12,000');
        expect(sum.toLocaleString('de-DE')).assertEqual('12.000');
        expect(sum.toLocaleString('fr-FR')).assertEqual(
          new Intl.NumberFormat('fr-FR').format(sum.toInt()));
        expect(sum.toLocaleString('en-US')).assertEqual(
          new Intl.NumberFormat('en-US').format(sum.toInt()));
        expect(sum.toLocaleString('de-DE')).assertEqual(
          new Intl.NumberFormat('de-DE').format(sum.toInt()));
      }

      {
        let a: Short = new Short(12345 as short);
        let b: Short = new Short(2345 as short);
        let diff: Short = a.sub(b);
        expect(diff.toLocaleString('de-DE')).assertEqual('10.000');
        expect(diff.toLocaleString('en-US')).assertEqual('10,000');
        expect(diff.toLocaleString('en-US')).assertEqual(
          new Intl.NumberFormat('en-US').format(diff.toInt()));
        expect(diff.toLocaleString('de-DE')).assertEqual(
          new Intl.NumberFormat('de-DE').format(diff.toInt()));
      }

      {
        let a: Short = new Short(100 as short);
        let b: Short = new Short(100 as short);
        let prod: Short = a.mul(b);
        expect(prod.toLocaleString('fr-FR')).assertEqual(
          new Intl.NumberFormat('fr-FR').format(prod.toInt()));
      }

      {
        let p: Short = new Short(Short.parseInt('12345', 10));
        let l: Short = new Short(12345 as short);
        expect(p.toLocaleString('en-US')).assertEqual('12,345');
        expect(p.toLocaleString('en-US')).assertEqual(l.toLocaleString('en-US'));
        expect(p.toLocaleString('en-US')).assertEqual(
          new Intl.NumberFormat('en-US').format(p.toInt()));
      }

      {
        let values: Short[] = [
          new Short(100 as short), new Short(5000 as short), new Short(30000 as short)
        ];
  
        for (let v of values) {
          let result: String = v.toLocaleString("en-US", {
            style: "decimal", minimumFractionDigits: 2
          });
          let expected: String = new Intl.NumberFormat("en-US", {
            style: "decimal", minimumFractionDigits: 2
          }).format(v.toInt());
          expect(result).assertEqual(expected);
        }
  
        for (let v of values) {
          let result: String = v.toLocaleString("en-US", {
            style: "currency", currency: "EUR"
          });
          let expected: String = new Intl.NumberFormat("en-US", {
            style: "currency", currency: "EUR"
          }).format(v.toInt());
          expect(result).assertEqual(expected);
        }
  
        for (let v of values) {
          let result: String = v.toLocaleString("en-US", { style: "percent" });
          let expected: String = new Intl.NumberFormat("en-US", {
            style: "percent"
          }).format(v.toInt());
          expect(result).assertEqual(expected);
        }
  
        for (let v of values) {
          let result: String = v.toLocaleString("en-US", {
            notation: "scientific", minimumSignificantDigits: 4
          });
          let expected: String = new Intl.NumberFormat("en-US", {
            notation: "scientific", minimumSignificantDigits: 4
          }).format(v.toInt());
          expect(result).assertEqual(expected);
        }
  
        for (let v of values) {
          let result: String = v.toLocaleString("en-US", {
            style: "currency", currency: "JPY", notation: "compact", compactDisplay: "short"
          });
          let expected: String = new Intl.NumberFormat("en-US", {
            style: "currency", currency: "JPY", notation: "compact", compactDisplay: "short"
          }).format(v.toInt());
          expect(result).assertEqual(expected);
        }
      }

      {
        let values: Short[] = [
          new Short(1234 as short), new Short(Int.toShort(56789)), new Short(Int.toShort(-4321))
        ];
  
        let locales: string[] = ['en-US', 'de-DE', 'zh-CN', 'ja-JP'];
  
        let formatCache: Map<string, string> = new Map<string, string>();
        for (let v of values) {
          for (let loc of locales) {
            let cacheKey: string = v.toInt() + '_' + loc;
            let formatted: string = v.toLocaleString(loc);
            formatCache.set(cacheKey, formatted);
          }
        }
  
        let us1234: string | undefined = formatCache.get('1234_en-US');
        let de1234: string | undefined = formatCache.get('1234_de-DE');
        let cn1234: string | undefined = formatCache.get('1234_zh-CN');
        expect(us1234).assertEqual('1,234');
        expect(de1234).assertEqual('1.234');
        expect(cn1234).assertEqual('1,234');
        expect(formatCache.size).assertEqual(12);
      }

      {
        let value: Short = new Short(12345 as short);
        let lookup: String = value.toLocaleString('en-US', { localeMatcher: 'lookup' });
        expect(lookup).assertEqual('12,345');
        expect(lookup).assertEqual(new Intl.NumberFormat('en-US', { localeMatcher: 'lookup' }).format(12345));
  
        let bestFit: String = value.toLocaleString('en-US', { localeMatcher: 'best fit' });
        expect(bestFit).assertEqual('12,345');
        expect(bestFit).assertEqual(new Intl.NumberFormat('en-US', { localeMatcher: 'best fit' }).format(12345));
        expect(lookup).assertEqual(bestFit);
      }

      {
        let value: Short = new Short(12345 as short);
        let deFirst: String = value.toLocaleString(['de-DE', 'en-US'], { localeMatcher: 'lookup' });
        let enFirst: String = value.toLocaleString(['en-US', 'de-DE'], { localeMatcher: 'lookup' });
  
        expect(deFirst).assertEqual('12.345');
        expect(enFirst).assertEqual('12,345');
        expect(deFirst !== enFirst).assertTrue();
  
        expect(deFirst).assertEqual(new Intl.NumberFormat(['de-DE', 'en-US'], { localeMatcher: 'lookup' }).format(12345));
        expect(enFirst).assertEqual(new Intl.NumberFormat(['en-US', 'de-DE'], { localeMatcher: 'lookup' }).format(12345));
      }

      {
        let value: Short = new Short(1234 as short);
        let result: String = value.toLocaleString("en-US");
        expect(result).assertEqual("1,234");
      }

      {
        let value: Short = new Short(1234 as short);
        expect(value.toLocaleString("de-DE")).assertEqual("1.234");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1100
     * @tc.name testShortToLocaleString_merged11
     * @tc.desc Other: covers 10 merged test points for Short.toLocaleString, including locale handling and fractions and rounding.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString_merged11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let value: Short = new Short(1234 as short);
        let result: String = value.toLocaleString("en-US", { style: "decimal" });
        expect(result).assertEqual("1,234");
      }

      {
        let value: Short = new Short(12 as short);
        let result: String = value.toLocaleString("en-US", {
          style: "percent"
        });
        expect(result).assertEqual("1,200%");
      }

      {
        let values: short[] = [5 as short, 1234 as short, 32767 as short];
        let expectedValues: String[] = ["5", "1.234", "32.767"];
        let caseCount: int = 3;
        for (let index: int = 0; index < caseCount; index++) {
          let value: Short = new Short(values[index]);
          let result: String = value.toLocaleString("it-IT");
          expect(result).assertEqual(expectedValues[index]);
          expect(result).assertEqual(
            new Intl.NumberFormat("it-IT").format(values[index])
          );
        }
      }

      {
        let value: Short = new Short(1234 as short);
        let resultEn: String = value.toLocaleString("en-US");
        let resultDe: String = value.toLocaleString("de-DE");
        let resultZh: String = value.toLocaleString("zh-CN");
        expect(resultEn).assertEqual("1,234");
        expect(resultDe).assertEqual("1.234");
        expect(resultZh).assertEqual("1,234");
      }

      {
        let value: Short = new Short(Int.toShort(1500));
        let currencyResult: String = value.toLocaleString("en-US", { style: "currency", currency: "EUR" });
        let expectedCurrencyResult: String = new Intl.NumberFormat(
          "en-US",
          { style: "currency", currency: "EUR" }
        ).format(1500);
        expect(currencyResult).assertEqual(expectedCurrencyResult);
      }

      {
        let locale: string = "ja-JP";
        let value: Short = new Short(2000 as short);
        let currencyResult: String = value.toLocaleString(locale, { style: "currency", currency: "JPY" });
        let expectedCurrencyResult: String = new Intl.NumberFormat(
          locale,
          { style: "currency", currency: "JPY" }
        ).format(2000);
        expect(currencyResult).assertEqual(expectedCurrencyResult);
      }

      {
        let locale: string = "en-GB";
        let value: Short = new Short(3000 as short);
        let currencyResult: String = value.toLocaleString(locale, {
          style: "currency",
          currency: "GBP"
        });
        let expectedCurrencyResult: String = new Intl.NumberFormat(
          locale,
          { style: "currency", currency: "GBP" }
        ).format(3000);
        expect(currencyResult).assertEqual(expectedCurrencyResult);
      }

      {
        let value: Short = new Short(4000 as short);
        let expectedCurrencyResult: String = new Intl.NumberFormat(
          "zh-CN",
          { style: "currency", currency: "CNY" }
        ).format(4000);
        expect(value.toLocaleString("zh-CN", { style: "currency", currency: "CNY" })).assertEqual(expectedCurrencyResult);
      }

      {
        let value: Short = new Short(500 as short);
        let symbolResult: String = value.toLocaleString("en-US", {
          style: "currency",
          currency: "USD",
          currencyDisplay: "symbol"
        });
        let expectedSymbolResult: String = new Intl.NumberFormat(
          "en-US",
          { style: "currency", currency: "USD", currencyDisplay: "symbol" }
        ).format(500);
        expect(symbolResult).assertEqual(expectedSymbolResult);
      }

      {
        let value: Short = new Short(600 as short);
        let codeResult: String = value.toLocaleString("en-US", { style: "currency", currency: "USD", currencyDisplay: "code" });
        let expectedCodeResult: String = new Intl.NumberFormat(
          "en-US",
          { style: "currency", currency: "USD", currencyDisplay: "code" }
        ).format(600);
        expect(codeResult).assertEqual(expectedCodeResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOLOCALESTRING_1200
     * @tc.name testShortToLocaleString_merged12
     * @tc.desc Other: covers 10 merged test points for Short.toLocaleString, including locale handling and boundary values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToLocaleString_merged12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let locale: string = "en-US";
        let value: Short = new Short(700 as short);
        let nameResult: String = value.toLocaleString(locale, {
          style: "currency",
          currency: "USD",
          currencyDisplay: "name"
        });
        let expectedNameResult: String = new Intl.NumberFormat(
          locale,
          { style: "currency", currency: "USD", currencyDisplay: "name" }
        ).format(700);
        expect(nameResult).assertEqual(expectedNameResult);
      }

      {
        let value: Short = new Short(12345 as short);
        let sciResult: String = value.toLocaleString("en-US", { notation: "scientific" });
        let expectedSciResult: String = new Intl.NumberFormat("en-US", { notation: "scientific" }).format(12345);
        expect(sciResult).assertEqual(expectedSciResult);
      }

      {
        let locale: string = "en-US";
        let value: Short = new Short(15000 as short);
        let engResult: String = value.toLocaleString(locale, { notation: "engineering" });
        let expectedEngResult: String = new Intl.NumberFormat(
          locale,
          { notation: "engineering" }
        ).format(15000);
        expect(engResult).assertEqual(expectedEngResult);
      }

      {
        let value: Short = new Short(1234 as short);
        let result: String = value.toLocaleString(["fr-FR", "en-US"]);
        let expectedResult: String = new Intl.NumberFormat("fr-FR").format(1234);
        expect(result).assertEqual(expectedResult);
      }

      {
        let price: Short = new Short(1299 as short);
  
        let usPrice: string = price.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
        let dePrice: string = price.toLocaleString('de-DE', { style: 'currency', currency: 'EUR' });
        let cnPrice: string = price.toLocaleString('zh-CN', { style: 'currency', currency: 'CNY' });
  
        expect(usPrice.includes('$')).assertTrue();
        expect(cnPrice.includes('¥')).assertTrue();
        expect(dePrice.includes('€')).assertTrue();
  
        let ukPrice: string = price.toLocaleString('en-GB', { style: 'currency', currency: 'GBP' });
        expect(ukPrice.includes('£')).assertTrue();
        expect(usPrice).assertEqual(new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(1299));
        expect(cnPrice).assertEqual(new Intl.NumberFormat('zh-CN', { style: 'currency', currency: 'CNY' }).format(1299));
        expect(dePrice).assertEqual(new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'EUR' }).format(1299));
        expect(ukPrice).assertEqual(new Intl.NumberFormat('en-GB', { style: 'currency', currency: 'GBP' }).format(1299));
      }

      {
        let value: Short = new Short(12345 as short);
  
        let noGroupResult: String = value.toLocaleString("en-US", { useGrouping: false });
        let withGroupResult: String = value.toLocaleString("en-US", { useGrouping: true });
  
        expect(noGroupResult.includes(',')).assertFalse();
        expect(withGroupResult.includes(',')).assertTrue();
        expect(noGroupResult).assertEqual(
          new Intl.NumberFormat("en-US", { useGrouping: false }).format(12345)
        );
        expect(withGroupResult).assertEqual(
          new Intl.NumberFormat("en-US", { useGrouping: true }).format(12345)
        );
      }

      {
        let value: Short = new Short(15000 as short);
        let result: String = value.toLocaleString("en-US", {
          style: "unit",
          unit: "meter",
          notation: "compact",
          compactDisplay: "short"
        });
        let expected: String = new Intl.NumberFormat("en-US", {
          style: "unit",
          unit: "meter",
          notation: "compact",
          compactDisplay: "short"
        }).format(15000);
        expect(result).assertEqual(expected);
        expect(result.includes('m')).assertTrue();
      }

      {
        let rawValues: short[] = [
          1 as short, 10 as short, 100 as short, 1000 as short, 5000 as short,
          10000 as short, 20000 as short, 30000 as short, 32766 as short, Short.MAX_VALUE
        ];
        for (let i: int = 0; i < rawValues.length; i++) {
          let s: Short = new Short(rawValues[i]);
          let result: String = s.toLocaleString("en-US", {
            notation: "scientific",
            minimumSignificantDigits: 2
          });
          let expected: String = new Intl.NumberFormat("en-US", {
            notation: "scientific",
            minimumSignificantDigits: 2
          }).format(Short.toInt(rawValues[i]));
          expect(result).assertEqual(expected);
          expect(result.includes('E') || result.includes('e')).assertTrue();
        }
      }

      {
        let value: Short = new Short(999 as short);
        let result: String = value.toLocaleString("en-US", {
          style: "currency",
          currency: "USD",
          currencyDisplay: "narrowSymbol"
        });
        let expected: String = new Intl.NumberFormat("en-US", {
          style: "currency",
          currency: "USD",
          currencyDisplay: "narrowSymbol"
        }).format(999);
        expect(result).assertEqual(expected);
      }

      {
        let value: Short = new Short(120 as short);
        let result: String = value.toLocaleString("en-US", { style: "unit", unit: "mile", unitDisplay: "short" });
        let expected: String = new Intl.NumberFormat("en-US", { style: "unit", unit: "mile", unitDisplay: "short" }).format(120);
        expect(result).assertEqual(expected);
      }
    });

  });
}