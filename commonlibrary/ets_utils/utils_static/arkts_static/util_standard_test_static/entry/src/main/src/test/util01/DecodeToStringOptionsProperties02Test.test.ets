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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';
import util from '@ohos.util';

export default function decodeToStringOptionsProperties02Test(): void {
  describe('decodeToStringOptionsProperties02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_0100
     * @tc.name decodeToStringOptionsPropertiesTwoTest001
     * @tc.desc Verify typeof new TextDecoder().decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd])) returns 'string'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdT01 = new util.TextDecoder();
      let rT01 = tdT01.decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd]));
      let actual1: string = typeof rT01;
      let expected1: string = 'string';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_0200
     * @tc.name decodeToStringOptionsPropertiesTwoTest002
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe4, 0xb8, 0xad, 0xe6, 0x96, 0x87])) returns 'U+4E2DU+6587'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdV01 = new util.TextDecoder();
      let rV01 = tdV01.decodeToString(new Uint8Array([0xe4, 0xb8, 0xad, 0xe6, 0x96, 0x87]));
      expect(rV01).assertEqual('中文');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_0300
     * @tc.name decodeToStringOptionsPropertiesTwoTest003
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0xe4, 0xb8, 0x96, 0xe7, 0x95, 0x8c]), { stream: false }) returns 'Hello, U+4E16U+754C'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV02: util.DecodeToStringOptions = { stream: false };
      let tdV02 = new util.TextDecoder();
      let rV02 = tdV02.decodeToString(
        new Uint8Array([0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x2c, 0x20, 0xe4, 0xb8, 0x96, 0xe7, 0x95, 0x8c]),
        optsV02,
      );
      expect(rV02).assertEqual('Hello, 世界');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_0400
     * @tc.name decodeToStringOptionsPropertiesTwoTest004
     * @tc.desc Verify decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]), optsV03) returns 'U+4F60 U+597D'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV03: util.DecodeToStringOptions = { stream: true };
      let tdV03 = new util.TextDecoder();
      let rV03 = tdV03.decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd]), optsV03);
      expect(rV03).assertEqual('你好');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_0500
     * @tc.name decodeToStringOptionsPropertiesTwoTest005
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0x61, 0x00, 0x62]), { stream: false }) returns 'a\u0000b'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV04: util.DecodeToStringOptions = { stream: false };
      let tdV04 = new util.TextDecoder();
      let rV04 = tdV04.decodeToString(new Uint8Array([0x61, 0x00, 0x62]), optsV04);
      expect(rV04).assertEqual('a\u0000b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_0600
     * @tc.name decodeToStringOptionsPropertiesTwoTest006
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe4, 0xb8]), { stream: true }) returns '', and new TextDecoder().decodeToString(new Uint8Array([0xad]), { stream: true }) returns 'U+4E2D'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV05: util.DecodeToStringOptions = { stream: true };
      let tdV05 = new util.TextDecoder();
      let rV05a = tdV05.decodeToString(new Uint8Array([0xe4, 0xb8]), optsV05);
      let rV05b = tdV05.decodeToString(new Uint8Array([0xad]), optsV05);
      expect(rV05a).assertEqual('');
      expect(rV05b).assertEqual('中');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_0700
     * @tc.name decodeToStringOptionsPropertiesTwoTest007
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xf0]), { stream: true }) returns '', and new TextDecoder().decodeToString(new Uint8Array([0x9f, 0x98, 0x8d]), { stream: true }) returns 'U+1F60D'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV06: util.DecodeToStringOptions = { stream: true };
      let tdV06 = new util.TextDecoder();
      let rV06a = tdV06.decodeToString(new Uint8Array([0xf0]), optsV06);
      let rV06b = tdV06.decodeToString(new Uint8Array([0x9f, 0x98, 0x8d]), optsV06);
      expect(rV06a).assertEqual('');
      expect(rV06b).assertEqual('😍');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_0800
     * @tc.name decodeToStringOptionsPropertiesTwoTest008
     * @tc.desc Verify TextDecoder.create('utf-8', { fatal: false, ignoreBOM: true }).decodeToString(new Uint8Array([0xef, 0xbb, 0xbf, 0x61, 0x62, 0x63]), { stream: false }) returns 'abc'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV08: util.DecodeToStringOptions = { stream: false };
      let tdV08 = util.TextDecoder.create('utf-8', { fatal: false, ignoreBOM: true });
      let rV08 = tdV08.decodeToString(new Uint8Array([0xef, 0xbb, 0xbf, 0x61, 0x62, 0x63]), optsV08);
      expect(rV08).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_0900
     * @tc.name decodeToStringOptionsPropertiesTwoTest009
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe4, 0xbd]), { stream: true }) returns '', and new TextDecoder().decodeToString(new Uint8Array([0xa0, 0x78]), { stream: true }) returns 'U+4F60x'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV09: util.DecodeToStringOptions = { stream: true };
      let tdV09 = new util.TextDecoder();
      let rV09a = tdV09.decodeToString(new Uint8Array([0xe4, 0xbd]), optsV09);
      let rV09b = tdV09.decodeToString(new Uint8Array([0xa0, 0x78]), optsV09);
      expect(rV09a).assertEqual('');
      expect(rV09b).assertEqual('你x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_1000
     * @tc.name decodeToStringOptionsPropertiesTwoTest010
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe4, 0xb8]), { stream: true }) returns '', and new TextDecoder().decodeToString(new Uint8Array([0x96]), { stream: true }) returns 'U+4E16'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV10: util.DecodeToStringOptions = { stream: true };
      let tdV10 = new util.TextDecoder();
      let rV10a = tdV10.decodeToString(new Uint8Array([0xe4, 0xb8]), optsV10);
      let rV10b = tdV10.decodeToString(new Uint8Array([0x96]), optsV10);
      let rV10c = tdV10.decodeToString(new Uint8Array([0xe7, 0x95]), optsV10);
      let rV10d = tdV10.decodeToString(new Uint8Array([0x8c]), optsV10);
      expect(rV10a).assertEqual('');
      expect(rV10b).assertEqual('世');
      expect(rV10c).assertEqual('');
      expect(rV10d).assertEqual('界');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_1100
     * @tc.name decodeToStringOptionsPropertiesTwoTest011
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0x61, 0x80]), { stream: false }) returns 'aU+FFFD'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV11: util.DecodeToStringOptions = { stream: false };
      let tdV11 = new util.TextDecoder();
      let rV11 = tdV11.decodeToString(new Uint8Array([0x61, 0x80]), optsV11);
      expect(rV11).assertEqual('a\ufffd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_1200
     * @tc.name decodeToStringOptionsPropertiesTwoTest012
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xef, 0xbb, 0xbf, 0x61, 0x62, 0x63]), { stream: true }) returns 'U+FEFFabc'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV12: util.DecodeToStringOptions = { stream: true };
      let tdV12 = new util.TextDecoder();
      let rV12 = tdV12.decodeToString(new Uint8Array([0xef, 0xbb, 0xbf, 0x61, 0x62, 0x63]), optsV12);
      expect(rV12).assertEqual('﻿abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_1300
     * @tc.name decodeToStringOptionsPropertiesTwoTest013
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe4, 0xbd]), { stream: true }) returns '', and new TextDecoder().decodeToString(new Uint8Array([0xa0, 0xc3]), { stream: true }) returns 'U+4F60'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV13: util.DecodeToStringOptions = { stream: true };
      let tdV13 = new util.TextDecoder();
      let rV13a = tdV13.decodeToString(new Uint8Array([0xe4, 0xbd]), optsV13);
      let rV13b = tdV13.decodeToString(new Uint8Array([0xa0, 0xc3]), optsV13);
      let rV13c = tdV13.decodeToString(new Uint8Array([0xa9]), optsV13);
      expect(rV13a).assertEqual('');
      expect(rV13b).assertEqual('你');
      expect(rV13c).assertEqual('é');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_1400
     * @tc.name decodeToStringOptionsPropertiesTwoTest014
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([]), { stream: false }) returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV15: util.DecodeToStringOptions = { stream: false };
      let tdV15 = new util.TextDecoder();
      let rV15 = tdV15.decodeToString(new Uint8Array([]), optsV15);
      expect(rV15).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_1500
     * @tc.name decodeToStringOptionsPropertiesTwoTest015
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0x4f, 0x70, 0x65, 0x6e, 0x48, 0x61, 0x72, 0x6d, 0x6f, 0x6e, 0x79, 0x20, 0xe6]), { stream: true }) returns 'OpenHarmony '
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV16: util.DecodeToStringOptions = { stream: true };
      let tdV16 = new util.TextDecoder();
      let rV16a = tdV16.decodeToString(
        new Uint8Array([0x4f, 0x70, 0x65, 0x6e, 0x48, 0x61, 0x72, 0x6d, 0x6f, 0x6e, 0x79, 0x20, 0xe6]),
        optsV16,
      );
      let rV16b = tdV16.decodeToString(new Uint8Array([0xb5, 0x8b, 0xe8]), optsV16);
      let rV16c = tdV16.decodeToString(new Uint8Array([0xaf, 0x95]), optsV16);
      expect(rV16a).assertEqual('OpenHarmony ');
      expect(rV16b).assertEqual('测');
      expect(rV16c).assertEqual('试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_1600
     * @tc.name decodeToStringOptionsPropertiesTwoTest016
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd]), { stream: false }).length returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsL01: util.DecodeToStringOptions = { stream: false };
      let tdL01 = new util.TextDecoder();
      let rL01 = tdL01.decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd]), optsL01);
      let actual1: int = rL01.length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_1700
     * @tc.name decodeToStringOptionsPropertiesTwoTest017
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe7]), { stream: true }).length returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsL09: util.DecodeToStringOptions = { stream: true };
      let tdL09 = new util.TextDecoder();
      let rL09 = tdL09.decodeToString(new Uint8Array([0xe7]), optsL09);
      let actual1: int = rL09.length;
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_1800
     * @tc.name decodeToStringOptionsPropertiesTwoTest018
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0x61, 0xe4, 0xb8, 0xad, 0x62]), { stream: false }).length returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsL13: util.DecodeToStringOptions = { stream: false };
      let tdL13 = new util.TextDecoder();
      let rL13 = tdL13.decodeToString(new Uint8Array([0x61, 0xe4, 0xb8, 0xad, 0x62]), optsL13);
      let actual1: int = rL13.length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_1900
     * @tc.name decodeToStringOptionsPropertiesTwoTest019
     * @tc.desc Verify new Uint8Array([0xe4, 0xbd, 0xa0, 0x61]).$_get(0) returns 0xe4, and new Uint8Array([0xe4, 0xbd, 0xa0, 0x61]).$_get(1) returns 0xbd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsI01: util.DecodeToStringOptions = { stream: false };
      let tdI01 = new util.TextDecoder();
      let inI01 = new Uint8Array([0xe4, 0xbd, 0xa0, 0x61]);
      tdI01.decodeToString(inI01, optsI01);
      let actual1: number = inI01.$_get(0);
      let expected1: number = 0xe4;
      expect(actual1).assertEqual(expected1);
      let actual2: number = inI01.$_get(1);
      let expected2: number = 0xbd;
      expect(actual2).assertEqual(expected2);
      let actual3: number = inI01.$_get(2);
      let expected3: number = 0xa0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = inI01.$_get(3);
      let expected4: number = 0x61;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_2000
     * @tc.name decodeToStringOptionsPropertiesTwoTest020
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe8, 0xaf, 0x95]), { stream: false }) returns 'U+8BD5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsI09: util.DecodeToStringOptions = { stream: false };
      let tdI09 = new util.TextDecoder();
      tdI09.decodeToString(new Uint8Array([0xe6, 0xac, 0xa2]), optsI09);
      let rI09 = tdI09.decodeToString(new Uint8Array([0xe8, 0xaf, 0x95]), optsI09);
      expect(rI09).assertEqual('试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_2100
     * @tc.name decodeToStringOptionsPropertiesTwoTest021
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0x61, 0x62, 0x63]), { stream: false }).toUpperCase() returns 'ABC'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsC01: util.DecodeToStringOptions = { stream: false };
      let tdC01 = new util.TextDecoder();
      let sC01 = tdC01.decodeToString(new Uint8Array([0x61, 0x62, 0x63]), optsC01);
      let actual1: string = sC01.toUpperCase();
      let expected1: string = 'ABC';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_2200
     * @tc.name decodeToStringOptionsPropertiesTwoTest022
     * @tc.desc Verify charCodeAt(0) of decoded 'U+4F60' returns code unit 20320
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsC02: util.DecodeToStringOptions = { stream: false };
      let tdC02 = new util.TextDecoder();
      let sC02 = tdC02.decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0]), optsC02);
      let actual1: number = sC02.charCodeAt(0);
      let expected1: int = 20320;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_2300
     * @tc.name decodeToStringOptionsPropertiesTwoTest023
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xc3]), { stream: true }) returns '', and new TextDecoder().decodeToString(new Uint8Array([0xa9, 0xe4]), { stream: true }) returns 'U+00E9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsC03: util.DecodeToStringOptions = { stream: true };
      let tdC03 = new util.TextDecoder();
      let c03a = tdC03.decodeToString(new Uint8Array([0xc3]), optsC03);
      let c03b = tdC03.decodeToString(new Uint8Array([0xa9, 0xe4]), optsC03);
      let c03c = tdC03.decodeToString(new Uint8Array([0xbd, 0xa0]), optsC03);
      expect(c03a).assertEqual('');
      expect(c03b).assertEqual('é');
      expect(c03c).assertEqual('你');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_2400
     * @tc.name decodeToStringOptionsPropertiesTwoTest024
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0x61]), { stream: false }) returns 'a', and new TextDecoder().decodeToString(new Uint8Array([0x62]), { stream: false }) returns 'b'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsC04: util.DecodeToStringOptions = { stream: false };
      let tdC04 = new util.TextDecoder();
      let c04a = tdC04.decodeToString(new Uint8Array([0x61]), optsC04);
      let c04b = tdC04.decodeToString(new Uint8Array([0x62]), optsC04);
      let c04c = tdC04.decodeToString(new Uint8Array([0x63]), optsC04);
      expect(c04a).assertEqual('a');
      expect(c04b).assertEqual('b');
      expect(c04c).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_2500
     * @tc.name decodeToStringOptionsPropertiesTwoTest025
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0x61]), { stream: true }) returns 'a', and new TextDecoder().decodeToString(new Uint8Array([0xe4, 0xbd]), { stream: true }) returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsC06: util.DecodeToStringOptions = { stream: true };
      let tdC06 = new util.TextDecoder();
      let c06a = tdC06.decodeToString(new Uint8Array([0x61]), optsC06);
      let c06b = tdC06.decodeToString(new Uint8Array([0xe4, 0xbd]), optsC06);
      let c06c = tdC06.decodeToString(new Uint8Array([0xa0]), optsC06);
      let c06d = tdC06.decodeToString(new Uint8Array([0x62]), optsC06);
      expect(c06a).assertEqual('a');
      expect(c06b).assertEqual('');
      expect(c06c).assertEqual('你');
      expect(c06d).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_2600
     * @tc.name decodeToStringOptionsPropertiesTwoTest026
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0x61, 0x62, 0x63, 0x64]), { stream: false }).indexOf('cd') returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsC08: util.DecodeToStringOptions = { stream: false };
      let tdC08 = new util.TextDecoder();
      let sC08 = tdC08.decodeToString(new Uint8Array([0x61, 0x62, 0x63, 0x64]), optsC08);
      let actual1: int = sC08.indexOf('cd');
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_2700
     * @tc.name decodeToStringOptionsPropertiesTwoTest027
     * @tc.desc Verify decodeToString(viewB01, optsB01) returns 'cd'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsB01: util.DecodeToStringOptions = { stream: false };
      let tdB01 = new util.TextDecoder();
      let srcB01 = new Uint8Array([0x61, 0x62, 0x63, 0x64, 0x65]);
      let viewB01 = srcB01.subarray(2, 4);
      let rB01 = tdB01.decodeToString(viewB01, optsB01);
      expect(rB01).assertEqual('cd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_2800
     * @tc.name decodeToStringOptionsPropertiesTwoTest028
     * @tc.desc Verify decodeToString(viewB03a, optsB03) returns 'abc'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsB03: util.DecodeToStringOptions = { stream: false };
      let tdB03 = new util.TextDecoder();
      let srcB03 = new Uint8Array([0x61, 0x62, 0x63, 0x64, 0x65, 0x66]);
      let viewB03a = srcB03.subarray(0, 3);
      let viewB03b = srcB03.subarray(3, 6);
      let rB03a = tdB03.decodeToString(viewB03a, optsB03);
      let rB03b = tdB03.decodeToString(viewB03b, optsB03);
      expect(rB03a).assertEqual('abc');
      expect(rB03b).assertEqual('def');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_2900
     * @tc.name decodeToStringOptionsPropertiesTwoTest029
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe4, 0xb8, 0xad]).subarray(0, 2), { stream: false }) returns 'U+FFFD'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsB04: util.DecodeToStringOptions = { stream: false };
      let tdB04 = new util.TextDecoder();
      let srcB04 = new Uint8Array([0xe4, 0xb8, 0xad]);
      let viewB04a = srcB04.subarray(0, 2);
      let viewB04b = srcB04.subarray(2, 3);
      let rB04a = tdB04.decodeToString(viewB04a, optsB04);
      let rB04b = tdB04.decodeToString(viewB04b, optsB04);
      expect(rB04a).assertEqual('\ufffd');
      expect(rB04b).assertEqual('\ufffd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_3000
     * @tc.name decodeToStringOptionsPropertiesTwoTest030
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0]).subarray(0, 1), { stream: true }) returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsB05: util.DecodeToStringOptions = { stream: true };
      let tdB05 = new util.TextDecoder();
      let srcB05 = new Uint8Array([0xe4, 0xbd, 0xa0]);
      let rB05a = tdB05.decodeToString(srcB05.subarray(0, 1), optsB05);
      let rB05b = tdB05.decodeToString(srcB05.subarray(1, 3), optsB05);
      expect(rB05a).assertEqual('');
      expect(rB05b).assertEqual('你');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_3100
     * @tc.name decodeToStringOptionsPropertiesTwoTest031
     * @tc.desc Verify decodeToString(viewB06, optsB06) returns 'bc U+FFFD'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsB06: util.DecodeToStringOptions = { stream: false };
      let tdB06 = new util.TextDecoder();
      let srcB06 = new Uint8Array([0x61, 0x62, 0x63, 0xe4, 0xbd, 0xa0]);
      let viewB06 = srcB06.subarray(1, 4);
      let rB06 = tdB06.decodeToString(viewB06, optsB06);
      expect(rB06).assertEqual('bc\ufffd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_3200
     * @tc.name decodeToStringOptionsPropertiesTwoTest032
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0x78, 0x79, 0x61, 0x62, 0x63, 0x7a]).subarray(2, 5), { stream: false }) returns 'abc'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsB08: util.DecodeToStringOptions = { stream: false };
      let tdB08 = new util.TextDecoder();
      let srcB08 = new Uint8Array([0x78, 0x79, 0x61, 0x62, 0x63, 0x7a]);
      let viewB08 = srcB08.subarray(2, 5);
      let rB08 = tdB08.decodeToString(viewB08, optsB08);
      expect(rB08).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_3300
     * @tc.name decodeToStringOptionsPropertiesTwoTest033
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xc3, 0xa9]).subarray(0, 1), { stream: true }) returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsB12: util.DecodeToStringOptions = { stream: true };
      let tdB12 = new util.TextDecoder();
      let srcB12 = new Uint8Array([0xc3, 0xa9]);
      let rB12a = tdB12.decodeToString(srcB12.subarray(0, 1), optsB12);
      let rB12b = tdB12.decodeToString(srcB12.subarray(1, 2), optsB12);
      expect(rB12a).assertEqual('');
      expect(rB12b).assertEqual('é');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_3400
     * @tc.name decodeToStringOptionsPropertiesTwoTest034
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0]), { stream: true }) returns 'U+4F60'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsS01: util.DecodeToStringOptions = { stream: true };
      let tdS01a = new util.TextDecoder();
      let tdS01b = new util.TextDecoder();
      tdS01a.decodeToString(new Uint8Array([0xe4]), optsS01);
      let rS01b = tdS01b.decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0]), optsS01);
      expect(rS01b).assertEqual('你');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_3500
     * @tc.name decodeToStringOptionsPropertiesTwoTest035
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe6, 0xac]), { stream: true }) + new TextDecoder().decodeToString(new Uint8Array([0xa2]), { stream: true }) returns 'U+6B22'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsS03a: util.DecodeToStringOptions = { stream: true };
      let optsS03b: util.DecodeToStringOptions = { stream: false };
      let tdS03a = new util.TextDecoder();
      let tdS03b = new util.TextDecoder();
      let s03Chunk1 = tdS03a.decodeToString(new Uint8Array([0xe6, 0xac]), optsS03a);
      let s03Chunk2 = tdS03a.decodeToString(new Uint8Array([0xa2]), optsS03a);
      let s03Chunk3 = tdS03b.decodeToString(new Uint8Array([0xe6, 0xac, 0xa2]), optsS03b);
      let actual1: string = s03Chunk1 + s03Chunk2;
      let expected1: string = '欢';
      expect(actual1).assertEqual(expected1);
      let actual2: string = s03Chunk1 + s03Chunk2;
      let expected2: string = s03Chunk3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_3600
     * @tc.name decodeToStringOptionsPropertiesTwoTest036
     * @tc.desc Verify decodeToString(new Uint8Array([0xA9]), optsS05) returns 'U+FFFD'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsS05: util.DecodeToStringOptions = { stream: true };
      let tdS05 = new util.TextDecoder();
      let rS05a = tdS05.decodeToString(new Uint8Array([0xa9]), optsS05);
      let rS05b = tdS05.decodeToString(new Uint8Array([0xc3]), optsS05);
      expect(rS05a).assertEqual('\ufffd');
      expect(rS05b).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_3700
     * @tc.name decodeToStringOptionsPropertiesTwoTest037
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0x61]), { stream: false }) returns 'a', and new TextDecoder().decodeToString(new Uint8Array([0xe4]), { stream: true }) returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsS06a: util.DecodeToStringOptions = { stream: false };
      let optsS06b: util.DecodeToStringOptions = { stream: true };
      let tdS06 = new util.TextDecoder();
      let rS06a = tdS06.decodeToString(new Uint8Array([0x61]), optsS06a);
      let rS06b = tdS06.decodeToString(new Uint8Array([0xe4]), optsS06b);
      let rS06c = tdS06.decodeToString(new Uint8Array([0xbd, 0xa0]), optsS06b);
      expect(rS06a).assertEqual('a');
      expect(rS06b).assertEqual('');
      expect(rS06c).assertEqual('你');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_3800
     * @tc.name decodeToStringOptionsPropertiesTwoTest038
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0x61, 0x62, 0x00, 0x63]), { stream: false }) returns 'ab\u0000c'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsV07: util.DecodeToStringOptions = { stream: false };
      let tdV07 = new util.TextDecoder();
      let rV07 = tdV07.decodeToString(new Uint8Array([0x61, 0x62, 0x00, 0x63]), optsV07);
      expect(rV07).assertEqual('ab\u0000c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_3900
     * @tc.name decodeToStringOptionsPropertiesTwoTest039
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0]), { stream: false }) + '!' returns 'U+4F60!'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsC05: util.DecodeToStringOptions = { stream: false };
      let tdC05 = new util.TextDecoder();
      let sC05 = tdC05.decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0]), optsC05);
      let actual1: string = sC05 + '!';
      let expected1: string = '你!';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_TWO_4000
     * @tc.name decodeToStringOptionsPropertiesTwoTest040
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xa9]), { stream: true }).charCodeAt(0) returns 233
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesTwoTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsC07: util.DecodeToStringOptions = { stream: true };
      let tdC07 = new util.TextDecoder();
      tdC07.decodeToString(new Uint8Array([0xc3]), optsC07);
      let sC07 = tdC07.decodeToString(new Uint8Array([0xa9]), optsC07);
      let actual1: number = sC07.charCodeAt(0);
      let expected1: int = 233;
      expect(actual1).assertEqual(expected1);
    });
  });
}
