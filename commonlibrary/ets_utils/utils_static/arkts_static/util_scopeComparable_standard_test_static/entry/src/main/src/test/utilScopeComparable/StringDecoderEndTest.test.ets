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

export default function StringDecoderEndTest(): void {
  describe('StringDecoderEndTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_0100
     * @tc.name testSdEndEncoding001
     * @tc.desc Verify StringDecoder end with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end(new Uint8Array([0xef, 0xbb, 0xbf]));
        expect(result).assertEqual('﻿');

      }
      {
        let bytes: number[] = [];
        for (let i: number = 0; i < 128; i++) {
          bytes.push(i);
        }
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end(new Uint8Array(bytes));
        let actual: int = result.length;
        let expected: int = 128;
        expect(actual).assertEqual(expected);

      }
      {
        const decoder = new util.StringDecoder('gbk');
        let input: Uint8Array = new Uint8Array([0xc4, 0xe3]);
        const result: string = decoder.end(input);
        expect(result).assertEqual('你');

      }
      {
        const decoder = new util.StringDecoder('utf-16le');
        let input: Uint8Array = new Uint8Array([0x60, 0x4f, 0x7d, 0x59]);
        const result: string = decoder.end(input);
        expect(result).assertEqual('你好');

      }
      {
        let dec = new util.StringDecoder();
        let ret: string = dec.end('tail');
        expect(ret).assertEqual('tail');

      }
      {
        let dec = new util.StringDecoder();
        let len: number = dec.end(new Uint8Array([0x41, 0x42])).length;
        expect(len).assertEqual(2);

      }
      {
        let dec = new util.StringDecoder();
        let upper: string = dec.end(new Uint8Array([0x61, 0x62])).toUpperCase();
        expect(upper).assertEqual('AB');

      }
      {
        let dec = new util.StringDecoder();
        let ret: string = dec.end(new Uint8Array([0xe6, 0x9d, 0x8e]));
        expect(ret).assertEqual('李');

      }
      {
        let dec = new util.StringDecoder();
        let ret: string = dec.end(new Uint8Array([0xf0, 0x9f, 0x8d, 0xa9]));
        expect(ret).assertEqual('🍩');

      }
      {
        let dec = new util.StringDecoder('gbk');
        let ret: string = dec.end(new Uint8Array([0xba, 0xc3]));
        expect(ret).assertEqual('好');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_0200
     * @tc.name testSdEndEncoding002
     * @tc.desc Verify StringDecoder end with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array(10000);
        for (let i = 0; i < 10000; i++) {
          arr[i] = 0x61;
        }
        let ret: string = dec.end(arr);
        let actual: int = ret.length;
        let expected: int = 10000;
        expect(actual).assertEqual(expected);

      }
      {
        let dec = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array(16);
        for (let i = 0; i < 16; i++) {
          arr[i] = 0xe5;
        }
        let ret: string = dec.end(arr);
        let actual: int = ret.length;
        let expected: int = 16;
        expect(actual).assertEqual(expected);

      }
      {
        let dec = new util.StringDecoder();
        dec.end(new Uint8Array([0x41]));
        let ret: string = dec.end(new Uint8Array([0xe4, 0xb8, 0xad]));
        expect(ret).assertEqual('中');

      }
      {
        let dec = new util.StringDecoder();
        dec.end(new Uint8Array([0x41]));
        let ret: string = dec.write(new Uint8Array([0xe5, 0xa5, 0xbd]));
        expect(ret).assertEqual('好');

      }
      {
        let dec = new util.StringDecoder('big5');
        let ret: string = dec.end();
        expect(ret).assertEqual('');

      }
      {
        let dec = new util.StringDecoder();
        dec.write(new Uint8Array([0xe4, 0xb8, 0xad, 0xe5]));
        let ret: string = dec.end(new Uint8Array([0xa5, 0xbd]));
        expect(ret).assertEqual('好');

      }
      {
        let dec = new util.StringDecoder();
        dec.write(new Uint8Array([0xe4, 0xbd]));
        let ret: string = dec.end(new Uint8Array([0x80]));
        let actual: int = ret.length;
        let expected: int =1;
        expect(actual).assertEqual(expected);

      }
      {
        let dec = new util.StringDecoder('utf-16le');
        let ret: string = dec.end(new Uint8Array([0x60, 0x4f, 0x7d]));
        let actual: string = ret.substring(0, 1);
        let expected: string = '你';
        expect(actual).assertEqual(expected);

      }
      {
        let dec = new util.StringDecoder('utf-16le');
        let ret: string = dec.end(new Uint8Array([0x60]));
        let actual: int = ret.length;
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        let dec = new util.StringDecoder('utf-16le');
        dec.write(new Uint8Array([0x60]));
        let ret: string = dec.end(new Uint8Array([0x4f]));
        expect(ret).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_0300
     * @tc.name testSdEndEncoding003
     * @tc.desc Verify StringDecoder end with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec = new util.StringDecoder('utf-16le');
        let ret: string = dec.end(new Uint8Array([0x60, 0x4f, 0x7d, 0x59, 0x41]));
        let actual: int = ret.length;
        let expected: int = 3;
        expect(actual).assertEqual(expected);

      }
      {
        let dec = new util.StringDecoder('utf-16be');
        let ret: string = dec.end(new Uint8Array([0x4f, 0x60, 0x59, 0x7d, 0x41]));
        let actual: int = ret.length;
        let expected: int = 3;
        expect(actual).assertEqual(expected);

      }
      {
        let dec = new util.StringDecoder('gbk');
        dec.write(new Uint8Array([0xba]));
        let ret: string = dec.end();
        let actual: int = ret.length;
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        let dec = new util.StringDecoder('gb18030');
        let ret: string = dec.end(new Uint8Array([0x41]));
        expect(ret).assertEqual('A');

      }
      {
        let dec = new util.StringDecoder('big5');
        let ret: string = dec.end(new Uint8Array([0xa4, 0x40]));
        let actual: int = ret.length;
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        let dec = new util.StringDecoder('');
        let ret: string = dec.end();
        expect(ret).assertEqual('');

      }
      {
        let dec = new util.StringDecoder('iso-8859-2');
        let ret: string = dec.end(new Uint8Array([0xe1]));
        expect(ret).assertEqual('á');

      }
      {
        let dec = new util.StringDecoder('koi8-r');
        let ret: string = dec.end(new Uint8Array([0xc0]));
        expect(ret).assertEqual('ю');

      }
      {
        let dec = new util.StringDecoder('macintosh');
        let ret: string = dec.end(new Uint8Array([0x81]));
        expect(ret).assertEqual('Å');

      }
      {
        let dec = new util.StringDecoder('windows-1250');
        let ret: string = dec.end(new Uint8Array([0x80]));
        expect(ret).assertEqual('€');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_0400
     * @tc.name testSdEndEncoding004
     * @tc.desc Verify StringDecoder end with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec = new util.StringDecoder('windows-1251');
        let ret: string = dec.end(new Uint8Array([0xcf]));
        expect(ret).assertEqual('П');

      }
      {
        let dec = new util.StringDecoder('euc-jp');
        let ret: string = dec.end(new Uint8Array([0xa4, 0xa2]));
        expect(ret).assertEqual('あ');

      }
      {
        let dec = new util.StringDecoder('shift_jis');
        let ret: string = dec.end(new Uint8Array([0x82, 0xa0]));
        expect(ret).assertEqual('あ');

      }
      {
        let dec = new util.StringDecoder();
        dec.write(new Uint8Array([0xe6]));
        let ret: string = dec.end(new Uint8Array([0x9d, 0x8e]));
        expect(ret).assertEqual('李');

      }
      {
        let dec = new util.StringDecoder();
        dec.write(new Uint8Array([0xe4, 0xb8, 0xad, 0xf0]));
        let ret: string = dec.end(new Uint8Array([0x9f, 0x98, 0x8d]));
        expect(ret).assertEqual('😍');

      }
      {
        let dec = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array(3000);
        for (let i = 0; i < 3000; i++) {
          arr[i] = 0xe4;
        }
        dec.write(arr);
        let tail: Uint8Array = new Uint8Array(1000);
        for (let i = 0; i < 1000; i++) {
          tail[i] = 0xb8;
        }
        let ret: string = dec.end(tail);
        let actual: int = ret.length;
        let expected: int = 999;
        expect(actual).assertEqual(expected);

      }
      {
        let dec = new util.StringDecoder();
        let base: Uint8Array = new Uint8Array([0x41, 0xe4, 0xb8, 0xad]);
        let view: Uint8Array = base.subarray(1, 4);
        let ret: string = dec.end(view);
        expect(ret).assertEqual('中');

      }
      {
        let dec = new util.StringDecoder();
        let base: Uint8Array = new Uint8Array([0x68, 0x69, 0x6a, 0x6b, 0x6c]);
        let view: Uint8Array = base.subarray(2, 4);
        let ret: string = dec.end(view);
        expect(ret).assertEqual('jk');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_0500
     * @tc.name testSdEndUnicode001
     * @tc.desc Verify StringDecoder end with Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndUnicode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end(new Uint8Array([0x61, 0xe4, 0xbd, 0xa0, 0x62]));
        expect(result).assertEqual('a你b');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end(new Uint8Array([0xe5, 0xa5, 0xbd]));
        expect(result).assertEqual('好');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        decoder.write('ab');
        const result: string = decoder.end('你');
        expect(result).assertEqual('你');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        decoder.write(new Uint8Array([97, 98]));
        const result: string = decoder.end(new Uint8Array([0xe4, 0xbd, 0xa0]));
        expect(result).assertEqual('你');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd]);
        const writeString: string = decoder.write(input.slice(0, 5));
        decoder.end(input.slice(5));
        expect(writeString).assertEqual('你');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd]);
        decoder.write(input.slice(0, 5));
        const result: string = decoder.end(input.slice(5));
        expect(result).assertEqual('好');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xf0, 0x9f, 0x98, 0x80]);
        decoder.write(input.slice(0, 1));
        const result: string = decoder.end(input.slice(1));
        expect(result).assertEqual('😀');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd]);
        let acc: string = '';
        acc += decoder.write(input.slice(0, 2));
        acc += decoder.write(input.slice(2, 4));
        acc += decoder.end(input.slice(4));
        expect(acc).assertEqual('你好');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xe4, 0xbd, 0xa0]);
        let acc: string = '';
        acc += decoder.write('ab');
        acc += decoder.write(input.slice(0, 1));
        acc += decoder.end(input.slice(1));
        expect(acc).assertEqual('ab你');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        decoder.write(new Uint8Array([0xe4]));
        decoder.write(new Uint8Array([0xbd]));
        const result: string = decoder.end(new Uint8Array([0xa0]));
        expect(result).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_0600
     * @tc.name testSdEndUnicode002
     * @tc.desc Verify StringDecoder end with Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndUnicode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xe5, 0xa5, 0xbd]);
        decoder.write(new Uint8Array([0xe4, 0xbd, 0xa0]));
        decoder.write(input.slice(0, 1));
        const result: string = decoder.end(input.slice(1));
        expect(result).assertEqual('好');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd]);
        const writeResult: string = decoder.write(input.slice(0, 3));
        const endResult: string = decoder.end(input.slice(3));
        let actual = writeResult + endResult;
        let expected: string = '你好';
        expect(actual).assertEqual(expected);

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        const writeOut: string = decoder.write(new Uint8Array([0xe4, 0xbd, 0xa0]));
        const writeOutA: string = decoder.write(new Uint8Array([0xc3, 0xa9]));
        const endResult: string = decoder.end();
        let actual = writeOut + writeOutA + endResult;
        let expected: string = '你é';
        expect(actual).assertEqual(expected);

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        decoder.end(new Uint8Array([0xe4, 0xbd, 0xa0]));
        const w: string = decoder.write(new Uint8Array([0xe5, 0xa5, 0xbd]));
        expect(w).assertEqual('好');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd]));
        expect(result).assertEqual('你好');

      }
      {
        let decoder = new util.StringDecoder();
        let big = new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd, 0x61]);
        let result: string = decoder.end(big.subarray(0, 3));
        expect(result).assertEqual('你');

      }
      {
        let decoder = new util.StringDecoder();
        let big = new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd, 0x61]);
        let result: string = decoder.end(big.subarray(3, 6));
        expect(result).assertEqual('好');

      }
      {
        let decoder = new util.StringDecoder();
        let w: string = decoder.write('你');
        let result: string = decoder.end();
        expect(w).assertEqual('你');
        expect(result).assertEqual('');

      }
      {
        let decoder = new util.StringDecoder();
        let actualA: string = decoder.write(new Uint8Array([0xe4, 0xbd, 0xa0]));
        let actualB: string = decoder.write(new Uint8Array([0xe5, 0xa5, 0xbd]));
        let result: string = decoder.end();
        expect(actualA).assertEqual('你');
        expect(actualB).assertEqual('好');
        expect(result).assertEqual('');

      }
      {
        let decoder = new util.StringDecoder();
        let input = new Uint8Array([0xe4, 0xbd, 0xa0]);
        let result: string = decoder.end(input);
        let inputByte0 = input[0];
        let expectedByte0 = 0xe4;
        expect(inputByte0).assertEqual(expectedByte0);
        let inputByte1 = input[1];
        let expectedByte1 = 0xbd;
        expect(inputByte1).assertEqual(expectedByte1);
        let inputByte2: number = input[2];
        let expectedByte2: number = 0xa0;
        expect(inputByte2).assertEqual(expectedByte2);
        expect(result).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_0700
     * @tc.name testSdEndUnicode003
     * @tc.desc Verify StringDecoder end with Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndUnicode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoderA = new util.StringDecoder();
        let decoderB = new util.StringDecoder();
        let s: string = decoderA.end('你好');
        let result: string = decoderB.end(s);
        expect(result).assertEqual('你好');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0xed, 0xa0, 0x80]));
        expect(result).assertEqual('\uFFFD\uFFFD\uFFFD');

      }
      {
        let decoder = new util.StringDecoder();
        let actualA: string = decoder.write(new Uint8Array([0xe4]));
        let actualB: string = decoder.write(new Uint8Array([0xbd]));
        let actualC: string = decoder.write(new Uint8Array([0xa0]));
        let result: string = decoder.end();
        expect(actualA).assertEqual('');
        expect(actualB).assertEqual('');
        expect(actualC).assertEqual('你');
        expect(result).assertEqual('');

      }
      {
        let decoder = new util.StringDecoder();
        let first: string = decoder.write(new Uint8Array([0xf0, 0x9f, 0x98, 0x80]));
        let result: string = decoder.end();
        expect(first).assertEqual('😀');
        expect(result).assertEqual('');

      }
      {
        let decoder = new util.StringDecoder();
        let first: string = decoder.write(new Uint8Array([0x41, 0xe4]));
        let result: string = decoder.end(new Uint8Array([0xbd, 0xa0]));
        expect(first).assertEqual('A');
        expect(result).assertEqual('你');

      }
      {
        let decoder = new util.StringDecoder();
        let input = new Uint8Array([0xe4, 0xbd, 0xa0]);
        let result: string = decoder.end(input);
        input[0] = 0x41;
        expect(result).assertEqual('你');

      }
      {
        let decoder = new util.StringDecoder();
        let ab = new ArrayBuffer(6);
        let value = new Uint8Array(ab, 0, 3);
        value[0] = 0xe4;
        value[1] = 0xbd;
        value[2] = 0xa0;
        let valueA = new Uint8Array(ab, 3, 3);
        valueA[0] = 0xe5;
        valueA[1] = 0xa5;
        valueA[2] = 0xbd;
        let actualA: string = decoder.end(value);
        let actualB: string = decoder.end(valueA);
        expect(actualA).assertEqual('你');
        expect(actualB).assertEqual('好');

      }
      {
        let decoder = new util.StringDecoder();
        let ab = new ArrayBuffer(6);
        let view = new Uint8Array(ab, 3, 3);
        view[0] = 0xe5;
        view[1] = 0xa5;
        view[2] = 0xbd;
        let result: string = decoder.end(view);
        expect(result).assertEqual('好');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_0800
     * @tc.name testSdEndInvisible001
     * @tc.desc Verify StringDecoder end with invisible characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndInvisible001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end(new Uint8Array([0xe4, 0xbd]));
        expect(result).assertEqual('�');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        decoder.write(new Uint8Array([0xe4, 0xbd, 0xa0]));
        const result: string = decoder.end(new Uint8Array([0xe5]));
        expect(result).assertEqual('�');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        decoder.write(new Uint8Array([0xe4, 0xbd, 0xa0]));
        let input: Uint8Array = new Uint8Array([0xe5, 0xa5, 0xbd]);
        decoder.write(input.slice(0, 2));
        const result: string = decoder.end();
        expect(result).assertEqual('��');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xf0, 0x9f, 0x98, 0x80]);
        decoder.write(input.slice(0, 3));
        const result: string = decoder.end();
        expect(result).assertEqual('��');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0xff, 0xff, 0xff]));
        expect(result).assertEqual('\uFFFD\uFFFD\uFFFD');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0xc0, 0xaf]));
        expect(result).assertEqual('\uFFFD\uFFFD');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0xf5, 0x80, 0x80, 0x80]));
        expect(result).assertEqual('\uFFFD\uFFFD\uFFFD\uFFFD');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0xf0, 0x9f, 0x98]));
        expect(result).assertEqual('\uFFFD');

      }
      {
        let decoder = new util.StringDecoder();
        let actualA: string = decoder.write(new Uint8Array([0x41, 0xe4, 0xbd]));
        let result: string = decoder.end();
        expect(actualA).assertEqual('A');
        expect(result).assertEqual('\uFFFD\uFFFD');

      }
      {
        let dec = new util.StringDecoder();
        dec.write(new Uint8Array([0xe4, 0xb8]));
        let ret: string = dec.end();
        expect(ret).assertEqual('\uFFFD\uFFFD');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_0900
     * @tc.name testSdEndBoundary001
     * @tc.desc Verify StringDecoder end with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const decoder = new util.StringDecoder('utf-8');
        decoder.write('hello');
        const result: string = decoder.end();
        expect(result).assertEqual('');

      }
      {
        let longStr: string = '';
        for (let i: number = 0; i < 10000; i++) {
          longStr += 'x';
        }
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end(longStr);
        let actual: int = result.length;
        let expected: int = 10000;
        expect(actual).assertEqual(expected);

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        try {
          const result: string = decoder.end(new Uint8Array(0));
          expect(result).assertEqual('');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let decoder = new util.StringDecoder();
        let bytes: number[] = [];
        for (let i: number = 0; i < 65536; i++) {
          bytes.push(0x61);
        }
        let input = new Uint8Array(bytes);
        let result: string = decoder.end(input);
        let actual: int = result.length;
        let expectedA: int = 65536;
        expect(actual).assertEqual(expectedA);

      }
      {
        let decoder = new util.StringDecoder();
        let bytes: number[] = [];
        for (let i: number = 0; i < 30000; i++) {
          bytes.push(0xe4);
          bytes.push(0xbd);
          bytes.push(0xa0);
        }
        let input = new Uint8Array(bytes);
        let result: string = decoder.end(input);
        let actual: int = result.length;
        let expectedA: int = 30000;
        expect(actual).assertEqual(expectedA);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_1000
     * @tc.name testSdEndConsistency001
     * @tc.desc Verify StringDecoder end state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end();
        expect(result).assertEqual('');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end('single');
        expect(result).assertEqual('single');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end(new Uint8Array([0x61]));
        expect(result).assertEqual('a');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end('\udc04');
        expect(result).assertEqual('\udc04');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end('a\u0000b');
        expect(result).assertEqual('a\u0000b');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end('\t\n');
        expect(result).assertEqual('\t\n');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end(new Uint8Array([97, 98, 0, 99]));
        expect(result).assertEqual('ab\u0000c');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end(new Uint8Array([0x00]));
        expect(result).assertEqual('\u0000');

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd]);
        decoder.write(input.slice(0, 3));
        const result: string = decoder.end(input.slice(3));
        let actual: int = result.length;
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        const decoder = new util.StringDecoder('utf-8');
        const result: string = decoder.end(new Uint8Array([97, 98, 99]));
        let actual: int = result.length;
        let expected: int = 3;
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_1100
     * @tc.name testSdEndConsistency002
     * @tc.desc Verify StringDecoder end state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndConsistency002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.StringDecoder();
        let actual: int = decoder.end('a').length;
        let expectedA: int = 1;
        expect(actual).assertEqual(expectedA);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_1200
     * @tc.name testSdEndBasic001
     * @tc.desc Verify StringDecoder end with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0x42]));
        expect(result).assertEqual('B');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end('world');
        expect(result).assertEqual('world');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0x41]));
        expect(result).assertEqual('A');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0x42, 0x43]));
        expect(result).assertEqual('BC');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0xf0, 0x9f, 0x98, 0x80]));
        expect(result).assertEqual('😀');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0x41, 0x00, 0x42]));
        expect(result).assertEqual('A\u0000B');

      }
      {
        let decoder = new util.StringDecoder();
        let bytes: number[] = [];
        for (let i: number = 0; i < 256; i++) {
          bytes.push(i);
        }
        let input = new Uint8Array(bytes);
        let result: string = decoder.end(input);
        let actual: int = result.length;
        let expectedA: int = 256;
        expect(actual).assertEqual(expectedA);

      }
      {
        let decoder = new util.StringDecoder();
        let bytes: number[] = [];
        for (let i: number = 0; i < 1000; i++) {
          bytes.push(0x61);
        }
        let input = new Uint8Array(bytes);
        let expected: string = '';
        for (let i: number = 0; i < 1000; i++) {
          expected = expected + 'a';
        }
        let result: string = decoder.end(input);
        expect(result).assertEqual(expected);

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0x31, 0x32, 0x33]));
        expect(result).assertEqual('123');

      }
      {
        let decoder = new util.StringDecoder();
        let big = new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd, 0x61]);
        let result: string = decoder.end(big.subarray(6));
        expect(result).assertEqual('a');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_1300
     * @tc.name testSdEndBasic002
     * @tc.desc Verify StringDecoder end with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0x41, 0x42, 0x43]));
        expect(result).assertEqual('ABC');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end('你好');
        let actual: int = result.length;
        let expectedA: int = 2;
        expect(actual).assertEqual(expectedA);

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end('😀');
        let actual: int = result.length;
        let expectedA: int = 2;
        expect(actual).assertEqual(expectedA);

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end('a你b');
        let actual: int = result.length;
        let expectedA: int = 3;
        expect(actual).assertEqual(expectedA);

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0xc3, 0xa9]));
        let actual: int = result.length;
        let expectedA: int = 1;
        expect(actual).assertEqual(expectedA);

      }
      {
        let decoder = new util.StringDecoder();
        let first: string = decoder.write(new Uint8Array([0xc3]));
        let result: string = decoder.end(new Uint8Array([0xa9]));
        expect(first).assertEqual('');
        expect(result).assertEqual('é');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0xf0, 0x9f, 0x98, 0x80, 0xf0, 0x9f, 0x98, 0x80]));
        expect(result).assertEqual('😀😀');

      }
      {
        let decoder = new util.StringDecoder();
        let result: string = decoder.end(new Uint8Array([0xe4, 0xbd, 0xa0]));
        let actual: int = result.length;
        let expectedA: int = 1;
        expect(actual).assertEqual(expectedA);

      }
      {
        let dec = new util.StringDecoder();
        let s: string = 'z'.repeat(8000);
        let ret: string = dec.end(s);
        let actual: int = ret.length;
        let expected: int = 8000;
        expect(actual).assertEqual(expected);

      }
      {
        let dec = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array(32);
        for (let i = 0; i < 32; i++) {
          arr[i] = 0x61;
        }
        let ret: string = dec.end(arr);
        expect(ret).assertEqual('a'.repeat(32));

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_END_1400
     * @tc.name testSdEndBasic003
     * @tc.desc Verify StringDecoder end with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdEndBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec = new util.StringDecoder();
        let ret: string = dec.end(new Uint8Array([0x20]));
        expect(ret).assertEqual(' ');

      }
      {
        let dec = new util.StringDecoder();
        dec.write(new Uint8Array([0xe4, 0xb8, 0xad]));
        let first: string = dec.end();
        let second: string = dec.end();
        expect(second).assertEqual('');

      }
      {
        let dec = new util.StringDecoder();
        let a: string = dec.end();
        let b: string = dec.end();
        let c: string = dec.end();
        expect(a).assertEqual('');
        expect(b).assertEqual('');
        expect(c).assertEqual('');

      }
      {
        let dec = new util.StringDecoder();
        let base: Uint8Array = new Uint8Array([0x58, 0x59, 0x5a]);
        let view: Uint8Array = base.subarray(1, 3);
        let ret: string = dec.end(view);
        expect(ret).assertEqual('YZ');

      }
      {
        let dec = new util.StringDecoder();
        let full: Uint8Array = new Uint8Array([0xe5, 0xa5, 0xbd]);
        let view: Uint8Array = full.subarray(0, 3);
        let rv: string = dec.end(view);
        expect(rv).assertEqual('好');

      }
    });

  });
}
