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

export default function uint16ArrayFromPart3Test(): void {
  describe('Uint16ArrayFromPart3Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_0100
     * @tc.name testUint16ArrayFromPart3_001
     * @tc.desc Verify Array<number> from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [10, 20, 30];
      let r = Uint16Array.from(fa);
      expect(r.length).assertEqual(3);
      expect(r.at(0)).assertEqual(10);
      expect(r.at(1)).assertEqual(20);
      expect(r.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_0200
     * @tc.name testUint16ArrayFromPart3_002
     * @tc.desc Verify Set<number> from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(100);
      s.add(200);
      let r = Uint16Array.from(s);
      expect(r.length).assertEqual(2);
      expect(r.at(0)).assertEqual(100);
      expect(r.at(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_0300
     * @tc.name testUint16ArrayFromPart3_003
     * @tc.desc Verify Uint16Array from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(50, 150, 250);
      let r = Uint16Array.from(src);
      expect(r.length).assertEqual(3);
      expect(r.at(0)).assertEqual(50);
      expect(r.at(1)).assertEqual(150);
      expect(r.at(2)).assertEqual(250);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_0400
     * @tc.name testUint16ArrayFromPart3_004
     * @tc.desc Verify Uint16Array.from converts Set<number> values without a map function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(7.0);
      si.add(8.0);
      let r = Uint16Array.from(si);
      expect(r.length).assertEqual(2);
      expect(r.at(0)).assertEqual(7);
      expect(r.at(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_0500
     * @tc.name testUint16ArrayFromPart3_005
     * @tc.desc Verify Set<number> {0, 65535}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(0);
      s.add(65535);
      let r = Uint16Array.from(s);
      expect(r.at(0)).assertEqual(0);
      expect(r.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_0600
     * @tc.name testUint16ArrayFromPart3_006
     * @tc.desc Verify Uint16Array 0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(0, 65535);
      let r = Uint16Array.from(src);
      expect(r.at(0)).assertEqual(0);
      expect(r.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_0700
     * @tc.name testUint16ArrayFromPart3_007
     * @tc.desc Verify Array<number> [] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [];
      let r = Uint16Array.from(fa);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_0800
     * @tc.name testUint16ArrayFromPart3_008
     * @tc.desc Verify Set<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      let r = Uint16Array.from(s);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_0900
     * @tc.name testUint16ArrayFromPart3_009
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = new Uint16Array(0);
      let r = Uint16Array.from(src);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_1000
     * @tc.name testUint16ArrayFromPart3_010
     * @tc.desc Verify Iterable<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      let r = Uint16Array.from(si);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_1100
     * @tc.name testUint16ArrayFromPart3_011
     * @tc.desc Verify Array<number> Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [42, 99];
      let an: Array<number> = [42.0, 99.0];
      let r1 = Uint16Array.from(fa);
      let r2 = Uint16Array.from(an);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.at(0)).assertEqual(r2.at(0));
      expect(r1.at(1)).assertEqual(r2.at(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_1200
     * @tc.name testUint16ArrayFromPart3_012
     * @tc.desc Verify Set<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(33);
      s.add(66);
      let src = Uint16Array.of(33, 66);
      let r1 = Uint16Array.from(s);
      let r2 = Uint16Array.from(src);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.at(0)).assertEqual(r2.at(0));
      expect(r1.at(1)).assertEqual(r2.at(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_1300
     * @tc.name testUint16ArrayFromPart3_013
     * @tc.desc Verify Array<number> Set<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [77, 88];
      let s = new Set<number>();
      s.add(77);
      s.add(88);
      let r1 = Uint16Array.from(fa);
      let r2 = Uint16Array.from(s);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.at(0)).assertEqual(r2.at(0));
      expect(r1.at(1)).assertEqual(r2.at(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_1400
     * @tc.name testUint16ArrayFromPart3_014
     * @tc.desc Verify Array<number> Iterable<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [11.0, 22.0];
      let si = new Set<number>();
      si.add(11.0);
      si.add(22.0);
      let r1 = Uint16Array.from(an);
      let r2 = Uint16Array.from(si);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.at(0)).assertEqual(r2.at(0));
      expect(r1.at(1)).assertEqual(r2.at(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_1500
     * @tc.name testUint16ArrayFromPart3_015
     * @tc.desc Verify Array<number> [32768] Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [32768];
      let an: Array<number> = [32768.0];
      let r1 = Uint16Array.from(fa);
      let r2 = Uint16Array.from(an);
      expect(r1.at(0)).assertEqual(32768);
      expect(r2.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_1600
     * @tc.name testUint16ArrayFromPart3_016
     * @tc.desc Verify Uint16Array.from maps Array<number> indices to values 1, 2, and 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(5, 6, 7), (v: number, k: number): number => { return k + 1; });
      expect(r.length).assertEqual(3);
      expect(r.at(0)).assertEqual(1);
      expect(r.at(1)).assertEqual(2);
      expect(r.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_1700
     * @tc.name testUint16ArrayFromPart3_017
     * @tc.desc Verify mapfn<U=number> number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [10.0, 20.0, 30.0];
      let r = Uint16Array.from(an, (v: number, k: number): number => { return v + 5.0; });
      expect(r.at(0)).assertEqual(15);
      expect(r.at(1)).assertEqual(25);
      expect(r.at(2)).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_1800
     * @tc.name testUint16ArrayFromPart3_018
     * @tc.desc Verify Iterable<number> mapfn mapfn +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(3.0);
      si.add(7.0);
      let r = Uint16Array.from(si, (v: number, k: number): number => { return v + 1.0; });
      expect(r.at(0)).assertEqual(4);
      expect(r.at(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_1900
     * @tc.name testUint16ArrayFromPart3_019
     * @tc.desc Verify Iterable<number> mapfn index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(100.0);
      si.add(200.0);
      let r = Uint16Array.from(si, (v: number, k: number): number => { return k * 10; });
      expect(r.at(0)).assertEqual(0);
      expect(r.at(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_2000
     * @tc.name testUint16ArrayFromPart3_020
     * @tc.desc Verify mapfn 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1];
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return 70000; });
      expect(r.at(0)).assertEqual(4464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_2100
     * @tc.name testUint16ArrayFromPart3_021
     * @tc.desc Verify mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return -1; });
      expect(r.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_2200
     * @tc.name testUint16ArrayFromPart3_022
     * @tc.desc Verify mapfn 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return 3.14; });
      expect(r.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_2300
     * @tc.name testUint16ArrayFromPart3_023
     * @tc.desc Verify mapfn NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return Number.NaN; });
      expect(r.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_2400
     * @tc.name testUint16ArrayFromPart3_024
     * @tc.desc Verify mapfn Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return Number.POSITIVE_INFINITY; });
      expect(r.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_2500
     * @tc.name testUint16ArrayFromPart3_025
     * @tc.desc Verify mapfn -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return -Number.POSITIVE_INFINITY; });
      expect(r.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_2600
     * @tc.name testUint16ArrayFromPart3_026
     * @tc.desc Verify mapfn 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return 65536; });
      expect(r.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_2700
     * @tc.name testUint16ArrayFromPart3_027
     * @tc.desc Verify Array<number> BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1];
      let r = Uint16Array.from(fa);
      expect(r.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_2800
     * @tc.name testUint16ArrayFromPart3_028
     * @tc.desc Verify Set<number> BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      let r = Uint16Array.from(s);
      expect(r.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_2900
     * @tc.name testUint16ArrayFromPart3_029
     * @tc.desc Verify Uint16Array BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1);
      let r = Uint16Array.from(src);
      expect(r.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_3000
     * @tc.name testUint16ArrayFromPart3_030
     * @tc.desc Verify Array<number> BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [1.0];
      let r = Uint16Array.from(an);
      expect(r.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_3100
     * @tc.name testUint16ArrayFromPart3_031
     * @tc.desc Verify Iterable<number> BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(1.0);
      let r = Uint16Array.from(si);
      expect(r.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_3200
     * @tc.name testUint16ArrayFromPart3_032
     * @tc.desc Verify Array<number> conversion returns a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1];
      let r = Uint16Array.from(fa);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_3300
     * @tc.name testUint16ArrayFromPart3_033
     * @tc.desc Verify Set<number> conversion returns a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      let r = Uint16Array.from(s);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_3400
     * @tc.name testUint16ArrayFromPart3_034
     * @tc.desc Verify Uint16Array conversion returns a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1);
      let r = Uint16Array.from(src);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_3500
     * @tc.name testUint16ArrayFromPart3_035
     * @tc.desc Verify Array<number> conversion returns a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [1.0];
      let r = Uint16Array.from(an);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_3600
     * @tc.name testUint16ArrayFromPart3_036
     * @tc.desc Verify Iterable<number> conversion returns a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(1.0);
      let r = Uint16Array.from(si);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_3700
     * @tc.name testUint16ArrayFromPart3_037
     * @tc.desc Verify Array<number> byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1, 2];
      let r = Uint16Array.from(fa);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_3800
     * @tc.name testUint16ArrayFromPart3_038
     * @tc.desc Verify Set<number> byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      s.add(2);
      let r = Uint16Array.from(s);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_3900
     * @tc.name testUint16ArrayFromPart3_039
     * @tc.desc Verify Uint16Array byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1, 2);
      let r = Uint16Array.from(src);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_4000
     * @tc.name testUint16ArrayFromPart3_040
     * @tc.desc Verify Array<number> byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [1.0, 2.0];
      let r = Uint16Array.from(an);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_4100
     * @tc.name testUint16ArrayFromPart3_041
     * @tc.desc Verify Iterable<number> byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(1.0);
      si.add(2.0);
      let r = Uint16Array.from(si);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_4200
     * @tc.name testUint16ArrayFromPart3_042
     * @tc.desc Verify Array<number> byteLength length * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [10, 20, 30];
      let r = Uint16Array.from(fa);
      expect(r.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_4300
     * @tc.name testUint16ArrayFromPart3_043
     * @tc.desc Verify Set<number> byteLength length * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(10);
      s.add(20);
      s.add(30);
      let r = Uint16Array.from(s);
      expect(r.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_4400
     * @tc.name testUint16ArrayFromPart3_044
     * @tc.desc Verify Uint16Array byteLength length * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(10, 20, 30);
      let r = Uint16Array.from(src);
      expect(r.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_4500
     * @tc.name testUint16ArrayFromPart3_045
     * @tc.desc Verify Array<number> byteLength length * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [10.0, 20.0, 30.0];
      let r = Uint16Array.from(an);
      expect(r.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_4600
     * @tc.name testUint16ArrayFromPart3_046
     * @tc.desc Verify Iterable<number> byteLength length * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(10.0);
      si.add(20.0);
      si.add(30.0);
      let r = Uint16Array.from(si);
      expect(r.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_4700
     * @tc.name testUint16ArrayFromPart3_047
     * @tc.desc Verify Array<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1];
      let r = Uint16Array.from(fa);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_4800
     * @tc.name testUint16ArrayFromPart3_048
     * @tc.desc Verify Set<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      let r = Uint16Array.from(s);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_4900
     * @tc.name testUint16ArrayFromPart3_049
     * @tc.desc Verify Uint16Array Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1);
      let r = Uint16Array.from(src);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_5000
     * @tc.name testUint16ArrayFromPart3_050
     * @tc.desc Verify Array<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [1.0];
      let r = Uint16Array.from(an);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_5100
     * @tc.name testUint16ArrayFromPart3_051
     * @tc.desc Verify Iterable<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(1.0);
      let r = Uint16Array.from(si);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_5200
     * @tc.name testUint16ArrayFromPart3_052
     * @tc.desc Verify Uint16Array.from maps Array<number> to a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return 1; });
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_5300
     * @tc.name testUint16ArrayFromPart3_053
     * @tc.desc Verify Iterable<number> mapfn Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(1.0);
      let r = Uint16Array.from(si, (v: number, k: number): number => { return v; });
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_5400
     * @tc.name testUint16ArrayFromPart3_054
     * @tc.desc Verify Array<number> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [100, 200, 300];
      let r = Uint16Array.from(fa);
      expect(r.toString()).assertEqual("100,200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_5500
     * @tc.name testUint16ArrayFromPart3_055
     * @tc.desc Verify Set<number> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(100);
      s.add(200);
      s.add(300);
      let r = Uint16Array.from(s);
      expect(r.toString()).assertEqual("100,200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_5600
     * @tc.name testUint16ArrayFromPart3_056
     * @tc.desc Verify Uint16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(100, 200, 300);
      let r = Uint16Array.from(src);
      expect(r.toString()).assertEqual("100,200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_5700
     * @tc.name testUint16ArrayFromPart3_057
     * @tc.desc Verify Array<number> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [100.0, 200.0, 300.0];
      let r = Uint16Array.from(an);
      expect(r.toString()).assertEqual("100,200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_5800
     * @tc.name testUint16ArrayFromPart3_058
     * @tc.desc Verify Iterable<number> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(100.0);
      si.add(200.0);
      si.add(300.0);
      let r = Uint16Array.from(si);
      expect(r.toString()).assertEqual("100,200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_5900
     * @tc.name testUint16ArrayFromPart3_059
     * @tc.desc Verify Array<number> valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1, 2];
      let r = Uint16Array.from(fa);
      expect(r.valueOf()).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_6000
     * @tc.name testUint16ArrayFromPart3_060
     * @tc.desc Verify Set<number> valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      s.add(2);
      let r = Uint16Array.from(s);
      expect(r.valueOf()).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_6100
     * @tc.name testUint16ArrayFromPart3_061
     * @tc.desc Verify Uint16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1, 2);
      let r = Uint16Array.from(src);
      expect(r.valueOf()).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_6200
     * @tc.name testUint16ArrayFromPart3_062
     * @tc.desc Verify Array<number> valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [1.0, 2.0];
      let r = Uint16Array.from(an);
      expect(r.valueOf()).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_6300
     * @tc.name testUint16ArrayFromPart3_063
     * @tc.desc Verify Iterable<number> valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(1.0);
      si.add(2.0);
      let r = Uint16Array.from(si);
      expect(r.valueOf()).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_6400
     * @tc.name testUint16ArrayFromPart3_064
     * @tc.desc Verify Array<number> join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [5, 10, 15];
      let r = Uint16Array.from(fa);
      expect(r.join()).assertEqual("5,10,15");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_6500
     * @tc.name testUint16ArrayFromPart3_065
     * @tc.desc Verify Set<number> join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(5);
      s.add(10);
      s.add(15);
      let r = Uint16Array.from(s);
      expect(r.join("|")).assertEqual("5|10|15");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_6600
     * @tc.name testUint16ArrayFromPart3_066
     * @tc.desc Verify Uint16Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(5, 10, 15);
      let r = Uint16Array.from(src);
      expect(r.join()).assertEqual(src.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_6700
     * @tc.name testUint16ArrayFromPart3_067
     * @tc.desc Verify mapfn Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Uint16Array.from(Array.of<number>(1, 2), (v: number, k: number): number => {
          throw new Error("mapfn error");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_6800
     * @tc.name testUint16ArrayFromPart3_068
     * @tc.desc Verify Iterable<number> mapfn Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let si = new Set<number>();
        si.add(1.0);
        si.add(2.0);
        Uint16Array.from(si, (v: number, k: number): number => {
          throw new Error("iter error");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_6900
     * @tc.name testUint16ArrayFromPart3_069
     * @tc.desc Verify from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => {
          throw new Error("abort");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_7000

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_7000
     * @tc.name testUint16ArrayFromPart3_070
     * @tc.desc Verify undefined mapfn result throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => {
          return undefined as number;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_7100
     * @tc.name testUint16ArrayFromPart3_071
     * @tc.desc Verify mapfn NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => {
        return Number.NaN;
      });
      expect(r.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_7200
     * @tc.name testUint16ArrayFromPart3_072
     * @tc.desc Verify with mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let called: boolean = false;
      Uint16Array.from([], (v: number, k: number): number => {
        called = true;
        return v;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_7300
     * @tc.name testUint16ArrayFromPart3_073
     * @tc.desc Verify Uint16Array from buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1, 2, 3);
      let r = Uint16Array.from(src);
      expect((r.buffer) !== (src.buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_7400
     * @tc.name testUint16ArrayFromPart3_074
     * @tc.desc Verify Uint16Array from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(10, 20, 30);
      let r = Uint16Array.from(src);
      expect(r.at(0)).assertEqual(src.at(0));
      expect(r.at(1)).assertEqual(src.at(1));
      expect(r.at(2)).assertEqual(src.at(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_7500
     * @tc.name testUint16ArrayFromPart3_075
     * @tc.desc Verify Array<number> from buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [5, 10];
      let r = Uint16Array.from(fa);
      let buf = r.buffer;
      expect(buf.byteLength > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_7600
     * @tc.name testUint16ArrayFromPart3_076
     * @tc.desc Verify Array<number> from buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [3.0, 6.0];
      let r = Uint16Array.from(an);
      let buf = r.buffer;
      expect(buf.byteLength > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_7700
     * @tc.name testUint16ArrayFromPart3_077
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(100, 200, 300);
      let r = Uint16Array.from(src);
      src[0] = 999;
      expect(r.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_7800
     * @tc.name testUint16ArrayFromPart3_078
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(100, 200, 300);
      let r = Uint16Array.from(src);
      r[0] = 888;
      expect(src.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_7900
     * @tc.name testUint16ArrayFromPart3_079
     * @tc.desc Verify from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1, 2];
      let r1 = Uint16Array.from(fa);
      let r2 = Uint16Array.from(fa);
      expect((r1.buffer) !== (r2.buffer)).assertTrue();
      expect(r1.at(0)).assertEqual(r2.at(0));
      expect(r1.at(1)).assertEqual(r2.at(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_8000
     * @tc.name testUint16ArrayFromPart3_080
     * @tc.desc Verify from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [10, 20];
      let r1 = Uint16Array.from(fa);
      let r2 = Uint16Array.from(fa);
      r1[0] = 99;
      expect(r2.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_8100
     * @tc.name testUint16ArrayFromPart3_081
     * @tc.desc Verify from Set<number> Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      s.add(2);
      let r = Uint16Array.from(s);
      s.add(3);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_8200
     * @tc.name testUint16ArrayFromPart3_082
     * @tc.desc Verify from Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [1.0, 2.0];
      let r = Uint16Array.from(an);
      an[0] = 999.0;
      expect(r.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_8300
     * @tc.name testUint16ArrayFromPart3_083
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [50, 60];
      let s = new Set<number>();
      s.add(50);
      s.add(60);
      let r1 = Uint16Array.from(fa);
      let r2 = Uint16Array.from(s);
      expect((r1.buffer) !== (r2.buffer)).assertTrue();
      expect(r1.at(0)).assertEqual(r2.at(0));
      expect(r1.at(1)).assertEqual(r2.at(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_8400
     * @tc.name testUint16ArrayFromPart3_084
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1, 2, 3, 4, 5);
      let r = Uint16Array.from(src);
      r[4] = 99;
      expect(src.at(4)).assertEqual(5);
      expect(r.at(4)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_8500
     * @tc.name testUint16ArrayFromPart3_085
     * @tc.desc Verify from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(255, 0, 65535);
      let r = Uint16Array.from(src);
      expect(r instanceof Uint16Array).assertTrue();
      expect(r.length).assertEqual(src.length);
      expect(r.byteLength).assertEqual(src.byteLength);
      expect((r.buffer) !== (src.buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_8600
     * @tc.name testUint16ArrayFromPart3_086
     * @tc.desc Verify from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [42];
      let src = Uint16Array.of(42);
      let an: Array<number> = [42.0];
      let r1 = Uint16Array.from(fa);
      let r2 = Uint16Array.from(src);
      let r3 = Uint16Array.from(an);
      expect(r1.at(0)).assertEqual(42);
      expect(r2.at(0)).assertEqual(42);
      expect(r3.at(0)).assertEqual(42);
      expect((r1.buffer) !== (r2.buffer)).assertTrue();
      expect((r2.buffer) !== (r3.buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_8700
     * @tc.name testUint16ArrayFromPart3_087
     * @tc.desc Verify from buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [];
      let src = new Uint16Array(0);
      let an: Array<number> = [];
      let r1 = Uint16Array.from(fa);
      let r2 = Uint16Array.from(src);
      let r3 = Uint16Array.from(an);
      expect(r1.length).assertEqual(0);
      expect(r2.length).assertEqual(0);
      expect(r3.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_8800
     * @tc.name testUint16ArrayFromPart3_088
     * @tc.desc Verify from with mapfn using index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [10, 20, 30, 40];
      let r = Uint16Array.from(arr, (v: number, k: number): number => k * 200);
      expect(r.at(0)).assertEqual(0);
      expect(r.at(1)).assertEqual(200);
      expect(r.at(3)).assertEqual(600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_8900
     * @tc.name testUint16ArrayFromPart3_089
     * @tc.desc Verify from array with 0xFFFF, 0x8000, 0x7FFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [0xFFFF, 0x8000, 0x7FFF];
      let r = Uint16Array.from(arr);
      expect(r.at(0)).assertEqual(65535);
      expect(r.at(1)).assertEqual(32768);
      expect(r.at(2)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_9000
     * @tc.name testUint16ArrayFromPart3_090
     * @tc.desc Verify from Set with duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      s.add(1);
      s.add(2);
      let r = Uint16Array.from(s);
      expect(r.length).assertEqual(2);
      expect(r.at(0)).assertEqual(1);
      expect(r.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_9100
     * @tc.name testUint16ArrayFromPart3_091
     * @tc.desc Verify from with mapfn on Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let r = Uint16Array.from(s, (v: number, k: number): number => v * 1000);
      expect(r.length).assertEqual(3);
      expect(r.at(0)).assertEqual(1000);
      expect(r.at(2)).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART3_9200
     * @tc.name testUint16ArrayFromPart3_092
     * @tc.desc Verify from with array containing floats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart3_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [1.9, 2.5, 3.1];
      let r = Uint16Array.from(arr);
      expect(r.at(0)).assertEqual(1);
      expect(r.at(1)).assertEqual(2);
      expect(r.at(2)).assertEqual(3);
    });

  });
}
