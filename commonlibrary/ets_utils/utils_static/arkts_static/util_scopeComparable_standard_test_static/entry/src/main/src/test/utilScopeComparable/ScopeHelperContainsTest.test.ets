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

export default function ScopeHelperContainsTest(): void {
  describe('ScopeHelperContainsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_0100
     * @tc.name testScopeContainsThrows001
     * @tc.desc Verify ScopeHelper contains throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(7),
            new ScopeComparableOverviewPart01TestMissingTemperature(7),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperContainsPart02Test63TempBool>(
            new ScopeHelperContainsPart02Test63TempBool(true),
            new ScopeHelperContainsPart02Test63TempBool(true),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let shared: ScopeComparableOverviewPart01TestMissingTemperature = new ScopeComparableOverviewPart01TestMissingTemperature(40);
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(shared, shared);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperContainsPart02Test63TempBool>(
            new ScopeHelperContainsPart02Test63TempBool(false),
            new ScopeHelperContainsPart02Test63TempBool(false),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_0200
     * @tc.name testScopeContainsBigInt001
     * @tc.desc Verify ScopeHelper contains with BigInt bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsBigInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature>(
            new ScopeComparableOverviewPart01TestMissingLongTemperature(30n),
            new ScopeComparableOverviewPart01TestMissingLongTemperature(40n),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingLongTemperature(35n));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature>(
            new ScopeComparableOverviewPart01TestMissingLongTemperature(30n),
            new ScopeComparableOverviewPart01TestMissingLongTemperature(40n),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingLongTemperature(41n));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature>(
            new ScopeComparableOverviewPart01TestMissingLongTemperature(30n),
            new ScopeComparableOverviewPart01TestMissingLongTemperature(40n),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingLongTemperature(9223372036854775807n));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature>(
            new ScopeComparableOverviewPart01TestMissingLongTemperature(30n),
            new ScopeComparableOverviewPart01TestMissingLongTemperature(40n),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature>(
            new ScopeComparableOverviewPart01TestMissingLongTemperature(33n),
            new ScopeComparableOverviewPart01TestMissingLongTemperature(37n),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature>(
            new ScopeComparableOverviewPart01TestMissingLongTemperature(30n),
            new ScopeComparableOverviewPart01TestMissingLongTemperature(40n),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingLongTemperature>(
            new ScopeComparableOverviewPart01TestMissingLongTemperature(35n),
            new ScopeComparableOverviewPart01TestMissingLongTemperature(50n),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_0300
     * @tc.name testScopeContainsDate001
     * @tc.desc Verify ScopeHelper contains with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(30),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(2147483647));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(0),
            new ScopeComparableOverviewPart01TestMissingTemperature(2147483647),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(2147483647));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(0),
            new ScopeComparableOverviewPart01TestMissingTemperature(2147483647),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(-1));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test77TempDate> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test77TempDate>(
            new ScopeHelperContainsPart02Test77TempDate(new Date(2020, 0, 1)),
            new ScopeHelperContainsPart02Test77TempDate(new Date(2024, 11, 31)),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart02Test77TempDate(new Date(2022, 5, 15)));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test77TempDate> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test77TempDate>(
            new ScopeHelperContainsPart02Test77TempDate(new Date(2020, 0, 1)),
            new ScopeHelperContainsPart02Test77TempDate(new Date(2024, 11, 31)),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart02Test77TempDate(new Date(2025, 0, 1)));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong>(
            new ScopeHelperContainsPart01Test47TempLong(30),
            new ScopeHelperContainsPart01Test47TempLong(40),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart01Test47TempLong(9223372036854775807));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(0),
            new ScopeComparableOverviewPart01TestMissingTemperature(2147483647),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(100),
            new ScopeComparableOverviewPart01TestMissingTemperature(2147483647),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(0),
            new ScopeComparableOverviewPart01TestMissingTemperature(2147483647),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-1),
            new ScopeComparableOverviewPart01TestMissingTemperature(500),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test77TempDate> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test77TempDate>(
            new ScopeHelperContainsPart02Test77TempDate(new Date(2020, 0, 1)),
            new ScopeHelperContainsPart02Test77TempDate(new Date(2024, 11, 31)),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart02Test77TempDate> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test77TempDate>(
            new ScopeHelperContainsPart02Test77TempDate(new Date(2021, 0, 1)),
            new ScopeHelperContainsPart02Test77TempDate(new Date(2023, 11, 31)),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test77TempDate> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test77TempDate>(
            new ScopeHelperContainsPart02Test77TempDate(new Date(2020, 0, 1)),
            new ScopeHelperContainsPart02Test77TempDate(new Date(2024, 11, 31)),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart02Test77TempDate> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test77TempDate>(
            new ScopeHelperContainsPart02Test77TempDate(new Date(2022, 0, 1)),
            new ScopeHelperContainsPart02Test77TempDate(new Date(2025, 0, 1)),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_0400
     * @tc.name testScopeContainsChar001
     * @tc.desc Verify ScopeHelper contains with char bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test59TempChar> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test59TempChar>(
            new ScopeHelperContainsPart02Test59TempChar(Int.toChar(98)),
            new ScopeHelperContainsPart02Test59TempChar(Int.toChar(121)),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart02Test59TempChar(Int.toChar(109)));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test59TempChar> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test59TempChar>(
            new ScopeHelperContainsPart02Test59TempChar(Int.toChar(98)),
            new ScopeHelperContainsPart02Test59TempChar(Int.toChar(121)),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart02Test59TempChar(Int.toChar(97)));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test59TempChar> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test59TempChar>(
            new ScopeHelperContainsPart02Test59TempChar(Int.toChar(98)),
            new ScopeHelperContainsPart02Test59TempChar(Int.toChar(121)),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart02Test59TempChar> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test59TempChar>(
            new ScopeHelperContainsPart02Test59TempChar(Int.toChar(100)),
            new ScopeHelperContainsPart02Test59TempChar(Int.toChar(119)),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test59TempChar> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test59TempChar>(
            new ScopeHelperContainsPart02Test59TempChar(Int.toChar(98)),
            new ScopeHelperContainsPart02Test59TempChar(Int.toChar(121)),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart02Test59TempChar> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test59TempChar>(
            new ScopeHelperContainsPart02Test59TempChar(Int.toChar(120)),
            new ScopeHelperContainsPart02Test59TempChar(Int.toChar(122)),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_0500
     * @tc.name testScopeContainsStr001
     * @tc.desc Verify ScopeHelper contains with string bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsStr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test71TempString> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test71TempString>(
            new ScopeHelperContainsPart02Test71TempString('banana'),
            new ScopeHelperContainsPart02Test71TempString('orange'),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart02Test71TempString('kiwi'));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test71TempString> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test71TempString>(
            new ScopeHelperContainsPart02Test71TempString('banana'),
            new ScopeHelperContainsPart02Test71TempString('orange'),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart02Test71TempString('apple'));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test71TempString> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test71TempString>(
            new ScopeHelperContainsPart02Test71TempString('banana'),
            new ScopeHelperContainsPart02Test71TempString('orange'),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart02Test71TempString(''));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test71TempString> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test71TempString>(
            new ScopeHelperContainsPart02Test71TempString('banana'),
            new ScopeHelperContainsPart02Test71TempString('orange'),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart02Test71TempString('BANANA'));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test71TempString> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test71TempString>(
            new ScopeHelperContainsPart02Test71TempString('banana'),
            new ScopeHelperContainsPart02Test71TempString('orange'),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart02Test71TempString> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test71TempString>(
            new ScopeHelperContainsPart02Test71TempString('kiwi'),
            new ScopeHelperContainsPart02Test71TempString('mango'),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test71TempString> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test71TempString>(
            new ScopeHelperContainsPart02Test71TempString('banana'),
            new ScopeHelperContainsPart02Test71TempString('orange'),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart02Test71TempString> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test71TempString>(
            new ScopeHelperContainsPart02Test71TempString('apple'),
            new ScopeHelperContainsPart02Test71TempString('cherry'),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_0600
     * @tc.name testScopeContainsBool001
     * @tc.desc Verify ScopeHelper contains with boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test63TempBool> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test63TempBool>(
            new ScopeHelperContainsPart02Test63TempBool(false),
            new ScopeHelperContainsPart02Test63TempBool(true),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart02Test63TempBool> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test63TempBool>(
            new ScopeHelperContainsPart02Test63TempBool(false),
            new ScopeHelperContainsPart02Test63TempBool(true),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_0700
     * @tc.name testScopeContainsFloatDouble001
     * @tc.desc Verify ScopeHelper contains with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsFloatDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble>(
            new ScopeHelperContainsPart01Test40TempDouble(3.5),
            new ScopeHelperContainsPart01Test40TempDouble(9.5),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart01Test40TempDouble(5.5));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble>(
            new ScopeHelperContainsPart01Test40TempDouble(3.5),
            new ScopeHelperContainsPart01Test40TempDouble(9.5),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart01Test40TempDouble(3.4));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble>(
            new ScopeHelperContainsPart01Test40TempDouble(3.5),
            new ScopeHelperContainsPart01Test40TempDouble(9.5),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart01Test40TempDouble(0));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble>(
            new ScopeHelperContainsPart01Test40TempDouble(0),
            new ScopeHelperContainsPart01Test40TempDouble(1),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart01Test40TempDouble(0.1 + 0.2));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble>(
            new ScopeHelperContainsPart01Test40TempDouble(0),
            new ScopeHelperContainsPart01Test40TempDouble(1),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart01Test40TempDouble(Number.EPSILON));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble>(
            new ScopeHelperContainsPart01Test40TempDouble(3.5),
            new ScopeHelperContainsPart01Test40TempDouble(9.5),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart01Test40TempDouble(-1));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test57TempFloat> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test57TempFloat>(
            new ScopeHelperContainsPart01Test57TempFloat(3.5),
            new ScopeHelperContainsPart01Test57TempFloat(9.5),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart01Test57TempFloat(Float.MAX_VALUE));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble>(
            new ScopeHelperContainsPart01Test40TempDouble(3.5),
            new ScopeHelperContainsPart01Test40TempDouble(9.5),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble>(
            new ScopeHelperContainsPart01Test40TempDouble(4.5),
            new ScopeHelperContainsPart01Test40TempDouble(8.5),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble>(
            new ScopeHelperContainsPart01Test40TempDouble(3.5),
            new ScopeHelperContainsPart01Test40TempDouble(9.5),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test40TempDouble>(
            new ScopeHelperContainsPart01Test40TempDouble(9.6),
            new ScopeHelperContainsPart01Test40TempDouble(20),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test57TempFloat> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test57TempFloat>(
            new ScopeHelperContainsPart01Test57TempFloat(3.5 as float),
            new ScopeHelperContainsPart01Test57TempFloat(9.5 as float),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart01Test57TempFloat> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test57TempFloat>(
            new ScopeHelperContainsPart01Test57TempFloat(8.0 as float),
            new ScopeHelperContainsPart01Test57TempFloat(9.6 as float),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_0800
     * @tc.name testScopeContainsLong001
     * @tc.desc Verify ScopeHelper contains with long bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsLong001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong>(
            new ScopeHelperContainsPart01Test47TempLong(30),
            new ScopeHelperContainsPart01Test47TempLong(40),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart01Test47TempLong(35));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong>(
            new ScopeHelperContainsPart01Test47TempLong(30),
            new ScopeHelperContainsPart01Test47TempLong(40),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart01Test47TempLong(41));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong>(
            new ScopeHelperContainsPart01Test47TempLong(30),
            new ScopeHelperContainsPart01Test47TempLong(40),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong>(
            new ScopeHelperContainsPart01Test47TempLong(33),
            new ScopeHelperContainsPart01Test47TempLong(37),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong>(
            new ScopeHelperContainsPart01Test47TempLong(30),
            new ScopeHelperContainsPart01Test47TempLong(40),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong> =
          new util.ScopeHelper<ScopeHelperContainsPart01Test47TempLong>(
            new ScopeHelperContainsPart01Test47TempLong(35),
            new ScopeHelperContainsPart01Test47TempLong(50),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_0900
     * @tc.name testScopeContainsCustom001
     * @tc.desc Verify ScopeHelper contains with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsCustom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(30),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(35));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(30),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(20));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test48TempByte> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test48TempByte>(
            new ScopeHelperContainsPart02Test48TempByte(10 as byte),
            new ScopeHelperContainsPart02Test48TempByte(20 as byte),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart02Test48TempByte> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test48TempByte>(
            new ScopeHelperContainsPart02Test48TempByte(12 as byte),
            new ScopeHelperContainsPart02Test48TempByte(18 as byte),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test48TempByte> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test48TempByte>(
            new ScopeHelperContainsPart02Test48TempByte(10 as byte),
            new ScopeHelperContainsPart02Test48TempByte(20 as byte),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart02Test48TempByte> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test48TempByte>(
            new ScopeHelperContainsPart02Test48TempByte(15 as byte),
            new ScopeHelperContainsPart02Test48TempByte(25 as byte),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test52TempShort> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test52TempShort>(
            new ScopeHelperContainsPart02Test52TempShort(100 as short),
            new ScopeHelperContainsPart02Test52TempShort(200 as short),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart02Test52TempShort> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test52TempShort>(
            new ScopeHelperContainsPart02Test52TempShort(120 as short),
            new ScopeHelperContainsPart02Test52TempShort(180 as short),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test52TempShort> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test52TempShort>(
            new ScopeHelperContainsPart02Test52TempShort(100 as short),
            new ScopeHelperContainsPart02Test52TempShort(200 as short),
          );
        let sub: util.ScopeHelper<ScopeHelperContainsPart02Test52TempShort> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test52TempShort>(
            new ScopeHelperContainsPart02Test52TempShort(150 as short),
            new ScopeHelperContainsPart02Test52TempShort(250 as short),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_1000
     * @tc.name testScopeContainsBoundary001
     * @tc.desc Verify ScopeHelper contains with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(0),
            new ScopeComparableOverviewPart01TestMissingTemperature(1000000),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(500000));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(0),
            new ScopeComparableOverviewPart01TestMissingTemperature(1000000),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(50000),
            new ScopeComparableOverviewPart01TestMissingTemperature(900000),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(0),
            new ScopeComparableOverviewPart01TestMissingTemperature(1000000),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(500000),
            new ScopeComparableOverviewPart01TestMissingTemperature(2000000),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_1100
     * @tc.name testScopeContainsConsistency001
     * @tc.desc Verify ScopeHelper contains state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(30),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let first: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(38));
        let second: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(38));
        expect(first).assertTrue();
        expect(second).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let disjoint = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(10),
          new ScopeHelperContainsPart03TestMissingTemperature(20),
        );
        try {
          range.intersect(disjoint);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let fresh = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(30),
          new ScopeHelperContainsPart03TestMissingTemperature(40),
        );
        let oldRes = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(35));
        let newRes = fresh.contains(new ScopeHelperContainsPart03TestMissingTemperature(35));
        expect(oldRes).assertEqual(newRes);

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let byValue: boolean = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(35));
        let byRange: boolean = range.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(34),
            new ScopeHelperContainsPart03TestMissingTemperature(36),
          ),
        );
        expect(byValue).assertEqual(byRange);

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let byValue = range.contains(lower);
        let byRange = range.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(30),
            new ScopeHelperContainsPart03TestMissingTemperature(31),
          ),
        );
        expect(byValue).assertEqual(byRange);

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let valueHit = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(35));
        let valueMiss = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(45));
        let rangeHit = range.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(35),
            new ScopeHelperContainsPart03TestMissingTemperature(36),
          ),
        );
        let rangeMiss = range.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(45),
            new ScopeHelperContainsPart03TestMissingTemperature(46),
          ),
        );
        expect(valueHit).assertEqual(rangeHit);
        expect(valueMiss).assertEqual(rangeMiss);

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        lower.setTemp(25);
        let result = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(25));
        expect(result).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        upper.setTemp(45);
        let result = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(45));
        expect(result).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let before = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(33));
        lower.setTemp(35);
        let after = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(33));
        expect(before).assertTrue();
        expect(after).assertFalse();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let inner = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(34),
          new ScopeHelperContainsPart03TestMissingTemperature(37),
        );
        let before = range.contains(inner);
        upper.setTemp(36);
        let after = range.contains(inner);
        expect(before).assertTrue();
        expect(after).assertFalse();

      }
      {
        let rangeA = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(30),
          new ScopeHelperContainsPart03TestMissingTemperature(40),
        );
        let rangeB = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(30),
          new ScopeHelperContainsPart03TestMissingTemperature(40),
        );
        let resultA = rangeA.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(33),
            new ScopeHelperContainsPart03TestMissingTemperature(36),
          ),
        );
        let resultB = rangeB.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(33),
            new ScopeHelperContainsPart03TestMissingTemperature(36),
          ),
        );
        expect(resultA).assertEqual(resultB);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_1200
     * @tc.name testScopeContainsConsistency002
     * @tc.desc Verify ScopeHelper contains state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsConsistency002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let sharedLower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let rangeA = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          sharedLower,
          new ScopeHelperContainsPart03TestMissingTemperature(40),
        );
        let rangeB = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          sharedLower,
          new ScopeHelperContainsPart03TestMissingTemperature(40),
        );
        let before = rangeB.contains(new ScopeHelperContainsPart03TestMissingTemperature(25));
        sharedLower.setTemp(25);
        let after = rangeB.contains(new ScopeHelperContainsPart03TestMissingTemperature(25));
        expect(before).assertFalse();
        expect(after).assertTrue();
        expect(rangeA.contains(new ScopeHelperContainsPart03TestMissingTemperature(25))).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let probe = new ScopeHelperContainsPart03TestMissingTemperature(34);
        let resA = range.contains(probe);
        let resB = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(34));
        expect(resA).assertTrue();
        expect(resB).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let shareRange = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(30),
          new ScopeHelperContainsPart03TestMissingTemperature(35),
        );
        let before = range.contains(shareRange);
        lower.setTemp(33);
        let after = range.contains(shareRange);
        expect(before).assertTrue();
        expect(after).assertFalse();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let oldBound = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(30));
        lower.setTemp(33);
        let newBound = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(30));
        expect(oldBound).assertTrue();
        expect(newBound).assertFalse();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let point = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(30),
          new ScopeHelperContainsPart03TestMissingTemperature(31),
        );
        let before = range.contains(point);
        lower.setTemp(32);
        let after = range.contains(point);
        expect(before).assertTrue();
        expect(after).assertFalse();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let shareRange = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(36),
          new ScopeHelperContainsPart03TestMissingTemperature(40),
        );
        let before = range.contains(shareRange);
        upper.setTemp(35);
        let after = range.contains(shareRange);
        expect(before).assertTrue();
        expect(after).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_1300
     * @tc.name testScopeContainsBasic001
     * @tc.desc Verify ScopeHelper contains with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(30),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(30));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(30),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(40));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(30),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(100));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-10),
            new ScopeComparableOverviewPart01TestMissingTemperature(-1),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(-5));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-10),
            new ScopeComparableOverviewPart01TestMissingTemperature(-1),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(-11));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-10),
            new ScopeComparableOverviewPart01TestMissingTemperature(-1),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(0));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-5),
            new ScopeComparableOverviewPart01TestMissingTemperature(5),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(0));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-5),
            new ScopeComparableOverviewPart01TestMissingTemperature(5),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(6));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test48TempByte> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test48TempByte>(
            new ScopeHelperContainsPart02Test48TempByte(10 as byte),
            new ScopeHelperContainsPart02Test48TempByte(20 as byte),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart02Test48TempByte(15 as byte));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test48TempByte> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test48TempByte>(
            new ScopeHelperContainsPart02Test48TempByte(10 as byte),
            new ScopeHelperContainsPart02Test48TempByte(20 as byte),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart02Test48TempByte(-128 as byte));
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_1400
     * @tc.name testScopeContainsBasic002
     * @tc.desc Verify ScopeHelper contains with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test52TempShort> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test52TempShort>(
            new ScopeHelperContainsPart02Test52TempShort(100 as short),
            new ScopeHelperContainsPart02Test52TempShort(200 as short),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart02Test52TempShort(150 as short));
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeHelperContainsPart02Test52TempShort> =
          new util.ScopeHelper<ScopeHelperContainsPart02Test52TempShort>(
            new ScopeHelperContainsPart02Test52TempShort(100 as short),
            new ScopeHelperContainsPart02Test52TempShort(200 as short),
          );
        let result: boolean = range.contains(new ScopeHelperContainsPart02Test52TempShort(32767 as short));
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(30),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let result: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(36));
        expect(result).assertTrue();
        expect(range.getLower().getTemp()).assertEqual(30);
        expect(range.getUpper().getTemp()).assertEqual(40);

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
            new ScopeComparableOverviewPart01TestMissingTemperature(41),
          );
        let atLower: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(40));
        let atUpper: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(41));
        let below: boolean = range.contains(new ScopeComparableOverviewPart01TestMissingTemperature(39));
        expect(atLower).assertTrue();
        expect(atUpper).assertTrue();
        expect(below).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(30),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(32),
            new ScopeComparableOverviewPart01TestMissingTemperature(38),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(30),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let rangeSec: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(20),
            new ScopeComparableOverviewPart01TestMissingTemperature(45),
          );
        let result: boolean = range.contains(rangeSec);
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(30),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
            new ScopeComparableOverviewPart01TestMissingTemperature(41),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(30),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(29),
            new ScopeComparableOverviewPart01TestMissingTemperature(35),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-10),
            new ScopeComparableOverviewPart01TestMissingTemperature(-1),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-8),
            new ScopeComparableOverviewPart01TestMissingTemperature(-3),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-10),
            new ScopeComparableOverviewPart01TestMissingTemperature(-1),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-12),
            new ScopeComparableOverviewPart01TestMissingTemperature(-5),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_1500
     * @tc.name testScopeContainsBasic003
     * @tc.desc Verify ScopeHelper contains with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-5),
            new ScopeComparableOverviewPart01TestMissingTemperature(5),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-3),
            new ScopeComparableOverviewPart01TestMissingTemperature(3),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-5),
            new ScopeComparableOverviewPart01TestMissingTemperature(5),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(-10),
            new ScopeComparableOverviewPart01TestMissingTemperature(0),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
            new ScopeComparableOverviewPart01TestMissingTemperature(45),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
            new ScopeComparableOverviewPart01TestMissingTemperature(44),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertTrue();

      }
      {
        let range: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(39),
            new ScopeComparableOverviewPart01TestMissingTemperature(41),
          );
        let sub: util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature> =
          new util.ScopeHelper<ScopeComparableOverviewPart01TestMissingTemperature>(
            new ScopeComparableOverviewPart01TestMissingTemperature(35),
            new ScopeComparableOverviewPart01TestMissingTemperature(40),
          );
        let result: boolean = range.contains(sub);
        expect(result).assertFalse();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let result = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(31));
        expect(result).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let shareUp = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(35),
          upper,
        );
        let result = range.contains(shareUp);
        expect(result).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let result = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(26));
        expect(result).assertFalse();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let result = range.contains(range);
        expect(result).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let inValue = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(37));
        let outValue = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(45));
        expect(inValue).assertTrue();
        expect(outValue).assertFalse();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let inner = range.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(34),
            new ScopeHelperContainsPart03TestMissingTemperature(37),
          ),
        );
        let outer = range.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(20),
            new ScopeHelperContainsPart03TestMissingTemperature(50),
          ),
        );
        expect(inner).assertTrue();
        expect(outer).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_1600
     * @tc.name testScopeContainsBasic004
     * @tc.desc Verify ScopeHelper contains with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let disjoint = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(10),
          new ScopeHelperContainsPart03TestMissingTemperature(20),
        );
        try {
          range.intersect(disjoint);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let result = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(35));
        expect(result).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let disjoint = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(10),
          new ScopeHelperContainsPart03TestMissingTemperature(20),
        );
        try {
          range.intersect(disjoint);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let result = range.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(33),
            new ScopeHelperContainsPart03TestMissingTemperature(36),
          ),
        );
        expect(result).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let disjoint = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(10),
          new ScopeHelperContainsPart03TestMissingTemperature(20),
        );
        try {
          range.intersect(disjoint);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let text = range.toString();
        expect(text).assertEqual('[30, 40]');

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let disjoint = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(10),
          new ScopeHelperContainsPart03TestMissingTemperature(20),
        );
        try {
          range.intersect(disjoint);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let result = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(45));
        expect(result).assertFalse();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let disjoint = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(10),
          new ScopeHelperContainsPart03TestMissingTemperature(20),
        );
        try {
          range.intersect(disjoint);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let result = range.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(26),
            new ScopeHelperContainsPart03TestMissingTemperature(42),
          ),
        );
        expect(result).assertFalse();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let disjoint = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(10),
          new ScopeHelperContainsPart03TestMissingTemperature(20),
        );
        try {
          range.intersect(disjoint);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let result = range.contains(new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper));
        expect(result).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let disjoint = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
          new ScopeHelperContainsPart03TestMissingTemperature(10),
          new ScopeHelperContainsPart03TestMissingTemperature(20),
        );
        try {
          range.intersect(disjoint);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let expanded = range.expand(new ScopeHelperContainsPart03TestMissingTemperature(45));
        let result = expanded.contains(new ScopeHelperContainsPart03TestMissingTemperature(45));
        expect(result).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let before = range.toString();
        let res = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(35));
        let after = range.toString();
        expect(before).assertEqual('[30, 40]');
        expect(after).assertEqual('[30, 40]');
        expect(res).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let actual = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(35));
        let actualA = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(36));
        let actualB = range.contains(new ScopeHelperContainsPart03TestMissingTemperature(37));
        expect(actual).assertTrue();
        expect(actualA).assertTrue();
        expect(actualB).assertTrue();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        let actual = range.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(31),
            new ScopeHelperContainsPart03TestMissingTemperature(33),
          ),
        );
        let actualA = range.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(34),
            new ScopeHelperContainsPart03TestMissingTemperature(36),
          ),
        );
        let actualB = range.contains(
          new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(
            new ScopeHelperContainsPart03TestMissingTemperature(37),
            new ScopeHelperContainsPart03TestMissingTemperature(39),
          ),
        );
        expect(actual).assertTrue();
        expect(actualA).assertTrue();
        expect(actualB).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONTAINS_1700
     * @tc.name testScopeContainsBasic005
     * @tc.desc Verify ScopeHelper contains with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeContainsBasic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let levelRange = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingLevelItem>(
          new ScopeHelperContainsPart03TestMissingLevelItem(1),
          new ScopeHelperContainsPart03TestMissingLevelItem(9),
        );
        let result = levelRange.contains(new ScopeHelperContainsPart03TestMissingLevelItem(5));
        expect(result).assertTrue();

      }
      {
        let levelRange = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingLevelItem>(
          new ScopeHelperContainsPart03TestMissingLevelItem(1),
          new ScopeHelperContainsPart03TestMissingLevelItem(9),
        );
        let inner = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingLevelItem>(
          new ScopeHelperContainsPart03TestMissingLevelItem(3),
          new ScopeHelperContainsPart03TestMissingLevelItem(7),
        );
        let result = levelRange.contains(inner);
        expect(result).assertTrue();

      }
      {
        let levelRange = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingLevelItem>(
          new ScopeHelperContainsPart03TestMissingLevelItem(1),
          new ScopeHelperContainsPart03TestMissingLevelItem(9),
        );
        let result = levelRange.contains(new ScopeHelperContainsPart03TestMissingLevelItem(11));
        expect(result).assertFalse();

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        lower.setTemp(25);
        let text = range.toString();
        expect(text).assertEqual('[25, 40]');

      }
      {
        let lower = new ScopeHelperContainsPart03TestMissingTemperature(30);
        let upper = new ScopeHelperContainsPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperContainsPart03TestMissingTemperature>(lower, upper);
        upper.setTemp(45);
        let text = range.toString();
        expect(text).assertEqual('[30, 45]');

      }
    });

  });
}
