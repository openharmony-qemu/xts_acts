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

export default function ScopeHelperOverviewTest(): void {
  describe('ScopeHelperOverviewTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_0100
     * @tc.name testScopeOvThrows001
     * @tc.desc Verify ScopeHelper overview throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(40), new Temperature(50));
        try {
          range.intersect(other);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let other = new util.ScopeHelper<Temperature>(new Temperature(40), new Temperature(40));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_0200
     * @tc.name testScopeOvDate001
     * @tc.desc Verify ScopeHelper overview with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(2147483647),
            new ScopeHelperOverviewPart01TestMissingTemperature(2147483647),
          );
          let actual: string = range.toString();
          let expected: string = '[2147483647, 2147483647]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(-100),
          new ScopeHelperOverviewPart01TestMissingTemperature(2147483647),
        );
        let actual: string = range.getUpper().toString();
        let expected: string = '2147483647';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(-2147483648),
          new ScopeHelperOverviewPart01TestMissingTemperature(-100),
        );
        let actual: string = range.getLower().toString();
        let expected: string = '-2147483648';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(1000000000), new Temperature(2000000000));
        let actual: string = range.toString();
        let expected: string = '[1000000000, 2000000000]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual = range.clamp(new ScopeHelperOverviewPart03TestMissingTemperature(-2147483647 - 1)).getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual = range.clamp(new ScopeHelperOverviewPart03TestMissingTemperature(2147483647)).getTemp();
        let expected: int = 40;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(
          new ScopeHelperOverviewPart03TestMissingTemperature(-2147483647 - 1),
          new ScopeHelperOverviewPart03TestMissingTemperature(2147483647),
        );
        let actual: string = result.toString();
        let expected: string = '[-2147483648, 2147483647]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(
          new ScopeHelperOverviewPart03TestMissingTemperature(-2147483647 - 1),
        );
        let actual: string = result.toString();
        let expected: string = '[-2147483648, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(
          new ScopeHelperOverviewPart03TestMissingTemperature(2147483647),
        );
        let actual: string = result.toString();
        let expected: string = '[30, 2147483647]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_0300
     * @tc.name testScopeOvFloatDouble001
     * @tc.desc Verify ScopeHelper overview with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvFloatDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingHeight>(
          new ScopeHelperToStringPart01TestMissingHeight(1.5),
          new ScopeHelperToStringPart01TestMissingHeight(9.5),
        );
        let result = range.expand(new ScopeHelperToStringPart01TestMissingHeight(10.5));
        let actual: string = result.toString();
        let expected: string = '[1.5, 10.5]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_0400
     * @tc.name testScopeOvInt001
     * @tc.desc Verify ScopeHelper overview with int bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lo: ScopeHelperOverviewPart03TestMissingTemperature = new ScopeHelperOverviewPart03TestMissingTemperature(
          -2147483647 - 1,
        );
        let up: ScopeHelperOverviewPart03TestMissingTemperature = new ScopeHelperOverviewPart03TestMissingTemperature(
          2147483647,
        );
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature > =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature >(lo, up);
        let actual: string = range.toString();
        let expected: string = '[-2147483648, 2147483647]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_0500
     * @tc.name testScopeOvCustom001
     * @tc.desc Verify ScopeHelper overview with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvCustom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let actual: int = range.toString().length;
        let expected: int = 8;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_0600
     * @tc.name testScopeOvConsistency001
     * @tc.desc Verify ScopeHelper overview state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(-100),
          new ScopeHelperOverviewPart01TestMissingTemperature(40),
        );
        let actual: string = range.toString();
        let expected: string = '[-100, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(-50),
          new ScopeHelperOverviewPart01TestMissingTemperature(-10),
        );
        let actual: string = range.toString();
        let expected: string = '[-50, -10]';
        expect(actual).assertEqual(expected);

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(35),
            new ScopeHelperOverviewPart01TestMissingTemperature(35),
          );
          let actual: string = range.toString();
          let expected: string = '[35, 35]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(30),
          new ScopeHelperOverviewPart01TestMissingTemperature(40),
        );
        let other = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(35),
          new ScopeHelperOverviewPart01TestMissingTemperature(39),
        );
        let result = range.intersect(other);
        let actual: string = result.toString();
        let expected: string = '[35, 39]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(30),
          new ScopeHelperOverviewPart01TestMissingTemperature(40),
        );
        let result = range.intersect(
          new ScopeHelperOverviewPart01TestMissingTemperature(-100),
          new ScopeHelperOverviewPart01TestMissingTemperature(35),
        );
        let actual: string = result.toString();
        let expected: string = '[30, 35]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(-200),
          new ScopeHelperOverviewPart01TestMissingTemperature(-50),
        );
        let actual: string = range.getUpper().toString();
        let expected: string = '-50';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(30),
          new ScopeHelperOverviewPart01TestMissingTemperature(40),
        );
        let actual: string = range.getLower().toString();
        let expected: string = '30';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(30),
          new ScopeHelperOverviewPart01TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperOverviewPart01TestMissingTemperature(-100),
          new ScopeHelperOverviewPart01TestMissingTemperature(-10),
        );
        let actual: string = result.toString();
        let expected: string = '[-100, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(30),
          new ScopeHelperOverviewPart01TestMissingTemperature(40),
        );
        let actual: string = range.clamp(new ScopeHelperOverviewPart01TestMissingTemperature(-100)).toString();
        let expected: string = '30';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(10), new Temperature(20));
        let actual: string = range.toString();
        let expected: string = '[10, 20]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_0700
     * @tc.name testScopeOvConsistency002
     * @tc.desc Verify ScopeHelper overview state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvConsistency002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(-10), new Temperature(40));
        let actual = range.getLower().getTemp();
        let expected: int = -10;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let union = range.expand(new Temperature(50));
        let actual = union.getLower().getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let upper = range.getUpper().getTemp();
        let lower = range.getLower().getTemp();
        let actual = upper - lower;
        let expected: int = 10;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(35), new Temperature(39));
        let inter = range.intersect(other);
        let actual: string = other.intersect(range).toString();
        let expected: string = inter.toString();
        expect(actual).assertEqual('[35, 39]');
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(20), new Temperature(35));
        let inter = range.intersect(other);
        let actual = inter.getUpper().getTemp();
        let expected: int = 35;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let inter = range.intersect(new Temperature(35), new Temperature(39));
        let actual: int = inter.getUpper().getTemp() - inter.getLower().getTemp();
        let expected: int = 4;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(20), new Temperature(45));
        let union = range.expand(other);
        let actual = union.getLower().getTemp();
        let expected: int = 20;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(20), new Temperature(45));
        let union = range.expand(other);
        let actual = union.getUpper().getTemp();
        let expected: int = 45;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let union = range.expand(new Temperature(25), new Temperature(50));
        let actual: int = union.getUpper().getTemp() - union.getLower().getTemp();
        let expected: int = 25;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let union = range.expand(new Temperature(25), new Temperature(50));
        let actual = union.getLower().getTemp();
        let expected: int = 25;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_0800
     * @tc.name testScopeOvConsistency003
     * @tc.desc Verify ScopeHelper overview state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvConsistency003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let union = range.expand(new Temperature(50));
        let actual = union.getUpper().getTemp();
        let expected: int = 50;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let result = range.clamp(new Temperature(20));
        let actual = result.getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual = range.clamp(new ScopeHelperOverviewPart03TestMissingTemperature(25)).getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual = range.clamp(new ScopeHelperOverviewPart03TestMissingTemperature(45)).getTemp();
        let expected: int = 40;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual = range.clamp(new ScopeHelperOverviewPart03TestMissingTemperature(30)).getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual = range.clamp(new ScopeHelperOverviewPart03TestMissingTemperature(40)).getTemp();
        let expected: int = 40;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual = range.clamp(new ScopeHelperOverviewPart03TestMissingTemperature(35)).getTemp();
        let expected: int = 35;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_0900
     * @tc.name testScopeOvBasic001
     * @tc.desc Verify ScopeHelper overview with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(40),
            new ScopeHelperOverviewPart01TestMissingTemperature(30),
          );
          let actual: boolean = range.contains(new ScopeHelperOverviewPart01TestMissingTemperature(35));
          expect(actual).assertFalse();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(30),
          new ScopeHelperOverviewPart01TestMissingTemperature(40),
        );
        let other = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
          new ScopeHelperOverviewPart01TestMissingTemperature(35),
          new ScopeHelperOverviewPart01TestMissingTemperature(39),
        );
        let result = range.intersect(other);
        let actual: string = result.getLower().toString();
        let expected: string = '35';
        expect(actual).assertEqual(expected);
        let actualA: string = result.getUpper().toString();
        let expectedA: string = '39';
        expect(actualA).assertEqual(expectedA);

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(30),
            new ScopeHelperOverviewPart01TestMissingTemperature(40),
          );
          let other = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(20),
            new ScopeHelperOverviewPart01TestMissingTemperature(30),
          );
          let result = range.intersect(other);
          let actual: string = result.toString();
          let expected: string = '[30, 30]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(30),
            new ScopeHelperOverviewPart01TestMissingTemperature(40),
          );
          let other = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(40),
            new ScopeHelperOverviewPart01TestMissingTemperature(45),
          );
          let result = range.intersect(other);
          let actual: string = result.toString();
          let expected: string = '[40, 40]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(30),
            new ScopeHelperOverviewPart01TestMissingTemperature(40),
          );
          let result = range.intersect(
            new ScopeHelperOverviewPart01TestMissingTemperature(40),
            new ScopeHelperOverviewPart01TestMissingTemperature(40),
          );
          let actual: string = result.toString();
          let expected: string = '[40, 40]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(30),
            new ScopeHelperOverviewPart01TestMissingTemperature(40),
          );
          let lowPoint = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(30),
            new ScopeHelperOverviewPart01TestMissingTemperature(30),
          );
          let actual: boolean = range.contains(lowPoint);
          expect(actual).assertTrue();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(30),
            new ScopeHelperOverviewPart01TestMissingTemperature(40),
          );
          let highPoint = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(40),
            new ScopeHelperOverviewPart01TestMissingTemperature(40),
          );
          let actual: boolean = range.contains(highPoint);
          expect(actual).assertTrue();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(30),
            new ScopeHelperOverviewPart01TestMissingTemperature(40),
          );
          let farPoint = new util.ScopeHelper<ScopeHelperOverviewPart01TestMissingTemperature>(
            new ScopeHelperOverviewPart01TestMissingTemperature(41),
            new ScopeHelperOverviewPart01TestMissingTemperature(41),
          );
          let actual: boolean = range.contains(farPoint);
          expect(actual).assertFalse();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let actual: boolean = range.contains(new Temperature(36));
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(-10), new Temperature(40));
        let actual: string = range.toString();
        let expected: string = '[-10, 40]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_1000
     * @tc.name testScopeOvBasic002
     * @tc.desc Verify ScopeHelper overview with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let lower = range.getLower();
        let upper = range.getUpper();
        let actual: boolean = lower.getTemp() < upper.getTemp();
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(35), new Temperature(39));
        let inter = range.intersect(other);
        let lowerInside: boolean = inter.getLower().getTemp() >= range.getLower().getTemp();
        let upperInside: boolean = inter.getUpper().getTemp() <= range.getUpper().getTemp();
        expect(lowerInside).assertTrue();
        expect(upperInside).assertTrue();

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let result = range.clamp(new Temperature(20));
        let actual: boolean = result.getTemp() >= range.getLower().getTemp();
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(20), new Temperature(45));
        range.expand(other);
        let actual = range.getUpper().getTemp();
        let expected: int = 40;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        range.intersect(new Temperature(35), new Temperature(39));
        let actual = range.getUpper().getTemp();
        let expected: int = 40;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(32), new Temperature(38));
        let inter = range.intersect(other);
        let actual: string = inter.toString();
        let expected: string = '[32, 38]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(35), new Temperature(39));
        range.intersect(other);
        let actual: string = range.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(20), new Temperature(45));
        let union = range.expand(other);
        let lowerCovered: boolean = union.getLower().getTemp() <= other.getLower().getTemp();
        let upperCovered: boolean = union.getUpper().getTemp() >= other.getUpper().getTemp();
        expect(lowerCovered).assertTrue();
        expect(upperCovered).assertTrue();

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(20), new Temperature(45));
        let union = range.expand(other);
        let actual: string = union.toString();
        let expected: string = '[20, 45]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(32), new Temperature(38));
        let union = range.expand(other);
        let actual: string = union.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_1100
     * @tc.name testScopeOvBasic003
     * @tc.desc Verify ScopeHelper overview with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(20), new Temperature(45));
        range.expand(other);
        let actual: string = other.toString();
        let expected: string = '[20, 45]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let union = range.expand(new Temperature(25), new Temperature(50));
        let actual: string = union.toString();
        let expected: string = '[25, 50]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        range.expand(new Temperature(25), new Temperature(50));
        let actual: string = range.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let union = range.expand(new Temperature(35));
        let lowerCovered: boolean = union.getLower().getTemp() <= 35;
        let upperCovered: boolean = union.getUpper().getTemp() >= 35;
        expect(lowerCovered).assertTrue();
        expect(upperCovered).assertTrue();

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(20), new Temperature(45));
        let actual: boolean = range.contains(other);
        expect(actual).assertFalse();

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let other = new util.ScopeHelper<Temperature>(new Temperature(31), new Temperature(39));
        let actual: boolean = range.contains(other);
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        let result = range.clamp(new Temperature(35));
        let lowerOk: boolean = result.getTemp() >= range.getLower().getTemp();
        let upperOk: boolean = result.getTemp() <= range.getUpper().getTemp();
        expect(lowerOk).assertTrue();
        expect(upperOk).assertTrue();

      }
      {
        let range = new util.ScopeHelper<Temperature>(new Temperature(30), new Temperature(40));
        range.clamp(new Temperature(20));
        let actual: string = range.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo: ScopeHelperOverviewPart03TestMissingTemperature = new ScopeHelperOverviewPart03TestMissingTemperature(
          -100,
        );
        let up: ScopeHelperOverviewPart03TestMissingTemperature = new ScopeHelperOverviewPart03TestMissingTemperature(
          -50,
        );
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature > =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature >(lo, up);
        let actual: string = range.toString();
        let expected: string = '[-100, -50]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual: boolean = range.contains(new ScopeHelperOverviewPart03TestMissingTemperature(30));
        expect(actual).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_1200
     * @tc.name testScopeOvBasic004
     * @tc.desc Verify ScopeHelper overview with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual: boolean = range.contains(new ScopeHelperOverviewPart03TestMissingTemperature(40));
        expect(actual).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual: boolean = range.contains(new ScopeHelperOverviewPart03TestMissingTemperature(35));
        expect(actual).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual: boolean = range.contains(new ScopeHelperOverviewPart03TestMissingTemperature(29));
        expect(actual).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual: boolean = range.contains(new ScopeHelperOverviewPart03TestMissingTemperature(41));
        expect(actual).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.intersect(range);
        let actual: string = result.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let other: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
            new ScopeHelperOverviewPart03TestMissingTemperature(20),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(other);
        let actual: string = result.toString();
        let expected: string = '[10, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let other: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(50),
            new ScopeHelperOverviewPart03TestMissingTemperature(60),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(other);
        let actual: string = result.toString();
        let expected: string = '[30, 60]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(range);
        let actual: string = result.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual: boolean = range.contains(range);
        expect(actual).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let other: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(25),
            new ScopeHelperOverviewPart03TestMissingTemperature(35),
          );
        let actual: boolean = range.contains(other);
        expect(actual).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_1300
     * @tc.name testScopeOvBasic005
     * @tc.desc Verify ScopeHelper overview with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvBasic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let other: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(35),
            new ScopeHelperOverviewPart03TestMissingTemperature(45),
          );
        let actual: boolean = range.contains(other);
        expect(actual).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let other: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(50),
            new ScopeHelperOverviewPart03TestMissingTemperature(60),
          );
        let actual: boolean = range.contains(other);
        expect(actual).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let other: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
            new ScopeHelperOverviewPart03TestMissingTemperature(20),
          );
        let actual: boolean = range.contains(other);
        expect(actual).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(
          new ScopeHelperOverviewPart03TestMissingTemperature(35),
          new ScopeHelperOverviewPart03TestMissingTemperature(50),
        );
        let actual: string = result.toString();
        let expected: string = '[30, 50]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(
          new ScopeHelperOverviewPart03TestMissingTemperature(10),
          new ScopeHelperOverviewPart03TestMissingTemperature(35),
        );
        let actual: string = result.toString();
        let expected: string = '[10, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(
          new ScopeHelperOverviewPart03TestMissingTemperature(10),
          new ScopeHelperOverviewPart03TestMissingTemperature(50),
        );
        let actual: string = result.toString();
        let expected: string = '[10, 50]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(
          new ScopeHelperOverviewPart03TestMissingTemperature(35),
          new ScopeHelperOverviewPart03TestMissingTemperature(39),
        );
        let actual: string = result.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(
          new ScopeHelperOverviewPart03TestMissingTemperature(45),
          new ScopeHelperOverviewPart03TestMissingTemperature(45),
        );
        let actual: string = result.toString();
        let expected: string = '[30, 45]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(
          new ScopeHelperOverviewPart03TestMissingTemperature(25),
        );
        let actual: string = result.toString();
        let expected: string = '[25, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range.expand(
          new ScopeHelperOverviewPart03TestMissingTemperature(30),
        );
        let actual: string = result.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_OVERVIEW_1400
     * @tc.name testScopeOvBasic006
     * @tc.desc Verify ScopeHelper overview with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeOvBasic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let other: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(35),
            new ScopeHelperOverviewPart03TestMissingTemperature(39),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range
          .intersect(other)
          .intersect(range);
        let actual: string = result.toString();
        let expected: string = '[35, 39]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let other: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(35),
            new ScopeHelperOverviewPart03TestMissingTemperature(39),
          );
        let result: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> = range
          .expand(other)
          .expand(new ScopeHelperOverviewPart03TestMissingTemperature(50));
        let actual: string = result.toString();
        let expected: string = '[30, 50]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let lo: int = range.expand(new ScopeHelperOverviewPart03TestMissingTemperature(25)).getLower().getTemp();
        expect(lo).assertEqual(25);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let up: int = range
          .intersect(
            new ScopeHelperOverviewPart03TestMissingTemperature(35),
            new ScopeHelperOverviewPart03TestMissingTemperature(39),
          )
          .getUpper()
          .getTemp();
        expect(up).assertEqual(39);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(-100),
            new ScopeHelperOverviewPart03TestMissingTemperature(-50),
          );
        let actual = range.getLower().getTemp();
        let expected: int = -100;
        expect(actual).assertEqual(expected);

      }
      {
        let lo: ScopeHelperOverviewPart03TestMissingAllFalseTemp = new ScopeHelperOverviewPart03TestMissingAllFalseTemp(
          30,
        );
        let up: ScopeHelperOverviewPart03TestMissingAllFalseTemp = new ScopeHelperOverviewPart03TestMissingAllFalseTemp(
          40,
        );
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingAllFalseTemp > =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingAllFalseTemp >(lo, up);
        let actual: boolean = range.contains(new ScopeHelperOverviewPart03TestMissingAllFalseTemp(35));
        expect(actual).assertFalse();

      }
    });

  });
}
