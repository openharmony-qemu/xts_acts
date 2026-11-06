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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';

import Utils from '../utilcommon.test';

import util from '@ohos.util';

import {
  ScopeHelperBigIntValue,
  ScopeHelperBooleanValue,
  ScopeHelperConstructorPart01Test39StringTemp,
  ScopeHelperDateValue,
  ScopeHelperDoubleValue,
  ScopeHelperExpandPart02Test40TemperatureDouble,
  ScopeHelperExpandPart02Test41TemperatureLong,
  ScopeHelperExpandPart02Test48TemperatureFloat,
  ScopeHelperExpandPart02Test49TemperatureByte,
  ScopeHelperExpandPart02Test50TemperatureShort,
  ScopeHelperExpandPart02Test51TemperatureChar,
  ScopeHelperExpandPart03TestMissingTemperature,
  ScopeHelperIntValue,
  ScopeHelperLongValue,
  ScopeHelperObjectValue,
  ScopeHelperStringValue,
  ScopeHelperConstructorPart02Test17Speed,
  IntWrapT3,
  ScopeHelperConstructorPart03Test3AllTrueT3,
  ScopeHelperConstructorPart03TestMissingBigValueT3,
  ScopeHelperConstructorPart03TestMissingBoolWrapT3,
  ScopeHelperConstructorPart03TestMissingCarT3,
  ScopeHelperConstructorPart03TestMissingCharWrapT3,
  ScopeHelperConstructorPart03TestMissingDateWrapT3,
  ScopeHelperConstructorPart03TestMissingDoubleWrapT3,
  ScopeHelperConstructorPart03TestMissingHolderT3,
  ScopeHelperConstructorPart03TestMissingThrowingT3,
  ScopeHelperOverviewPart03TestMissingTemperature,
  ScopeHelperToStringPart02TestMissingVolume,
  probeScopeCtor03,
  probeScopeCtorPair03,
  ScopeComparableOverviewPart01TestMissingLongTemperature,
  ScopeComparableOverviewPart01TestMissingTemperature,
  ScopeHelperContainsPart01Test40TempDouble,
  ScopeHelperContainsPart01Test47TempLong,
  ScopeHelperContainsPart01Test57TempFloat,
  ScopeHelperContainsPart02Test48TempByte,
  ScopeHelperContainsPart02Test52TempShort,
  ScopeHelperContainsPart02Test59TempChar,
  ScopeHelperContainsPart02Test63TempBool,
  ScopeHelperContainsPart02Test71TempString,
  ScopeHelperContainsPart02Test77TempDate,
  ScopeHelperContainsPart03TestMissingLevelItem,
  ScopeHelperContainsPart03TestMissingTemperature,
  ScopeHelperByteValue,
  ScopeHelperExpandPart01TestMissingBooleanTemp,
  ScopeHelperExpandPart01TestMissingStringTemp,
  ScopeHelperExpandPart01TestMissingTemperature,
  ScopeHelperFloatValue,
  ScopeHelperExpandPart02Test42TemperatureString,
  ScopeHelperExpandPart02Test43TemperatureBigint,
  ScopeHelperExpandPart02Test44FlippedOrder,
  ScopeHelperExpandPart02Test45CompareSelf,
  ScopeHelperExpandPart02Test46TemperatureEpoch,
  ScopeHelperExpandPart02Test47TemperatureFold,
  ScopeHelperExpandPart03TestMissingAlwaysTrue,
  ScopeHelperExpandPart03TestMissingBigBalance,
  ScopeHelperExpandPart03TestMissingCode,
  ScopeHelperExpandPart03TestMissingDateWrap,
  ScopeHelperExpandPart03TestMissingDirComp,
  ScopeHelperExpandPart03TestMissingFlag,
  ScopeHelperExpandPart03TestMissingHeight,
  ScopeHelperExpandPart03TestMissingLength,
  ScopeHelperExpandPart03TestMissingListLen,
  ScopeHelperExpandPart03TestMissingMapSize,
  ScopeHelperExpandPart03TestMissingMeasure,
  ScopeHelperExpandPart03TestMissingNeverBigger,
  ScopeHelperExpandPart03TestMissingScore,
  ScopeHelperExpandPart03TestMissingThrowingComp,
  ScopeHelperExpandPart03TestMissingWeight,
  ScopeHelperExpandPart03TestMissingWord,
  ScopeHelperExpandPart04Test31BadCompare,
  ScopeHelperExpandPart04Test38GuardCompare,
  ScopeHelperExpandPart04Test59Price,
  ScopeHelperIntersectPart01Test56StrTemp,
  ScopeHelperIntersectPart01Test59LongTemp,
  ScopeHelperIntersectPart01Test62DblTemp,
  ScopeHelperIntersectPart01Test66ByteTemp,
  ScopeHelperIntersectPart01Test68ShortTemp,
  ScopeHelperIntersectPart01Test70BigTemp,
  ScopeHelperIntersectPart01Test72DateTemp,
  ScopeHelperIntersectPart01Test75RegExpTemp,
  ScopeHelperIntersectPart01Test78ErrTemp,
  ScopeHelperIntersectPart01Test80PointTemp,
  ScopeHelperIntersectPart01Test83ArrTemp,
  ScopeHelperIntersectPart01Test85MapTemp,
  ScopeHelperIntersectPart01Test88SetTemp,
  ScopeHelperIntersectPart02Test27TempInt,
  ScopeHelperIntersectPart02Test66TempBool,
  ScopeHelperIntersectPart02Test69TempChar,
  ScopeHelperIntersectPart02Test79TempPoint,
  ScopeHelperIntersectPart02Test7Endpoints,
  ScopeHelperIntersectPart02Test82TempRect,
  ScopeHelperClampPart03TestMissingDoubleWrap,
  ScopeHelperIntersectPart03TestMissingLongWrap,
  ScopeHelperIntersectPart03TestMissingStrWrap,
  ScopeHelperIntersectPart03TestMissingTemperature,
  ScopeHelperClampPart01Test59BoolTemp,
  ScopeHelperClampPart02TestMissingByteTemp,
  ScopeHelperClampPart02TestMissingCharTemp,
  ScopeHelperClampPart02TestMissingDateTemp,
  ScopeHelperClampPart02TestMissingDoubleTemp,
  ScopeHelperClampPart02TestMissingFloatTemp,
  ScopeHelperClampPart02TestMissingLongTemp,
  ScopeHelperClampPart02TestMissingStringTemp,
  ScopeHelperClampPart02TestMissingBigIntTemp,
  ScopeHelperClampPart02TestMissingBoolTemp,
  ScopeHelperClampPart02TestMissingErrWrap,
  ScopeHelperClampPart02TestMissingIntArr,
  ScopeHelperClampPart02TestMissingMapSize,
  ScopeHelperClampPart02TestMissingPoint,
  ScopeHelperClampPart02TestMissingRegexWrap,
  ScopeHelperClampPart02TestMissingSetSize,
  ScopeHelperClampPart02TestMissingShortTemp,
  ScopeHelperClampPart02TestMissingU8Wrap,
  ScopeHelperClampPart03TestMissingBigIntWrap,
  ScopeHelperClampPart03TestMissingCountTemp,
  ScopeHelperClampPart03TestMissingEqualityTemp,
  ScopeHelperClampPart03TestMissingLenWrap,
  ScopeHelperClampPart03TestMissingNullTemp,
  ScopeHelperClampPart03TestMissingShortWrap,
  ScopeHelperClampPart03TestMissingTemperature,
  ScopeHelperClampPart03TestMissingThrowOnLowerTemp,
  ScopeHelperClampPart03TestMissingThrowOnValueTemp,
  ScopeHelperClampPart03TestMissingThrowingTemp,
  Person,
  ScopeHelperCharValue,
  ScopeHelperGetLowerPart01Test4TemperatureD,
  ScopeHelperShortValue,
  ScopeHelperGetLowerPart02Test3TempChain,
  ScopeHelperGetLowerPart01Test2TemperatureB,
  ScopeHelperGetUpperPart02TestMissingArrValue,
  ScopeHelperGetUpperPart02TestMissingBigIntValue,
  ScopeHelperGetUpperPart02TestMissingBoolValue,
  ScopeHelperGetUpperPart02TestMissingCharValue,
  ScopeHelperGetUpperPart02TestMissingDateValue,
  ScopeHelperGetUpperPart02TestMissingDoubleValue,
  ScopeHelperGetUpperPart02TestMissingErrorValue,
  ScopeHelperGetUpperPart02TestMissingFloatValue,
  ScopeHelperGetUpperPart02TestMissingLongValue,
  ScopeHelperGetUpperPart02TestMissingMapValue,
  ScopeHelperGetUpperPart02TestMissingNumberValue,
  ScopeHelperGetUpperPart02TestMissingRegexValue,
  ScopeHelperGetUpperPart02TestMissingStringValue,
  ScopeHelperGetUpperPart02TestMissingTemperature,
  ScopeHelperToStringPart01TestMissingHeight,
  ScopeHelperToStringPart01TestMissingLabel,
  ScopeHelperToStringPart01TestMissingMeter,
  ScopeHelperToStringPart02TestMissingCoin,
  ScopeHelperToStringPart02TestMissingGrade,
  ScopeHelperToStringPart02TestMissingInterval,
  ScopeHelperToStringPart02TestMissingLetter,
  ScopeHelperToStringPart02TestMissingPixels,
  ScopeHelperToStringPart02TestMissingSwitch,
  ScopeHelperToStringPart02TestMissingWeight,
  ScopeHelperToStringPart02TestMissingWord,
  ScopeHelperOverviewPart01TestMissingTemperature,
  Temperature,
  ScopeHelperOverviewPart03TestMissingAllFalseTemp,
  ScopeComparableCompareToPart01TestMissingDoubleWrap,
  ScopeComparableCompareToPart01TestMissingLongWrap,
  ScopeComparableCompareToPart01TestMissingStringWrap,
  ScopeComparableCompareToPart01TestMissingTemperature,
  ScopeComparableCompareToPart02TestMissingBigBox,
  ScopeComparableCompareToPart02TestMissingByteBox,
  ScopeComparableCompareToPart02TestMissingCharBox,
  ScopeComparableCompareToPart02TestMissingIntBox,
  ScopeComparableCompareToPart02TestMissingLongBox,
  ScopeComparableCompareToPart02TestMissingMass,
  ScopeComparableCompareToPart02TestMissingTemperature,
  ScopeComparableCompareToPart02TestMissingTimestamp,
  ScopeComparableCompareToPart02TestMissingWord,
  ScopeComparableCompareToPart03TestMissingByteVal,
  ScopeComparableCompareToPart03TestMissingCharVal,
  ScopeComparableCompareToPart03TestMissingExplosive,
  ScopeComparableCompareToPart03TestMissingFlag,
  ScopeComparableCompareToPart03TestMissingFloatVal,
  ScopeComparableCompareToPart03TestMissingGhostGrade,
  ScopeComparableCompareToPart03TestMissingGrade,
  ScopeComparableCompareToPart03TestMissingMeter,
  ScopeComparableCompareToPart03TestMissingShortVal,
  ScopeComparableCompareToPart03TestMissingTimestamp,
  ScopeComparableOverviewPart02TestMissingWeight,
  ScopeComparableOverviewPart01TestMissingBooleanValue,
  ScopeComparableOverviewPart01TestMissingByteValue,
  ScopeComparableOverviewPart01TestMissingDoubleTemperature,
  ScopeComparableOverviewPart01TestMissingObjValue,
  ScopeComparableOverviewPart01TestMissingStringValue,
  ScopeComparableOverviewPart02TestMissingName,
  ScopeComparableOverviewPart02TestMissingProbe,
  ScopeComparableOverviewPart02TestMissingTemperature,
  StringDecoderConstructorPart01Test1DecoderHolder,
  useDecoder
} from '../utilcommon.test';

