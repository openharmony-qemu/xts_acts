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

export default function uint16ArrayFrom01Test(): void {
  describe('Uint16ArrayFrom01Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_0100
     * @tc.name testUint16ArrayFromOne001
     * @tc.desc Verify from 1 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(10, 20, 30);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_0200
     * @tc.name testUint16ArrayFromOne002
     * @tc.desc Verify Uint16Array.from converts a two-element Set without a mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_0300
     * @tc.name testUint16ArrayFromOne003
     * @tc.desc Verify from 2 Iterable<number> + mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => v * 2);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(2);
      expect(result.at(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_0400
     * @tc.name testUint16ArrayFromOne004
     * @tc.desc Verify Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [];
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_0500
     * @tc.name testUint16ArrayFromOne005
     * @tc.desc Verify Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [42];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_0600
     * @tc.name testUint16ArrayFromOne006
     * @tc.desc Verify Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2, 3, 4, 5];
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(5);
      expect(result.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_0700
     * @tc.name testUint16ArrayFromOne007
     * @tc.desc Verify Array<number> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0, 100, 200];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_0800
     * @tc.name testUint16ArrayFromOne008
     * @tc.desc Verify Array<number> 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [65535];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_0900
     * @tc.name testUint16ArrayFromOne009
     * @tc.desc Verify Array<number> 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [65536];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_1000
     * @tc.name testUint16ArrayFromOne010
     * @tc.desc Verify Array<number> -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-1];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_1100
     * @tc.name testUint16ArrayFromOne011
     * @tc.desc Verify Array<number> 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [32768];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_1200
     * @tc.name testUint16ArrayFromOne012
     * @tc.desc Verify Array<number> 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0xFFFF];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_1300
     * @tc.name testUint16ArrayFromOne013
     * @tc.desc Verify Array<number> 0b1111111111111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0b1111111111111111];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_1400
     * @tc.name testUint16ArrayFromOne014
     * @tc.desc Verify Array<number> 0o177777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0o177777];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_1500
     * @tc.name testUint16ArrayFromOne015
     * @tc.desc Verify Array<number> 1e4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1e4];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_1600
     * @tc.name testUint16ArrayFromOne016
     * @tc.desc Verify Array<number> -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-32768];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_1700
     * @tc.name testUint16ArrayFromOne017
     * @tc.desc Verify Uint16Array from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Uint16Array();
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_1800
     * @tc.name testUint16ArrayFromOne018
     * @tc.desc Verify Uint16Array from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(99);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_1900
     * @tc.name testUint16ArrayFromOne019
     * @tc.desc Verify Uint16Array from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(10, 20, 30);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_2000
     * @tc.name testUint16ArrayFromOne020
     * @tc.desc Verify Uint16Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(0, 1, 2);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_2100
     * @tc.name testUint16ArrayFromOne021
     * @tc.desc Verify Uint16Array 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(65535);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_2200
     * @tc.name testUint16ArrayFromOne022
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(100, 200, 300);
      let result = Uint16Array.from(source);
      source[0] = 999;
      expect(result.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_2300
     * @tc.name testUint16ArrayFromOne023
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(100, 200, 300);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(100);
      expect(source.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_2400
     * @tc.name testUint16ArrayFromOne024
     * @tc.desc Verify Uint16Array.from copies a zero value from a Uint16Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(0);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(source.at(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_2500
     * @tc.name testUint16ArrayFromOne025
     * @tc.desc Verify Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1.0, 2.0, 3.0];
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_2600
     * @tc.name testUint16ArrayFromOne026
     * @tc.desc Verify Array<number> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0.0];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_2700
     * @tc.name testUint16ArrayFromOne027
     * @tc.desc Verify Array<number> 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [3.14];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_2800
     * @tc.name testUint16ArrayFromOne028
     * @tc.desc Verify Array<number> NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [Number.NaN];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_2900
     * @tc.name testUint16ArrayFromOne029
     * @tc.desc Verify Array<number> Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [Number.POSITIVE_INFINITY];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_3000
     * @tc.name testUint16ArrayFromOne030
     * @tc.desc Verify Array<number> -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-Number.POSITIVE_INFINITY];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_3100
     * @tc.name testUint16ArrayFromOne031
     * @tc.desc Verify Array<number> 0x10000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0x10000];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_3200
     * @tc.name testUint16ArrayFromOne032
     * @tc.desc Verify Array<number> -0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-0.5];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_3300
     * @tc.name testUint16ArrayFromOne033
     * @tc.desc Verify Array<number> 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [65535.9];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_3400
     * @tc.name testUint16ArrayFromOne034
     * @tc.desc Verify Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [10, 20, 30];
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_3500
     * @tc.name testUint16ArrayFromOne035
     * @tc.desc Verify Array<number> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_3600
     * @tc.name testUint16ArrayFromOne036
     * @tc.desc Verify Array<number> 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [100000];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_3700
     * @tc.name testUint16ArrayFromOne037
     * @tc.desc Verify Set<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_3800
     * @tc.name testUint16ArrayFromOne038
     * @tc.desc Verify Set<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(5.0);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_3900
     * @tc.name testUint16ArrayFromOne039
     * @tc.desc Verify Set<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      source.add(3.0);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(3);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_4000
     * @tc.name testUint16ArrayFromOne040
     * @tc.desc Verify Set<number> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(0.0);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_4100
     * @tc.name testUint16ArrayFromOne041
     * @tc.desc Verify Set<number> 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(65535.0);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_4200
     * @tc.name testUint16ArrayFromOne042
     * @tc.desc Verify Set<number> 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(3.14);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_4300
     * @tc.name testUint16ArrayFromOne043
     * @tc.desc Verify Set<number> NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(Number.NaN);
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_4400
     * @tc.name testUint16ArrayFromOne044
     * @tc.desc Verify mapfn (v) => v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(5.0);
      source.add(10.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => v);
      expect(result.at(0)).assertEqual(5);
      expect(result.at(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_4500
     * @tc.name testUint16ArrayFromOne045
     * @tc.desc Verify mapfn (v) => v * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(100.0);
      source.add(200.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => v * 2);
      expect(result.at(0)).assertEqual(200);
      expect(result.at(1)).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_4600
     * @tc.name testUint16ArrayFromOne046
     * @tc.desc Verify mapfn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 0);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_4700
     * @tc.name testUint16ArrayFromOne047
     * @tc.desc Verify mapfn 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 65535);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_4800
     * @tc.name testUint16ArrayFromOne048
     * @tc.desc Verify mapfn 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 65536);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_4900
     * @tc.name testUint16ArrayFromOne049
     * @tc.desc Verify mapfn -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => -1);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_5000
     * @tc.name testUint16ArrayFromOne050
     * @tc.desc Verify mapfn 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 3.14);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_5100
     * @tc.name testUint16ArrayFromOne051
     * @tc.desc Verify mapfn index (v, k) => k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(100.0);
      source.add(200.0);
      source.add(300.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => k);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
      expect(result.at(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_5200
     * @tc.name testUint16ArrayFromOne052
     * @tc.desc Verify mapfn NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => Number.NaN);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_5300
     * @tc.name testUint16ArrayFromOne053
     * @tc.desc Verify mapfn Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => Number.POSITIVE_INFINITY);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_5400
     * @tc.name testUint16ArrayFromOne054
     * @tc.desc Verify mapfn -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => -Number.POSITIVE_INFINITY);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_5500
     * @tc.name testUint16ArrayFromOne055
     * @tc.desc Verify mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      try {
        let result = Uint16Array.from(source, (v: number, k: number): number => {
          throw new Error("mapfn error");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_5600
     * @tc.name testUint16ArrayFromOne056
     * @tc.desc Verify mapfn 0x10000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 0x10000);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_5700
     * @tc.name testUint16ArrayFromOne057
     * @tc.desc Verify mapfn -0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => -0.5);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_5800
     * @tc.name testUint16ArrayFromOne058
     * @tc.desc Verify mapfn 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 65535.9);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_5900
     * @tc.name testUint16ArrayFromOne059
     * @tc.desc Verify mapfn Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      let callCount: number = 0;
      let result = Uint16Array.from(source, (v: number, k: number): number => {
        callCount++;
        return v;
      });
      expect(result.length).assertEqual(0);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_6000
     * @tc.name testUint16ArrayFromOne060
     * @tc.desc Verify from Uint16Array Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(source);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_6100
     * @tc.name testUint16ArrayFromOne061
     * @tc.desc Verify from Uint16Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(1, 2, 3);
      let result = Uint16Array.from(source);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_6200
     * @tc.name testUint16ArrayFromOne062
     * @tc.desc Verify from Uint16Array Iterable<number> + mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => v);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_6300
     * @tc.name testUint16ArrayFromOne063
     * @tc.desc Verify from byteLength Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2, 3, 4];
      let result = Uint16Array.from(source);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_6400
     * @tc.name testUint16ArrayFromOne064
     * @tc.desc Verify from byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [];
      let result = Uint16Array.from(source);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_6500
     * @tc.name testUint16ArrayFromOne065
     * @tc.desc Verify from byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(source);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_6600
     * @tc.name testUint16ArrayFromOne066
     * @tc.desc Verify from BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(source);
      expect(result.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_6700
     * @tc.name testUint16ArrayFromOne067
     * @tc.desc Verify from buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(1, 2, 3);
      let result = Uint16Array.from(source);
      expect((result.buffer) !== (source.buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_6800
     * @tc.name testUint16ArrayFromOne068
     * @tc.desc Verify from null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result = Uint16Array.from(null!);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_6900
     * @tc.name testUint16ArrayFromOne069
     * @tc.desc Verify from undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result = Uint16Array.from(undefined!);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_7000
     * @tc.name testUint16ArrayFromOne070
     * @tc.desc Verify from null mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      try {
        let result = Uint16Array.from(source, null!);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_7100
     * @tc.name testUint16ArrayFromOne071
     * @tc.desc Verify from undefined mapfn mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(5.0);
      source.add(10.0);
      let result = Uint16Array.from(source, undefined);
      expect(result.at(0)).assertEqual(5);
      expect(result.at(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_7200
     * @tc.name testUint16ArrayFromOne072
     * @tc.desc Verify Array<number> 65535*2 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [131070];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_7300
     * @tc.name testUint16ArrayFromOne073
     * @tc.desc Verify Array<number> -2 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-2];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_7400
     * @tc.name testUint16ArrayFromOne074
     * @tc.desc Verify Array<number> 0x7FFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0x7FFF];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_7500
     * @tc.name testUint16ArrayFromOne075
     * @tc.desc Verify Array<number> 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0x8000];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_7600
     * @tc.name testUint16ArrayFromOne076
     * @tc.desc Verify Array<number> -65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-65535.0];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_7700
     * @tc.name testUint16ArrayFromOne077
     * @tc.desc Verify mapfn 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 0x8000);
      expect(result.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_7800
     * @tc.name testUint16ArrayFromOne078
     * @tc.desc Verify mapfn -65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => -65535);
      expect(result.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_7900
     * @tc.name testUint16ArrayFromOne079
     * @tc.desc Verify mapfn 131072 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      let result = Uint16Array.from(source, (v: number, k: number): number => 131072);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_8000
     * @tc.name testUint16ArrayFromOne080
     * @tc.desc Verify from Uint16Array (copy independence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(1, 2, 3, 4, 5);
      let result = Uint16Array.from(source);
      source[0] = 999;
      expect(result.at(0)).assertEqual(1);
      expect(result.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_8100
     * @tc.name testUint16ArrayFromOne081
     * @tc.desc Verify from array with float values (truncated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1.1, 2.5, 3.999];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_8200
     * @tc.name testUint16ArrayFromOne082
     * @tc.desc Verify from with mapfn using index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [10, 20, 30];
      let result = Uint16Array.from(source, (v: number, k: number): number => k * 100);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(100);
      expect(result.at(2)).assertEqual(200);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_ONE_8400
     * @tc.name testUint16ArrayFromOne084
     * @tc.desc Verify from with mapfn throwing error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2];
      try {
        Uint16Array.from(source, (v: number, k: number): number => { throw new Error("test"); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

  });
}
