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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';

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

export default function ScopeHelperToStringTest(): void {
  describe('ScopeHelperToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_0100
     * @tc.name testScopeToStrThrows001
     * @tc.desc Verify ScopeHelper toString throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingLabel>(
            new ScopeHelperToStringPart01TestMissingLabel('alpha'),
            new ScopeHelperToStringPart01TestMissingLabel('omega'),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          expect(e.message).assertEqual('lower limit must be less than upper limit');
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingLabel>(
            new ScopeHelperToStringPart01TestMissingLabel('a'),
            new ScopeHelperToStringPart01TestMissingLabel(''),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          expect(e.message).assertEqual('lower limit must be less than upper limit');
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingLabel>(
            new ScopeHelperToStringPart01TestMissingLabel(''),
            new ScopeHelperToStringPart01TestMissingLabel(''),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          expect(e.message).assertEqual('lower limit must be less than upper limit');
        }

      }
      {
        let longStr: string = 'x'.repeat(10000);
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingLabel>(
            new ScopeHelperToStringPart01TestMissingLabel(longStr),
            new ScopeHelperToStringPart01TestMissingLabel('z'),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          expect(e.message).assertEqual('lower limit must be less than upper limit');
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingLabel>(
            new ScopeHelperToStringPart01TestMissingLabel('你好'),
            new ScopeHelperToStringPart01TestMissingLabel('世界'),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          expect(e.message).assertEqual('lower limit must be less than upper limit');
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingLabel>(
            new ScopeHelperToStringPart01TestMissingLabel('a'),
            new ScopeHelperToStringPart01TestMissingLabel('中'),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          expect(e.message).assertEqual('lower limit must be less than upper limit');
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingWord>(
            new ScopeHelperToStringPart02TestMissingWord('alpha'),
            new ScopeHelperToStringPart02TestMissingWord('omega'),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          expect(e.message).assertEqual('lower limit must be less than upper limit');
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_0200
     * @tc.name testScopeToStrDate001
     * @tc.desc Verify ScopeHelper toString with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
          new ScopeHelperOverviewPart03TestMissingTemperature(2147483646),
          new ScopeHelperOverviewPart03TestMissingTemperature(2147483647),
        );
        let actual: string = range.toString();
        let expected: string = '[2147483646, 2147483647]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
          new ScopeHelperOverviewPart03TestMissingTemperature(-2147483647),
          new ScopeHelperOverviewPart03TestMissingTemperature(-2147483646),
        );
        let actual: string = range.toString();
        let expected: string = '[-2147483647, -2147483646]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingMeter>(
          new ScopeHelperToStringPart01TestMissingMeter(9223372036854775806n),
          new ScopeHelperToStringPart01TestMissingMeter(9223372036854775807n),
        );
        let actual: string = range.toString();
        let expected: string = '[9223372036854775806m, 9223372036854775807m]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingMeter>(
          new ScopeHelperToStringPart01TestMissingMeter(-9223372036854775808n),
          new ScopeHelperToStringPart01TestMissingMeter(-9223372036854775807n),
        );
        let actual: string = range.toString();
        let expected: string = '[-9223372036854775808m, -9223372036854775807m]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingMeter>(
          new ScopeHelperToStringPart01TestMissingMeter(123456789012345n),
          new ScopeHelperToStringPart01TestMissingMeter(987654321098765n),
        );
        let actual: string = range.toString();
        let expected: string = '[123456789012345m, 987654321098765m]';
        expect(actual).assertEqual(expected);

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
            new ScopeHelperToStringPart02TestMissingVolume(-2147483648),
            new ScopeHelperToStringPart02TestMissingVolume(-2147483648),
          );
          let actual: int = range.toString().length;
          let expected: int = 26;
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingCoin>(
          new ScopeHelperToStringPart02TestMissingCoin(-9223372036854775807 - 1),
          new ScopeHelperToStringPart02TestMissingCoin(9223372036854775807),
        );
        let actual: string = range.toString();
        let expected: string = '[-9223372036854775808, 9223372036854775807]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_0300
     * @tc.name testScopeToStrChar001
     * @tc.desc Verify ScopeHelper toString with char bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingLetter>(
          new ScopeHelperToStringPart02TestMissingLetter(Int.toChar(65)),
          new ScopeHelperToStringPart02TestMissingLetter(Int.toChar(90)),
        );
        let actual: string = range.toString();
        let expected: string = '[A, Z]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_0400
     * @tc.name testScopeToStrStr001
     * @tc.desc Verify ScopeHelper toString with string bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrStr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
          new ScopeHelperToStringPart02TestMissingVolume(12),
          new ScopeHelperToStringPart02TestMissingVolume(18),
        );
        let actual: string = range.toString();
        let expected: string = '[12, 18]';
        expect(actual).assertEqual(expected);

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
            new ScopeHelperToStringPart02TestMissingVolume(8),
            new ScopeHelperToStringPart02TestMissingVolume(8),
          );
          let actual: int = range.toString().length;
          let expected: int = 6;
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
            new ScopeHelperToStringPart02TestMissingVolume(0),
            new ScopeHelperToStringPart02TestMissingVolume(0),
          );
          let actual: int = range.toString().length;
          let expected: int = 6;
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
            new ScopeHelperToStringPart02TestMissingVolume(-1),
            new ScopeHelperToStringPart02TestMissingVolume(-1),
          );
          let actual: int = range.toString().length;
          let expected: int = 8;
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
          new ScopeHelperToStringPart02TestMissingVolume(15),
          new ScopeHelperToStringPart02TestMissingVolume(25),
        );
        let s: string = range.toString();
        expect(s).assertEqual(
          '[' +
            new ScopeHelperToStringPart02TestMissingVolume(15).toString() +
            ', ' +
            new ScopeHelperToStringPart02TestMissingVolume(25).toString() +
            ']',
        );

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_0500
     * @tc.name testScopeToStrBool001
     * @tc.desc Verify ScopeHelper toString with boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingSwitch>(
          new ScopeHelperToStringPart02TestMissingSwitch(false),
          new ScopeHelperToStringPart02TestMissingSwitch(true),
        );
        let actual: string = range.toString();
        let expected: string = '[OFF, ON]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_0600
     * @tc.name testScopeToStrFloatDouble001
     * @tc.desc Verify ScopeHelper toString with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrFloatDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingHeight>(
          new ScopeHelperToStringPart01TestMissingHeight(3.5),
          new ScopeHelperToStringPart01TestMissingHeight(8.25),
        );
        let actual: string = range.toString();
        let expected: string = '[3.5, 8.25]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingHeight>(
          new ScopeHelperToStringPart01TestMissingHeight(-2.5),
          new ScopeHelperToStringPart01TestMissingHeight(0.5),
        );
        let actual: string = range.toString();
        let expected: string = '[-2.5, 0.5]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingHeight>(
          new ScopeHelperToStringPart01TestMissingHeight(-5.5),
          new ScopeHelperToStringPart01TestMissingHeight(-1.25),
        );
        let actual: string = range.toString();
        let expected: string = '[-5.5, -1.25]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingHeight>(
          new ScopeHelperToStringPart01TestMissingHeight(-1.5),
          new ScopeHelperToStringPart01TestMissingHeight(-0.5),
        );
        let actual: string = range.toString();
        let expected: string = '[-1.5, -0.5]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingHeight>(
          new ScopeHelperToStringPart01TestMissingHeight(Number.NaN),
          new ScopeHelperToStringPart01TestMissingHeight(5.0),
        );
        let s: string = range.toString();
        let actualJ: int = s.indexOf('NaN');
        let expectedH: int = 0;
        expect(actualJ).assertLargerOrEqual(expectedH);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingGrade>(
          new ScopeHelperToStringPart02TestMissingGrade(Double.toFloat(3.5)),
          new ScopeHelperToStringPart02TestMissingGrade(Double.toFloat(4.5)),
        );
        let actual: string = range.toString();
        let expected: string = '[3.5f, 4.5f]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingWeight>(
          new ScopeHelperToStringPart02TestMissingWeight(2.5),
          new ScopeHelperToStringPart02TestMissingWeight(3.5),
        );
        let actual: string = range.toString();
        let expected: string = '[2.5g, 3.5g]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingGrade>(
          new ScopeHelperToStringPart02TestMissingGrade(2.5),
          new ScopeHelperToStringPart02TestMissingGrade(7.75),
        );
        let actual: string = range.toString();
        let expected: string = '[2.5f, 7.75f]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingGrade>(
          new ScopeHelperToStringPart02TestMissingGrade(Double.toFloat(-3.5)),
          new ScopeHelperToStringPart02TestMissingGrade(Double.toFloat(-1.25)),
        );
        let actual: string = range.toString();
        let expected: string = '[-3.5f, -1.25f]';
        expect(actual).assertEqual(expected);

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingGrade>(
            new ScopeHelperToStringPart02TestMissingGrade(Float.MAX_VALUE),
            new ScopeHelperToStringPart02TestMissingGrade(Float.MAX_VALUE),
          );
          expect(range.toString().length).assertLarger(10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_0700
     * @tc.name testScopeToStrFloatDouble002
     * @tc.desc Verify ScopeHelper toString with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrFloatDouble002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingWeight>(
          new ScopeHelperToStringPart02TestMissingWeight(4.25),
          new ScopeHelperToStringPart02TestMissingWeight(9.5),
        );
        let actual: string = range.toString();
        let expected: string = '[4.25g, 9.5g]';
        expect(actual).assertEqual(expected);

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingWeight>(
            new ScopeHelperToStringPart02TestMissingWeight(6.0),
            new ScopeHelperToStringPart02TestMissingWeight(6.0),
          );
          let actual: string = range.toString();
          let expected: string = '[6g, 6g]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingWeight>(
            new ScopeHelperToStringPart02TestMissingWeight(4.9e-324),
            new ScopeHelperToStringPart02TestMissingWeight(0.0),
          );
          let s: string = range.toString();
          expect(s.indexOf('e-')).assertLargerOrEqual(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingWeight>(
          new ScopeHelperToStringPart02TestMissingWeight(0.0),
          new ScopeHelperToStringPart02TestMissingWeight(1.7976931348623157e308),
        );
        let s: string = range.toString();
        expect(s.indexOf('e+')).assertLargerOrEqual(0);

      }
      {
        let lower = new ScopeHelperToStringPart02TestMissingWeight(5.5);
        let upper = new ScopeHelperToStringPart02TestMissingWeight(12.0);
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingWeight>(lower, upper);
        let actual: string = range.toString();
        let expected: string = '[5.5g, 12g]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_0800
     * @tc.name testScopeToStrLong001
     * @tc.desc Verify ScopeHelper toString with long bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrLong001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingCoin>(
          new ScopeHelperToStringPart02TestMissingCoin(1234567890123),
          new ScopeHelperToStringPart02TestMissingCoin(9876543210987),
        );
        let actual: string = range.toString();
        let expected: string = '[1234567890123, 9876543210987]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_0900
     * @tc.name testScopeToStrCustom001
     * @tc.desc Verify ScopeHelper toString with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrCustom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingWord>(
            new ScopeHelperToStringPart02TestMissingWord('p q'),
            new ScopeHelperToStringPart02TestMissingWord('r'),
          );
          let actual: string = range.toString();
          let expected: string = '[p q, r]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
          new ScopeHelperToStringPart02TestMissingVolume(17),
          new ScopeHelperToStringPart02TestMissingVolume(23),
        );
        let s: string = range.toString();
        let actual: string = s.charAt(s.length - 1).toString();
        let expected: string = ']';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_1000
     * @tc.name testScopeToStrBoundary001
     * @tc.desc Verify ScopeHelper toString with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
          new ScopeHelperToStringPart02TestMissingVolume(999999),
          new ScopeHelperToStringPart02TestMissingVolume(1000000),
        );
        let actual: string = range.toString();
        let expected: string = '[999999, 1000000]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
          new ScopeHelperToStringPart02TestMissingVolume(100000000),
          new ScopeHelperToStringPart02TestMissingVolume(100000001),
        );
        let actual: string = range.toString();
        let expected: string = '[100000000, 100000001]';
        expect(actual).assertEqual(expected);

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingCoin>(
            new ScopeHelperToStringPart02TestMissingCoin(9223372036854775807),
            new ScopeHelperToStringPart02TestMissingCoin(9223372036854775807),
          );
          let actual: string = range.toString();
          let expected: string = '[9223372036854775807, 9223372036854775807]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingCoin>(
            new ScopeHelperToStringPart02TestMissingCoin(-9223372036854775807 - 1),
            new ScopeHelperToStringPart02TestMissingCoin(-9223372036854775807 - 1),
          );
          let actual: string = range.toString();
          let expected: string = '[-9223372036854775808, -9223372036854775808]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_1100
     * @tc.name testScopeToStrConsistency001
     * @tc.desc Verify ScopeHelper toString state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
          new ScopeHelperOverviewPart03TestMissingTemperature(30),
          new ScopeHelperOverviewPart03TestMissingTemperature(40),
        );
        let first: string = range.toString();
        let second: string = range.toString();
        expect(first).assertEqual('[30, 40]');
        expect(second).assertEqual('[30, 40]');

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
          new ScopeHelperOverviewPart03TestMissingTemperature(30),
          new ScopeHelperOverviewPart03TestMissingTemperature(40),
        );
        let before: boolean = range.contains(new ScopeHelperOverviewPart03TestMissingTemperature(35));
        let text: string = range.toString();
        let after: boolean = range.contains(new ScopeHelperOverviewPart03TestMissingTemperature(35));
        expect(before).assertTrue();
        expect(text).assertEqual('[30, 40]');
        expect(after).assertTrue();

      }
      {
        let actualA = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
          new ScopeHelperOverviewPart03TestMissingTemperature(30),
          new ScopeHelperOverviewPart03TestMissingTemperature(40),
        );
        let actualB = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
          new ScopeHelperOverviewPart03TestMissingTemperature(50),
          new ScopeHelperOverviewPart03TestMissingTemperature(60),
        );
        let strOut: string = actualA.toString();
        let strOutA: string = actualB.toString();
        expect(strOut).assertEqual('[30, 40]');
        expect(strOutA).assertEqual('[50, 60]');

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
          new ScopeHelperOverviewPart03TestMissingTemperature(30),
          new ScopeHelperOverviewPart03TestMissingTemperature(40),
        );
        let s: string = 'R=' + range.toString();
        expect(s).assertEqual('R=[30, 40]');

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
          new ScopeHelperOverviewPart03TestMissingTemperature(20),
          new ScopeHelperOverviewPart03TestMissingTemperature(30),
        );
        let actual: string = range.toString();
        let expected: string = '[20, 30]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
          new ScopeHelperOverviewPart03TestMissingTemperature(1),
          new ScopeHelperOverviewPart03TestMissingTemperature(2),
        );
        let actual: string = range.toString();
        let expected: string = '[1, 2]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
          new ScopeHelperOverviewPart03TestMissingTemperature(-20),
          new ScopeHelperOverviewPart03TestMissingTemperature(0),
        );
        let actual: string = range.toString();
        let expected: string = '[-20, 0]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
          new ScopeHelperOverviewPart03TestMissingTemperature(-5),
          new ScopeHelperOverviewPart03TestMissingTemperature(-1),
        );
        let actual: string = range.toString();
        let expected: string = '[-5, -1]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingMeter>(
          new ScopeHelperToStringPart01TestMissingMeter(5n),
          new ScopeHelperToStringPart01TestMissingMeter(10n),
        );
        let actual: string = range.toString();
        let expected: string = '[5m, 10m]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingMeter>(
          new ScopeHelperToStringPart01TestMissingMeter(-100n),
          new ScopeHelperToStringPart01TestMissingMeter(-1n),
        );
        let actual: string = range.toString();
        let expected: string = '[-100m, -1m]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_1200
     * @tc.name testScopeToStrConsistency002
     * @tc.desc Verify ScopeHelper toString state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrConsistency002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingMeter>(
          new ScopeHelperToStringPart01TestMissingMeter(0n),
          new ScopeHelperToStringPart01TestMissingMeter(1n),
        );
        let actual: string = range.toString();
        let expected: string = '[0m, 1m]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingLabel>(
          new ScopeHelperToStringPart01TestMissingLabel(''),
          new ScopeHelperToStringPart01TestMissingLabel('z'),
        );
        let actual: string = range.toString();
        let expected: string = '[, z]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingWord>(
          new ScopeHelperToStringPart02TestMissingWord('beta'),
          new ScopeHelperToStringPart02TestMissingWord('delta'),
        );
        let s = range.toString();
        expect(s).assertEqual('[beta, delta]');

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingCoin>(
          new ScopeHelperToStringPart02TestMissingCoin(1000),
          new ScopeHelperToStringPart02TestMissingCoin(2000),
        );
        let actual: string = range.toString();
        let expected: string = '[1000, 2000]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingCoin>(
          new ScopeHelperToStringPart02TestMissingCoin(5000000),
          new ScopeHelperToStringPart02TestMissingCoin(9000000),
        );
        let actual: string = range.toString();
        let expected: string = '[5000000, 9000000]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingPixels>(
          new ScopeHelperToStringPart02TestMissingPixels(1),
          new ScopeHelperToStringPart02TestMissingPixels(9),
        );
        let actual: string = range.toString();
        let expected: string = '[1px, 9px]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingInterval>(
          new ScopeHelperToStringPart02TestMissingInterval(30),
          new ScopeHelperToStringPart02TestMissingInterval(90),
        );
        let actual: string = range.toString();
        let expected: string = '[30s, 90s]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingInterval>(
          new ScopeHelperToStringPart02TestMissingInterval(-20),
          new ScopeHelperToStringPart02TestMissingInterval(-5),
        );
        let actual: string = range.toString();
        let expected: string = '[-20s, -5s]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingLetter>(
          new ScopeHelperToStringPart02TestMissingLetter(Int.toChar(48)),
          new ScopeHelperToStringPart02TestMissingLetter(Int.toChar(57)),
        );
        let actual: string = range.toString();
        let expected: string = '[0, 9]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingLetter>(
          new ScopeHelperToStringPart02TestMissingLetter(Int.toChar(32)),
          new ScopeHelperToStringPart02TestMissingLetter(Int.toChar(126)),
        );
        let actual: string = range.toString();
        let expected: string = '[ , ~]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_1300
     * @tc.name testScopeToStrConsistency003
     * @tc.desc Verify ScopeHelper toString state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrConsistency003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lower = new ScopeHelperToStringPart02TestMissingVolume(14);
        let upper = new ScopeHelperToStringPart02TestMissingVolume(22);
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(lower, upper);
        expect(range.toString()).assertEqual('[14, 22]');
        let actual: boolean = range.contains(new ScopeHelperToStringPart02TestMissingVolume(14));
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
          new ScopeHelperToStringPart02TestMissingVolume(20),
          new ScopeHelperToStringPart02TestMissingVolume(50),
        );
        expect(range.toString()).assertEqual('[20, 50]');
        let actual: boolean = range.contains(new ScopeHelperToStringPart02TestMissingVolume(35));
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
          new ScopeHelperToStringPart02TestMissingVolume(3),
          new ScopeHelperToStringPart02TestMissingVolume(6),
        );
        let expanded = range.expand(new ScopeHelperToStringPart02TestMissingVolume(9));
        let actual: string = expanded.toString();
        let expected: string = '[3, 9]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
          new ScopeHelperToStringPart02TestMissingVolume(7),
          new ScopeHelperToStringPart02TestMissingVolume(9),
        );
        let actual: string = 'range=' + range.toString();
        let expected: string = 'range=[7, 9]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
          new ScopeHelperToStringPart02TestMissingVolume(2),
          new ScopeHelperToStringPart02TestMissingVolume(4),
        );
        let s: string = range.toString() + '|' + range.toString();
        expect(s).assertEqual('[2, 4]|[2, 4]');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_1400
     * @tc.name testScopeToStrBasic001
     * @tc.desc Verify ScopeHelper toString with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingMeter>(
          new ScopeHelperToStringPart01TestMissingMeter(5n),
          new ScopeHelperToStringPart01TestMissingMeter(10n),
        );
        let s: string = range.toString();
        let actualC: int = s.indexOf('10m');
        let expectedA: int = 0;
        expect(actualC).assertLargerOrEqual(expectedA);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingHeight>(
          new ScopeHelperToStringPart01TestMissingHeight(Number.NEGATIVE_INFINITY),
          new ScopeHelperToStringPart01TestMissingHeight(5.0),
        );
        let s: string = range.toString();
        let actualL: int = s.indexOf('Infinity');
        let expectedJ: int = 0;
        expect(actualL).assertLargerOrEqual(expectedJ);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart01TestMissingHeight>(
          new ScopeHelperToStringPart01TestMissingHeight(Number.NEGATIVE_INFINITY),
          new ScopeHelperToStringPart01TestMissingHeight(Number.POSITIVE_INFINITY),
        );
        let s: string = range.toString();
        let actualN: int = s.indexOf('Infinity');
        let expectedL: int = 0;
        expect(actualN).assertLargerOrEqual(expectedL);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingPixels>(
          new ScopeHelperToStringPart02TestMissingPixels(Int.toByte(12)),
          new ScopeHelperToStringPart02TestMissingPixels(Int.toByte(18)),
        );
        let actual: string = range.toString();
        let expected: string = '[12px, 18px]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingInterval>(
          new ScopeHelperToStringPart02TestMissingInterval(Int.toShort(5)),
          new ScopeHelperToStringPart02TestMissingInterval(Int.toShort(9)),
        );
        let actual: string = range.toString();
        let expected: string = '[5s, 9s]';
        expect(actual).assertEqual(expected);

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingGrade>(
            new ScopeHelperToStringPart02TestMissingGrade(Double.toFloat(0.0)),
            new ScopeHelperToStringPart02TestMissingGrade(Double.toFloat(0.0)),
          );
          let actual: string = range.toString();
          let expected: string = '[0f, 0f]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingWeight>(
          new ScopeHelperToStringPart02TestMissingWeight(1.0),
          new ScopeHelperToStringPart02TestMissingWeight(Number.POSITIVE_INFINITY),
        );
        let s: string = range.toString();
        expect(s.indexOf('Infinity')).assertLargerOrEqual(0);

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingPixels>(
            new ScopeHelperToStringPart02TestMissingPixels(0),
            new ScopeHelperToStringPart02TestMissingPixels(0),
          );
          let actual: string = range.toString();
          let expected: string = '[0px, 0px]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingPixels>(
            new ScopeHelperToStringPart02TestMissingPixels(-2),
            new ScopeHelperToStringPart02TestMissingPixels(-2),
          );
          let actual: string = range.toString();
          let expected: string = '[-2px, -2px]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingPixels>(
            new ScopeHelperToStringPart02TestMissingPixels(127),
            new ScopeHelperToStringPart02TestMissingPixels(127),
          );
          let actual: string = range.toString();
          let expected: string = '[127px, 127px]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_TO_STRING_1500
     * @tc.name testScopeToStrBasic002
     * @tc.desc Verify ScopeHelper toString with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeToStrBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingInterval>(
            new ScopeHelperToStringPart02TestMissingInterval(32767),
            new ScopeHelperToStringPart02TestMissingInterval(32767),
          );
          let actual: string = range.toString();
          let expected: string = '[32767s, 32767s]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingLetter>(
            new ScopeHelperToStringPart02TestMissingLetter(Int.toChar(75)),
            new ScopeHelperToStringPart02TestMissingLetter(Int.toChar(75)),
          );
          let actual: string = range.toString();
          let expected: string = '[K, K]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingSwitch>(
            new ScopeHelperToStringPart02TestMissingSwitch(true),
            new ScopeHelperToStringPart02TestMissingSwitch(true),
          );
          let actual: string = range.toString();
          let expected: string = '[ON, ON]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingSwitch>(
            new ScopeHelperToStringPart02TestMissingSwitch(false),
            new ScopeHelperToStringPart02TestMissingSwitch(false),
          );
          let actual: string = range.toString();
          let expected: string = '[OFF, OFF]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
          new ScopeHelperToStringPart02TestMissingVolume(41),
          new ScopeHelperToStringPart02TestMissingVolume(52),
        );
        let union = range.expand(new ScopeHelperToStringPart02TestMissingVolume(60));
        expect(union.toString()).assertEqual('[41, 60]');
        expect(range.toString()).assertEqual('[41, 52]');

      }
    });

  });
}