export default function ScopeComparableTest(): void {
  describe('ScopeComparableTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_0100
     * @tc.name testScopeCmpThrows001
     * @tc.desc Verify ScopeComparable compareTo throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let g1 = new ScopeComparableCompareToPart03TestMissingGhostGrade(undefined);
        let g2 = new ScopeComparableCompareToPart03TestMissingGhostGrade(10);
        try {
          g1.compareTo(g2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('NullPointerError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_0200
     * @tc.name testScopeCmpBigInt001
     * @tc.desc Verify ScopeComparable compareTo with BigInt bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpBigInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: ScopeComparableCompareToPart02TestMissingBigBox = new ScopeComparableCompareToPart02TestMissingBigBox(
          BigInt('18446744073709551615'),
        );
        let result: boolean = a.compareTo(BigInt(2));
        expect(result).assertTrue();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingBigBox = new ScopeComparableCompareToPart02TestMissingBigBox(
          BigInt(2),
        );
        let result: boolean = a.compareTo(BigInt('18446744073709551615'));
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_0300
     * @tc.name testScopeCmpDate001
     * @tc.desc Verify ScopeComparable compareTo with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let t1 = new ScopeComparableCompareToPart01TestMissingTemperature(-2147483648);
        let t2 = new ScopeComparableCompareToPart01TestMissingTemperature(2147483647);
        let actualB: boolean = t1.compareTo(t2);
        expect(actualB).assertFalse();

      }
      {
        let l1 = new ScopeComparableCompareToPart01TestMissingLongWrap(-9223372036854775808);
        let l2 = new ScopeComparableCompareToPart01TestMissingLongWrap(0);
        let actualB: boolean = l1.compareTo(l2);
        expect(actualB).assertFalse();

      }
      {
        let decoder = new ScopeComparableCompareToPart01TestMissingDoubleWrap(-1.7976931348623157e308);
        let decoderA = new ScopeComparableCompareToPart01TestMissingDoubleWrap(1.7976931348623157e308);
        let actualB: boolean = decoder.compareTo(decoderA);
        expect(actualB).assertFalse();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingTimestamp =
          new ScopeComparableCompareToPart02TestMissingTimestamp(1700000000000);
        let b: Date = Utils.dateFromTime(1600000000000);
        let result: boolean = a.compareTo(b);
        expect(result).assertTrue();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingTimestamp =
          new ScopeComparableCompareToPart02TestMissingTimestamp(1650000000000);
        let b: Date = Utils.dateFromTime(1650000000000);
        let result: boolean = a.compareTo(b);
        expect(result).assertTrue();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingLongBox = new ScopeComparableCompareToPart02TestMissingLongBox(
          9007199254740993,
        );
        let result: boolean = a.compareTo(100);
        expect(result).assertTrue();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingTemperature =
          new ScopeComparableCompareToPart02TestMissingTemperature(2147483647);
        let b: ScopeComparableCompareToPart02TestMissingTemperature =
          new ScopeComparableCompareToPart02TestMissingTemperature(-2147483648);
        let result: boolean = a.compareTo(b);
        expect(result).assertTrue();

      }
      {
        let a = new ScopeComparableCompareToPart03TestMissingGrade(2147483647);
        let b = new ScopeComparableCompareToPart03TestMissingGrade(-1);
        let actual: boolean = a.compareTo(b);
        expect(actual).assertTrue();

      }
      {
        let a = new ScopeComparableCompareToPart03TestMissingGrade(-2147483648);
        let b = new ScopeComparableCompareToPart03TestMissingGrade(1);
        let actual: boolean = a.compareTo(b);
        expect(actual).assertFalse();

      }
      {
        let a = new ScopeComparableOverviewPart02TestMissingWeight(9007199254740991);
        let b = new ScopeComparableOverviewPart02TestMissingWeight(9007199254740992);
        let actual: boolean = a.compareTo(b);
        expect(actual).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_0400
     * @tc.name testScopeCmpDate002
     * @tc.desc Verify ScopeComparable compareTo with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpDate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let t1 = new ScopeComparableCompareToPart03TestMissingTimestamp(Utils.dateFromTime(0));
        let t2 = new ScopeComparableCompareToPart03TestMissingTimestamp(Utils.dateFromTime(1000));
        let actual: boolean = t1.compareTo(t2);
        expect(actual).assertFalse();

      }
      {
        let self = new ScopeComparableOverviewPart01TestMissingTemperature(0);
        let min = new ScopeComparableOverviewPart01TestMissingTemperature(-2147483648);
        let actual: boolean = self.compareTo(min);
        expect(actual).assertTrue();

      }
      {
        let self = new ScopeComparableOverviewPart01TestMissingTemperature(0);
        let max = new ScopeComparableOverviewPart01TestMissingTemperature(2147483647);
        let actual: boolean = self.compareTo(max);
        expect(actual).assertFalse();

      }
      {
        let self = new ScopeComparableOverviewPart01TestMissingDoubleTemperature(Int.toLong(1));
        let inf = new ScopeComparableOverviewPart01TestMissingDoubleTemperature(9223372036854775807);
        let actual: boolean = self.compareTo(inf);
        expect(actual).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_0500
     * @tc.name testScopeCmpChar001
     * @tc.desc Verify ScopeComparable compareTo with char bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let c1 = new ScopeComparableCompareToPart03TestMissingCharVal(Int.toChar(98));
        let c2 = new ScopeComparableCompareToPart03TestMissingCharVal(Int.toChar(97));
        let actual: boolean = c1.compareTo(c2);
        expect(actual).assertTrue();

      }
      {
        let c1 = new ScopeComparableCompareToPart03TestMissingCharVal(Int.toChar(97));
        let c2 = new ScopeComparableCompareToPart03TestMissingCharVal(Int.toChar(122));
        let actual: boolean = c1.compareTo(c2);
        expect(actual).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_0600
     * @tc.name testScopeCmpStr001
     * @tc.desc Verify ScopeComparable compareTo with string bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpStr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let strOut = new ScopeComparableCompareToPart01TestMissingStringWrap('b');
        let strOutA = new ScopeComparableCompareToPart01TestMissingStringWrap('a');
        let actualB: boolean = strOut.compareTo(strOutA);
        expect(actualB).assertTrue();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingWord = new ScopeComparableCompareToPart02TestMissingWord('peach');
        let result: boolean = a.compareTo(String.fromCharCode(97));
        expect(result).assertTrue();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingWord = new ScopeComparableCompareToPart02TestMissingWord('apple');
        let result: boolean = a.compareTo(String.fromCharCode(112));
        expect(result).assertFalse();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingWord = new ScopeComparableCompareToPart02TestMissingWord('');
        let result: boolean = a.compareTo(String.fromCharCode(97));
        expect(result).assertFalse();

      }
      {
        let a: ScopeComparableOverviewPart02TestMissingName = new ScopeComparableOverviewPart02TestMissingName('Apple');
        let b: ScopeComparableOverviewPart02TestMissingName = new ScopeComparableOverviewPart02TestMissingName('apple');
        let result: boolean = a.compareTo(b);
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_0700
     * @tc.name testScopeCmpBool001
     * @tc.desc Verify ScopeComparable compareTo with boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let f = new ScopeComparableCompareToPart03TestMissingFlag(true);
        let actual: boolean = f.compareTo(true);
        expect(actual).assertTrue();

      }
      {
        let self = new ScopeComparableOverviewPart01TestMissingBooleanValue(false);
        let other = new ScopeComparableOverviewPart01TestMissingBooleanValue(true);
        let actual: boolean = self.compareTo(other);
        expect(actual).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_0800
     * @tc.name testScopeCmpFloatDouble001
     * @tc.desc Verify ScopeComparable compareTo with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpFloatDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new ScopeComparableCompareToPart01TestMissingDoubleWrap(-1.5);
        let decoderA = new ScopeComparableCompareToPart01TestMissingDoubleWrap(-1.5);
        let actualB: boolean = decoder.compareTo(decoderA);
        expect(actualB).assertTrue();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingMass = new ScopeComparableCompareToPart02TestMissingMass(
          Double.NaN,
        );
        let result: boolean = a.compareTo(Double.NaN);
        expect(result).assertFalse();

      }
      {
        let a = new ScopeComparableOverviewPart02TestMissingWeight(Number.NaN);
        let b = new ScopeComparableOverviewPart02TestMissingWeight(-Number.POSITIVE_INFINITY);
        let actual: boolean = a.compareTo(b);
        expect(actual).assertFalse();

      }
      {
        let a = new ScopeComparableOverviewPart02TestMissingWeight(5.0);
        let b = new ScopeComparableOverviewPart02TestMissingWeight(Number.NaN);
        let actual: boolean = a.compareTo(b);
        expect(actual).assertFalse();

      }
      {
        let a = new ScopeComparableOverviewPart02TestMissingWeight(5e-324);
        let b = new ScopeComparableOverviewPart02TestMissingWeight(0.0);
        let actual: boolean = a.compareTo(b);
        expect(actual).assertTrue();

      }
      {
        let f1 = new ScopeComparableCompareToPart03TestMissingFloatVal(Double.toFloat(1.5));
        let f2 = new ScopeComparableCompareToPart03TestMissingFloatVal(Double.toFloat(1.25));
        let actual: boolean = f1.compareTo(f2);
        expect(actual).assertTrue();

      }
      {
        let sum: double = 0.1 + 0.2;
        let a: ScopeComparableOverviewPart02TestMissingWeight = new ScopeComparableOverviewPart02TestMissingWeight(sum);
        let b: ScopeComparableOverviewPart02TestMissingWeight = new ScopeComparableOverviewPart02TestMissingWeight(0.3);
        let result: boolean = a.compareTo(b);
        expect(result).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_0900
     * @tc.name testScopeCmpInt001
     * @tc.desc Verify ScopeComparable compareTo with int bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let ta = new ScopeComparableCompareToPart01TestMissingTemperature(1);
        let tb = new ScopeComparableCompareToPart01TestMissingTemperature(5);
        let tc = new ScopeComparableCompareToPart01TestMissingTemperature(10);
        let actual = ta.compareTo(tb);
        let actualA = tb.compareTo(tc);
        let actualD = ta.compareTo(tc);
        expect(actual).assertFalse();
        expect(actualA).assertFalse();
        expect(actualD).assertFalse();

      }
      {
        let t1 = new ScopeComparableCompareToPart01TestMissingTemperature(9);
        let actualB: boolean = t1.compareTo(t1);
        expect(actualB).assertTrue();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingByteBox = new ScopeComparableCompareToPart02TestMissingByteBox(
          Int.toByte(100),
        );
        let result: boolean = a.compareTo(Int.toByte(-5));
        expect(result).assertTrue();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingCharBox = new ScopeComparableCompareToPart02TestMissingCharBox(
          Int.toChar(0x6d),
        );
        let result: boolean = a.compareTo(Int.toChar(97));
        expect(result).assertTrue();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingByteBox = new ScopeComparableCompareToPart02TestMissingByteBox(
          Int.toByte(-128),
        );
        let result: boolean = a.compareTo(Int.toByte(127));
        expect(result).assertFalse();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingCharBox = new ScopeComparableCompareToPart02TestMissingCharBox(
          Int.toChar(0x61),
        );
        let result: boolean = a.compareTo(Int.toChar(122));
        expect(result).assertFalse();

      }
      {
        let m = new ScopeComparableCompareToPart03TestMissingMeter(100);
        let actual: boolean = m.compareTo(50);
        expect(actual).assertTrue();

      }
      {
        let m = new ScopeComparableCompareToPart03TestMissingMeter(40);
        let actual: boolean = m.compareTo(50);
        expect(actual).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_1000
     * @tc.name testScopeCmpCustom001
     * @tc.desc Verify ScopeComparable compareTo with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpCustom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let grades: ScopeComparableCompareToPart03TestMissingGrade[] = [
          new ScopeComparableCompareToPart03TestMissingGrade(10),
          new ScopeComparableCompareToPart03TestMissingGrade(20),
          new ScopeComparableCompareToPart03TestMissingGrade(30),
        ];
        let len: int = grades.length.toInt();
        let a = new ScopeComparableCompareToPart03TestMissingGrade(len);
        let b = new ScopeComparableCompareToPart03TestMissingGrade(len);
        let actual: boolean = a.compareTo(b);
        expect(actual).assertTrue();

      }
      {
        let b1 = new ScopeComparableCompareToPart03TestMissingByteVal(Int.toByte(127));
        let b2 = new ScopeComparableCompareToPart03TestMissingByteVal(Int.toByte(-128));
        let actual: boolean = b1.compareTo(b2);
        expect(actual).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_1100
     * @tc.name testScopeCmpUnicode001
     * @tc.desc Verify ScopeComparable compareTo with Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpUnicode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let self = new ScopeComparableOverviewPart01TestMissingStringValue('你');
        let other = new ScopeComparableOverviewPart01TestMissingStringValue('z');
        let actual: boolean = self.compareTo(other);
        expect(actual).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_1200
     * @tc.name testScopeCmpBoundary001
     * @tc.desc Verify ScopeComparable compareTo with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let maxLong: long = 9223372036854775807;
        let minLong: long = -9223372036854775807 - 1;
        let a: ScopeComparableCompareToPart02TestMissingLongBox = new ScopeComparableCompareToPart02TestMissingLongBox(
          maxLong,
        );
        let result: boolean = a.compareTo(minLong);
        expect(result).assertTrue();

      }
      {
        let maxLong: long = 9223372036854775807;
        let minLong: long = -9223372036854775807 - 1;
        let a: ScopeComparableCompareToPart02TestMissingLongBox = new ScopeComparableCompareToPart02TestMissingLongBox(
          minLong,
        );
        let result: boolean = a.compareTo(maxLong);
        expect(result).assertFalse();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingWord = new ScopeComparableCompareToPart02TestMissingWord('a');
        let result: boolean = a.compareTo('');
        expect(result).assertTrue();

      }
      {
        let a = new ScopeComparableCompareToPart03TestMissingGrade(1000000);
        let b = new ScopeComparableCompareToPart03TestMissingGrade(999999);
        let actual: boolean = a.compareTo(b);
        expect(actual).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_1300
     * @tc.name testScopeCmpConsistency001
     * @tc.desc Verify ScopeComparable compareTo state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: ScopeComparableCompareToPart02TestMissingTemperature =
          new ScopeComparableCompareToPart02TestMissingTemperature(29);
        let b: ScopeComparableCompareToPart02TestMissingTemperature =
          new ScopeComparableCompareToPart02TestMissingTemperature(22);
        let result: boolean = b.compareTo(a);
        expect(result).assertFalse();
        let actual = b.getTemp();
        let expected: int = 22;
        expect(actual).assertEqual(expected);

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingLongBox = new ScopeComparableCompareToPart02TestMissingLongBox(
          123456789,
        );
        let result: boolean = a.compareTo(0);
        expect(result).assertTrue();
        let actual = a.getValue();
        let expected: int = 123456789;
        expect(actual).assertEqual(expected);

      }
      {
        let a = new ScopeComparableOverviewPart01TestMissingDoubleTemperature(Int.toLong(0));
        let b = new ScopeComparableOverviewPart01TestMissingDoubleTemperature(Int.toLong(0));
        let actual: boolean = a.compareTo(b);
        expect(actual).assertTrue();

      }
      {
        let a: ScopeComparableOverviewPart02TestMissingProbe = new ScopeComparableOverviewPart02TestMissingProbe(10);
        let b: ScopeComparableOverviewPart02TestMissingProbe = new ScopeComparableOverviewPart02TestMissingProbe(10);
        let result: boolean = a.compareTo(b);
        expect(result).assertTrue();
        let resultA: boolean = a.compareTo(b);
        expect(resultA).assertTrue();
        let actual = a.getCallCount();
        let expected: int = 2;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_1400
     * @tc.name testScopeCmpBasic001
     * @tc.desc Verify ScopeComparable compareTo with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let t1 = new ScopeComparableCompareToPart01TestMissingTemperature(0);
        let t2 = new ScopeComparableCompareToPart01TestMissingTemperature(-1);
        let actualB: boolean = t1.compareTo(t2);
        expect(actualB).assertTrue();

      }
      {
        let t1 = new ScopeComparableCompareToPart01TestMissingTemperature(0);
        let t2 = new ScopeComparableCompareToPart01TestMissingTemperature(1);
        let actualB: boolean = t1.compareTo(t2);
        expect(actualB).assertFalse();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingTemperature =
          new ScopeComparableCompareToPart02TestMissingTemperature(33);
        let b: ScopeComparableCompareToPart02TestMissingTemperature =
          new ScopeComparableCompareToPart02TestMissingTemperature(21);
        let result: boolean = a.compareTo(b);
        expect(result).assertTrue();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingTemperature =
          new ScopeComparableCompareToPart02TestMissingTemperature(17);
        let b: ScopeComparableCompareToPart02TestMissingTemperature =
          new ScopeComparableCompareToPart02TestMissingTemperature(42);
        let result: boolean = a.compareTo(b);
        expect(result).assertFalse();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingIntBox = new ScopeComparableCompareToPart02TestMissingIntBox(77);
        let result: boolean = a.compareTo(50);
        expect(result).assertTrue();

      }
      {
        let a: ScopeComparableCompareToPart02TestMissingIntBox = new ScopeComparableCompareToPart02TestMissingIntBox(50);
        let result: boolean = a.compareTo(77);
        expect(result).assertFalse();

      }
      {
        let grades: ScopeComparableCompareToPart03TestMissingGrade[] = [
          new ScopeComparableCompareToPart03TestMissingGrade(10),
          new ScopeComparableCompareToPart03TestMissingGrade(20),
          new ScopeComparableCompareToPart03TestMissingGrade(30),
        ];
        let len: int = grades.length.toInt();
        let a = new ScopeComparableCompareToPart03TestMissingGrade(len);
        let b = new ScopeComparableCompareToPart03TestMissingGrade(len + 1);
        let actual: boolean = a.compareTo(b);
        expect(actual).assertFalse();

      }
      {
        let grades: ScopeComparableCompareToPart03TestMissingGrade[] = [
          new ScopeComparableCompareToPart03TestMissingGrade(10),
          new ScopeComparableCompareToPart03TestMissingGrade(20),
          new ScopeComparableCompareToPart03TestMissingGrade(30),
        ];
        let len: int = grades.length.toInt();
        let a = new ScopeComparableCompareToPart03TestMissingGrade(0 - len - 1);
        let b = new ScopeComparableCompareToPart03TestMissingGrade(0 - len);
        let actual: boolean = a.compareTo(b);
        expect(actual).assertFalse();

      }
      {
        let list: ScopeComparableCompareToPart03TestMissingGrade[] = [
          new ScopeComparableCompareToPart03TestMissingGrade(8),
          new ScopeComparableCompareToPart03TestMissingGrade(2),
          new ScopeComparableCompareToPart03TestMissingGrade(6),
        ];
        let cmp = (
          a: ScopeComparableCompareToPart03TestMissingGrade,
          b: ScopeComparableCompareToPart03TestMissingGrade,
        ): int => {
          if (a.compareTo(b)) {
            return 1;
          }
          if (b.compareTo(a)) {
            return -1;
          }
          return 0;
        };
        list.sort(cmp);
        let actualFirst: int = list[0].getScore();
        let expectedFirst: int = 2;
        expect(actualFirst).assertEqual(expectedFirst);
        let actualSecond: int = list[1].getScore();
        let expectedSecond: int = 6;
        expect(actualSecond).assertEqual(expectedSecond);

      }
      {
        let ok = new ScopeComparableCompareToPart03TestMissingExplosive(5, false);
        let boom = new ScopeComparableCompareToPart03TestMissingExplosive(10, true);
        try {
          ok.compareTo(boom);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPECOMPARABLE_COMPARE_TO_1500
     * @tc.name testScopeCmpBasic002
     * @tc.desc Verify ScopeComparable compareTo with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCmpBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let self = new ScopeComparableOverviewPart01TestMissingTemperature(15);
        let smaller = new ScopeComparableOverviewPart01TestMissingTemperature(14);
        let actual: boolean = self.compareTo(smaller);
        expect(actual).assertTrue();

      }
      {
        let self = new ScopeComparableOverviewPart01TestMissingStringValue('abc');
        let other = new ScopeComparableOverviewPart01TestMissingStringValue('abcd');
        let actual: boolean = self.compareTo(other);
        expect(actual).assertFalse();

      }
      {
        let a = new ScopeComparableOverviewPart01TestMissingStringValue('value');
        let b = new ScopeComparableOverviewPart01TestMissingStringValue('val' + 'ue');
        let actual: boolean = a.compareTo(b);
        expect(actual).assertTrue();

      }
      {
        let self = new ScopeComparableOverviewPart01TestMissingStringValue(String.fromCharCode(53));
        let other = new ScopeComparableOverviewPart01TestMissingStringValue(String.fromCharCode(52));
        let actual: boolean = self.compareTo(other);
        expect(actual).assertTrue();

      }
      {
        let self = new ScopeComparableOverviewPart01TestMissingByteValue(5);
        let other = new ScopeComparableOverviewPart01TestMissingByteValue(6);
        let actual: boolean = self.compareTo(other);
        expect(actual).assertFalse();

      }
      {
        let a: ScopeComparableOverviewPart02TestMissingTemperature =
          new ScopeComparableOverviewPart02TestMissingTemperature(25);
        let b: ScopeComparableOverviewPart02TestMissingTemperature =
          new ScopeComparableOverviewPart02TestMissingTemperature(20);
        let result: boolean = a.compareTo(b);
        let reverse: boolean = b.compareTo(a);
        expect(result).assertTrue();
        expect(reverse).assertFalse();

      }
      {
        let a: ScopeComparableOverviewPart02TestMissingTemperature =
          new ScopeComparableOverviewPart02TestMissingTemperature(7);
        let b1: ScopeComparableOverviewPart02TestMissingTemperature =
          new ScopeComparableOverviewPart02TestMissingTemperature(3);
        let b2: ScopeComparableOverviewPart02TestMissingTemperature =
          new ScopeComparableOverviewPart02TestMissingTemperature(7);
        let b3: ScopeComparableOverviewPart02TestMissingTemperature =
          new ScopeComparableOverviewPart02TestMissingTemperature(9);
        let result: boolean = a.compareTo(b1);
        expect(result).assertTrue();
        let resultA: boolean = a.compareTo(b2);
        expect(resultA).assertTrue();
        let resultB: boolean = a.compareTo(b3);
        expect(resultB).assertFalse();

      }
    });

  });
}
