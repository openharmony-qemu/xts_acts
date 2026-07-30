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

export default function uint8ClampedArrayPropertiesThreeTest(): void {
  describe('Uint8ClampedArrayPropertiesThreeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_0100
     * @tc.name testUint8ClampedArrayPropertiesThree001
     * @tc.desc Verify length subarray(2,5) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      const sub = arr.subarray(2, 5);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_0200
     * @tc.name testUint8ClampedArrayPropertiesThree002
     * @tc.desc Verify length subarray(0,0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      const sub = arr.subarray(0, 0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_0300
     * @tc.name testUint8ClampedArrayPropertiesThree003
     * @tc.desc Verify slice [1,2,3,4,5] returns [2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const s = arr.slice(1, 4);
      expect(s.length).assertEqual(3);
      expect(s[0]).assertEqual(2);
      expect(s[1]).assertEqual(3);
      expect(s[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_0400
     * @tc.name testUint8ClampedArrayPropertiesThree004
     * @tc.desc Verify length from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_0500
     * @tc.name testUint8ClampedArrayPropertiesThree005
     * @tc.desc Verify name null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      expect(arr.name).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_0600
     * @tc.name testUint8ClampedArrayPropertiesThree006
     * @tc.desc Verify Uint8ClampedArray.from([1,2,3]).name equals 'Uint8ClampedArray'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.from([1, 2, 3]);
      expect(arr.name).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_0700
     * @tc.name testUint8ClampedArrayPropertiesThree007
     * @tc.desc Verify new Uint8ClampedArray(new ArrayBuffer(4)).name equals 'Uint8ClampedArray'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(4));
      expect(arr.name).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_0800
     * @tc.name testUint8ClampedArrayPropertiesThree008
     * @tc.desc Verify Uint8ClampedArray.of(1,2).name equals 'Uint8ClampedArray'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2);
      expect(arr.name).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_0900
     * @tc.name testUint8ClampedArrayPropertiesThree009
     * @tc.desc Verify subarray(1,3) on [1,2,3,4] has length=2, name='Uint8ClampedArray', elements [2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.name).assertEqual('Uint8ClampedArray');
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_1000
     * @tc.name testUint8ClampedArrayPropertiesThree010
     * @tc.desc Verify slice(0,2) on [1,2,3,4] has name='Uint8ClampedArray'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = arr.slice(0, 2);
      expect(s.name).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_1100
     * @tc.name testUint8ClampedArrayPropertiesThree011
     * @tc.desc Verify [1,2,3].map(x=>x).name equals 'Uint8ClampedArray'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Uint8ClampedArray([1, 2, 3]).map((x: number) => x);
      expect(m.name).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_1200
     * @tc.name testUint8ClampedArrayPropertiesThree012
     * @tc.desc Verify [1,2,3].filter(x=>x>0).name equals 'Uint8ClampedArray'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f = new Uint8ClampedArray([1, 2, 3]).filter((x: number) => x > 0);
      expect(f.name).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_1300
     * @tc.name testUint8ClampedArrayPropertiesThree013
     * @tc.desc Verify [1,2,3].toReversed().name equals 'Uint8ClampedArray'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Uint8ClampedArray([1, 2, 3]).toReversed();
      expect(r.name).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_1400
     * @tc.name testUint8ClampedArrayPropertiesThree014
     * @tc.desc Verify reading BYTES_PER_ELEMENT on [1,2,3] does not change length, BYTES_PER_ELEMENT=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const before: int = arr.length;
      const tmp = arr.BYTES_PER_ELEMENT;
      expect(arr.length).assertEqual(before);
      expect(tmp).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_1500
     * @tc.name testUint8ClampedArrayPropertiesThree015
     * @tc.desc Verify reading buffer on [10,20,30] returns buffer with byteLength=3, elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const tmp = arr.buffer;
      expect(tmp.byteLength).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_1600
     * @tc.name testUint8ClampedArrayPropertiesThree016
     * @tc.desc Verify reading byteOffset on view(buf,2,4) does not change byteLength, byteOffset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(8), 2, 4);
      const before: int = arr.byteLength;
      const tmp = arr.byteOffset;
      expect(arr.byteLength).assertEqual(before);
      expect(tmp).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_1700
     * @tc.name testUint8ClampedArrayPropertiesThree017
     * @tc.desc Verify reading byteLength on Uint8ClampedArray(8) does not change length, byteLength=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      const before: int = arr.length;
      const tmp = arr.byteLength;
      expect(arr.length).assertEqual(before);
      expect(tmp).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_1800
     * @tc.name testUint8ClampedArrayPropertiesThree018
     * @tc.desc Verify reading length on Uint8ClampedArray(8) does not change byteLength, length=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      const before: int = arr.byteLength;
      const tmp = arr.length;
      expect(arr.byteLength).assertEqual(before);
      expect(tmp).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_1900
     * @tc.name testUint8ClampedArrayPropertiesThree019
     * @tc.desc Verify reading name on [1,2,3] does not change length, name='Uint8ClampedArray'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const before: int = arr.length;
      const tmp = arr.name;
      expect(arr.length).assertEqual(before);
      expect(tmp).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_2000
     * @tc.name testUint8ClampedArrayPropertiesThree020
     * @tc.desc Verify two reads of buffer on Uint8ClampedArray(4) return identical reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const b1 = arr.buffer;
      const b2 = arr.buffer;
      expect(b1).assertEqual(b2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_2100
     * @tc.name testUint8ClampedArrayPropertiesThree021
     * @tc.desc Verify two reads of byteOffset on view(buf,1,2) return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(4), 1, 2);
      const byteOffsetA: int = arr.byteOffset;
      const byteOffsetB: int = arr.byteOffset;
      expect(byteOffsetA).assertEqual(byteOffsetB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_2200
     * @tc.name testUint8ClampedArrayPropertiesThree022
     * @tc.desc Verify two reads of byteLength on Uint8ClampedArray(8) return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      const byteLengthA: int = arr.byteLength;
      const byteLengthB: int = arr.byteLength;
      expect(byteLengthA).assertEqual(byteLengthB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_2300
     * @tc.name testUint8ClampedArrayPropertiesThree023
     * @tc.desc Verify two reads of length on Uint8ClampedArray(8) return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      const lengthA: int = arr.length;
      const lengthB: int = arr.length;
      expect(lengthA).assertEqual(lengthB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_2400
     * @tc.name testUint8ClampedArrayPropertiesThree024
     * @tc.desc Verify two reads of name on Uint8ClampedArray(4) return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const nameA: string = arr.name;
      const nameB: string = arr.name;
      expect(nameA).assertEqual(nameB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_2500
     * @tc.name testUint8ClampedArrayPropertiesThree025
     * @tc.desc Verify two reads of BYTES_PER_ELEMENT on Uint8ClampedArray(4) return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const bytesPerElementA: int = arr.BYTES_PER_ELEMENT;
      const bytesPerElementB: int = arr.BYTES_PER_ELEMENT;
      expect(bytesPerElementA).assertEqual(bytesPerElementB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_2600
     * @tc.name testUint8ClampedArrayPropertiesThree026
     * @tc.desc Verify two non-overlapping views on ArrayBuffer(8) have byteLength sum <= buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw = new ArrayBuffer(8);
      const frontView = new Uint8ClampedArray(raw, 0, 3);
      const backView = new Uint8ClampedArray(raw, 3, 5);
      expect(frontView.byteLength + backView.byteLength).assertLessOrEqual(raw.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_2700
     * @tc.name testUint8ClampedArrayPropertiesThree027
     * @tc.desc Verify zero-length view on ArrayBuffer(8) at offset=4 has byteOffset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw = new ArrayBuffer(8);
      const v = new Uint8ClampedArray(raw, 4, 0);
      expect(v.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_2800
     * @tc.name testUint8ClampedArrayPropertiesThree028
     * @tc.desc Verify as cast throws ClassCastError and BYTES_PER_ELEMENT equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      try {
        const obj: Object = arr as Object;
        obj as Record<string, int>;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_2900
     * @tc.name testUint8ClampedArrayPropertiesThree029
     * @tc.desc Verify explicit length 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_3000
     * @tc.name testUint8ClampedArrayPropertiesThree030
     * @tc.desc Verify explicit length 0 byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_3100
     * @tc.name testUint8ClampedArrayPropertiesThree031
     * @tc.desc Verify explicit length 1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_3200
     * @tc.name testUint8ClampedArrayPropertiesThree032
     * @tc.desc Verify empty array literal byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_3300
     * @tc.name testUint8ClampedArrayPropertiesThree033
     * @tc.desc Verify new Uint8ClampedArray([256]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_3400
     * @tc.name testUint8ClampedArrayPropertiesThree034
     * @tc.desc Verify new Uint8ClampedArray([-1]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_3500
     * @tc.name testUint8ClampedArrayPropertiesThree035
     * @tc.desc Verify new Uint8ClampedArray([Number.NaN]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_3600
     * @tc.name testUint8ClampedArrayPropertiesThree036
     * @tc.desc Verify new Uint8ClampedArray([Number.POSITIVE_INFINITY]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_3700
     * @tc.name testUint8ClampedArrayPropertiesThree037
     * @tc.desc Verify new Uint8ClampedArray([-Number.POSITIVE_INFINITY]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_3800
     * @tc.name testUint8ClampedArrayPropertiesThree038
     * @tc.desc Verify new Uint8ClampedArray([0xFF]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0xFF]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_3900
     * @tc.name testUint8ClampedArrayPropertiesThree039
     * @tc.desc Verify new Uint8ClampedArray([0o377]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o377]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_4000
     * @tc.name testUint8ClampedArrayPropertiesThree040
     * @tc.desc Verify new Uint8ClampedArray([0b11111111]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b11111111]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_4100
     * @tc.name testUint8ClampedArrayPropertiesThree041
     * @tc.desc Verify new Uint8ClampedArray([1e2]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e2]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_4200
     * @tc.name testUint8ClampedArrayPropertiesThree042
     * @tc.desc Verify new Uint8ClampedArray([1e9]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e9]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_4300
     * @tc.name testUint8ClampedArrayPropertiesThree043
     * @tc.desc Verify new Uint8ClampedArray([-1e9]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1e9]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_4400
     * @tc.name testUint8ClampedArrayPropertiesThree044
     * @tc.desc Verify new Uint8ClampedArray([0.5]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_4500
     * @tc.name testUint8ClampedArrayPropertiesThree045
     * @tc.desc Verify new Uint8ClampedArray([127.5]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_4600
     * @tc.name testUint8ClampedArrayPropertiesThree046
     * @tc.desc Verify new Uint8ClampedArray([Number.MAX_VALUE]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.MAX_VALUE]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_4700
     * @tc.name testUint8ClampedArrayPropertiesThree047
     * @tc.desc Verify new Uint8ClampedArray([Number.MIN_VALUE]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.MIN_VALUE]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_4800
     * @tc.name testUint8ClampedArrayPropertiesThree048
     * @tc.desc Verify new Uint8ClampedArray([-0]) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-0]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_4900
     * @tc.name testUint8ClampedArrayPropertiesThree049
     * @tc.desc Verify mixed [0,255,256,-1,NaN] length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 256, -1, Number.NaN]);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_5000
     * @tc.name testUint8ClampedArrayPropertiesThree050
     * @tc.desc Verify mixed [0,255,256,-1,NaN] byteLength 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 256, -1, Number.NaN]);
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_5100
     * @tc.name testUint8ClampedArrayPropertiesThree051
     * @tc.desc Verify byteOffset -100 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        const arr = new Uint8ClampedArray(buf, -100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_5200
     * @tc.name testUint8ClampedArrayPropertiesThree052
     * @tc.desc Verify byteOffset 0o10 equals 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 0o10);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_5300
     * @tc.name testUint8ClampedArrayPropertiesThree053
     * @tc.desc Verify byteOffset 0b100 equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 0b100);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_5400
     * @tc.name testUint8ClampedArrayPropertiesThree054
     * @tc.desc Verify length -100 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Uint8ClampedArray(-100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_5500
     * @tc.name testUint8ClampedArrayPropertiesThree055
     * @tc.desc Verify length 0o20 equals 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0o20);
      expect(arr.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_5600
     * @tc.name testUint8ClampedArrayPropertiesThree056
     * @tc.desc Verify length 0b10000 equals 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0b10000);
      expect(arr.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_5700
     * @tc.name testUint8ClampedArrayPropertiesThree057
     * @tc.desc Verify of zero args length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_5800
     * @tc.name testUint8ClampedArrayPropertiesThree058
     * @tc.desc Verify of [256] clamps to [255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(256);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_5900
     * @tc.name testUint8ClampedArrayPropertiesThree059
     * @tc.desc Verify of(NaN) length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(Number.NaN);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_6000
     * @tc.name testUint8ClampedArrayPropertiesThree060
     * @tc.desc Verify of [-1] clamps to [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(-1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_6100
     * @tc.name testUint8ClampedArrayPropertiesThree061
     * @tc.desc Verify length construct buffer.byteLength equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      expect(arr.buffer.byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_6200
     * @tc.name testUint8ClampedArrayPropertiesThree062
     * @tc.desc Verify of buffer.byteLength equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3, 4);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_6300
     * @tc.name testUint8ClampedArrayPropertiesThree063
     * @tc.desc Verify BYTES_PER_ELEMENT assignable to int value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const v: int = arr.BYTES_PER_ELEMENT;
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_6400
     * @tc.name testUint8ClampedArrayPropertiesThree064
     * @tc.desc Verify BYTES_PER_ELEMENT empty length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_6500
     * @tc.name testUint8ClampedArrayPropertiesThree065
     * @tc.desc Verify BYTES_PER_ELEMENT 65535 length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(65535);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_6600
     * @tc.name testUint8ClampedArrayPropertiesThree066
     * @tc.desc Verify BYTES_PER_ELEMENT buffer construct 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(16));
      expect(arr.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_6700
     * @tc.name testUint8ClampedArrayPropertiesThree067
     * @tc.desc Verify BYTES_PER_ELEMENT subarray 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.BYTES_PER_ELEMENT).assertEqual(1);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_6800
     * @tc.name testUint8ClampedArrayPropertiesThree068
     * @tc.desc Verify BYTES_PER_ELEMENT slice 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const s = arr.slice(0, 2);
      expect(s.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_6900
     * @tc.name testUint8ClampedArrayPropertiesThree069
     * @tc.desc Verify ArrayBuffer(16) buffer ref equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(raw);
      expect(arr.buffer).assertEqual(raw);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_7000
     * @tc.name testUint8ClampedArrayPropertiesThree070
     * @tc.desc Verify ArrayBuffer(16) buffer.byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(16));
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_7100
     * @tc.name testUint8ClampedArrayPropertiesThree071
     * @tc.desc Verify byteOffset assignable to int value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const v: int = arr.byteOffset;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_7200
     * @tc.name testUint8ClampedArrayPropertiesThree072
     * @tc.desc Verify byteLength assignable to int value 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const v: int = arr.byteLength;
      expect(v).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_7300
     * @tc.name testUint8ClampedArrayPropertiesThree073
     * @tc.desc Verify length assignable to int value 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      const v: int = arr.length;
      expect(v).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_7400
     * @tc.name testUint8ClampedArrayPropertiesThree074
     * @tc.desc Verify byteOffset 0 two-param equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_7500
     * @tc.name testUint8ClampedArrayPropertiesThree075
     * @tc.desc Verify byteOffset 1 two-param equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 1);
      expect(arr.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_7600
     * @tc.name testUint8ClampedArrayPropertiesThree076
     * @tc.desc Verify byteOffset 2 two-param equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_7700
     * @tc.name testUint8ClampedArrayPropertiesThree077
     * @tc.desc Verify byteOffset 8 two-param equals 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 8);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_7800
     * @tc.name testUint8ClampedArrayPropertiesThree078
     * @tc.desc Verify byteOffset 15 two-param equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Uint8ClampedArray(buf, 15);
      expect(arr.byteOffset).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_7900
     * @tc.name testUint8ClampedArrayPropertiesThree079
     * @tc.desc Verify byteOffset byteLength two-param equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_8000
     * @tc.name testUint8ClampedArrayPropertiesThree080
     * @tc.desc Verify byteOffset byteLength-1 two-param equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 3);
      expect(arr.byteOffset).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_8100
     * @tc.name testUint8ClampedArrayPropertiesThree081
     * @tc.desc Verify explicit length 1 byteLength 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      expect(arr.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_8200
     * @tc.name testUint8ClampedArrayPropertiesThree082
     * @tc.desc Verify int construct name Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      expect(arr.name).assertEqual('Uint8ClampedArray');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_8300
     * @tc.name testUint8ClampedArrayPropertiesThree083
     * @tc.desc Verify subarray byteLength equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      const sub = arr.subarray(2, 7);
      expect(sub.byteLength).assertEqual(sub.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_8400
     * @tc.name testUint8ClampedArrayPropertiesThree084
     * @tc.desc Verify subarray byteOffset parent plus start equals 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(16), 4, 10);
      const sub = arr.subarray(2, 5);
      expect(sub.byteOffset).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_8500
     * @tc.name testUint8ClampedArrayPropertiesThree085
     * @tc.desc Verify subarray BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(10);
      const sub = arr.subarray(2, 7);
      expect(sub.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_8600
     * @tc.name testUint8ClampedArrayPropertiesThree086
     * @tc.desc Verify same buffer multi-view byteOffset different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw = new ArrayBuffer(8);
      const frontView = new Uint8ClampedArray(raw, 0, 4);
      const backView = new Uint8ClampedArray(raw, 4, 4);
      expect(frontView.byteOffset).assertEqual(0);
      expect(backView.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_8700
     * @tc.name testUint8ClampedArrayPropertiesThree087
     * @tc.desc Verify same buffer multi-view length independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw = new ArrayBuffer(8);
      const frontView = new Uint8ClampedArray(raw, 0, 3);
      const backView = new Uint8ClampedArray(raw, 3, 5);
      expect(frontView.length).assertEqual(3);
      expect(backView.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_8800
     * @tc.name testUint8ClampedArrayPropertiesThree088
     * @tc.desc Verify zero-length view buffer ref equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const raw = new ArrayBuffer(8);
      const v = new Uint8ClampedArray(raw, 4, 0);
      expect(v.buffer).assertEqual(raw);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_8900
     * @tc.name testUint8ClampedArrayPropertiesThree089
     * @tc.desc Verify empty length 0 byteLength 0 buffer.byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_9000
     * @tc.name testUint8ClampedArrayPropertiesThree090
     * @tc.desc Verify byteLength equals length times BYTES_PER_ELEMENT 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(100);
      expect(arr.byteLength).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_9100
     * @tc.name testUint8ClampedArrayPropertiesThree091
     * @tc.desc Verify static BYTES_PER_ELEMENT equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_PROPERTIES_THREE_9200
     * @tc.name testUint8ClampedArrayPropertiesThree092
     * @tc.desc Verify instance BYTES_PER_ELEMENT equals static
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayPropertiesThree092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(Uint8ClampedArray.BYTES_PER_ELEMENT);
    });
  });
}
