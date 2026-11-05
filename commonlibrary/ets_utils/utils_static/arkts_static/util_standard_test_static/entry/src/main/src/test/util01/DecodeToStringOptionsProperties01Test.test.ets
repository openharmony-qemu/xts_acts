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

export default function decodeToStringOptionsProperties01Test(): void {
  describe('decodeToStringOptionsProperties01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_0100
     * @tc.name decodeToStringOptionsPropertiesOneTest001
     * @tc.desc Verify new TextDecoder().decodeToString(new Uint8Array([0xc3])) returns 'U+FFFD'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let td1 = new util.TextDecoder();
      let r1 = td1.decodeToString(new Uint8Array([0xc3]));
      expect(r1).assertEqual('\ufffd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_0200
     * @tc.name decodeToStringOptionsPropertiesOneTest002
     * @tc.desc Verify decodeToString(new Uint8Array([0xC3, 0xA9])) returns 'U+00E9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let td12 = new util.TextDecoder();
      let r12 = td12.decodeToString(new Uint8Array([0xc3, 0xa9]));
      expect(r12).assertEqual('é');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_0300
     * @tc.name decodeToStringOptionsPropertiesOneTest003
     * @tc.desc Verify decodeToString(new Uint8Array([0xC3]), { stream: true }) returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT: util.DecodeToStringOptions = { stream: true };
      let td4 = new util.TextDecoder();
      let r4 = td4.decodeToString(new Uint8Array([0xc3]), optsT);
      expect(r4).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_0400
     * @tc.name decodeToStringOptionsPropertiesOneTest004
     * @tc.desc Verify decodeToString(new Uint8Array([0xC3]), { stream: true }) returns '', then new Uint8Array([0xA9]) returns 'U+00E9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsShare: util.DecodeToStringOptions = { stream: true };
      let td6 = new util.TextDecoder();
      let r6a = td6.decodeToString(new Uint8Array([0xc3]), optsShare);
      let r6b = td6.decodeToString(new Uint8Array([0xa9]), optsShare);
      expect(r6a).assertEqual('');
      expect(r6b).assertEqual('é');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_0500
     * @tc.name decodeToStringOptionsPropertiesOneTest005
     * @tc.desc Verify decodeToString(new Uint8Array([0xE4]), { stream: true }) returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT10: util.DecodeToStringOptions = { stream: true };
      let td10 = new util.TextDecoder();
      let r10 = td10.decodeToString(new Uint8Array([0xe4]), optsT10);
      expect(r10).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_0600
     * @tc.name decodeToStringOptionsPropertiesOneTest006
     * @tc.desc Verify decodeToString(new Uint8Array([0xE4]), { stream: true }) returns '', then new Uint8Array([0xBD, 0xA0]) returns 'U+4F60'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT19: util.DecodeToStringOptions = { stream: true };
      let td19 = new util.TextDecoder();
      let r19a = td19.decodeToString(new Uint8Array([0xe4]), optsT19);
      let r19b = td19.decodeToString(new Uint8Array([0xbd, 0xa0]), optsT19);
      expect(r19a).assertEqual('');
      expect(r19b).assertEqual('你');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_0700
     * @tc.name decodeToStringOptionsPropertiesOneTest007
     * @tc.desc Verify decodeToString(new Uint8Array([0xE4, 0xBD]), { stream: true }) returns '', then new Uint8Array([0xA0]) returns 'U+4F60'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT20: util.DecodeToStringOptions = { stream: true };
      let td20 = new util.TextDecoder();
      let r20a = td20.decodeToString(new Uint8Array([0xe4, 0xbd]), optsT20);
      let r20b = td20.decodeToString(new Uint8Array([0xa0]), optsT20);
      expect(r20a).assertEqual('');
      expect(r20b).assertEqual('你');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_0800
     * @tc.name decodeToStringOptionsPropertiesOneTest008
     * @tc.desc Verify decodeToString(new Uint8Array([0xF0]), { stream: true }) returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT11: util.DecodeToStringOptions = { stream: true };
      let td11 = new util.TextDecoder();
      let r11 = td11.decodeToString(new Uint8Array([0xf0]), optsT11);
      expect(r11).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_0900
     * @tc.name decodeToStringOptionsPropertiesOneTest009
     * @tc.desc Verify decodeToString(new Uint8Array([0xF0]), { stream: true }) returns '', then new Uint8Array([0x9F, 0x98, 0x80]) returns 'U+1F600'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT21: util.DecodeToStringOptions = { stream: true };
      let td21 = new util.TextDecoder();
      let r21a = td21.decodeToString(new Uint8Array([0xf0]), optsT21);
      let r21b = td21.decodeToString(new Uint8Array([0x9f, 0x98, 0x80]), optsT21);
      expect(r21a).assertEqual('');
      expect(r21b).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_1000
     * @tc.name decodeToStringOptionsPropertiesOneTest010
     * @tc.desc Verify decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]), { stream: true }) returns 'U+1F600'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT14: util.DecodeToStringOptions = { stream: true };
      let td14 = new util.TextDecoder();
      let r14 = td14.decodeToString(new Uint8Array([0xf0, 0x9f, 0x98, 0x80]), optsT14);
      expect(r14).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_1100
     * @tc.name decodeToStringOptionsPropertiesOneTest011
     * @tc.desc Verify decodeToString(new Uint8Array([0x61]), { stream: true }) returns 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT15: util.DecodeToStringOptions = { stream: true };
      let td15 = new util.TextDecoder();
      let r15 = td15.decodeToString(new Uint8Array([0x61]), optsT15);
      expect(r15).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_1200
     * @tc.name decodeToStringOptionsPropertiesOneTest012
     * @tc.desc Verify decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0x61]), { stream: true }) returns 'U+4F60a', then { stream: false } returns 'U+4F60a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT16: util.DecodeToStringOptions = { stream: true };
      let optsF16: util.DecodeToStringOptions = { stream: false };
      let td16 = new util.TextDecoder();
      let r16a = td16.decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0, 0x61]), optsT16);
      let r16b = td16.decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0, 0x61]), optsF16);
      expect(r16a).assertEqual('你a');
      expect(r16b).assertEqual('你a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_1300
     * @tc.name decodeToStringOptionsPropertiesOneTest013
     * @tc.desc Verify decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]), optsT40) returns 'U+4F60'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT40: util.DecodeToStringOptions = { stream: true };
      let td40 = new util.TextDecoder();
      let r40a = td40.decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0]), optsT40);
      let r40b = td40.decodeToString(new Uint8Array([0xe5, 0xa5, 0xbd]), optsT40);
      expect(r40a).assertEqual('你');
      expect(r40b).assertEqual('好');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_1400
     * @tc.name decodeToStringOptionsPropertiesOneTest014
     * @tc.desc Verify decodeToString(new Uint8Array([0xE4, 0xBD]), optsT30) returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT30: util.DecodeToStringOptions = { stream: true };
      let td30 = new util.TextDecoder();
      let r30a = td30.decodeToString(new Uint8Array([0xe4, 0xbd]), optsT30);
      let r30b = td30.decodeToString(new Uint8Array([0xa0]), optsT30);
      let r30c = td30.decodeToString(new Uint8Array([0xc3]), optsT30);
      let r30d = td30.decodeToString(new Uint8Array([0xa9]), optsT30);
      expect(r30a).assertEqual('');
      expect(r30b).assertEqual('你');
      expect(r30c).assertEqual('');
      expect(r30d).assertEqual('é');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_1500
     * @tc.name decodeToStringOptionsPropertiesOneTest015
     * @tc.desc Verify decodeToString(new Uint8Array([0xE4]), { stream: true }) fed one byte per call over 15 calls returns 'U+754C'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT31: util.DecodeToStringOptions = { stream: true };
      let td31 = new util.TextDecoder();
      let r31 = '';
      r31 = td31.decodeToString(new Uint8Array([0xe4]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0xbd]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0xa0]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0xe5]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0xa5]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0xbd]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0xef]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0xbc]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0x8c]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0xe4]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0xb8]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0x96]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0xe7]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0x95]), optsT31);
      r31 = td31.decodeToString(new Uint8Array([0x8c]), optsT31);
      expect(r31).assertEqual('界');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_1600
     * @tc.name decodeToStringOptionsPropertiesOneTest016
     * @tc.desc Verify decodeToString(new Uint8Array([0x61]), { stream: true }) returns 'a', then new Uint8Array([]) returns '', then new Uint8Array([0x62]) returns 'b'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsE6: util.DecodeToStringOptions = { stream: true };
      let tdE6 = new util.TextDecoder();
      let rE6a = tdE6.decodeToString(new Uint8Array([0x61]), optsE6);
      let rE6b = tdE6.decodeToString(new Uint8Array([]), optsE6);
      let rE6c = tdE6.decodeToString(new Uint8Array([0x62]), optsE6);
      expect(rE6a).assertEqual('a');
      expect(rE6b).assertEqual('');
      expect(rE6c).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_1700
     * @tc.name decodeToStringOptionsPropertiesOneTest017
     * @tc.desc Verify a second decoder decodeToString(new Uint8Array([0x61]), { stream: true }) returns 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsE7: util.DecodeToStringOptions = { stream: true };
      let tdE7a = new util.TextDecoder();
      let tdE7b = new util.TextDecoder();
      tdE7a.decodeToString(new Uint8Array([0xc3]), optsE7);
      let rE7b = tdE7b.decodeToString(new Uint8Array([0x61]), optsE7);
      expect(rE7b).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_1800
     * @tc.name decodeToStringOptionsPropertiesOneTest018
     * @tc.desc Verify decodeToString(new Uint8Array([0x80]), { stream: true }) returns 'U+FFFD'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT38: util.DecodeToStringOptions = { stream: true };
      let td38 = new util.TextDecoder();
      let r38 = td38.decodeToString(new Uint8Array([0x80]), optsT38);
      expect(r38).assertEqual('\ufffd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_1900
     * @tc.name decodeToStringOptionsPropertiesOneTest019
     * @tc.desc Verify decodeToString(new Uint8Array([0x61, 0xC3]), optsF27) returns 'a U+FFFD'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsF27: util.DecodeToStringOptions = { stream: false };
      let td27 = new util.TextDecoder();
      let r27a = td27.decodeToString(new Uint8Array([0x61, 0xc3]), optsF27);
      let r27b = td27.decodeToString(new Uint8Array([0xa9]), optsF27);
      expect(r27a).assertEqual('a\ufffd');
      expect(r27b).assertEqual('\ufffd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_2000
     * @tc.name decodeToStringOptionsPropertiesOneTest020
     * @tc.desc Verify utf-16le decodeToString(new Uint8Array([0x61]), { stream: true }) returns '', then new Uint8Array([0x00]) returns 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT41: util.DecodeToStringOptions = { stream: true };
      let td41 = util.TextDecoder.create('utf-16le');
      let r41a = td41.decodeToString(new Uint8Array([0x61]), optsT41);
      let r41b = td41.decodeToString(new Uint8Array([0x00]), optsT41);
      expect(r41a).assertEqual('');
      expect(r41b).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_2100
     * @tc.name decodeToStringOptionsPropertiesOneTest021
     * @tc.desc Verify utf-16be decodeToString(new Uint8Array([0x00]), { stream: true }) returns '', then new Uint8Array([0x61]) returns 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT43: util.DecodeToStringOptions = { stream: true };
      let td43 = util.TextDecoder.create('utf-16be');
      let r43a = td43.decodeToString(new Uint8Array([0x00]), optsT43);
      let r43b = td43.decodeToString(new Uint8Array([0x61]), optsT43);
      expect(r43a).assertEqual('');
      expect(r43b).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_2200
     * @tc.name decodeToStringOptionsPropertiesOneTest022
     * @tc.desc Verify gbk decodeToString(new Uint8Array([0xD6]), { stream: true }) returns '', then new Uint8Array([0xD0]) returns 'U+4E2D'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT45: util.DecodeToStringOptions = { stream: true };
      let td45 = util.TextDecoder.create('gbk');
      let r45a = td45.decodeToString(new Uint8Array([0xd6]), optsT45);
      let r45b = td45.decodeToString(new Uint8Array([0xd0]), optsT45);
      expect(r45a).assertEqual('');
      expect(r45b).assertEqual('中');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_2300
     * @tc.name decodeToStringOptionsPropertiesOneTest023
     * @tc.desc Verify gb18030 decodeToString(new Uint8Array([0xD6]), { stream: true }) returns '', then new Uint8Array([0xD0]) returns 'U+4E2D'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT46: util.DecodeToStringOptions = { stream: true };
      let td46 = util.TextDecoder.create('gb18030');
      let r46a = td46.decodeToString(new Uint8Array([0xd6]), optsT46);
      let r46b = td46.decodeToString(new Uint8Array([0xd0]), optsT46);
      expect(r46a).assertEqual('');
      expect(r46b).assertEqual('中');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_2400
     * @tc.name decodeToStringOptionsPropertiesOneTest024
     * @tc.desc Verify big5 decodeToString(new Uint8Array([0xA4]), { stream: true }) returns '', then new Uint8Array([0xA4]) returns 'U+4E2D'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT47: util.DecodeToStringOptions = { stream: true };
      let td47 = util.TextDecoder.create('big5');
      let r47a = td47.decodeToString(new Uint8Array([0xa4]), optsT47);
      let r47b = td47.decodeToString(new Uint8Array([0xa4]), optsT47);
      expect(r47a).assertEqual('');
      expect(r47b).assertEqual('中');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_2500
     * @tc.name decodeToStringOptionsPropertiesOneTest025
     * @tc.desc Verify euc-jp decodeToString(new Uint8Array([0xA4]), { stream: true }) returns '', then new Uint8Array([0xA2]) returns 'U+3042'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT48: util.DecodeToStringOptions = { stream: true };
      let td48 = util.TextDecoder.create('euc-jp');
      let r48a = td48.decodeToString(new Uint8Array([0xa4]), optsT48);
      let r48b = td48.decodeToString(new Uint8Array([0xa2]), optsT48);
      expect(r48a).assertEqual('');
      expect(r48b).assertEqual('あ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_2600
     * @tc.name decodeToStringOptionsPropertiesOneTest026
     * @tc.desc Verify shift_jis decodeToString(new Uint8Array([0x82]), { stream: true }) returns '', then new Uint8Array([0xA0]) returns 'U+3042'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT49: util.DecodeToStringOptions = { stream: true };
      let td49 = util.TextDecoder.create('shift_jis');
      let r49a = td49.decodeToString(new Uint8Array([0x82]), optsT49);
      let r49b = td49.decodeToString(new Uint8Array([0xa0]), optsT49);
      expect(r49a).assertEqual('');
      expect(r49b).assertEqual('あ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_2700
     * @tc.name decodeToStringOptionsPropertiesOneTest027
     * @tc.desc Verify iso-8859-1 decodeToString(new Uint8Array([0xE9]), { stream: true }) returns 'U+00E9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT50: util.DecodeToStringOptions = { stream: true };
      let td50 = util.TextDecoder.create('iso-8859-1');
      let r50 = td50.decodeToString(new Uint8Array([0xe9]), optsT50);
      expect(r50).assertEqual('é');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_2800
     * @tc.name decodeToStringOptionsPropertiesOneTest028
     * @tc.desc Verify windows-1251 decodeToString(new Uint8Array([0xC0]), { stream: true }) returns 'U+0410'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsT51: util.DecodeToStringOptions = { stream: true };
      let td51 = util.TextDecoder.create('windows-1251');
      let r51 = td51.decodeToString(new Uint8Array([0xc0]), optsT51);
      expect(r51).assertEqual('А');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_2900
     * @tc.name decodeToStringOptionsPropertiesOneTest029
     * @tc.desc Verify gbk decodeToString(new Uint8Array([0xD6]), { stream: false }) returns 'U+FFFD'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsF52: util.DecodeToStringOptions = { stream: false };
      let td52 = util.TextDecoder.create('gbk');
      let r52 = td52.decodeToString(new Uint8Array([0xd6]), optsF52);
      expect(r52).assertEqual('\ufffd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_3000
     * @tc.name decodeToStringOptionsPropertiesOneTest030
     * @tc.desc Verify fatal decodeToString(new Uint8Array([0xC3]), { stream: true }) returns '', then new Uint8Array([0xA9]) returns 'U+00E9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsE1: util.DecodeToStringOptions = { stream: true };
      let tdE1 = util.TextDecoder.create('utf-8', { fatal: true });
      let rE1a = tdE1.decodeToString(new Uint8Array([0xc3]), optsE1);
      let rE1b = tdE1.decodeToString(new Uint8Array([0xa9]), optsE1);
      expect(rE1a).assertEqual('');
      expect(rE1b).assertEqual('é');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_3100
     * @tc.name decodeToStringOptionsPropertiesOneTest031
     * @tc.desc Verify fatal decodeToString(new Uint8Array([0xC3]), { stream: false }) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsE2: util.DecodeToStringOptions = { stream: false };
      let tdE2 = util.TextDecoder.create('utf-8', { fatal: true });
      try {
        tdE2.decodeToString(new Uint8Array([0xc3]), optsE2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_3200
     * @tc.name decodeToStringOptionsPropertiesOneTest032
     * @tc.desc Verify fatal decodeToString(new Uint8Array([0xC3]) then new Uint8Array([0xFF]), { stream: true }) throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsE3: util.DecodeToStringOptions = { stream: true };
      let tdE3 = util.TextDecoder.create('utf-8', { fatal: true });
      try {
        tdE3.decodeToString(new Uint8Array([0xc3]), optsE3);
        tdE3.decodeToString(new Uint8Array([0xff]), optsE3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_3300
     * @tc.name decodeToStringOptionsPropertiesOneTest033
     * @tc.desc Verify decodeToString(new Uint8Array([0xFF])) returns 'U+FFFD'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tdE5 = new util.TextDecoder();
      let rE5 = tdE5.decodeToString(new Uint8Array([0xff]));
      expect(rE5).assertEqual('\ufffd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_3400
     * @tc.name decodeToStringOptionsPropertiesOneTest034
     * @tc.desc Verify decodeToString(new Uint8Array([0x00]), { stream: true }) returns 'U+0000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsE8: util.DecodeToStringOptions = { stream: true };
      let tdE8 = new util.TextDecoder();
      let rE8 = tdE8.decodeToString(new Uint8Array([0x00]), optsE8);
      expect(rE8).assertEqual('\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODETOSTRINGOPTIONS_PROPERTIES_ONE_3500
     * @tc.name decodeToStringOptionsPropertiesOneTest035
     * @tc.desc Verify decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0])) returns 'U+4F60'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('decodeToStringOptionsPropertiesOneTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let optsR5: util.DecodeToStringOptions = { stream: true };
      let tdR5 = new util.TextDecoder();
      let oneShot = tdR5.decodeToString(new Uint8Array([0xe4, 0xbd, 0xa0]));
      let tdR5b = new util.TextDecoder();
      let rR5a = tdR5b.decodeToString(new Uint8Array([0xe4]), optsR5);
      let rR5b = tdR5b.decodeToString(new Uint8Array([0xbd, 0xa0]), optsR5);
      expect(oneShot).assertEqual('你');
      let actual1: string = rR5a + rR5b;
      let expected1: string = oneShot;
      expect(actual1).assertEqual(expected1);
    });
  });
}
