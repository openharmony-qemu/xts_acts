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

export default function ScopeHelperGetUpperTest(): void {
  describe('ScopeHelperGetUpperTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_0100
     * @tc.name testScopeUpperThrows001
     * @tc.desc Verify ScopeHelper getUpper throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingBoolValue>(
            new ScopeHelperGetUpperPart02TestMissingBoolValue(true),
            new ScopeHelperGetUpperPart02TestMissingBoolValue(false),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingErrorValue(new Error('a'));
        let hi = new ScopeHelperGetUpperPart02TestMissingErrorValue(new Error('boom'));
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingErrorValue>(lo, hi);
        let actual = range.getUpper().getE().message;
        let expected: string = 'boom';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_0200
     * @tc.name testScopeUpperBigInt001
     * @tc.desc Verify ScopeHelper getUpper with BigInt bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperBigInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperBigIntValue>(
          new ScopeHelperBigIntValue(BigInt(0)),
          new ScopeHelperBigIntValue(BigInt(9223372036854775807)),
        );
        let result: bigint = range.getUpper().getValue();
        expect(result).assertEqual(BigInt(9223372036854775807));

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_0300
     * @tc.name testScopeUpperDate001
     * @tc.desc Verify ScopeHelper getUpper with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperLongValue>(
          new ScopeHelperLongValue(0),
          new ScopeHelperLongValue(999999999999999),
        );
        let result: long = range.getUpper().getValue();
        expect(result).assertEqual(999999999999999);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperLongValue>(
          new ScopeHelperLongValue(-999999999999999),
          new ScopeHelperLongValue(0),
        );
        let result: long = range.getUpper().getValue();
        expect(result).assertEqual(0);

      }
      {
        let lower: Date = Utils.dateFromTime(1720000000000);
        let upper: Date = Utils.dateFromTime(1720000000001);
        let range = new util.ScopeHelper<ScopeHelperDateValue>(
          new ScopeHelperDateValue(lower),
          new ScopeHelperDateValue(upper),
        );
        let result: Date = range.getUpper().getValue();
        let actual = result.getTime();
        let expected: long = 1720000000001;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingTemperature(-2147483648);
        let hi = new ScopeHelperGetUpperPart02TestMissingTemperature(2147483647);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingTemperature>(lo, hi);
        let actual = range.getUpper().getTemp();
        let expected: int = 2147483647;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingLongValue(1);
        let hi = new ScopeHelperGetUpperPart02TestMissingLongValue(10000000000);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingLongValue>(lo, hi);
        let actual = range.getUpper().getL();
        let expected: long = 10000000000;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingLongValue(0);
        let hi = new ScopeHelperGetUpperPart02TestMissingLongValue(9223372036854775807);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingLongValue>(lo, hi);
        let actual = range.getUpper().getL();
        let expected: long = 9223372036854775807;
        expect(actual).assertEqual(expected);

      }
      {
        let ms = 1700000000000;
        let lo = new ScopeHelperGetUpperPart02TestMissingDateValue(1000);
        let hi = new ScopeHelperGetUpperPart02TestMissingDateValue(ms);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingDateValue>(lo, hi);
        let actual = range.getUpper().getDate().getTime();
        let expected = ms;
        expect(actual).assertEqual(expected);

      }
      {
        let ms = 1700000000000;
        let range1 = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingDateValue>(
          new ScopeHelperGetUpperPart02TestMissingDateValue(0),
          new ScopeHelperGetUpperPart02TestMissingDateValue(ms),
        );
        let range2 = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingDateValue>(
          new ScopeHelperGetUpperPart02TestMissingDateValue(0),
          new ScopeHelperGetUpperPart02TestMissingDateValue(ms),
        );
        let u1 = range1.getUpper();
        let u2 = range2.getUpper();
        let actual: boolean = u1.compareTo(u2);
        expect(actual).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_0400
     * @tc.name testScopeUpperChar001
     * @tc.desc Verify ScopeHelper getUpper with char bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lower = Int.toChar(65);
        let upper = Int.toChar(90);
        let range = new util.ScopeHelper<ScopeHelperCharValue>(
          new ScopeHelperCharValue(lower),
          new ScopeHelperCharValue(upper),
        );
        let result: char = range.getUpper().getValue();
        expect(result).assertEqual(Int.toChar(90));

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_0500
     * @tc.name testScopeUpperStr001
     * @tc.desc Verify ScopeHelper getUpper with string bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperStr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue('a'),
          new ScopeHelperStringValue('upper-bound'),
        );
        let result: string = range.getUpper().getValue();
        expect(result).assertEqual('upper-bound');

      }
      {
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue('a'),
          new ScopeHelperStringValue('abc你好123'),
        );
        let result: string = range.getUpper().getValue();
        expect(result).assertEqual('abc你好123');

      }
      {
        let lower: string = 'b';
        let upper: string = 'a';
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let actual = range.getUpper().getValue();
        let expected = upper;
        expect(actual).assertEqual(expected);

      }
      {
        let longStr: string = 'x'.repeat(1000);
        let lo = new ScopeHelperGetUpperPart02TestMissingStringValue('a');
        let hi = new ScopeHelperGetUpperPart02TestMissingStringValue(longStr);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingStringValue>(lo, hi);
        let actual: int = range.getUpper().getS().length;
        let expected: int = 1000;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingStringValue('a');
        let hi = new ScopeHelperGetUpperPart02TestMissingStringValue('😀');
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingStringValue>(lo, hi);
        let actual = range.getUpper().getS();
        let expected: string = '😀';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingStringValue('a');
        let hi = new ScopeHelperGetUpperPart02TestMissingStringValue('a\0b');
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingStringValue>(lo, hi);
        let actual = range.getUpper().getS();
        let expected: string = 'a\0b';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_0600
     * @tc.name testScopeUpperBool001
     * @tc.desc Verify ScopeHelper getUpper with boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperBooleanValue>(
          new ScopeHelperBooleanValue(false),
          new ScopeHelperBooleanValue(true),
        );
        let result: boolean = range.getUpper().getValue();
        expect(result).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_0700
     * @tc.name testScopeUpperFloatDouble001
     * @tc.desc Verify ScopeHelper getUpper with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperFloatDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(-1.0),
          new ScopeHelperDoubleValue(0.0),
        );
        let result: double = range.getUpper().getValue();
        expect(result).assertEqual(0.0);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(-1.0),
          new ScopeHelperDoubleValue(1.0),
        );
        let result: double = range.getUpper().getValue();
        expect(result).assertEqual(1.0);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(0.0),
          new ScopeHelperDoubleValue(2.5),
        );
        let result: double = range.getUpper().getValue();
        expect(result).assertEqual(2.5);

      }
      {
        let lower = -2.0 as float;
        let upper = -1.5 as float;
        let range = new util.ScopeHelper<ScopeHelperFloatValue>(
          new ScopeHelperFloatValue(lower),
          new ScopeHelperFloatValue(upper),
        );
        let result: float = range.getUpper().getValue();
        expect(result).assertEqual(-1.5);

      }
      {
        let lower: Float64Array = new Float64Array([0.0]);
        let upper: Float64Array = new Float64Array([1.5, 2.5]);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Object = range.getUpper().getValue();
        let actual: int = (result as Float64Array).length;
        let expected: int = 2;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingDoubleValue(-10.5);
        let hi = new ScopeHelperGetUpperPart02TestMissingDoubleValue(-0.5);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingDoubleValue>(lo, hi);
        let actual = range.getUpper().getD();
        let expected = -0.5;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingFloatValue(-1);
        let hi = new ScopeHelperGetUpperPart02TestMissingFloatValue(0);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingFloatValue>(lo, hi);
        let actual = range.getUpper().getF();
        let expected = 0.0;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_0800
     * @tc.name testScopeUpperInt001
     * @tc.desc Verify ScopeHelper getUpper with int bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(0), new ScopeHelperIntValue(1));
        let result: int = range.getUpper().getValue();
        expect(result).assertEqual(1);

      }
      {
        let lower: int[] = [0];
        let upper: int[] = [1, 2, 3];
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Object = range.getUpper().getValue();
        let actual: int = (result as int[]).length;
        let expected: int = 3;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_0900
     * @tc.name testScopeUpperCustom001
     * @tc.desc Verify ScopeHelper getUpper with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperCustom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperByteValue>(
          new ScopeHelperByteValue(0),
          new ScopeHelperByteValue(127),
        );
        let result: byte = range.getUpper().getValue();
        expect(result).assertEqual(127);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperByteValue>(
          new ScopeHelperByteValue(-128),
          new ScopeHelperByteValue(0),
        );
        let result: byte = range.getUpper().getValue();
        expect(result).assertEqual(0);

      }
      {
        let lower: short = -1;
        let upper: short = 0;
        let range = new util.ScopeHelper<ScopeHelperShortValue>(
          new ScopeHelperShortValue(lower),
          new ScopeHelperShortValue(upper),
        );
        let result: short = range.getUpper().getValue();
        expect(result).assertEqual(0);

      }
      {
        let tempLower = new ScopeHelperGetLowerPart01Test2TemperatureB(30);
        let tempUpper = new ScopeHelperGetLowerPart01Test2TemperatureB(40);
        let range = new util.ScopeHelper<ScopeHelperGetLowerPart01Test2TemperatureB>(tempLower, tempUpper);
        let result: ScopeHelperGetLowerPart01Test2TemperatureB = range.getUpper();
        let actual = result.getTemp();
        let expected: int = 40;
        expect(actual).assertEqual(expected);

      }
      {
        let lower: Set<int> = new Set<int>();
        let upper: Set<int> = new Set<int>();
        upper.add(1);
        upper.add(2);
        upper.add(3);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lower),
          new ScopeHelperObjectValue(upper),
        );
        let result: Object = range.getUpper().getValue();
        let actual = (result as Set<int>).size;
        let expected: int = 3;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingStringValue('a');
        let hi = new ScopeHelperGetUpperPart02TestMissingStringValue('high');
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingStringValue>(lo, hi);
        let actual: int = range.getUpper().getS().length;
        let expected: int = 4;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingArrValue([1]);
        let hi = new ScopeHelperGetUpperPart02TestMissingArrValue([4, 5, 6]);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingArrValue>(lo, hi);
        let actual: int = range.getUpper().getA().length;
        let expected: int = 3;
        expect(actual).assertEqual(expected);

      }
      {
        let bigArr: long[] = [];
        for (let i = 0; i < 100; i++) {
          bigArr.push(i);
        }
        let lo = new ScopeHelperGetUpperPart02TestMissingArrValue([0]);
        let hi = new ScopeHelperGetUpperPart02TestMissingArrValue(bigArr);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingArrValue>(lo, hi);
        let actual: int = range.getUpper().getA().length;
        let expected: int = 100;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingRegexValue(new RegExp('a'));
        let hi = new ScopeHelperGetUpperPart02TestMissingRegexValue(new RegExp('ab+c'));
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingRegexValue>(lo, hi);
        let actual = range.getUpper().getR().source;
        let expected: string = 'ab+c';
        expect(actual).assertEqual(expected);

      }
      {
        let range1 = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingRegexValue>(
          new ScopeHelperGetUpperPart02TestMissingRegexValue(new RegExp('a')),
          new ScopeHelperGetUpperPart02TestMissingRegexValue(new RegExp('ab+c')),
        );
        let range2 = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingRegexValue>(
          new ScopeHelperGetUpperPart02TestMissingRegexValue(new RegExp('a')),
          new ScopeHelperGetUpperPart02TestMissingRegexValue(new RegExp('ab+c')),
        );
        let u1 = range1.getUpper();
        let u2 = range2.getUpper();
        let actual: boolean = u1.compareTo(u2);
        expect(actual).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_1000
     * @tc.name testScopeUpperCustom002
     * @tc.desc Verify ScopeHelper getUpper with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperCustom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range1 = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingArrValue>(
          new ScopeHelperGetUpperPart02TestMissingArrValue([1]),
          new ScopeHelperGetUpperPart02TestMissingArrValue([4, 5, 6]),
        );
        let range2 = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingArrValue>(
          new ScopeHelperGetUpperPart02TestMissingArrValue([2]),
          new ScopeHelperGetUpperPart02TestMissingArrValue([4, 5, 6]),
        );
        let u1 = range1.getUpper();
        let u2 = range2.getUpper();
        let actual: boolean = u1.compareTo(u2);
        expect(actual).assertTrue();

      }
      {
        let m1: Map<string, number> = new Map<string, number>();
        m1.set('a', 1);
        m1.set('b', 2);
        let m2: Map<string, number> = new Map<string, number>();
        m2.set('a', 1);
        m2.set('b', 2);
        let range1 = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingMapValue>(
          new ScopeHelperGetUpperPart02TestMissingMapValue(new Map<string, number>()),
          new ScopeHelperGetUpperPart02TestMissingMapValue(m1),
        );
        let range2 = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingMapValue>(
          new ScopeHelperGetUpperPart02TestMissingMapValue(new Map<string, number>()),
          new ScopeHelperGetUpperPart02TestMissingMapValue(m2),
        );
        let u1 = range1.getUpper();
        let u2 = range2.getUpper();
        let actual: boolean = u1.compareTo(u2);
        expect(actual).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_1100
     * @tc.name testScopeUpperUnicode001
     * @tc.desc Verify ScopeHelper getUpper with Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperUnicode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingStringValue('a');
        let hi = new ScopeHelperGetUpperPart02TestMissingStringValue('你好');
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingStringValue>(lo, hi);
        let actual = range.getUpper().getS();
        let expected: string = '你好';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_1200
     * @tc.name testScopeUpperConsistency001
     * @tc.desc Verify ScopeHelper getUpper state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(30), new ScopeHelperIntValue(40));
        let actual = range.getUpper().getValue();
        let expected = range.getUpper().getValue();
        expect(actual).assertEqual(40);
        expect(expected).assertEqual(40);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingTemperature(-5);
        let hi = new ScopeHelperGetUpperPart02TestMissingTemperature(1);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingTemperature>(lo, hi);
        let actual = range.getUpper().getTemp();
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingTemperature(30);
        let hi = new ScopeHelperGetUpperPart02TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingTemperature>(lo, hi);
        let actualA = range.getUpper();
        let actualB = range.getUpper();
        expect(actualA.getTemp()).assertEqual(40);
        expect(actualB.getTemp()).assertEqual(40);

      }
      {
        let range1 = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingTemperature>(
          new ScopeHelperGetUpperPart02TestMissingTemperature(30),
          new ScopeHelperGetUpperPart02TestMissingTemperature(40),
        );
        let range2 = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingTemperature>(
          new ScopeHelperGetUpperPart02TestMissingTemperature(20),
          new ScopeHelperGetUpperPart02TestMissingTemperature(40),
        );
        let u1 = range1.getUpper();
        let u2 = range2.getUpper();
        let actual: boolean = u1.compareTo(u2);
        expect(actual).assertTrue();

      }
      {
        let mHi: Map<string, number> = new Map<string, number>();
        mHi.set('x', 1);
        mHi.set('y', 2);
        let lo = new ScopeHelperGetUpperPart02TestMissingMapValue(new Map<string, number>());
        let hi = new ScopeHelperGetUpperPart02TestMissingMapValue(mHi);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingMapValue>(lo, hi);
        let actual = range.getUpper().getM().size;
        let expected: int = 2;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingTemperature(30);
        let hi = new ScopeHelperGetUpperPart02TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingTemperature>(lo, hi);
        expect(range.getUpper().getTemp()).assertEqual(40);
        expect(range.getLower().getTemp()).assertEqual(30);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingTemperature(30);
        let hi = new ScopeHelperGetUpperPart02TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingTemperature>(lo, hi);
        expect(range.getUpper().getTemp()).assertEqual(40);
        let actual: string = range.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingTemperature(30);
        let hi = new ScopeHelperGetUpperPart02TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingTemperature>(lo, hi);
        let actualA = range.getUpper();
        let actualB = range.getUpper();
        actualA.setTemp(55);
        let actual = actualB.getTemp();
        let expected: int = 55;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingCharValue('a');
        let hi = new ScopeHelperGetUpperPart02TestMissingCharValue('z');
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingCharValue>(lo, hi);
        let actual = range.getUpper().getC();
        let expected: string = 'z';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingBigIntValue(-1n);
        let hi = new ScopeHelperGetUpperPart02TestMissingBigIntValue(0n);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingBigIntValue>(lo, hi);
        let actual = range.getUpper().getN();
        let expected = 0n;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_1300
     * @tc.name testScopeUpperConsistency002
     * @tc.desc Verify ScopeHelper getUpper state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperConsistency002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingNumberValue(1);
        let hi = new ScopeHelperGetUpperPart02TestMissingNumberValue(7);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingNumberValue>(lo, hi);
        let actual = range.getUpper().getNv();
        let expected: int = 7;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_GET_UPPER_1400
     * @tc.name testScopeUpperBasic001
     * @tc.desc Verify ScopeHelper getUpper with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeUpperBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(-2), new ScopeHelperIntValue(-1));
        let result: int = range.getUpper().getValue();
        expect(result).assertEqual(-1);

      }
      {
        let bigNeg: double = -1e308;
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(bigNeg),
          new ScopeHelperDoubleValue(-1e307),
        );
        let result: double = range.getUpper().getValue();
        expect(result).assertEqual(-1e307);

      }
      {
        let lower: Person = new Person('Bob', 20);
        let upper: Person = new Person('Alice', 30);
        let range = new util.ScopeHelper<Person>(lower, upper);
        let result: Person = range.getUpper();
        let actual = result.name;
        let expected: string = 'Alice';
        expect(actual).assertEqual(expected);

      }
      {
        let lower: Date = Utils.dateFromTime(0);
        let upper: Date = Utils.dateFromTime(1720000000000);
        let range = new util.ScopeHelper<ScopeHelperDateValue>(
          new ScopeHelperDateValue(lower),
          new ScopeHelperDateValue(upper),
        );
        let got: Date = range.getUpper().getValue();
        got.setFullYear(2030);
        expect(got.getFullYear()).assertEqual(2030);
        expect(upper.getFullYear()).assertEqual(2030);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingTemperature(30);
        let hi = new ScopeHelperGetUpperPart02TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingTemperature>(lo, hi);
        let result = range.getUpper();
        result.setTemp(99);
        let actual = hi.getTemp();
        let expected: int = 99;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingTemperature(30);
        let hi = new ScopeHelperGetUpperPart02TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingTemperature>(lo, hi);
        let result = range.getUpper();
        result.setTemp(77);
        let actual = lo.getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingTemperature(30);
        let hi = new ScopeHelperGetUpperPart02TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingTemperature>(lo, hi);
        expect(range.getUpper().getTemp() !== 30).assertTrue();

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingTemperature(30);
        let hi = new ScopeHelperGetUpperPart02TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingTemperature>(lo, hi);
        let result = range.getUpper();
        result.setTemp(60);
        let actual: string = range.toString();
        let expected: string = '[30, 60]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperGetUpperPart02TestMissingStringValue('a');
        let hi = new ScopeHelperGetUpperPart02TestMissingStringValue('z');
        let range = new util.ScopeHelper<ScopeHelperGetUpperPart02TestMissingStringValue>(lo, hi);
        expect(range.getUpper().getS()).assertEqual('z');

      }
    });

  });
}
