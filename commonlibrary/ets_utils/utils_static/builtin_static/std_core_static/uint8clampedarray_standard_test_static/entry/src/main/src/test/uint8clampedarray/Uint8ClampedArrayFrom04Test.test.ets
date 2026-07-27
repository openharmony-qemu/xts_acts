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

export default function uint8ClampedArrayFrom04Test(): void {
  describe('uint8ClampedArrayFrom04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_0100
     * @tc.name testUint8ClampedArrayFromFour001
     * @tc.desc Verify - mapfn Array<number> Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const r1 = Uint8ClampedArray.from(src);
      const r2 = Uint8ClampedArray.from([1, 2, 3] as Array<number>);
      expect(r1.length).assertEqual(r2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_0200
     * @tc.name testUint8ClampedArrayFromFour002
     * @tc.desc Verify Uint8ClampedArray.from yields length b.length for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const a = Uint8ClampedArray.from(src);
      const b = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      expect(a.length).assertEqual(b.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_0300
     * @tc.name testUint8ClampedArrayFromFour003
     * @tc.desc Verify Uint8ClampedArray.from yields length b.length for from(it)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const it: Array<number> = [5, 6, 7];
      const a = Uint8ClampedArray.from(it);
      const b = Uint8ClampedArray.from(it, undefined);
      expect(a.length).assertEqual(b.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_0400
     * @tc.name testUint8ClampedArrayFromFour004
     * @tc.desc Verify -Array<number> vs Array<number> [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sFixed: Array<number> = [1, 2, 3];
      const sArr: Array<number> = [1, 2, 3];
      const a = Uint8ClampedArray.from(sFixed);
      const b = Uint8ClampedArray.from(sArr);
      expect(a.length).assertEqual(b.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_0500
     * @tc.name testUint8ClampedArrayFromFour005
     * @tc.desc Verify -Uint8ClampedArray vs Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([7, 8, 9]);
      const a = Uint8ClampedArray.from(src);
      const b = Uint8ClampedArray.from([7, 8, 9] as Array<number>);
      expect(a[0]).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_0600
     * @tc.name testUint8ClampedArrayFromFour006
     * @tc.desc Verify Uint8ClampedArray.from yields length b.length for from(fix)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fix: Array<number> = [1, 2, 3];
      const set: Set<int> = new Set<int>();
      set.add(1); set.add(2); set.add(3);
      const a = Uint8ClampedArray.from(fix);
      const b = Uint8ClampedArray.from(set);
      expect(a.length).assertEqual(b.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_0700
     * @tc.name testUint8ClampedArrayFromFour007
     * @tc.desc Verify - FixedArray vs Array vs Set 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fA: Array<number> = [];
      const aA: Array<number> = [];
      const sA: Set<int> = new Set<int>();
      expect(Uint8ClampedArray.from(fA).length).assertEqual(0);
      expect(Uint8ClampedArray.from(aA).length).assertEqual(0);
      expect(Uint8ClampedArray.from(sA).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_0800
     * @tc.name testUint8ClampedArrayFromFour008
     * @tc.desc Verify -Array<number> clamp Uint8ClampedArray clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([300, -5, 100] as Array<number>);
      const src = new Uint8ClampedArray([300, -5, 100]);
      const b = Uint8ClampedArray.from(src);
      expect(a[0]).assertEqual(b[0]);
      expect(a[1]).assertEqual(b[1]);
      expect(a[2]).assertEqual(b[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_0900
     * @tc.name testUint8ClampedArrayFromFour009
     * @tc.desc Verify Uint8ClampedArray.from element at b[0] equals a[0] + 1 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const a = Uint8ClampedArray.from(src);
      const b = Uint8ClampedArray.from(src, (v: number, k: number): number => v + 1);
      expect(b[0]).assertEqual(a[0] + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_1000
     * @tc.name testUint8ClampedArrayFromFour010
     * @tc.desc Verify -Iterable<number> Array mapfn Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4];
      const a = Uint8ClampedArray.from(src);
      const b = Uint8ClampedArray.from(src, (v: number, k: number): number => v * 2);
      expect(a.length).assertEqual(b.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_1100
     * @tc.name testUint8ClampedArrayFromFour011
     * @tc.desc Verify Uint8ClampedArray.from yields length 3 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [50, 60, 70];
      const r = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_1200
     * @tc.name testUint8ClampedArrayFromFour012
     * @tc.desc Verify Uint8ClampedArray.from yields byteOffset 0 for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint8ClampedArray.from([1, 2] as Array<number>);
      const r2 = Uint8ClampedArray.from(new Uint8ClampedArray([1, 2]));
      expect(r1.byteOffset).assertEqual(0);
      expect(r2.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_1300
     * @tc.name testUint8ClampedArrayFromFour013
     * @tc.desc Verify Uint8ClampedArray.from yields BYTES_PER_ELEMENT 1 for from([1] as Array<number>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint8ClampedArray.from([1] as Array<number>);
      const sS: Set<int> = new Set<int>(); sS.add(1);
      const r2 = Uint8ClampedArray.from(sS);
      expect(r1.BYTES_PER_ELEMENT).assertEqual(1);
      expect(r2.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_1400
     * @tc.name testUint8ClampedArrayFromFour014
     * @tc.desc Verify - vs mapfn=undefined byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const a = Uint8ClampedArray.from(src);
      const b = Uint8ClampedArray.from(src, undefined);
      expect(a.byteLength).assertEqual(b.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_1500
     * @tc.name testUint8ClampedArrayFromFour015
     * @tc.desc Verify Uint8ClampedArray.from yields byteLength Uint8ClampedArray.from(sS for from(sA)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sA: Array<number> = [1, 2, 3];
      const sS: Set<int> = new Set<int>(); sS.add(1); sS.add(2); sS.add(3);
      expect(Uint8ClampedArray.from(sA).byteLength).assertEqual(Uint8ClampedArray.from(sS).byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_1600
     * @tc.name testUint8ClampedArrayFromFour016
     * @tc.desc Verify -FixedArray vs Uint8ClampedArray buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fA: Array<number> = [1, 2, 3, 4];
      const uA = new Uint8ClampedArray([1, 2, 3, 4]);
      const r1 = Uint8ClampedArray.from(fA);
      const r2 = Uint8ClampedArray.from(uA);
      expect(r1.buffer.byteLength).assertEqual(r1.length);
      expect(r2.buffer.byteLength).assertEqual(r2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_1700
     * @tc.name testUint8ClampedArrayFromFour017
     * @tc.desc Verify Uint8ClampedArray.from yields length r.byteLength for from([1, 2, 3] as Array<n)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Uint8ClampedArray.from([1, 2, 3] as Array<number>);
      expect(r.length).assertEqual(r.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_1800
     * @tc.name testUint8ClampedArrayFromFour018
     * @tc.desc Verify Uint8ClampedArray.from behavior for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => { throw new Error('x'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(src.length).assertEqual(3);
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_1900
     * @tc.name testUint8ClampedArrayFromFour019
     * @tc.desc Verify throw -mapfn Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([10, 20, 30]);
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => { throw new Error('x'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(src[0]).assertEqual(10);
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_2000
     * @tc.name testUint8ClampedArrayFromFour020
     * @tc.desc Verify Uint8ClampedArray.from behavior for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<number> = new Set<number>();
      src.add(1); src.add(2); src.add(3);
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => { throw new Error('x'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(src.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_2100
     * @tc.name testUint8ClampedArrayFromFour021
     * @tc.desc Verify Uint8ClampedArray.from behavior for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [5, 6, 7];
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => { throw new Error('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(src[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_2200
     * @tc.name testUint8ClampedArrayFromFour022
     * @tc.desc Verify throw - mapfn throws Error from two separate from() calls, then verify normal from() still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => {
          throw new Error('a');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => {
          throw new Error('b');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const r = Uint8ClampedArray.from(src);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_2300
     * @tc.name testUint8ClampedArrayFromFour023
     * @tc.desc Verify Uint8ClampedArray.from propagates Error thrown by mapfn at k=2 for Array [10, 20, 30, 40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30, 40];
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => {
          if (k === 2) { throw new Error('mid'); }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(src[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_2400
     * @tc.name testUint8ClampedArrayFromFour024
     * @tc.desc Verify throw - Uint8ClampedArray.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const oldBuf = src.buffer;
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(src.buffer).assertEqual(oldBuf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_2500
     * @tc.name testUint8ClampedArrayFromFour025
     * @tc.desc Verify Uint8ClampedArray.from propagates Error thrown by mapfn for Set input without mutating source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<number> = new Set<number>();
      src.add(100); src.add(200);
      const sizeBefore = src.size;
      try {
        Uint8ClampedArray.from(src, (v: number, k: number): number => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(src.size).assertEqual(sizeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_2600
     * @tc.name testUint8ClampedArrayFromFour026
     * @tc.desc Verify Array input conversion preserves its single value and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([1] as Array<number>);
      expect(a.length).assertEqual(1);
      expect(a[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_2700
     * @tc.name testUint8ClampedArrayFromFour027
     * @tc.desc Verify Set input conversion preserves insertion value and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>(); s.add(2);
      const a = Uint8ClampedArray.from(s);
      expect(a.length).assertEqual(1);
      expect(a[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_2800
     * @tc.name testUint8ClampedArrayFromFour028
     * @tc.desc Verify Uint8ClampedArray input is copied into independent storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([3]);
      const a = Uint8ClampedArray.from(src);
      a[0] = 9;
      expect(src[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_2900
     * @tc.name testUint8ClampedArrayFromFour029
     * @tc.desc Verify Array input conversion preserves element ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fA: Array<number> = [1, 2];
      const a = Uint8ClampedArray.from(fA);
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_3000
     * @tc.name testUint8ClampedArrayFromFour030
     * @tc.desc Verify mapfn receives the index and transforms each source value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Uint8ClampedArray.from([1, 2] as Array<number>, (v: number, k: number): number => v + k);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_3100
     * @tc.name testUint8ClampedArrayFromFour031
     * @tc.desc Verify -Array Uint8ClampedArray toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([1, 2, 3] as Array<number>);
      const b = Uint8ClampedArray.from(new Uint8ClampedArray([1, 2, 3]));
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_3200
     * @tc.name testUint8ClampedArrayFromFour032
     * @tc.desc Verify toString Uint8ClampedArray.from(fA).toString() equals Uint8ClampedArray.from(aA for from(fA)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fA: Array<number> = [1, 2, 3];
      const aA: Array<number> = [1, 2, 3];
      expect(Uint8ClampedArray.from(fA).toString()).assertEqual(Uint8ClampedArray.from(aA).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_3300
     * @tc.name testUint8ClampedArrayFromFour033
     * @tc.desc Verify Uint8ClampedArray.from a.toString() equals b.toString( for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [11, 22, 33];
      const a = Uint8ClampedArray.from(src);
      const b = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_3400
     * @tc.name testUint8ClampedArrayFromFour034
     * @tc.desc Verify Uint8ClampedArray.from result is an instance of ArrayBuffer for from([1] as Array<number>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([1] as Array<number>);
      expect(a.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_3500
     * @tc.name testUint8ClampedArrayFromFour035
     * @tc.desc Verify Uint8ClampedArray.from result is an instance of ArrayBuffer for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>(); s.add(1);
      expect(Uint8ClampedArray.from(s).buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_3600
     * @tc.name testUint8ClampedArrayFromFour036
     * @tc.desc Verify Uint8ClampedArray.from iterator is done after consuming all elements for from([1, 2] as Array<numb)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Uint8ClampedArray.from([1, 2] as Array<number>);
      const it = r.values();
      it.next(); it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_3700
     * @tc.name testUint8ClampedArrayFromFour037
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 5 for array [5, 100, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([5, 100, 200]);
      const r = Uint8ClampedArray.from(src);
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(100);
      expect(r[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_3800
     * @tc.name testUint8ClampedArrayFromFour038
     * @tc.desc Verify Uint8ClampedArray.from yields length s.size for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(1); s.add(2); s.add(3); s.add(4);
      const r = Uint8ClampedArray.from(s);
      expect(r.length).assertEqual(s.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_3900
     * @tc.name testUint8ClampedArrayFromFour039
     * @tc.desc Verify Uint8ClampedArray.from yields length 5 for from(f)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Array<number> = [9, 8, 7, 6, 5];
      const r = Uint8ClampedArray.from(f);
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_4000
     * @tc.name testUint8ClampedArrayFromFour040
     * @tc.desc Verify Uint8ClampedArray.from yields length src.length for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3, 4, 5, 6];
      expect(Uint8ClampedArray.from(src).length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_4100
     * @tc.name testUint8ClampedArrayFromFour041
     * @tc.desc Verify -Uint8ClampedArray buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const r = Uint8ClampedArray.from(src);
      expect(r.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_4200
     * @tc.name testUint8ClampedArrayFromFour042
     * @tc.desc Verify Uint8ClampedArray.from element at src[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const r = Uint8ClampedArray.from(src);
      r[0] = 99;
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_4300
     * @tc.name testUint8ClampedArrayFromFour043
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 1 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const r = Uint8ClampedArray.from(src);
      src[0] = 99;
      expect(r[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_4400
     * @tc.name testUint8ClampedArrayFromFour044
     * @tc.desc Verify Uint8ClampedArray.from element at src[0] equals 1 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const r = Uint8ClampedArray.from(src);
      r[0] = 200;
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_4500
     * @tc.name testUint8ClampedArrayFromFour045
     * @tc.desc Verify Uint8ClampedArray.from(Set) produces correct length, elements and is independent of source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<int> = new Set<int>();
      src.add(1); src.add(2); src.add(3);
      const r = Uint8ClampedArray.from(src);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      r[0] = 99;
      expect(src.has(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_4600
     * @tc.name testUint8ClampedArrayFromFour046
     * @tc.desc Verify from(src) produces a distinct object from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const r = Uint8ClampedArray.from(src);
      expect(r).not().assertEqual(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_4700
     * @tc.name testUint8ClampedArrayFromFour047
     * @tc.desc Verify two from(src) calls produce distinct array objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3]);
      const a = Uint8ClampedArray.from(src);
      const b = Uint8ClampedArray.from(src);
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_4800
     * @tc.name testUint8ClampedArrayFromFour048
     * @tc.desc Verify two from(src) calls produce independent buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const a = Uint8ClampedArray.from(src);
      const b = Uint8ClampedArray.from(src);
      expect(a.buffer).not().assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_4900
     * @tc.name testUint8ClampedArrayFromFour049
     * @tc.desc Verify Uint8ClampedArray.from element at src[0] equals 10 for from(src, (v: number, k: )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20];
      const r = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      r[0] = 99;
      expect(src[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_5000
     * @tc.name testUint8ClampedArrayFromFour050
     * @tc.desc Verify -mapfn buffer Uint8ClampedArray.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2]);
      const r = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      expect(r.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_5100
     * @tc.name testUint8ClampedArrayFromFour051
     * @tc.desc Verify two from([1]) calls produce independent buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = Uint8ClampedArray.from([1] as Array<number>);
      const r2 = Uint8ClampedArray.from([1] as Array<number>);
      expect(r1.buffer).not().assertEqual(r2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_5200
     * @tc.name testUint8ClampedArrayFromFour052
     * @tc.desc Verify from(Uint8ClampedArray) produces independent buffer from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([1, 2, 3] as Array<number>);
      const b = Uint8ClampedArray.from(a);
      expect(b.buffer).not().assertEqual(a.buffer);
      expect(b.length).assertEqual(a.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_5300
     * @tc.name testUint8ClampedArrayFromFour053
     * @tc.desc Verify Uint8ClampedArray.from yields length 4 for from([1, 2, 3, 4] as Arra)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([1, 2, 3, 4] as Array<number>);
      const b = Uint8ClampedArray.from(Uint8ClampedArray.from(a));
      expect(b.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_5400
     * @tc.name testUint8ClampedArrayFromFour054
     * @tc.desc Verify Uint8ClampedArray.from element at b[0] equals a[0] for from([1, 2] as Array<numb)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([1, 2] as Array<number>, (v: number, k: number): number => v + 1);
      const b = Uint8ClampedArray.from(a);
      expect(b[0]).assertEqual(a[0]);
      expect(b[1]).assertEqual(a[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_5500
     * @tc.name testUint8ClampedArrayFromFour055
     * @tc.desc Verify from(array) and from(set) produce distinct objects with independent buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([1, 2] as Array<number>);
      const s: Set<int> = new Set<int>(); s.add(3); s.add(4);
      const b = Uint8ClampedArray.from(s);
      expect(a).not().assertEqual(b);
      expect(a.buffer).not().assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_5600
     * @tc.name testUint8ClampedArrayFromFour056
     * @tc.desc Verify clamp -Array Uint8ClampedArray 256 clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([256] as Array<number>);
      const b = Uint8ClampedArray.from(new Uint8ClampedArray([256]));
      expect(a[0]).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_5700
     * @tc.name testUint8ClampedArrayFromFour057
     * @tc.desc Verify clamp -Array FixedArray -1 clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([-1] as Array<number>);
      const f: Array<number> = [-1];
      const b = Uint8ClampedArray.from(f);
      expect(a[0]).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_5800
     * @tc.name testUint8ClampedArrayFromFour058
     * @tc.desc Verify Uint8ClampedArray.from element at a[0] equals b[0] for from([300] as Array<numbe)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([300] as Array<number>);
      const s: Set<int> = new Set<int>(); s.add(300);
      const b = Uint8ClampedArray.from(s);
      expect(a[0]).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_5900
     * @tc.name testUint8ClampedArrayFromFour059
     * @tc.desc Verify Uint8ClampedArray.from element at a[0] equals b[0] for from([100] as Array<numbe)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([100] as Array<number>, (v: number, k: number): number => 256);
      const b = Uint8ClampedArray.from([256] as Array<number>);
      expect(a[0]).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_6000
     * @tc.name testUint8ClampedArrayFromFour060
     * @tc.desc Verify clamp -Array Uint8ClampedArray NaN clamp NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([Number.NaN] as Array<number>);
      const b = Uint8ClampedArray.from(new Uint8ClampedArray([Number.NaN]));
      expect(a[0]).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_6100
     * @tc.name testUint8ClampedArrayFromFour061
     * @tc.desc Verify Uint8ClampedArray.from element at a[0] equals b[0] for from([10] as Array<number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([10] as Array<number>, (v: number, k: number): number => Number.NaN);
      const b = Uint8ClampedArray.from([Number.NaN] as Array<number>);
      expect(a[0]).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_6200
     * @tc.name testUint8ClampedArrayFromFour062
     * @tc.desc Verify - FixedArray vs Set length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Array<number> = [];
      const s: Set<int> = new Set<int>();
      expect(Uint8ClampedArray.from(f).length).assertEqual(0);
      expect(Uint8ClampedArray.from(s).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_6300
     * @tc.name testUint8ClampedArrayFromFour063
     * @tc.desc Verify - Array vs Uint8ClampedArray byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [];
      const u = new Uint8ClampedArray(0);
      expect(Uint8ClampedArray.from(a).byteLength).assertEqual(0);
      expect(Uint8ClampedArray.from(u).byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_6400
     * @tc.name testUint8ClampedArrayFromFour064
     * @tc.desc Verify Uint8ClampedArray.from called equals 0 for from([] as Array<number>,)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = 0;
      Uint8ClampedArray.from([] as Array<number>, (v: number, k: number): number => { called++; return v; });
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_6500
     * @tc.name testUint8ClampedArrayFromFour065
     * @tc.desc Verify - Uint8ClampedArray + mapfn mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = 0;
      Uint8ClampedArray.from(new Uint8ClampedArray(0), (v: number, k: number): number => { called++; return v; });
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_6600
     * @tc.name testUint8ClampedArrayFromFour066
     * @tc.desc Verify toString Uint8ClampedArray.from(f).toString() equals Uint8ClampedArray.from(a for from(f)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Array<number> = [];
      const a: Array<number> = [];
      expect(Uint8ClampedArray.from(f).toString()).assertEqual(Uint8ClampedArray.from(a).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_6700
     * @tc.name testUint8ClampedArrayFromFour067
     * @tc.desc Verify mapfn-Array Uint8ClampedArray mapfn k
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keysA: Array<number> = [];
      Uint8ClampedArray.from([10, 20, 30] as Array<number>, (v: number, k: number): number => { keysA.push(k); return v; });
      const keysB: Array<number> = [];
      Uint8ClampedArray.from(new Uint8ClampedArray([10, 20, 30]), (v: number, k: number): number => { keysB.push(k); return v; });
      expect(keysA.length).assertEqual(keysB.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_6800
     * @tc.name testUint8ClampedArrayFromFour068
     * @tc.desc Verify Uint8ClampedArray.from n equals 4 for from([1, 2, 3, 4] as Arra)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = 0;
      Uint8ClampedArray.from([1, 2, 3, 4] as Array<number>, (v: number, k: number): number => { n++; return v; });
      expect(n).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_6900
     * @tc.name testUint8ClampedArrayFromFour069
     * @tc.desc Verify mapfn-Uint8ClampedArray mapfn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = 0;
      Uint8ClampedArray.from(new Uint8ClampedArray([1, 2, 3]), (v: number, k: number): number => { n++; return v; });
      expect(n).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_7000
     * @tc.name testUint8ClampedArrayFromFour070
     * @tc.desc Verify mapfn- mapfn Array Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src1: Array<number> = [10, 20, 30];
      const src2 = new Uint8ClampedArray([10, 20, 30]);
      const f = (v: number, k: number): number => v + k;
      const a = Uint8ClampedArray.from(src1, f);
      const b = Uint8ClampedArray.from(src2, f);
      expect(a[2]).assertEqual(b[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_7100
     * @tc.name testUint8ClampedArrayFromFour071
     * @tc.desc Verify Uint8ClampedArray.from element at a[0] equals 0 for array [100, 200, 50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([100, 200, 50] as Array<number>, (v: number, k: number): number => 0);
      const b = Uint8ClampedArray.from(new Uint8ClampedArray([100, 200, 50]), (v: number, k: number): number => 0);
      expect(a[0]).assertEqual(0);
      expect(b[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_7200
     * @tc.name testUint8ClampedArrayFromFour072
     * @tc.desc Verify Uint8ClampedArray.from element at a[0] equals 255 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([1, 2, 3] as Array<number>, (v: number, k: number): number => 255);
      const b = Uint8ClampedArray.from(new Uint8ClampedArray([1, 2, 3]), (v: number, k: number): number => 255);
      expect(a[0]).assertEqual(255);
      expect(b[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_7300
     * @tc.name testUint8ClampedArrayFromFour073
     * @tc.desc Verify Uint8ClampedArray.from element at a[0] equals b[0] for array [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([1] as Array<number>, (v: number, k: number): number => 300);
      const b = Uint8ClampedArray.from(new Uint8ClampedArray([1]), (v: number, k: number): number => 300);
      expect(a[0]).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_7400
     * @tc.name testUint8ClampedArrayFromFour074
     * @tc.desc Verify Uint8ClampedArray.from element at a[0] equals b[0] for array [10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([10] as Array<number>, (v: number, k: number): number => -50);
      const b = Uint8ClampedArray.from(new Uint8ClampedArray([10]), (v: number, k: number): number => -50);
      expect(a[0]).assertEqual(b[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_7500
     * @tc.name testUint8ClampedArrayFromFour075
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 3 for from(src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [3, 1, 2];
      const r = Uint8ClampedArray.from(src);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_7600
     * @tc.name testUint8ClampedArrayFromFour076
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 50 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(50); s.add(10); s.add(30);
      const r = Uint8ClampedArray.from(s);
      expect(r[0]).assertEqual(50);
      expect(r[1]).assertEqual(10);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_7700
     * @tc.name testUint8ClampedArrayFromFour077
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 9 for from(f)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Array<number> = [9, 8, 7];
      const r = Uint8ClampedArray.from(f);
      expect(r[0]).assertEqual(9);
      expect(r[1]).assertEqual(8);
      expect(r[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_7800
     * @tc.name testUint8ClampedArrayFromFour078
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 22 for array [22, 11, 33]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([22, 11, 33]);
      const r = Uint8ClampedArray.from(src);
      expect(r[0]).assertEqual(22);
      expect(r[1]).assertEqual(11);
      expect(r[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_7900
     * @tc.name testUint8ClampedArrayFromFour079
     * @tc.desc Verify Uint8ClampedArray.from element at keys[0] equals 0 for from([1, 2, 3, 4] as Arra)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: Array<number> = [];
      Uint8ClampedArray.from([1, 2, 3, 4] as Array<number>, (v: number, k: number): number => { keys.push(k); return v; });
      expect(keys[0]).assertEqual(0);
      expect(keys[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_8000
     * @tc.name testUint8ClampedArrayFromFour080
     * @tc.desc Verify Uint8ClampedArray.from element at keys[0] equals 0 for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: Array<number> = [];
      Uint8ClampedArray.from(new Uint8ClampedArray([1, 2, 3]), (v: number, k: number): number => { keys.push(k); return v; });
      expect(keys[0]).assertEqual(0);
      expect(keys[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_8100
     * @tc.name testUint8ClampedArrayFromFour081
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 100 for from([0, 0, 0] as Array<n)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Uint8ClampedArray.from([0, 0, 0] as Array<number>);
      r[0] = 100;
      expect(r[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_8200
     * @tc.name testUint8ClampedArrayFromFour082
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 200 for array [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Uint8ClampedArray.from(new Uint8ClampedArray([0, 0]));
      r[0] = 200;
      expect(r[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_8300
     * @tc.name testUint8ClampedArrayFromFour083
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 150 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>(); s.add(0); s.add(0);
      const r = Uint8ClampedArray.from(s);
      r[0] = 150;
      expect(r[0]).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_8400
     * @tc.name testUint8ClampedArrayFromFour084
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 175 for from(f)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Array<number> = [0, 0];
      const r = Uint8ClampedArray.from(f);
      r[0] = 175;
      expect(r[0]).assertEqual(175);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_8500
     * @tc.name testUint8ClampedArrayFromFour085
     * @tc.desc Verify Uint8ClampedArray.from element at r[0] equals 255 for from([0] as Array<number>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Uint8ClampedArray.from([0] as Array<number>, (v: number, k: number): number => v);
      r[0] = 300;
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_8600
     * @tc.name testUint8ClampedArrayFromFour086
     * @tc.desc Verify Uint8ClampedArray.from element at a[0] equals 0 for array [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint8ClampedArray.from([0] as Array<number>);
      const b = Uint8ClampedArray.from(new Uint8ClampedArray([0]));
      a[0] = -1; b[0] = -1;
      expect(a[0]).assertEqual(0);
      expect(b[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_8700
     * @tc.name testUint8ClampedArrayFromFour087
     * @tc.desc Verify Uint8ClampedArray.from propagates RangeError thrown by mapfn for Array<number> input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Uint8ClampedArray.from([1, 2] as Array<number>, (v: number, k: number): number => {
          throw new RangeError('RangeError');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_8800
     * @tc.name testUint8ClampedArrayFromFour088
     * @tc.desc Verify -mapfn Uint8ClampedArray RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Uint8ClampedArray.from(new Uint8ClampedArray([1, 2]), (v: number, k: number): number => {
          throw new RangeError('RangeError');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_8900
     * @tc.name testUint8ClampedArrayFromFour089
     * @tc.desc Verify Uint8ClampedArray.from propagates TypeError thrown by mapfn for Array<number> input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Uint8ClampedArray.from([1, 2] as Array<number>, (v: number, k: number): number => {
          throw new TypeError('t');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_9000
     * @tc.name testUint8ClampedArrayFromFour090
     * @tc.desc Verify Uint8ClampedArray.from propagates Error thrown by mapfn for Uint8ClampedArray input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Uint8ClampedArray.from(new Uint8ClampedArray([1]), (v: number, k: number): number => {
          throw new Error('e');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_9100
     * @tc.name testUint8ClampedArrayFromFour091
     * @tc.desc Verify Uint8ClampedArray.from behavior for from([1, 2, 3, 4] as Array<number>,)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = 0;
      try {
        Uint8ClampedArray.from([1, 2, 3, 4] as Array<number>, (v: number, k: number): number => {
          n++;
          if (k === 0) { throw new Error('first'); }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_9200
     * @tc.name testUint8ClampedArrayFromFour092
     * @tc.desc Verify Uint8ClampedArray.from behavior for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = 0;
      try {
        Uint8ClampedArray.from(new Uint8ClampedArray([1, 2, 3]), (v: number, k: number): number => {
          n++;
          if (k === 0) { throw new Error('first'); }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_9300
     * @tc.name testUint8ClampedArrayFromFour093
     * @tc.desc Verify Uint8ClampedArray.from yields length 1 for from([1] as Array<number>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8ClampedArray.from([1] as Array<number>).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_9400
     * @tc.name testUint8ClampedArrayFromFour094
     * @tc.desc Verify Uint8ClampedArray.from yields length 1 for from(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>(); s.add(1);
      expect(Uint8ClampedArray.from(s).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_9500
     * @tc.name testUint8ClampedArrayFromFour095
     * @tc.desc Verify Uint8ClampedArray.from yields length 1 for from(f)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Array<number> = [1];
      expect(Uint8ClampedArray.from(f).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_9600
     * @tc.name testUint8ClampedArrayFromFour096
     * @tc.desc Verify Uint8ClampedArray.from behavior for from([] as Array<number>, (v: numbe)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8ClampedArray.from([] as Array<number>, (v: number, k: number): number => v).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_FROM_FOUR_9700
     * @tc.name testUint8ClampedArrayFromFour097
     * @tc.desc Verify Uint8ClampedArray.from yields length src.length for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayFromFour097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = Uint8ClampedArray.from(src, (v: number, k: number): number => v);
      expect(r.length).assertEqual(src.length);
    });
  });
}
