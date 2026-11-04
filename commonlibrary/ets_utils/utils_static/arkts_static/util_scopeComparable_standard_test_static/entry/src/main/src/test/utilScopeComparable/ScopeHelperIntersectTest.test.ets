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

export default function ScopeHelperIntersectTest(): void {
  describe('ScopeHelperIntersectTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_0100
     * @tc.name testScopeIsectThrows001
     * @tc.desc Verify ScopeHelper intersect throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(10),
          new ScopeHelperExpandPart03TestMissingTemperature(20),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(41),
          new ScopeHelperExpandPart03TestMissingTemperature(50),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(20),
          new ScopeHelperExpandPart03TestMissingTemperature(29),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(50),
          new ScopeHelperExpandPart03TestMissingTemperature(60),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let actual: string = scope.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);
        let result = scope.intersect(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(35),
            new ScopeHelperExpandPart03TestMissingTemperature(45),
          ),
        );
        let actualC: string = result.toString();
        let expectedA: string = '[35, 40]';
        expect(actualC).assertEqual(expectedA);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(50),
          new ScopeHelperExpandPart03TestMissingTemperature(60),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let actual: string = arg.toString();
        let expected: string = '[50, 60]';
        expect(actual).assertEqual(expected);

      }
      {
        let first = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        ).intersect(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(35),
            new ScopeHelperExpandPart03TestMissingTemperature(45),
          ),
        );
        try {
          first.intersect(
            new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
              new ScopeHelperExpandPart03TestMissingTemperature(50),
              new ScopeHelperExpandPart03TestMissingTemperature(60),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test56StrTemp>(
          new ScopeHelperIntersectPart01Test56StrTemp('a'),
          new ScopeHelperIntersectPart01Test56StrTemp('b'),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test56StrTemp>(
          new ScopeHelperIntersectPart01Test56StrTemp('c'),
          new ScopeHelperIntersectPart01Test56StrTemp('d'),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test59LongTemp>(
          new ScopeHelperIntersectPart01Test59LongTemp(1),
          new ScopeHelperIntersectPart01Test59LongTemp(5),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test59LongTemp>(
          new ScopeHelperIntersectPart01Test59LongTemp(6),
          new ScopeHelperIntersectPart01Test59LongTemp(9223372036854775807),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test62DblTemp>(
          new ScopeHelperIntersectPart01Test62DblTemp(1.5),
          new ScopeHelperIntersectPart01Test62DblTemp(2.5),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test62DblTemp>(
          new ScopeHelperIntersectPart01Test62DblTemp(3.5),
          new ScopeHelperIntersectPart01Test62DblTemp(4.5),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test66ByteTemp>(
          new ScopeHelperIntersectPart01Test66ByteTemp(Int.toByte(1)),
          new ScopeHelperIntersectPart01Test66ByteTemp(Int.toByte(10)),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test66ByteTemp>(
          new ScopeHelperIntersectPart01Test66ByteTemp(Int.toByte(11)),
          new ScopeHelperIntersectPart01Test66ByteTemp(Int.toByte(120)),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_0200
     * @tc.name testScopeIsectThrows002
     * @tc.desc Verify ScopeHelper intersect throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectThrows002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test68ShortTemp>(
          new ScopeHelperIntersectPart01Test68ShortTemp(Int.toShort(1)),
          new ScopeHelperIntersectPart01Test68ShortTemp(Int.toShort(100)),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test68ShortTemp>(
          new ScopeHelperIntersectPart01Test68ShortTemp(Int.toShort(101)),
          new ScopeHelperIntersectPart01Test68ShortTemp(Int.toShort(2000)),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test70BigTemp>(
          new ScopeHelperIntersectPart01Test70BigTemp(10n),
          new ScopeHelperIntersectPart01Test70BigTemp(20n),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test70BigTemp>(
          new ScopeHelperIntersectPart01Test70BigTemp(21n),
          new ScopeHelperIntersectPart01Test70BigTemp(30n),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test72DateTemp>(
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(1000)),
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(2000)),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test72DateTemp>(
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(3000)),
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(4000)),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test75RegExpTemp>(
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('a', 'g')),
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('b', 'g')),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test75RegExpTemp>(
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('c', 'g')),
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('d', 'g')),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test78ErrTemp>(
          new ScopeHelperIntersectPart01Test78ErrTemp(new Error('a')),
          new ScopeHelperIntersectPart01Test78ErrTemp(new Error('z')),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test78ErrTemp>(
          new ScopeHelperIntersectPart01Test78ErrTemp(new Error('m')),
          new ScopeHelperIntersectPart01Test78ErrTemp(new Error('y')),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[m, y]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test78ErrTemp>(
          new ScopeHelperIntersectPart01Test78ErrTemp(new Error('a')),
          new ScopeHelperIntersectPart01Test78ErrTemp(new Error('b')),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test78ErrTemp>(
          new ScopeHelperIntersectPart01Test78ErrTemp(new Error('c')),
          new ScopeHelperIntersectPart01Test78ErrTemp(new Error('d')),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test80PointTemp>(
          new ScopeHelperIntersectPart01Test80PointTemp(1, 1),
          new ScopeHelperIntersectPart01Test80PointTemp(2, 2),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test80PointTemp>(
          new ScopeHelperIntersectPart01Test80PointTemp(5, 1),
          new ScopeHelperIntersectPart01Test80PointTemp(5, 5),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test83ArrTemp>(
          new ScopeHelperIntersectPart01Test83ArrTemp([1]),
          new ScopeHelperIntersectPart01Test83ArrTemp([1, 2]),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test83ArrTemp>(
          new ScopeHelperIntersectPart01Test83ArrTemp([7, 8, 9]),
          new ScopeHelperIntersectPart01Test83ArrTemp([7, 8, 9, 10]),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let m1: Map<string, int> = new Map<string, int>();
        m1.set('a', 1);
        let m2: Map<string, int> = new Map<string, int>();
        m2.set('a', 1);
        m2.set('b', 2);
        let m3: Map<string, int> = new Map<string, int>();
        m3.set('x', 1);
        m3.set('y', 2);
        m3.set('z', 3);
        let m4: Map<string, int> = new Map<string, int>();
        m4.set('x', 1);
        m4.set('y', 2);
        m4.set('z', 3);
        m4.set('w', 4);
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test85MapTemp>(
          new ScopeHelperIntersectPart01Test85MapTemp(m1),
          new ScopeHelperIntersectPart01Test85MapTemp(m2),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test85MapTemp>(
          new ScopeHelperIntersectPart01Test85MapTemp(m3),
          new ScopeHelperIntersectPart01Test85MapTemp(m4),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let strOut: Set<int> = new Set<int>();
        strOut.add(1);
        let strOutA: Set<int> = new Set<int>();
        strOutA.add(1);
        strOutA.add(2);
        let strOutB: Set<int> = new Set<int>();
        strOutB.add(7);
        strOutB.add(8);
        strOutB.add(9);
        let strOutC: Set<int> = new Set<int>();
        strOutC.add(7);
        strOutC.add(8);
        strOutC.add(9);
        strOutC.add(10);
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test88SetTemp>(
          new ScopeHelperIntersectPart01Test88SetTemp(strOut),
          new ScopeHelperIntersectPart01Test88SetTemp(strOutA),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test88SetTemp>(
          new ScopeHelperIntersectPart01Test88SetTemp(strOutB),
          new ScopeHelperIntersectPart01Test88SetTemp(strOutC),
        );
        try {
          scope.intersect(arg);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_0300
     * @tc.name testScopeIsectThrows003
     * @tc.desc Verify ScopeHelper intersect throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectThrows003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart02Test27TempInt(45),
            new ScopeHelperIntersectPart02Test27TempInt(45),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart02Test27TempInt(25),
            new ScopeHelperIntersectPart02Test27TempInt(28),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart02Test27TempInt(25),
            new ScopeHelperIntersectPart02Test27TempInt(25),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart02Test27TempInt(45),
            new ScopeHelperIntersectPart02Test27TempInt(60),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart02Test27TempInt(45),
            new ScopeHelperIntersectPart02Test27TempInt(35),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart02Test27TempInt(41),
            new ScopeHelperIntersectPart02Test27TempInt(41),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart02Test27TempInt(29),
            new ScopeHelperIntersectPart02Test27TempInt(29),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test56StrTemp>(
          new ScopeHelperIntersectPart01Test56StrTemp('a'),
          new ScopeHelperIntersectPart01Test56StrTemp('c'),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart01Test56StrTemp('d'),
            new ScopeHelperIntersectPart01Test56StrTemp('f'),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test59LongTemp>(
          new ScopeHelperIntersectPart01Test59LongTemp(1),
          new ScopeHelperIntersectPart01Test59LongTemp(5),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart01Test59LongTemp(6),
            new ScopeHelperIntersectPart01Test59LongTemp(9223372036854775807),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test62DblTemp>(
          new ScopeHelperIntersectPart01Test62DblTemp(1.5),
          new ScopeHelperIntersectPart01Test62DblTemp(3.5),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart01Test62DblTemp(4.5),
            new ScopeHelperIntersectPart01Test62DblTemp(6.5),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_0400
     * @tc.name testScopeIsectThrows004
     * @tc.desc Verify ScopeHelper intersect throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectThrows004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test66ByteTemp>(
          new ScopeHelperIntersectPart01Test66ByteTemp(-128),
          new ScopeHelperIntersectPart01Test66ByteTemp(0),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart01Test66ByteTemp(1),
            new ScopeHelperIntersectPart01Test66ByteTemp(127),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test68ShortTemp>(
          new ScopeHelperIntersectPart01Test68ShortTemp(-32768),
          new ScopeHelperIntersectPart01Test68ShortTemp(-1),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart01Test68ShortTemp(0),
            new ScopeHelperIntersectPart01Test68ShortTemp(32767),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test70BigTemp>(
          new ScopeHelperIntersectPart01Test70BigTemp(1n),
          new ScopeHelperIntersectPart01Test70BigTemp(5n),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart01Test70BigTemp(6n),
            new ScopeHelperIntersectPart01Test70BigTemp(9n),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test69TempChar>(
          new ScopeHelperIntersectPart02Test69TempChar(Int.toChar(97)),
          new ScopeHelperIntersectPart02Test69TempChar(Int.toChar(99)),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart02Test69TempChar(Int.toChar(100)),
            new ScopeHelperIntersectPart02Test69TempChar(Int.toChar(101)),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test72DateTemp>(
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(100)),
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(500)),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(600)),
            new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(800)),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test75RegExpTemp>(
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('a', 'g')),
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('c', 'g')),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('d', 'g')),
            new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('f', 'g')),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test79TempPoint>(
          new ScopeHelperIntersectPart02Test79TempPoint(1, 2),
          new ScopeHelperIntersectPart02Test79TempPoint(3, 4),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart02Test79TempPoint(5, 6),
            new ScopeHelperIntersectPart02Test79TempPoint(7, 8),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test82TempRect>(
          new ScopeHelperIntersectPart02Test82TempRect(10, 5),
          new ScopeHelperIntersectPart02Test82TempRect(20, 9),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart02Test82TempRect(30, 1),
            new ScopeHelperIntersectPart02Test82TempRect(40, 2),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test83ArrTemp>(
          new ScopeHelperIntersectPart01Test83ArrTemp([1, 2]),
          new ScopeHelperIntersectPart01Test83ArrTemp([1, 2, 3, 4, 5]),
        );
        try {
          scope.intersect(
            new ScopeHelperIntersectPart01Test83ArrTemp([1, 2, 3, 4, 5, 6]),
            new ScopeHelperIntersectPart01Test83ArrTemp([1, 2, 3, 4, 5, 6, 7, 8]),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let m1: Map<string, int> = new Map<string, int>();
        m1.set('k', 1);
        let m3: Map<string, int> = new Map<string, int>();
        m3.set('k1', 1);
        m3.set('k2', 2);
        m3.set('k3', 3);
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test85MapTemp>(
          new ScopeHelperIntersectPart01Test85MapTemp(m1),
          new ScopeHelperIntersectPart01Test85MapTemp(m3),
        );
        let m4: Map<string, int> = new Map<string, int>();
        m4.set('a', 1);
        m4.set('b', 2);
        m4.set('c', 3);
        m4.set('d', 4);
        let m5: Map<string, int> = new Map<string, int>();
        m5.set('a', 1);
        m5.set('b', 2);
        m5.set('c', 3);
        m5.set('d', 4);
        m5.set('e', 5);
        try {
          scope.intersect(
            new ScopeHelperIntersectPart01Test85MapTemp(m4),
            new ScopeHelperIntersectPart01Test85MapTemp(m5),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_0500
     * @tc.name testScopeIsectThrows005
     * @tc.desc Verify ScopeHelper intersect throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectThrows005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let strOut: Set<int> = new Set<int>();
        strOut.add(1);
        let strOutA: Set<int> = new Set<int>();
        strOutA.add(1);
        strOutA.add(2);
        strOutA.add(3);
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test88SetTemp>(
          new ScopeHelperIntersectPart01Test88SetTemp(strOut),
          new ScopeHelperIntersectPart01Test88SetTemp(strOutA),
        );
        let strOutC: Set<int> = new Set<int>();
        strOutC.add(1);
        strOutC.add(2);
        strOutC.add(3);
        strOutC.add(4);
        let strOutD: Set<int> = new Set<int>();
        strOutD.add(1);
        strOutD.add(2);
        strOutD.add(3);
        strOutD.add(4);
        strOutD.add(5);
        try {
          scope.intersect(
            new ScopeHelperIntersectPart01Test88SetTemp(strOutC),
            new ScopeHelperIntersectPart01Test88SetTemp(strOutD),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(30),
            new ScopeHelperIntersectPart03TestMissingTemperature(40),
          );
          let actual = range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(40),
              new ScopeHelperIntersectPart03TestMissingTemperature(50),
            ),
          );
          let actualA = range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(40),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          );
          let actualB: string = actual.toString();
          let expected = actualA.toString();
          expect(actualB).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(41),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(30),
            new ScopeHelperIntersectPart03TestMissingTemperature(40),
          );
          let actual = range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(40),
              new ScopeHelperIntersectPart03TestMissingTemperature(40),
            ),
          );
          let actualA = range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(40),
            new ScopeHelperIntersectPart03TestMissingTemperature(40),
          );
          let actualB = actual.getLower().getTemp();
          let expected = actualA.getLower().getTemp();
          expect(actualB).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(30),
            new ScopeHelperIntersectPart03TestMissingTemperature(40),
          );
          let actual = range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(40),
              new ScopeHelperIntersectPart03TestMissingTemperature(40),
            ),
          );
          let actualA = range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(40),
            new ScopeHelperIntersectPart03TestMissingTemperature(40),
          );
          let actualB: string = actual.toString();
          let expected = actualA.toString();
          expect(actualB).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(41),
              new ScopeHelperIntersectPart03TestMissingTemperature(50),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let actualB = range.getLower().getTemp();
        let expected: int = 30;
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(41),
              new ScopeHelperIntersectPart03TestMissingTemperature(50),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let actualB = range.getUpper().getTemp();
        let expected: int = 40;
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(41),
              new ScopeHelperIntersectPart03TestMissingTemperature(50),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let actualB: string = range.toString();
        let expected: string = '[30, 40]';
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(50),
              new ScopeHelperIntersectPart03TestMissingTemperature(60),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let actualB = range.getLower().getTemp();
        let expected: int = 30;
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(41),
              new ScopeHelperIntersectPart03TestMissingTemperature(50),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let r = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
            new ScopeHelperIntersectPart03TestMissingTemperature(39),
          ),
        );
        let actualB: string = r.toString();
        let expected: string = '[35, 39]';
        expect(actualB).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_0600
     * @tc.name testScopeIsectThrows006
     * @tc.desc Verify ScopeHelper intersect throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectThrows006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lower = new ScopeHelperIntersectPart03TestMissingTemperature(30);
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          lower,
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(41),
              new ScopeHelperIntersectPart03TestMissingTemperature(50),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        lower.setTemp(66);
        let actualB = range.getLower().getTemp();
        let expected: int = 66;
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let other = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(41),
          new ScopeHelperIntersectPart03TestMissingTemperature(50),
        );
        try {
          range.intersect(other);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let actualB = other.getLower().getTemp();
        let expected: int = 41;
        expect(actualB).assertEqual(expected);
        let actualC = other.getUpper().getTemp();
        let expectedA: int = 50;
        expect(actualC).assertEqual(expectedA);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(41),
              new ScopeHelperIntersectPart03TestMissingTemperature(50),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let r = range.expand(
          new ScopeHelperIntersectPart03TestMissingTemperature(10),
          new ScopeHelperIntersectPart03TestMissingTemperature(50),
        );
        let actualB: string = r.toString();
        let expected: string = '[10, 50]';
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(41),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let r = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
            new ScopeHelperIntersectPart03TestMissingTemperature(39),
          ),
        );
        let actualB: string = r.toString();
        let expected: string = '[35, 39]';
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(41),
              new ScopeHelperIntersectPart03TestMissingTemperature(50),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let r = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(39),
        );
        let actualB: string = r.toString();
        let expected: string = '[35, 39]';
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(41),
              new ScopeHelperIntersectPart03TestMissingTemperature(50),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let r = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(39),
        );
        let actualB = r.getLower().getTemp();
        let expected: int = 35;
        expect(actualB).assertEqual(expected);

      }
      {
        let other = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(41),
          new ScopeHelperIntersectPart03TestMissingTemperature(50),
        );
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(other);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let r = other.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(45),
            new ScopeHelperIntersectPart03TestMissingTemperature(60),
          ),
        );
        let actualB: string = r.toString();
        let expected: string = '[45, 50]';
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(41),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }
        let actualB = range.getLower().getTemp();
        let expected: int = 30;
        expect(actualB).assertEqual(expected);
        let actualC = range.getUpper().getTemp();
        let expectedA: int = 40;
        expect(actualC).assertEqual(expectedA);

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingStrWrap>(
            new ScopeHelperIntersectPart03TestMissingStrWrap('a'),
            new ScopeHelperIntersectPart03TestMissingStrWrap('z'),
          );
          let actual = range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingStrWrap>(
              new ScopeHelperIntersectPart03TestMissingStrWrap('z'),
              new ScopeHelperIntersectPart03TestMissingStrWrap('z'),
            ),
          );
          let actualA = range.intersect(
            new ScopeHelperIntersectPart03TestMissingStrWrap('z'),
            new ScopeHelperIntersectPart03TestMissingStrWrap('z'),
          );
          let actualB: string = actual.toString();
          let expected = actualA.toString();
          expect(actualB).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(30),
            new ScopeHelperIntersectPart03TestMissingTemperature(40),
          );
          let actual = range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(40),
              new ScopeHelperIntersectPart03TestMissingTemperature(40),
            ),
          );
          let actualA = range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(40),
            new ScopeHelperIntersectPart03TestMissingTemperature(40),
          );
          let actualB = actual.getUpper().getTemp();
          let expected = actualA.getUpper().getTemp();
          expect(actualB).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_0700
     * @tc.name testScopeIsectThrows007
     * @tc.desc Verify ScopeHelper intersect throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectThrows007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(-2147483648),
            new ScopeHelperIntersectPart03TestMissingTemperature(-2147483647),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("Error");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(2147483646),
            new ScopeHelperIntersectPart03TestMissingTemperature(2147483647),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("Error");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        try {
          range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("Error");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap>(
          new ScopeHelperIntersectPart03TestMissingLongWrap(30),
          new ScopeHelperIntersectPart03TestMissingLongWrap(40),
        );
        try {
          range.intersect(
            new ScopeHelperIntersectPart03TestMissingLongWrap(9223372036854775806),
            new ScopeHelperIntersectPart03TestMissingLongWrap(9223372036854775807),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("Error");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_0800
     * @tc.name testScopeIsectBigInt001
     * @tc.desc Verify ScopeHelper intersect with BigInt bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectBigInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test70BigTemp>(
          new ScopeHelperIntersectPart01Test70BigTemp(10n),
          new ScopeHelperIntersectPart01Test70BigTemp(40n),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test70BigTemp>(
          new ScopeHelperIntersectPart01Test70BigTemp(20n),
          new ScopeHelperIntersectPart01Test70BigTemp(30n),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[20, 30]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_0900
     * @tc.name testScopeIsectDate001
     * @tc.desc Verify ScopeHelper intersect with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-2147483648),
          new ScopeHelperExpandPart03TestMissingTemperature(2147483647),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(0),
          new ScopeHelperExpandPart03TestMissingTemperature(100),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[0, 100]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-2147483648),
          new ScopeHelperExpandPart03TestMissingTemperature(2147483647),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-5),
          new ScopeHelperExpandPart03TestMissingTemperature(5),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[-5, 5]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-2147483648),
          new ScopeHelperExpandPart03TestMissingTemperature(2147483647),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(0),
          new ScopeHelperExpandPart03TestMissingTemperature(2147483647),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[0, 2147483647]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test72DateTemp>(
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(1000)),
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(5000)),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test72DateTemp>(
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(2000)),
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(4000)),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[2000, 4000]';
        expect(actual).assertEqual(expected);

      }
      {
        let thisLower = new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(0));
        let argLower = new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(0));
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test72DateTemp>(
          thisLower,
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(5000)),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test72DateTemp>(
          argLower,
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(3000)),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[0, 3000]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test72DateTemp>(
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(100)),
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(500)),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(200)),
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(400)),
        );
        let actual: string = result.toString();
        let expected: string = '[200, 400]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test72DateTemp>(
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(100)),
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(500)),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(200)),
          new ScopeHelperIntersectPart01Test72DateTemp(Utils.dateFromTime(500)),
        );
        let actual: string = result.toString();
        let expected: string = '[200, 500]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap>(
          new ScopeHelperIntersectPart03TestMissingLongWrap(-9223372036854775807 - 1),
          new ScopeHelperIntersectPart03TestMissingLongWrap(9223372036854775807),
        );
        let result = range.intersect(
          new ScopeHelperIntersectPart03TestMissingLongWrap(-9223372036854775807),
          new ScopeHelperIntersectPart03TestMissingLongWrap(9223372036854775806),
        );
        expect(result.toString()).assertEqual("[-9223372036854775807, 9223372036854775806]");

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap>(
          new ScopeHelperIntersectPart03TestMissingLongWrap(-9223372036854775807 - 1),
          new ScopeHelperIntersectPart03TestMissingLongWrap(9223372036854775807),
        );
        let other = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap>(
          new ScopeHelperIntersectPart03TestMissingLongWrap(-9223372036854775807 - 1),
          new ScopeHelperIntersectPart03TestMissingLongWrap(9223372036854775807),
        );
        let result = range.intersect(other);
        expect(result.toString()).assertEqual("[-9223372036854775808, 9223372036854775807]");

      }
      {
        let range = new util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap>(
          new ScopeHelperClampPart03TestMissingDoubleWrap(9007199254740991),
          new ScopeHelperClampPart03TestMissingDoubleWrap(9007199254740992),
        );
        let result = range.intersect(
          new ScopeHelperClampPart03TestMissingDoubleWrap(9007199254740991),
          new ScopeHelperClampPart03TestMissingDoubleWrap(9007199254740992),
        );
        expect(result.getLower().getVal()).assertEqual(9007199254740991);
        expect(result.getUpper().getVal()).assertEqual(9007199254740992);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_1000
     * @tc.name testScopeIsectDate002
     * @tc.desc Verify ScopeHelper intersect with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectDate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap>(
          new ScopeHelperClampPart03TestMissingDoubleWrap(1.5),
          new ScopeHelperClampPart03TestMissingDoubleWrap(9007199254740992),
        );
        let result = range.intersect(
          new ScopeHelperClampPart03TestMissingDoubleWrap(1.5),
          new ScopeHelperClampPart03TestMissingDoubleWrap(9007199254740991),
        );
        expect(result.getLower().getVal()).assertEqual(1.5);
        expect(result.getUpper().getVal()).assertEqual(9007199254740991);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_1100
     * @tc.name testScopeIsectStr001
     * @tc.desc Verify ScopeHelper intersect with string bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectStr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test56StrTemp>(
          new ScopeHelperIntersectPart01Test56StrTemp('apple'),
          new ScopeHelperIntersectPart01Test56StrTemp('orange'),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test56StrTemp>(
          new ScopeHelperIntersectPart01Test56StrTemp('banana'),
          new ScopeHelperIntersectPart01Test56StrTemp('pear'),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[banana, orange]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_1200
     * @tc.name testScopeIsectFloatDouble001
     * @tc.desc Verify ScopeHelper intersect with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectFloatDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test62DblTemp>(
          new ScopeHelperIntersectPart01Test62DblTemp(1.5),
          new ScopeHelperIntersectPart01Test62DblTemp(3.25),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test62DblTemp>(
          new ScopeHelperIntersectPart01Test62DblTemp(2.25),
          new ScopeHelperIntersectPart01Test62DblTemp(4.75),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[2.25, 3.25]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test62DblTemp>(
          new ScopeHelperIntersectPart01Test62DblTemp(0.5),
          new ScopeHelperIntersectPart01Test62DblTemp(4.5),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test62DblTemp(2.5),
          new ScopeHelperIntersectPart01Test62DblTemp(5.5),
        );
        let actual: string = result.toString();
        let expected: string = '[2.5, 4.5]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test62DblTemp>(
          new ScopeHelperIntersectPart01Test62DblTemp(1.5),
          new ScopeHelperIntersectPart01Test62DblTemp(3.5),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test62DblTemp(0.5),
          new ScopeHelperIntersectPart01Test62DblTemp(2.5),
        );
        let actual: string = result.toString();
        let expected: string = '[1.5, 2.5]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test62DblTemp>(
          new ScopeHelperIntersectPart01Test62DblTemp(-3.5),
          new ScopeHelperIntersectPart01Test62DblTemp(-1.5),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test62DblTemp(-2.5),
          new ScopeHelperIntersectPart01Test62DblTemp(2.5),
        );
        let actual: string = result.toString();
        let expected: string = '[-2.5, -1.5]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap>(
          new ScopeHelperClampPart03TestMissingDoubleWrap(1.5),
          new ScopeHelperClampPart03TestMissingDoubleWrap(9.5),
        );
        let actual = range.intersect(
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap>(
            new ScopeHelperClampPart03TestMissingDoubleWrap(2.5),
            new ScopeHelperClampPart03TestMissingDoubleWrap(8.5),
          ),
        );
        let actualA = range.intersect(
          new ScopeHelperClampPart03TestMissingDoubleWrap(2.5),
          new ScopeHelperClampPart03TestMissingDoubleWrap(8.5),
        );
        let actualB: string = actual.toString();
        let expected = actualA.toString();
        expect(actualB).assertEqual("[2.5, 8.5]");
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap>(
          new ScopeHelperClampPart03TestMissingDoubleWrap(1.5),
          new ScopeHelperClampPart03TestMissingDoubleWrap(9.5),
        );
        let actual = range.intersect(
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap>(
            new ScopeHelperClampPart03TestMissingDoubleWrap(2.5),
            new ScopeHelperClampPart03TestMissingDoubleWrap(8.5),
          ),
        );
        let actualA = range.intersect(
          new ScopeHelperClampPart03TestMissingDoubleWrap(2.5),
          new ScopeHelperClampPart03TestMissingDoubleWrap(8.5),
        );
        let actualB = actual.getUpper().getVal();
        let expected = actualA.getUpper().getVal();
        expect(actualB).assertEqual(8.5);
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap>(
          new ScopeHelperClampPart03TestMissingDoubleWrap(-9.5),
          new ScopeHelperClampPart03TestMissingDoubleWrap(-1.5),
        );
        let actual = range.intersect(
          new util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap>(
            new ScopeHelperClampPart03TestMissingDoubleWrap(-8.5),
            new ScopeHelperClampPart03TestMissingDoubleWrap(-2.5),
          ),
        );
        let actualA = range.intersect(
          new ScopeHelperClampPart03TestMissingDoubleWrap(-8.5),
          new ScopeHelperClampPart03TestMissingDoubleWrap(-2.5),
        );
        let actualB: string = actual.toString();
        let expected = actualA.toString();
        expect(actualB).assertEqual("[-8.5, -2.5]");
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap>(
          new ScopeHelperClampPart03TestMissingDoubleWrap(1.0),
          new ScopeHelperClampPart03TestMissingDoubleWrap(2.0),
        );
        let count = 0;
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperClampPart03TestMissingDoubleWrap>(
              new ScopeHelperClampPart03TestMissingDoubleWrap(3.0),
              new ScopeHelperClampPart03TestMissingDoubleWrap(4.0),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          count++;
        }
        try {
          range.intersect(
            new ScopeHelperClampPart03TestMissingDoubleWrap(3.0),
            new ScopeHelperClampPart03TestMissingDoubleWrap(4.0),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          count++;
        }
        expect(count).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_1300
     * @tc.name testScopeIsectLong001
     * @tc.desc Verify ScopeHelper intersect with long bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectLong001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test59LongTemp>(
          new ScopeHelperIntersectPart01Test59LongTemp(1),
          new ScopeHelperIntersectPart01Test59LongTemp(9000000000000000),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test59LongTemp>(
          new ScopeHelperIntersectPart01Test59LongTemp(5000000000000000),
          new ScopeHelperIntersectPart01Test59LongTemp(9000000000000000),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[5000000000000000, 9000000000000000]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_1400
     * @tc.name testScopeIsectInt001
     * @tc.desc Verify ScopeHelper intersect with int bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(-2147483648),
          new ScopeHelperIntersectPart03TestMissingTemperature(2147483647),
        );
        let result = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        expect(result.getLower().getTemp()).assertEqual(30);
        expect(result.getUpper().getTemp()).assertEqual(40);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(-2147483648),
          new ScopeHelperIntersectPart03TestMissingTemperature(2147483647),
        );
        let result = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(-2147483647),
          new ScopeHelperIntersectPart03TestMissingTemperature(2147483646),
        );
        expect(result.getLower().getTemp()).assertEqual(-2147483647);
        expect(result.getUpper().getTemp()).assertEqual(2147483646);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(2147483646),
          new ScopeHelperIntersectPart03TestMissingTemperature(2147483647),
        );
        let result = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(2147483646),
          new ScopeHelperIntersectPart03TestMissingTemperature(2147483647),
        );
        expect(result.getLower().getTemp()).assertEqual(2147483646);
        expect(result.getUpper().getTemp()).assertEqual(2147483647);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_1500
     * @tc.name testScopeIsectCustom001
     * @tc.desc Verify ScopeHelper intersect with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectCustom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(45),
        );
        let result = scope.intersect(arg);
        let second: util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature> = result.intersect(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(38),
            new ScopeHelperExpandPart03TestMissingTemperature(50),
          ),
        );
        let actual: string = second.toString();
        let expected: string = '[38, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test80PointTemp>(
          new ScopeHelperIntersectPart01Test80PointTemp(1, 1),
          new ScopeHelperIntersectPart01Test80PointTemp(2, 3),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test80PointTemp>(
          new ScopeHelperIntersectPart01Test80PointTemp(0, 3),
          new ScopeHelperIntersectPart01Test80PointTemp(2, 2),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[(0,3), (2,2)]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        let eps = new ScopeHelperIntersectPart02Test7Endpoints();
        let result = scope.intersect(eps.lower, eps.upper);
        let actual: string = result.toString();
        let expected: string = '[35, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test79TempPoint>(
          new ScopeHelperIntersectPart02Test79TempPoint(1, 2),
          new ScopeHelperIntersectPart02Test79TempPoint(3, 4),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart02Test79TempPoint(2, 3),
          new ScopeHelperIntersectPart02Test79TempPoint(4, 5),
        );
        let actual: string = result.toString();
        let expected: string = '[5, 7]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test79TempPoint>(
          new ScopeHelperIntersectPart02Test79TempPoint(1, 2),
          new ScopeHelperIntersectPart02Test79TempPoint(3, 4),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart02Test79TempPoint(1, 2),
          new ScopeHelperIntersectPart02Test79TempPoint(4, 5),
        );
        let actual: string = result.toString();
        let expected: string = '[3, 7]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_1600
     * @tc.name testScopeIsectSpecial001
     * @tc.desc Verify ScopeHelper intersect with special format content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectSpecial001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let sharedLower = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          sharedLower,
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          sharedLower,
          new ScopeHelperExpandPart03TestMissingTemperature(35),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[30, 35]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let rangeFir = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(39),
        );
        let actual = range.intersect(rangeFir);
        let actualA = range.intersect(rangeFir);
        actual.getLower().setTemp(73);
        let actualB = actualA.getLower().getTemp();
        let expected: int = 73;
        expect(actualB).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_1700
     * @tc.name testScopeIsectBoundary001
     * @tc.desc Verify ScopeHelper intersect with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test59LongTemp>(
          new ScopeHelperIntersectPart01Test59LongTemp(1),
          new ScopeHelperIntersectPart01Test59LongTemp(9223372036854775807),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test59LongTemp(9223372036854775806),
          new ScopeHelperIntersectPart01Test59LongTemp(9223372036854775807),
        );
        let actual: string = result.toString();
        let expected: string = '[9223372036854775806, 9223372036854775807]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test59LongTemp>(
          new ScopeHelperIntersectPart01Test59LongTemp(-9223372036854775808),
          new ScopeHelperIntersectPart01Test59LongTemp(0),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test59LongTemp(-9223372036854775808),
          new ScopeHelperIntersectPart01Test59LongTemp(-5),
        );
        let actual: string = result.toString();
        let expected: string = '[-9223372036854775808, -5]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test70BigTemp>(
          new ScopeHelperIntersectPart01Test70BigTemp(1n),
          new ScopeHelperIntersectPart01Test70BigTemp(9223372036854775807n),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test70BigTemp(9223372036854775806n),
          new ScopeHelperIntersectPart01Test70BigTemp(9223372036854775807n),
        );
        let actual: string = result.toString();
        let expected: string = '[9223372036854775806, 9223372036854775807]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap>(
          new ScopeHelperIntersectPart03TestMissingLongWrap(10),
          new ScopeHelperIntersectPart03TestMissingLongWrap(20),
        );
        let count = 0;
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap>(
              new ScopeHelperIntersectPart03TestMissingLongWrap(30),
              new ScopeHelperIntersectPart03TestMissingLongWrap(40),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          count++;
        }
        try {
          range.intersect(
            new ScopeHelperIntersectPart03TestMissingLongWrap(30),
            new ScopeHelperIntersectPart03TestMissingLongWrap(40),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          count++;
        }
        expect(count).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_1800
     * @tc.name testScopeIsectConsistency001
     * @tc.desc Verify ScopeHelper intersect state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let first = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        ).intersect(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(35),
            new ScopeHelperExpandPart03TestMissingTemperature(45),
          ),
        );
        let result = first.intersect(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(32),
            new ScopeHelperExpandPart03TestMissingTemperature(38),
          ),
        );
        let actual: string = result.toString();
        let expected: string = '[35, 38]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(45),
        );
        let result = scope.intersect(arg);
        let actual = result.getLower().getTemp();
        let expected: int = 35;
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(45),
        );
        let result = scope.intersect(arg);
        let actual = result.getUpper().getTemp();
        let expected: int = 40;
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(45),
        );
        let actualA = scope.intersect(arg);
        let actualB = arg.intersect(scope);
        let actual: string = actualA.toString();
        let expected = actualB.toString();
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(38),
          new ScopeHelperExpandPart03TestMissingTemperature(39),
        );
        let result = scope.intersect(arg);
        let actual = result.getLower().getTemp();
        let expected: int = 38;
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(25),
          new ScopeHelperExpandPart03TestMissingTemperature(35),
        );
        let result = scope.intersect(arg);
        let actual = result.getUpper().getTemp();
        let expected: int = 35;
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(45),
        );
        let actualA = scope.intersect(arg);
        let result = actualA.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[35, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        let result = scope
          .intersect(new ScopeHelperIntersectPart02Test27TempInt(35), new ScopeHelperIntersectPart02Test27TempInt(45))
          .intersect(new ScopeHelperIntersectPart02Test27TempInt(38), new ScopeHelperIntersectPart02Test27TempInt(42));
        let actual: string = result.toString();
        let expected: string = '[38, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart02Test27TempInt(35),
          new ScopeHelperIntersectPart02Test27TempInt(45),
        );
        expect(result === scope).assertFalse();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let actual = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
            new ScopeHelperIntersectPart03TestMissingTemperature(39),
          ),
        );
        let strOut = actual.toString();
        expect(strOut).assertEqual("[35, 39]");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_1900
     * @tc.name testScopeIsectConsistency002
     * @tc.desc Verify ScopeHelper intersect state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectConsistency002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
            new ScopeHelperIntersectPart03TestMissingTemperature(39),
          ),
        );
        let actualB = r.getUpper().getTemp();
        let expected: int = 39;
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(39),
        );
        let actualB = r.getLower().getTemp();
        let expected: int = 35;
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(25),
          new ScopeHelperIntersectPart03TestMissingTemperature(45),
        );
        let actualB: string = r.toString();
        let expected: string = '[30, 40]';
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(25),
            new ScopeHelperIntersectPart03TestMissingTemperature(45),
          ),
        );
        let actualB: string = r.toString();
        let expected: string = '[30, 40]';
        expect(actualB).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_2000
     * @tc.name testScopeIsectBasic001
     * @tc.desc Verify ScopeHelper intersect with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lower = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let upper = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lower, upper);
        let argLower = new ScopeHelperExpandPart03TestMissingTemperature(35);
        let argUpper = new ScopeHelperExpandPart03TestMissingTemperature(45);
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(argLower, argUpper);
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[35, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(39),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[35, 39]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(32),
          new ScopeHelperExpandPart03TestMissingTemperature(38),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[32, 38]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[35, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-40),
          new ScopeHelperExpandPart03TestMissingTemperature(-30),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-35),
          new ScopeHelperExpandPart03TestMissingTemperature(-25),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[-35, -30]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-10),
          new ScopeHelperExpandPart03TestMissingTemperature(10),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(0),
          new ScopeHelperExpandPart03TestMissingTemperature(20),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[0, 10]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(39),
        );
        scope.intersect(arg);
        let actual: string = scope.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(39),
        );
        scope.intersect(arg);
        let actual: string = arg.toString();
        let expected: string = '[35, 39]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = scope.intersect(scope);
        let actual: string = result.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let actualA = scope.intersect(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(35),
            new ScopeHelperExpandPart03TestMissingTemperature(45),
          ),
        );
        let actualB = scope.intersect(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(25),
            new ScopeHelperExpandPart03TestMissingTemperature(35),
          ),
        );
        let actual: string = actualA.toString();
        let expected: string = '[35, 40]';
        expect(actual).assertEqual(expected);
        let actualC: string = actualB.toString();
        let expectedA: string = '[30, 35]';
        expect(actualC).assertEqual(expectedA);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_2100
     * @tc.name testScopeIsectBasic002
     * @tc.desc Verify ScopeHelper intersect with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let argLower = new ScopeHelperExpandPart03TestMissingTemperature(35);
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          argLower,
          new ScopeHelperExpandPart03TestMissingTemperature(39),
        );
        let result = scope.intersect(arg);
        let actual = result.getLower();
        let expected = argLower;
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test66ByteTemp>(
          new ScopeHelperIntersectPart01Test66ByteTemp(Int.toByte(1)),
          new ScopeHelperIntersectPart01Test66ByteTemp(Int.toByte(100)),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test66ByteTemp>(
          new ScopeHelperIntersectPart01Test66ByteTemp(Int.toByte(10)),
          new ScopeHelperIntersectPart01Test66ByteTemp(Int.toByte(120)),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[10, 100]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test68ShortTemp>(
          new ScopeHelperIntersectPart01Test68ShortTemp(Int.toShort(1)),
          new ScopeHelperIntersectPart01Test68ShortTemp(Int.toShort(1000)),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test68ShortTemp>(
          new ScopeHelperIntersectPart01Test68ShortTemp(Int.toShort(500)),
          new ScopeHelperIntersectPart01Test68ShortTemp(Int.toShort(2000)),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[500, 1000]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test75RegExpTemp>(
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('a', 'g')),
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('z', 'g')),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test75RegExpTemp>(
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('m', 'g')),
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('y', 'g')),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[/m/g, /y/g]';
        expect(actual).assertEqual(expected);

      }
      {
        let thisLower = new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('a', 'g'));
        let argLower = new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('a', 'g'));
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test75RegExpTemp>(
          thisLower,
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('z', 'g')),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test75RegExpTemp>(
          argLower,
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('y', 'g')),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[/a/g, /y/g]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test83ArrTemp>(
          new ScopeHelperIntersectPart01Test83ArrTemp([1, 2]),
          new ScopeHelperIntersectPart01Test83ArrTemp([1, 2, 3, 4, 5]),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test83ArrTemp>(
          new ScopeHelperIntersectPart01Test83ArrTemp([7, 8, 9]),
          new ScopeHelperIntersectPart01Test83ArrTemp([7, 8, 9, 10]),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[3, 4]';
        expect(actual).assertEqual(expected);

      }
      {
        let m1: Map<string, int> = new Map<string, int>();
        m1.set('a', 1);
        let m4: Map<string, int> = new Map<string, int>();
        m4.set('a', 1);
        m4.set('b', 2);
        m4.set('c', 3);
        m4.set('d', 4);
        let m2: Map<string, int> = new Map<string, int>();
        m2.set('x', 1);
        m2.set('y', 2);
        let m3: Map<string, int> = new Map<string, int>();
        m3.set('x', 1);
        m3.set('y', 2);
        m3.set('z', 3);
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test85MapTemp>(
          new ScopeHelperIntersectPart01Test85MapTemp(m1),
          new ScopeHelperIntersectPart01Test85MapTemp(m4),
        );
        let arg = new util.ScopeHelper<ScopeHelperIntersectPart01Test85MapTemp>(
          new ScopeHelperIntersectPart01Test85MapTemp(m2),
          new ScopeHelperIntersectPart01Test85MapTemp(m3),
        );
        let result = scope.intersect(arg);
        let actual: string = result.toString();
        let expected: string = '[2, 3]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart02Test27TempInt(36),
          new ScopeHelperIntersectPart02Test27TempInt(48),
        );
        let actual: string = result.toString();
        let expected: string = '[36, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test56StrTemp>(
          new ScopeHelperIntersectPart01Test56StrTemp('a'),
          new ScopeHelperIntersectPart01Test56StrTemp('c'),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test56StrTemp('b'),
          new ScopeHelperIntersectPart01Test56StrTemp('d'),
        );
        let actual: string = result.toString();
        let expected: string = '[b, c]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart02Test27TempInt(25),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        let actual: string = result.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_2200
     * @tc.name testScopeIsectBasic003
     * @tc.desc Verify ScopeHelper intersect with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(-40),
          new ScopeHelperIntersectPart02Test27TempInt(-30),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart02Test27TempInt(-45),
          new ScopeHelperIntersectPart02Test27TempInt(-35),
        );
        let actual: string = result.toString();
        let expected: string = '[-40, -35]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        let actualB = scope.intersect(
          new ScopeHelperIntersectPart02Test27TempInt(35),
          new ScopeHelperIntersectPart02Test27TempInt(39),
        );
        let actualA = scope.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
            new ScopeHelperIntersectPart02Test27TempInt(35),
            new ScopeHelperIntersectPart02Test27TempInt(39),
          ),
        );
        let actual: string = actualB.toString();
        let expected = actualA.toString();
        expect(actual).assertEqual('[35, 39]');
        expect(expected).assertEqual('[35, 39]');

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart02Test27TempInt(32),
          new ScopeHelperIntersectPart02Test27TempInt(38),
        );
        let actual: string = result.toString();
        let expected: string = '[32, 38]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart02Test27TempInt(35),
          new ScopeHelperIntersectPart02Test27TempInt(39),
        );
        expect(result.toString()).assertEqual('[35, 39]');
        expect(scope.toString()).assertEqual('[30, 40]');

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test27TempInt>(
          new ScopeHelperIntersectPart02Test27TempInt(30),
          new ScopeHelperIntersectPart02Test27TempInt(40),
        );
        let result = scope
          .intersect(new ScopeHelperIntersectPart02Test27TempInt(35), new ScopeHelperIntersectPart02Test27TempInt(39))
          .intersect(new ScopeHelperIntersectPart02Test27TempInt(36), new ScopeHelperIntersectPart02Test27TempInt(37));
        let actual: string = result.toString();
        let expected: string = '[36, 37]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test66ByteTemp>(
          new ScopeHelperIntersectPart01Test66ByteTemp(-128),
          new ScopeHelperIntersectPart01Test66ByteTemp(127),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test66ByteTemp(0),
          new ScopeHelperIntersectPart01Test66ByteTemp(100),
        );
        let actual: string = result.toString();
        let expected: string = '[0, 100]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test66ByteTemp>(
          new ScopeHelperIntersectPart01Test66ByteTemp(-128),
          new ScopeHelperIntersectPart01Test66ByteTemp(127),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test66ByteTemp(126),
          new ScopeHelperIntersectPart01Test66ByteTemp(127),
        );
        let actual: string = result.toString();
        let expected: string = '[126, 127]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test68ShortTemp>(
          new ScopeHelperIntersectPart01Test68ShortTemp(-32768),
          new ScopeHelperIntersectPart01Test68ShortTemp(32767),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test68ShortTemp(0),
          new ScopeHelperIntersectPart01Test68ShortTemp(1000),
        );
        let actual: string = result.toString();
        let expected: string = '[0, 1000]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test70BigTemp>(
          new ScopeHelperIntersectPart01Test70BigTemp(1n),
          new ScopeHelperIntersectPart01Test70BigTemp(5n),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test70BigTemp(3n),
          new ScopeHelperIntersectPart01Test70BigTemp(7n),
        );
        let actual: string = result.toString();
        let expected: string = '[3, 5]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test66TempBool>(
          new ScopeHelperIntersectPart02Test66TempBool(false),
          new ScopeHelperIntersectPart02Test66TempBool(true),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart02Test66TempBool(false),
          new ScopeHelperIntersectPart02Test66TempBool(true),
        );
        let actual: string = result.toString();
        let expected: string = '[false, true]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_2300
     * @tc.name testScopeIsectBasic004
     * @tc.desc Verify ScopeHelper intersect with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test75RegExpTemp>(
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('a', 'g')),
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('c', 'g')),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('b', 'g')),
          new ScopeHelperIntersectPart01Test75RegExpTemp(new RegExp('d', 'g')),
        );
        let actual: string = result.toString();
        let expected: string = '[/b/g, /c/g]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart02Test82TempRect>(
          new ScopeHelperIntersectPart02Test82TempRect(10, 5),
          new ScopeHelperIntersectPart02Test82TempRect(20, 9),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart02Test82TempRect(15, 1),
          new ScopeHelperIntersectPart02Test82TempRect(25, 2),
        );
        let actual: string = result.toString();
        let expected: string = '[15, 20]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test83ArrTemp>(
          new ScopeHelperIntersectPart01Test83ArrTemp([1, 2]),
          new ScopeHelperIntersectPart01Test83ArrTemp([1, 2, 3, 4, 5]),
        );
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test83ArrTemp([1, 2, 3]),
          new ScopeHelperIntersectPart01Test83ArrTemp([1, 2, 3, 4]),
        );
        let actual: string = result.toString();
        let expected: string = '[3, 4]';
        expect(actual).assertEqual(expected);

      }
      {
        let m1: Map<string, int> = new Map<string, int>();
        m1.set('k', 1);
        let m3: Map<string, int> = new Map<string, int>();
        m3.set('k1', 1);
        m3.set('k2', 2);
        m3.set('k3', 3);
        let scope = new util.ScopeHelper<ScopeHelperIntersectPart01Test85MapTemp>(
          new ScopeHelperIntersectPart01Test85MapTemp(m1),
          new ScopeHelperIntersectPart01Test85MapTemp(m3),
        );
        let m2: Map<string, int> = new Map<string, int>();
        m2.set('a', 1);
        m2.set('b', 2);
        let m4: Map<string, int> = new Map<string, int>();
        m4.set('a', 1);
        m4.set('b', 2);
        m4.set('c', 3);
        m4.set('d', 4);
        let result = scope.intersect(
          new ScopeHelperIntersectPart01Test85MapTemp(m2),
          new ScopeHelperIntersectPart01Test85MapTemp(m4),
        );
        let actual: string = result.toString();
        let expected: string = '[2, 3]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let actual = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
            new ScopeHelperIntersectPart03TestMissingTemperature(39),
          ),
        );
        let actualA = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(39),
        );
        let actualB: string = actual.toString();
        let expected = actualA.toString();
        expect(actualB).assertEqual("[35, 39]");
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
            new ScopeHelperIntersectPart03TestMissingTemperature(39),
          ),
        );
        r.getLower().setTemp(11);
        let actualB = range.getLower().getTemp();
        let expected: int = 30;
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(39),
        );
        r.getLower().setTemp(22);
        let actualB = range.getLower().getTemp();
        let expected: int = 30;
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(range);
        let actualB: string = r.toString();
        let expected: string = '[30, 40]';
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let mid = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          ),
        );
        let r = mid.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(33),
          new ScopeHelperIntersectPart03TestMissingTemperature(37),
        );
        let actualB: string = r.toString();
        let expected: string = '[35, 37]';
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let mid = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(50),
        );
        let r = mid.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(33),
            new ScopeHelperIntersectPart03TestMissingTemperature(37),
          ),
        );
        let actualB: string = r.toString();
        let expected: string = '[35, 37]';
        expect(actualB).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_2400
     * @tc.name testScopeIsectBasic005
     * @tc.desc Verify ScopeHelper intersect with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectBasic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let actual = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          ),
        );
        let actualA = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(50),
        );
        let actualB = actual.getLower().getTemp();
        let expected = actualA.getLower().getTemp();
        expect(actualB).assertEqual(35);
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(50),
        );
        let actualB = r.getLower().getTemp();
        let expected: int = 35;
        expect(actualB).assertEqual(expected);
        let actualC = r.getUpper().getTemp();
        let expectedA: int = 40;
        expect(actualC).assertEqual(expectedA);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let count = 0;
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(41),
              new ScopeHelperIntersectPart03TestMissingTemperature(50),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          count++;
        }
        try {
          range.intersect(
            new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
              new ScopeHelperIntersectPart03TestMissingTemperature(55),
              new ScopeHelperIntersectPart03TestMissingTemperature(60),
            ),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          count++;
        }
        expect(count).assertEqual(2);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let count = 0;
        try {
          range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(41),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          count++;
        }
        try {
          range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(5),
            new ScopeHelperIntersectPart03TestMissingTemperature(20),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          count++;
        }
        expect(count).assertEqual(2);
        let actualB = range.getLower().getTemp();
        let expected: int = 30;
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let count = 0;
        try {
          range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(41),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          count++;
        }
        try {
          range.intersect(
            new ScopeHelperIntersectPart03TestMissingTemperature(41),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          count++;
        }
        expect(count).assertEqual(2);
        let actualB: string = range.toString();
        let expected: string = '[30, 40]';
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(39),
        );
        expect(r.getUpper().getTemp()).assertEqual(39);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(39),
        );
        let actualB: string = r.toString();
        let expected: string = '[35, 39]';
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let actual = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          ),
        );
        let actualA = actual.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(37),
            new ScopeHelperIntersectPart03TestMissingTemperature(60),
          ),
        );
        let actualB: string = actualA.toString();
        let expected: string = '[37, 40]';
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let actual = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(50),
        );
        let actualA = actual.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(37),
          new ScopeHelperIntersectPart03TestMissingTemperature(60),
        );
        let actualB: string = actualA.toString();
        let expected: string = '[37, 40]';
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(39),
        );
        expect(r.toString()).assertEqual("[35, 39]");
        r.getLower().setTemp(44);
        let actualB = r.getLower().getTemp();
        let expected: int = 44;
        expect(actualB).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_INTERSECT_2500
     * @tc.name testScopeIsectBasic006
     * @tc.desc Verify ScopeHelper intersect with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeIsectBasic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          ),
        );
        let actualB = r.getUpper().getTemp();
        let expected: int = 40;
        expect(actualB).assertEqual(expected);

      }
      {
        let lower = new ScopeHelperIntersectPart03TestMissingTemperature(35);
        let rangeFir = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          lower,
          new ScopeHelperIntersectPart03TestMissingTemperature(39),
        );
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(rangeFir);
        lower.setTemp(51);
        let actualB = r.getLower().getTemp();
        let expected: int = 51;
        expect(actualB).assertEqual(expected);

      }
      {
        let up = new ScopeHelperIntersectPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          up,
        );
        let r = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          ),
        );
        up.setTemp(53);
        let actualB = r.getUpper().getTemp();
        let expected: int = 53;
        expect(actualB).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperIntersectPart03TestMissingTemperature(30);
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          lo,
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(25),
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
          ),
        );
        lo.setTemp(54);
        let actualB = r.getLower().getTemp();
        let expected: int = 54;
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let rangeFir = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(35),
          new ScopeHelperIntersectPart03TestMissingTemperature(39),
        );
        let actual = range.intersect(rangeFir);
        expect(actual.getLower().getTemp()).assertEqual(35);
        expect(actual.getUpper().getTemp()).assertEqual(39);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(35),
            new ScopeHelperIntersectPart03TestMissingTemperature(50),
          ),
        );
        r.getLower().setTemp(74);
        let actualB = range.getLower().getTemp();
        let expected: int = 30;
        expect(actualB).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperIntersectPart03TestMissingTemperature(35);
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(lo, new ScopeHelperIntersectPart03TestMissingTemperature(50));
        lo.setTemp(75);
        let actualB = r.getLower().getTemp();
        let expected: int = 75;
        expect(actualB).assertEqual(expected);

      }
      {
        let up = new ScopeHelperIntersectPart03TestMissingTemperature(35);
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(30),
          new ScopeHelperIntersectPart03TestMissingTemperature(40),
        );
        let r = range.intersect(new ScopeHelperIntersectPart03TestMissingTemperature(25), up);
        up.setTemp(92);
        let actualB = r.getUpper().getTemp();
        let expected: int = 92;
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
          new ScopeHelperIntersectPart03TestMissingTemperature(-30),
          new ScopeHelperIntersectPart03TestMissingTemperature(-10),
        );
        let actual = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingTemperature>(
            new ScopeHelperIntersectPart03TestMissingTemperature(-25),
            new ScopeHelperIntersectPart03TestMissingTemperature(-15),
          ),
        );
        let actualA = range.intersect(
          new ScopeHelperIntersectPart03TestMissingTemperature(-25),
          new ScopeHelperIntersectPart03TestMissingTemperature(-15),
        );
        let actualB: string = actual.toString();
        let expected = actualA.toString();
        expect(actualB).assertEqual("[-25, -15]");
        expect(actualB).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap>(
          new ScopeHelperIntersectPart03TestMissingLongWrap(300),
          new ScopeHelperIntersectPart03TestMissingLongWrap(400),
        );
        let actual = range.intersect(
          new util.ScopeHelper<ScopeHelperIntersectPart03TestMissingLongWrap>(
            new ScopeHelperIntersectPart03TestMissingLongWrap(350),
            new ScopeHelperIntersectPart03TestMissingLongWrap(390),
          ),
        );
        let actualA = range.intersect(
          new ScopeHelperIntersectPart03TestMissingLongWrap(350),
          new ScopeHelperIntersectPart03TestMissingLongWrap(390),
        );
        let actualB: string = actual.toString();
        let expected = actualA.toString();
        expect(actualB).assertEqual("[350, 390]");
        expect(actualB).assertEqual(expected);

      }
    });

  });
}
