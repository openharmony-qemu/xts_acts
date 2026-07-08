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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function LongChainTest(): void {
  describe('LongChainTest', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const CH_0: long = 0;
    const CH_1: long = 1;
    const CH_2: long = 2;
    const CH_3: long = 3;
    const CH_4: long = 4;
    const CH_5: long = 5;
    const CH_6: long = 6;
    const CH_8: long = 8;
    const CH_10: long = 10;
    const CH_16: long = 16;
    const CH_20: long = 20;
    const CH_30: long = 30;
    const CH_35: long = 35;
    const CH_36: long = 36;
    const CH_100: long = 100;
    const CH_123: long = 123;
    const CH_255: long = 255;
    const CH_256: long = 256;
    const CH_NEG_1: long = -1;
    const CH_NEG_3: long = -3;
    const CH_NEG_10: long = -10;
    const CH_NEG_123: long = -123;
    const CH_STR_0: string = "0";
    const CH_STR_10: string = "10";
    const CH_STR_73: string = "73";
    const CH_STR_100: string = "100";
    const CH_STR_255: string = "255";
    const CH_STR_377: string = "377";
    const CH_STR_FF: string = "ff";
    const CH_STR_Z: string = "z";
    const CH_STR_11111111: string = "11111111";
    const CH_2_INT: int = 2;
    const CH_8_INT: int = 8;
    const CH_10_INT: int = 10;
    const CH_16_INT: int = 16;
    const CH_36_INT: int = 36;
    const CH_64: long = 64;
    const CH_1000: long = 1000;
    const CH_1000000: long = 1000000;
    const CH_127: long = 127;
    const CH_32767: long = 32767;
    const CH_2147483647: long = 2147483647;
    const CH_STR_24: string = "24";
    const CH_STR_25: string = "25";
    const CH_STR_40: string = "40";
    const CH_STR_1000: string = "1000";
    const CH_STR_10000: string = "10000";
    const CH_EN_US: string = "en-US";
    const CH_ZH_CN: string = "zh-CN";
    const CH_DE_DE: string = "de-DE";
    const CH_FR_FR: string = "fr-FR";

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0010
     * @tc.name testLongChain001
     * @tc.desc Verify add, sub, mul, div chain: (10+20-5)*2/5 = 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_10).add(new Long(CH_20))
        .sub(new Long(CH_5))
        .mul(new Long(CH_2))
        .div(new Long(CH_5))
        .toLong();
      expect(result).assertEqual(CH_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0020
     * @tc.name testLongChain002
     * @tc.desc Verify toString with radix 16: 255 -> ff
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_255).toString(CH_16_INT);
      expect(result).assertEqual(CH_STR_FF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0030
     * @tc.name testLongChain003
     * @tc.desc Verify add chain with zero: 0+0 = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_0).add(new Long(CH_0)).toLong();
      expect(result).assertEqual(CH_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0040
     * @tc.name testLongChain004
     * @tc.desc Verify sub chain: 1-2 = -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1).sub(new Long(CH_2)).toLong();
      expect(result).assertEqual(CH_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0050
     * @tc.name testLongChain005
     * @tc.desc Verify mul chain: 2*3 = 6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_2).mul(new Long(CH_3)).toLong();
      expect(result).assertEqual(CH_6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0060
     * @tc.name testLongChain006
     * @tc.desc Verify div chain: 8/4 = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_8).div(new Long(CH_4)).toLong();
      expect(result).assertEqual(CH_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0070
     * @tc.name testLongChain007
     * @tc.desc Verify compareTo chain: Long.MAX_VALUE compareTo Long.MAX_VALUE = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MAX_VALUE).compareTo(new Long(Long.MAX_VALUE));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0080
     * @tc.name testLongChain008
     * @tc.desc Verify compareTo chain: Long.MIN_VALUE compareTo Long.MAX_VALUE = -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MIN_VALUE).compareTo(new Long(Long.MAX_VALUE));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0090
     * @tc.name testLongChain009
     * @tc.desc Verify compareTo chain: Long.MAX_VALUE compareTo Long.MIN_VALUE = 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MAX_VALUE).compareTo(new Long(Long.MIN_VALUE));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0100
     * @tc.name testLongChain010
     * @tc.desc Verify isLessThan chain: 0 < 1 = true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_0).isLessThan(new Long(CH_1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0110
     * @tc.name testLongChain011
     * @tc.desc Verify isLessThan chain: 1 < 0 = false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1).isLessThan(new Long(CH_0));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0120
     * @tc.name testLongChain012
     * @tc.desc Verify isLessEqualThan chain: 1 <= 1 = true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1).isLessEqualThan(new Long(CH_1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0130
     * @tc.name testLongChain013
     * @tc.desc Verify isGreaterThan chain: 1 > 0 = true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1).isGreaterThan(new Long(CH_0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0140
     * @tc.name testLongChain014
     * @tc.desc Verify isGreaterEqualThan chain: 0 >= 0 = true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_0).isGreaterEqualThan(new Long(CH_0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0150
     * @tc.name testLongChain015
     * @tc.desc Verify parseInt chain: parseInt("10", 16) = 16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Long.parseInt(CH_STR_10, CH_16_INT);
      expect(result).assertEqual(CH_16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0160
     * @tc.name testLongChain016
     * @tc.desc Verify parseInt chain: parseInt("10", 8) = 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Long.parseInt(CH_STR_10, CH_8_INT);
      expect(result).assertEqual(CH_8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0170
     * @tc.name testLongChain017
     * @tc.desc Verify parseInt chain: parseInt("10", 2) = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Long.parseInt(CH_STR_10, CH_2_INT);
      expect(result).assertEqual(CH_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0180
     * @tc.name testLongChain018
     * @tc.desc Verify parseInt chain: parseInt("Z", 36) = 35
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Long.parseInt("Z", CH_36_INT);
      expect(result).assertEqual(CH_35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0190
     * @tc.name testLongChain019
     * @tc.desc Verify add and compareTo chain: 10+20 compareTo 30 = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_10).add(new Long(CH_20)).compareTo(new Long(CH_30));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0200
     * @tc.name testLongChain020
     * @tc.desc Verify mul and div chain: 10*20/2 = 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_10).mul(new Long(CH_20)).div(new Long(CH_2)).toLong();
      expect(result).assertEqual(CH_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0210
     * @tc.name testLongChain021
     * @tc.desc Verify toFloat and toLocaleString chain returns non-empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_100).toFloat().toLocaleString();
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0220
     * @tc.name testLongChain022
     * @tc.desc Verify equals and isGreaterThan combined chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_0).equals(new Long(CH_0)) && new Long(CH_1).isGreaterThan(new Long(CH_0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0230
     * @tc.name testLongChain023
     * @tc.desc Verify add and toInt chain: 10+20 = 30
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_10).add(new Long(CH_20)).toInt();
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0240
     * @tc.name testLongChain024
     * @tc.desc Verify toString with radix 2: 255 = 11111111
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_255).toString(CH_2_INT);
      expect(result).assertEqual(CH_STR_11111111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0250
     * @tc.name testLongChain025
     * @tc.desc Verify toString with radix 16: 255 = ff
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_255).toString(CH_16_INT);
      expect(result).assertEqual(CH_STR_FF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0260
     * @tc.name testLongChain026
     * @tc.desc Verify toString and length: 123 has 3 digits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_123).toString().length;
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0270
     * @tc.name testLongChain027
     * @tc.desc Verify toString and length: -123 has 4 chars
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_NEG_123).toString().length;
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0280
     * @tc.name testLongChain028
     * @tc.desc Verify toString with radix 2 for zero: "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_0).toString(CH_2_INT);
      expect(result).assertEqual(CH_STR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0290
     * @tc.name testLongChain029
     * @tc.desc Verify add chain: Long.MAX_VALUE + 0 = Long.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MAX_VALUE).add(new Long(CH_0)).toLong();
      expect(result).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0300
     * @tc.name testLongChain030
     * @tc.desc Verify add chain: Long.MIN_VALUE + 0 = Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MIN_VALUE).add(new Long(CH_0)).toLong();
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0310
     * @tc.name testLongChain031
     * @tc.desc Verify sub chain: Long.MAX_VALUE - Long.MAX_VALUE = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MAX_VALUE).sub(new Long(Long.MAX_VALUE)).toLong();
      expect(result).assertEqual(CH_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0320
     * @tc.name testLongChain032
     * @tc.desc Verify sub chain: Long.MIN_VALUE - Long.MIN_VALUE = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MIN_VALUE).sub(new Long(Long.MIN_VALUE)).toLong();
      expect(result).assertEqual(CH_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0330
     * @tc.name testLongChain033
     * @tc.desc Verify mul chain: Long.MAX_VALUE * 0 = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MAX_VALUE).mul(new Long(CH_0)).toLong();
      expect(result).assertEqual(CH_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0340
     * @tc.name testLongChain034
     * @tc.desc Verify mul chain: Long.MIN_VALUE * 0 = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MIN_VALUE).mul(new Long(CH_0)).toLong();
      expect(result).assertEqual(CH_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0350
     * @tc.name testLongChain035
     * @tc.desc Verify div chain: 0 / 1 = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_0).div(new Long(CH_1)).toLong();
      expect(result).assertEqual(CH_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0360
     * @tc.name testLongChain036
     * @tc.desc Verify div chain: 0 / Long.MAX_VALUE = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_0).div(new Long(Long.MAX_VALUE)).toLong();
      expect(result).assertEqual(CH_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0370
     * @tc.name testLongChain037
     * @tc.desc Verify mixed chain: ((1+2)*3-4)/2 = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1).add(new Long(CH_2))
        .mul(new Long(CH_3))
        .sub(new Long(CH_4))
        .div(new Long(CH_2))
        .toLong();
      expect(result).assertEqual(CH_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0380
     * @tc.name testLongChain038
     * @tc.desc Verify sub and add chain: 5-3+1 = 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_5).sub(new Long(CH_3)).add(new Long(CH_1)).toLong();
      expect(result).assertEqual(CH_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0390
     * @tc.name testLongChain039
     * @tc.desc Verify div chain: 10/3 = 3 (integer division)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_10).div(new Long(CH_3)).toLong();
      expect(result).assertEqual(CH_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0400
     * @tc.name testLongChain040
     * @tc.desc Verify div chain with negative numerator: -10/3 = -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_NEG_10).div(new Long(CH_3)).toLong();
      expect(result).assertEqual(CH_NEG_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0410
     * @tc.name testLongChain041
     * @tc.desc Verify div chain with negative denominator: 10/(-3) = -3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_10).div(new Long(CH_NEG_3)).toLong();
      expect(result).assertEqual(CH_NEG_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0420
     * @tc.name testLongChain042
     * @tc.desc Verify div chain with both negative: (-10)/(-3) = 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_NEG_10).div(new Long(CH_NEG_3)).toLong();
      expect(result).assertEqual(CH_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0430
     * @tc.name testLongChain043
     * @tc.desc Verify div chain: Long.MAX_VALUE / 1 = Long.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MAX_VALUE).div(new Long(CH_1)).toLong();
      expect(result).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0440
     * @tc.name testLongChain044
     * @tc.desc Verify div chain: Long.MIN_VALUE / 1 = Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MIN_VALUE).div(new Long(CH_1)).toLong();
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0450
     * @tc.name testLongChain045
     * @tc.desc Verify parseInt chain with max hex value 7fffffffffffffff
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Long.parseInt("7fffffffffffffff", CH_16_INT);
      expect(result).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0460
     * @tc.name testLongChain046
     * @tc.desc Verify toString with radix 2 and length: 10 in binary has 4 chars
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_10).toString(CH_2_INT).length;
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0470
     * @tc.name testLongChain047
     * @tc.desc Verify toString with radix 8: 255 = 377
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_255).toString(CH_8_INT);
      expect(result).assertEqual(CH_STR_377);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0480
     * @tc.name testLongChain048
     * @tc.desc Verify toString with radix 10: 255
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_255).toString(CH_10_INT);
      expect(result).assertEqual(CH_STR_255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0490
     * @tc.name testLongChain049
     * @tc.desc Verify toByte chain: byte(256) = 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.toByte(CH_256)).toLong();
      expect(result).assertEqual(CH_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0500
     * @tc.name testLongChain050
     * @tc.desc Verify overflow chain: MAX+1+1+1 wraps to MIN+2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MAX_VALUE).add(new Long(CH_1)).add(new Long(CH_1)).add(new Long(CH_1)).toLong();
      expect(result).assertEqual(Long.MIN_VALUE + 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0510
     * @tc.name testLongChain051
     * @tc.desc Verify underflow chain: MIN-1-1 wraps to MAX-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MIN_VALUE).sub(new Long(CH_1)).sub(new Long(CH_1)).toLong();
      expect(result).assertEqual(Long.MAX_VALUE - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0520
     * @tc.name testLongChain052
     * @tc.desc Verify equals chain: Long(0).equals(0) returns true for primitive arg
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_0).equals(CH_0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0530
     * @tc.name testLongChain053
     * @tc.desc Verify toDouble chain: Long.MAX_VALUE converted to double is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: double = Long.toDouble(Long.MAX_VALUE);
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0540
     * @tc.name testLongChain054
     * @tc.desc Verify add and toInt chain: 10+20 = 30
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_10).add(new Long(CH_20)).toInt();
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0550
     * @tc.name testLongChain055
     * @tc.desc Verify double equals chain with &&
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1).equals(new Long(CH_1)) && new Long(CH_2).equals(new Long(CH_2));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0560
     * @tc.name testLongChain056
     * @tc.desc Verify isLessThan and isGreaterThan combined chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1).isLessThan(new Long(CH_2)) && new Long(CH_2).isGreaterThan(new Long(CH_1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0570
     * @tc.name testLongChain057
     * @tc.desc Verify toLocaleString with grouping for 1000000 produces a comma-separated string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1000000).toLocaleString("en-US", { useGrouping: true });
      expect(result.indexOf(",") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0580
     * @tc.name testLongChain058
     * @tc.desc Verify toString with radix 36: 255 = 73
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_255).toString(CH_36_INT);
      expect(result).assertEqual(CH_STR_73);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0590
     * @tc.name testLongChain059
     * @tc.desc Verify toString with radix 36: 35 = z
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_35).toString(CH_36_INT);
      expect(result).assertEqual(CH_STR_Z);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0600
     * @tc.name testLongChain060
     * @tc.desc Verify toString with radix 36: 36 = 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_36).toString(CH_36_INT);
      expect(result).assertEqual(CH_STR_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0610
     * @tc.name testLongChain061
     * @tc.desc Verify add chain: (10+5+5+5).toString = "25"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_10).add(new Long(CH_5)).add(new Long(CH_5)).add(new Long(CH_5)).toString();
      expect(result).assertEqual(CH_STR_25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0620
     * @tc.name testLongChain062
     * @tc.desc Verify sub chain: (100-30-20-10).toString = "40"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_100).sub(new Long(CH_30)).sub(new Long(CH_20)).sub(new Long(CH_10)).toString();
      expect(result).assertEqual(CH_STR_40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0630
     * @tc.name testLongChain063
     * @tc.desc Verify mul chain: (2*3*4).toString = "24"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_2).mul(new Long(CH_3)).mul(new Long(CH_4)).toString();
      expect(result).assertEqual(CH_STR_24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0640
     * @tc.name testLongChain064
     * @tc.desc Verify div chain: (100/2/5).toString = "10"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_100).div(new Long(CH_2)).div(new Long(CH_5)).toString();
      expect(result).assertEqual(CH_STR_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0650
     * @tc.name testLongChain065
     * @tc.desc Verify mixed arithmetic chain: (100+50-30)*2/4 = 60
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_100).add(new Long(50))
        .sub(new Long(CH_30))
        .mul(new Long(CH_2))
        .div(new Long(CH_4))
        .toLong();
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0660
     * @tc.name testLongChain066
     * @tc.desc Verify add chain: 1+2+3+4+5 = 15
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1).add(new Long(CH_2))
        .add(new Long(CH_3))
        .add(new Long(CH_4))
        .add(new Long(CH_5))
        .toLong();
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0670
     * @tc.name testLongChain067
     * @tc.desc Verify div chain: 1000/10/10 = 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1000).div(new Long(CH_10)).div(new Long(CH_10)).toLong();
      expect(result).assertEqual(CH_10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0680
     * @tc.name testLongChain068
     * @tc.desc Verify toString with radix 16: (255+1).toString(16) = "100"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_255).add(new Long(CH_1)).toString(CH_16_INT);
      expect(result).assertEqual(CH_STR_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0690
     * @tc.name testLongChain069
     * @tc.desc Verify parseInt: parseInt("ff", 16).toString = "255"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: long = Long.parseInt(CH_STR_FF, CH_16_INT);
      expect(r.toString()).assertEqual(CH_STR_255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0700
     * @tc.name testLongChain070
     * @tc.desc Verify toByte overflow: 127+1 toByte = -128
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(CH_127);
      const r: byte = v.add(new Long(CH_1)).toByte();
      expect(r).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0710
     * @tc.name testLongChain071
     * @tc.desc Verify toShort overflow: 32767+1 toShort = -32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(CH_32767);
      const r: short = v.add(new Long(CH_1)).toShort();
      expect(r).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0720
     * @tc.name testLongChain072
     * @tc.desc Verify toInt overflow: 2147483647+1 toInt = -2147483648
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Long(CH_2147483647);
      const result: int = v.add(new Long(CH_1)).toInt();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0730
     * @tc.name testLongChain073
     * @tc.desc Verify overflow toString: (MAX+1).toString(16) returns a non-empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MAX_VALUE).add(new Long(CH_1)).toString(CH_16_INT);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0740
     * @tc.name testLongChain074
     * @tc.desc Verify double overflow: MAX+2+1 = MIN+2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MAX_VALUE).add(new Long(CH_2)).add(new Long(CH_1)).toLong();
      expect(result).assertEqual(Long.MIN_VALUE + 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0750
     * @tc.name testLongChain075
     * @tc.desc Verify double underflow: MIN-2-1 = MAX-2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MIN_VALUE).sub(new Long(CH_2)).sub(new Long(CH_1)).toLong();
      expect(result).assertEqual(Long.MAX_VALUE - 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0760
     * @tc.name testLongChain076
     * @tc.desc Verify overflow comparison: 1+MAX < 0 = true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1).add(new Long(Long.MAX_VALUE)).isLessThan(new Long(CH_0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0770
     * @tc.name testLongChain077
     * @tc.desc Verify underflow comparison: MIN-1 > 0 = true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MIN_VALUE).sub(new Long(CH_1)).isGreaterThan(new Long(CH_0));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0780
     * @tc.name testLongChain078
     * @tc.desc Verify parseInt roundtrip: parseInt(MAX.toString(), 10) === MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Long.parseInt(Long.MAX_VALUE.toString(), CH_10_INT) === Long.MAX_VALUE;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0790
     * @tc.name testLongChain079
     * @tc.desc Verify parseInt roundtrip: parseInt(MIN.toString(), 10) === MIN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Long.parseInt(Long.MIN_VALUE.toString(), CH_10_INT) === Long.MIN_VALUE;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0800
     * @tc.name testLongChain080
     * @tc.desc Verify zero conversions: toByte===0 && toShort===0 && toInt===0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_0).toByte() === 0 && new Long(CH_0).toShort() === 0 && new Long(CH_0).toInt() === 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0810
     * @tc.name testLongChain081
     * @tc.desc Verify one conversions: toByte===1 && toShort===1 && toInt===1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1).toByte() === 1 && new Long(CH_1).toShort() === 1 && new Long(CH_1).toInt() === 1;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0820
     * @tc.name testLongChain082
     * @tc.desc Verify negative one conversions: toByte===-1 && toShort===-1 && toInt===-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result =
        new Long(CH_NEG_1).toByte() === -1 && new Long(CH_NEG_1).toShort() === -1 && new Long(CH_NEG_1).toInt() === -1;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0830
     * @tc.name testLongChain083
     * @tc.desc Verify toDouble toLocaleString: Long.toDouble(MAX).toLocaleString("en-US") non-empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = Long.toDouble(Long.MAX_VALUE).toLocaleString(CH_EN_US);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0840
     * @tc.name testLongChain084
     * @tc.desc Verify toFloat is finite: Long.toFloat(MAX) is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: float = Long.toFloat(Long.MAX_VALUE);
      expect(isFinite(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0850
     * @tc.name testLongChain085
     * @tc.desc Verify mul chain toString: 10*10*10 = "1000"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_10).mul(new Long(CH_10)).mul(new Long(CH_10)).toString();
      expect(result).assertEqual(CH_STR_1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0860
     * @tc.name testLongChain086
     * @tc.desc Verify div chain: 1000000/1000/10 = 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1000000).div(new Long(CH_1000)).div(new Long(CH_10)).toLong();
      expect(result).assertEqual(CH_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0870
     * @tc.name testLongChain087
     * @tc.desc Verify toString with radix 2: 16.toString(2) = "10000"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_16).toString(CH_2_INT);
      expect(result).assertEqual(CH_STR_10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0880
     * @tc.name testLongChain088
     * @tc.desc Verify toString with radix 2: 8.toString(2) = "1000"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_8).toString(CH_2_INT);
      expect(result).assertEqual(CH_STR_1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0890
     * @tc.name testLongChain089
     * @tc.desc Verify toString with radix 8: 64.toString(8) = "100"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_64).toString(CH_8_INT);
      expect(result).assertEqual(CH_STR_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0900
     * @tc.name testLongChain090
     * @tc.desc Verify toString with radix 16: 256.toString(16) = "100"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_256).toString(CH_16_INT);
      expect(result).assertEqual(CH_STR_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0910
     * @tc.name testLongChain091
     * @tc.desc Verify toLocaleString with no grouping: 100 = "100"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_100).toLocaleString(CH_EN_US, { useGrouping: false });
      expect(result).assertEqual(CH_STR_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0920
     * @tc.name testLongChain092
     * @tc.desc Verify toLocaleString de-DE: 1000000 non-empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1000000).toLocaleString(CH_DE_DE);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0930
     * @tc.name testLongChain093
     * @tc.desc Verify toLocaleString fr-FR: 1000000 non-empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1000000).toLocaleString(CH_FR_FR);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0940
     * @tc.name testLongChain094
     * @tc.desc Verify toLocaleString zh-CN: 0 non-empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_0).toLocaleString(CH_ZH_CN);
      expect(result.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0950
     * @tc.name testLongChain095
     * @tc.desc Verify toString(2) length: MAX.toString(2).length = 63
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MAX_VALUE).toString(CH_2_INT).length;
      expect(result).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0960
     * @tc.name testLongChain096
     * @tc.desc Verify toLong: 1.toLong() === 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_1).toLong() === 1;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0970
     * @tc.name testLongChain097
     * @tc.desc Verify toLong: 0.toLong() === 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_0).toLong() === 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0980
     * @tc.name testLongChain098
     * @tc.desc Verify toLong: -1.toLong() === -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(CH_NEG_1).toLong() === -1;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CHAIN_0990
     * @tc.name testLongChain99
     * @tc.desc Verify equals: MAX.equals(MAX) && MIN.equals(MIN) = true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongChain99', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Long(Long.MAX_VALUE).equals(new Long(Long.MAX_VALUE)) &&
      new Long(Long.MIN_VALUE).equals(new Long(Long.MIN_VALUE));
      expect(result).assertTrue();
    });
  });
}
