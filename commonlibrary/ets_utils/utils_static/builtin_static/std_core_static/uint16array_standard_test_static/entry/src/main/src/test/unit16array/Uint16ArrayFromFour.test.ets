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

export default function uint16ArrayFrom04Test(): void {
  describe('Uint16ArrayFrom04Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_0100
     * @tc.name testUint16ArrayFromFour001
     * @tc.desc Verify Array<number> from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [10, 20, 30];
      let r = Uint16Array.from(fa);
      expect(r.length).assertEqual(3);
      expect(r.at(0)).assertEqual(10);
      expect(r.at(1)).assertEqual(20);
      expect(r.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_0200
     * @tc.name testUint16ArrayFromFour002
     * @tc.desc Verify Set<number> from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(100);
      s.add(200);
      let r = Uint16Array.from(s);
      expect(r.length).assertEqual(2);
      expect(r.at(0)).assertEqual(100);
      expect(r.at(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_0300
     * @tc.name testUint16ArrayFromFour003
     * @tc.desc Verify Uint16Array from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(50, 150, 250);
      let r = Uint16Array.from(src);
      expect(r.length).assertEqual(3);
      expect(r.at(0)).assertEqual(50);
      expect(r.at(1)).assertEqual(150);
      expect(r.at(2)).assertEqual(250);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_0400
     * @tc.name testUint16ArrayFromFour004
     * @tc.desc Verify Uint16Array.from converts Set<number> values without a map function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(7.0);
      si.add(8.0);
      let r = Uint16Array.from(si);
      expect(r.length).assertEqual(2);
      expect(r.at(0)).assertEqual(7);
      expect(r.at(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_0500
     * @tc.name testUint16ArrayFromFour005
     * @tc.desc Verify Set<number> {0, 65535}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(0);
      s.add(65535);
      let r = Uint16Array.from(s);
      expect(r.at(0)).assertEqual(0);
      expect(r.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_0600
     * @tc.name testUint16ArrayFromFour006
     * @tc.desc Verify Uint16Array 0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(0, 65535);
      let r = Uint16Array.from(src);
      expect(r.at(0)).assertEqual(0);
      expect(r.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_0700
     * @tc.name testUint16ArrayFromFour007
     * @tc.desc Verify Array<number> [] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [];
      let r = Uint16Array.from(fa);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_0800
     * @tc.name testUint16ArrayFromFour008
     * @tc.desc Verify Set<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      let r = Uint16Array.from(s);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_0900
     * @tc.name testUint16ArrayFromFour009
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = new Uint16Array(0);
      let r = Uint16Array.from(src);
      expect(r.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_1100
     * @tc.name testUint16ArrayFromFour011
     * @tc.desc Verify Array<number> Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [42, 99];
      let an: Array<number> = [42.0, 99.0];
      let r1 = Uint16Array.from(fa);
      let r2 = Uint16Array.from(an);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.at(0)).assertEqual(r2.at(0));
      expect(r1.at(1)).assertEqual(r2.at(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_1200
     * @tc.name testUint16ArrayFromFour012
     * @tc.desc Verify Set<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_1300
     * @tc.name testUint16ArrayFromFour013
     * @tc.desc Verify Array<number> Set<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_1400
     * @tc.name testUint16ArrayFromFour014
     * @tc.desc Verify Array<number> Iterable<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_1500
     * @tc.name testUint16ArrayFromFour015
     * @tc.desc Verify Array<number> [32768] Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [32768];
      let an: Array<number> = [32768.0];
      let r1 = Uint16Array.from(fa);
      let r2 = Uint16Array.from(an);
      expect(r1.at(0)).assertEqual(32768);
      expect(r2.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_1600
     * @tc.name testUint16ArrayFromFour016
     * @tc.desc Verify Uint16Array.from maps Array<number> indices to values 1, 2, and 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(5, 6, 7), (v: number, k: number): number => { return k + 1; });
      expect(r.length).assertEqual(3);
      expect(r.at(0)).assertEqual(1);
      expect(r.at(1)).assertEqual(2);
      expect(r.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_1700
     * @tc.name testUint16ArrayFromFour017
     * @tc.desc Verify mapfn<U=number> number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [10.0, 20.0, 30.0];
      let r = Uint16Array.from(an, (v: number, k: number): number => { return v + 5.0; });
      expect(r.at(0)).assertEqual(15);
      expect(r.at(1)).assertEqual(25);
      expect(r.at(2)).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_1800
     * @tc.name testUint16ArrayFromFour018
     * @tc.desc Verify Iterable<number> mapfn mapfn +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(3.0);
      si.add(7.0);
      let r = Uint16Array.from(si, (v: number, k: number): number => { return v + 1.0; });
      expect(r.at(0)).assertEqual(4);
      expect(r.at(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_1900
     * @tc.name testUint16ArrayFromFour019
     * @tc.desc Verify Iterable<number> mapfn index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(100.0);
      si.add(200.0);
      let r = Uint16Array.from(si, (v: number, k: number): number => { return k * 10; });
      expect(r.at(0)).assertEqual(0);
      expect(r.at(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_2000
     * @tc.name testUint16ArrayFromFour020
     * @tc.desc Verify mapfn 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1];
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return 70000; });
      expect(r.at(0)).assertEqual(4464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_2100
     * @tc.name testUint16ArrayFromFour021
     * @tc.desc Verify mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return -1; });
      expect(r.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_2200
     * @tc.name testUint16ArrayFromFour022
     * @tc.desc Verify mapfn 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return 3.14; });
      expect(r.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_2300
     * @tc.name testUint16ArrayFromFour023
     * @tc.desc Verify mapfn NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return Number.NaN; });
      expect(r.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_2400
     * @tc.name testUint16ArrayFromFour024
     * @tc.desc Verify mapfn Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return Number.POSITIVE_INFINITY; });
      expect(r.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_2500
     * @tc.name testUint16ArrayFromFour025
     * @tc.desc Verify mapfn -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return -Number.POSITIVE_INFINITY; });
      expect(r.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_2600
     * @tc.name testUint16ArrayFromFour026
     * @tc.desc Verify mapfn 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return 65536; });
      expect(r.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_2700
     * @tc.name testUint16ArrayFromFour027
     * @tc.desc Verify Array<number> BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1];
      let r = Uint16Array.from(fa);
      expect(r.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_2800
     * @tc.name testUint16ArrayFromFour028
     * @tc.desc Verify Set<number> BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      let r = Uint16Array.from(s);
      expect(r.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_2900
     * @tc.name testUint16ArrayFromFour029
     * @tc.desc Verify Uint16Array BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1);
      let r = Uint16Array.from(src);
      expect(r.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_3000
     * @tc.name testUint16ArrayFromFour030
     * @tc.desc Verify Array<number> BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [1.0];
      let r = Uint16Array.from(an);
      expect(r.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_3100
     * @tc.name testUint16ArrayFromFour031
     * @tc.desc Verify Iterable<number> BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(1.0);
      let r = Uint16Array.from(si);
      expect(r.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_3200
     * @tc.name testUint16ArrayFromFour032
     * @tc.desc Verify Array<number> conversion returns a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1];
      let r = Uint16Array.from(fa);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_3300
     * @tc.name testUint16ArrayFromFour033
     * @tc.desc Verify Set<number> conversion returns a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      let r = Uint16Array.from(s);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_3400
     * @tc.name testUint16ArrayFromFour034
     * @tc.desc Verify Uint16Array conversion returns a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1);
      let r = Uint16Array.from(src);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_3500
     * @tc.name testUint16ArrayFromFour035
     * @tc.desc Verify Array<number> conversion returns a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [1.0];
      let r = Uint16Array.from(an);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_3600
     * @tc.name testUint16ArrayFromFour036
     * @tc.desc Verify Iterable<number> conversion returns a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(1.0);
      let r = Uint16Array.from(si);
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_3700
     * @tc.name testUint16ArrayFromFour037
     * @tc.desc Verify Array<number> byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1, 2];
      let r = Uint16Array.from(fa);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_3800
     * @tc.name testUint16ArrayFromFour038
     * @tc.desc Verify Set<number> byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      s.add(2);
      let r = Uint16Array.from(s);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_3900
     * @tc.name testUint16ArrayFromFour039
     * @tc.desc Verify Uint16Array byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1, 2);
      let r = Uint16Array.from(src);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_4000
     * @tc.name testUint16ArrayFromFour040
     * @tc.desc Verify Array<number> byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [1.0, 2.0];
      let r = Uint16Array.from(an);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_4100
     * @tc.name testUint16ArrayFromFour041
     * @tc.desc Verify Iterable<number> byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(1.0);
      si.add(2.0);
      let r = Uint16Array.from(si);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_4200
     * @tc.name testUint16ArrayFromFour042
     * @tc.desc Verify Array<number> byteLength length * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [10, 20, 30];
      let r = Uint16Array.from(fa);
      expect(r.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_4300
     * @tc.name testUint16ArrayFromFour043
     * @tc.desc Verify Set<number> byteLength length * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(10);
      s.add(20);
      s.add(30);
      let r = Uint16Array.from(s);
      expect(r.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_4400
     * @tc.name testUint16ArrayFromFour044
     * @tc.desc Verify Uint16Array byteLength length * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(10, 20, 30);
      let r = Uint16Array.from(src);
      expect(r.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_4500
     * @tc.name testUint16ArrayFromFour045
     * @tc.desc Verify Array<number> byteLength length * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [10.0, 20.0, 30.0];
      let r = Uint16Array.from(an);
      expect(r.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_4600
     * @tc.name testUint16ArrayFromFour046
     * @tc.desc Verify Iterable<number> byteLength length * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(10.0);
      si.add(20.0);
      si.add(30.0);
      let r = Uint16Array.from(si);
      expect(r.byteLength).assertEqual(6);
    });






    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_5200
     * @tc.name testUint16ArrayFromFour052
     * @tc.desc Verify Uint16Array.from maps Array<number> to a Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r = Uint16Array.from(Array.of<number>(1), (v: number, k: number): number => { return 1; });
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_5300
     * @tc.name testUint16ArrayFromFour053
     * @tc.desc Verify Iterable<number> mapfn Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(1.0);
      let r = Uint16Array.from(si, (v: number, k: number): number => { return v; });
      expect(r instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_5400
     * @tc.name testUint16ArrayFromFour054
     * @tc.desc Verify Array<number> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [100, 200, 300];
      let r = Uint16Array.from(fa);
      expect(r.toString()).assertEqual("100,200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_5500
     * @tc.name testUint16ArrayFromFour055
     * @tc.desc Verify Set<number> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(100);
      s.add(200);
      s.add(300);
      let r = Uint16Array.from(s);
      expect(r.toString()).assertEqual("100,200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_5600
     * @tc.name testUint16ArrayFromFour056
     * @tc.desc Verify Uint16Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(100, 200, 300);
      let r = Uint16Array.from(src);
      expect(r.toString()).assertEqual("100,200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_5700
     * @tc.name testUint16ArrayFromFour057
     * @tc.desc Verify Array<number> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [100.0, 200.0, 300.0];
      let r = Uint16Array.from(an);
      expect(r.toString()).assertEqual("100,200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_5800
     * @tc.name testUint16ArrayFromFour058
     * @tc.desc Verify Iterable<number> toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(100.0);
      si.add(200.0);
      si.add(300.0);
      let r = Uint16Array.from(si);
      expect(r.toString()).assertEqual("100,200,300");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_5900
     * @tc.name testUint16ArrayFromFour059
     * @tc.desc Verify Array<number> valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1, 2];
      let r = Uint16Array.from(fa);
      expect(r.valueOf()).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_6000
     * @tc.name testUint16ArrayFromFour060
     * @tc.desc Verify Set<number> valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      s.add(2);
      let r = Uint16Array.from(s);
      expect(r.valueOf()).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_6100
     * @tc.name testUint16ArrayFromFour061
     * @tc.desc Verify Uint16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1, 2);
      let r = Uint16Array.from(src);
      expect(r.valueOf()).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_6200
     * @tc.name testUint16ArrayFromFour062
     * @tc.desc Verify Array<number> valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [1.0, 2.0];
      let r = Uint16Array.from(an);
      expect(r.valueOf()).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_6300
     * @tc.name testUint16ArrayFromFour063
     * @tc.desc Verify Iterable<number> valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let si = new Set<number>();
      si.add(1.0);
      si.add(2.0);
      let r = Uint16Array.from(si);
      expect(r.valueOf()).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_6400
     * @tc.name testUint16ArrayFromFour064
     * @tc.desc Verify Array<number> join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [5, 10, 15];
      let r = Uint16Array.from(fa);
      expect(r.join()).assertEqual("5,10,15");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_6500
     * @tc.name testUint16ArrayFromFour065
     * @tc.desc Verify Set<number> join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(5);
      s.add(10);
      s.add(15);
      let r = Uint16Array.from(s);
      expect(r.join("|")).assertEqual("5|10|15");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_6600
     * @tc.name testUint16ArrayFromFour066
     * @tc.desc Verify Uint16Array join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(5, 10, 15);
      let r = Uint16Array.from(src);
      expect(r.join()).assertEqual(src.join());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_6700
     * @tc.name testUint16ArrayFromFour067
     * @tc.desc Verify mapfn Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_6800
     * @tc.name testUint16ArrayFromFour068
     * @tc.desc Verify Iterable<number> mapfn Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_6900
     * @tc.name testUint16ArrayFromFour069
     * @tc.desc Verify from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_7000
     * @tc.name testUint16ArrayFromFour070
     * @tc.desc Verify undefined mapfn result throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_7200
     * @tc.name testUint16ArrayFromFour072
     * @tc.desc Verify with mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let called: boolean = false;
      Uint16Array.from([], (v: number, k: number): number => {
        called = true;
        return v;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_7300
     * @tc.name testUint16ArrayFromFour073
     * @tc.desc Verify Uint16Array from buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1, 2, 3);
      let r = Uint16Array.from(src);
      expect((r.buffer) !== (src.buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_7400
     * @tc.name testUint16ArrayFromFour074
     * @tc.desc Verify Uint16Array from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(10, 20, 30);
      let r = Uint16Array.from(src);
      expect(r.at(0)).assertEqual(src.at(0));
      expect(r.at(1)).assertEqual(src.at(1));
      expect(r.at(2)).assertEqual(src.at(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_7500
     * @tc.name testUint16ArrayFromFour075
     * @tc.desc Verify Array<number> from buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [5, 10];
      let r = Uint16Array.from(fa);
      let buf = r.buffer;
      expect(buf.byteLength > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_7600
     * @tc.name testUint16ArrayFromFour076
     * @tc.desc Verify Array<number> from buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [3.0, 6.0];
      let r = Uint16Array.from(an);
      let buf = r.buffer;
      expect(buf.byteLength > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_7700
     * @tc.name testUint16ArrayFromFour077
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(100, 200, 300);
      let r = Uint16Array.from(src);
      src[0] = 999;
      expect(r.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_7800
     * @tc.name testUint16ArrayFromFour078
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(100, 200, 300);
      let r = Uint16Array.from(src);
      r[0] = 888;
      expect(src.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_7900
     * @tc.name testUint16ArrayFromFour079
     * @tc.desc Verify from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [1, 2];
      let r1 = Uint16Array.from(fa);
      let r2 = Uint16Array.from(fa);
      expect((r1.buffer) !== (r2.buffer)).assertTrue();
      expect(r1.at(0)).assertEqual(r2.at(0));
      expect(r1.at(1)).assertEqual(r2.at(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_8000
     * @tc.name testUint16ArrayFromFour080
     * @tc.desc Verify from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fa: Array<number> = [10, 20];
      let r1 = Uint16Array.from(fa);
      let r2 = Uint16Array.from(fa);
      r1[0] = 99;
      expect(r2.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_8100
     * @tc.name testUint16ArrayFromFour081
     * @tc.desc Verify from Set<number> Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s = new Set<number>();
      s.add(1);
      s.add(2);
      let r = Uint16Array.from(s);
      s.add(3);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_8200
     * @tc.name testUint16ArrayFromFour082
     * @tc.desc Verify from Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let an: Array<number> = [1.0, 2.0];
      let r = Uint16Array.from(an);
      an[0] = 999.0;
      expect(r.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_8300
     * @tc.name testUint16ArrayFromFour083
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_8400
     * @tc.name testUint16ArrayFromFour084
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(1, 2, 3, 4, 5);
      let r = Uint16Array.from(src);
      r[4] = 99;
      expect(src.at(4)).assertEqual(5);
      expect(r.at(4)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_8500
     * @tc.name testUint16ArrayFromFour085
     * @tc.desc Verify from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src = Uint16Array.of(255, 0, 65535);
      let r = Uint16Array.from(src);
      expect(r instanceof Uint16Array).assertTrue();
      expect(r.length).assertEqual(src.length);
      expect(r.byteLength).assertEqual(src.byteLength);
      expect((r.buffer) !== (src.buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_8600
     * @tc.name testUint16ArrayFromFour086
     * @tc.desc Verify from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_8700
     * @tc.name testUint16ArrayFromFour087
     * @tc.desc Verify from buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_8800
     * @tc.name testUint16ArrayFromFour088
     * @tc.desc Verify from with mapfn using index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [10, 20, 30, 40];
      let r = Uint16Array.from(arr, (v: number, k: number): number => k * 200);
      expect(r.at(0)).assertEqual(0);
      expect(r.at(1)).assertEqual(200);
      expect(r.at(3)).assertEqual(600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_8900
     * @tc.name testUint16ArrayFromFour089
     * @tc.desc Verify from array with 0xFFFF, 0x8000, 0x7FFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [0xFFFF, 0x8000, 0x7FFF];
      let r = Uint16Array.from(arr);
      expect(r.at(0)).assertEqual(65535);
      expect(r.at(1)).assertEqual(32768);
      expect(r.at(2)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_9000
     * @tc.name testUint16ArrayFromFour090
     * @tc.desc Verify from Set with duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_9100
     * @tc.name testUint16ArrayFromFour091
     * @tc.desc Verify from with mapfn on Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_FOUR_9200
     * @tc.name testUint16ArrayFromFour092
     * @tc.desc Verify from with array containing floats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromFour092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [1.9, 2.5, 3.1];
      let r = Uint16Array.from(arr);
      expect(r.at(0)).assertEqual(1);
      expect(r.at(1)).assertEqual(2);
      expect(r.at(2)).assertEqual(3);
    });

  });
}
