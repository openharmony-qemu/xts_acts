'use static'
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

export default function uint8ClampedArrayJoin01Test(): void {
  describe('uint8ClampedArrayJoin01Test', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        },50);
      });
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_0100
     * @tc.name testUint8ClampedArrayJoinOne001
     * @tc.desc Verify join r equals '1,2,3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join();
      expect(r).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_0200
     * @tc.name testUint8ClampedArrayJoinOne002
     * @tc.desc Verify join r equals '1,2,3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join(',');
      expect(r).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_0300
     * @tc.name testUint8ClampedArrayJoinOne003
     * @tc.desc Verify join r equals '123' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('');
      expect(r).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_0400
     * @tc.name testUint8ClampedArrayJoinOne004
     * @tc.desc Verify join yields length 5 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join(' ');
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_0500
     * @tc.name testUint8ClampedArrayJoinOne005
     * @tc.desc Verify join r equals '1|2|3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('|');
      expect(r).assertEqual('1|2|3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_0600
     * @tc.name testUint8ClampedArrayJoinOne006
     * @tc.desc Verify join r equals '1;2;3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join(';');
      expect(r).assertEqual('1;2;3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_0700
     * @tc.name testUint8ClampedArrayJoinOne007
     * @tc.desc Verify join r equals '10:20:30' for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: string = arr.join(':');
      expect(r).assertEqual('10:20:30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_0800
     * @tc.name testUint8ClampedArrayJoinOne008
     * @tc.desc Verify join r equals '1-2-3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('-');
      expect(r).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_0900
     * @tc.name testUint8ClampedArrayJoinOne009
     * @tc.desc Verify join r equals '1_2_3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('_');
      expect(r).assertEqual('1_2_3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_1000
     * @tc.name testUint8ClampedArrayJoinOne010
     * @tc.desc Verify join r equals '1/2/3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('/');
      expect(r).assertEqual('1/2/3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_1100
     * @tc.name testUint8ClampedArrayJoinOne011
     * @tc.desc Verify join r equals '1\\2\\3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('\\');
      expect(r).assertEqual('1\\2\\3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_1200
     * @tc.name testUint8ClampedArrayJoinOne012
     * @tc.desc Verify join r equals '1\n2\n3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('\n');
      expect(r).assertEqual('1\n2\n3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_1300
     * @tc.name testUint8ClampedArrayJoinOne013
     * @tc.desc Verify join r equals '1\t2\t3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('\t');
      expect(r).assertEqual('1\t2\t3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_1400
     * @tc.name testUint8ClampedArrayJoinOne014
     * @tc.desc Verify join r equals '1\r2\r3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('\r');
      expect(r).assertEqual('1\r2\r3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_1500
     * @tc.name testUint8ClampedArrayJoinOne015
     * @tc.desc Verify join yields length 7 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join(', ');
      expect(r.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_1600
     * @tc.name testUint8ClampedArrayJoinOne016
     * @tc.desc Verify join r equals '10 - 20 - 30' for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: string = arr.join(' - ');
      expect(r).assertEqual('10 - 20 - 30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_1700
     * @tc.name testUint8ClampedArrayJoinOne017
     * @tc.desc Verify join r equals '1<>2<>3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('<>');
      expect(r).assertEqual('1<>2<>3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_1800
     * @tc.name testUint8ClampedArrayJoinOne018
     * @tc.desc Verify join r equals '1===2===3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('===');
      expect(r).assertEqual('1===2===3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_1900
     * @tc.name testUint8ClampedArrayJoinOne019
     * @tc.desc Verify join r equals '10203' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('0');
      expect(r).assertEqual('10203');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_2000
     * @tc.name testUint8ClampedArrayJoinOne020
     * @tc.desc Verify join r equals '1a2a3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('a');
      expect(r).assertEqual('1a2a3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_2100
     * @tc.name testUint8ClampedArrayJoinOne021
     * @tc.desc Verify join r equals '1Z2Z3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('Z');
      expect(r).assertEqual('1Z2Z3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_2200
     * @tc.name testUint8ClampedArrayJoinOne022
     * @tc.desc Verify join with zero-width space separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('​');
      expect(r).assertEqual('1​2​3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_2300
     * @tc.name testUint8ClampedArrayJoinOne023
     * @tc.desc Verify join with zero-width joiner separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('‍');
      expect(r).assertEqual('1‍2‍3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_2400
     * @tc.name testUint8ClampedArrayJoinOne024
     * @tc.desc Verify join yields length 8 for array [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: string = arr.join(' ');
      expect(r.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_2500
     * @tc.name testUint8ClampedArrayJoinOne025
     * @tc.desc Verify join with BOM separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('﻿');
      expect(r).assertEqual('1﻿2﻿3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_2600
     * @tc.name testUint8ClampedArrayJoinOne026
     * @tc.desc Verify join with fullwidth comma separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('，');
      expect(r).assertEqual('1，2，3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_2700
     * @tc.name testUint8ClampedArrayJoinOne027
     * @tc.desc Verify join with ideographic comma separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('、');
      expect(r).assertEqual('1、2、3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_2800
     * @tc.name testUint8ClampedArrayJoinOne028
     * @tc.desc Verify join with CJK character separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('分');
      expect(r).assertEqual('1分2分3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_2900
     * @tc.name testUint8ClampedArrayJoinOne029
     * @tc.desc Verify join with multi-byte CJK separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('隔开');
      expect(r).assertEqual('1隔开2隔开3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_3000
     * @tc.name testUint8ClampedArrayJoinOne030
     * @tc.desc Verify join with Hiragana separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('の');
      expect(r).assertEqual('1の2の3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_3100
     * @tc.name testUint8ClampedArrayJoinOne031
     * @tc.desc Verify join with Arabic comma separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('،');
      expect(r).assertEqual('1،2،3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_3200
     * @tc.name testUint8ClampedArrayJoinOne032
     * @tc.desc Verify join with Hangul separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('와');
      expect(r).assertEqual('1와2와3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_3300
     * @tc.name testUint8ClampedArrayJoinOne033
     * @tc.desc Verify join with emoji separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('😀');
      expect(r).assertEqual('1😀2😀3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_3400
     * @tc.name testUint8ClampedArrayJoinOne034
     * @tc.desc Verify join with pictograph separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('🔥');
      expect(r).assertEqual('1🔥2🔥3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_3500
     * @tc.name testUint8ClampedArrayJoinOne035
     * @tc.desc Verify join with ZWJ emoji sequence separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('👨‍👩‍👧');
      expect(r).assertEqual('1👨‍👩‍👧2👨‍👩‍👧3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_3600
     * @tc.name testUint8ClampedArrayJoinOne036
     * @tc.desc Verify join with skin-tone modifier emoji separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('👍🏽');
      expect(r).assertEqual('1👍🏽2👍🏽3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_3700
     * @tc.name testUint8ClampedArrayJoinOne037
     * @tc.desc Verify join with star symbol separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('★');
      expect(r).assertEqual('1★2★3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_3800
     * @tc.name testUint8ClampedArrayJoinOne038
     * @tc.desc Verify join r equals '1$2$3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('$');
      expect(r).assertEqual('1$2$3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_3900
     * @tc.name testUint8ClampedArrayJoinOne039
     * @tc.desc Verify join with euro sign separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('€');
      expect(r).assertEqual('1€2€3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_4000
     * @tc.name testUint8ClampedArrayJoinOne040
     * @tc.desc Verify join with yen sign separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('¥');
      expect(r).assertEqual('1¥2¥3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_4100
     * @tc.name testUint8ClampedArrayJoinOne041
     * @tc.desc Verify join r equals '1"2"3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('"');
      expect(r).assertEqual('1"2"3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_4200
     * @tc.name testUint8ClampedArrayJoinOne042
     * @tc.desc Verify join r equals "1'2'3" for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('\'');
      expect(r).assertEqual('1\'2\'3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_4300
     * @tc.name testUint8ClampedArrayJoinOne043
     * @tc.desc Verify join r equals '1`2`3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('`');
      expect(r).assertEqual('1`2`3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_4400
     * @tc.name testUint8ClampedArrayJoinOne044
     * @tc.desc Verify join r equals '1A2A3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('A');
      expect(r).assertEqual('1A2A3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_4500
     * @tc.name testUint8ClampedArrayJoinOne045
     * @tc.desc Verify join r equals '1 2 3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join(' ');
      expect(r).assertEqual('1 2 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_4600
     * @tc.name testUint8ClampedArrayJoinOne046
     * @tc.desc Verify join with CJK ext-B character separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('𠮷');
      expect(r).assertEqual('1𠮷2𠮷3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_4700
     * @tc.name testUint8ClampedArrayJoinOne047
     * @tc.desc Verify join r equals '1##########2##########3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('##########');
      expect(r).assertEqual('1##########2##########3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_4800
     * @tc.name testUint8ClampedArrayJoinOne048
     * @tc.desc Verify join r equals '1' + sep + '2' for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const sep: string = '__________________________________________________';
      const r: string = arr.join(sep);
      expect(r).assertEqual('1' + sep + '2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_4900
     * @tc.name testUint8ClampedArrayJoinOne049
     * @tc.desc Verify join yields length 1 + 100 + 1 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      let sep: string = '';
      for (let i = 0; i < 100; i++) {
        sep = sep + 'x';
      }
      const r: string = arr.join(sep);
      expect(r.length).assertEqual(1 + 100 + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_5000
     * @tc.name testUint8ClampedArrayJoinOne050
     * @tc.desc Verify join yields length 1002 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      let sep: string = '';
      for (let i = 0; i < 1000; i++) {
        sep = sep + 'a';
      }
      const r: string = arr.join(sep);
      expect(r.length).assertEqual(1002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_5100
     * @tc.name testUint8ClampedArrayJoinOne051
     * @tc.desc Verify separator ASCII+Unicode '< >'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('<中>');
      expect(r).assertEqual('1<中>2<中>3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_5200
     * @tc.name testUint8ClampedArrayJoinOne052
     * @tc.desc Verify join with mixed ASCII-emoji separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('a😀b');
      expect(r).assertEqual('1a😀b2a😀b3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_5300
     * @tc.name testUint8ClampedArrayJoinOne053
     * @tc.desc Verify join r equals '1\\\\2' for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: string = arr.join('\\\\');
      expect(r).assertEqual('1\\\\2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_5400
     * @tc.name testUint8ClampedArrayJoinOne054
     * @tc.desc Verify join with CJK bracket pair separator for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('【】');
      expect(r).assertEqual('1【】2【】3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_5500
     * @tc.name testUint8ClampedArrayJoinOne055
     * @tc.desc Verify join r equals '1()2()3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('()');
      expect(r).assertEqual('1()2()3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_5600
     * @tc.name testUint8ClampedArrayJoinOne056
     * @tc.desc Verify join r equals '1<br>2<br>3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join('<br>');
      expect(r).assertEqual('1<br>2<br>3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_5700
     * @tc.name testUint8ClampedArrayJoinOne057
     * @tc.desc Verify join r equals '412351236' for array [4, 5, 6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([4, 5, 6]);
      const r: string = arr.join('123');
      expect(r).assertEqual('412351236');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_5800
     * @tc.name testUint8ClampedArrayJoinOne058
     * @tc.desc Verify join r equals '' for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r: string = arr.join();
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_5900
     * @tc.name testUint8ClampedArrayJoinOne059
     * @tc.desc Verify join r equals '' for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r: string = arr.join(',');
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_6000
     * @tc.name testUint8ClampedArrayJoinOne060
     * @tc.desc Verify join r equals '0' for array [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const r: string = arr.join();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_6100
     * @tc.name testUint8ClampedArrayJoinOne061
     * @tc.desc Verify join r equals '10,20' for array [10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      const r: string = arr.join();
      expect(r).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_6200
     * @tc.name testUint8ClampedArrayJoinOne062
     * @tc.desc Verify join r equals '1020' for array [10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      const r: string = arr.join('');
      expect(r).assertEqual('1020');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_6300
     * @tc.name testUint8ClampedArrayJoinOne063
     * @tc.desc Verify join r equals '0,0,0' for array [0, 0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const r: string = arr.join(',');
      expect(r).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_6400
     * @tc.name testUint8ClampedArrayJoinOne064
     * @tc.desc Verify join r equals '255,255,255' for array [255, 255, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const r: string = arr.join(',');
      expect(r).assertEqual('255,255,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_6500
     * @tc.name testUint8ClampedArrayJoinOne065
     * @tc.desc Verify join r equals '7-7-7-7' for array [7, 7, 7, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 7, 7, 7]);
      const r: string = arr.join('-');
      expect(r).assertEqual('7-7-7-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_6600
     * @tc.name testUint8ClampedArrayJoinOne066
     * @tc.desc Verify join r equals '0,255' for array [0, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      const r: string = arr.join(',');
      expect(r).assertEqual('0,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_6700
     * @tc.name testUint8ClampedArrayJoinOne067
     * @tc.desc Verify join r equals '127,128' for array [127, 128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 128]);
      const r: string = arr.join(',');
      expect(r).assertEqual('127,128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_6800
     * @tc.name testUint8ClampedArrayJoinOne068
     * @tc.desc Verify join r equals '255,100' for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 256;
      arr[1] = 100;
      const r: string = arr.join(',');
      expect(r).assertEqual('255,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_6900
     * @tc.name testUint8ClampedArrayJoinOne069
     * @tc.desc Verify join r equals '0,5' for length-2 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = -1;
      arr[1] = 5;
      const r: string = arr.join(',');
      expect(r).assertEqual('0,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_7000
     * @tc.name testUint8ClampedArrayJoinOne070
     * @tc.desc Verify join r equals '0' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = Number.NaN;
      const r: string = arr.join();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_7100
     * @tc.name testUint8ClampedArrayJoinOne071
     * @tc.desc Verify join r equals '255' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = Number.POSITIVE_INFINITY;
      const r: string = arr.join();
      expect(r).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_7200
     * @tc.name testUint8ClampedArrayJoinOne072
     * @tc.desc Verify join r equals '0' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = -Number.POSITIVE_INFINITY;
      const r: string = arr.join();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_7300
     * @tc.name testUint8ClampedArrayJoinOne073
     * @tc.desc Verify join r equals '128' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 127.5;
      const r: string = arr.join();
      expect(r).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_7400
     * @tc.name testUint8ClampedArrayJoinOne074
     * @tc.desc Verify join r equals '128' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 128.5;
      const r: string = arr.join();
      expect(r).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_7500
     * @tc.name testUint8ClampedArrayJoinOne075
     * @tc.desc Verify join r equals '0' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 0.5;
      const r: string = arr.join();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_7600
     * @tc.name testUint8ClampedArrayJoinOne076
     * @tc.desc Verify join r equals '1-2-3-4-5-6-7-8-9-10' for array [1, 2, 3, 4, 5, 6, 7, 8, 9, 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      const r: string = arr.join('-');
      expect(r).assertEqual('1-2-3-4-5-6-7-8-9-10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_7700
     * @tc.name testUint8ClampedArrayJoinOne077
     * @tc.desc Verify join yields length expectedLen for length-100 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = 1;
      }
      const r: string = arr.join(',');
      const expectedLen: int = 100 + 99;
      expect(r.length).assertEqual(expectedLen);
      expect(r.startsWith('1,')).assertTrue();
      expect(r.endsWith(',1')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_7800
     * @tc.name testUint8ClampedArrayJoinOne078
     * @tc.desc Verify join yields length 1024 for length-1024 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      for (let i = 0; i < 1024; i++) {
        arr[i] = 5;
      }
      const r: string = arr.join('');
      expect(r.length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_7900
     * @tc.name testUint8ClampedArrayJoinOne079
     * @tc.desc Verify join r equals '10|20|30|40' for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      const r: string = arr.join('|');
      expect(r).assertEqual('10|20|30|40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_8000
     * @tc.name testUint8ClampedArrayJoinOne080
     * @tc.desc Verify join r equals '7-9' for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 1, 2);
      arr[0] = 7;
      arr[1] = 9;
      const r: string = arr.join('-');
      expect(r).assertEqual('7-9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_8100
     * @tc.name testUint8ClampedArrayJoinOne081
     * @tc.desc Verify Uint8ClampedArray.of r equals '10,20,30' for of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30);
      const r: string = arr.join(',');
      expect(r).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_8200
     * @tc.name testUint8ClampedArrayJoinOne082
     * @tc.desc Verify Uint8ClampedArray.from r equals '1,2,3' for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const arr = Uint8ClampedArray.from(src);
      const r: string = arr.join(',');
      expect(r).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_8300
     * @tc.name testUint8ClampedArrayJoinOne083
     * @tc.desc Verify subarray r equals '2,3,4' for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      const r: string = sub.join(',');
      expect(r).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_8400
     * @tc.name testUint8ClampedArrayJoinOne084
     * @tc.desc Verify slice r equals '1-2-3' for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s = arr.slice(0, 3);
      const r: string = s.join('-');
      expect(r).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_8500
     * @tc.name testUint8ClampedArrayJoinOne085
     * @tc.desc Verify join yields length 1 for array [9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9]);
      const r: string = arr.join();
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_8600
     * @tc.name testUint8ClampedArrayJoinOne086
     * @tc.desc Verify join yields length 2 for array [99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const r: string = arr.join();
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_8700
     * @tc.name testUint8ClampedArrayJoinOne087
     * @tc.desc Verify join yields length 3 for array [200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([200]);
      const r: string = arr.join();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_ONE_8800
     * @tc.name testUint8ClampedArrayJoinOne088
     * @tc.desc Verify join r equals '0,1' for array [0, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 1]);
      const r: string = arr.join(',');
      expect(r).assertEqual('0,1');
    });
  });
}
