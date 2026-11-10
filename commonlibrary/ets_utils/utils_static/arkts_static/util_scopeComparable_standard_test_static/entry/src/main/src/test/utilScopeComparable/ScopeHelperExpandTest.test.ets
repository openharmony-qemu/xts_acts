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

export default function ScopeHelperExpandTest(): void {
  describe('ScopeHelperExpandTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_0100
     * @tc.name testScopeExpandThrows001
     * @tc.desc Verify ScopeHelper expand throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test45CompareSelf>(
            new ScopeHelperExpandPart02Test45CompareSelf(30),
            new ScopeHelperExpandPart02Test45CompareSelf(40),
          );
          scope.expand(scope);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingAlwaysTrue>(
            new ScopeHelperExpandPart03TestMissingAlwaysTrue(30),
            new ScopeHelperExpandPart03TestMissingAlwaysTrue(40),
          );
          range.expand(new ScopeHelperExpandPart03TestMissingAlwaysTrue(50));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperExpandPart04Test31BadCompare>(
            new ScopeHelperExpandPart04Test31BadCompare(30),
            new ScopeHelperExpandPart04Test31BadCompare(40),
          );
          range.expand(new ScopeHelperExpandPart04Test31BadCompare(25));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperExpandPart04Test31BadCompare>(
            new ScopeHelperExpandPart04Test31BadCompare(30),
            new ScopeHelperExpandPart04Test31BadCompare(40),
          );
          let rangeFir = new util.ScopeHelper<ScopeHelperExpandPart04Test31BadCompare>(
            new ScopeHelperExpandPart04Test31BadCompare(20),
            new ScopeHelperExpandPart04Test31BadCompare(25),
          );
          range.expand(rangeFir);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperExpandPart04Test31BadCompare>(
            new ScopeHelperExpandPart04Test31BadCompare(30),
            new ScopeHelperExpandPart04Test31BadCompare(40),
          );
          range.expand(new ScopeHelperExpandPart04Test31BadCompare(20), new ScopeHelperExpandPart04Test31BadCompare(25));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart04Test38GuardCompare>(
          new ScopeHelperExpandPart04Test38GuardCompare(30),
          new ScopeHelperExpandPart04Test38GuardCompare(40),
        );
        try {
          range.expand(new ScopeHelperExpandPart04Test38GuardCompare(100));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_0200
     * @tc.name testScopeExpandBigInt001
     * @tc.desc Verify ScopeHelper expand with BigInt bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandBigInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let range = new util.ScopeHelper<ScopeHelperBigIntValue>(new ScopeHelperBigIntValue(BigInt(30)), new ScopeHelperBigIntValue(BigInt(40)));
          let result = range.expand(new ScopeHelperBigIntValue(BigInt(10)), new ScopeHelperBigIntValue(BigInt(20)));
          let actual: string = result.toString();
          let expected: string = '[10, 40]';
          expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test43TemperatureBigint>(
          new ScopeHelperExpandPart02Test43TemperatureBigint(BigInt(10)),
          new ScopeHelperExpandPart02Test43TemperatureBigint(BigInt(30)),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart02Test43TemperatureBigint>(
          new ScopeHelperExpandPart02Test43TemperatureBigint(BigInt(20)),
          new ScopeHelperExpandPart02Test43TemperatureBigint(BigInt(40)),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[10, 40]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_0300
     * @tc.name testScopeExpandDate001
     * @tc.desc Verify ScopeHelper expand with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart01TestMissingTemperature>(
          new ScopeHelperExpandPart01TestMissingTemperature(30),
          new ScopeHelperExpandPart01TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperExpandPart01TestMissingTemperature(-2147483648),
          new ScopeHelperExpandPart01TestMissingTemperature(100),
        );
        let actual: string = result.toString();
        let expected: string = '[-2147483648, 100]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart01TestMissingTemperature>(
          new ScopeHelperExpandPart01TestMissingTemperature(-2147483648),
          new ScopeHelperExpandPart01TestMissingTemperature(2147483647),
        );
        let result = range.expand(
          new ScopeHelperExpandPart01TestMissingTemperature(0),
          new ScopeHelperExpandPart01TestMissingTemperature(0),
        );
        let actual: string = result.toString();
        let expected: string = '[-2147483648, 2147483647]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test41TemperatureLong>(
          new ScopeHelperExpandPart02Test41TemperatureLong(10000000000),
          new ScopeHelperExpandPart02Test41TemperatureLong(20000000000),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart02Test41TemperatureLong>(
          new ScopeHelperExpandPart02Test41TemperatureLong(15000000000),
          new ScopeHelperExpandPart02Test41TemperatureLong(25000000000),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[10000000000, 25000000000]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test46TemperatureEpoch>(
          new ScopeHelperExpandPart02Test46TemperatureEpoch(1700000000000),
          new ScopeHelperExpandPart02Test46TemperatureEpoch(1700000001000),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart02Test46TemperatureEpoch>(
          new ScopeHelperExpandPart02Test46TemperatureEpoch(1700000000500),
          new ScopeHelperExpandPart02Test46TemperatureEpoch(1700000001500),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[1700000000000, 1700000001500]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(0),
          new ScopeHelperExpandPart03TestMissingTemperature(100),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(-2147483648));
        let actual: string = result.toString();
        let expected: string = '[-2147483648, 100]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(0),
          new ScopeHelperExpandPart03TestMissingTemperature(100),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(2147483647));
        let actual: string = result.toString();
        let expected: string = '[0, 2147483647]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-2147483648),
          new ScopeHelperExpandPart03TestMissingTemperature(2147483647),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(0));
        let actual: string = result.toString();
        let expected: string = '[-2147483648, 2147483647]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingLength>(
          new ScopeHelperExpandPart03TestMissingLength(0),
          new ScopeHelperExpandPart03TestMissingLength(100),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingLength(-9223372036854775808));
        let actual: string = result.toString();
        let expected: string = '[-9223372036854775808, 100]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingBigBalance>(
          new ScopeHelperExpandPart03TestMissingBigBalance(0n),
          new ScopeHelperExpandPart03TestMissingBigBalance(100n),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingBigBalance(9223372036854775807n));
        let actual: string = result.toString();
        let expected: string = '[0, 9223372036854775807]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_0400
     * @tc.name testScopeExpandChar001
     * @tc.desc Verify ScopeHelper expand with char bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test51TemperatureChar>(
          new ScopeHelperExpandPart02Test51TemperatureChar(Int.toChar(98)),
          new ScopeHelperExpandPart02Test51TemperatureChar(Int.toChar(100)),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart02Test51TemperatureChar>(
          new ScopeHelperExpandPart02Test51TemperatureChar(Int.toChar(99)),
          new ScopeHelperExpandPart02Test51TemperatureChar(Int.toChar(101)),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[b, e]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_0500
     * @tc.name testScopeExpandStr001
     * @tc.desc Verify ScopeHelper expand with string bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandStr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let range = new util.ScopeHelper<ScopeHelperStringValue>(new ScopeHelperStringValue('apple'), new ScopeHelperStringValue('zebra'));
          let result = range.expand(new ScopeHelperStringValue('abc'), new ScopeHelperStringValue('ant'));
          let actual: string = result.toString();
          let expected: string = '[abc, zebra]';
          expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test42TemperatureString>(
          new ScopeHelperExpandPart02Test42TemperatureString('b'),
          new ScopeHelperExpandPart02Test42TemperatureString('d'),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart02Test42TemperatureString>(
          new ScopeHelperExpandPart02Test42TemperatureString('c'),
          new ScopeHelperExpandPart02Test42TemperatureString('e'),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[b, e]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test47TemperatureFold>(
          new ScopeHelperExpandPart02Test47TemperatureFold('b'),
          new ScopeHelperExpandPart02Test47TemperatureFold('d'),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart02Test47TemperatureFold>(
          new ScopeHelperExpandPart02Test47TemperatureFold('C'),
          new ScopeHelperExpandPart02Test47TemperatureFold('E'),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[b, E]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_0600
     * @tc.name testScopeExpandBool001
     * @tc.desc Verify ScopeHelper expand with boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let range = new util.ScopeHelper<ScopeHelperBooleanValue>(new ScopeHelperBooleanValue(false), new ScopeHelperBooleanValue(true));
          let result = range.expand(new ScopeHelperBooleanValue(false), new ScopeHelperBooleanValue(true));
          let actual: string = result.toString();
          let expected: string = '[false, true]';
          expect(actual).assertEqual(expected);

      }
      {
        let lower = new ScopeHelperExpandPart01TestMissingBooleanTemp(false);
        let upper = new ScopeHelperExpandPart01TestMissingBooleanTemp(true);
        let range = new util.ScopeHelper<ScopeHelperExpandPart01TestMissingBooleanTemp>(lower, upper);
        let result = range.expand(
          new ScopeHelperExpandPart01TestMissingBooleanTemp(true),
          new ScopeHelperExpandPart01TestMissingBooleanTemp(true),
        );
        let actual: string = result.toString();
        let expected: string = '[false, true]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_0700
     * @tc.name testScopeExpandFloatDouble001
     * @tc.desc Verify ScopeHelper expand with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandFloatDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let range = new util.ScopeHelper<ScopeHelperDoubleValue>(new ScopeHelperDoubleValue(30.5), new ScopeHelperDoubleValue(40.5));
          let result = range.expand(new ScopeHelperDoubleValue(10.5), new ScopeHelperDoubleValue(20.5));
          let actual: string = result.toString();
          let expected: string = '[10.5, 40.5]';
          expect(actual).assertEqual(expected);

      }
      {
          let range = new util.ScopeHelper<ScopeHelperFloatValue>(new ScopeHelperFloatValue(Double.toFloat(30.5)), new ScopeHelperFloatValue(Double.toFloat(40.5)));
          let result = range.expand(new ScopeHelperFloatValue(Double.toFloat(10.5)), new ScopeHelperFloatValue(Double.toFloat(20.5)));
          let actual: string = result.toString();
          let expected: string = '[10.5, 40.5]';
          expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test40TemperatureDouble>(
          new ScopeHelperExpandPart02Test40TemperatureDouble(10.5),
          new ScopeHelperExpandPart02Test40TemperatureDouble(20.5),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart02Test40TemperatureDouble>(
          new ScopeHelperExpandPart02Test40TemperatureDouble(15.5),
          new ScopeHelperExpandPart02Test40TemperatureDouble(25.5),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[10.5, 25.5]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test48TemperatureFloat>(
          new ScopeHelperExpandPart02Test48TemperatureFloat(10.5 as float),
          new ScopeHelperExpandPart02Test48TemperatureFloat(20.5 as float),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart02Test48TemperatureFloat>(
          new ScopeHelperExpandPart02Test48TemperatureFloat(15.5 as float),
          new ScopeHelperExpandPart02Test48TemperatureFloat(25.5 as float),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[10.5, 25.5]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test40TemperatureDouble>(
          new ScopeHelperExpandPart02Test40TemperatureDouble(10.5),
          new ScopeHelperExpandPart02Test40TemperatureDouble(10.6),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart02Test40TemperatureDouble>(
          new ScopeHelperExpandPart02Test40TemperatureDouble(20.5),
          new ScopeHelperExpandPart02Test40TemperatureDouble(20.6),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[10.5, 20.6]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingScore>(
          new ScopeHelperExpandPart03TestMissingScore(30.0),
          new ScopeHelperExpandPart03TestMissingScore(40.0),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingScore(33.5));
        let actual: string = result.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingScore>(
          new ScopeHelperExpandPart03TestMissingScore(30.0),
          new ScopeHelperExpandPart03TestMissingScore(40.0),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingScore(20.5));
        let actual: string = result.toString();
        let expected: string = '[20.5, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingMeasure>(
          new ScopeHelperExpandPart03TestMissingMeasure(1.5),
          new ScopeHelperExpandPart03TestMissingMeasure(2.5),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingMeasure(0.25));
        let actual: string = result.toString();
        let expected: string = '[0.25, 2.5]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingMeasure>(
          new ScopeHelperExpandPart03TestMissingMeasure(1.5),
          new ScopeHelperExpandPart03TestMissingMeasure(2.5),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingMeasure(1.5));
        let actual: string = result.toString();
        let expected: string = '[1.5, 2.5]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_0800
     * @tc.name testScopeExpandLong001
     * @tc.desc Verify ScopeHelper expand with long bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandLong001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let range = new util.ScopeHelper<ScopeHelperLongValue>(new ScopeHelperLongValue(30), new ScopeHelperLongValue(40));
          let result = range.expand(new ScopeHelperLongValue(10), new ScopeHelperLongValue(20));
          let actual: string = result.toString();
          let expected: string = '[10, 40]';
          expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_0900
     * @tc.name testScopeExpandInt001
     * @tc.desc Verify ScopeHelper expand with int bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(30), new ScopeHelperIntValue(40));
          let result = range.expand(new ScopeHelperIntValue(10), new ScopeHelperIntValue(20));
          let actual: string = result.toString();
          let expected: string = '[10, 40]';
          expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(5),
          new ScopeHelperExpandPart03TestMissingTemperature(15),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(10),
          new ScopeHelperExpandPart03TestMissingTemperature(20),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[5, 20]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_1000
     * @tc.name testScopeExpandCustom001
     * @tc.desc Verify ScopeHelper expand with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandCustom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test44FlippedOrder>(
          new ScopeHelperExpandPart02Test44FlippedOrder(30),
          new ScopeHelperExpandPart02Test44FlippedOrder(20),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart02Test44FlippedOrder>(
          new ScopeHelperExpandPart02Test44FlippedOrder(30),
          new ScopeHelperExpandPart02Test44FlippedOrder(20),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[30, 20]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test49TemperatureByte>(
          new ScopeHelperExpandPart02Test49TemperatureByte(10 as byte),
          new ScopeHelperExpandPart02Test49TemperatureByte(20 as byte),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart02Test49TemperatureByte>(
          new ScopeHelperExpandPart02Test49TemperatureByte(15 as byte),
          new ScopeHelperExpandPart02Test49TemperatureByte(25 as byte),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[10, 25]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart02Test50TemperatureShort>(
          new ScopeHelperExpandPart02Test50TemperatureShort(100 as short),
          new ScopeHelperExpandPart02Test50TemperatureShort(200 as short),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart02Test50TemperatureShort>(
          new ScopeHelperExpandPart02Test50TemperatureShort(150 as short),
          new ScopeHelperExpandPart02Test50TemperatureShort(250 as short),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[100, 250]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingNeverBigger>(
          new ScopeHelperExpandPart03TestMissingNeverBigger(30),
          new ScopeHelperExpandPart03TestMissingNeverBigger(40),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingNeverBigger(20));
        let actual: string = result.toString();
        let expected: string = '[30, 20]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingWeight>(
          new ScopeHelperExpandPart03TestMissingWeight(100),
          new ScopeHelperExpandPart03TestMissingWeight(127),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingWeight(50));
        let actual: string = result.toString();
        let expected: string = '[50, 127]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingWeight>(
          new ScopeHelperExpandPart03TestMissingWeight(100),
          new ScopeHelperExpandPart03TestMissingWeight(127),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingWeight(127));
        let actual: string = result.toString();
        let expected: string = '[100, 127]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingListLen>(
          new ScopeHelperExpandPart03TestMissingListLen([1, 2, 3]),
          new ScopeHelperExpandPart03TestMissingListLen([1, 2, 3, 4, 5]),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingListLen([9]));
        let actual: string = result.toString();
        let expected: string = '[1, 5]';
        expect(actual).assertEqual(expected);

      }
      {
        try {
          let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingThrowingComp>(
            new ScopeHelperExpandPart03TestMissingThrowingComp(30),
            new ScopeHelperExpandPart03TestMissingThrowingComp(40),
          );
          let result = range.expand(new ScopeHelperExpandPart03TestMissingThrowingComp(50));
          let actual: string = result.toString();
          let expected: string = '[30, 50]';
          expect(actual).assertEqual(expected);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(30));
        let actual: string = result.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(40));
        let actual = result.getLower().getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);
        let actualA = result.getUpper().getTemp();
        let expectedA: int = 40;
        expect(actualA).assertEqual(expectedA);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_1100
     * @tc.name testScopeExpandConsistency001
     * @tc.desc Verify ScopeHelper expand state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart01TestMissingTemperature>(
          new ScopeHelperExpandPart01TestMissingTemperature(30),
          new ScopeHelperExpandPart01TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperExpandPart01TestMissingTemperature(25),
          new ScopeHelperExpandPart01TestMissingTemperature(45),
        );
        let actual: string = result.toString();
        let expected: string = '[25, 45]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart01TestMissingTemperature>(
          new ScopeHelperExpandPart01TestMissingTemperature(30),
          new ScopeHelperExpandPart01TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperExpandPart01TestMissingTemperature(0),
          new ScopeHelperExpandPart01TestMissingTemperature(50),
        );
        let actual: string = result.toString();
        let expected: string = '[0, 50]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart01TestMissingTemperature>(
          new ScopeHelperExpandPart01TestMissingTemperature(30),
          new ScopeHelperExpandPart01TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperExpandPart01TestMissingTemperature(10),
          new ScopeHelperExpandPart01TestMissingTemperature(20),
        );
        expect(result.toString()).assertEqual("[10, 40]");
        let actual: string = range.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart01TestMissingTemperature>(
          new ScopeHelperExpandPart01TestMissingTemperature(30),
          new ScopeHelperExpandPart01TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperExpandPart01TestMissingTemperature(10),
          new ScopeHelperExpandPart01TestMissingTemperature(20),
        );
        let actual = result.getLower().getTemp();
        let expected: int = 10;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart01TestMissingTemperature>(
          new ScopeHelperExpandPart01TestMissingTemperature(30),
          new ScopeHelperExpandPart01TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperExpandPart01TestMissingTemperature(50),
          new ScopeHelperExpandPart01TestMissingTemperature(60),
        );
        let actual = result.getUpper().getTemp();
        let expected: int = 60;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart01TestMissingTemperature>(
          new ScopeHelperExpandPart01TestMissingTemperature(-50),
          new ScopeHelperExpandPart01TestMissingTemperature(-10),
        );
        let result = range.expand(
          new ScopeHelperExpandPart01TestMissingTemperature(-60),
          new ScopeHelperExpandPart01TestMissingTemperature(-20),
        );
        let actual: string = result.toString();
        let expected: string = '[-60, -10]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart01TestMissingTemperature>(
          new ScopeHelperExpandPart01TestMissingTemperature(0),
          new ScopeHelperExpandPart01TestMissingTemperature(10),
        );
        let result = range.expand(
          new ScopeHelperExpandPart01TestMissingTemperature(-5),
          new ScopeHelperExpandPart01TestMissingTemperature(5),
        );
        let actual: string = result.toString();
        let expected: string = '[-5, 10]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart01TestMissingStringTemp>(
          new ScopeHelperExpandPart01TestMissingStringTemp('a'),
          new ScopeHelperExpandPart01TestMissingStringTemp('d'),
        );
        let result = range.expand(
          new ScopeHelperExpandPart01TestMissingStringTemp('e'),
          new ScopeHelperExpandPart01TestMissingStringTemp('g'),
        );
        let actual: string = result.toString();
        let expected: string = '[a, g]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-30),
          new ScopeHelperExpandPart03TestMissingTemperature(-20),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-25),
          new ScopeHelperExpandPart03TestMissingTemperature(-15),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[-30, -15]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-40),
          new ScopeHelperExpandPart03TestMissingTemperature(-30),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-10),
          new ScopeHelperExpandPart03TestMissingTemperature(-5),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[-40, -5]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_1200
     * @tc.name testScopeExpandConsistency002
     * @tc.desc Verify ScopeHelper expand state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandConsistency002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(45),
        );
        let result = scope.expand(arg);
        expect(result ===scope).assertFalse();

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
        let result = scope.expand(arg);
        let again = result.expand(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(20),
            new ScopeHelperExpandPart03TestMissingTemperature(25),
          ),
        );
        let actual: string = again.toString();
        let expected: string = '[20, 45]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(10),
          new ScopeHelperExpandPart03TestMissingTemperature(20),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(15),
          new ScopeHelperExpandPart03TestMissingTemperature(25),
        );
        let result = scope.expand(arg);
        let actual = result.getLower().getTemp();
        let expected: int = 10;
        expect(actual).assertEqual(expected);
        let actualA = result.getUpper().getTemp();
        let expectedA: int = 25;
        expect(actualA).assertEqual(expectedA);

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
        let result = scope.expand(arg);
        let clipped = result.intersect(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(40),
            new ScopeHelperExpandPart03TestMissingTemperature(50),
          ),
        );
        let actual: string = clipped.toString();
        let expected: string = '[40, 45]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(10),
          new ScopeHelperExpandPart03TestMissingTemperature(20),
        );
        let result = scope
          .expand(
            new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
              new ScopeHelperExpandPart03TestMissingTemperature(15),
              new ScopeHelperExpandPart03TestMissingTemperature(25),
            ),
          )
          .expand(
            new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
              new ScopeHelperExpandPart03TestMissingTemperature(5),
              new ScopeHelperExpandPart03TestMissingTemperature(35),
            ),
          );
        let actual: string = result.toString();
        let expected: string = '[5, 35]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let actualB = scope.expand(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(45),
            new ScopeHelperExpandPart03TestMissingTemperature(50),
          ),
        );
        let actualC = actualB.expand(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(10),
            new ScopeHelperExpandPart03TestMissingTemperature(20),
          ),
        );
        let actual: string = actualC.toString();
        let expected: string = '[10, 50]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(50),
          new ScopeHelperExpandPart03TestMissingTemperature(60),
        );
        let result = scope
          .expand(
            new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
              new ScopeHelperExpandPart03TestMissingTemperature(20),
              new ScopeHelperExpandPart03TestMissingTemperature(30),
            ),
          )
          .expand(
            new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
              new ScopeHelperExpandPart03TestMissingTemperature(80),
              new ScopeHelperExpandPart03TestMissingTemperature(90),
            ),
          );
        let actual: string = result.toString();
        let expected: string = '[20, 90]';
        expect(actual).assertEqual(expected);

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
        let resultA = scope.expand(arg);
        let resultB = arg.expand(scope);
        let actual: string = resultA.toString();
        let expected: string = '[30, 60]';
        expect(actual).assertEqual(expected);
        let actualA: string = resultB.toString();
        let expectedA: string = '[30, 60]';
        expect(actualA).assertEqual(expectedA);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(55));
        let actual = result.getLower().getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);
        let actualA = result.getUpper().getTemp();
        let expectedA: int = 55;
        expect(actualA).assertEqual(expectedA);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperExpandPart03TestMissingTemperature(32),
          new ScopeHelperExpandPart03TestMissingTemperature(35),
        );
        let actual = result.getLower().getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_1300
     * @tc.name testScopeExpandConsistency003
     * @tc.desc Verify ScopeHelper expand state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandConsistency003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let rangeFir = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(20),
          new ScopeHelperExpandPart03TestMissingTemperature(45),
        );
        let result = range.expand(rangeFir);
        let actual: string = result.toString();
        let expected: string = '[20, 45]';
        expect(actual).assertEqual(expected);
        let actualA: string = range.toString();
        let expectedA: string = '[30, 40]';
        expect(actualA).assertEqual(expectedA);
        let actualB: string = rangeFir.toString();
        let expectedB: string = '[20, 45]';
        expect(actualB).assertEqual(expectedB);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let actualC = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(25));
        let actualD = actualC.expand(new ScopeHelperExpandPart03TestMissingTemperature(55));
        let actual: string = actualD.toString();
        let expected: string = '[25, 55]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let actualC = range.expand(
          new ScopeHelperExpandPart03TestMissingTemperature(20),
          new ScopeHelperExpandPart03TestMissingTemperature(25),
        );
        let actualD = actualC.expand(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(50),
            new ScopeHelperExpandPart03TestMissingTemperature(60),
          ),
        );
        let actual: string = actualD.toString();
        let expected: string = '[20, 60]';
        expect(actual).assertEqual(expected);

      }
      {
        let upper = new ScopeHelperExpandPart04Test59Price(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart04Test59Price>(
          new ScopeHelperExpandPart04Test59Price(30),
          upper,
        );
        let actualC = range.expand(new ScopeHelperExpandPart04Test59Price(25));
        let actualD = range.expand(new ScopeHelperExpandPart04Test59Price(26));
        upper.setPrice(48);
        let actual: string = actualC.toString();
        let expected: string = '[25, 48]';
        expect(actual).assertEqual(expected);
        let actualA: string = actualD.toString();
        let expectedA: string = '[26, 48]';
        expect(actualA).assertEqual(expectedA);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_1400
     * @tc.name testScopeExpandBasic001
     * @tc.desc Verify ScopeHelper expand with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let range = new util.ScopeHelper<ScopeHelperByteValue>(new ScopeHelperByteValue(Int.toByte(30)), new ScopeHelperByteValue(Int.toByte(40)));
          let result = range.expand(new ScopeHelperByteValue(Int.toByte(10)), new ScopeHelperByteValue(Int.toByte(20)));
          let actual: string = result.toString();
          let expected: string = '[10, 40]';
          expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart01TestMissingTemperature>(
          new ScopeHelperExpandPart01TestMissingTemperature(30),
          new ScopeHelperExpandPart01TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperExpandPart01TestMissingTemperature(35),
          new ScopeHelperExpandPart01TestMissingTemperature(39),
        );
        let actual: boolean = result.contains(new ScopeHelperExpandPart01TestMissingTemperature(35));
        expect(actual).assertTrue();

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(1),
          new ScopeHelperExpandPart03TestMissingTemperature(9),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(4),
          new ScopeHelperExpandPart03TestMissingTemperature(12),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[1, 12]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = scope.expand(
          new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
            new ScopeHelperExpandPart03TestMissingTemperature(36),
            new ScopeHelperExpandPart03TestMissingTemperature(42),
          ),
        );
        let actual: string = result.toString();
        let expected: string = '[30, 42]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(20),
          new ScopeHelperExpandPart03TestMissingTemperature(50),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[20, 50]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(10),
          new ScopeHelperExpandPart03TestMissingTemperature(20),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[10, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = scope.expand(scope);
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
        let resultA = scope.expand(arg);
        let resultB = arg.expand(scope);
        let actual: string = resultA.toString();
        let expected: string = '[30, 45]';
        expect(actual).assertEqual(expected);
        let actualA: string = resultB.toString();
        let expectedA: string = '[30, 45]';
        expect(actualA).assertEqual(expectedA);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(0),
          new ScopeHelperExpandPart03TestMissingTemperature(1),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(0),
          new ScopeHelperExpandPart03TestMissingTemperature(10),
        );
        let result = scope.expand(arg);
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
          new ScopeHelperExpandPart03TestMissingTemperature(-100),
          new ScopeHelperExpandPart03TestMissingTemperature(100),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[-100, 100]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_1500
     * @tc.name testScopeExpandBasic002
     * @tc.desc Verify ScopeHelper expand with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(40),
          new ScopeHelperExpandPart03TestMissingTemperature(50),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(60),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[30, 60]';
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
        let result = scope.expand(arg);
        let actual = result.getLower().getTemp();
        let expected: int = 30;
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
        let result = scope.expand(arg);
        let actual = result.getUpper().getTemp();
        let expected: int = 45;
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(1),
          new ScopeHelperExpandPart03TestMissingTemperature(5),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(10),
          new ScopeHelperExpandPart03TestMissingTemperature(15),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[1, 15]';
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(100),
          new ScopeHelperExpandPart03TestMissingTemperature(200),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(150),
          new ScopeHelperExpandPart03TestMissingTemperature(250),
        );
        let result = scope.expand(arg);
        expect(result.getUpper().getTemp()).assertEqual(250);
        let actual = scope.getLower().getTemp();
        let expected: int = 100;
        expect(actual).assertEqual(expected);

      }
      {
        let scope = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let arg = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(36),
        );
        let result = scope.expand(arg);
        let actual: string = result.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let lower = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let upper = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lower, upper);
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(35));
        let actual: string = result.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let lower = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let upper = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lower, upper);
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(29));
        let actual: string = result.toString();
        let expected: string = '[29, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let lower = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let upper = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lower, upper);
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(41));
        let actual: string = result.toString();
        let expected: string = '[30, 41]';
        expect(actual).assertEqual(expected);

      }
      {
        let lower = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let upper = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lower, upper);
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(-100));
        let actual: string = result.toString();
        let expected: string = '[-100, 40]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_1600
     * @tc.name testScopeExpandBasic003
     * @tc.desc Verify ScopeHelper expand with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lower = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let upper = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lower, upper);
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(200));
        let actual: string = result.toString();
        let expected: string = '[30, 200]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(36),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(30));
        let actual: string = result.toString();
        let expected: string = '[30, 36]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(36),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(40));
        let actual: string = result.toString();
        let expected: string = '[35, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(36),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(35));
        let actual: string = result.toString();
        let expected: string = '[35, 36]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-50),
          new ScopeHelperExpandPart03TestMissingTemperature(-10),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(-20));
        let actual: string = result.toString();
        let expected: string = '[-50, -10]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-50),
          new ScopeHelperExpandPart03TestMissingTemperature(-10),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(-60));
        let actual: string = result.toString();
        let expected: string = '[-60, -10]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-50),
          new ScopeHelperExpandPart03TestMissingTemperature(-10),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(-5));
        let actual: string = result.toString();
        let expected: string = '[-50, -5]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(0),
          new ScopeHelperExpandPart03TestMissingTemperature(1),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(-1));
        let actual: string = result.toString();
        let expected: string = '[-1, 1]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(0),
          new ScopeHelperExpandPart03TestMissingTemperature(1),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(1));
        let actual: string = result.toString();
        let expected: string = '[0, 1]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingDirComp>(
          new ScopeHelperExpandPart03TestMissingDirComp(30),
          new ScopeHelperExpandPart03TestMissingDirComp(40),
        );
        ScopeHelperExpandPart03TestMissingDirComp.reversed = true;
        let result = range.expand(new ScopeHelperExpandPart03TestMissingDirComp(20));
        ScopeHelperExpandPart03TestMissingDirComp.reversed = false;
        let actual: string = result.toString();
        let expected: string = '[30, 20]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_1700
     * @tc.name testScopeExpandBasic004
     * @tc.desc Verify ScopeHelper expand with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(50));
        let actual: string = result.toString();
        let expected: string = '[30, 50]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let actual: string = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(45)).toString();
        let expected: string = '[30, 45]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(36),
        );
        let actual: string = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(10)).toString();
        let expected: string = '[10, 36]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(25));
        let actual: boolean = result.contains(new ScopeHelperExpandPart03TestMissingTemperature(25));
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(25));
        let actual: boolean = result.contains(new ScopeHelperExpandPart03TestMissingTemperature(30));
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(25));
        let actual: boolean = result.contains(new ScopeHelperExpandPart03TestMissingTemperature(40));
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(50));
        let actual: boolean = result.contains(new ScopeHelperExpandPart03TestMissingTemperature(50));
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let actualA = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(20));
        let actualB = actualA.expand(new ScopeHelperExpandPart03TestMissingTemperature(60));
        let actual: string = actualB.toString();
        let expected: string = '[20, 60]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let actualA = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(50));
        let actualB = actualA.expand(new ScopeHelperExpandPart03TestMissingTemperature(25));
        let actualC = actualB.expand(new ScopeHelperExpandPart03TestMissingTemperature(100));
        let actual: string = actualC.toString();
        let expected: string = '[25, 100]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let actualA = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(20));
        let actualB = actualA.expand(new ScopeHelperExpandPart03TestMissingTemperature(25));
        let actual: string = actualB.toString();
        let expected: string = '[20, 40]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_1800
     * @tc.name testScopeExpandBasic005
     * @tc.desc Verify ScopeHelper expand with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandBasic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingBigBalance>(
          new ScopeHelperExpandPart03TestMissingBigBalance(0n),
          new ScopeHelperExpandPart03TestMissingBigBalance(100n),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingBigBalance(50n));
        let actual: string = result.toString();
        let expected: string = '[0, 100]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingWord>(
          new ScopeHelperExpandPart03TestMissingWord('a'),
          new ScopeHelperExpandPart03TestMissingWord('dd'),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingWord('a'));
        let actual: string = result.toString();
        let expected: string = '[a, dd]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingFlag>(
          new ScopeHelperExpandPart03TestMissingFlag(false),
          new ScopeHelperExpandPart03TestMissingFlag(true),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingFlag(true));
        let actual: string = result.toString();
        let expected: string = '[false, true]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingHeight>(
          new ScopeHelperExpandPart03TestMissingHeight(10),
          new ScopeHelperExpandPart03TestMissingHeight(20),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingHeight(5));
        let actual: string = result.toString();
        let expected: string = '[5, 20]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingCode>(
          new ScopeHelperExpandPart03TestMissingCode(Int.toChar(97)),
          new ScopeHelperExpandPart03TestMissingCode(Int.toChar(101)),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingCode(Int.toChar(98)));
        let actual: string = result.toString();
        let expected: string = '[a, e]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingDateWrap>(
          new ScopeHelperExpandPart03TestMissingDateWrap(new Date(2020, 0, 1)),
          new ScopeHelperExpandPart03TestMissingDateWrap(new Date(2020, 11, 31)),
        );
        let later = new ScopeHelperExpandPart03TestMissingDateWrap(new Date(2021, 5, 1));
        let result = range.expand(later);
        let actual: boolean = result.contains(later);
        expect(actual).assertTrue();

      }
      {
        let m2: Map<string, int> = new Map<string, int>();
        m2.set('a', 1);
        m2.set('b', 2);
        let m4: Map<string, int> = new Map<string, int>();
        m4.set('a', 1);
        m4.set('b', 2);
        m4.set('c', 3);
        m4.set('d', 4);
        let m9: Map<string, int> = new Map<string, int>();
        m9.set('a', 1);
        m9.set('b', 2);
        m9.set('c', 3);
        m9.set('d', 4);
        m9.set('e', 5);
        m9.set('f', 6);
        m9.set('g', 7);
        m9.set('h', 8);
        m9.set('i', 9);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingMapSize>(
          new ScopeHelperExpandPart03TestMissingMapSize(m2),
          new ScopeHelperExpandPart03TestMissingMapSize(m4),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingMapSize(m9));
        let actual: string = result.toString();
        let expected: string = '[2, 9]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(25));
        let actual = result.getLower().getTemp();
        let expected: int = 25;
        expect(actual).assertEqual(expected);
        let actualA = result.getUpper().getTemp();
        let expectedA: int = 40;
        expect(actualA).assertEqual(expectedA);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(45),
        );
        let actual = result.getLower().getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);
        let actualA = result.getUpper().getTemp();
        let expectedA: int = 45;
        expect(actualA).assertEqual(expectedA);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperExpandPart03TestMissingTemperature(10),
          new ScopeHelperExpandPart03TestMissingTemperature(60),
        );
        let actual: string = result.toString();
        let expected: string = '[10, 60]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_EXPAND_1900
     * @tc.name testScopeExpandBasic006
     * @tc.desc Verify ScopeHelper expand with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeExpandBasic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let rangeFir = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(32),
          new ScopeHelperExpandPart03TestMissingTemperature(38),
        );
        let result = range.expand(rangeFir);
        let actual = result.getLower().getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);
        let actualA = result.getUpper().getTemp();
        let expectedA: int = 40;
        expect(actualA).assertEqual(expectedA);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperExpandPart03TestMissingTemperature(45),
          new ScopeHelperExpandPart03TestMissingTemperature(60),
        );
        let actual: string = result.toString();
        let expected: string = '[30, 60]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let rangeFir = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(50),
          new ScopeHelperExpandPart03TestMissingTemperature(70),
        );
        let result = range.expand(rangeFir);
        let actual: string = result.toString();
        let expected: string = '[30, 70]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(
          new ScopeHelperExpandPart03TestMissingTemperature(35),
          new ScopeHelperExpandPart03TestMissingTemperature(35),
        );
        let actual: string = result.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart04Test38GuardCompare>(
          new ScopeHelperExpandPart04Test38GuardCompare(30),
          new ScopeHelperExpandPart04Test38GuardCompare(40),
        );
        let result = range.expand(new ScopeHelperExpandPart04Test38GuardCompare(50));
        let actual: string = result.toString();
        let expected: string = '[30, 50]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(-30),
          new ScopeHelperExpandPart03TestMissingTemperature(40),
        );
        let result = range.expand(new ScopeHelperExpandPart03TestMissingTemperature(10));
        let actual: string = result.toString();
        let expected: string = '[-30, 40]';
        expect(actual).assertEqual(expected);

      }
    });

  });
}
