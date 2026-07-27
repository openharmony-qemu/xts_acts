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

export default function uint16ArraySet05Test(): void {
  describe('Uint16ArraySet05Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_0100
     * @tc.name testUint16ArraySet05Test001
      * @tc.desc Verify an ArrayLike source copies three values using the default offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2, 3]);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
      expect(target[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_0200
     * @tc.name testUint16ArraySet05Test002
      * @tc.desc Verify an ArrayLike source writes two values at offset one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2], 1);
      expect(target[1]).assertEqual(1);
      expect(target[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_0300
     * @tc.name testUint16ArraySet05Test003
      * @tc.desc Verify a nonempty ArrayLike writes values from explicit offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([10, 20, 30], 0);
      expect(target[0]).assertEqual(10);
      expect(target[1]).assertEqual(20);
      expect(target[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_0400
     * @tc.name testUint16ArraySet05Test004
      * @tc.desc Verify an empty ArrayLike at offset zero leaves the target unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_0500
     * @tc.name testUint16ArraySet05Test005
      * @tc.desc Verify an empty ArrayLike is accepted at offset three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([], 3);
      expect(target[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_0600
     * @tc.name testUint16ArraySet05Test006
      * @tc.desc Verify a single ArrayLike value writes at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([42], 0);
      expect(target[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_0700
     * @tc.name testUint16ArraySet05Test007
      * @tc.desc Verify a three-element ArrayLike fits exactly from offset two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2, 3], 2);
      expect(target[2]).assertEqual(1);
      expect(target[3]).assertEqual(2);
      expect(target[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_0800
     * @tc.name testUint16ArraySet05Test008
      * @tc.desc Verify a single ArrayLike value writes at the last target index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([99], 4);
      expect(target[4]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_0900
     * @tc.name testUint16ArraySet05Test009
      * @tc.desc Verify an ArrayLike preserves zero at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([0], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_1000
     * @tc.name testUint16ArraySet05Test010
      * @tc.desc Verify an ArrayLike preserves the Uint16 maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([65535], 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_1100
     * @tc.name testUint16ArraySet05Test011
      * @tc.desc Verify an ArrayLike preserves the Uint16 midpoint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([32768], 0);
      expect(target[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_1200
     * @tc.name testUint16ArraySet05Test012
      * @tc.desc Verify an ArrayLike copies a mixed sequence of Uint16 boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([0, 65535, 32768, 0, 65535], 0);
      expect(target[0]).assertEqual(0);
      expect(target[1]).assertEqual(65535);
      expect(target[2]).assertEqual(32768);
      expect(target[3]).assertEqual(0);
      expect(target[4]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_1300
     * @tc.name testUint16ArraySet05Test013
      * @tc.desc Verify an ArrayLike converts hexadecimal 0xFFFF to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([0xFFFF], 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_1400
     * @tc.name testUint16ArraySet05Test014
      * @tc.desc Verify an ArrayLike converts hexadecimal 0x7FFF to 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([0x7FFF], 0);
      expect(target[0]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_1500
     * @tc.name testUint16ArraySet05Test015
      * @tc.desc Verify an ArrayLike converts the binary Uint16 maximum to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([0b1111111111111111], 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_1600
     * @tc.name testUint16ArraySet05Test016
      * @tc.desc Verify an ArrayLike converts scientific notation 1e4 to 10000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1e4], 0);
      expect(target[0]).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_1700
     * @tc.name testUint16ArraySet05Test017
      * @tc.desc Verify an ArrayLike wraps 65536 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([65536], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_1800
     * @tc.name testUint16ArraySet05Test018
      * @tc.desc Verify an ArrayLike write preserves the target length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2], 0);
      expect(target.length).assertEqual(5);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_1900
     * @tc.name testUint16ArraySet05Test019
      * @tc.desc Verify an ArrayLike wraps negative one to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([-1], 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_2000
     * @tc.name testUint16ArraySet05Test020
      * @tc.desc Verify an ArrayLike writes [1, 2] starting at offset two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2], 2);
      expect(target[2]).assertEqual(1);
      expect(target[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_2100
     * @tc.name testUint16ArraySet05Test021
      * @tc.desc Verify an ArrayLike writes two values at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2], 0);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_2200
     * @tc.name testUint16ArraySet05Test022
      * @tc.desc Verify offset one preserves the target prefix before an ArrayLike write
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2], 1);
      expect(target[1]).assertEqual(1);
      expect(target[2]).assertEqual(2);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_2300
     * @tc.name testUint16ArraySet05Test023
      * @tc.desc Verify a two-element ArrayLike fits exactly at offset three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2], 3);
      expect(target[3]).assertEqual(1);
      expect(target[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_2400
     * @tc.name testUint16ArraySet05Test024
      * @tc.desc Verify a negative ArrayLike offset throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1], -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_2500
     * @tc.name testUint16ArraySet05Test025
      * @tc.desc Verify a nonempty ArrayLike at target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1], 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_2600
     * @tc.name testUint16ArraySet05Test026
      * @tc.desc Verify an ArrayLike offset beyond target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1], 6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_2700
     * @tc.name testUint16ArraySet05Test027
      * @tc.desc Verify an ArrayLike offset equal to negative target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1], -5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_2800
     * @tc.name testUint16ArraySet05Test028
      * @tc.desc Verify an ArrayLike offset below negative target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1], -6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_2900
     * @tc.name testUint16ArraySet05Test029
      * @tc.desc Verify a distant positive ArrayLike offset throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1], 999999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_3000
     * @tc.name testUint16ArraySet05Test030
      * @tc.desc Verify an ArrayLike exceeding remaining capacity at offset four throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1, 2, 3], 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_3100
     * @tc.name testUint16ArraySet05Test031
      * @tc.desc Verify an ArrayLike source larger than remaining capacity throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      try {
        target.set([1, 2, 3, 4], 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_3200
     * @tc.name testUint16ArraySet05Test032
      * @tc.desc Verify a five-element ArrayLike cannot fit in a two-element target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(2);
      try {
        target.set([1, 2, 3, 4, 5], 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_3300
     * @tc.name testUint16ArraySet05Test033
      * @tc.desc Verify an ArrayLike wraps hexadecimal 0x10000 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([0x10000], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_3400
     * @tc.name testUint16ArraySet05Test034
      * @tc.desc Verify an ArrayLike truncates 3.14 to three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([3.14], 0);
      expect(target[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_3500
     * @tc.name testUint16ArraySet05Test035
      * @tc.desc Verify an ArrayLike truncates 65535.9 to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([65535.9], 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_3600
     * @tc.name testUint16ArraySet05Test036
      * @tc.desc Verify an ArrayLike truncates negative 0.5 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([-0.5], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_3700
     * @tc.name testUint16ArraySet05Test037
      * @tc.desc Verify an ArrayLike converts positive infinity to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([Number.POSITIVE_INFINITY], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_3800
     * @tc.name testUint16ArraySet05Test038
      * @tc.desc Verify an ArrayLike converts negative infinity to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([-Number.POSITIVE_INFINITY], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_3900
     * @tc.name testUint16ArraySet05Test039
      * @tc.desc Verify an ArrayLike converts NaN to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([Number.NaN], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_4000
     * @tc.name testUint16ArraySet05Test040
      * @tc.desc Verify an ArrayLike wraps negative 32768 to 32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([-32768], 0);
      expect(target[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_4100
     * @tc.name testUint16ArraySet05Test041
      * @tc.desc Verify an ArrayLike wraps 65537 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([65537], 0);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_4200
     * @tc.name testUint16ArraySet05Test042
      * @tc.desc Verify an ArrayLike wraps two Uint16 periods to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([65536 * 2], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_4300
     * @tc.name testUint16ArraySet05Test043
      * @tc.desc Verify an ArrayLike wraps negative 65535 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([-65535], 0);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_4400
     * @tc.name testUint16ArraySet05Test044
      * @tc.desc Verify an ArrayLike preserves the value one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1], 0);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_4500
     * @tc.name testUint16ArraySet05Test045
      * @tc.desc Verify an ArrayLike preserves the value 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([32767], 0);
      expect(target[0]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_4600
     * @tc.name testUint16ArraySet05Test046
     * @tc.desc Verify ArrayLike default offset writes all supplied values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      t.set([1, 2, 3]);
      expect(t.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_4700
     * @tc.name testUint16ArraySet05Test047
     * @tc.desc Verify ArrayLike explicit offset preserves both outer regions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(9, 9, 9, 9, 9);
      t.set([1, 2], 2);
      expect(t.join(',')).assertEqual('9,9,1,2,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_4800
     * @tc.name testUint16ArraySet05Test048
     * @tc.desc Verify ArrayLike numeric conversion combines truncation and wrapping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(5);
      t.set([-1.8, 0.9, 65536.4, 65537.9, 32768.2]);
      expect(t.join(',')).assertEqual('65535,0,0,1,32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_4900
     * @tc.name testUint16ArraySet05Test049
     * @tc.desc Verify empty ArrayLike at a nonzero offset leaves target content intact
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(3, 4, 5);
      const s: Array<number> = [];
      t.set(s, 2);
      expect(t.join(',')).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_5000
     * @tc.name testUint16ArraySet05Test050
     * @tc.desc Verify ArrayLike writes into a nonzero target view and backing array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(12);
      const all: Uint16Array = new Uint16Array(b);
      all.fill(8);
      const t: Uint16Array = new Uint16Array(b, 4, 3);
      t.set([1, 2], 1);
      expect(t.join(',')).assertEqual('8,1,2');
      expect(all.join(',')).assertEqual('8,8,8,1,2,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_5100
     * @tc.name testUint16ArraySet05Test051
     * @tc.desc Verify ArrayLike offset equal to length raises precise RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(4, 5, 6);
      try {
        t.set([1], 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('4,5,6');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_5200
     * @tc.name testUint16ArraySet05Test052
     * @tc.desc Verify ArrayLike negative offset raises precise RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(4, 5, 6);
      try {
        t.set([1], -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('4,5,6');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_5300
     * @tc.name testUint16ArraySet05Test053
     * @tc.desc Verify ArrayLike oversized source raises precise RangeError atomically
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(7, 7, 7);
      try {
        t.set([1, 2, 3], 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('7,7,7');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_5400
     * @tc.name testUint16ArraySet05Test054
     * @tc.desc Verify ArrayLike distant offset raises precise RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(7, 7);
      try {
        t.set([1], 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('7,7');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_5500
     * @tc.name testUint16ArraySet05Test055
     * @tc.desc Verify ArrayLike validation completes before any element is stored
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(6, 6);
      try {
        t.set([1, 2, 3], 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('6,6');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_5600
     * @tc.name testUint16ArraySet05Test056
     * @tc.desc Verify ArrayLike stores repeated values in their original order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(6);
      t.set([2, 2, 3, 3], 1);
      expect(t.join(',')).assertEqual('0,2,2,3,3,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_5700
     * @tc.name testUint16ArraySet05Test057
     * @tc.desc Verify ArrayLike source can fill the exact remaining capacity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(9, 9, 9, 9);
      t.set([4, 5, 6], 1);
      expect(t.join(',')).assertEqual('9,4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_5800
     * @tc.name testUint16ArraySet05Test058
     * @tc.desc Verify ArrayLike source values are captured independently of later source changes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [1, 2, 3];
      const t: Uint16Array = new Uint16Array(3);
      t.set(s);
      s[1] = 22;
      expect(t.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_5900
     * @tc.name testUint16ArraySet05Test059
     * @tc.desc Verify ArrayLike writes a single value at the last index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(1, 2, 3);
      t.set([65535], 2);
      expect(t.join(',')).assertEqual('1,2,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_6000
     * @tc.name testUint16ArraySet05Test060
     * @tc.desc Verify ArrayLike converts nonfinite numbers to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      t.set([Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      expect(t.join(',')).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_6100
     * @tc.name testUint16ArraySet05Test061
     * @tc.desc Verify ArrayLike wraps multiple Uint16 periods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      t.set([131072, 131073, -131073]);
      expect(t.join(',')).assertEqual('0,1,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_6200
     * @tc.name testUint16ArraySet05Test062
     * @tc.desc Verify ArrayLike target view boundary is enforced independently of backing capacity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(12);
      const t: Uint16Array = new Uint16Array(b, 2, 2);
      try {
        t.set([1, 2], 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(new Uint16Array(b).join(',')).assertEqual('0,0,0,0,0,0');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_6300
     * @tc.name testUint16ArraySet05Test063
     * @tc.desc Verify ArrayLike writes are visible through a full backing view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      const t: Uint16Array = new Uint16Array(b, 2, 2);
      t.set([12, 34]);
      expect(new Uint16Array(b).join(',')).assertEqual('0,12,34,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_6400
     * @tc.name testUint16ArraySet05Test064
     * @tc.desc Verify ArrayLike empty source is accepted at target length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(1, 2);
      const s: Array<number> = [];
      t.set(s, 2);
      expect(t.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_6500
     * @tc.name testUint16ArraySet05Test065
     * @tc.desc Verify ArrayLike conversion occurs for every source element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(4);
      t.set([1.1, 2.9, -3.1, 65539.8]);
      expect(t.join(',')).assertEqual('1,2,65533,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_6600
     * @tc.name testUint16ArraySet05Test066
     * @tc.desc Verify ArrayLike write preserves target buffer identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      const b: ArrayBuffer = t.buffer;
      t.set([7, 8], 1);
      expect(t.buffer).assertEqual(b);
      expect(t.join(',')).assertEqual('0,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_6700
     * @tc.name testUint16ArraySet05Test067
     * @tc.desc Verify ArrayLike write preserves target view dimensions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(new ArrayBuffer(10), 2, 3);
      t.set([1], 2);
      expect(t.byteOffset).assertEqual(2);
      expect(t.byteLength).assertEqual(6);
      expect(t.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_6800
     * @tc.name testUint16ArraySet05Test068
     * @tc.desc Verify ArrayLike source can be an Array number variable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [5.5, 6.5];
      const t: Uint16Array = new Uint16Array(3);
      t.set(s, 1);
      expect(t.join(',')).assertEqual('0,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_6900
     * @tc.name testUint16ArraySet05Test069
     * @tc.desc Verify ArrayLike source can overwrite a previous ArrayLike range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(4);
      t.set([1, 2, 3, 4]);
      t.set([8, 9], 1);
      expect(t.join(',')).assertEqual('1,8,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_7000
     * @tc.name testUint16ArraySet05Test070
     * @tc.desc Verify ArrayLike source respects target subarray indexing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const all: Uint16Array = Uint16Array.of(9, 9, 9, 9, 9);
      const t: Uint16Array = all.subarray(1, 4);
      t.set([1, 2], 1);
      expect(all.join(',')).assertEqual('9,9,1,2,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_7100
     * @tc.name testUint16ArraySet05Test071
     * @tc.desc Verify ArrayLike source writes zero over existing nonzero content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(8, 8, 8);
      t.set([0, 0], 1);
      expect(t.join(',')).assertEqual('8,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_7200
     * @tc.name testUint16ArraySet05Test072
     * @tc.desc Verify ArrayLike source preserves untouched suffix after a short write
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      t.set([9], 0);
      expect(t.join(',')).assertEqual('9,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_7300
     * @tc.name testUint16ArraySet05Test073
     * @tc.desc Verify ArrayLike source preserves untouched prefix before a late write
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(1, 2, 3, 4);
      t.set([9], 3);
      expect(t.join(',')).assertEqual('1,2,3,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_7400
     * @tc.name testUint16ArraySet05Test074
     * @tc.desc Verify ArrayLike source writes at legal offset one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(1, 2, 3);
      t.set([9], 1);
      expect(t.join(',')).assertEqual('1,9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_7500
     * @tc.name testUint16ArraySet05Test075
     * @tc.desc Verify ArrayLike source containing Uint16 boundaries is stored exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(4);
      t.set([0, 1, 32768, 65535]);
      expect(t.join(',')).assertEqual('0,1,32768,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_7600
     * @tc.name testUint16ArraySet05Test076
     * @tc.desc Verify ArrayLike source works with a zero-length target only when empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array();
      const s: Array<number> = [];
      t.set(s);
      expect(t.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_7700
     * @tc.name testUint16ArraySet05Test077
     * @tc.desc Verify ArrayLike nonempty source is rejected by a zero-length target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array();
      try {
        t.set([1]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET05_7800
     * @tc.name testUint16ArraySet05Test078
     * @tc.desc Verify ArrayLike source preserves decimal ordering after conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySet05Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      t.set([10.9, 2.9, 30.1]);
      expect(t.join(',')).assertEqual('10,2,30');
    });
  });
}
