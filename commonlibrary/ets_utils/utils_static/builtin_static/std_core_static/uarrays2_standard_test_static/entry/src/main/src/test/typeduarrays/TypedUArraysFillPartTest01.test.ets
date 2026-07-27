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

export default function typedUArraysFillPartTest01(): void {
  describe('TypedUArraysFillPartTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_0100
     * @tc.name testTypedUArraysFillPart101_001
     * @tc.desc Verify fill 0 - Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.fill(0);
      const val = arr[0];
      expect(val).assertEqual(0);
      const val1 = arr[4];
      expect(val1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_5000
     * @tc.name testTypedUArraysFillPart101_050
     * @tc.desc Verify value=255 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(255);
      const val103 = arr[0] ;
      expect(val103).assertEqual(255);
      const val104 = arr[1] ;
      expect(val104).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_5100
     * @tc.name testTypedUArraysFillPart101_051
     * @tc.desc Verify value=0xFF Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(0xFF);
      const val105 = arr[0] ;
      expect(val105).assertEqual(255);
      const val106 = arr[1] ;
      expect(val106).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_5200
     * @tc.name testTypedUArraysFillPart101_052
     * @tc.desc Verify value=0x80 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(0x80);
      const val107 = arr[0] ;
      expect(val107).assertEqual(128);
      const val108 = arr[1] ;
      expect(val108).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_5300
     * @tc.name testTypedUArraysFillPart101_053
     * @tc.desc Verify value=-1 Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(-1);
      const val109 = arr[0] ;
      expect(val109).assertEqual(0);
      const val110 = arr[1] ;
      expect(val110).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_5400
     * @tc.name testTypedUArraysFillPart101_054
     * @tc.desc Verify value=256 Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(256);
      const val111 = arr[0] ;
      expect(val111).assertEqual(255);
      const val112 = arr[1] ;
      expect(val112).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_5500
     * @tc.name testTypedUArraysFillPart101_055
     * @tc.desc Verify value=0x100 Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(0x100);
      const val113 = arr[0] ;
      expect(val113).assertEqual(255);
      const val114 = arr[1] ;
      expect(val114).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_5600
     * @tc.name testTypedUArraysFillPart101_056
     * @tc.desc Verify value=0n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.fill(0n);
      const val115 = arr[0];
      expect(val115).assertEqual(0n);
      const val116 = arr[1];
      expect(val116).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_5700
     * @tc.name testTypedUArraysFillPart101_057
     * @tc.desc Verify value=1n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      arr.fill(1n);
      const val117 = arr[0];
      expect(val117).assertEqual(1n);
      const val118 = arr[1];
      expect(val118).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_5800
     * @tc.name testTypedUArraysFillPart101_058
     * @tc.desc Verify value=BigInt('18446744073709551615') BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      arr.fill(BigInt('18446744073709551615'));
      const val119 = arr[0];
      expect(val119).assertEqual(BigInt('18446744073709551615'));
      const val120 = arr[1];
      expect(val120).assertEqual(BigInt('18446744073709551615'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_5900
     * @tc.name testTypedUArraysFillPart101_059
     * @tc.desc Verify value=BigInt('18446744073709551616') BigUint64Array 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n]);
      arr.fill(BigInt('18446744073709551616'));
      const val121 = arr[0];
      expect(val121).assertEqual(0n);
      const val122 = arr[1];
      expect(val122).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_6000
     * @tc.name testTypedUArraysFillPart101_060
     * @tc.desc Verify value=NaN Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.fill(0);
      const val123 = arr[0] ;
      expect(val123).assertEqual(0);
      const val124 = arr[1] ;
      expect(val124).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_6100
     * @tc.name testTypedUArraysFillPart101_061
     * @tc.desc Verify value=Infinity Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.fill(2147483647);
      const val125 = arr[0] ;
      expect(val125).assertEqual(255);
      const val126 = arr[1] ;
      expect(val126).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_6200
     * @tc.name testTypedUArraysFillPart101_062
     * @tc.desc Verify value=-Infinity Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      arr.fill(-2147483647);
      const val127 = arr[0] ;
      expect(val127).assertEqual(1);
      const val128 = arr[1] ;
      expect(val128).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_6300
     * @tc.name testTypedUArraysFillPart101_063
     * @tc.desc Verify value=NaN Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.fill(0);
      const val129 = arr[0] ;
      expect(val129).assertEqual(0);
      const val130 = arr[1] ;
      expect(val130).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_6400
     * @tc.name testTypedUArraysFillPart101_064
     * @tc.desc Verify value=Infinity Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.fill(2147483647);
      const val131 = arr[0] ;
      expect(val131).assertEqual(65535);
      const val132 = arr[1] ;
      expect(val132).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_6500
     * @tc.name testTypedUArraysFillPart101_065
     * @tc.desc Verify value=-Infinity Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0]);
      arr.fill(-2147483647);
      const val133 = arr[0] ;
      expect(val133).assertEqual(1);
      const val134 = arr[1] ;
      expect(val134).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_6600
     * @tc.name testTypedUArraysFillPart101_066
     * @tc.desc Verify value=NaN Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.fill(0);
      const val135 = arr[0] ;
      expect(val135).assertEqual(0);
      const val136 = arr[1] ;
      expect(val136).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_6700
     * @tc.name testTypedUArraysFillPart101_067
     * @tc.desc Verify value=Infinity Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.fill(2147483647);
      const val137 = arr[0] ;
      expect(val137).assertEqual(2147483647);
      const val138 = arr[1] ;
      expect(val138).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_6800
     * @tc.name testTypedUArraysFillPart101_068
     * @tc.desc Verify value=-Infinity Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0]);
      arr.fill(-2147483647);
      const val139 = arr[0] ;
      expect(val139).assertEqual(2147483649);
      const val140 = arr[1] ;
      expect(val140).assertEqual(2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_6900
     * @tc.name testTypedUArraysFillPart101_069
     * @tc.desc Verify value=NaN Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(0);
      const val141 = arr[0] ;
      expect(val141).assertEqual(0);
      const val142 = arr[1] ;
      expect(val142).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_7000
     * @tc.name testTypedUArraysFillPart101_070
     * @tc.desc Verify value=Infinity Uint8ClampedArray 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(2147483647);
      const val143 = arr[0] ;
      expect(val143).assertEqual(255);
      const val144 = arr[1] ;
      expect(val144).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_7100
     * @tc.name testTypedUArraysFillPart101_071
     * @tc.desc Verify value=-Infinity Uint8ClampedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.fill(-2147483647);
      const val145 = arr[0] ;
      expect(val145).assertEqual(0);
      const val146 = arr[1] ;
      expect(val146).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_7200
     * @tc.name testTypedUArraysFillPart101_072
     * @tc.desc Verify start=0 value=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(1, 0);
      const val147 = arr[0] ;
      expect(val147).assertEqual(1);
      const val148 = arr[1] ;
      expect(val148).assertEqual(1);
      const val149 = arr[2] ;
      expect(val149).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_7300
     * @tc.name testTypedUArraysFillPart101_073
     * @tc.desc Verify start=1 value=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(1, 1);
      const val150 = arr[0] ;
      expect(val150).assertEqual(0);
      const val151 = arr[1] ;
      expect(val151).assertEqual(1);
      const val152 = arr[2] ;
      expect(val152).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_7400
     * @tc.name testTypedUArraysFillPart101_074
     * @tc.desc Verify start=2 value=1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0, 0, 0]);
      arr.fill(1, 2);
      const val153 = arr[0] ;
      expect(val153).assertEqual(0);
      const val154 = arr[1] ;
      expect(val154).assertEqual(0);
      const val155 = arr[2] ;
      expect(val155).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_7500
     * @tc.name testTypedUArraysFillPart101_075
     * @tc.desc Verify start=3 value=1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0, 0, 0]);
      arr.fill(1, 3);
      const val156 = arr[0] ;
      expect(val156).assertEqual(0);
      const val157 = arr[2] ;
      expect(val157).assertEqual(0);
      const val158 = arr[3] ;
      expect(val158).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_7600
     * @tc.name testTypedUArraysFillPart101_076
     * @tc.desc Verify start=4 value=1 Uint8ClampedArray length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0, 0]);
      arr.fill(1, 4);
      const val159 = arr[0] ;
      expect(val159).assertEqual(0);
      const val160 = arr[3] ;
      expect(val160).assertEqual(0);
      const val161 = arr[4] ;
      expect(val161).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_7700
     * @tc.name testTypedUArraysFillPart101_077
     * @tc.desc Verify start=4 value=1n BigUint64Array length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n, 0n, 0n]);
      arr.fill(1n, 4);
      const val162 = arr[0];
      expect(val162).assertEqual(0n);
      const val163 = arr[3];
      expect(val163).assertEqual(0n);
      const val164 = arr[4];
      expect(val164).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_7800
     * @tc.name testTypedUArraysFillPart101_078
     * @tc.desc Verify start=length-1 value=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(1, 4);
      const val165 = arr[0] ;
      expect(val165).assertEqual(0);
      const val166 = arr[3] ;
      expect(val166).assertEqual(0);
      const val167 = arr[4] ;
      expect(val167).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_7900
     * @tc.name testTypedUArraysFillPart101_079
     * @tc.desc Verify start=length value=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.fill(0, 5);
      const val168 = arr[0] ;
      expect(val168).assertEqual(1);
      const val169 = arr[4] ;
      expect(val169).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_8000
     * @tc.name testTypedUArraysFillPart101_080
     * @tc.desc Verify start=length+1 value=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.fill(0, 6);
      const val170 = arr[0] ;
      expect(val170).assertEqual(1);
      const val171 = arr[4] ;
      expect(val171).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_8100
     * @tc.name testTypedUArraysFillPart101_081
     * @tc.desc Verify start=-1 value=1 Uint8Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(1, -1);
      const val172 = arr[0] ;
      expect(val172).assertEqual(0);
      const val173 = arr[3] ;
      expect(val173).assertEqual(0);
      const val174 = arr[4] ;
      expect(val174).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_8200
     * @tc.name testTypedUArraysFillPart101_082
     * @tc.desc Verify start=-2 value=1 Uint8Array length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(1, -2);
      const val175 = arr[0] ;
      expect(val175).assertEqual(0);
      const val176 = arr[2] ;
      expect(val176).assertEqual(0);
      const val177 = arr[3] ;
      expect(val177).assertEqual(1);
      const val178 = arr[4] ;
      expect(val178).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_8300
     * @tc.name testTypedUArraysFillPart101_083
     * @tc.desc Verify start=-3 value=1 Uint16Array length-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0, 0, 0]);
      arr.fill(1, -3);
      const val179 = arr[0] ;
      expect(val179).assertEqual(0);
      const val180 = arr[1] ;
      expect(val180).assertEqual(0);
      const val181 = arr[2] ;
      expect(val181).assertEqual(1);
      const val182 = arr[3] ;
      expect(val182).assertEqual(1);
      const val183 = arr[4] ;
      expect(val183).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_8400
     * @tc.name testTypedUArraysFillPart101_084
     * @tc.desc Verify start=-5 value=1 Uint8Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(1, -5);
      const val184 = arr[0] ;
      expect(val184).assertEqual(1);
      const val185 = arr[1] ;
      expect(val185).assertEqual(1);
      const val186 = arr[4] ;
      expect(val186).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_8500
     * @tc.name testTypedUArraysFillPart101_085
     * @tc.desc Verify start=-6 value=1 Uint8Array 0 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(1, -6);
      const val187 = arr[0] ;
      expect(val187).assertEqual(1);
      const val188 = arr[1] ;
      expect(val188).assertEqual(1);
      const val189 = arr[4] ;
      expect(val189).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_8600
     * @tc.name testTypedUArraysFillPart101_086
     * @tc.desc Verify start=Number.MAX_SAFE_INTEGER value=1 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.fill(0, 2147483647);
      const val190 = arr[0] ;
      expect(val190).assertEqual(1);
      const val191 = arr[1] ;
      expect(val191).assertEqual(2);
      const val192 = arr[2] ;
      expect(val192).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_8700
     * @tc.name testTypedUArraysFillPart101_087
     * @tc.desc Verify start=0 value=1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0, 0]);
      arr.fill(1, 0);
      const val193 = arr[0] ;
      expect(val193).assertEqual(1);
      const val194 = arr[1] ;
      expect(val194).assertEqual(1);
      const val195 = arr[2] ;
      expect(val195).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_8800
     * @tc.name testTypedUArraysFillPart101_088
     * @tc.desc Verify start=-1 value=1 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0, 0]);
      arr.fill(1, -1);
      const val196 = arr[0] ;
      expect(val196).assertEqual(0);
      const val197 = arr[3] ;
      expect(val197).assertEqual(0);
      const val198 = arr[4] ;
      expect(val198).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_8900
     * @tc.name testTypedUArraysFillPart101_089
     * @tc.desc Verify start=0 value=1 BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n, 0n, 0n]);
      arr.fill(1n, 0);
      const val199 = arr[0];
      expect(val199).assertEqual(1n);
      const val200 = arr[1];
      expect(val200).assertEqual(1n);
      const val201 = arr[2];
      expect(val201).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_9000
     * @tc.name testTypedUArraysFillPart101_090
     * @tc.desc Verify start=-1 value=1n BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([0n, 0n, 0n, 0n, 0n]);
      arr.fill(1n, -1);
      const val202 = arr[0];
      expect(val202).assertEqual(0n);
      const val203 = arr[3];
      expect(val203).assertEqual(0n);
      const val204 = arr[4];
      expect(val204).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_9100
     * @tc.name testTypedUArraysFillPart101_091
     * @tc.desc Verify end=1 value=1 start=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(1, 0, 1);
      const val205 = arr[0] ;
      expect(val205).assertEqual(1);
      const val206 = arr[1] ;
      expect(val206).assertEqual(0);
      const val207 = arr[2] ;
      expect(val207).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_9200
     * @tc.name testTypedUArraysFillPart101_092
     * @tc.desc Verify end=2 value=1 start=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(1, 0, 2);
      const val208 = arr[0] ;
      expect(val208).assertEqual(1);
      const val209 = arr[1] ;
      expect(val209).assertEqual(1);
      const val210 = arr[2] ;
      expect(val210).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_9300
     * @tc.name testTypedUArraysFillPart101_093
     * @tc.desc Verify end=3 value=1 start=0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([0, 0, 0, 0, 0]);
      arr.fill(1, 0, 3);
      const val211 = arr[0] ;
      expect(val211).assertEqual(1);
      const val212 = arr[1] ;
      expect(val212).assertEqual(1);
      const val213 = arr[2] ;
      expect(val213).assertEqual(1);
      const val214 = arr[3] ;
      expect(val214).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_9400
     * @tc.name testTypedUArraysFillPart101_094
     * @tc.desc Verify end=5 value=1 start=0 Uint32Array length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([0, 0, 0, 0, 0]);
      arr.fill(1, 0, 5);
      const val215 = arr[0] ;
      expect(val215).assertEqual(1);
      const val216 = arr[1] ;
      expect(val216).assertEqual(1);
      const val217 = arr[4] ;
      expect(val217).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_9500
     * @tc.name testTypedUArraysFillPart101_095
     * @tc.desc Verify end=length value=1 start=0 Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0, 0]);
      arr.fill(1, 0, 5);
      const val218 = arr[0] ;
      expect(val218).assertEqual(1);
      const val219 = arr[4] ;
      expect(val219).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_9600
     * @tc.name testTypedUArraysFillPart101_096
     * @tc.desc Verify end=length+1 value=1 start=0 Uint8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(1, 0, 6);
      const val220 = arr[0] ;
      expect(val220).assertEqual(1);
      const val221 = arr[4] ;
      expect(val221).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_9700
     * @tc.name testTypedUArraysFillPart101_097
     * @tc.desc Verify end=0 value=1 start=0 Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.fill(0, 0, 0);
      const val222 = arr[0] ;
      expect(val222).assertEqual(1);
      const val223 = arr[1] ;
      expect(val223).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_9800
     * @tc.name testTypedUArraysFillPart101_098
     * @tc.desc Verify end=-1 value=1 start=0 Uint8Array length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(1, 0, -1);
      const val224 = arr[0] ;
      expect(val224).assertEqual(1);
      const val225 = arr[1] ;
      expect(val225).assertEqual(1);
      const val226 = arr[3] ;
      expect(val226).assertEqual(1);
      const val227 = arr[4] ;
      expect(val227).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_FILL_PART101_9900
     * @tc.name testTypedUArraysFillPart101_099
     * @tc.desc Verify end=-2 value=1 start=0 Uint8Array length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysFillPart101_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0, 0, 0]);
      arr.fill(1, 0, -2);
      const val228 = arr[0] ;
      expect(val228).assertEqual(1);
      const val229 = arr[1] ;
      expect(val229).assertEqual(1);
      const val230 = arr[2] ;
      expect(val230).assertEqual(1);
      const val231 = arr[3] ;
      expect(val231).assertEqual(0);
      const val232 = arr[4] ;
      expect(val232).assertEqual(0);
    });
  });
}
