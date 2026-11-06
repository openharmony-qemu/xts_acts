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

export default function StringDecoderConstructorTest(): void {
  describe('StringDecoderConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_0100
     * @tc.name testSdCtorThrows001
     * @tc.desc Verify StringDecoder constructor throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          let d = new util.StringDecoder(' utf-8');
          let out = d.write(new Uint8Array([0x61, 0x62]));
          expect(out).assertEqual('ab');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let d = new util.StringDecoder('x'.repeat(1000));
          let out = d.write(new Uint8Array([0x61, 0x62]));
          expect(out).assertEqual('ab');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let d = new util.StringDecoder('\u0000');
          let out = d.write(new Uint8Array([0x61, 0x62]));
          expect(out).assertEqual('ab');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let dB1: util.StringDecoder = new util.StringDecoder('ascii');
          expect(dB1.end()).assertEqual('');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let dB2: util.StringDecoder = new util.StringDecoder('latin1');
          let outB2: string = dB2.write('abc');
          expect(outB2).assertEqual('abc');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let dC20: util.StringDecoder = new util.StringDecoder('\u0000utf-8');
          let outC20: string = dC20.write('abc');
          expect(outC20).assertEqual('abc');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let nameD4: string = 'z'.repeat(10000);
        try {
          let dD4: util.StringDecoder = new util.StringDecoder(nameD4);
          expect(dD4.end()).assertEqual('');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let nameD5: string = 'utf-8' + 'a'.repeat(9996);
        try {
          let dD5: util.StringDecoder = new util.StringDecoder(nameD5);
          let outD5: string = dD5.write('abc');
          expect(outD5).assertEqual('abc');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let dF1bad: util.StringDecoder = new util.StringDecoder('recover-enc');
          expect(dF1bad.end()).assertEqual('');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        let dF1: util.StringDecoder = new util.StringDecoder('utf-8');
        let outF1: string = dF1.write(new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd]));
        expect(outF1).assertEqual('你好');

      }
      {
        let dF2a: util.StringDecoder = new util.StringDecoder('iso-2022-jp');
        expect(dF2a.end()).assertEqual('');
        try {
          let dF2b: util.StringDecoder = new util.StringDecoder('iso-2022-kr');
          let outF2: string = dF2b.write('abc');
          expect(outF2).assertEqual('abc');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_0200
     * @tc.name testSdCtorThrows002
     * @tc.desc Verify StringDecoder constructor throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorThrows002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          let dF3a: util.StringDecoder = new util.StringDecoder('same-enc');
          let outF3a: string = dF3a.write(new Uint8Array([0x41]));
          expect(outF3a).assertEqual('A');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        try {
          let dF3b: util.StringDecoder = new util.StringDecoder('same-enc');
          let outF3b: string = dF3b.write(new Uint8Array([0x42]));
          expect(outF3b).assertEqual('B');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let dF6a: util.StringDecoder = new util.StringDecoder('isolate-enc-a');
          let outF6a: string = dF6a.write(new Uint8Array([0x41]));
          expect(outF6a).assertEqual('A');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        try {
          let dF6b: util.StringDecoder = new util.StringDecoder('isolate-enc-b');
          let outF6b: string = dF6b.write(new Uint8Array([0x43]));
          expect(outF6b).assertEqual('C');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let dH1: util.StringDecoder = new util.StringDecoder('throw-enc');
          let outH1: string = dH1.write(new Uint8Array([0x46]));
          expect(outH1).assertEqual('F');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_0300
     * @tc.name testSdCtorEncoding001
     * @tc.desc Verify StringDecoder constructor with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a = new util.StringDecoder();
        let b = new util.StringDecoder('gbk');
        let bytes = new Uint8Array([0xd6, 0xd0]);
        let oa = a.write(bytes);
        let ob = b.write(bytes);
        expect(ob).assertEqual('中');
        expect(oa ==='中').assertFalse();

      }
      {
        let d = new util.StringDecoder('utf-16le');
        let out = d.write(new Uint8Array([0x2d, 0x4e]));
        expect(out).assertEqual('中');

      }
      {
        let d = new util.StringDecoder('gb18030');
        let out = d.write(new Uint8Array([0xd6, 0xd0]));
        expect(out).assertEqual('中');

      }
      {
        let d = new util.StringDecoder('big5');
        let out = d.write(new Uint8Array([0xa4, 0xa4]));
        expect(out).assertEqual('中');

      }
      {
        let d = new util.StringDecoder('koi8-r');
        let out = d.write(new Uint8Array([0xc1]));
        expect(out).assertEqual('а');

      }
      {
        let d = new util.StringDecoder('macintosh');
        let out = d.write(new Uint8Array([0x83]));
        expect(out).assertEqual('É');

      }
      {
        let d = new util.StringDecoder('windows-1250');
        let out = d.write(new Uint8Array([0xb3]));
        expect(out).assertEqual('ł');

      }
      {
        let d = new util.StringDecoder('windows-1251');
        let out = d.write(new Uint8Array([0xc1]));
        expect(out).assertEqual('Б');

      }
      {
        let d = new util.StringDecoder('gbk');
        let out = d.write(new Uint8Array([0x41]));
        expect(out).assertEqual('A');

      }
      {
        let le = new util.StringDecoder('utf-16le');
        let be = new util.StringDecoder('utf-16be');
        let bytes = new Uint8Array([0x4e, 0x2d]);
        let outLe = le.write(bytes);
        let outBe = be.write(bytes);
        expect(outBe).assertEqual('中');
        expect(outLe === '中').assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_0400
     * @tc.name testSdCtorEncoding002
     * @tc.desc Verify StringDecoder constructor with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xc4, 0xe3]));
        expect(out === '你').assertFalse();

      }
      {
        let g = new util.StringDecoder('gbk');
        let i = new util.StringDecoder('iso-8859-2');
        let bytes = new Uint8Array([0xb3]);
        let og = g.write(bytes);
        let oi = i.write(bytes);
        expect(oi).assertEqual('ł');
        expect(og === 'ł').assertFalse();

      }
      {
        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xf0, 0x9f, 0x98, 0x80]));
        expect(out).assertEqual('😀');

      }
      {
        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xc3, 0xa9]));
        expect(out).assertEqual('é');

      }
      {
        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x80]));
        expect(out).assertEqual('�');

      }
      {
        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xef, 0xbb, 0xbf]));
        expect(out).assertEqual('﻿');

      }
      {
        let d = new util.StringDecoder('gb18030');
        let out = d.write(new Uint8Array([0x81, 0x30, 0x81, 0x30]));
        let actual: int = out.length;
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        let d = new util.StringDecoder();
        d.write(new Uint8Array([0xe4, 0xb8]));
        let out = d.write(new Uint8Array([0xad]));
        expect(out).assertEqual('中');

      }
      {
        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xe4, 0xb8, 0xad]));
        let out2 = d.write(new Uint8Array([0xe5, 0xa5, 0xbd]));
        expect(out).assertEqual('中');
        expect(out2).assertEqual('好');

      }
      {
        let decoder = new util.StringDecoder();
        let ret: string = decoder.write('AB');
        expect(ret).assertEqual('AB');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_0500
     * @tc.name testSdCtorEncoding003
     * @tc.desc Verify StringDecoder constructor with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.StringDecoder();
        let input: Uint8Array = new Uint8Array([0x48]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('H');

      }
      {
        let decoder = new util.StringDecoder();
        let input: Uint8Array = new Uint8Array([0xe9, 0x87, 0x8f]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('量');

      }
      {
        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0x2d]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('-');

      }
      {
        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xe6, 0x8b, 0x86]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('拆');

      }
      {
        let decoder = new util.StringDecoder();
        decoder.write(new Uint8Array([0xe4, 0xbd, 0xa0]));
        let ret: string = decoder.end();
        expect(ret).assertEqual('');

      }
      {
        let decoder = new util.StringDecoder();
        let input: Uint8Array = new Uint8Array([0xe5, 0xad, 0xa6, 0x31]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('学1');

      }
      {
        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xad, 0xa6]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('你学');

      }
      {
        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0x41, 0xf0, 0x9f, 0x98, 0x80, 0x43]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('A😀C');

      }
      {
        let decoder = new util.StringDecoder();
        let input: Uint8Array = new Uint8Array([0x61, 0xf0, 0x9f, 0x98]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('a');

      }
      {
        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array(256);
        for (let i = 0; i < 256; i++) {
          input.$_set(i, 65);
        }
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('A'.repeat(256));

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_0600
     * @tc.name testSdCtorEncoding004
     * @tc.desc Verify StringDecoder constructor with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.StringDecoder('utf-16le');
        let input: Uint8Array = new Uint8Array([0x60, 0x4f]);
        let ret: string = decoder.end(input);
        expect(ret).assertEqual('你');

      }
      {
        let decoder = new util.StringDecoder('big5');
        let input: Uint8Array = new Uint8Array([0xa7, 0x41]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('你');

      }
      {
        let decoder = new util.StringDecoder('utf-16be');
        let input: Uint8Array = new Uint8Array([0x4f, 0x60, 0x5b, 0x66]);
        let ret: string = decoder.end(input);
        expect(ret).assertEqual('你学');

      }
      {
        let decoder = new util.StringDecoder('gbk');
        let input: Uint8Array = new Uint8Array([0x32]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('2');

      }
      {
        let decoder = new util.StringDecoder();
        let input: Uint8Array = new Uint8Array([0xe6, 0x88, 0x91, 0xe6, 0x8b, 0x86, 0xe5, 0xad, 0xa6, 0xe9, 0x87, 0x8f]);
        let ret: string = decoder.write(input);
        let actual: int = ret.length;
        let expected: int = 4;
        expect(actual).assertEqual(expected);

      }
      {
        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xc3, 0xa9]);
        let ret: string = decoder.write(input);
        let actual: int = ret.length;
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        let decoder = new util.StringDecoder('utf-16le');
        let input: Uint8Array = new Uint8Array([0x60, 0x4f, 0x7d, 0x59]);
        let ret: string = decoder.end(input);
        let actual: int = ret.length;
        let expected: int = 2;
        expect(actual).assertEqual(expected);

      }
      {
        let decoder = new util.StringDecoder();
        let input: Uint8Array = new Uint8Array([0x41, 0xe5]);
        let ret: string = decoder.write(input);
        let actual: int = ret.length;
        let expected: int = 1;
        expect(actual).assertEqual(expected);

      }
      {
        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xe5, 0xad, 0xa6]);
        let ret: string = decoder.write(input);
        let tail: string = decoder.end();
        expect(ret).assertEqual('学');
        expect(tail).assertEqual('');

      }
      {
        let decoder = new util.StringDecoder('gbk');
        let input: Uint8Array = new Uint8Array([0xc4, 0xe3, 0xba, 0xc3]);
        let first: string = decoder.write(input.slice(0, 1));
        let ret: string = decoder.write(input.slice(1));
        expect(first).assertEqual('');
        expect(ret).assertEqual('你好');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_0700
     * @tc.name testSdCtorEncoding005
     * @tc.desc Verify StringDecoder constructor with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xe6, 0x88, 0x91]);
        let first: string = decoder.write(input.slice(0, 2));
        let ret: string = decoder.end(input.slice(2));
        expect(first).assertEqual('');
        expect(ret).assertEqual('我');

      }
      {
        let decoder = new util.StringDecoder('utf-16le');
        let input: Uint8Array = new Uint8Array([0x60, 0x4f]);
        let first: string = decoder.write(input.slice(0, 1));
        let ret: string = decoder.write(input.slice(1));
        expect(first).assertEqual('');
        expect(ret).assertEqual('你');

      }
      {
        let decoder = new util.StringDecoder();
        let input: Uint8Array = new Uint8Array([0xe6, 0x88, 0x91]);
        let ret: string = decoder.write(input);
        let empty: string = decoder.write('');
        expect(ret).assertEqual('我');
        expect(empty).assertEqual('');

      }
      {
        let decoder = new util.StringDecoder('utf-8');
        let buf: ArrayBuffer = new ArrayBuffer(5);
        let input: Uint8Array = new Uint8Array(buf, 1, 3);
        input.$_set(0, 0xe5);
        input.$_set(1, 0xad);
        input.$_set(2, 0xa6);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('学');

      }
      {
        let decoder = new util.StringDecoder();
        let first: string = decoder.write(new Uint8Array([0x41]));
        let second: string = decoder.write(new Uint8Array([0x42]));
        let actual: boolean = first === second;
        expect(actual).assertFalse();
        expect(first).assertEqual('A');
        expect(second).assertEqual('B');

      }
      {
        let decoder = new util.StringDecoder();
        let input: Uint8Array = new Uint8Array([0xe6, 0x88, 0x91, 0xe6, 0x8b, 0x86]);
        let ret: string = decoder.write(input);
        let actual: int = ret.length;
        let expected: int = 2;
        expect(actual).assertEqual(expected);

      }
      {
        let decoder = new util.StringDecoder();
        let a: string = decoder.write(new Uint8Array([0xe5, 0xad, 0xa6]));
        let b: string = decoder.write(new Uint8Array([0xe9, 0x87, 0x8f]));
        expect(a).assertEqual('学');
        expect(b).assertEqual('量');

      }
      {
        let decoder = new util.StringDecoder('utf-8');
        let a: string = decoder.write(new Uint8Array([0x41]));
        let b: string = decoder.end();
        let c: string = decoder.write(new Uint8Array([0x42]));
        expect(a).assertEqual('A');
        expect(b).assertEqual('');
        expect(c).assertEqual('B');

      }
      {
        let decoder = new util.StringDecoder('gbk');
        let a: string = decoder.write(new Uint8Array([0x32]));
        let b: string = decoder.write(new Uint8Array([0xc4, 0xe3]));
        let c: string = decoder.write(new Uint8Array([0x33]));
        expect(a).assertEqual('2');
        expect(b).assertEqual('你');
        expect(c).assertEqual('3');

      }
      {
        let decoder = new util.StringDecoder();
        let first: string = decoder.write(new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5]));
        let second: string = decoder.end(new Uint8Array([0xad, 0xa6]));
        let actual = first + second;
        let expected: string = '你学';
        expect(actual).assertEqual(expected);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_0800
     * @tc.name testSdCtorEncoding006
     * @tc.desc Verify StringDecoder constructor with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xe6, 0x88, 0x91]);
        let a: string = decoder.write(input);
        let b: string = decoder.write(input);
        expect(a).assertEqual('我');
        expect(b).assertEqual('我');

      }
      {
        let decoder = new util.StringDecoder();
        let first: string = decoder.write(new Uint8Array([0xe5]));
        expect(first).assertEqual('');
        let second: string = decoder.end(new Uint8Array([0xad, 0xa6]));
        expect(second).assertEqual('学');

      }
      {
        try {
          let dA5: util.StringDecoder = new util.StringDecoder('err-len-enc');
          let outA5: string = dA5.write(new Uint8Array([0x41]));
          expect(outA5).assertEqual('A');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let dB3: util.StringDecoder = new util.StringDecoder('iso-8859-1');
        let outB3: string = dB3.write(new Uint8Array([0x41]));
        expect(outB3).assertEqual('A');

      }
      {
        let dB7: util.StringDecoder = new util.StringDecoder('shift_jis');
        expect(dB7.end()).assertEqual('');

      }
      {
        let dB8: util.StringDecoder = new util.StringDecoder('euc-kr');
        let outB8: string = dB8.write('abc');
        expect(outB8).assertEqual('abc');

      }
      {
        try {
          let dE3: util.StringDecoder = new util.StringDecoder('unknown-enc');
          let outE3: string = dE3.write(new Uint8Array([0xe4, 0xbd, 0xa0]));
          expect(outE3).assertEqual('你');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let dE6: util.StringDecoder = new util.StringDecoder('broken-enc');
          let outE6: string = dE6.write(new Uint8Array([0xff]));
          expect(outE6).assertEqual('�');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let dE7: util.StringDecoder = new util.StringDecoder('quiet-enc');
          let outE7: string = dE7.write(new Uint8Array([0x61, 0xe4, 0xbd, 0xa0, 0x62]));
          expect(outE7).assertEqual('a你b');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let dF4a: util.StringDecoder = new util.StringDecoder('mix-enc');
          expect(dF4a.end()).assertEqual('');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        let encF4: string | undefined = undefined;
        let dF4b: util.StringDecoder = new util.StringDecoder(encF4);
        let outF4: string = dF4b.write(new Uint8Array([0xe5, 0xa5, 0xbd]));
        expect(outF4).assertEqual('好');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_0900
     * @tc.name testSdCtorEncoding007
     * @tc.desc Verify StringDecoder constructor with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          let dG4: util.StringDecoder = new util.StringDecoder('type-enc');
          let outG4: string = dG4.write(new Uint8Array([0x45]));
          expect(outG4).assertEqual('E');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let dH2a: util.StringDecoder = new util.StringDecoder('boom-enc');
          let dH2b: util.StringDecoder = new util.StringDecoder('utf-8');
          let outH2: string = dH2b.write(new Uint8Array([0xe5, 0xa5, 0xbd]));
          expect(outH2).assertEqual('好');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_1000
     * @tc.name testSdCtorUnicode001
     * @tc.desc Verify StringDecoder constructor with Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorUnicode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dA1: util.StringDecoder = new util.StringDecoder(undefined);
        let outA1: string = dA1.write(new Uint8Array([0xe4, 0xb8, 0x80]));
        expect(outA1).assertEqual('一');

      }
      {
        let encA3: string | undefined = undefined;
        let dA3a: util.StringDecoder = new util.StringDecoder(encA3);
        let dA3b: util.StringDecoder = new util.StringDecoder();
        let srcA3: Uint8Array = new Uint8Array([0xe4, 0xbd, 0xa0]);
        let rA3a: string = dA3a.write(srcA3);
        let rA3b: string = dA3b.write(srcA3);
        expect(rA3a).assertEqual(rA3b);
        expect(rA3a).assertEqual('你');

      }
      {
        let encA4: string | undefined = undefined;
        let dA4: util.StringDecoder = new util.StringDecoder(encA4);
        let outA4: string = dA4.end(new Uint8Array([0xe5, 0xa5, 0xbd]));
        expect(outA4).assertEqual('好');

      }
      {
        try {
          let dF5a: util.StringDecoder = new util.StringDecoder('then-zero-enc');
          expect(dF5a.end()).assertEqual('');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        let dF5b: util.StringDecoder = new util.StringDecoder();
        let outF5: string = dF5b.write(new Uint8Array([0xe4, 0xbd, 0xa0]));
        expect(outF5).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_1100
     * @tc.name testSdCtorConsistency001
     * @tc.desc Verify StringDecoder constructor state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x5a]));
        expect(out).assertEqual('Z');

      }
      {
        let a = new util.StringDecoder();
        let b = new util.StringDecoder('utf-8');
        let oa = a.write(new Uint8Array([0xe5, 0xa5, 0xbd]));
        let ob = b.write(new Uint8Array([0xe5, 0xa5, 0xbd]));
        expect(oa).assertEqual(ob);
        expect(oa).assertEqual('好');

      }
      {
        let out = useDecoder(new util.StringDecoder());
        expect(out).assertEqual('C');

      }
      {
        let h = new StringDecoderConstructorPart01Test1DecoderHolder();
        let out = h.dec.write(new Uint8Array([0x44]));
        expect(out).assertEqual('D');

      }
      {
        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xf8, 0x88, 0x80, 0x80, 0x80]));
        let actual: int = out.length;
        let expected: int = 5;
        expect(actual).assertEqual(expected);

      }
      {
        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x00]));
        expect(out).assertEqual('\u0000');

      }
      {
        let d = new util.StringDecoder('utf-16le');
        let out = d.write(new Uint8Array([0x41]));
        expect(out).assertEqual('');

      }
      {
        let d = new util.StringDecoder('utf-16le');
        d.write(new Uint8Array([0x41]));
        let out = d.write(new Uint8Array([0x00]));
        expect(out).assertEqual('A');

      }
      {
        let d = new util.StringDecoder();
        d.write(new Uint8Array([0x41]));
        let out = d.write(new Uint8Array([0x42]));
        expect(out).assertEqual('B');

      }
      {
        let encA2: string | undefined = undefined;
        let dA2: util.StringDecoder = new util.StringDecoder(encA2);
        let outA2: string = dA2.write('pass');
        expect(outA2).assertEqual('pass');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_1200
     * @tc.name testSdCtorConsistency002
     * @tc.desc Verify StringDecoder constructor state consistency and independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorConsistency002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dG1: util.StringDecoder = new util.StringDecoder();
        let outG1: string = dG1.write(new Uint8Array([0x42]));
        expect(outG1).assertEqual('B');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SCOPE_STRINGDECODER_CONSTRUCTOR_1300
     * @tc.name testSdCtorBasic001
     * @tc.desc Verify StringDecoder constructor with numeric bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdCtorBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x41]));
        expect(out).assertEqual('A');

      }
      {
        let decoder = new util.StringDecoder();
        let input: Uint8Array = new Uint8Array([0xe5, 0xad, 0xa6]);
        let first: string = decoder.write(input.slice(0, 2));
        let ret: string = decoder.write(input.slice(2));
        expect(first).assertEqual('');
        expect(ret).assertEqual('学');

      }
      {
        try {
          let dE4: util.StringDecoder = new util.StringDecoder('nope');
          let outE4: string = dE4.end(new Uint8Array([0x42]));
          expect(outE4).assertEqual('B');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          let dE5: util.StringDecoder = new util.StringDecoder('bad-name');
          let outE5a: string = dE5.write(new Uint8Array([0x41]));
          let outE5b: string = dE5.write(new Uint8Array([0x42]));
          expect(outE5a).assertEqual('A');
          expect(outE5b).assertEqual('B');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

  });
}
