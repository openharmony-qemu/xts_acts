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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArrayMoreActionsTest(): void {
  describe('Float32ArrayMoreActionsTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_0100
     * @tc.name testFloat32ArrayMore001
     * @tc.desc Verify BYTES_PER_ELEMENT instance property equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_0200
     * @tc.name testFloat32ArrayMore002
     * @tc.desc Verify BYTES_PER_ELEMENT value is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const bpe: number = arr.BYTES_PER_ELEMENT;
      expect(bpe).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_0300
     * @tc.name testFloat32ArrayMore003
     * @tc.desc Verify BYTES_PER_ELEMENT is consistent across different instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Float32Array = Float32Array.of(1.0, 2.0);
      const b: Float32Array = new Float32Array(10);
      const c: Float32Array = new Float32Array(0);
      expect(a.BYTES_PER_ELEMENT).assertEqual(b.BYTES_PER_ELEMENT);
      expect(b.BYTES_PER_ELEMENT).assertEqual(c.BYTES_PER_ELEMENT);
      expect(c.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_0400
     * @tc.name testFloat32ArrayMore004
     * @tc.desc Verify length property equals constructor length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_0500
     * @tc.name testFloat32ArrayMore005
     * @tc.desc Verify length is 0 for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_0600
     * @tc.name testFloat32ArrayMore006
     * @tc.desc Verify non-empty array length equals constructor length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(7);
      expect(arr.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_0700
     * @tc.name testFloat32ArrayMore007
     * @tc.desc Verify length matches the constructor argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 8;
      const arr: Float32Array = new Float32Array(len);
      expect(arr.length).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_0800
     * @tc.name testFloat32ArrayMore008
     * @tc.desc Verify length remains unchanged after element writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const before: int = arr.length;
      arr.$_set(0, 10);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_0900
     * @tc.name testFloat32ArrayMore009
     * @tc.desc Verify length remains unchanged after filling values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(5);
      const before: int = arr.length;
      arr.fill(0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_1000
     * @tc.name testFloat32ArrayMore010
     * @tc.desc Verify length consistency after constructing from array literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0];
      const arr: Float32Array = new Float32Array(src);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_1100
     * @tc.name testFloat32ArrayMore011
     * @tc.desc Verify $_iterator() returns a non-null object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      const it = arr.$_iterator();
      const r = it.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_1200
     * @tc.name testFloat32ArrayMore012
     * @tc.desc Verify $_iterator() visits all elements and then completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      const it = arr.$_iterator();
      const first = it.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(1.0);
      const second = it.next();
      expect(second.done).assertFalse();
      expect(second.value).assertEqual(2.0);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_1300
     * @tc.name testFloat32ArrayMore013
     * @tc.desc Verify $_iterator() next call returns the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      const it = arr.$_iterator();
      const first = it.next();
      expect(first.done).assertFalse();
      expect(first.value).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_1400
     * @tc.name testFloat32ArrayMore014
     * @tc.desc Verify $_iterator() next returns value and done properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0);
      const it = arr.$_iterator();
      const r = it.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_1500
     * @tc.name testFloat32ArrayMore015
     * @tc.desc Verify $_iterator() iterates all elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(10.0, 20.0, 30.0);
      const it = arr.$_iterator();
      expect(it.next().value).assertEqual(10);
      expect(it.next().value).assertEqual(20);
      expect(it.next().value).assertEqual(30);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_1600
     * @tc.name testFloat32ArrayMore016
     * @tc.desc Verify $_iterator() on empty array immediately done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      const it = arr.$_iterator();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_1700
     * @tc.name testFloat32ArrayMore017
     * @tc.desc Verify $_iterator() works correctly on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const sub: Float32Array = arr.subarray(1, 4);
      const it = sub.$_iterator();
      expect(it.next().value).assertEqual(10);
      expect(it.next().value).assertEqual(-1);
      expect(it.next().value).assertEqual(0);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_1800
     * @tc.name testFloat32ArrayMore018
     * @tc.desc Verify $_iterator() iteration count equals array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(5);
      for (let i = 0; i < 5; i++) {
        arr.$_set(i, i + 1);
      }
      const it = arr.$_iterator();
      let count: number = 0;
      while (!it.next().done) {
        count = count + 1;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_1900
     * @tc.name testFloat32ArrayMore019
     * @tc.desc Verify $_iterator() two separate iterators are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const a = arr.$_iterator();
      const b = arr.$_iterator();
      expect(a.next().value).assertEqual(16);
      expect(b.next().value).assertEqual(16);
      expect(a.next().value).assertEqual(10);
      expect(b.next().value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_2000
     * @tc.name testFloat32ArrayMore020
     * @tc.desc Verify BYTES_PER_ELEMENT is consistent for buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const view: Float32Array = new Float32Array(buf, 4, 3);
      expect(view.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_2100
     * @tc.name testFloat32ArrayMore021
     * @tc.desc Verify $_iterator() reflects live changes to the underlying array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const it = arr.$_iterator();
      expect(it.next().value).assertEqual(16);
      arr.$_set(1, 99);
      expect(it.next().value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_2200
     * @tc.name testFloat32ArrayMore022
     * @tc.desc Verify $_iterator() exhausted returns done true, value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0);
      const it = arr.$_iterator();
      it.next();
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_2300
     * @tc.name testFloat32ArrayMore023
     * @tc.desc Verify $_iterator() on from()-constructed array iterates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.from([1, 2, 3]);
      const it = arr.$_iterator();
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      expect(it.next().value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_2400
     * @tc.name testFloat32ArrayMore024
     * @tc.desc Verify multi-byte relationship: byteLength = length * BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(6);
      expect(arr.byteLength).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_2500
     * @tc.name testFloat32ArrayMore025
     * @tc.desc Verify $_iterator() iterates NaN values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(NaN, 1.0);
      const it = arr.$_iterator();
      const first = it.next();
      expect(first.value).assertNaN();
      expect(first.done).assertFalse();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_2600
     * @tc.name testFloat32ArrayMore026
     * @tc.desc Verify length relation: of().length equals number of arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_2700
     * @tc.name testFloat32ArrayMore027
     * @tc.desc Verify $_iterator() on empty buffer view immediately done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      const arr: Float32Array = new Float32Array(buf);
      const it = arr.$_iterator();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_2800
     * @tc.name testFloat32ArrayMore028
     * @tc.desc Verify multiple $_iterator() calls return different iterator instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      const a = arr.$_iterator();
      const b = arr.$_iterator();
      expect(a.next().value).assertEqual(1.0);
      expect(b.next().value).assertEqual(1.0);
      expect(a.next().value).assertEqual(2.0);
      expect(b.next().value).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_2900
     * @tc.name testFloat32ArrayMore029
     * @tc.desc Verify length after fill is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(4);
      const before: int = arr.length;
      arr.fill(7);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_3000
     * @tc.name testFloat32ArrayMore030
     * @tc.desc Verify name property returns Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(2);
      const expectName: string = 'Float32Array';
      const actualName: string = arr.name;
      expect(actualName).assertEqual(expectName);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_3100
     * @tc.name testFloat32ArrayMore031
     * @tc.desc Verify offset view byteOffset byteLength and length are calculated from constructor arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bufferBytes: number = 24;
      const byteOffsetValue: number = 8;
      const viewLengthValue: number = 3;
      const buf: ArrayBuffer = new ArrayBuffer(bufferBytes);
      const view: Float32Array = new Float32Array(buf, byteOffsetValue, viewLengthValue);
      const expectByteLength: number = viewLengthValue * view.BYTES_PER_ELEMENT;
      expect(view.byteOffset).assertEqual(byteOffsetValue);
      expect(view.length).assertEqual(viewLengthValue);
      expect(view.byteLength).assertEqual(expectByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_3200
     * @tc.name testFloat32ArrayMore032
     * @tc.desc Verify buffer property is the same ArrayBuffer passed to the constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byteLengthValue: number = 16;
      const buf: ArrayBuffer = new ArrayBuffer(byteLengthValue);
      const view: Float32Array = new Float32Array(buf, 4, 2);
      const expectByteLength: number = byteLengthValue;
      expect(view.buffer).assertEqual(buf);
      expect(view.buffer.byteLength).assertEqual(expectByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_3300
     * @tc.name testFloat32ArrayMore033
     * @tc.desc Verify $_iterator observes a later element update before that element is yielded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      const it = arr.$_iterator();
      const first = it.next();
      const changedValue: number = 22.0;
      arr.$_set(1, changedValue);
      const second = it.next();
      expect(first.value).assertEqual(1.0);
      expect(second.value).assertEqual(changedValue);
      expect(arr.$_get(1)).assertEqual(changedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_3400
     * @tc.name testFloat32ArrayMore034
     * @tc.desc Verify empty constructor properties have zero lengths and the expected element byte size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array();
      const expectLength: int = 0;
      const expectByteLength: int = 0;
      const expectElementBytes: int = 4;
      expect(arr.length).assertEqual(expectLength);
      expect(arr.byteLength).assertEqual(expectByteLength);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(expectElementBytes);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_MORE_3500
     * @tc.name testFloat32ArrayMore035
     * @tc.desc Verify ArrayBuffer offset constructor reports view length byteLength and byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayMore035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view = new Float32Array(buffer, 4, 2);
      expect(view.length).assertEqual(2);
      expect(view.byteLength).assertEqual(8);
      expect(view.byteOffset).assertEqual(4);
    });

  });
}
