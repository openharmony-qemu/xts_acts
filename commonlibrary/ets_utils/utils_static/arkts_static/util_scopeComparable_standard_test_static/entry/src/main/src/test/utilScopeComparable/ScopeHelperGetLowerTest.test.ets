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

export default function ScopeHelperGetLowerTest(): void {
  describe('ScopeHelperGetLowerTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_LOWER_0100
     * @tc.name testScopeLowerThrows001
     * @tc.desc Verify ScopeHelper getLower throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeLowerThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.ScopeHelper<ScopeHelperBooleanValue>(
            new ScopeHelperBooleanValue(true),
            new ScopeHelperBooleanValue(true),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let lower: Error = new Error('low-end');
        let upper: Error = new Error('boom');
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Error = range.getLower().getValue() as Error;
        let actual = result.message;
        let expectedA: string = 'low-end';
        expect(actual).assertEqual(expectedA);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_LOWER_0200
     * @tc.name testScopeLowerBigInt001
     * @tc.desc Verify ScopeHelper getLower with BigInt bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeLowerBigInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperBigIntValue>(
          new ScopeHelperBigIntValue(BigInt(42)),
          new ScopeHelperBigIntValue(BigInt(43)),
        );
        let result: bigint = range.getLower().getValue();
        expect(result).assertEqual(BigInt(42));

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_LOWER_0300
     * @tc.name testScopeLowerDate001
     * @tc.desc Verify ScopeHelper getLower with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeLowerDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(
          new ScopeHelperIntValue(2147483646),
          new ScopeHelperIntValue(2147483647),
        );
        let result: int = range.getLower().getValue();
        expect(result).assertEqual(2147483646);

      }
      {
        let lower: long = 9000000000;
        let upper: long = 9000000001;
        let range = new util.ScopeHelper<ScopeHelperLongValue>(
          new ScopeHelperLongValue(lower),
          new ScopeHelperLongValue(upper),
        );
        let result: long = range.getLower().getValue();
        expect(result).assertEqual(9000000000);

      }
      {
        let lower: long = -999999999999999;
        let upper: long = -1;
        let range = new util.ScopeHelper<ScopeHelperLongValue>(
          new ScopeHelperLongValue(lower),
          new ScopeHelperLongValue(upper),
        );
        let result: long = range.getLower().getValue();
        expect(result).assertEqual(-999999999999999);

      }
      {
        let lower: Date = Utils.dateFromTime(1720000000000);
        let upper: Date = Utils.dateFromTime(1720000000001);
        let range = new util.ScopeHelper<ScopeHelperDateValue>(
          new ScopeHelperDateValue(lower),
          new ScopeHelperDateValue(upper),
        );
        let result: Date = range.getLower().getValue();
        let actual = result.getTime();
        let expectedA: long = 1720000000000;
        expect(actual).assertEqual(expectedA);

      }
      {
        let lower: Date = Utils.dateFromTime(0);
        let upper: Date = Utils.dateFromTime(86400000);
        let range = new util.ScopeHelper<ScopeHelperDateValue>(
          new ScopeHelperDateValue(lower),
          new ScopeHelperDateValue(upper),
        );
        let result: Date = range.getLower().getValue();
        let actual = result.getTime();
        let expectedA: int = 0;
        expect(actual).assertEqual(expectedA);

      }
      {
        let lower: Date = Utils.dateFromTime(86400000);
        let upper: Date = Utils.dateFromTime(1720000000000);
        let range = new util.ScopeHelper<ScopeHelperDateValue>(
          new ScopeHelperDateValue(lower),
          new ScopeHelperDateValue(upper),
        );
        let got: Date = range.getLower().getValue();
        expect(range.getLower().getValue().getTime()).assertEqual(86400000);
        got.setFullYear(2031);
        let actual = lower.getFullYear();
        let expectedA: int = 2031;
        expect(actual).assertEqual(expectedA);

      }
      {
        let lower: Date = Utils.dateFromTime(1000);
        let upper: Date = Utils.dateFromTime(2000);
        let range = new util.ScopeHelper<ScopeHelperDateValue>(
          new ScopeHelperDateValue(lower),
          new ScopeHelperDateValue(upper),
        );
        let result: Date = range.getLower().getValue();
        let actual = result.getTime();
        let expected = lower.getTime();
        expect(actual).assertEqual(expected);

      }
      {
        let lower: Date = Utils.dateFromTime(86400000);
        let upper: Date = Utils.dateFromTime(1720000000000);
        let range = new util.ScopeHelper<ScopeHelperDateValue>(
          new ScopeHelperDateValue(lower),
          new ScopeHelperDateValue(upper),
        );
        let result: Object = range.getLower().getValue();
        let actual = (result as Date).getTime();
        let expected: int = 86400000;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_LOWER_0400
     * @tc.name testScopeLowerChar001
     * @tc.desc Verify ScopeHelper getLower with char bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeLowerChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lower = Int.toChar(65);
        let upper = Int.toChar(90);
        let range = new util.ScopeHelper<ScopeHelperCharValue>(
          new ScopeHelperCharValue(lower),
          new ScopeHelperCharValue(upper),
        );
        let result: char = range.getLower().getValue();
        expect(result).assertEqual(Int.toChar(65));

      }
      {
        let lower = Int.toChar(48);
        let upper = Int.toChar(57);
        let range = new util.ScopeHelper<ScopeHelperCharValue>(
          new ScopeHelperCharValue(lower),
          new ScopeHelperCharValue(upper),
        );
        let result: char = range.getLower().getValue();
        expect(result).assertEqual(Int.toChar(48));

      }
      {
        let lower: string[] = ['x'];
        let upper: string[] = ['y'];
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Object = range.getLower().getValue();
        let actual: int = (result as string[]).length;
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_LOWER_0500
     * @tc.name testScopeLowerStr001
     * @tc.desc Verify ScopeHelper getLower with string bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeLowerStr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue('上限值'),
          new ScopeHelperStringValue('下限值'),
        );
        let result: string = range.getLower().getValue();
        expect(result).assertEqual('上限值');

      }
      {
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue('   '),
          new ScopeHelperStringValue('a'),
        );
        let result: string = range.getLower().getValue();
        expect(result).assertEqual('   ');

      }
      {
        let longStr: string = 'x'.repeat(10000);
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue(longStr),
          new ScopeHelperStringValue(longStr + 'y'),
        );
        let result: string = range.getLower().getValue();
        let actual: int = result.length;
        let expectedA: int = 10000;
        expect(actual).assertEqual(expectedA);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue('abc你好123'),
          new ScopeHelperStringValue('xyz'),
        );
        let result: string = range.getLower().getValue();
        expect(result).assertEqual('abc你好123');

      }
      {
        let lower: string[] = ['low', 'mid'];
        let upper: string[] = ['high'];
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Object = range.getLower().getValue();
        let actual = (result as string[])[1];
        let expectedA: string = 'mid';
        expect(actual).assertEqual(expectedA);

      }
      {
        let lower: string = 'b';
        let upper: string = 'a';
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let actual = range.getLower().getValue();
        let expectedA = lower;
        expect(actual).assertEqual(expectedA);

      }
      {
        let lower: string = 'a';
        let upper: string = 'z';
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let got: string = range.getLower().getValue() as string;
        expect(got).assertEqual('a');

      }
      {
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue('hello'),
          new ScopeHelperStringValue('world'),
        );
        let result: string = range.getLower().getValue();
        let actual: int = result.length;
        let expected: int = 5;
        expect(actual).assertEqual(expected);

      }
      {
        let lower: string = 'fixed';
        let upper: string = 'upper';
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue(lower),
          new ScopeHelperStringValue(upper),
        );
        expect(range.getUpper().getValue()).assertEqual("upper");
        expect(range.toString()).assertEqual("[fixed, upper]");
        let result: string = range.getLower().getValue();
        expect(result).assertEqual('fixed');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_LOWER_0600
     * @tc.name testScopeLowerBool001
     * @tc.desc Verify ScopeHelper getLower with boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeLowerBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperBooleanValue>(
          new ScopeHelperBooleanValue(false),
          new ScopeHelperBooleanValue(true),
        );
        let result: boolean = range.getLower().getValue();
        expect(result).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_LOWER_0700
     * @tc.name testScopeLowerFloatDouble001
     * @tc.desc Verify ScopeHelper getLower with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeLowerFloatDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(-2.25),
          new ScopeHelperDoubleValue(-1.0),
        );
        let result: double = range.getLower().getValue();
        expect(result).assertEqual(-2.25);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(-5.5),
          new ScopeHelperDoubleValue(5.5),
        );
        let result: double = range.getLower().getValue();
        expect(result).assertEqual(-5.5);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(-0.125),
          new ScopeHelperDoubleValue(-0.124),
        );
        let result: double = range.getLower().getValue();
        expect(result).assertEqual(-0.125);

      }
      {
        let lower = 1.75 as float;
        let upper = 2.5 as float;
        let range = new util.ScopeHelper<ScopeHelperFloatValue>(
          new ScopeHelperFloatValue(lower),
          new ScopeHelperFloatValue(upper),
        );
        let result: float = range.getLower().getValue();
        expect(result).assertEqual(1.75);

      }
      {
        let posInf: double = Number.POSITIVE_INFINITY;
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(0.0),
          new ScopeHelperDoubleValue(posInf),
        );
        let result: double = range.getLower().getValue();
        expect(result).assertEqual(0.0);

      }
      {
        let lower: Float64Array = new Float64Array([1.5, 2.5]);
        let upper: Float64Array = new Float64Array([3.5]);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Float64Array = range.getLower().getValue() as Float64Array;
        let actual = ArrayBuffer.isView(result);
        expect(actual).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_LOWER_0800
     * @tc.name testScopeLowerInt001
     * @tc.desc Verify ScopeHelper getLower with int bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeLowerInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(-3), new ScopeHelperIntValue(5));
        let result: int = range.getLower().getValue();
        expect(result).assertEqual(-3);

      }
      {
        let lower: int[] = [10, 20, 30];
        let upper: int[] = [99];
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Object = range.getLower().getValue();
        let actual: int = (result as int[]).length;
        let expected: int = 3;
        expect(actual).assertEqual(expected);

      }
      {
        let lower: int[][] = [[1], [2]];
        let upper: int[][] = [[3]];
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Object = range.getLower().getValue();
        let actual: int = (result as int[][]).length;
        let expected: int = 2;
        expect(actual).assertEqual(expected);

      }
      {
        let lower: int[] = [5, 6];
        let upper: int[] = [9];
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Object = range.getLower().getValue();
        let actual: int = (result as int[]).length;
        let expected: int = 2;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_LOWER_0900
     * @tc.name testScopeLowerCustom001
     * @tc.desc Verify ScopeHelper getLower with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeLowerCustom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lower: byte = -127 - 1;
        let upper: byte = 127;
        let range = new util.ScopeHelper<ScopeHelperByteValue>(
          new ScopeHelperByteValue(lower),
          new ScopeHelperByteValue(upper),
        );
        let result: byte = range.getLower().getValue();
        expect(result).assertEqual(-128);

      }
      {
        let lower: short = -100;
        let upper: short = 100;
        let range = new util.ScopeHelper<ScopeHelperShortValue>(
          new ScopeHelperShortValue(lower),
          new ScopeHelperShortValue(upper),
        );
        let result: short = range.getLower().getValue();
        expect(result).assertEqual(-100);

      }
      {
        let lower: RegExp = new RegExp('xy', 'g');
        let upper: RegExp = new RegExp('abc', 'g');
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: RegExp = range.getLower().getValue() as RegExp;
        let actual = result.source;
        let expectedA: string = 'xy';
        expect(actual).assertEqual(expectedA);

      }
      {
        let lower: int[] = [1, 2, 3];
        let upper: int[] = [9];
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Object = range.getLower().getValue();
        let actual: int = (result as Object[]).length;
        let expectedA: int = 3;
        expect(actual).assertEqual(expectedA);

      }
      {
        let lower: Map<string, int> = new Map<string, int>();
        lower.set('k', 9);
        let upper: Map<string, int> = new Map<string, int>();
        upper.set('a', 1);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Map<string, int> = range.getLower().getValue() as Map<string, int>;
        let actual = result.get('k');
        let expectedA: int = 9;
        expect(actual).assertEqual(expectedA);

      }
      {
        let lower: Uint8Array = new Uint8Array([0x01, 0x02]);
        let upper: Uint8Array = new Uint8Array([0xff]);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let got: Uint8Array = range.getLower().getValue() as Uint8Array;
        expect((range.getLower().getValue() as Uint8Array).$_get(0)).assertEqual(0x01);
        got.$_set(0, 0x63);
        let actual = lower.$_get(0);
        let expectedA = 0x63;
        expect(actual).assertEqual(expectedA);

      }
      {
        let tempLower = new ScopeHelperGetLowerPart02Test3TempChain(1);
        let tempUpper = new ScopeHelperGetLowerPart02Test3TempChain(2);
        let range = new util.ScopeHelper<ScopeHelperGetLowerPart02Test3TempChain>(tempLower, tempUpper);
        let result: ScopeHelperGetLowerPart02Test3TempChain = range.getLower();
        let actual = result.getTemp();
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        let lower: Int32Array = new Int32Array([3]);
        let upper: Int32Array = new Int32Array([4]);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Object = range.getLower().getValue();
        let actual: boolean = result instanceof Int32Array;
        expect(actual).assertTrue();

      }
      {
        let lower: Uint8Array = new Uint8Array([0x01, 0x02, 0x03]);
        let upper: Uint8Array = new Uint8Array([0xff]);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Uint8Array = range.getLower().getValue() as Uint8Array;
        let actual: int = result.byteLength;
        let expected: int = 3;
        expect(actual).assertEqual(expected);

      }
      {
        let lower: Int32Array = new Int32Array([1, 2]);
        let upper: Int32Array = new Int32Array([0]);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Int32Array = range.getLower().getValue() as Int32Array;
        let actual: int = result.byteLength;
        let expected: int = 8;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_LOWER_1000
     * @tc.name testScopeLowerCustom002
     * @tc.desc Verify ScopeHelper getLower with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeLowerCustom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lower: Map<string, int> = new Map<string, int>();
        lower.set('x', 1);
        let upper: Map<string, int> = new Map<string, int>();
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Object = range.getLower().getValue();
        expect(result).assertEqual(lower);

      }
      {
        let lower: Uint16Array = new Uint16Array([1, 2, 3]);
        let upper: Uint16Array = new Uint16Array([4]);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Uint16Array = range.getLower().getValue() as Uint16Array;
        let actual = result.buffer;
        let expected = lower.buffer;
        expect(actual).assertEqual(expected);

      }
      {
        let ab: ArrayBuffer = new ArrayBuffer(8);
        let lower: Uint8Array = new Uint8Array(ab, 2, 4);
        let upper: Uint8Array = new Uint8Array(ab, 0, 2);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Uint8Array = range.getLower().getValue() as Uint8Array;
        let actual: int = result.byteOffset;
        let expected: int = 2;
        expect(actual).assertEqual(expected);

      }
      {
        let tempLower = new ScopeHelperGetLowerPart02Test3TempChain(5);
        let tempUpper = new ScopeHelperGetLowerPart02Test3TempChain(15);
        let range = new util.ScopeHelper<ScopeHelperGetLowerPart02Test3TempChain>(tempLower, tempUpper);
        let result: ScopeHelperGetLowerPart02Test3TempChain = range.getLower();
        let actual: boolean = result.compareTo(new ScopeHelperGetLowerPart02Test3TempChain(10));
        expect(actual).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_LOWER_1100
     * @tc.name testScopeLowerConsistency001
     * @tc.desc Verify ScopeHelper getLower state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeLowerConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(10), new ScopeHelperIntValue(50));
        let result: int = range.getLower().getValue();
        expect(result).assertEqual(10);

      }
      {
        let lower: Person = new Person('Bob', 20);
        let upper: Person = new Person('Alice', 30);
        let range = new util.ScopeHelper<Person>(lower, upper);
        let result: Person = range.getLower();
        let actual = result.name;
        let expectedA: string = 'Bob';
        expect(actual).assertEqual(expectedA);

      }
      {
        let tempLower = new ScopeHelperGetLowerPart01Test4TemperatureD(30);
        let tempUpper = new ScopeHelperGetLowerPart01Test4TemperatureD(40);
        let range = new util.ScopeHelper<ScopeHelperGetLowerPart01Test4TemperatureD>(tempLower, tempUpper);
        let got: ScopeHelperGetLowerPart01Test4TemperatureD = range.getLower();
        expect(range.getLower().getTemp()).assertEqual(30);
        got.setTemp(55);
        let actual = tempLower.getTemp();
        let expectedA: int = 55;
        expect(actual).assertEqual(expectedA);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(42), new ScopeHelperIntValue(99));
        let result: Object = range.getLower().getValue();
        let actual: string = result.toString();
        let expected: string = '42';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(77), new ScopeHelperIntValue(88));
        let m: Map<int, string> = new Map<int, string>();
        m.set(range.getLower().getValue(), 'low');
        let actual = m.get(77);
        let expected: string = 'low';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(18), new ScopeHelperIntValue(36));
        let result: int = range.getLower().getValue();
        let actual = result * 2;
        let expected: int = 36;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_LOWER_1200
     * @tc.name testScopeLowerBasic001
     * @tc.desc Verify ScopeHelper getLower with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeLowerBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(-5), new ScopeHelperIntValue(5));
        let first: int = range.getUpper().getValue();
        let second: int = range.getLower().getValue();
        expect(first).assertEqual(5);
        expect(second).assertEqual(-5);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(5), new ScopeHelperIntValue(9));
        let expanded = range.expand(new ScopeHelperIntValue(5), new ScopeHelperIntValue(9));
        let actual = expanded.getLower().getValue();
        let expected: int = 5;
        expect(actual).assertEqual(expected);

      }
    });

  });
}
