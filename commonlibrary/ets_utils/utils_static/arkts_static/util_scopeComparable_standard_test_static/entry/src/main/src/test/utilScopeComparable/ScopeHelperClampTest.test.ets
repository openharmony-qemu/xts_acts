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

export default function ScopeHelperClampTest(): void {
  describe('ScopeHelperClampTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_0100
     * @tc.name testScopeClampThrows001
     * @tc.desc Verify ScopeHelper clamp throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let err: Error = new Error('abc');
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingErrWrap> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingErrWrap>(
            new ScopeHelperClampPart02TestMissingErrWrap(new Error('ab')),
            new ScopeHelperClampPart02TestMissingErrWrap(new Error('abcde')),
          );
        let result: ScopeHelperClampPart02TestMissingErrWrap = range.clamp(
          new ScopeHelperClampPart02TestMissingErrWrap(err),
        );
        expect(result.getValue()).assertEqual(err);

      }
      {
        let upper: ScopeHelperClampPart02TestMissingErrWrap = new ScopeHelperClampPart02TestMissingErrWrap(
          new Error('abcde'),
        );
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingErrWrap> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingErrWrap>(
            new ScopeHelperClampPart02TestMissingErrWrap(new Error('ab')),
            upper,
          );
        let result: ScopeHelperClampPart02TestMissingErrWrap = range.clamp(
          new ScopeHelperClampPart02TestMissingErrWrap(new Error('abcdef')),
        );
        expect(result).assertEqual(upper);

      }
      {
        try {
          let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingThrowingTemp> =
            new util.ScopeHelper<ScopeHelperClampPart03TestMissingThrowingTemp>(
              new ScopeHelperClampPart03TestMissingThrowingTemp(30),
              new ScopeHelperClampPart03TestMissingThrowingTemp(40),
            );
          range.clamp(new ScopeHelperClampPart03TestMissingThrowingTemp(35));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingThrowOnLowerTemp> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingThrowOnLowerTemp>(
            new ScopeHelperClampPart03TestMissingThrowOnLowerTemp(30),
            new ScopeHelperClampPart03TestMissingThrowOnLowerTemp(40),
          );
        try {
          range.clamp(new ScopeHelperClampPart03TestMissingThrowOnLowerTemp(35));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_0200
     * @tc.name testScopeClampBigInt001
     * @tc.desc Verify ScopeHelper clamp with BigInt bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampBigInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingBigIntTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingBigIntTemp>(
            new ScopeHelperClampPart02TestMissingBigIntTemp(1000n),
            new ScopeHelperClampPart02TestMissingBigIntTemp(5000n),
          );
        let result: ScopeHelperClampPart02TestMissingBigIntTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingBigIntTemp(3000n),
        );
        let actual = String(result.getValue());
        let expected: string = '3000';
        expect(actual).assertEqual(expected);

      }
      {
        let lower: ScopeHelperClampPart02TestMissingBigIntTemp = new ScopeHelperClampPart02TestMissingBigIntTemp(1000n);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingBigIntTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingBigIntTemp>(
            lower,
            new ScopeHelperClampPart02TestMissingBigIntTemp(5000n),
          );
        let result: ScopeHelperClampPart02TestMissingBigIntTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingBigIntTemp(500n),
        );
        expect(result).assertEqual(lower);

      }
      {
        let upper: ScopeHelperClampPart02TestMissingBigIntTemp = new ScopeHelperClampPart02TestMissingBigIntTemp(5000n);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingBigIntTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingBigIntTemp>(
            new ScopeHelperClampPart02TestMissingBigIntTemp(1000n),
            upper,
          );
        let result: ScopeHelperClampPart02TestMissingBigIntTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingBigIntTemp(6000n),
        );
        expect(result).assertEqual(upper);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingBigIntWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingBigIntWrap>(
            new ScopeHelperClampPart03TestMissingBigIntWrap(10n),
            new ScopeHelperClampPart03TestMissingBigIntWrap(100n),
          );
        let result: ScopeHelperClampPart03TestMissingBigIntWrap = range.clamp(
          new ScopeHelperClampPart03TestMissingBigIntWrap(5n),
        );
        let actual: string = result.toString();
        let expected: string = '10';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingBigIntWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingBigIntWrap>(
            new ScopeHelperClampPart03TestMissingBigIntWrap(10n),
            new ScopeHelperClampPart03TestMissingBigIntWrap(100n),
          );
        let result: ScopeHelperClampPart03TestMissingBigIntWrap = range.clamp(
          new ScopeHelperClampPart03TestMissingBigIntWrap(1000n),
        );
        let actual: string = result.toString();
        let expected: string = '100';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingBigIntWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingBigIntWrap>(
            new ScopeHelperClampPart03TestMissingBigIntWrap(10n),
            new ScopeHelperClampPart03TestMissingBigIntWrap(100n),
          );
        let result: ScopeHelperClampPart03TestMissingBigIntWrap = range.clamp(
          new ScopeHelperClampPart03TestMissingBigIntWrap(50n),
        );
        let actual: string = result.toString();
        let expected: string = '50';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingBigIntWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingBigIntWrap>(
            new ScopeHelperClampPart03TestMissingBigIntWrap(9n),
            new ScopeHelperClampPart03TestMissingBigIntWrap(10n),
          );
        let value: ScopeHelperClampPart03TestMissingBigIntWrap = new ScopeHelperClampPart03TestMissingBigIntWrap(9n);
        let result: ScopeHelperClampPart03TestMissingBigIntWrap = range.clamp(value);
        expect(result).assertEqual(value);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_0300
     * @tc.name testScopeClampDate001
     * @tc.desc Verify ScopeHelper clamp with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(2147483647),
        );
        let actual: string = result.toString();
        let expected: string = '40';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let lowResult: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(-2147483648),
        );
        let highResult: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(2147483647),
        );
        let actual: string = lowResult.toString();
        let expected: string = '30';
        expect(actual).assertEqual(expected);
        let actualA: string = highResult.toString();
        let expectedA: string = '40';
        expect(actualA).assertEqual(expectedA);

      }
      {
        let lower: ScopeHelperClampPart02TestMissingDateTemp = new ScopeHelperClampPart02TestMissingDateTemp(
          Utils.dateFromTime(1577836800000),
        );
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDateTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDateTemp>(
            lower,
            new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1704067200000)),
          );
        let result: ScopeHelperClampPart02TestMissingDateTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1546300800000)),
        );
        expect(result).assertEqual(lower);

      }
      {
        let input: ScopeHelperClampPart02TestMissingDateTemp = new ScopeHelperClampPart02TestMissingDateTemp(
          Utils.dateFromTime(1577836800000),
        );
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDateTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDateTemp>(
            new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1577836800000)),
            new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1704067200000)),
          );
        let result: ScopeHelperClampPart02TestMissingDateTemp = range.clamp(input);
        expect(result).assertEqual(input);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDateTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDateTemp>(
            new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1580000000000)),
            new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1620000000000)),
          );
        let result: ScopeHelperClampPart02TestMissingDateTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1600000000000)),
        );
        let actual: string = result.toString();
        let expected: string = '1600000000000';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDateTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDateTemp>(
            new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1580000000000)),
            new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1620000000000)),
          );
        let result: ScopeHelperClampPart02TestMissingDateTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1600000000000)),
        );
        let actual = result.getValue().getTime();
        let expected: long = 1600000000000;
        expect(actual).assertEqual(expected);

      }
      {
        let upper: ScopeHelperClampPart02TestMissingDateTemp = new ScopeHelperClampPart02TestMissingDateTemp(
          Utils.dateFromTime(1620000000000),
        );
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDateTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDateTemp>(
            new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1580000000000)),
            upper,
          );
        let result: ScopeHelperClampPart02TestMissingDateTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1630000000000)),
        );
        let actual = result.getValue().getTime();
        let expected: long = 1620000000000;
        expect(actual).assertEqual(expected);

      }
      {
        let input: ScopeHelperClampPart02TestMissingDateTemp = new ScopeHelperClampPart02TestMissingDateTemp(
          Utils.dateFromTime(1600000000000),
        );
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDateTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDateTemp>(
            new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1580000000000)),
            new ScopeHelperClampPart02TestMissingDateTemp(Utils.dateFromTime(1620000000000)),
          );
        let result: ScopeHelperClampPart02TestMissingDateTemp = range.clamp(input);
        expect(result).assertEqual(input);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_0400
     * @tc.name testScopeClampChar001
     * @tc.desc Verify ScopeHelper clamp with char bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingCharTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingCharTemp>(
            new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(97)),
            new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(122)),
          );
        let result: ScopeHelperClampPart02TestMissingCharTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(65)),
        );
        let actual: string = result.toString();
        let expected: string = 'a';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingCharTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingCharTemp>(
            new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(97)),
            new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(122)),
          );
        let result: ScopeHelperClampPart02TestMissingCharTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(123)),
        );
        let actual: string = result.toString();
        let expected: string = 'z';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingCharTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingCharTemp>(
            new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(97)),
            new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(122)),
          );
        let result: ScopeHelperClampPart02TestMissingCharTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(109)),
        );
        let actual: string = result.toString();
        let expected: string = 'm';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingStringTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingStringTemp>(
            new ScopeHelperClampPart02TestMissingStringTemp('b'),
            new ScopeHelperClampPart02TestMissingStringTemp('m'),
          );
        let result: ScopeHelperClampPart02TestMissingStringTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingStringTemp('j'),
        );
        let actual: string = result.toString();
        let expected: string = 'j';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingCharTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingCharTemp>(
            new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(97)),
            new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(122)),
          );
        let result: ScopeHelperClampPart02TestMissingCharTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(115)),
        );
        let actual = result.getVal();
        expect(actual).assertEqual(Int.toChar(115));

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingCharTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingCharTemp>(
            new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(97)),
            new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(122)),
          );
        let result: ScopeHelperClampPart02TestMissingCharTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingCharTemp(Int.toChar(90)),
        );
        let actual = result.getVal();
        expect(actual).assertEqual(Int.toChar(97));

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_0500
     * @tc.name testScopeClampStr001
     * @tc.desc Verify ScopeHelper clamp with string bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampStr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingStringTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingStringTemp>(
            new ScopeHelperClampPart02TestMissingStringTemp('b'),
            new ScopeHelperClampPart02TestMissingStringTemp('m'),
          );
        let result: ScopeHelperClampPart02TestMissingStringTemp = range.clamp(new ScopeHelperClampPart02TestMissingStringTemp('a'));
        let actual: string = result.toString();
        let expected: string = 'b';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingStringTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingStringTemp>(
            new ScopeHelperClampPart02TestMissingStringTemp('b'),
            new ScopeHelperClampPart02TestMissingStringTemp('m'),
          );
        let result: ScopeHelperClampPart02TestMissingStringTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingStringTemp('j'),
        );
        let actual = result.getValue();
        let expected: string = 'j';
        expect(actual).assertEqual(expected);

      }
      {
        let input: ScopeHelperClampPart02TestMissingStringTemp = new ScopeHelperClampPart02TestMissingStringTemp('j');
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingStringTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingStringTemp>(
            new ScopeHelperClampPart02TestMissingStringTemp('b'),
            new ScopeHelperClampPart02TestMissingStringTemp('m'),
          );
        let result: ScopeHelperClampPart02TestMissingStringTemp = range.clamp(input);
        expect(result).assertEqual(input);

      }
      {
        let lower: ScopeHelperIntersectPart03TestMissingStrWrap = new ScopeHelperIntersectPart03TestMissingStrWrap('a');
        let range: util.ScopeHelper<ScopeHelperIntersectPart03TestMissingStrWrap> =
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingStrWrap>(
            lower,
            new ScopeHelperIntersectPart03TestMissingStrWrap('z'),
          );
        let result: ScopeHelperIntersectPart03TestMissingStrWrap = range.clamp(
          new ScopeHelperIntersectPart03TestMissingStrWrap('0'),
        );
        expect(result).assertEqual(lower);

      }
      {
        let range: util.ScopeHelper<ScopeHelperIntersectPart03TestMissingStrWrap> =
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingStrWrap>(
            new ScopeHelperIntersectPart03TestMissingStrWrap('x'),
            new ScopeHelperIntersectPart03TestMissingStrWrap('y'),
          );
        let value: ScopeHelperIntersectPart03TestMissingStrWrap = new ScopeHelperIntersectPart03TestMissingStrWrap('x');
        let result: ScopeHelperIntersectPart03TestMissingStrWrap = range.clamp(value);
        expect(result).assertEqual(value);

      }
      {
        let upper: ScopeHelperIntersectPart03TestMissingStrWrap = new ScopeHelperIntersectPart03TestMissingStrWrap('b');
        let range: util.ScopeHelper<ScopeHelperIntersectPart03TestMissingStrWrap> =
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingStrWrap>(
            new ScopeHelperIntersectPart03TestMissingStrWrap('a'),
            upper,
          );
        let result: ScopeHelperIntersectPart03TestMissingStrWrap = range.clamp(
          new ScopeHelperIntersectPart03TestMissingStrWrap('c'),
        );
        expect(result).assertEqual(upper);

      }
      {
        let lower: ScopeHelperIntersectPart03TestMissingStrWrap = new ScopeHelperIntersectPart03TestMissingStrWrap('b');
        let range: util.ScopeHelper<ScopeHelperIntersectPart03TestMissingStrWrap> =
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingStrWrap>(
            lower,
            new ScopeHelperIntersectPart03TestMissingStrWrap('c'),
          );
        let result: ScopeHelperIntersectPart03TestMissingStrWrap = range.clamp(
          new ScopeHelperIntersectPart03TestMissingStrWrap('a'),
        );
        expect(result).assertEqual(lower);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_0600
     * @tc.name testScopeClampFloatDouble001
     * @tc.desc Verify ScopeHelper clamp with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampFloatDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp>(
            new ScopeHelperClampPart02TestMissingDoubleTemp(0.0),
            new ScopeHelperClampPart02TestMissingDoubleTemp(10.0),
          );
        let result: ScopeHelperClampPart02TestMissingDoubleTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingDoubleTemp(-5.0),
        );
        let actual: string = result.toString();
        let expected: string = '0';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp>(
            new ScopeHelperClampPart02TestMissingDoubleTemp(0.0),
            new ScopeHelperClampPart02TestMissingDoubleTemp(10.0),
          );
        let result: ScopeHelperClampPart02TestMissingDoubleTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingDoubleTemp(50.0),
        );
        let actual: string = result.toString();
        let expected: string = '10';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp>(
            new ScopeHelperClampPart02TestMissingDoubleTemp(0.0),
            new ScopeHelperClampPart02TestMissingDoubleTemp(10.0),
          );
        let result: ScopeHelperClampPart02TestMissingDoubleTemp = range.clamp(new ScopeHelperClampPart02TestMissingDoubleTemp(4.5));
        let actual: string = result.toString();
        let expected: string = '4.5';
        expect(actual).assertEqual(expected);

      }
      {
        let lower: ScopeHelperClampPart02TestMissingDoubleTemp = new ScopeHelperClampPart02TestMissingDoubleTemp(0.0);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp>(
            lower,
            new ScopeHelperClampPart02TestMissingDoubleTemp(10.0),
          );
        let result: ScopeHelperClampPart02TestMissingDoubleTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingDoubleTemp(Number.NaN),
        );
        expect(result).assertEqual(lower);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingFloatTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingFloatTemp>(
            new ScopeHelperClampPart02TestMissingFloatTemp(5.0),
            new ScopeHelperClampPart02TestMissingFloatTemp(15.0),
          );
        let result: ScopeHelperClampPart02TestMissingFloatTemp = range.clamp(new ScopeHelperClampPart02TestMissingFloatTemp(9.5));
        let actual: string = result.toString();
        let expected: string = '9.5';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingFloatTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingFloatTemp>(
            new ScopeHelperClampPart02TestMissingFloatTemp(5.0),
            new ScopeHelperClampPart02TestMissingFloatTemp(15.0),
          );
        let result: ScopeHelperClampPart02TestMissingFloatTemp = range.clamp(new ScopeHelperClampPart02TestMissingFloatTemp(15.0));
        let actual: string = result.toString();
        let expected: string = '15';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingFloatTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingFloatTemp>(
            new ScopeHelperClampPart02TestMissingFloatTemp(5.0),
            new ScopeHelperClampPart02TestMissingFloatTemp(15.0),
          );
        let result: ScopeHelperClampPart02TestMissingFloatTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingFloatTemp(-1.0 as float),
        );
        let actual: string = result.toString();
        let expected: string = '5';
        expect(actual).assertEqual(expected);

      }
      {
        let upper: ScopeHelperClampPart02TestMissingDoubleTemp = new ScopeHelperClampPart02TestMissingDoubleTemp(10.0);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp>(
            new ScopeHelperClampPart02TestMissingDoubleTemp(0.0),
            upper,
          );
        let result: ScopeHelperClampPart02TestMissingDoubleTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingDoubleTemp(100.0),
        );
        expect(result).assertEqual(upper);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp>(
            new ScopeHelperClampPart02TestMissingDoubleTemp(0.0),
            new ScopeHelperClampPart02TestMissingDoubleTemp(10.0),
          );
        let result: ScopeHelperClampPart02TestMissingDoubleTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingDoubleTemp(5.5),
        );
        let actual = result.getVal();
        let expected = 5.5;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp>(
            new ScopeHelperClampPart02TestMissingDoubleTemp(0.0),
            new ScopeHelperClampPart02TestMissingDoubleTemp(10.0),
          );
        let result: ScopeHelperClampPart02TestMissingDoubleTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingDoubleTemp(-1.5),
        );
        let actual = result.getVal();
        let expected = 0.0;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_0700
     * @tc.name testScopeClampFloatDouble002
     * @tc.desc Verify ScopeHelper clamp with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampFloatDouble002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingDoubleTemp>(
            new ScopeHelperClampPart02TestMissingDoubleTemp(0.0),
            new ScopeHelperClampPart02TestMissingDoubleTemp(10.0),
          );
        let result: ScopeHelperClampPart02TestMissingDoubleTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingDoubleTemp(88.8),
        );
        let actual = result.getVal();
        let expected = 10.0;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingFloatTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingFloatTemp>(
            new ScopeHelperClampPart02TestMissingFloatTemp(5.0),
            new ScopeHelperClampPart02TestMissingFloatTemp(15.0),
          );
        let result: ScopeHelperClampPart02TestMissingFloatTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingFloatTemp(123.4 as float),
        );
        let actual: string = result.toString();
        let expected: string = '15';
        expect(actual).assertEqual(expected);

      }
      {
        let lower: ScopeHelperClampPart03TestMissingDoubleWrap = new ScopeHelperClampPart03TestMissingDoubleWrap(5.5);
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap>(
            lower,
            new ScopeHelperClampPart03TestMissingDoubleWrap(10.5),
          );
        let result: ScopeHelperClampPart03TestMissingDoubleWrap = range.clamp(
          new ScopeHelperClampPart03TestMissingDoubleWrap(4.0),
        );
        expect(result).assertEqual(lower);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_0800
     * @tc.name testScopeClampLong001
     * @tc.desc Verify ScopeHelper clamp with long bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampLong001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingLongTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingLongTemp>(
            new ScopeHelperClampPart02TestMissingLongTemp(100),
            new ScopeHelperClampPart02TestMissingLongTemp(1000),
          );
        let result: ScopeHelperClampPart02TestMissingLongTemp = range.clamp(new ScopeHelperClampPart02TestMissingLongTemp(99));
        let actual: string = result.toString();
        let expected: string = '100';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingLongTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingLongTemp>(
            new ScopeHelperClampPart02TestMissingLongTemp(100),
            new ScopeHelperClampPart02TestMissingLongTemp(1000),
          );
        let result: ScopeHelperClampPart02TestMissingLongTemp = range.clamp(new ScopeHelperClampPart02TestMissingLongTemp(1001));
        let actual: string = result.toString();
        let expected: string = '1000';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingLongTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingLongTemp>(
            new ScopeHelperClampPart02TestMissingLongTemp(100),
            new ScopeHelperClampPart02TestMissingLongTemp(1000),
          );
        let result: ScopeHelperClampPart02TestMissingLongTemp = range.clamp(new ScopeHelperClampPart02TestMissingLongTemp(500));
        let actual: string = result.toString();
        let expected: string = '500';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingLongTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingLongTemp>(
            new ScopeHelperClampPart02TestMissingLongTemp(100),
            new ScopeHelperClampPart02TestMissingLongTemp(1000),
          );
        let result: ScopeHelperClampPart02TestMissingLongTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingLongTemp(777),
        );
        let actual = result.getVal();
        let expected = 777 as long;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingLongTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingLongTemp>(
            new ScopeHelperClampPart02TestMissingLongTemp(100),
            new ScopeHelperClampPart02TestMissingLongTemp(1000),
          );
        let result: ScopeHelperClampPart02TestMissingLongTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingLongTemp(2000),
        );
        let actual = result.getVal();
        let expected = 1000 as long;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap> =
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap>(
            new ScopeHelperIntersectPart03TestMissingLongWrap(5),
            new ScopeHelperIntersectPart03TestMissingLongWrap(6),
          );
        let value: ScopeHelperIntersectPart03TestMissingLongWrap = new ScopeHelperIntersectPart03TestMissingLongWrap(5);
        let result: ScopeHelperIntersectPart03TestMissingLongWrap = range.clamp(value);
        expect(result).assertEqual(value);

      }
      {
        let range: util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap> =
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap>(
            new ScopeHelperIntersectPart03TestMissingLongWrap(6),
            new ScopeHelperIntersectPart03TestMissingLongWrap(7),
          );
        let result: ScopeHelperIntersectPart03TestMissingLongWrap = range.clamp(
          new ScopeHelperIntersectPart03TestMissingLongWrap(8),
        );
        let actual = result.getVal();
        let expected: int = 7;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap> =
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap>(
            new ScopeHelperIntersectPart03TestMissingLongWrap(7),
            new ScopeHelperIntersectPart03TestMissingLongWrap(8),
          );
        let result: ScopeHelperIntersectPart03TestMissingLongWrap = range.clamp(
          new ScopeHelperIntersectPart03TestMissingLongWrap(6),
        );
        let actual = result.getVal();
        let expected: int = 7;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_0900
     * @tc.name testScopeClampInt001
     * @tc.desc Verify ScopeHelper clamp with int bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(new ScopeHelperExpandPart03TestMissingTemperature(41));
        let actual: string = result.toString();
        let expected: string = '40';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_1000
     * @tc.name testScopeClampCustom001
     * @tc.desc Verify ScopeHelper clamp with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampCustom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(new ScopeHelperExpandPart03TestMissingTemperature(35));
        let actual: string = result.toString();
        let expected: string = '35';
        expect(actual).assertEqual(expected);

      }
      {
        let arr: int[] = [1, 2, 3];
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingIntArr> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingIntArr>(
            new ScopeHelperClampPart02TestMissingIntArr([1, 2]),
            new ScopeHelperClampPart02TestMissingIntArr([1, 2, 3, 4]),
          );
        let result: ScopeHelperClampPart02TestMissingIntArr = range.clamp(
          new ScopeHelperClampPart02TestMissingIntArr(arr),
        );
        let actual: int = result.getArr().length;
        let expected: int = 3;
        expect(actual).assertEqual(expected);

      }
      {
        let m: Map<string, int> = new Map<string, int>();
        m.set('a', 1);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingMapSize> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingMapSize>(
            new ScopeHelperClampPart02TestMissingMapSize(new Map<string, int>()),
            new ScopeHelperClampPart02TestMissingMapSize(m),
          );
        let result: ScopeHelperClampPart02TestMissingMapSize = range.clamp(
          new ScopeHelperClampPart02TestMissingMapSize(m),
        );
        let actual = result.getValue().size;
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingSetSize> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingSetSize>(
            new ScopeHelperClampPart02TestMissingSetSize(new Set<int>()),
            new ScopeHelperClampPart02TestMissingSetSize(s),
          );
        let result: ScopeHelperClampPart02TestMissingSetSize = range.clamp(
          new ScopeHelperClampPart02TestMissingSetSize(s),
        );
        let actual = result.getValue().size;
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        let u: Uint8Array = new Uint8Array([1, 2, 3]);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingU8Wrap> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingU8Wrap>(
            new ScopeHelperClampPart02TestMissingU8Wrap(new Uint8Array([1])),
            new ScopeHelperClampPart02TestMissingU8Wrap(new Uint8Array([1, 2, 3, 4, 5])),
          );
        let result: ScopeHelperClampPart02TestMissingU8Wrap = range.clamp(new ScopeHelperClampPart02TestMissingU8Wrap(u));
        let actual: int = result.getValue().byteLength;
        let expected: int = 3;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingShortTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingShortTemp>(
            new ScopeHelperClampPart02TestMissingShortTemp(100),
            new ScopeHelperClampPart02TestMissingShortTemp(30000),
          );
        let result: ScopeHelperClampPart02TestMissingShortTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingShortTemp(250),
        );
        let actual: string = result.toString();
        let expected: string = '250';
        expect(actual).assertEqual(expected);

      }
      {
        let lower: ScopeHelperClampPart02TestMissingShortTemp = new ScopeHelperClampPart02TestMissingShortTemp(100);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingShortTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingShortTemp>(
            lower,
            new ScopeHelperClampPart02TestMissingShortTemp(30000),
          );
        let result: ScopeHelperClampPart02TestMissingShortTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingShortTemp(-32768),
        );
        expect(result).assertEqual(lower);

      }
      {
        let upper: ScopeHelperClampPart02TestMissingShortTemp = new ScopeHelperClampPart02TestMissingShortTemp(30000);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingShortTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingShortTemp>(
            new ScopeHelperClampPart02TestMissingShortTemp(100),
            upper,
          );
        let result: ScopeHelperClampPart02TestMissingShortTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingShortTemp(32767),
        );
        expect(result).assertEqual(upper);

      }
      {
        let input: ScopeHelperClampPart02TestMissingPoint = new ScopeHelperClampPart02TestMissingPoint(30);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingPoint> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingPoint>(
            new ScopeHelperClampPart02TestMissingPoint(10),
            new ScopeHelperClampPart02TestMissingPoint(50),
          );
        let result: ScopeHelperClampPart02TestMissingPoint = range.clamp(input);
        expect(result).assertEqual(input);

      }
      {
        let lower: ScopeHelperClampPart02TestMissingPoint = new ScopeHelperClampPart02TestMissingPoint(10);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingPoint> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingPoint>(
            lower,
            new ScopeHelperClampPart02TestMissingPoint(50),
          );
        let result: ScopeHelperClampPart02TestMissingPoint = range.clamp(new ScopeHelperClampPart02TestMissingPoint(5));
        expect(result).assertEqual(lower);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_1100
     * @tc.name testScopeClampCustom002
     * @tc.desc Verify ScopeHelper clamp with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampCustom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let upper: ScopeHelperClampPart02TestMissingPoint = new ScopeHelperClampPart02TestMissingPoint(50);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingPoint> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingPoint>(
            new ScopeHelperClampPart02TestMissingPoint(10),
            upper,
          );
        let result: ScopeHelperClampPart02TestMissingPoint = range.clamp(new ScopeHelperClampPart02TestMissingPoint(90));
        expect(result).assertEqual(upper);

      }
      {
        let lower: ScopeHelperClampPart02TestMissingIntArr = new ScopeHelperClampPart02TestMissingIntArr([1, 2]);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingIntArr> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingIntArr>(
            lower,
            new ScopeHelperClampPart02TestMissingIntArr([1, 2, 3, 4]),
          );
        let result: ScopeHelperClampPart02TestMissingIntArr = range.clamp(
          new ScopeHelperClampPart02TestMissingIntArr([1]),
        );
        expect(result).assertEqual(lower);

      }
      {
        let upper: ScopeHelperClampPart02TestMissingIntArr = new ScopeHelperClampPart02TestMissingIntArr([1, 2, 3, 4]);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingIntArr> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingIntArr>(
            new ScopeHelperClampPart02TestMissingIntArr([1, 2]),
            upper,
          );
        let result: ScopeHelperClampPart02TestMissingIntArr = range.clamp(
          new ScopeHelperClampPart02TestMissingIntArr([1, 2, 3, 4, 5]),
        );
        expect(result).assertEqual(upper);

      }
      {
        let m2: Map<string, int> = new Map<string, int>();
        m2.set('a', 1);
        m2.set('b', 2);
        let upper: ScopeHelperClampPart02TestMissingMapSize = new ScopeHelperClampPart02TestMissingMapSize(m2);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingMapSize> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingMapSize>(
            new ScopeHelperClampPart02TestMissingMapSize(new Map<string, int>()),
            upper,
          );
        let m3: Map<string, int> = new Map<string, int>();
        m3.set('a', 1);
        m3.set('b', 2);
        m3.set('c', 3);
        let result: ScopeHelperClampPart02TestMissingMapSize = range.clamp(
          new ScopeHelperClampPart02TestMissingMapSize(m3),
        );
        expect(result).assertEqual(upper);

      }
      {
        let upper: ScopeHelperClampPart02TestMissingU8Wrap = new ScopeHelperClampPart02TestMissingU8Wrap(
          new Uint8Array([1, 2, 3, 4, 5]),
        );
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingU8Wrap> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingU8Wrap>(
            new ScopeHelperClampPart02TestMissingU8Wrap(new Uint8Array(0)),
            upper,
          );
        let result: ScopeHelperClampPart02TestMissingU8Wrap = range.clamp(
          new ScopeHelperClampPart02TestMissingU8Wrap(new Uint8Array([1, 2, 3, 4, 5, 6])),
        );
        expect(result).assertEqual(upper);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingRegexWrap> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingRegexWrap>(
            new ScopeHelperClampPart02TestMissingRegexWrap(new RegExp('ab')),
            new ScopeHelperClampPart02TestMissingRegexWrap(new RegExp('abcde')),
          );
        let result: ScopeHelperClampPart02TestMissingRegexWrap = range.clamp(
          new ScopeHelperClampPart02TestMissingRegexWrap(new RegExp('abc')),
        );
        let actual: string = result.toString();
        let expected: string = 'abc';
        expect(actual).assertEqual(expected);

      }
      {
        let lower: ScopeHelperClampPart02TestMissingRegexWrap = new ScopeHelperClampPart02TestMissingRegexWrap(
          new RegExp('ab'),
        );
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingRegexWrap> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingRegexWrap>(
            lower,
            new ScopeHelperClampPart02TestMissingRegexWrap(new RegExp('abcde')),
          );
        let result: ScopeHelperClampPart02TestMissingRegexWrap = range.clamp(
          new ScopeHelperClampPart02TestMissingRegexWrap(new RegExp('a')),
        );
        expect(result).assertEqual(lower);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_1200
     * @tc.name testScopeClampControl001
     * @tc.desc Verify ScopeHelper clamp with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let nullLower: ScopeHelperClampPart03TestMissingNullTemp = new ScopeHelperClampPart03TestMissingNullTemp(null);
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingNullTemp> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingNullTemp>(
            nullLower,
            new ScopeHelperClampPart03TestMissingNullTemp(null),
          );
        let result: ScopeHelperClampPart03TestMissingNullTemp = range.clamp(
          new ScopeHelperClampPart03TestMissingNullTemp(35),
        );
        expect(result).assertEqual(nullLower);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_1300
     * @tc.name testScopeClampBoundary001
     * @tc.desc Verify ScopeHelper clamp with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let input: ScopeHelperClampPart02TestMissingBigIntTemp =
          new ScopeHelperClampPart02TestMissingBigIntTemp(3000n);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingBigIntTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingBigIntTemp>(
            new ScopeHelperClampPart02TestMissingBigIntTemp(1000n),
            new ScopeHelperClampPart02TestMissingBigIntTemp(5000n),
          );
        let result: ScopeHelperClampPart02TestMissingBigIntTemp = range.clamp(input);
        expect(result).assertEqual(input);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_1400
     * @tc.name testScopeClampConsistency001
     * @tc.desc Verify ScopeHelper clamp state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(new ScopeHelperExpandPart03TestMissingTemperature(30));
        let actual: string = result.toString();
        let expected: string = '30';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let actualC: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(37),
        );
        let actualD: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(37),
        );
        let actualB: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(37),
        );
        let actual = actualC.getTemp();
        let expected: int = 37;
        expect(actual).assertEqual(expected);
        let actualA = actualD.getTemp();
        let expectedA: int = 37;
        expect(actualA).assertEqual(expectedA);
        let actualE: number = actualB.getTemp();
        let expectedB: int = 37;
        expect(actualE).assertEqual(expectedB);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap>(
            new ScopeHelperClampPart03TestMissingDoubleWrap(-10),
            new ScopeHelperClampPart03TestMissingDoubleWrap(Number.POSITIVE_INFINITY),
          );
        let value: ScopeHelperClampPart03TestMissingDoubleWrap = new ScopeHelperClampPart03TestMissingDoubleWrap(1000);
        let result: ScopeHelperClampPart03TestMissingDoubleWrap = range.clamp(value);
        expect(result).assertEqual(value);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingEqualityTemp> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingEqualityTemp>(
            new ScopeHelperClampPart03TestMissingEqualityTemp(30),
            new ScopeHelperClampPart03TestMissingEqualityTemp(40),
          );
        let result: ScopeHelperClampPart03TestMissingEqualityTemp = range.clamp(
          new ScopeHelperClampPart03TestMissingEqualityTemp(35),
        );
        let actual = result.getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_1500
     * @tc.name testScopeClampBasic001
     * @tc.desc Verify ScopeHelper clamp with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(new ScopeHelperExpandPart03TestMissingTemperature(20));
        let actual: string = result.toString();
        let expected: string = '30';
        expect(actual).assertEqual(expected);

      }
      {
        let lower: ScopeHelperExpandPart03TestMissingTemperature = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            lower,
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(12),
        );
        expect(result).assertEqual(lower);

      }
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(31),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(25),
        );
        let actual: string = result.toString();
        let expected: string = '30';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(31),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
        );
        let actual: string = result.toString();
        let expected: string = '31';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(-10),
            new ScopeHelperExpandPart03TestMissingTemperature(-1),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(-5),
        );
        let actual: string = result.toString();
        let expected: string = '-5';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(-10),
            new ScopeHelperExpandPart03TestMissingTemperature(-1),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(-20),
        );
        let actual: string = result.toString();
        let expected: string = '-10';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(-10),
            new ScopeHelperExpandPart03TestMissingTemperature(-1),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(new ScopeHelperExpandPart03TestMissingTemperature(5));
        let actual: string = result.toString();
        let expected: string = '-1';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingByteTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingByteTemp>(
            new ScopeHelperClampPart02TestMissingByteTemp(10),
            new ScopeHelperClampPart02TestMissingByteTemp(100),
          );
        let result: ScopeHelperClampPart02TestMissingByteTemp = range.clamp(new ScopeHelperClampPart02TestMissingByteTemp(-100));
        let actual: string = result.toString();
        let expected: string = '10';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingByteTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingByteTemp>(
            new ScopeHelperClampPart02TestMissingByteTemp(10),
            new ScopeHelperClampPart02TestMissingByteTemp(100),
          );
        let result: ScopeHelperClampPart02TestMissingByteTemp = range.clamp(new ScopeHelperClampPart02TestMissingByteTemp(127));
        let actual: string = result.toString();
        let expected: string = '100';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingByteTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingByteTemp>(
            new ScopeHelperClampPart02TestMissingByteTemp(10),
            new ScopeHelperClampPart02TestMissingByteTemp(100),
          );
        let result: ScopeHelperClampPart02TestMissingByteTemp = range.clamp(new ScopeHelperClampPart02TestMissingByteTemp(55));
        let actual: string = result.toString();
        let expected: string = '55';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_1600
     * @tc.name testScopeClampBasic002
     * @tc.desc Verify ScopeHelper clamp with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperClampPart01Test59BoolTemp> =
          new util.ScopeHelper<ScopeHelperClampPart01Test59BoolTemp>(
            new ScopeHelperClampPart01Test59BoolTemp(false),
            new ScopeHelperClampPart01Test59BoolTemp(true),
          );
        let result: ScopeHelperClampPart01Test59BoolTemp = range.clamp(new ScopeHelperClampPart01Test59BoolTemp(false));
        let actual = result.getValue();
        expect(actual).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart01Test59BoolTemp> =
          new util.ScopeHelper<ScopeHelperClampPart01Test59BoolTemp>(
            new ScopeHelperClampPart01Test59BoolTemp(false),
            new ScopeHelperClampPart01Test59BoolTemp(true),
          );
        let result: ScopeHelperClampPart01Test59BoolTemp = range.clamp(new ScopeHelperClampPart01Test59BoolTemp(true));
        let actual = result.getValue();
        expect(actual).assertTrue();

      }
      {
        let input: ScopeHelperExpandPart03TestMissingTemperature =
          new ScopeHelperExpandPart03TestMissingTemperature(38);
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(input);
        expect(result).assertEqual(input);

      }
      {
        let lower: ScopeHelperClampPart02TestMissingLongTemp = new ScopeHelperClampPart02TestMissingLongTemp(100);
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingLongTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingLongTemp>(
            lower,
            new ScopeHelperClampPart02TestMissingLongTemp(1000),
          );
        let result: ScopeHelperClampPart02TestMissingLongTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingLongTemp(77),
        );
        expect(result).assertEqual(lower);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart02TestMissingByteTemp> =
          new util.ScopeHelper<ScopeHelperClampPart02TestMissingByteTemp>(
            new ScopeHelperClampPart02TestMissingByteTemp(10),
            new ScopeHelperClampPart02TestMissingByteTemp(100),
          );
        let result: ScopeHelperClampPart02TestMissingByteTemp = range.clamp(
          new ScopeHelperClampPart02TestMissingByteTemp(-128),
        );
        let actual: string = result.toString();
        let expected: string = '10';
        expect(actual).assertEqual(expected);

      }
      {
        let lower: ScopeHelperExpandPart03TestMissingTemperature = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            lower,
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(8),
        );
        let actual = result.getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);
        expect(result).assertEqual(lower);

      }
      {
        let upper: ScopeHelperExpandPart03TestMissingTemperature = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            upper,
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(45),
        );
        let actual = result.getTemp();
        let expected: int = 40;
        expect(actual).assertEqual(expected);
        expect(result).assertEqual(upper);

      }
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let first: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(15),
        );
        let second: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(first);
        let actual = second.getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let first: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(50),
        );
        let second: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(first);
        let actual = second.getTemp();
        let expected: int = 40;
        expect(actual).assertEqual(expected);

      }
      {
        let lower: ScopeHelperExpandPart03TestMissingTemperature = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            lower,
            new ScopeHelperExpandPart03TestMissingTemperature(40),
          );
        let first: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(3),
        );
        let second: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(first);
        expect(second).assertEqual(lower);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_1700
     * @tc.name testScopeClampBasic003
     * @tc.desc Verify ScopeHelper clamp with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(30),
            new ScopeHelperExpandPart03TestMissingTemperature(31),
          );
        let result: ScopeHelperExpandPart03TestMissingTemperature = range.clamp(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
        );
        let actual = result.getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingShortWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingShortWrap>(
            new ScopeHelperClampPart03TestMissingShortWrap(10),
            new ScopeHelperClampPart03TestMissingShortWrap(1000),
          );
        let result: ScopeHelperClampPart03TestMissingShortWrap = range.clamp(
          new ScopeHelperClampPart03TestMissingShortWrap(1001),
        );
        let actual: string = result.toString();
        let expected: string = '1000';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingShortWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingShortWrap>(
            new ScopeHelperClampPart03TestMissingShortWrap(10),
            new ScopeHelperClampPart03TestMissingShortWrap(1000),
          );
        let result: ScopeHelperClampPart03TestMissingShortWrap = range.clamp(
          new ScopeHelperClampPart03TestMissingShortWrap(500),
        );
        let actual: string = result.toString();
        let expected: string = '500';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingShortWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingShortWrap>(
            new ScopeHelperClampPart03TestMissingShortWrap(10),
            new ScopeHelperClampPart03TestMissingShortWrap(1000),
          );
        let result: ScopeHelperClampPart03TestMissingShortWrap = range.clamp(
          new ScopeHelperClampPart03TestMissingShortWrap(10),
        );
        let actual: string = result.toString();
        let expected: string = '10';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingShortWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingShortWrap>(
            new ScopeHelperClampPart03TestMissingShortWrap(10),
            new ScopeHelperClampPart03TestMissingShortWrap(1000),
          );
        let result: ScopeHelperClampPart03TestMissingShortWrap = range.clamp(
          new ScopeHelperClampPart03TestMissingShortWrap(-1),
        );
        let actual: string = result.toString();
        let expected: string = '10';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingTemperature>(
            new ScopeHelperClampPart03TestMissingTemperature(30),
            new ScopeHelperClampPart03TestMissingTemperature(40),
          );
        let result: ScopeHelperClampPart03TestMissingTemperature = range.clamp(
          new ScopeHelperClampPart03TestMissingTemperature(35),
        );
        let actual = result.getTemp();
        let expected: int = 35;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingTemperature>(
            new ScopeHelperClampPart03TestMissingTemperature(30),
            new ScopeHelperClampPart03TestMissingTemperature(40),
          );
        let result: ScopeHelperClampPart03TestMissingTemperature = range.clamp(
          new ScopeHelperClampPart03TestMissingTemperature(20),
        );
        let actual = result.getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingTemperature>(
            new ScopeHelperClampPart03TestMissingTemperature(30),
            new ScopeHelperClampPart03TestMissingTemperature(40),
          );
        let result: ScopeHelperClampPart03TestMissingTemperature = range.clamp(
          new ScopeHelperClampPart03TestMissingTemperature(50),
        );
        let actual = result.getTemp();
        let expected: int = 40;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingThrowOnValueTemp> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingThrowOnValueTemp>(
            new ScopeHelperClampPart03TestMissingThrowOnValueTemp(30),
            new ScopeHelperClampPart03TestMissingThrowOnValueTemp(40),
          );
        let input: ScopeHelperClampPart03TestMissingThrowOnValueTemp =
          new ScopeHelperClampPart03TestMissingThrowOnValueTemp(35);
        let result: ScopeHelperClampPart03TestMissingThrowOnValueTemp = range.clamp(input);
        expect(result).assertEqual(input);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingThrowOnValueTemp> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingThrowOnValueTemp>(
            new ScopeHelperClampPart03TestMissingThrowOnValueTemp(30),
            new ScopeHelperClampPart03TestMissingThrowOnValueTemp(40),
          );
        let result: ScopeHelperClampPart03TestMissingThrowOnValueTemp = range.clamp(
          new ScopeHelperClampPart03TestMissingThrowOnValueTemp(30),
        );
        let actual = result.getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CLAMP_1800
     * @tc.name testScopeClampBasic004
     * @tc.desc Verify ScopeHelper clamp with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeClampBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let upper: ScopeHelperClampPart03TestMissingLenWrap = new ScopeHelperClampPart03TestMissingLenWrap('zzz');
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingLenWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingLenWrap>(
            new ScopeHelperClampPart03TestMissingLenWrap('a'),
            upper,
          );
        let result: ScopeHelperClampPart03TestMissingLenWrap = range.clamp(
          new ScopeHelperClampPart03TestMissingLenWrap('hello'),
        );
        expect(result).assertEqual(upper);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingLenWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingLenWrap>(
            new ScopeHelperClampPart03TestMissingLenWrap('a'),
            new ScopeHelperClampPart03TestMissingLenWrap('hello'),
          );
        let value: ScopeHelperClampPart03TestMissingLenWrap = new ScopeHelperClampPart03TestMissingLenWrap('cat');
        let result: ScopeHelperClampPart03TestMissingLenWrap = range.clamp(value);
        expect(result).assertEqual(value);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingShortWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingShortWrap>(
            new ScopeHelperClampPart03TestMissingShortWrap(5),
            new ScopeHelperClampPart03TestMissingShortWrap(6),
          );
        let result: ScopeHelperClampPart03TestMissingShortWrap = range.clamp(
          new ScopeHelperClampPart03TestMissingShortWrap(3),
        );
        let actual = result.getVal();
        let expected: int = 5;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingShortWrap> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingShortWrap>(
            new ScopeHelperClampPart03TestMissingShortWrap(4),
            new ScopeHelperClampPart03TestMissingShortWrap(5),
          );
        let result: ScopeHelperClampPart03TestMissingShortWrap = range.clamp(
          new ScopeHelperClampPart03TestMissingShortWrap(7),
        );
        let actual = result.getVal();
        let expected: int = 5;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingCountTemp> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingCountTemp>(
            new ScopeHelperClampPart03TestMissingCountTemp(30),
            new ScopeHelperClampPart03TestMissingCountTemp(40),
          );
        let result: ScopeHelperClampPart03TestMissingCountTemp = range.clamp(
          new ScopeHelperClampPart03TestMissingCountTemp(35),
        );
        let actual: int = result.getTemp();
        let expected: int = 35;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingCountTemp> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingCountTemp>(
            new ScopeHelperClampPart03TestMissingCountTemp(30),
            new ScopeHelperClampPart03TestMissingCountTemp(40),
          );
        let result: ScopeHelperClampPart03TestMissingCountTemp = range.clamp(
          new ScopeHelperClampPart03TestMissingCountTemp(20),
        );
        let actual: int = result.getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperClampPart03TestMissingCountTemp> =
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingCountTemp>(
            new ScopeHelperClampPart03TestMissingCountTemp(30),
            new ScopeHelperClampPart03TestMissingCountTemp(40),
          );
        let result: ScopeHelperClampPart03TestMissingCountTemp = range.clamp(
          new ScopeHelperClampPart03TestMissingCountTemp(45),
        );
        let actual: int = result.getTemp();
        let expected: int = 40;
        expect(actual).assertEqual(expected);

      }
    });

  });
}
