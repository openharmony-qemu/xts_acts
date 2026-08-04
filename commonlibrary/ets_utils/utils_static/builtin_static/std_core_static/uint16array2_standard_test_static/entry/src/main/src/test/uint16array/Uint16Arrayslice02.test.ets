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

export default function uint16ArraySlicePart2Test(): void {
  describe('Uint16ArraySlicePart2Test', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_0100
     * @tc.name testUint16ArraySlicePart2001
     * @tc.desc Verify slice() copies all elements and returns length 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30);
      let r: Uint16Array = src.slice();
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_0200
     * @tc.name testUint16ArraySlicePart2002
     * @tc.desc Verify slice(0, 0) returns empty Uint16Array length 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30);
      let r: Uint16Array = src.slice(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_0300
     * @tc.name testUint16ArraySlicePart2003
     * @tc.desc Verify slice(0) copies all 5 elements from begin=0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(0);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_0400
     * @tc.name testUint16ArraySlicePart2004
     * @tc.desc Verify slice(1, 4) returns [20,30,40] length 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(1, 4);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(20);
      expect(r[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_0500
     * @tc.name testUint16ArraySlicePart2005
     * @tc.desc Verify slice(2, 2) returns empty Uint16Array length 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30);
      let r: Uint16Array = src.slice(2, 2);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_0600
     * @tc.name testUint16ArraySlicePart2006
      * @tc.desc Verify the first two elements are copied by an exclusive end bound
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30);
      let r: Uint16Array = src.slice(0, 2);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_0700
     * @tc.name testUint16ArraySlicePart2007
      * @tc.desc Verify an omitted range copies the complete five-element source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice();
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_0800
     * @tc.name testUint16ArraySlicePart2008
      * @tc.desc Verify an explicit full range retains both source endpoints
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(0, 5);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_0900
     * @tc.name testUint16ArraySlicePart2009
      * @tc.desc Verify an end bound of one returns only the leading element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_1000
     * @tc.name testUint16ArraySlicePart2010
      * @tc.desc Verify the final one-element range returns the trailing value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(4, 5);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_1100
     * @tc.name testUint16ArraySlicePart2011
      * @tc.desc Verify a middle one-element range returns its selected value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(2, 3);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_1200
     * @tc.name testUint16ArraySlicePart2012
      * @tc.desc Verify a prefix range returns its first three source values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(0, 3);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_1300
     * @tc.name testUint16ArraySlicePart2013
      * @tc.desc Verify a suffix range includes the source tail through its length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(2, 5);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(30);
      expect(r[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_1400
     * @tc.name testUint16ArraySlicePart2014
      * @tc.desc Verify an adjacent range selects the second source value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(1, 2);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_1500
     * @tc.name testUint16ArraySlicePart2015
      * @tc.desc Verify a two-element suffix preserves its order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(3, 5);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(40);
      expect(r[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_1600
     * @tc.name testUint16ArraySlicePart2016
      * @tc.desc Verify equal zero bounds produce an empty result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_1700
     * @tc.name testUint16ArraySlicePart2017
      * @tc.desc Verify equal middle bounds produce an empty result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(1, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_1800
     * @tc.name testUint16ArraySlicePart2018
      * @tc.desc Verify a begin index at the source length produces an empty result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(5);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_1900
     * @tc.name testUint16ArraySlicePart2019
      * @tc.desc Verify a negative begin selects the final two values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(-2);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(40);
      expect(r[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_2000
     * @tc.name testUint16ArraySlicePart2020
      * @tc.desc Verify negative bounds select the two values before the tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(-3, -1);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(30);
      expect(r[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_2100
     * @tc.name testUint16ArraySlicePart2021
      * @tc.desc Verify a negative begin of one selects only the final value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(-1);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_2200
     * @tc.name testUint16ArraySlicePart2022
      * @tc.desc Verify a negative begin equal to length copies all values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(-5);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_2300
     * @tc.name testUint16ArraySlicePart2023
      * @tc.desc Verify a negative begin and explicit length end select the final three values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(-3, 5);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(30);
      expect(r[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_2400
     * @tc.name testUint16ArraySlicePart2024
      * @tc.desc Verify a negative end excludes the final two source values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(0, -2);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_2500
     * @tc.name testUint16ArraySlicePart2025
      * @tc.desc Verify negative bounds select the second and third values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(-4, -2);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_2600
     * @tc.name testUint16ArraySlicePart2026
      * @tc.desc Verify adjacent negative bounds select the penultimate value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(-2, -1);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_2700
     * @tc.name testUint16ArraySlicePart2027
      * @tc.desc Verify an excessively negative begin is clamped to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(-10);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_2800
     * @tc.name testUint16ArraySlicePart2028
      * @tc.desc Verify an end beyond length is clamped to the source length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(0, 10);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_2900
     * @tc.name testUint16ArraySlicePart2029
      * @tc.desc Verify a begin beyond length produces an empty result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(10);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_3000
     * @tc.name testUint16ArraySlicePart2030
      * @tc.desc Verify clamped begin and zero end produce an empty result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(-10, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_3100
     * @tc.name testUint16ArraySlicePart2031
      * @tc.desc Verify a begin greater than end produces an empty result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(3, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_3200
     * @tc.name testUint16ArraySlicePart2032
      * @tc.desc Verify a full slice has independent storage and preserves both source values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice();
      expect(r.join(',')).assertEqual('10,20,30,40,50');
      expect(r.buffer).not().assertEqual(src.buffer);
      r[0] = 99;
      expect(src[0]).assertEqual(10);
      src[1] = 88;
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_3300
     * @tc.name testUint16ArraySlicePart2033
      * @tc.desc Verify a full five-element slice allocates ten bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice();
      expect(r.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_3400
     * @tc.name testUint16ArraySlicePart2034
      * @tc.desc Verify a three-element range allocates six bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(1, 4);
      expect(r.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_3500
     * @tc.name testUint16ArraySlicePart2035
      * @tc.desc Verify a one-element range allocates two bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(0, 1);
      expect(r.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_3600
     * @tc.name testUint16ArraySlicePart2036
      * @tc.desc Verify a two-element negative suffix allocates four bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(-2);
      expect(r.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_3700
     * @tc.name testUint16ArraySlicePart2037
     * @tc.desc Verify slice creates an independent copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let result: Uint16Array = src.slice();
      result[0] = 99;
      expect(src[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_3800
     * @tc.name testUint16ArraySlicePart2038
      * @tc.desc Verify a three-element prefix reports matching length and content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let result: Uint16Array = src.slice(0, 3);
      expect(result.length).assertEqual(3);
      expect(result.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_3900
     * @tc.name testUint16ArraySlicePart2039
      * @tc.desc Verify mutation of a sliced prefix does not alter its source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let result: Uint16Array = src.slice(0, 3);
      result[1] = 99;
      expect(src[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_4000
     * @tc.name testUint16ArraySlicePart2040
      * @tc.desc Verify a negative suffix retains its two elements in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let result: Uint16Array = src.slice(-2);
      expect(result.length).assertEqual(2);
      expect(result.join(',')).assertEqual('40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_4100
     * @tc.name testUint16ArraySlicePart2041
     * @tc.desc Verify slice() allocates a distinct buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice();
      expect(r.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_4200
     * @tc.name testUint16ArraySlicePart2042
      * @tc.desc Verify a slice result starts at byte offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(1, 4);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_4300
     * @tc.name testUint16ArraySlicePart2043
     * @tc.desc Verify slice() remains unchanged after source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice();
      src[0] = 99;
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_4400
     * @tc.name testUint16ArraySlicePart2044
     * @tc.desc Verify slice result mutation does not affect source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(1, 4);
      r[0] = 99;
      expect(src[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_4500
     * @tc.name testUint16ArraySlicePart2045
     * @tc.desc Verify slice result is isolated from subsequent source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(1, 4);
      src[1] = 99;
      expect(r[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_4600
     * @tc.name testUint16ArraySlicePart2046
      * @tc.desc Verify the result buffer size equals the result byte length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(1, 4);
      expect(r.buffer.byteLength).assertEqual(r.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_4700
     * @tc.name testUint16ArraySlicePart2047
      * @tc.desc Verify a partial slice has a smaller buffer than its source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice(1, 4);
      expect(r.buffer.byteLength).not().assertEqual(src.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_4800
     * @tc.name testUint16ArraySlicePart2048
     * @tc.desc Verify writing through the slice buffer does not affect source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice();
      let bufView: Uint16Array = new Uint16Array(r.buffer);
      bufView[0] = 99;
      expect(src[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_4900
     * @tc.name testUint16ArraySlicePart2049
     * @tc.desc Verify source buffer mutation does not affect slice result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice();
      let bufView: Uint16Array = new Uint16Array(src.buffer);
      bufView[0] = 99;
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_5000
     * @tc.name testUint16ArraySlicePart2050
      * @tc.desc Verify a full slice preserves zero midpoint and maximum Uint16 values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(0, 65535, 32768, 65535);
      let r: Uint16Array = src.slice();
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(65535);
      expect(r[2]).assertEqual(32768);
      expect(r[3]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_5100
     * @tc.name testUint16ArraySlicePart2051
      * @tc.desc Verify slicing the first element preserves the Uint16 minimum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let r: Uint16Array = src.slice(0, 1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_5200
     * @tc.name testUint16ArraySlicePart2052
      * @tc.desc Verify slicing the second element preserves the Uint16 maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let r: Uint16Array = src.slice(1, 2);
      expect(r[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_5300
     * @tc.name testUint16ArraySlicePart2053
      * @tc.desc Verify slicing the third element preserves the Uint16 midpoint
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let r: Uint16Array = src.slice(2, 3);
      expect(r[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_5400
     * @tc.name testUint16ArraySlicePart2054
     * @tc.desc Verify slice(-2, -1) returns the middle boundary value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let r: Uint16Array = src.slice(-2, -1);
      expect(r[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_5500
     * @tc.name testUint16ArraySlicePart2055
      * @tc.desc Verify slicing an empty array from zero remains empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = new Uint16Array();
      let r: Uint16Array = src.slice(0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_5600
     * @tc.name testUint16ArraySlicePart2056
      * @tc.desc Verify an empty array with equal bounds remains empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = new Uint16Array();
      let r: Uint16Array = src.slice(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_5700
     * @tc.name testUint16ArraySlicePart2057
      * @tc.desc Verify a full single-element slice retains length one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(42);
      let r: Uint16Array = src.slice();
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_5800
     * @tc.name testUint16ArraySlicePart2058
      * @tc.desc Verify a zero begin retains a single source element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(42);
      let r: Uint16Array = src.slice(0);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_5900
     * @tc.name testUint16ArraySlicePart2059
      * @tc.desc Verify a begin at single-element length produces an empty result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(42);
      let r: Uint16Array = src.slice(1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_6000
     * @tc.name testUint16ArraySlicePart2060
      * @tc.desc Verify a negative single-element begin retains that element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(42);
      let r: Uint16Array = src.slice(-1);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_6100
     * @tc.name testUint16ArraySlicePart2061
      * @tc.desc Verify a full single-element slice preserves its stored value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(42);
      let r: Uint16Array = src.slice();
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_6200
     * @tc.name testUint16ArraySlicePart2062
      * @tc.desc Verify a leading two-element range selects only 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(100, 200);
      let r: Uint16Array = src.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_6300
     * @tc.name testUint16ArraySlicePart2063
      * @tc.desc Verify a trailing two-element range selects only 200
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(100, 200);
      let r: Uint16Array = src.slice(1, 2);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_6400
     * @tc.name testUint16ArraySlicePart2064
      * @tc.desc Verify a full two-element slice allocates four bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(100, 200);
      let r: Uint16Array = src.slice();
      expect(r.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_6500
     * @tc.name testUint16ArraySlicePart2065
      * @tc.desc Verify a one-element range from a pair allocates two bytes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(100, 200);
      let r: Uint16Array = src.slice(0, 1);
      expect(r.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_6600
     * @tc.name testUint16ArraySlicePart2066
      * @tc.desc Verify a full maximum-value array slice retains three elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(65535, 65535, 65535);
      let r: Uint16Array = src.slice();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_6700
     * @tc.name testUint16ArraySlicePart2067
      * @tc.desc Verify a full maximum-value array slice preserves both endpoints
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(65535, 65535, 65535);
      let r: Uint16Array = src.slice();
      expect(r[0]).assertEqual(65535);
      expect(r[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_6800
     * @tc.name testUint16ArraySlicePart2068
      * @tc.desc Verify a maximum-value suffix retains two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(65535, 65535, 65535);
      let r: Uint16Array = src.slice(1);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_6900
     * @tc.name testUint16ArraySlicePart2069
      * @tc.desc Verify a full all-zero slice retains three elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(0, 0, 0);
      let r: Uint16Array = src.slice();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_7000
     * @tc.name testUint16ArraySlicePart2070
      * @tc.desc Verify a full all-zero slice preserves both endpoints
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(0, 0, 0);
      let r: Uint16Array = src.slice();
      expect(r[0]).assertEqual(0);
      expect(r[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_7100
     * @tc.name testUint16ArraySlicePart2071
      * @tc.desc Verify an all-zero suffix retains two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(0, 0, 0);
      let r: Uint16Array = src.slice(1);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_7200
     * @tc.name testUint16ArraySlicePart2072
      * @tc.desc Verify a full one-hundred-element slice retains its length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = new Uint16Array(100);
      for (let i: int = 0; i < 100; i++) {
        src[i] = i;
      }
      let r: Uint16Array = src.slice();
      expect(r.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_7300
     * @tc.name testUint16ArraySlicePart2073
      * @tc.desc Verify a midpoint begin returns fifty elements from a large source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = new Uint16Array(100);
      for (let i: int = 0; i < 100; i++) {
        src[i] = i;
      }
      let r: Uint16Array = src.slice(50);
      expect(r.length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_7400
     * @tc.name testUint16ArraySlicePart2074
      * @tc.desc Verify a fifty-element prefix is copied from a large source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = new Uint16Array(100);
      for (let i: int = 0; i < 100; i++) {
        src[i] = i;
      }
      let r: Uint16Array = src.slice(0, 50);
      expect(r.length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_7500
     * @tc.name testUint16ArraySlicePart2075
      * @tc.desc Verify a full slice of a regular array has zero byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let r: Uint16Array = src.slice();
      expect(r.byteOffset).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_7600
     * @tc.name testUint16ArraySlicePart2076
     * @tc.desc Verify slice clamps a begin below negative length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       const r: Uint16Array = a.slice(-99, 2);
      expect(r.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_7700
     * @tc.name testUint16ArraySlicePart2077
     * @tc.desc Verify slice clamps an end above length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4);
       const r: Uint16Array = a.slice(2, 99);
      expect(r.join(',')).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_7800
     * @tc.name testUint16ArraySlicePart2078
     * @tc.desc Verify slice returns empty when begin equals end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3);
       const r: Uint16Array = a.slice(1, 1);
      expect(r.join(',')).assertEqual('');
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_7900
     * @tc.name testUint16ArraySlicePart2079
     * @tc.desc Verify slice applies both negative bounds relative to length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const a: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
       const r: Uint16Array = a.slice(-4, -1);
      expect(r.join(',')).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SLICE_PART2_8000
     * @tc.name testUint16ArraySlicePart2080
     * @tc.desc Verify slice handles a range on a nonzero parent view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySlicePart2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       const b: ArrayBuffer = new ArrayBuffer(14);
       const all: Uint16Array = new Uint16Array(b);
       all.set(Uint16Array.of(9, 1, 2, 3, 4, 5, 8));
       const v: Uint16Array = new Uint16Array(b, 2, 5);
       const r: Uint16Array = v.slice(1, 4);
      expect(r.join(',')).assertEqual('2,3,4');
      expect(r.byteOffset).assertEqual(0);
    });

  });
};
