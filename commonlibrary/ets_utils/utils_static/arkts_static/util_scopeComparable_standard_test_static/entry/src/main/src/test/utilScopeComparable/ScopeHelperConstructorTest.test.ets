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

export default function ScopeHelperConstructorTest(): void {
  describe('ScopeHelperConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_0100
     * @tc.name testScopeCtorThrows001
     * @tc.desc Verify ScopeHelper constructor throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.ScopeHelper<ScopeHelperBooleanValue>(
            new ScopeHelperBooleanValue(true),
            new ScopeHelperBooleanValue(false),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let lo = new Error('boom');
        let up = new Error('boom');
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        let actual = range.getLower().getValue();
        let expected = lo;
        expect(actual).assertEqual(expected);
        let actualA = range.getUpper().getValue();
        let expectedA = up;
        expect(actualA).assertEqual(expectedA);
        let actualB: boolean = range.getLower().getValue() !== range.getUpper().getValue();
        expect(actualB).assertTrue();

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
            new ScopeHelperConstructorPart02Test17Speed(17),
            new ScopeHelperConstructorPart02Test17Speed(17),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("Error");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let lo = new ScopeHelperConstructorPart03Test3AllTrueT3(30);
        let up = new ScopeHelperConstructorPart03Test3AllTrueT3(40);
        try {
          let range = new util.ScopeHelper<ScopeHelperConstructorPart03Test3AllTrueT3>(lo, up);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          expect(e.message).assertEqual('lower limit must be less than upper limit');
        }

      }
      {
        let lo = new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(1.7976931348623157e308);
        let up = new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(9.999999999999999e307);
        try {
          let range = new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3>(lo, up);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
          expect(e.message).assertEqual('lower limit must be less than upper limit');
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(2147483647),
            new ScopeHelperOverviewPart03TestMissingTemperature(-1),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(50),
            new ScopeHelperOverviewPart03TestMissingTemperature(20),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperConstructorPart03TestMissingCarT3() as ScopeHelperOverviewPart03TestMissingTemperature,
            new ScopeHelperConstructorPart03TestMissingCarT3() as ScopeHelperOverviewPart03TestMissingTemperature,
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperConstructorPart03TestMissingCarT3() as ScopeHelperOverviewPart03TestMissingTemperature,
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(1),
            new ScopeHelperOverviewPart03TestMissingTemperature(-2147483648),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_0200
     * @tc.name testScopeCtorThrows002
     * @tc.desc Verify ScopeHelper constructor throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorThrows002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperToStringPart02TestMissingVolume(8) as ScopeHelperOverviewPart03TestMissingTemperature,
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(5),
            new ScopeHelperConstructorPart03TestMissingCarT3() as ScopeHelperOverviewPart03TestMissingTemperature,
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3>(
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(Double.POSITIVE_INFINITY),
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(10),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingCharWrapT3>(
            new ScopeHelperConstructorPart03TestMissingCharWrapT3(Int.toChar(97)),
            new ScopeHelperConstructorPart03TestMissingCharWrapT3(Int.toChar(97)),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let d: Date = new Date();
        try {
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDateWrapT3>(
            new ScopeHelperConstructorPart03TestMissingDateWrapT3(d),
            new ScopeHelperConstructorPart03TestMissingDateWrapT3(new Date(0)),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let h: ScopeHelperConstructorPart03TestMissingHolderT3 = new ScopeHelperConstructorPart03TestMissingHolderT3();
        let wm: WeakMap<ScopeHelperConstructorPart03TestMissingHolderT3, int> = new WeakMap<
          ScopeHelperConstructorPart03TestMissingHolderT3,
          int
        >();
        wm.set(h, 1);
        try {
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            h as ScopeHelperOverviewPart03TestMissingTemperature,
            h as ScopeHelperOverviewPart03TestMissingTemperature,
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let h2: ScopeHelperConstructorPart03TestMissingHolderT3 = new ScopeHelperConstructorPart03TestMissingHolderT3();
        let ws: WeakSet<ScopeHelperConstructorPart03TestMissingHolderT3> =
          new WeakSet<ScopeHelperConstructorPart03TestMissingHolderT3>();
        ws.add(h2);
        try {
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            h2 as ScopeHelperOverviewPart03TestMissingTemperature,
            h2 as ScopeHelperOverviewPart03TestMissingTemperature,
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingBigValueT3>(
            new ScopeHelperConstructorPart03TestMissingBigValueT3(Int.toLong(-1)),
            new ScopeHelperConstructorPart03TestMissingBigValueT3(Int.toLong(-1)),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3>(
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(5e-324),
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(5e-324),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3>(
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(-0.5),
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(-0.5),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_0300
     * @tc.name testScopeCtorThrows003
     * @tc.desc Verify ScopeHelper constructor throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorThrows003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3>(
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(1e300),
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(1e300),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(35),
            new ScopeHelperOverviewPart03TestMissingTemperature(35),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(2147483647),
            new ScopeHelperOverviewPart03TestMissingTemperature(2147483647),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(-2147483648),
            new ScopeHelperOverviewPart03TestMissingTemperature(-2147483648),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperToStringPart02TestMissingVolume>(
            new ScopeHelperToStringPart02TestMissingVolume(7),
            new ScopeHelperToStringPart02TestMissingVolume(7),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDateWrapT3>(
            new ScopeHelperConstructorPart03TestMissingDateWrapT3(Utils.dateFromTime(1700000000000)),
            new ScopeHelperConstructorPart03TestMissingDateWrapT3(Utils.dateFromTime(1700000000000)),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingBoolWrapT3>(
            new ScopeHelperConstructorPart03TestMissingBoolWrapT3(true),
            new ScopeHelperConstructorPart03TestMissingBoolWrapT3(true),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          new util.ScopeHelper<IntWrapT3>(new IntWrapT3(5), new IntWrapT3(5));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_0400
     * @tc.name testScopeCtorBigInt001
     * @tc.desc Verify ScopeHelper constructor with BigInt bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorBigInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperBigIntValue>(
          new ScopeHelperBigIntValue(BigInt(1)),
          new ScopeHelperBigIntValue(BigInt(100)),
        );
        let result = range.toString();
        expect(result).assertEqual('[1, 100]');

      }
      {
        let range = new util.ScopeHelper<ScopeHelperBigIntValue>(
          new ScopeHelperBigIntValue(BigInt(100)),
          new ScopeHelperBigIntValue(BigInt(200)),
        );
        let result = range.toString();
        expect(result).assertEqual('[100, 200]');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_0500
     * @tc.name testScopeCtorDate001
     * @tc.desc Verify ScopeHelper constructor with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorDate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(2147483645);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(2147483647);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[2147483645, 2147483647]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(-2147483648);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[-2147483648, 30]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(-2147483648);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(2147483647);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[-2147483648, 2147483647]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(0);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(2147483647);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[0, 2147483647]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperLongValue>(
          new ScopeHelperLongValue(1234567890123),
          new ScopeHelperLongValue(9876543210987),
        );
        let result = range.toString();
        expect(result).assertEqual('[1234567890123, 9876543210987]');

      }
      {
        let lo = new Date(2024, 0, 1);
        let up = new Date(2024, 11, 31);
        let range = new util.ScopeHelper<ScopeHelperDateValue>(
          new ScopeHelperDateValue(lo),
          new ScopeHelperDateValue(up),
        );
        let actual: boolean = range.contains(new ScopeHelperDateValue(new Date(2024, 5, 15)));
        expect(actual).assertTrue();

      }
      {
        let lo = new Date(2024, 0, 1);
        let up = new Date(2024, 11, 31);
        let range = new util.ScopeHelper<ScopeHelperDateValue>(
          new ScopeHelperDateValue(lo),
          new ScopeHelperDateValue(up),
        );
        let actual: number = range.getLower().getValue().getTime();
        let expected: number = lo.getTime();
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new Date(2024, 0, 1);
        let up = new Date(2024, 11, 31);
        let range = new util.ScopeHelper<ScopeHelperDateValue>(
          new ScopeHelperDateValue(lo),
          new ScopeHelperDateValue(up),
        );
        let actual: number = range.getUpper().getValue().getTime();
        let expected: number = up.getTime();
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperLongValue>(
          new ScopeHelperLongValue(500000000000),
          new ScopeHelperLongValue(9000000000000),
        );
        let actual: long = range.getLower().getValue();
        let expected: long = 500000000000;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperLongValue>(
          new ScopeHelperLongValue(500000000000),
          new ScopeHelperLongValue(9000000000000),
        );
        let actual: string = range.toString();
        let expected: string = "[500000000000, 9000000000000]";
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_0600
     * @tc.name testScopeCtorDate002
     * @tc.desc Verify ScopeHelper constructor with Date bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorDate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lo = new ScopeHelperConstructorPart03TestMissingBigValueT3(1234567890123);
        let up = new ScopeHelperConstructorPart03TestMissingBigValueT3(9876543210987);
        let range = new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingBigValueT3>(lo, up);
        let actual = range.getLower().getVal();
        let expected = 1234567890123;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperConstructorPart03TestMissingDateWrapT3(new Date(1680000000000));
        let up = new ScopeHelperConstructorPart03TestMissingDateWrapT3(new Date(1720000000000));
        let range = new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDateWrapT3>(lo, up);
        let actual = range.getLower().getD().getTime();
        let expected: number = 1680000000000;
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(-2147483648),
            new ScopeHelperOverviewPart03TestMissingTemperature(0),
          );
        let actual: string = range.toString();
        let expected: string = '[-2147483648, 0]';
        expect(actual).assertEqual(expected);

      }
      {
        let range: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(0),
            new ScopeHelperOverviewPart03TestMissingTemperature(2147483647),
          );
        let actual: string = range.toString();
        let expected: string = '[0, 2147483647]';
        expect(actual).assertEqual(expected);

      }
      {
        let bv: ScopeHelperConstructorPart03TestMissingBigValueT3 = new ScopeHelperConstructorPart03TestMissingBigValueT3(
          9223372036854775806,
        );
        let bu: ScopeHelperConstructorPart03TestMissingBigValueT3 = new ScopeHelperConstructorPart03TestMissingBigValueT3(
          9223372036854775807,
        );
        let range: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingBigValueT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingBigValueT3>(bv, bu);
        let actual: string = range.toString();
        let expected: string = '[9223372036854775806, 9223372036854775807]';
        expect(actual).assertEqual(expected);

      }
      {
        let bv: ScopeHelperConstructorPart03TestMissingBigValueT3 = new ScopeHelperConstructorPart03TestMissingBigValueT3(
          -9223372036854775807 - 1,
        );
        let bu: ScopeHelperConstructorPart03TestMissingBigValueT3 = new ScopeHelperConstructorPart03TestMissingBigValueT3(
          -9223372036854775807,
        );
        let range: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingBigValueT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingBigValueT3>(bv, bu);
        let actual: string = range.toString();
        let expected: string = '[-9223372036854775808, -9223372036854775807]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo: ScopeHelperConstructorPart03TestMissingDateWrapT3 = new ScopeHelperConstructorPart03TestMissingDateWrapT3(
          Utils.dateFromTime(10),
        );
        let up: ScopeHelperConstructorPart03TestMissingDateWrapT3 = new ScopeHelperConstructorPart03TestMissingDateWrapT3(
          Utils.dateFromTime(99),
        );
        let range: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDateWrapT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDateWrapT3>(lo, up);
        let actual = range.getUpper().getD().getTime();
        let expected: int = 99;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_0700
     * @tc.name testScopeCtorChar001
     * @tc.desc Verify ScopeHelper constructor with char bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lo = new ScopeHelperExpandPart02Test51TemperatureChar(Int.toChar(120));
        let up = new ScopeHelperExpandPart02Test51TemperatureChar(Int.toChar(121));
        let range = new util.ScopeHelper<ScopeHelperExpandPart02Test51TemperatureChar>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[x, y]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(12), new ScopeHelperIntValue(34));
        let actual: string = range
          .toString()
          .charAt(range.toString().length - 1)
          .toString();
        let expected: string = ']';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_0800
     * @tc.name testScopeCtorStr001
     * @tc.desc Verify ScopeHelper constructor with string bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorStr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue('apple'),
          new ScopeHelperStringValue('zebra'),
        );
        let result = range.toString();
        expect(result).assertEqual('[apple, zebra]');

      }
      {
        let lo = new ScopeHelperConstructorPart01Test39StringTemp('high');
        let up = new ScopeHelperConstructorPart01Test39StringTemp('low');
        let range = new util.ScopeHelper<ScopeHelperConstructorPart01Test39StringTemp>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[high, low]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo: Map<string, int> = new Map<string, int>();
        lo.set('a', 1);
        let up: Map<string, int> = new Map<string, int>();
        up.set('b', 2);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        let actual = range.getLower().getValue();
        let expected = lo;
        expect(actual).assertEqual(expected);

      }
      {
        let lo: Map<string, int> = new Map<string, int>();
        lo.set('a', 1);
        let up: Map<string, int> = new Map<string, int>();
        up.set('a', 1);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        let actual = range.getLower().getValue();
        let expected = lo;
        expect(actual).assertEqual(expected);
        let actualA = range.getUpper().getValue();
        let expectedA = up;
        expect(actualA).assertEqual(expectedA);
        let actualB: boolean = range.getLower().getValue() !== range.getUpper().getValue();
        expect(actualB).assertTrue();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue(''),
          new ScopeHelperStringValue('a'),
        );
        let result = range.toString();
        expect(result).assertEqual('[, a]');

      }
      {
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue("aa"),
          new ScopeHelperStringValue("zz"),
        );
        let actual: string = range.toString();
        let expected: string = "[aa, zz]";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue("aa"),
          new ScopeHelperStringValue("zz"),
        );
        let actual: string = range.getLower().getValue();
        let expected: string = "aa";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue(''),
          new ScopeHelperStringValue('a'),
        );
        let actual: int = range.toString().length;
        let expected: int = 5;
        expect(actual).assertEqual(expected);

      }
      {
        let longText: string = '';
        for (let i: int = 0; i < 10000; i++) {
          longText = longText + 'a';
        }
        let range = new util.ScopeHelper<ScopeHelperStringValue>(
          new ScopeHelperStringValue(longText),
          new ScopeHelperStringValue(longText.substring(0, longText.length - 1) + 'b'),
        );
        let actual: int = range.toString().length;
        let expected: int = 20004;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_0900
     * @tc.name testScopeCtorBool001
     * @tc.desc Verify ScopeHelper constructor with boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorBool001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperBooleanValue>(
          new ScopeHelperBooleanValue(false),
          new ScopeHelperBooleanValue(true),
        );
        let result = range.toString();
        expect(result).assertEqual('[false, true]');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_1000
     * @tc.name testScopeCtorFloatDouble001
     * @tc.desc Verify ScopeHelper constructor with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorFloatDouble001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(3.14),
          new ScopeHelperDoubleValue(6.28),
        );
        let result = range.toString();
        expect(result).assertEqual('[3.14, 6.28]');

      }
      {
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(1.5),
          new ScopeHelperDoubleValue(9.75),
        );
        let result = range.toString();
        expect(result).assertEqual('[1.5, 9.75]');

      }
      {
        let lo = new ScopeHelperExpandPart02Test40TemperatureDouble(3.5);
        let up = new ScopeHelperExpandPart02Test40TemperatureDouble(8.5);
        let range = new util.ScopeHelper<ScopeHelperExpandPart02Test40TemperatureDouble>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[3.5, 8.5]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart02Test48TemperatureFloat(1.5);
        let up = new ScopeHelperExpandPart02Test48TemperatureFloat(7.25);
        let range = new util.ScopeHelper<ScopeHelperExpandPart02Test48TemperatureFloat>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[1.5, 7.25]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart02Test40TemperatureDouble(3.5);
        let up = new ScopeHelperExpandPart02Test40TemperatureDouble(3.6);
        let range = new util.ScopeHelper<ScopeHelperExpandPart02Test40TemperatureDouble>(lo, up);
        let actual = range.getLower().getTemp();
        let expected: double = 3.5;
        expect(actual).assertEqual(expected);
        let actualA = range.getUpper().getTemp();
        let expectedA: double = 3.6;
        expect(actualA).assertEqual(expectedA);
        let actualB: boolean = range.getLower().getTemp() !== range.getUpper().getTemp();
        expect(actualB).assertTrue();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(2.5),
          new ScopeHelperDoubleValue(8.5),
        );
        let actual: double = range.getUpper().getValue();
        let expected: double = 8.5;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(1.25),
          new ScopeHelperDoubleValue(4.5),
        );
        let actual: double = range.getLower().getValue();
        let expected: double = 1.25;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(2.5),
          new ScopeHelperDoubleValue(8.5),
        );
        let actual: string = range.toString();
        let expected: string = "[2.5, 8.5]";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperDoubleValue>(
          new ScopeHelperDoubleValue(-3.5),
          new ScopeHelperDoubleValue(-1.5),
        );
        let actual: string = range.toString();
        let expected: string = "[-3.5, -1.5]";
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(3.5);
        let up = new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(7.9);
        let range = new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3>(lo, up);
        let actual = range.getLower().getVal();
        let expected: double = 3.5;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_1100
     * @tc.name testScopeCtorFloatDouble002
     * @tc.desc Verify ScopeHelper constructor with float and double bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorFloatDouble002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let tmp: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3>(
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(Double.NaN),
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(10),
          );
        let actual = tmp.getUpper().getVal();
        let expected: double = 10;
        expect(actual).assertEqual(expected);

      }
      {
        let tmp: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3>(
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(5),
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(Double.NaN),
          );
        let actual = tmp.getLower().getVal();
        let expected: double = 5;
        expect(actual).assertEqual(expected);

      }
      {
        let tmp: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3>(
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(Double.NaN),
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(Double.NaN),
          );
        let actual: double = tmp.getLower().getVal();
        let actualIsNaN: boolean = isNaN(actual);
        expect(actualIsNaN).assertTrue();

      }
      {
        let lo: ScopeHelperConstructorPart03TestMissingDoubleWrapT3 =
          new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(-1.5);
        let up: ScopeHelperConstructorPart03TestMissingDoubleWrapT3 =
          new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(0.5);
        let range: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[-1.5, 0.5]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo: ScopeHelperConstructorPart03TestMissingDoubleWrapT3 =
          new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(0.1);
        let up: ScopeHelperConstructorPart03TestMissingDoubleWrapT3 =
          new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(0.2);
        let range: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[0.1, 0.2]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_1200
     * @tc.name testScopeCtorLong001
     * @tc.desc Verify ScopeHelper constructor with long bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorLong001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lo = new ScopeHelperExpandPart02Test41TemperatureLong(100);
        let up = new ScopeHelperExpandPart02Test41TemperatureLong(200);
        let range = new util.ScopeHelper<ScopeHelperExpandPart02Test41TemperatureLong>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[100, 200]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_1300
     * @tc.name testScopeCtorInt001
     * @tc.desc Verify ScopeHelper constructor with int bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(25);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[25, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(1), new ScopeHelperIntValue(127));
        let result = range.toString();
        expect(result).assertEqual('[1, 127]');

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(
          new ScopeHelperIntValue(-32768),
          new ScopeHelperIntValue(32767),
        );
        let result = range.toString();
        expect(result).assertEqual('[-32768, 32767]');

      }
      {
        let lo: int[] = [1, 2, 3];
        let up: int[] = [4, 5, 6];
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        let actual = (range.getLower().getValue() as int[])[0];
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let actual: boolean = range.contains(new ScopeHelperIntValue(10));
        expect(actual).assertFalse();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let inner = range.intersect(new ScopeHelperIntValue(5), new ScopeHelperIntValue(15));
        let actual: string = inner.toString();
        let expected: string = "[5, 9]";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let actual: int = range.clamp(new ScopeHelperIntValue(1)).getValue();
        let expected: int = 2;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let actual: string = range.expand(new ScopeHelperIntValue(0)).toString();
        let expected: string = "[0, 9]";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let actual: boolean = range.getLower().compareTo(range.getUpper());
        expect(actual).assertFalse();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let actual: boolean = range.getUpper().compareTo(new ScopeHelperIntValue(9));
        expect(actual).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_1400
     * @tc.name testScopeCtorInt002
     * @tc.desc Verify ScopeHelper constructor with int bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let extended = range.expand(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let actual: string = extended.toString();
        let expected: string = "[2, 9]";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let inner = range.intersect(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let actual: string = inner.toString();
        let expected: string = "[2, 9]";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let actual: boolean = range.contains(new ScopeHelperIntValue(9));
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let extended = range.expand(new ScopeHelperIntValue(20));
        let actual: string = extended.toString();
        let expected: string = "[2, 20]";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let actual: int = range.clamp(new ScopeHelperIntValue(20)).getValue();
        let expected: int = 9;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let actual: boolean = range.getUpper().compareTo(range.getLower());
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(120));
        let actual: int = range.getUpper().getValue();
        let expected: int = 120;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let actual: string = range.toString();
        let expected: string = "[2, 9]";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(2), new ScopeHelperIntValue(9));
        let actual = range.getLower().getValue();
        let expected: int = 2;
        expect(actual).assertEqual(expected);
        let actualUpperValue = range.getUpper().getValue();
        let expectedUpperValue: int = 9;
        expect(actualUpperValue).assertEqual(expectedUpperValue);

      }
      {
        let lo: int[] = [1, 2, 3];
        let up: int[] = [4, 5, 6];
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        let lowerBack: int[] = range.getLower().getValue() as int[];
        let actual: int = lowerBack[0];
        let expected: int = 1;
        expect(actual).assertEqual(expected);
        let actualLast: int = lowerBack[2];
        let expectedLast: int = 3;
        expect(actualLast).assertEqual(expectedLast);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_1500
     * @tc.name testScopeCtorInt003
     * @tc.desc Verify ScopeHelper constructor with int bounds and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lo: int[] = [1, 2, 3];
        let up: int[] = [4, 5, 6];
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        lo[0] = 99;
        let result: Object = range.getLower().getValue();
        let actual = (result as int[])[0];
        let expected: int = 99;
        expect(actual).assertEqual(expected);

      }
      {
        let lo: int[] = [1, 2, 3];
        let up: int[] = [4, 5, 6];
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        let back: int[] = range.getLower().getValue() as int[];
        back[1] = 55;
        let actual: int = lo[1];
        let expected: int = 55;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperConstructorPart03TestMissingCharWrapT3(Int.toChar(65));
        let up = new ScopeHelperConstructorPart03TestMissingCharWrapT3(Int.toChar(90));
        let range = new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingCharWrapT3>(lo, up);
        let actual = range.getLower().getVal();
        let expected: char = Int.toChar(65);
        expect(actual).assertEqual(expected);

      }
      {
        let lo: ScopeHelperConstructorPart03TestMissingCharWrapT3 = new ScopeHelperConstructorPart03TestMissingCharWrapT3(
          Int.toChar(65),
        );
        let up: ScopeHelperConstructorPart03TestMissingCharWrapT3 = new ScopeHelperConstructorPart03TestMissingCharWrapT3(
          Int.toChar(122),
        );
        let range: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingCharWrapT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingCharWrapT3>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[A, z]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_1600
     * @tc.name testScopeCtorCustom001
     * @tc.desc Verify ScopeHelper constructor with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorCustom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lo = new ScopeHelperExpandPart02Test49TemperatureByte(1);
        let up = new ScopeHelperExpandPart02Test49TemperatureByte(120);
        let range = new util.ScopeHelper<ScopeHelperExpandPart02Test49TemperatureByte>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[1, 120]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart02Test50TemperatureShort(-300);
        let up = new ScopeHelperExpandPart02Test50TemperatureShort(500);
        let range = new util.ScopeHelper<ScopeHelperExpandPart02Test50TemperatureShort>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[-300, 500]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperConstructorPart01Test39StringTemp('mid');
        let up = new ScopeHelperConstructorPart01Test39StringTemp('zoo');
        let range = new util.ScopeHelper<ScopeHelperConstructorPart01Test39StringTemp>(lo, up);
        let actual = range.getLower().getTemp();
        let expected: string = 'mid';
        expect(actual).assertEqual(expected);
        let actualA = range.getUpper().getTemp();
        let expectedA: string = 'zoo';
        expect(actualA).assertEqual(expectedA);
        let actualB: boolean = range.getLower().getTemp() !== range.getUpper().getTemp();
        expect(actualB).assertTrue();

      }
      {
        let lo: Int32Array = new Int32Array([-1, 1]);
        let up: Int32Array = new Int32Array([-2, 2]);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        let actual = range.getLower().getValue();
        let expected = lo;
        expect(actual).assertEqual(expected);

      }
      {
        let lo: ArrayBuffer = new ArrayBuffer(4);
        let up: ArrayBuffer = new ArrayBuffer(8);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        let actual = range.getLower().getValue();
        let expected = lo;
        expect(actual).assertEqual(expected);

      }
      {
        let lo: DataView = new DataView(new ArrayBuffer(4));
        let up: DataView = new DataView(new ArrayBuffer(8));
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        let actual = range.getLower().getValue();
        let expected = lo;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(34),
        );
        let extended = range.expand(new ScopeHelperConstructorPart02Test17Speed(40));
        let actual: string = extended.toString();
        let expected: string = "[12, 40]";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(34),
        );
        let actual: boolean = range.contains(new ScopeHelperConstructorPart02Test17Speed(20));
        expect(actual).assertTrue();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(34),
        );
        let actual: int = range.getLower().getSpeed();
        let expected: int = 12;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(34),
        );
        let actual: int = range.getUpper().getSpeed();
        let expected: int = 34;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_1700
     * @tc.name testScopeCtorCustom002
     * @tc.desc Verify ScopeHelper constructor with custom comparable types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorCustom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(34),
        );
        let actual: string = range.toString();
        let expected: string = "[12, 34]";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(-12), new ScopeHelperIntValue(-4));
        let actual: int = range.toString().length;
        let expected: int = 9;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(12), new ScopeHelperIntValue(34));
        let actual: int = range.getLower().getValue().toString().length;
        let expected: int = 2;
        expect(actual).assertEqual(expected);

      }
      {
        let lo: Map<string, int> = new Map<string, int>();
        lo.set('a', 1);
        let up: Map<string, int> = new Map<string, int>();
        up.set('b', 2);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        lo.set('k', 9);
        let result: Object = range.getLower().getValue();
        let actual = (result as Map<string, int>).get('k');
        let expected: int = 9;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperConstructorPart02Test17Speed(12);
        let up = new ScopeHelperConstructorPart02Test17Speed(34);
        let range = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(lo, up);
        let actual = range.getLower().getSpeed();
        let expected = lo.getSpeed();
        expect(actual).assertEqual(expected);
        let actualUpperSpeed = range.getUpper().getSpeed();
        let expectedUpperSpeed = up.getSpeed();
        expect(actualUpperSpeed).assertEqual(expectedUpperSpeed);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(34),
        );
        let c = range.contains(new ScopeHelperConstructorPart02Test17Speed(20));
        let t = range.toString();
        expect(c).assertTrue();
        expect(t).assertEqual("[12, 34]");

      }
      {
        let lo = new ScopeHelperConstructorPart03TestMissingThrowingT3(30);
        let up = new ScopeHelperConstructorPart03TestMissingThrowingT3(40);
        try {
          let range = new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingThrowingT3>(lo, up);
          range.clamp(lo);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let car = new ScopeHelperConstructorPart03TestMissingCarT3();
        let actual: number = probeScopeCtor03(car);
        let expected: number = 1;
        expect(actual).assertEqual(expected);

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingThrowingT3>(
            new ScopeHelperConstructorPart03TestMissingThrowingT3(1),
            new ScopeHelperConstructorPart03TestMissingThrowingT3(10),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_1800
     * @tc.name testScopeCtorConsistency001
     * @tc.desc Verify ScopeHelper constructor state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(
          new ScopeHelperExpandPart03TestMissingTemperature(10),
          new ScopeHelperExpandPart03TestMissingTemperature(20),
        );
        let actual = range.getLower().getTemp();
        let expected: int = 10;
        expect(actual).assertEqual(expected);
        let actualA = range.getUpper().getTemp();
        let expectedA: int = 20;
        expect(actualA).assertEqual(expectedA);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(-1);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(1);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[-1, 1]';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(5), new ScopeHelperIntValue(10));
        let result = range.toString();
        expect(result).assertEqual('[5, 10]');

      }
      {
        let lo = new Date(2024, 0, 1);
        let up = new Date(2024, 11, 31);
        let range = new util.ScopeHelper<ScopeHelperDateValue>(
          new ScopeHelperDateValue(lo),
          new ScopeHelperDateValue(up),
        );
        let actual = range.getLower().getValue();
        let expected = lo;
        expect(actual).assertEqual(expected);
        let actualA = range.getUpper().getValue();
        let expectedA = up;
        expect(actualA).assertEqual(expectedA);

      }
      {
        let lo: Set<int> = new Set<int>();
        lo.add(1);
        let up: Set<int> = new Set<int>();
        up.add(2);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        let actual = range.getLower().getValue();
        let expected = lo;
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual = range.getLower().getTemp();
        let expected: int = 30;
        expect(actual).assertEqual(expected);
        let actualA = range.getUpper().getTemp();
        let expectedA: int = 40;
        expect(actualA).assertEqual(expectedA);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(
          new ScopeHelperIntValue(-500),
          new ScopeHelperIntValue(500),
        );
        let actual: string = range.toString();
        let expected: string = "[-500, 500]";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperBigIntValue>(
          new ScopeHelperBigIntValue(BigInt(7)),
          new ScopeHelperBigIntValue(BigInt(11)),
        );
        let actual: string = range.toString();
        let expected: string = "[7, 11]";
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(12), new ScopeHelperIntValue(34));
        let actual: string = range.toString().substring(0, 1);
        let expected: string = '[';
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(12), new ScopeHelperIntValue(34));
        let actual: int = range.toString().indexOf(", ");
        let expected: int = 3;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_1900
     * @tc.name testScopeCtorConsistency002
     * @tc.desc Verify ScopeHelper constructor state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorConsistency002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let range = new util.ScopeHelper<ScopeHelperIntValue>(new ScopeHelperIntValue(12), new ScopeHelperIntValue(34));
        let joined = range.getLower().getValue().toString() + ", " + range.getUpper().getValue().toString();
        let manual = '[' + joined + ']';
        let actual: string = range.toString();
        let expected = manual;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(34),
        );
        let actualText = range.toString();
        let actual = range.getLower().getSpeed();
        let expected: int = 12;
        expect(actual).assertEqual(expected);
        expect(actualText).assertEqual("[12, 34]");

      }
      {
        let lo = new ScopeHelperConstructorPart02Test17Speed(12);
        let up = new ScopeHelperConstructorPart02Test17Speed(34);
        let rangeFirst = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(lo, up);
        let rangeSecond = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(lo, up);
        let actual = rangeFirst.getLower();
        let expected = lo;
        expect(actual).assertEqual(expected);
        let actualSecondLower = rangeSecond.getLower();
        let expectedSecondLower = lo;
        expect(actualSecondLower).assertEqual(expectedSecondLower);

      }
      {
        let rangeA = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(34),
        );
        let rangeB = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(56),
          new ScopeHelperConstructorPart02Test17Speed(78),
        );
        let actual: string = rangeA.toString();
        let expected: string = "[12, 34]";
        expect(actual).assertEqual(expected);
        let actualRangeB: string = rangeB.toString();
        let expectedRangeB: string = "[56, 78]";
        expect(actualRangeB).assertEqual(expectedRangeB);

      }
      {
        let lo = new ScopeHelperConstructorPart03TestMissingBoolWrapT3(false);
        let up = new ScopeHelperConstructorPart03TestMissingBoolWrapT3(true);
        let range = new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingBoolWrapT3>(lo, up);
        let actual = range.getLower().getVal();
        let expected: boolean = false;
        expect(actual).assertEqual(expected);

      }
      {
        let tmp: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDoubleWrapT3>(
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(-1e300),
            new ScopeHelperConstructorPart03TestMissingDoubleWrapT3(10),
          );
        let actual = tmp.getLower().getVal();
        let expected: double = -1e300;
        expect(actual).assertEqual(expected);

      }
      {
        let tmp: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingBoolWrapT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingBoolWrapT3>(
            new ScopeHelperConstructorPart03TestMissingBoolWrapT3(true),
            new ScopeHelperConstructorPart03TestMissingBoolWrapT3(false),
          );
        let actual = tmp.getLower().getVal();
        let expected: boolean = true;
        expect(actual).assertEqual(expected);

      }
      {
        let re: RegExp = new RegExp('a', 'g');
        let expected: boolean = true;
        let tmp: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(7),
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
          );
        let hasGlobalFlag = re.global;
        let actual: boolean = tmp.contains(new ScopeHelperOverviewPart03TestMissingTemperature(8));
        expect(actual && hasGlobalFlag).assertEqual(expected);

      }
      {
        let err: Error = new Error('bad');
        let expected: boolean = false;
        let tmp: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(7),
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
          );
        let actual: boolean = tmp.contains(new ScopeHelperOverviewPart03TestMissingTemperature(4));
        expect(actual).assertEqual(expected);
        expect(err.name).assertEqual('Error');
        expect(err.message).assertEqual('bad');

      }
      {
        let arr: int[] = [1, 2, 3];
        let expected: int = 7;
        let tmp: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(7),
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
          );
        let probeValue: int = arr[1] + arr[2];
        let actual: int = tmp.clamp(new ScopeHelperOverviewPart03TestMissingTemperature(probeValue)).getTemp();
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_2000
     * @tc.name testScopeCtorConsistency003
     * @tc.desc Verify ScopeHelper constructor state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorConsistency003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let emptyArr: int[] = [];
        let expected: int = 10;
        let tmp: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(7),
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
          );
        let probeValue: int = 12 - emptyArr.length;
        let actual: int = tmp.clamp(new ScopeHelperOverviewPart03TestMissingTemperature(probeValue)).getTemp();
        expect(actual).assertEqual(expected);

      }
      {
        let m: Map<string, int> = new Map<string, int>();
        m.set('k', 1);
        let expected: string = '[7, 20]';
        let tmp: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(7),
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
          );
        let actual: string = tmp.expand(new ScopeHelperOverviewPart03TestMissingTemperature(20)).toString();
        expect(actual).assertEqual(expected);

      }
      {
        let s: Set<int> = new Set<int>();
        s.add(1);
        let expected: string = '[2, 10]';
        let tmp: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(7),
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
          );
        let actual: string = tmp.expand(new ScopeHelperOverviewPart03TestMissingTemperature(2)).toString();
        expect(actual).assertEqual(expected);

      }
      {
        let expected: int = 8;
        let tmp: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(7),
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
          );
        let actual: int = tmp.clamp(new ScopeHelperOverviewPart03TestMissingTemperature(8)).getTemp();
        expect(actual).assertEqual(expected);

      }
      {
        let expected: string = '[7, 10]';
        let tmp: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(7),
            new ScopeHelperOverviewPart03TestMissingTemperature(10),
          );
        let actual: string = tmp.toString();
        expect(actual).assertEqual(expected);

      }
      {
        let lo: IntWrapT3 = new IntWrapT3(10);
        let up: IntWrapT3 = new IntWrapT3(20);
        let range: util.ScopeHelper<IntWrapT3> = new util.ScopeHelper<IntWrapT3>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[10, 20]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo: ScopeHelperConstructorPart03TestMissingBoolWrapT3 = new ScopeHelperConstructorPart03TestMissingBoolWrapT3(
          false,
        );
        let up: ScopeHelperConstructorPart03TestMissingBoolWrapT3 = new ScopeHelperConstructorPart03TestMissingBoolWrapT3(
          true,
        );
        let range: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingBoolWrapT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingBoolWrapT3>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[false, true]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo: ScopeHelperConstructorPart03TestMissingDateWrapT3 = new ScopeHelperConstructorPart03TestMissingDateWrapT3(
          Utils.dateFromTime(1000),
        );
        let up: ScopeHelperConstructorPart03TestMissingDateWrapT3 = new ScopeHelperConstructorPart03TestMissingDateWrapT3(
          Utils.dateFromTime(2000),
        );
        let range: util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDateWrapT3> =
          new util.ScopeHelper<ScopeHelperConstructorPart03TestMissingDateWrapT3>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[1000, 2000]';
        expect(actual).assertEqual(expected);

      }
      {
        let actualB: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actualC: util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature> =
          new util.ScopeHelper<ScopeHelperOverviewPart03TestMissingTemperature>(
            new ScopeHelperOverviewPart03TestMissingTemperature(30),
            new ScopeHelperOverviewPart03TestMissingTemperature(40),
          );
        let actual: string = actualB.toString();
        let expected = actualC.toString();
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_2100
     * @tc.name testScopeCtorBasic001
     * @tc.desc Verify ScopeHelper constructor with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let tempLower = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let tempUpper = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(tempLower, tempUpper);
        let actual: string = range.toString();
        let expected: string = '[30, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(35);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[30, 35]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(50);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[40, 50]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(0);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[0, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(-40);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[-40, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(1);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[1, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(100);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(400);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[100, 400]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(39);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[39, 40]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(45);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(46);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual = range.getLower().getTemp();
        let expected: int = 45;
        expect(actual).assertEqual(expected);
        let actualA = range.getUpper().getTemp();
        let expectedA: int = 46;
        expect(actualA).assertEqual(expectedA);
        let actualB: boolean = range.getLower().getTemp() !== range.getUpper().getTemp();
        expect(actualB).assertTrue();

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(45);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[30, 45]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_2200
     * @tc.name testScopeCtorBasic002
     * @tc.desc Verify ScopeHelper constructor with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(20);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[20, 30]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(0);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[0, 30]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(-40);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[-40, 30]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(300);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[30, 300]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(31);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[30, 31]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(-1);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[-1, 30]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(0);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(1);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[0, 1]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(-40);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(300);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[-40, 300]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(30);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let comparable: boolean = range.getLower().compareTo(range.getUpper());
        expect(comparable).assertFalse();

      }
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(70);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(75);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[70, 75]';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPEHELPER_CONSTRUCTOR_2300
     * @tc.name testScopeCtorBasic003
     * @tc.desc Verify ScopeHelper constructor with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testScopeCtorBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lo = new ScopeHelperExpandPart03TestMissingTemperature(-60);
        let up = new ScopeHelperExpandPart03TestMissingTemperature(-40);
        let range = new util.ScopeHelper<ScopeHelperExpandPart03TestMissingTemperature>(lo, up);
        let actual: string = range.toString();
        let expected: string = '[-60, -40]';
        expect(actual).assertEqual(expected);

      }
      {
        let lo: Map<string, int> = new Map<string, int>();
        lo.set('a', 1);
        let up: Map<string, int> = new Map<string, int>();
        up.set('b', 2);
        let range = new util.ScopeHelper<ScopeHelperObjectValue>(
          new ScopeHelperObjectValue(lo),
          new ScopeHelperObjectValue(up),
        );
        let lowerBack: Map<string, int> = range.getLower().getValue() as Map<string, int>;
        let actual: int = lowerBack.size;
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(34),
        );
        let cmp = range.getLower().compareTo(range.getUpper());
        expect(cmp).assertFalse();

      }
      {
        let range = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(34),
        );
        let cl = range.clamp(new ScopeHelperConstructorPart02Test17Speed(5));
        let actual: string = cl.toString();
        let expected: string = "12";
        expect(actual).assertEqual(expected);
        let actualUpperSpeed = range.getUpper().getSpeed();
        let expectedUpperSpeed: int = 34;
        expect(actualUpperSpeed).assertEqual(expectedUpperSpeed);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(34),
        );
        let itr = range.intersect(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(20),
        );
        let actual: string = itr.toString();
        let expected: string = "[12, 20]";
        expect(actual).assertEqual(expected);
        let actualLowerSpeed = range.getLower().getSpeed();
        let expectedLowerSpeed: int = 12;
        expect(actualLowerSpeed).assertEqual(expectedLowerSpeed);

      }
      {
        let range = new util.ScopeHelper<ScopeHelperConstructorPart02Test17Speed>(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(34),
        );
        let intersected = range.intersect(
          new ScopeHelperConstructorPart02Test17Speed(12),
          new ScopeHelperConstructorPart02Test17Speed(20),
        );
        let expanded = range.expand(new ScopeHelperConstructorPart02Test17Speed(50));
        let actual: string = intersected.toString();
        let expected: string = "[12, 20]";
        expect(actual).assertEqual(expected);
        let actualExpandedText: string = expanded.toString();
        let expectedExpandedText: string = "[12, 50]";
        expect(actualExpandedText).assertEqual(expectedExpandedText);
        let actualOriginalText: string = range.toString();
        let expectedOriginalText: string = "[12, 34]";
        expect(actualOriginalText).assertEqual(expectedOriginalText);

      }
      {
        let actual: number = probeScopeCtorPair03(
          new ScopeHelperConstructorPart03TestMissingHolderT3(),
          new ScopeHelperConstructorPart03TestMissingCarT3(),
        );
        let expected: number = 1;
        expect(actual).assertEqual(expected);

      }
      {
        try {
          new util.ScopeHelper<ScopeHelperConstructorPart03Test3AllTrueT3>(
            new ScopeHelperConstructorPart03Test3AllTrueT3(3),
            new ScopeHelperConstructorPart03Test3AllTrueT3(3),
          );
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect(e.code).assertEqual(0);
        }

      }
    });

  });
}
