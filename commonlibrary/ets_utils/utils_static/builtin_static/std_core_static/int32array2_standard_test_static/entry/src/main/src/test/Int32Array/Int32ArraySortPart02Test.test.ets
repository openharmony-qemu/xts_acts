'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

class RangeErr extends Error {
  constructor() {
    super('r');
    this.name = 'RangeError';
  }
}

class TypeErr extends Error {
  constructor() {
    super('t');
    this.name = 'TypeError';
  }
}

export default function int32ArraySortPart02Test(): void {
  describe('Int32ArraySortPart02Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArraySortPart02Test001
     * @tc.desc Verify sort without compareFn returns the same reference and sorts values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const r = v.sort();
      expect(r).assertEqual(v);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArraySortPart02Test002
     * @tc.desc Verify sort with compareFn returns the same reference and sorts values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const cmp = (a: number, b: number): int => {
        return a < b ? -1 : (a > b ? 1 : 0);
      };
      const r = v.sort(cmp);
      expect(r).assertEqual(v);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArraySortPart02Test003
     * @tc.desc Verify sorting an empty array returns the same empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Int32Array(0);
      const r = v.sort();
      expect(r).assertEqual(v);
      expect(r.length).assertEqual(0);
      {
        const v = new Int32Array(0);
        v.sort();
        expect(v.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArraySortPart02Test004
     * @tc.desc Verify sorting a single element returns the same unchanged array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(42);
      const r = v.sort();
      expect(r).assertEqual(v);
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArraySortPart02Test005
     * @tc.desc Verify ArrayBuffer view sort returns ArrayBuffer.isView true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const v = new Int32Array(buf);
      v.$_set(0, 3);
      v.$_set(1, 1);
      v.$_set(2, 2);
      const r = v.sort();
      expect(ArrayBuffer.isView(r)).assertTrue();
      expect(r).assertEqual(v);
      expect(r.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArraySortPart02Test006
     * @tc.desc Verify sort returns the original array instead of null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(1, 2, 3);
      const r = v.sort();
      expect(r).assertEqual(v);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArraySortPart02Test007
     * @tc.desc Verify sort return BYTES_PER_ELEMENT strictly equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(1, 2);
      const r = v.sort();
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArraySortPart02Test008
     * @tc.desc Verify sort with compareFn returns same reference as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const cmp = (a: number, b: number): int => {
        return a < b ? -1 : 1;
      };
      const r = v.sort(cmp);
      expect(r).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArraySortPart02Test009
     * @tc.desc Verify single element array sort returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(7);
      const r = v.sort();
      expect(r).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArraySortPart02Test010
     * @tc.desc Verify subarray view sort returns subarray same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Int32Array.of(5, 3, 1, 4, 2);
      const sub = base.subarray(1, 4);
      const r = sub.sort();
      expect(r).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArraySortPart02Test011
     * @tc.desc Verify consecutive double sort returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const r1 = v.sort();
      const r2 = r1.sort();
      expect(r2).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArraySortPart02Test012
     * @tc.desc Verify 3-element sort without compareFn keeps length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      v.sort();
      expect(v.length).assertEqual(3);
      expect(v.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArraySortPart02Test013
     * @tc.desc Verify 3-element sort with compareFn keeps length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const cmp = (a: number, b: number): int => {
        return a < b ? -1 : 1;
      };
      v.sort(cmp);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArraySortPart02Test014
     * @tc.desc Verify single element sort keeps length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(42);
      v.sort();
      expect(v.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArraySortPart02Test015
     * @tc.desc Verify 6-element array sort keeps length 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(6, 5, 4, 3, 2, 1);
      v.sort();
      expect(v.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArraySortPart02Test016
     * @tc.desc Verify 5-element sort byteLength is 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Int32Array(5);
      v.$_set(0, 5);
      v.$_set(1, 4);
      v.$_set(2, 3);
      v.$_set(3, 2);
      v.$_set(4, 1);
      v.sort();
      expect(v.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArraySortPart02Test017
     * @tc.desc Verify default ArrayBuffer view sort keeps byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const v = new Int32Array(buf);
      v.$_set(0, 4);
      v.$_set(1, 3);
      v.$_set(2, 2);
      v.$_set(3, 1);
      v.sort();
      expect(v.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArraySortPart02Test018
     * @tc.desc Verify byteOffset=4 view sort keeps byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const v = new Int32Array(buf, 4, 3);
      v.$_set(0, 9);
      v.$_set(1, 5);
      v.$_set(2, 7);
      v.sort();
      expect(v.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArraySortPart02Test019
     * @tc.desc Verify byteOffset=8 view sort keeps byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const v = new Int32Array(buf, 8, 2);
      v.$_set(0, 20);
      v.$_set(1, 10);
      v.sort();
      expect(v.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArraySortPart02Test020
     * @tc.desc Verify subarray offset view sort keeps byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Int32Array.of(0, 0, 5, 2, 7, 1);
      const sub = base.subarray(2, 5);
      sub.sort();
      expect(sub.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArraySortPart02Test021
     * @tc.desc Verify sort with compareFn buffer same as original buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const v = new Int32Array(buf);
      v.$_set(0, 4);
      v.$_set(1, 3);
      v.$_set(2, 2);
      v.$_set(3, 1);
      const cmp = (a: number, b: number): int => {
        return a < b ? -1 : (a > b ? 1 : 0);
      };
      v.sort(cmp);
      expect(v.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArraySortPart02Test022
     * @tc.desc Verify sort does not detach underlying buffer (byteLength preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const v = new Int32Array(buf);
      v.$_set(0, 3);
      v.$_set(1, 1);
      v.$_set(2, 2);
      v.sort();
      expect(buf.byteLength).assertEqual(12);
      {
        const buf = new ArrayBuffer(12);
        const v = new Int32Array(buf);
        v.$_set(0, 3);
        v.$_set(1, 1);
        v.$_set(2, 2);
        v.sort();
        const secondVal = new Int32Array(buf);
        expect(secondVal.$_get(0)).assertEqual(1);
        expect(secondVal.$_get(1)).assertEqual(2);
        expect(secondVal.$_get(2)).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArraySortPart02Test023
     * @tc.desc Verify two views sharing buffer, one sort visible to the other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const a1 = new Int32Array(buf);
      const a2 = new Int32Array(buf);
      a1.$_set(0, 6);
      a1.$_set(1, 4);
      a1.$_set(2, 5);
      a1.sort();
      expect(a2.$_get(0)).assertEqual(4);
      expect(a2.$_get(1)).assertEqual(5);
      expect(a2.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArraySortPart02Test024
     * @tc.desc Verify subarray sort writes through to parent view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Int32Array.of(100, 3, 1, 2, 200);
      const sub = base.subarray(1, 4);
      sub.sort();
      expect(base.$_get(0)).assertEqual(100);
      expect(base.$_get(1)).assertEqual(1);
      expect(base.$_get(2)).assertEqual(2);
      expect(base.$_get(3)).assertEqual(3);
      expect(base.$_get(4)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArraySortPart02Test025
     * @tc.desc Verify byteOffset=8 view sort, prefix view untouched, target sorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const prefix = new Int32Array(buf, 0, 2);
      const view = new Int32Array(buf, 8, 3);
      prefix.$_set(0, 99);
      prefix.$_set(1, 88);
      view.$_set(0, 7);
      view.$_set(1, 5);
      view.$_set(2, 6);
      view.sort();
      expect(prefix.$_get(0)).assertEqual(99);
      expect(prefix.$_get(1)).assertEqual(88);
      expect(view.$_get(0)).assertEqual(5);
      expect(view.$_get(1)).assertEqual(6);
      expect(view.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArraySortPart02Test026
     * @tc.desc Verify partially overlapping views sort, overlap region sorted visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Int32Array(buf, 0, 3);
      const b = new Int32Array(buf, 4, 3);
      a.$_set(0, 7);
      a.$_set(1, 2);
      a.$_set(2, 5);
      a.sort();
      expect(b.$_get(0)).assertEqual(5);
      expect(b.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArraySortPart02Test027
     * @tc.desc Verify sort().reverse() chain returns same reference, asc then rev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const r = v.sort().reverse();
      expect(r).assertEqual(v);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArraySortPart02Test028
     * @tc.desc Verify sort().fill(0) chain returns same reference, all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const r = v.sort().fill(0);
      expect(r).assertEqual(v);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArraySortPart02Test029
     * @tc.desc Verify sort().at(0) chain returns smallest element after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(5, 1, 3);
      const sorted = v.sort();
      const r = sorted.$_get(0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArraySortPart02Test030
     * @tc.desc Verify sort().$_get(length-1) returns max element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(5, 1, 3);
      v.sort();
      expect(v.$_get(v.length - 1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArraySortPart02Test031
     * @tc.desc Verify sort().indexOf finds sorted element position after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(9, 4, 7);
      const idx = v.sort().indexOf(7);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArraySortPart02Test032
     * @tc.desc Verify sort(desc).sort() chain still returns same ref, asc result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const desc = (a: number, b: number): int => {
        return a > b ? -1 : (a < b ? 1 : 0);
      };
      const r = v.sort(desc).sort();
      expect(r).assertEqual(v);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArraySortPart02Test033
     * @tc.desc Verify sort().$_set write through return ref mutates original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const r = v.sort();
      r.$_set(0, 99);
      expect(v.$_get(0)).assertEqual(99);
      expect(v.$_get(1)).assertEqual(2);
      expect(v.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArraySortPart02Test034
     * @tc.desc Verify sort().subarray chain returns new view sharing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const sub = v.sort().subarray(0, 2);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(1);
      expect(sub.$_get(1)).assertEqual(2);
      expect(sub.buffer).assertEqual(v.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArraySortPart02Test035
     * @tc.desc Verify sort().slice chain returns independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const cp = v.sort().slice();
      expect(cp.$_get(0)).assertEqual(1);
      expect(cp.$_get(2)).assertEqual(3);
      cp.$_set(0, 99);
      expect(v.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArraySortPart02Test036
     * @tc.desc Verify sort().copyWithin chain returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2, 4);
      const r = v.sort().copyWithin(2, 0, 2);
      expect(r).assertEqual(v);
      expect(r.$_get(2)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArraySortPart02Test037
     * @tc.desc Verify empty array sort chain does not throw, length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Int32Array(0);
      expect(v.sort().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArraySortPart02Test038
     * @tc.desc Verify asc compareFn sort [5,1,3,2,4] first=1 last=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(5, 1, 3, 2, 4);
      const cmp = (a: number, b: number): int => {
        return a < b ? -1 : (a > b ? 1 : 0);
      };
      const r = v.sort(cmp);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArraySortPart02Test039
     * @tc.desc Verify desc compareFn sort [1,2,3] first=3 last=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(1, 2, 3);
      const cmp = (a: number, b: number): int => {
        return a > b ? -1 : (a < b ? 1 : 0);
      };
      const r = v.sort(cmp);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArraySortPart02Test040
     * @tc.desc Verify reversed [3,2,1] sorted ascending by default sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 2, 1);
      const r = v.sort();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArraySortPart02Test041
     * @tc.desc Verify all equal elements unchanged after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(7, 7, 7);
      const r = v.sort();
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(7);
      expect(r.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArraySortPart02Test042
     * @tc.desc Verify negatives [-1,-3,-2] sorted numerically to [-3,-2,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(-1, -3, -2);
      const r = v.sort();
      expect(r.$_get(0)).assertEqual(-3);
      expect(r.$_get(1)).assertEqual(-2);
      expect(r.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArraySortPart02Test043
     * @tc.desc Verify [10,2,1] default numeric asc toString yields '1,2,10'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(10, 2, 1);
      const s = v.sort().toString();
      expect(s).assertEqual('1,2,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArraySortPart02Test044
     * @tc.desc Verify [20,3,100] join(',') yields '3,20,100' confirming non-lexicographic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(20, 3, 100);
      const s = v.sort().join(',');
      expect(s).assertEqual('3,20,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArraySortPart02Test045
     * @tc.desc Verify compareFn always returns 1 still returns this, length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(1, 2, 3);
      const r = v.sort((_a: number, _b: number): int => {
        return 1;
      });
      expect(r).assertEqual(v);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArraySortPart02Test046
     * @tc.desc Verify compareFn always returns -1 still returns this, length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(1, 2, 3);
      const r = v.sort((_a: number, _b: number): int => {
        return -1;
      });
      expect(r).assertEqual(v);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArraySortPart02Test047
     * @tc.desc Verify compareFn always returns 0 keeps original relative order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(1, 2, 3);
      const r = v.sort((_a: number, _b: number): int => {
        return 0;
      });
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArraySortPart02Test048
     * @tc.desc Verify compareFn is invoked and sort produces the expected order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(2, 1);
      let same = false;
      const r = v.sort((a: number, b: number): int => {
        same = true;
        return a < b ? -1 : 1;
      });
      expect(same).assertTrue();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArraySortPart02Test049
     * @tc.desc Verify compareFn keeps ascending elements in exact order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(1, 2);
      v.sort((a: number, b: number): int => {
        return a < b ? -1 : 1;
      });
      expect(v.$_get(0)).assertEqual(1);
      expect(v.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArraySortPart02Test050
     * @tc.desc Verify compareFn external counter, callback actually invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: number = 0;
      const v = Int32Array.of(3, 1, 2);
      const r = v.sort((a: number, b: number): int => {
        cnt = cnt + 1;
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      expect(r).assertEqual(v);
      expect(cnt > 0).assertTrue();
      expect(v.$_get(0)).assertEqual(1);
      expect(v.$_get(1)).assertEqual(2);
      expect(v.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArraySortPart02Test051
     * @tc.desc Verify sort return iterated with forEach yields ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const out: int[] = [];
      v.sort().forEach((x: number): void => {
        out.push(Double.toInt(x));
      });
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual(1);
      expect(out[1]).assertEqual(2);
      expect(out[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArraySortPart02Test052
     * @tc.desc Verify sort return keys iterator yields 3 indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(5, 1, 3);
      const r = v.sort();
      let cnt: number = 0;
      const it = r.keys();
      let cur = it.next();
      while (!cur.done) {
        cnt = cnt + 1;
        cur = it.next();
      }
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArraySortPart02Test053
     * @tc.desc Verify sort return values iterator yields ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(5, 1, 3);
      const r = v.sort();
      const out: int[] = [];
      for (let i = 0; i < r.length; i++) {
        let x = r.$_get(i);
        out.push(Double.toInt(x));
      }
      expect(out[0]).assertEqual(1);
      expect(out[1]).assertEqual(3);
      expect(out[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArraySortPart02Test054
     * @tc.desc Verify array with INT_MIN sorted ascending, INT_MIN at first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(0, -2147483648, 1);
      v.sort();
      expect(v.$_get(0)).assertEqual(-2147483648);
      expect(v.$_get(1)).assertEqual(0);
      expect(v.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArraySortPart02Test055
     * @tc.desc Verify INT_MIN and INT_MAX coexist sorted without overflow error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(2147483647, -2147483648, 0);
      v.sort();
      expect(v.$_get(0)).assertEqual(-2147483648);
      expect(v.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArraySortPart02Test056
     * @tc.desc Verify [1,INT32_MAX,-5] sort asc, INT32_MAX at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(1, 2147483647, -5);
      v.sort();
      expect(v.$_get(0)).assertEqual(-5);
      expect(v.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArraySortPart02Test057
     * @tc.desc Verify compareFn comparing INT_MIN and -1 returns negative, INT_MIN first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(-1, -2147483648);
      const cmp = (a: number, b: number): int => {
        return a < b ? -1 : (a > b ? 1 : 0);
      };
      v.sort(cmp);
      expect(v.$_get(0)).assertEqual(-2147483648);
      expect(v.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArraySortPart02Test058
     * @tc.desc Verify desc comparator with INT_MIN, INT_MIN at last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(0, -2147483648, 100);
      const cmp = (a: number, b: number): int => {
        return a > b ? -1 : (a < b ? 1 : 0);
      };
      const r = v.sort(cmp);
      expect(r).assertEqual(v);
      expect(v.$_get(0)).assertEqual(100);
      expect(v.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArraySortPart02Test059
     * @tc.desc Verify 0  (0xFFFFFFFF wraps to -1) sort as -1 in negative region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Int32Array(2);
      v.$_set(0, 0xFFFFFFFF as number);
      v.$_set(1, 5);
      v.sort();
      expect(v.$_get(0)).assertEqual(-1);
      expect(v.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArraySortPart02Test060
     * @tc.desc Verify 0  (2^32 wraps to 0) sort as 0 in middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Int32Array(2);
      v.$_set(0, 4294967296 as number);
      v.$_set(1, 2);
      v.sort();
      expect(v.$_get(0)).assertEqual(0);
      expect(v.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArraySortPart02Test061
     * @tc.desc Verify float 3.9 (truncated to 3) sorted as 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Int32Array(2);
      v.$_set(0, 3.9);
      v.$_set(1, 1);
      const r = v.sort();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArraySortPart02Test062
     * @tc.desc Verify -3.9 (truncated to -3) sorted as -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Int32Array(2);
      v.$_set(0, -3.9);
      v.$_set(1, 1);
      const r = v.sort();
      expect(r.$_get(0)).assertEqual(-3);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArraySortPart02Test063
     * @tc.desc Verify $_set 0.5 (truncated to 0) via return ref, $_get reads 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const r = v.sort();
      r.$_set(1, 0.5);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArraySortPart02Test064
     * @tc.desc Verify $_set on an empty sorted array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Int32Array(0);
      const r = v.sort();
      try {
        r.$_set(0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(r.length).assertEqual(0);
      expect(r).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArraySortPart02Test065
     * @tc.desc Verify -0 and +0 treated equal, [-1,0,0] sorted -1 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(0, -1, 0);
      v.sort();
      expect(v.$_get(0)).assertEqual(-1);
      expect(v.$_get(1)).assertEqual(0);
      expect(v.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArraySortPart02Test066
     * @tc.desc Verify compareFn returns INT_MAX as positive signal, no crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(2, 1);
      const r = v.sort((_a: number, _b: number): int => {
        return 2147483647;
      });
      expect(r.length).assertEqual(2);
      expect(r).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArraySortPart02Test067
     * @tc.desc Verify compareFn returns INT_MIN as negative signal, no crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(2, 1);
      const r = v.sort((_a: number, _b: number): int => {
        return -2147483648;
      });
      expect(r.length).assertEqual(2);
      expect(r).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArraySortPart02Test068
     * @tc.desc Verify compareFn first throw Error, name is Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      try {
        v.sort((_a: number, _b: number): int => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      {
        const v = Int32Array.of(3, 1, 2);
        let reached = false;
        try {
          v.sort((_a: number, _b: number): int => {
            throw new Error('x');
          });
          reached = true;
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(reached).assertFalse();
      }
      {
        const v = Int32Array.of(3, 1, 2);
        try {
          v.sort((_a: number, _b: number): int => {
            throw new Error('x');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(v.length).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArraySortPart02Test069
     * @tc.desc Verify compareFn throws RangeError, name is RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      try {
        v.sort((_a: number, _b: number): int => {
          throw new RangeErr();
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_7000
     * @tc.name int32ArraySortPart02Test070
     * @tc.desc Verify compareFn throws TypeError, name is TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(1, 2, 3);
      try {
        v.sort((_a: number, _b: number): int => {
          throw new TypeErr();
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_7100
     * @tc.name int32ArraySortPart02Test071
     * @tc.desc Verify after compareFn throw, buffer not detached (can still create view)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const v = new Int32Array(buf);
      v.$_set(0, 3);
      v.$_set(1, 1);
      v.$_set(2, 2);
      try {
        v.sort((_a: number, _b: number): int => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(buf.byteLength).assertEqual(12);
      const secondVal = new Int32Array(buf);
      expect(secondVal.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_7200
     * @tc.name int32ArraySortPart02Test072
     * @tc.desc Verify 10 consecutive sort idempotent, result stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(7, 2, 5, 1);
      for (let i: number = 0; i < 10; i++) {
        v.sort();
      }
      expect(v.$_get(0)).assertEqual(1);
      expect(v.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_7300
     * @tc.name int32ArraySortPart02Test073
     * @tc.desc Verify sort then copy then sort again, results consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(9, 3, 7, 2);
      v.sort();
      const c = Int32Array.from(v);
      c.sort();
      expect(c.$_get(0)).assertEqual(2);
      expect(c.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_7400
     * @tc.name int32ArraySortPart02Test074
     * @tc.desc Verify sort reduce sum preserves original total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      v.sort();
      const sum = v.reduce((acc: number, x: number): number => {
        return acc + x;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_7500
     * @tc.name int32ArraySortPart02Test075
     * @tc.desc Verify sort every verifies non-decreasing order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(9, 3, 6, 1, 8);
      v.sort();
      let ok = true;
      for (let i: number = 1; i < v.length; i++) {
        if (v.$_get(Double.toInt(i)) < v.$_get(Double.toInt(i - 1))) {
          ok = false;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_7600
     * @tc.name int32ArraySortPart02Test076
     * @tc.desc Verify after sort, includes(INT_MIN) is true, INT_MIN at first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(5, -2147483648, 0, 3);
      v.sort();
      expect(v.includes(-2147483648)).assertTrue();
      expect(v.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART02_TEST_MINDMAP_7700
     * @tc.name int32ArraySortPart02Test077
     * @tc.desc Verify sort().join('') with empty string delimiter returns concatenated digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Int32Array.of(3, 1, 2);
      const s = v.sort().join('');
      expect(s).assertEqual('123');
    });
  });
}
