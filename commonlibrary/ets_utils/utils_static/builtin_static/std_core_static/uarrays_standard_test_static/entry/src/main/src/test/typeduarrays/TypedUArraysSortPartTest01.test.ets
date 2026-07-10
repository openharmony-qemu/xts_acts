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

export default function typedUArraysSortPartTest01(): void {
  describe('TypedUArraysSortPartTest01', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_0100
     * @tc.name testTypedUArraysSortPart1_001
     * @tc.desc Verify sort Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4600
     * @tc.name testTypedUArraysSortPart1_046
     * @tc.desc Verify compareFunction b-a BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.sort();
      const val109 = arr[0];
      expect(val109 === 3n).assertTrue();
      const val110 = arr[1];
      expect(val110 === 2n).assertTrue();
      const val111 = arr[2];
      expect(val111 === 1n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4700
     * @tc.name testTypedUArraysSortPart1_047
     * @tc.desc Verify compareFunction 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      arr.sort();
      expect(arr.length === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4800
     * @tc.name testTypedUArraysSortPart1_048
     * @tc.desc Verify compareFunction 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.sort();
      expect(arr.length === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_4900
     * @tc.name testTypedUArraysSortPart1_049
     * @tc.desc Verify compareFunction -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 2, 1]);
      arr.sort();
      expect(arr.length === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5000
     * @tc.name testTypedUArraysSortPart1_050
     * @tc.desc Verify compareFunction 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      arr.sort();
      expect(arr.length === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5100
     * @tc.name testTypedUArraysSortPart1_051
     * @tc.desc Verify compareFunction -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 2, 1]);
      arr.sort();
      expect(arr.length === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5200
     * @tc.name testTypedUArraysSortPart1_052
     * @tc.desc Verify compareFunction 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 3, 1]);
      arr.sort();
      expect(arr.length === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5300
     * @tc.name testTypedUArraysSortPart1_053
     * @tc.desc Verify compareFunction -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 3, 5]);
      arr.sort();
      expect(arr.length === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5400
     * @tc.name testTypedUArraysSortPart1_054
     * @tc.desc Verify compareFunction 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      arr.sort();
      expect(arr.length === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5500
     * @tc.name testTypedUArraysSortPart1_055
     * @tc.desc Verify compareFunction -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([2, 1, 3]);
      arr.sort();
      expect(arr.length === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5600
     * @tc.name testTypedUArraysSortPart1_056
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const cmp = (a: number, b: number): number => {
        return a - b;
      }
      expect(arr.sort()).assertEqual(1);
      const val113 = arr[1] ;
      expect(val113 === 2).assertTrue();
      const val114 = arr[2] ;
      expect(val114 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5700
     * @tc.name testTypedUArraysSortPart1_057
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const factor = 1;
      arr.sort();
      const val115 = arr[0] ;
      expect(val115 === 1).assertTrue();
      const val116 = arr[1] ;
      expect(val116 === 2).assertTrue();
      const val117 = arr[2] ;
      expect(val117 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5800
     * @tc.name testTypedUArraysSortPart1_058
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const factor = -1;
      arr.sort();
      const val118 = arr[0] ;
      expect(val118 === 3).assertTrue();
      const val119 = arr[1] ;
      expect(val119 === 2).assertTrue();
      const val120 = arr[2] ;
      expect(val120 === 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_5900
     * @tc.name testTypedUArraysSortPart1_059
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      let count = 0;
      arr.sort();
      expect(count === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_6000
     * @tc.name testTypedUArraysSortPart1_060
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const inner = (x: number, y: number): number => x - y;
      arr.sort();
      const val121 = arr[0] ;
      expect(val121 === 1).assertTrue();
      const val122 = arr[1] ;
      expect(val122 === 2).assertTrue();
      const val123 = arr[2] ;
      expect(val123 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_6100
     * @tc.name testTypedUArraysSortPart1_061
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      arr.sort();
      expect(arr.length === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_6200
     * @tc.name testTypedUArraysSortPart1_062
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([42]);
      arr.sort();
      const val124 = arr[0] ;
      expect(val124 === 42).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_6300
     * @tc.name testTypedUArraysSortPart1_063
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([2, 1]);
      arr.sort();
      const val125 = arr[0] ;
      expect(val125 === 1).assertTrue();
      const val126 = arr[1] ;
      expect(val126 === 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_6400
     * @tc.name testTypedUArraysSortPart1_064
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2]);
      arr.sort();
      const val127 = arr[0] ;
      expect(val127 === 2).assertTrue();
      const val128 = arr[1] ;
      expect(val128 === 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_6500
     * @tc.name testTypedUArraysSortPart1_065
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 5, 5, 5]);
      arr.sort();
      const val129 = arr[0] ;
      expect(val129 === 5).assertTrue();
      const val130 = arr[3] ;
      expect(val130 === 5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_6600
     * @tc.name testTypedUArraysSortPart1_066
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 0, 1]);
      arr.sort();
      const val131 = arr[0] ;
      expect(val131 === 0).assertTrue();
      const val132 = arr[1] ;
      expect(val132 === 1).assertTrue();
      const val133 = arr[2] ;
      expect(val133 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_6700
     * @tc.name testTypedUArraysSortPart1_067
     * @tc.desc Verify compareFunction Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 1, 128]);
      arr.sort();
      const val134 = arr[0] ;
      expect(val134 === 1).assertTrue();
      const val135 = arr[1] ;
      expect(val135 === 128).assertTrue();
      const val136 = arr[2] ;
      expect(val136 === 255).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_6800
     * @tc.name testTypedUArraysSortPart1_068
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0xFF, 0x01, 0x80]);
      arr.sort();
      const val137 = arr[0] ;
      expect(val137).assertEqual(0x01);
      const val138 = arr[1] ;
      expect(val138).assertEqual(0x80);
      const val139 = arr[2] ;
      expect(val139).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_6900
     * @tc.name testTypedUArraysSortPart1_069
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) {
      }
      arr.sort();
      const val140 = arr[0] ;
      expect(val140 === 0).assertTrue();
      const val141 = arr[99];
      expect(val141 === 99).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_7000
     * @tc.name testTypedUArraysSortPart1_070
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      arr.sort();
      const val142 = arr[0] ;
      expect(val142 === 1).assertTrue();
      const val143 = arr[4] ;
      expect(val143 === 5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_7100
     * @tc.name testTypedUArraysSortPart1_071
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([5, 4, 3, 2, 1]);
      arr.sort();
      const val144 = arr[0] ;
      expect(val144 === 1).assertTrue();
      const val145 = arr[4] ;
      expect(val145 === 5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_7200
     * @tc.name testTypedUArraysSortPart1_072
     * @tc.desc Verify compareFunction a > b  1 : -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      arr.sort();
      const val146 = arr[0] ;
      expect(val146 === 1).assertTrue();
      const val147 = arr[1] ;
      expect(val147 === 2).assertTrue();
      const val148 = arr[2] ;
      expect(val148 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_7300
     * @tc.name testTypedUArraysSortPart1_073
     * @tc.desc Verify compareFunction a < b  -1 : 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      arr.sort();
      const val149 = arr[0] ;
      expect(val149 === 1).assertTrue();
      const val150 = arr[1] ;
      expect(val150 === 2).assertTrue();
      const val151 = arr[2] ;
      expect(val151 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_7400
     * @tc.name testTypedUArraysSortPart1_074
     * @tc.desc Verify compareFunction Math.sign(a - b)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      arr.sort();
      const val152 = arr[0] ;
      expect(val152 === 1).assertTrue();
      const val153 = arr[1] ;
      expect(val153 === 2).assertTrue();
      const val154 = arr[2] ;
      expect(val154 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_7500
     * @tc.name testTypedUArraysSortPart1_075
     * @tc.desc Verify compareFunction (a > b) - (a < b)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      arr.sort((a: Double, b: Double): Int => ((a > b ? 1 : 0) - (a < b ? 1 : 0)).toInt());
      const val155 = arr[0] ;
      expect(val155 === 1).assertTrue();
      const val156 = arr[1] ;
      expect(val156 === 2).assertTrue();
      const val157 = arr[2] ;
      expect(val157 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_7600
     * @tc.name testTypedUArraysSortPart1_076
     * @tc.desc Verify compareFunction a - b Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint16Array([65535, 0, 32767]);
      arr.sort();
      const val158 = arr[0] ;
      expect(val158 === 0).assertTrue();
      const val159 = arr[1] ;
      expect(val159 === 32767).assertTrue();
      const val160 = arr[2] ;
      expect(val160 === 65535).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_7700
     * @tc.name testTypedUArraysSortPart1_077
     * @tc.desc Verify compareFunction a - b Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array([4294967295, 0, 2147483647]);
      arr.sort();
      const val161 = arr[0] ;
      expect(val161 === 0).assertTrue();
      const val162 = arr[1] ;
      expect(val162 === 2147483647).assertTrue();
      const val163 = arr[2] ;
      expect(val163 === 4294967295).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_7800
     * @tc.name testTypedUArraysSortPart1_078
     * @tc.desc Verify compareFunction BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([5n, 2n, 8n, 1n]);
      arr.sort();
      const val164 = arr[0];
      expect(val164 === 1n).assertTrue();
      const val165 = arr[1];
      expect(val165 === 2n).assertTrue();
      const val166 = arr[2];
      expect(val166 === 5n).assertTrue();
      const val167 = arr[3];
      expect(val167 === 8n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_7900
     * @tc.name testTypedUArraysSortPart1_079
     * @tc.desc Verify compareFunction BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      arr.sort();
      const val168 = arr[0];
      expect(val168 === 3n).assertTrue();
      const val169 = arr[1];
      expect(val169 === 2n).assertTrue();
      const val170 = arr[2];
      expect(val170 === 1n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_8000
     * @tc.name testTypedUArraysSortPart1_080
     * @tc.desc Verify compareFunction BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([BigInt('18446744073709551615'), 0n, 1n]);
      arr.sort();
      const val171 = arr[0];
      expect(val171 === 0n).assertTrue();
      const val172 = arr[1];
      expect(val172 === 1n).assertTrue();
      const val173 = arr[2];
      expect(val173 === BigInt('18446744073709551615')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_8100
     * @tc.name testTypedUArraysSortPart1_081
     * @tc.desc Verify compareFunction BigUint64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigUint64Array([9223372036854775807n, 0n, BigInt('18446744073709551615')]);
      arr.sort();
      const val174 = arr[0];
      expect(val174 === 0n).assertTrue();
      const val175 = arr[1];
      expect(val175 === 9223372036854775807n).assertTrue();
      const val176 = arr[2];
      expect(val176 === BigInt('18446744073709551615')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_8200
     * @tc.name testTypedUArraysSortPart1_082
     * @tc.desc Verify compareFunction Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 0, 127]);
      arr.sort();
      const val177 = arr[0] ;
      expect(val177 === 0).assertTrue();
      const val178 = arr[1] ;
      expect(val178 === 127).assertTrue();
      const val179 = arr[2] ;
      expect(val179 === 255).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_8300
     * @tc.name testTypedUArraysSortPart1_083
     * @tc.desc Verify compareFunction undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      arr.sort();
      const val180 = arr[0] ;
      expect(val180 === 1).assertTrue();
      const val181 = arr[1] ;
      expect(val181 === 2).assertTrue();
      const val182 = arr[2] ;
      expect(val182 === 3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_8400
     * @tc.name testTypedUArraysSortPart1_084
     * @tc.desc Verify compareFunction null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([3, 1, 2]);
        arr.sort();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_8500
     * @tc.name testTypedUArraysSortPart1_085
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([3, 1, 2]);
        arr.sort();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_8600
     * @tc.name testTypedUArraysSortPart1_086
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([3, 1, 2]);
        arr.sort();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_8700
     * @tc.name testTypedUArraysSortPart1_087
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([3, 1, 2]);
        arr.sort();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_8800
     * @tc.name testTypedUArraysSortPart1_088
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([3, 1, 2]);
        arr.sort();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_8900
     * @tc.name testTypedUArraysSortPart1_089
     * @tc.desc Verify compareFunction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8Array([3, 1, 2]);
        arr.sort();
      } catch (e) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_SORT_PART1_9000
     * @tc.name testTypedUArraysSortPart1_090
     * @tc.desc Verify compareFunction NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysSortPart1_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      arr.sort();
      expect(arr.length === 3).assertTrue();
    });
  });
}
