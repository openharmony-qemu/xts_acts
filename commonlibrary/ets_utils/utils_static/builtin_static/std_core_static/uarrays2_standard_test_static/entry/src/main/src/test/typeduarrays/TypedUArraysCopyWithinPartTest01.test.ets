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
import Utils from '../Util.test';

export default function typedUArraysCopyWithinPartTest01(): void {
  describe('TypedUArraysCopyWithinPartTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_0100
     * @tc.name testTypedUArraysCopyWithinPart101_001
     * @tc.desc Verify copyWithin 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const ret = arr.copyWithin(0, 0);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_5000
     * @tc.name testTypedUArraysCopyWithinPart101_050
     * @tc.desc Verify target=0b10 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(2, 3);
      const val84 = result[2];
      expect(val84).assertEqual(4n);
      const val85 = result[3];
      expect(val85).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_5100
     * @tc.name testTypedUArraysCopyWithinPart101_051
     * @tc.desc Verify target=-length/2 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let result = arr.copyWithin(-5, 0);
      const val86 = result[5];
      expect(val86).assertEqual(1);
      const val87 = result[6];
      expect(val87).assertEqual(2);
      const val88 = result[7];
      expect(val88).assertEqual(3);
      const val89 = result[8];
      expect(val89).assertEqual(4);
      const val90 = result[9];
      expect(val90).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_5200
     * @tc.name testTypedUArraysCopyWithinPart101_052
     * @tc.desc Verify target=length/2 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let result = arr.copyWithin(5, 0);
      const val91 = result[5];
      expect(val91).assertEqual(1);
      const val92 = result[6];
      expect(val92).assertEqual(2);
      const val93 = result[7];
      expect(val93).assertEqual(3);
      const val94 = result[8];
      expect(val94).assertEqual(4);
      const val95 = result[9];
      expect(val95).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_5300
     * @tc.name testTypedUArraysCopyWithinPart101_053
     * @tc.desc Verify target=0x3 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0x3, 0);
      const val96 = result[3];
      expect(val96).assertEqual(1);
      const val97 = result[4];
      expect(val97).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_5600
     * @tc.name testTypedUArraysCopyWithinPart101_056
     * @tc.desc Verify target=-3 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-3, 0);
      const val102 = result[2];
      expect(val102).assertEqual(1);
      const val103 = result[3];
      expect(val103).assertEqual(2);
      const val104 = result[4];
      expect(val104).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_5700
     * @tc.name testTypedUArraysCopyWithinPart101_057
     * @tc.desc Verify target=-4 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-4, 0);
      const val105 = result[1];
      expect(val105).assertEqual(1);
      const val106 = result[2];
      expect(val106).assertEqual(2);
      const val107 = result[3];
      expect(val107).assertEqual(3);
      const val108 = result[4];
      expect(val108).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_5800
     * @tc.name testTypedUArraysCopyWithinPart101_058
     * @tc.desc Verify target=-5 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(-5, 0);
      const val109 = result[0];
      expect(val109).assertEqual(1);
      const val110 = result[1];
      expect(val110).assertEqual(2);
      const val111 = result[2];
      expect(val111).assertEqual(3);
      const val112 = result[3];
      expect(val112).assertEqual(4);
      const val113 = result[4];
      expect(val113).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_5900
     * @tc.name testTypedUArraysCopyWithinPart101_059
     * @tc.desc Verify target=-6 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(-6, 0);
      const val114 = result[0];
      expect(val114).assertEqual(1n);
      const val115 = result[1];
      expect(val115).assertEqual(2n);
      const val116 = result[2];
      expect(val116).assertEqual(3n);
      const val117 = result[3];
      expect(val117).assertEqual(4n);
      const val118 = result[4];
      expect(val118).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_6000
     * @tc.name testTypedUArraysCopyWithinPart101_060
     * @tc.desc Verify target=0x4 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0x4, 0);
      const val119 = result[4];
      expect(val119).assertEqual(1);
      const val120 = result[0];
      expect(val120).assertEqual(1);
      const val121 = result[1];
      expect(val121).assertEqual(2);
      const val122 = result[2];
      expect(val122).assertEqual(3);
      const val123 = result[3];
      expect(val123).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_6100
     * @tc.name testTypedUArraysCopyWithinPart101_061
     * @tc.desc Verify target=0o4 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0o4, 0);
      const val124 = result[4];
      expect(val124).assertEqual(1);
      const val125 = result[0];
      expect(val125).assertEqual(1);
      const val126 = result[1];
      expect(val126).assertEqual(2);
      const val127 = result[2];
      expect(val127).assertEqual(3);
      const val128 = result[3];
      expect(val128).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_6200
     * @tc.name testTypedUArraysCopyWithinPart101_062
     * @tc.desc Verify target=0b100 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0b100, 0);
      const val129 = result[4];
      expect(val129).assertEqual(1);
      const val130 = result[0];
      expect(val130).assertEqual(1);
      const val131 = result[1];
      expect(val131).assertEqual(2);
      const val132 = result[2];
      expect(val132).assertEqual(3);
      const val133 = result[3];
      expect(val133).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_6300
     * @tc.name testTypedUArraysCopyWithinPart101_063
     * @tc.desc Verify start=0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(3, 0);
      const val134 = result[3];
      expect(val134).assertEqual(1);
      const val135 = result[4];
      expect(val135).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_6400
     * @tc.name testTypedUArraysCopyWithinPart101_064
     * @tc.desc Verify start=1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 1);
      const val136 = result[0];
      expect(val136).assertEqual(2);
      const val137 = result[1];
      expect(val137).assertEqual(3);
      const val138 = result[2];
      expect(val138).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_6500
     * @tc.name testTypedUArraysCopyWithinPart101_065
     * @tc.desc Verify start=2 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 2);
      const val139 = result[0];
      expect(val139).assertEqual(3);
      const val140 = result[1];
      expect(val140).assertEqual(4);
      const val141 = result[2];
      expect(val141).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_6600
     * @tc.name testTypedUArraysCopyWithinPart101_066
     * @tc.desc Verify start=length-1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 4);
      const val142 = result[0];
      expect(val142).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_6700
     * @tc.name testTypedUArraysCopyWithinPart101_067
     * @tc.desc Verify start=length - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 5);
      const val143 = result[0];
      expect(val143).assertEqual(1);
      const val144 = result[1];
      expect(val144).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_6800
     * @tc.name testTypedUArraysCopyWithinPart101_068
     * @tc.desc Verify start=length+1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 6);
      const val145 = result[0];
      expect(val145).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_6900
     * @tc.name testTypedUArraysCopyWithinPart101_069
     * @tc.desc Verify start=-1 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, -1);
      const val146 = result[0];
      expect(val146).assertEqual(5);
      const val147 = result[1];
      expect(val147).assertEqual(2);
      const val148 = result[2];
      expect(val148).assertEqual(3);
      const val149 = result[3];
      expect(val149).assertEqual(4);
      const val150 = result[4];
      expect(val150).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_7000
     * @tc.name testTypedUArraysCopyWithinPart101_070
     * @tc.desc Verify start=-2 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, -2);
      const val151 = result[0];
      expect(val151).assertEqual(4);
      const val152 = result[1];
      expect(val152).assertEqual(5);
      const val153 = result[2];
      expect(val153).assertEqual(3);
      const val154 = result[3];
      expect(val154).assertEqual(4);
      const val155 = result[4];
      expect(val155).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_7100
     * @tc.name testTypedUArraysCopyWithinPart101_071
     * @tc.desc Verify start=-3 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, -3);
      const val156 = result[0];
      expect(val156).assertEqual(3);
      const val157 = result[1];
      expect(val157).assertEqual(4);
      const val158 = result[2];
      expect(val158).assertEqual(5);
      const val159 = result[3];
      expect(val159).assertEqual(4);
      const val160 = result[4];
      expect(val160).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_7200
     * @tc.name testTypedUArraysCopyWithinPart101_072
     * @tc.desc Verify start=-length - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(2, -arr.length);
      const val161 = result[2];
      expect(val161).assertEqual(1);
      const val162 = result[3];
      expect(val162).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_7300
     * @tc.name testTypedUArraysCopyWithinPart101_073
     * @tc.desc Verify start=-length-1 - 0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, -arr.length - 1);
      const val163 = result[0];
      expect(val163).assertEqual(1);
      const val164 = result[1];
      expect(val164).assertEqual(2);
      const val165 = result[2];
      expect(val165).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_7400

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_7500
     * @tc.name testTypedUArraysCopyWithinPart101_075
     * @tc.desc Verify start= - length Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, -arr.length);
      const val169 = result[0];
      expect(val169).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_8000

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_8100

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_8200

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_8300
     * @tc.name testTypedUArraysCopyWithinPart101_083
     * @tc.desc Verify start=1 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = arr.copyWithin(0, 1);
      const val186 = result[0];
      expect(val186).assertEqual(20);
      const val187 = result[1];
      expect(val187).assertEqual(30);
      const val188 = result[2];
      expect(val188).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_8400
     * @tc.name testTypedUArraysCopyWithinPart101_084
     * @tc.desc Verify start=-1 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([100, 200, 300, 400, 500]);
      let result = arr.copyWithin(0, -1);
      const val189 = result[0];
      expect(val189).assertEqual(500);
      const val190 = result[1];
      expect(val190).assertEqual(200);
      const val191 = result[2];
      expect(val191).assertEqual(300);
      const val192 = result[3];
      expect(val192).assertEqual(400);
      const val193 = result[4];
      expect(val193).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_8500
     * @tc.name testTypedUArraysCopyWithinPart101_085
     * @tc.desc Verify start=-2 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, -2);
      const val194 = result[0];
      expect(val194).assertEqual(4n);
      const val195 = result[1];
      expect(val195).assertEqual(5n);
      const val196 = result[2];
      expect(val196).assertEqual(3n);
      const val197 = result[3];
      expect(val197).assertEqual(4n);
      const val198 = result[4];
      expect(val198).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_8600
     * @tc.name testTypedUArraysCopyWithinPart101_086
     * @tc.desc Verify start=0x7FFF - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val199 = result[0];
      expect(val199).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_8700
     * @tc.name testTypedUArraysCopyWithinPart101_087
     * @tc.desc Verify start=0x8000 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val200 = result[0];
      expect(val200).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_8800
     * @tc.name testTypedUArraysCopyWithinPart101_088
     * @tc.desc Verify start=0xFFFFFFFF - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 0);
      const val201 = result[0];
      expect(val201).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_8900
     * @tc.name testTypedUArraysCopyWithinPart101_089
     * @tc.desc Verify start=0x3 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 3);
      const val202 = result[0];
      expect(val202).assertEqual(4);
      const val203 = result[1];
      expect(val203).assertEqual(5);
      const val204 = result[2];
      expect(val204).assertEqual(3);
      const val205 = result[3];
      expect(val205).assertEqual(4);
      const val206 = result[4];
      expect(val206).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_9000
     * @tc.name testTypedUArraysCopyWithinPart101_090
     * @tc.desc Verify start=0o3 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 3);
      const val207 = result[0];
      expect(val207).assertEqual(4);
      const val208 = result[1];
      expect(val208).assertEqual(5);
      const val209 = result[2];
      expect(val209).assertEqual(3);
      const val210 = result[3];
      expect(val210).assertEqual(4);
      const val211 = result[4];
      expect(val211).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_9100
     * @tc.name testTypedUArraysCopyWithinPart101_091
     * @tc.desc Verify start=0b11 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, 3);
      const val212 = result[0];
      expect(val212).assertEqual(4);
      const val213 = result[1];
      expect(val213).assertEqual(5);
      const val214 = result[2];
      expect(val214).assertEqual(3);
      const val215 = result[3];
      expect(val215).assertEqual(4);
      const val216 = result[4];
      expect(val216).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_9200
     * @tc.name testTypedUArraysCopyWithinPart101_092
     * @tc.desc Verify start=-4 - Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, -4);
      const val217 = result[0];
      expect(val217).assertEqual(2);
      const val218 = result[1];
      expect(val218).assertEqual(3);
      const val219 = result[2];
      expect(val219).assertEqual(4);
      const val220 = result[3];
      expect(val220).assertEqual(5);
      const val221 = result[4];
      expect(val221).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_9300
     * @tc.name testTypedUArraysCopyWithinPart101_093
     * @tc.desc Verify start=-5 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, -5);
      const val222 = result[0];
      expect(val222).assertEqual(1);
      const val223 = result[1];
      expect(val223).assertEqual(2);
      const val224 = result[2];
      expect(val224).assertEqual(3);
      const val225 = result[3];
      expect(val225).assertEqual(4);
      const val226 = result[4];
      expect(val226).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_9400
     * @tc.name testTypedUArraysCopyWithinPart101_094
     * @tc.desc Verify start=-6 - Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([1, 2, 3, 4, 5]);
      let result = arr.copyWithin(0, -6);
      const val227 = result[0];
      expect(val227).assertEqual(1);
      const val228 = result[1];
      expect(val228).assertEqual(2);
      const val229 = result[2];
      expect(val229).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_9500
     * @tc.name testTypedUArraysCopyWithinPart101_095
     * @tc.desc Verify start=-7 - BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.copyWithin(0, -7);
      const val230 = result[0];
      expect(val230).assertEqual(1n);
      const val231 = result[1];
      expect(val231).assertEqual(2n);
      const val232 = result[2];
      expect(val232).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_9600

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_9700

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_9800

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_COPYWITHIN_PART101_9900
     * @tc.name testTypedUArraysCopyWithinPart101_099
     * @tc.desc Verify start=0x1 - Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysCopyWithinPart101_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([10, 20, 30, 40, 50]);
      let result = arr.copyWithin(0, 1);
      const val248 = result[0];
      expect(val248).assertEqual(20);
      const val249 = result[1];
      expect(val249).assertEqual(30);
      const val250 = result[2];
      expect(val250).assertEqual(40);
      const val251 = result[3];
      expect(val251).assertEqual(50);
      const val252 = result[4];
      expect(val252).assertEqual(50);
    });
  });
}
