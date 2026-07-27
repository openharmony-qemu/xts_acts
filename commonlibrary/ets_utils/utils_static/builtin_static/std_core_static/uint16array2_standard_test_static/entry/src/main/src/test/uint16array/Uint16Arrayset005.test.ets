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

export default function uint16Arrayset005Test(): void {
  describe('Uint16Arrayset005', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_0100
     * @tc.name testUint16Arrayset005001
      * @tc.desc Verify an ArrayLike source copies three values using the default offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2, 3]);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
      expect(target[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_0200
     * @tc.name testUint16Arrayset005002
      * @tc.desc Verify an ArrayLike source writes two values at offset one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2], 1);
      expect(target[1]).assertEqual(1);
      expect(target[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_0300
     * @tc.name testUint16Arrayset005003
      * @tc.desc Verify a nonempty ArrayLike writes values from explicit offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([10, 20, 30], 0);
      expect(target[0]).assertEqual(10);
      expect(target[1]).assertEqual(20);
      expect(target[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_0400
     * @tc.name testUint16Arrayset005004
      * @tc.desc Verify an empty ArrayLike at offset zero leaves the target unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_0500
     * @tc.name testUint16Arrayset005005
      * @tc.desc Verify an empty ArrayLike is accepted at offset three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([], 3);
      expect(target[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_0600
     * @tc.name testUint16Arrayset005006
      * @tc.desc Verify a single ArrayLike value writes at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([42], 0);
      expect(target[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_0700
     * @tc.name testUint16Arrayset005007
      * @tc.desc Verify a three-element ArrayLike fits exactly from offset two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2, 3], 2);
      expect(target[2]).assertEqual(1);
      expect(target[3]).assertEqual(2);
      expect(target[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_0800
     * @tc.name testUint16Arrayset005008
      * @tc.desc Verify a single ArrayLike value writes at the last target index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([99], 4);
      expect(target[4]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_0900
     * @tc.name testUint16Arrayset005009
      * @tc.desc Verify an ArrayLike preserves zero at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([0], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_1000
     * @tc.name testUint16Arrayset005010
      * @tc.desc Verify an ArrayLike preserves the Uint16 maximum value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([65535], 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_1100
     * @tc.name testUint16Arrayset005011
      * @tc.desc Verify an ArrayLike preserves the Uint16 midpoint value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([32768], 0);
      expect(target[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_1200
     * @tc.name testUint16Arrayset005012
      * @tc.desc Verify an ArrayLike copies a mixed sequence of Uint16 boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([0, 65535, 32768, 0, 65535], 0);
      expect(target[0]).assertEqual(0);
      expect(target[1]).assertEqual(65535);
      expect(target[2]).assertEqual(32768);
      expect(target[3]).assertEqual(0);
      expect(target[4]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_1300
     * @tc.name testUint16Arrayset005013
      * @tc.desc Verify an ArrayLike converts hexadecimal 0xFFFF to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([0xFFFF], 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_1400
     * @tc.name testUint16Arrayset005014
      * @tc.desc Verify an ArrayLike converts hexadecimal 0x7FFF to 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([0x7FFF], 0);
      expect(target[0]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_1500
     * @tc.name testUint16Arrayset005015
      * @tc.desc Verify an ArrayLike converts the binary Uint16 maximum to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([0b1111111111111111], 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_1600
     * @tc.name testUint16Arrayset005016
      * @tc.desc Verify an ArrayLike converts scientific notation 1e4 to 10000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1e4], 0);
      expect(target[0]).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_1700
     * @tc.name testUint16Arrayset005017
      * @tc.desc Verify an ArrayLike wraps 65536 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([65536], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_1800
     * @tc.name testUint16Arrayset005018
      * @tc.desc Verify an ArrayLike write preserves the target length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2], 0);
      expect(target.length).assertEqual(5);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_1900
     * @tc.name testUint16Arrayset005019
      * @tc.desc Verify an ArrayLike wraps negative one to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([-1], 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_2000
     * @tc.name testUint16Arrayset005020
      * @tc.desc Verify an ArrayLike writes [1, 2] starting at offset two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2], 2);
      expect(target[2]).assertEqual(1);
      expect(target[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_2100
     * @tc.name testUint16Arrayset005021
      * @tc.desc Verify an ArrayLike writes two values at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2], 0);
      expect(target[0]).assertEqual(1);
      expect(target[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_2200
     * @tc.name testUint16Arrayset005022
      * @tc.desc Verify offset one preserves the target prefix before an ArrayLike write
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2], 1);
      expect(target[1]).assertEqual(1);
      expect(target[2]).assertEqual(2);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_2300
     * @tc.name testUint16Arrayset005023
      * @tc.desc Verify a two-element ArrayLike fits exactly at offset three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1, 2], 3);
      expect(target[3]).assertEqual(1);
      expect(target[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_2400
     * @tc.name testUint16Arrayset005024
      * @tc.desc Verify a negative ArrayLike offset throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1], -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_2500
     * @tc.name testUint16Arrayset005025
      * @tc.desc Verify a nonempty ArrayLike at target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1], 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_2600
     * @tc.name testUint16Arrayset005026
      * @tc.desc Verify an ArrayLike offset beyond target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1], 6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_2700
     * @tc.name testUint16Arrayset005027
      * @tc.desc Verify an ArrayLike offset equal to negative target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1], -5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_2800
     * @tc.name testUint16Arrayset005028
      * @tc.desc Verify an ArrayLike offset below negative target length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1], -6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_2900
     * @tc.name testUint16Arrayset005029
      * @tc.desc Verify a distant positive ArrayLike offset throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1], 999999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_3000
     * @tc.name testUint16Arrayset005030
      * @tc.desc Verify an ArrayLike exceeding remaining capacity at offset four throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      try {
        target.set([1, 2, 3], 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_3100
     * @tc.name testUint16Arrayset005031
      * @tc.desc Verify an ArrayLike source larger than remaining capacity throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      try {
        target.set([1, 2, 3, 4], 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_3200
     * @tc.name testUint16Arrayset005032
      * @tc.desc Verify a five-element ArrayLike cannot fit in a two-element target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(2);
      try {
        target.set([1, 2, 3, 4, 5], 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_3300
     * @tc.name testUint16Arrayset005033
      * @tc.desc Verify an ArrayLike wraps hexadecimal 0x10000 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([0x10000], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_3400
     * @tc.name testUint16Arrayset005034
      * @tc.desc Verify an ArrayLike truncates 3.14 to three
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([3.14], 0);
      expect(target[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_3500
     * @tc.name testUint16Arrayset005035
      * @tc.desc Verify an ArrayLike truncates 65535.9 to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([65535.9], 0);
      expect(target[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_3600
     * @tc.name testUint16Arrayset005036
      * @tc.desc Verify an ArrayLike truncates negative 0.5 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([-0.5], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_3700
     * @tc.name testUint16Arrayset005037
      * @tc.desc Verify an ArrayLike converts positive infinity to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([Number.POSITIVE_INFINITY], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_3800
     * @tc.name testUint16Arrayset005038
      * @tc.desc Verify an ArrayLike converts negative infinity to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([-Number.POSITIVE_INFINITY], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_3900
     * @tc.name testUint16Arrayset005039
      * @tc.desc Verify an ArrayLike converts NaN to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([Number.NaN], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_4000
     * @tc.name testUint16Arrayset005040
      * @tc.desc Verify an ArrayLike wraps negative 32768 to 32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([-32768], 0);
      expect(target[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_4100
     * @tc.name testUint16Arrayset005041
      * @tc.desc Verify an ArrayLike wraps 65537 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([65537], 0);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_4200
     * @tc.name testUint16Arrayset005042
      * @tc.desc Verify an ArrayLike wraps two Uint16 periods to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([65536 * 2], 0);
      expect(target[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_4300
     * @tc.name testUint16Arrayset005043
      * @tc.desc Verify an ArrayLike wraps negative 65535 to one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([-65535], 0);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_4400
     * @tc.name testUint16Arrayset005044
      * @tc.desc Verify an ArrayLike preserves the value one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([1], 0);
      expect(target[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_4500
     * @tc.name testUint16Arrayset005045
      * @tc.desc Verify an ArrayLike preserves the value 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target.set([32767], 0);
      expect(target[0]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_4600
     * @tc.name testUint16Arrayset005046
     * @tc.desc Verify ArrayLike default offset writes all supplied values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      t.set([1, 2, 3]);
      expect(t.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_4700
     * @tc.name testUint16Arrayset005047
     * @tc.desc Verify ArrayLike explicit offset preserves both outer regions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(68, 68, 68, 68, 68);
      t.set([1, 2], 2);
      expect(t.join(',')).assertEqual('9,9,1,2,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_4800
     * @tc.name testUint16Arrayset005048
     * @tc.desc Verify ArrayLike numeric conversion combines truncation and wrapping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(5);
      t.set([-1.8, 0.9, 65536.4, 65537.9, 32768.2]);
      expect(t.join(',')).assertEqual('65535,0,0,1,32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_4900
     * @tc.name testUint16Arrayset005049
     * @tc.desc Verify empty ArrayLike at a nonzero offset leaves target content intact
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(62, 63, 64);
      const s: Array<number> = [];
      t.set(s, 2);
      expect(t.join(',')).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_5000
     * @tc.name testUint16Arrayset005050
     * @tc.desc Verify ArrayLike writes into a nonzero target view and backing array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(12);
      const all: Uint16Array = new Uint16Array(b);
      all.fill(8);
      const t: Uint16Array = new Uint16Array(b, 4, 3);
      t.set([1, 2], 1);
      expect(t.join(',')).assertEqual('8,1,2');
      expect(all.join(',')).assertEqual('8,8,8,1,2,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_5100
     * @tc.name testUint16Arrayset005051
     * @tc.desc Verify ArrayLike offset equal to length raises precise RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(63, 64, 65);
      try {
        t.set([1], 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('4,5,6');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_5200
     * @tc.name testUint16Arrayset005052
     * @tc.desc Verify ArrayLike negative offset raises precise RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(63, 64, 65);
      try {
        t.set([1], -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('4,5,6');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_5300
     * @tc.name testUint16Arrayset005053
     * @tc.desc Verify ArrayLike oversized source raises precise RangeError atomically
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(66, 66, 66);
      try {
        t.set([1, 2, 3], 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('7,7,7');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_5400
     * @tc.name testUint16Arrayset005054
     * @tc.desc Verify ArrayLike distant offset raises precise RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(66, 66);
      try {
        t.set([1], 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('7,7');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_5500
     * @tc.name testUint16Arrayset005055
     * @tc.desc Verify ArrayLike validation completes before any element is stored
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(65, 65);
      try {
        t.set([1, 2, 3], 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(t.join(',')).assertEqual('6,6');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_5600
     * @tc.name testUint16Arrayset005056
     * @tc.desc Verify ArrayLike stores repeated values in their original order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(6);
      t.set([2, 2, 3, 3], 1);
      expect(t.join(',')).assertEqual('0,2,2,3,3,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_5700
     * @tc.name testUint16Arrayset005057
     * @tc.desc Verify ArrayLike source can fill the exact remaining capacity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(68, 68, 68, 68);
      t.set([4, 5, 6], 1);
      expect(t.join(',')).assertEqual('9,4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_5800
     * @tc.name testUint16Arrayset005058
     * @tc.desc Verify ArrayLike source values are captured independently of later source changes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [1, 2, 3];
      const t: Uint16Array = new Uint16Array(3);
      t.set(s);
      s[1] = 22;
      expect(t.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_5900
     * @tc.name testUint16Arrayset005059
     * @tc.desc Verify ArrayLike writes a single value at the last index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(60, 61, 62);
      t.set([65535], 2);
      expect(t.join(',')).assertEqual('1,2,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_6000
     * @tc.name testUint16Arrayset005060
     * @tc.desc Verify ArrayLike converts nonfinite numbers to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      t.set([Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      expect(t.join(',')).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_6100
     * @tc.name testUint16Arrayset005061
     * @tc.desc Verify ArrayLike wraps multiple Uint16 periods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      t.set([131072, 131073, -131073]);
      expect(t.join(',')).assertEqual('0,1,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_6200
     * @tc.name testUint16Arrayset005062
     * @tc.desc Verify ArrayLike target view boundary is enforced independently of backing capacity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_6300
     * @tc.name testUint16Arrayset005063
     * @tc.desc Verify ArrayLike writes are visible through a full backing view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      const t: Uint16Array = new Uint16Array(b, 2, 2);
      t.set([12, 34]);
      expect(new Uint16Array(b).join(',')).assertEqual('0,12,34,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_6400
     * @tc.name testUint16Arrayset005064
     * @tc.desc Verify ArrayLike empty source is accepted at target length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(60, 61);
      const s: Array<number> = [];
      t.set(s, 2);
      expect(t.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_6500
     * @tc.name testUint16Arrayset005065
     * @tc.desc Verify ArrayLike conversion occurs for every source element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(4);
      t.set([1.1, 2.9, -3.1, 65539.8]);
      expect(t.join(',')).assertEqual('1,2,65533,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_6600
     * @tc.name testUint16Arrayset005066
     * @tc.desc Verify ArrayLike write preserves target buffer identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      const b: ArrayBuffer = t.buffer;
      t.set([7, 8], 1);
      expect(t.buffer).assertEqual(b);
      expect(t.join(',')).assertEqual('0,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_6700
     * @tc.name testUint16Arrayset005067
     * @tc.desc Verify ArrayLike write preserves target view dimensions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(new ArrayBuffer(10), 2, 3);
      t.set([1], 2);
      expect(t.byteOffset).assertEqual(2);
      expect(t.byteLength).assertEqual(6);
      expect(t.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_6800
     * @tc.name testUint16Arrayset005068
     * @tc.desc Verify ArrayLike source can be an Array number variable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Array<number> = [5.5, 6.5];
      const t: Uint16Array = new Uint16Array(3);
      t.set(s, 1);
      expect(t.join(',')).assertEqual('0,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_6900
     * @tc.name testUint16Arrayset005069
     * @tc.desc Verify ArrayLike source can overwrite a previous ArrayLike range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(4);
      t.set([1, 2, 3, 4]);
      t.set([8, 9], 1);
      expect(t.join(',')).assertEqual('1,8,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_7000
     * @tc.name testUint16Arrayset005070
     * @tc.desc Verify ArrayLike source respects target subarray indexing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const all: Uint16Array = Uint16Array.of(68, 68, 68, 68, 68);
      const t: Uint16Array = all.subarray(1, 4);
      t.set([1, 2], 1);
      expect(all.join(',')).assertEqual('9,9,1,2,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_7100
     * @tc.name testUint16Arrayset005071
     * @tc.desc Verify ArrayLike source writes zero over existing nonzero content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(67, 67, 67);
      t.set([0, 0], 1);
      expect(t.join(',')).assertEqual('8,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_7200
     * @tc.name testUint16Arrayset005072
     * @tc.desc Verify ArrayLike source preserves untouched suffix after a short write
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(60, 61, 62, 63);
      t.set([9], 0);
      expect(t.join(',')).assertEqual('9,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_7300
     * @tc.name testUint16Arrayset005073
     * @tc.desc Verify ArrayLike source preserves untouched prefix before a late write
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(60, 61, 62, 63);
      t.set([9], 3);
      expect(t.join(',')).assertEqual('1,2,3,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_7400
     * @tc.name testUint16Arrayset005074
     * @tc.desc Verify ArrayLike source writes at legal offset one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = Uint16Array.of(60, 61, 62);
      t.set([9], 1);
      expect(t.join(',')).assertEqual('1,9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_7500
     * @tc.name testUint16Arrayset005075
     * @tc.desc Verify ArrayLike source containing Uint16 boundaries is stored exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(4);
      t.set([0, 1, 32768, 65535]);
      expect(t.join(',')).assertEqual('0,1,32768,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_7600
     * @tc.name testUint16Arrayset005076
     * @tc.desc Verify ArrayLike source works with a zero-length target only when empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array();
      const s: Array<number> = [];
      t.set(s);
      expect(t.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_7700
     * @tc.name testUint16Arrayset005077
     * @tc.desc Verify ArrayLike nonempty source is rejected by a zero-length target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET005_7800
     * @tc.name testUint16Arrayset005078
     * @tc.desc Verify ArrayLike source preserves decimal ordering after conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset005078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t: Uint16Array = new Uint16Array(3);
      t.set([10.9, 2.9, 30.1]);
      expect(t.join(',')).assertEqual('10,2,30');
    });
  });
}
