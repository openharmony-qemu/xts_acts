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

export default function Float32ArrayEntriesTest(): void {
  describe('Float32ArrayEntriesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0010
     * @tc.name testFloat32ArrayEntries001
     * @tc.desc Verify entries() no-arg call returns an iterator object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0);
      const it = arr.entries();
      expect(typeof it.next).assertEqual('function');
      const result = it.next();
      expect(result.done).assertFalse();
      expect((result.value!)[0]).assertEqual(0);
      expect((result.value!)[1]).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0020
     * @tc.name testFloat32ArrayEntries002
     * @tc.desc Verify new Float32Array().entries() is done immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Float32Array().entries().next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0030
     * @tc.name testFloat32ArrayEntries003
     * @tc.desc Verify entries function name property is entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Float32Array().entries.name).assertEqual('entries');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0040
     * @tc.name testFloat32ArrayEntries004
     * @tc.desc Verify two calls to entries() on the same array return different iterator instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const a = arr.entries();
      const b = arr.entries();
      expect((a.next().value!)[1]).assertEqual(1.0);
      expect((b.next().value!)[1]).assertEqual(1.0);
      expect((a.next().value!)[1]).assertEqual(2.0);
      expect((b.next().value!)[1]).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0050
     * @tc.name testFloat32ArrayEntries005
     * @tc.desc Verify entries iterator yields index and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const it = arr.entries();
      const r = it.next();
      expect((r.value!)[0]).assertEqual(0);
      expect((r.value!)[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0060
     * @tc.name testFloat32ArrayEntries006
     * @tc.desc Verify return value is non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const it = arr.entries();
      const r = it.next();
      expect(r.done).assertFalse();
      expect((r.value!)[0]).assertEqual(0);
      expect((r.value!)[1]).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0070
     * @tc.name testFloat32ArrayEntries007
     * @tc.desc Verify entries iterator reads a binary literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0b1010);
      const it = arr.entries();
      const r = it.next();
      expect((r.value!)[0]).assertEqual(0);
      expect((r.value!)[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0080
     * @tc.name testFloat32ArrayEntries008
     * @tc.desc Verify next() return value has a done property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const it = arr.entries();
      const r = it.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0090
     * @tc.name testFloat32ArrayEntries009
     * @tc.desc Verify next() return value has a value property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const it = arr.entries();
      const r = it.next();
      expect((r.value!)[0]).assertEqual(0);
      expect((r.value!)[1]).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0100
     * @tc.name testFloat32ArrayEntries010
     * @tc.desc Verify next() value is an Array tuple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0);
      const r = arr.entries().next();
      expect((r.value!).length).assertEqual(2);
      expect((r.value!)[0]).assertEqual(0);
      expect((r.value!)[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0110
     * @tc.name testFloat32ArrayEntries011
     * @tc.desc Verify first entry index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(8.0, 9.0);
      const r = arr.entries().next();
      expect((r.value!)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0120
     * @tc.name testFloat32ArrayEntries012
     * @tc.desc Verify first entry value equals the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(8.0, 9.0);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0130
     * @tc.name testFloat32ArrayEntries013
     * @tc.desc Verify entry value preserves the stored Float32 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0140
     * @tc.name testFloat32ArrayEntries014
     * @tc.desc Verify entry index for the first element is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0);
      const r = arr.entries().next();
      expect((r.value!)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0150
     * @tc.name testFloat32ArrayEntries015
     * @tc.desc Verify entry tuple length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const r = arr.entries().next();
      expect((r.value!).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0160
     * @tc.name testFloat32ArrayEntries016
     * @tc.desc Verify entry index is an integer with no decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const it = arr.entries();
      let allInt = true;
      for (let i = 0; i < 5; i++) {
        const e = it.next().value!;
        if (e[0] !== Math.floor(e[0])) {
          allInt = false;
        }
      }
      expect(allInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0170
     * @tc.name testFloat32ArrayEntries017
     * @tc.desc Verify single-element array first next().done is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const r = arr.entries().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0180
     * @tc.name testFloat32ArrayEntries018
     * @tc.desc Verify single-element array first next().value[0] is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const r = arr.entries().next();
      expect((r.value!)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0190
     * @tc.name testFloat32ArrayEntries019
     * @tc.desc Verify single-element array first next().value[1] equals the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0200
     * @tc.name testFloat32ArrayEntries020
     * @tc.desc Verify single-element array second next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const it = arr.entries();
      it.next();
      const r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0210
     * @tc.name testFloat32ArrayEntries021
     * @tc.desc Verify single-element entries iterator is done after one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const it = arr.entries();
      const first = it.next();
      expect((first.value!)[1]).assertEqual(42);
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0220
     * @tc.name testFloat32ArrayEntries022
     * @tc.desc Verify empty array entries first next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const r = arr.entries().next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0230
     * @tc.name testFloat32ArrayEntries023
     * @tc.desc Verify empty array entries first next is done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const r = arr.entries().next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0240
     * @tc.name testFloat32ArrayEntries024
     * @tc.desc Verify empty array indexed traversal executes 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      let count = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const entry: Array<number> = [__f32i, arr.$_get(__f32i)];
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0250
     * @tc.name testFloat32ArrayEntries025
     * @tc.desc Verify empty array consecutive next always done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.entries();
      it.next();
      const r2 = it.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0260
     * @tc.name testFloat32ArrayEntries026
     * @tc.desc Verify empty array entries return value is non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.entries();
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0270
     * @tc.name testFloat32ArrayEntries027
     * @tc.desc Verify two-element array produces 2 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0);
      const it = arr.entries();
      let count = 0;
      while (!it.next().done) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0280
     * @tc.name testFloat32ArrayEntries028
     * @tc.desc Verify two-element array index sequence is 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0);
      const it = arr.entries();
      const i0 = (it.next().value!)[0];
      const i1 = (it.next().value!)[0];
      expect(i0).assertEqual(0);
      expect(i1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0290
     * @tc.name testFloat32ArrayEntries029
     * @tc.desc Verify two-element array value sequence matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0);
      const it = arr.entries();
      const v0 = (it.next().value!)[1];
      const v1 = (it.next().value!)[1];
      expect(v0).assertEqual(10);
      expect(v1).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0300
     * @tc.name testFloat32ArrayEntries030
     * @tc.desc Verify three-element array index sequence is 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const it = arr.entries();
      const idx = [(it.next().value!)[0], (it.next().value!)[0], (it.next().value!)[0]];
      expect(idx[0]).assertEqual(0);
      expect(idx[1]).assertEqual(1);
      expect(idx[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0310
     * @tc.name testFloat32ArrayEntries031
     * @tc.desc Verify next() call count equals the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 6.0, 7.0, 8.0);
      const it = arr.entries();
      let calls = 0;
      while (true) {
        const r = it.next();
        calls++;
        if (r.done) {
          break;
        }
      }
      expect(calls).assertEqual(arr.length + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0320
     * @tc.name testFloat32ArrayEntries032
     * @tc.desc Verify three-element array value all match $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.5, 2.5, 3.5);
      const it = arr.entries();
      for (let i = 0; i < 3; i++) {
        const e = it.next().value!;
        expect(e[1]).assertEqual(arr.$_get(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0330
     * @tc.name testFloat32ArrayEntries033
     * @tc.desc Verify after exhausted next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const it = arr.entries();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0340
     * @tc.name testFloat32ArrayEntries034
     * @tc.desc Verify entries iterator stays done after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const it = arr.entries();
      it.next();
      it.next();
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0350
     * @tc.name testFloat32ArrayEntries035
     * @tc.desc Verify after exhausted multiple next still done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const it = arr.entries();
      it.next();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0360
     * @tc.name testFloat32ArrayEntries036
     * @tc.desc Verify each next() value tuple is a distinct object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const it = arr.entries();
      const first = it.next().value!;
      const second = it.next().value!;
      expect(first === second).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0370
     * @tc.name testFloat32ArrayEntries037
     * @tc.desc Verify non-empty array first done is boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const r = arr.entries().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0380
     * @tc.name testFloat32ArrayEntries038
     * @tc.desc Verify indexed traversal produces the count of all entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let count = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const entry: Array<number> = [__f32i, arr.$_get(__f32i)];
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0390
     * @tc.name testFloat32ArrayEntries039
     * @tc.desc Verify indexed traversal break exits early
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      let count = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const entry: Array<number> = [__f32i, arr.$_get(__f32i)];
        if (entry[0] === 2) {
          break;
        }
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0400
     * @tc.name testFloat32ArrayEntries040
     * @tc.desc Verify indexed traversal collects index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0, 8.0, 9.0);
      const idx: Array<number> = [];
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const entry: Array<number> = [__f32i, arr.$_get(__f32i)];
        idx.push(entry[0]);
      }
      expect(idx[0]).assertEqual(0);
      expect(idx[1]).assertEqual(1);
      expect(idx[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0410
     * @tc.name testFloat32ArrayEntries041
     * @tc.desc Verify indexed traversal collects value sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0, 8.0, 9.0);
      const vals: Array<number> = [];
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const entry: Array<number> = [__f32i, arr.$_get(__f32i)];
        vals.push(entry[1]);
      }
      expect(vals[0]).assertEqual(7);
      expect(vals[1]).assertEqual(8);
      expect(vals[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0420
     * @tc.name testFloat32ArrayEntries042
     * @tc.desc Verify indexed traversal and next() produce the same index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(11.0, 22.0, 33.0);
      const fa: Array<number> = [];
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const entry: Array<number> = [__f32i, arr.$_get(__f32i)];
        fa.push(entry[0]);
      }
      const it = arr.entries();
      const na: Array<number> = [];
      for (let i = 0; i < 3; i++) {
        na.push((it.next().value!)[0]);
      }
      expect(fa[0]).assertEqual(na[0]);
      expect(fa[1]).assertEqual(na[1]);
      expect(fa[2]).assertEqual(na[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0430
     * @tc.name testFloat32ArrayEntries043
     * @tc.desc Verify indexed traversal on an empty array does not enter the loop body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      let entered = false;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const entry: Array<number> = [__f32i, arr.$_get(__f32i)];
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0440
     * @tc.name testFloat32ArrayEntries044
     * @tc.desc Verify indexed traversal entry tuple length is always 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      let allLen2 = true;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const entry: Array<number> = [__f32i, arr.$_get(__f32i)];
        if (entry.length !== 2) {
          allLen2 = false;
        }
      }
      expect(allLen2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0450
     * @tc.name testFloat32ArrayEntries045
     * @tc.desc Verify two iterators do not affect each other's advancement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const a = arr.entries();
      const b = arr.entries();
      a.next();
      a.next();
      const rb = b.next();
      expect((rb.value!)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0460
     * @tc.name testFloat32ArrayEntries046
     * @tc.desc Verify advancing iterator a does not affect iterator b value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const a = arr.entries();
      const b = arr.entries();
      a.next();
      a.next();
      a.next();
      const rb = b.next();
      expect((rb.value!)[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0470
     * @tc.name testFloat32ArrayEntries047
     * @tc.desc Verify interleaved next calls advance independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const a = arr.entries();
      const b = arr.entries();
      const a0 = (a.next().value!)[0];
      const b0 = (b.next().value!)[0];
      const a1 = (a.next().value!)[0];
      expect(a0).assertEqual(0);
      expect(b0).assertEqual(0);
      expect(a1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0480
     * @tc.name testFloat32ArrayEntries048
     * @tc.desc Verify one iterator being exhausted does not affect the other continuing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 6.0);
      const a = arr.entries();
      const b = arr.entries();
      a.next();
      a.next();
      a.next();
      const rb = b.next();
      expect(rb.done).assertFalse();
      expect((rb.value!)[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0490
     * @tc.name testFloat32ArrayEntries049
     * @tc.desc Verify three iterators are fully independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const a = arr.entries();
      const b = arr.entries();
      const c = arr.entries();
      a.next();
      a.next();
      b.next();
      expect((a.next().value!)[0]).assertEqual(2);
      expect((b.next().value!)[0]).assertEqual(1);
      expect((c.next().value!)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0500
     * @tc.name testFloat32ArrayEntries050
     * @tc.desc Verify calling entries again after iterator exhausted restarts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const it = arr.entries();
      it.next();
      it.next();
      it.next();
      const fresh = arr.entries();
      expect((fresh.next().value!)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0510
     * @tc.name testFloat32ArrayEntries051
     * @tc.desc Verify NaN value entry asserts as NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(NaN);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0520
     * @tc.name testFloat32ArrayEntries052
     * @tc.desc Verify +Infinity value entry equals Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Infinity);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0530
     * @tc.name testFloat32ArrayEntries053
     * @tc.desc Verify -Infinity value entry equals -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-Infinity);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0540
     * @tc.name testFloat32ArrayEntries054
     * @tc.desc Verify +0 value entry equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0550
     * @tc.name testFloat32ArrayEntries055
     * @tc.desc Verify -0 value entry preserves negative zero sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0);
      const r = arr.entries().next();
      expect(1.0 / (r.value!)[1]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0560
     * @tc.name testFloat32ArrayEntries056
     * @tc.desc Verify Float32.MAX value entry equals the maximum finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0570
     * @tc.name testFloat32ArrayEntries057
     * @tc.desc Verify -Float32.MAX value entry equals the minimum finite negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-3.4028234663852886e+38);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0580
     * @tc.name testFloat32ArrayEntries058
     * @tc.desc Verify Float32.MIN_NORMAL value entry equals the minimum normal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1754943508222875e-38);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0590
     * @tc.name testFloat32ArrayEntries059
     * @tc.desc Verify Float32.MIN_VALUE value entry equals the minimum subnormal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.401298464324817e-45);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0600
     * @tc.name testFloat32ArrayEntries060
     * @tc.desc Verify 0.1 value entry equals $_get (precision truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0610
     * @tc.name testFloat32ArrayEntries061
     * @tc.desc Verify 0.2 value entry equals $_get (precision truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.2);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0620
     * @tc.name testFloat32ArrayEntries062
     * @tc.desc Verify 0.1+0.2 entry sum does not equal 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.2);
      const it = arr.entries();
      const s = (it.next().value!)[1] + (it.next().value!)[1];
      const expected = new Float32Array([0.1, 0.2]);
      expect(s).assertEqual(expected.$_get(0) + expected.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0630
     * @tc.name testFloat32ArrayEntries063
     * @tc.desc Verify 1.0e40 entry overflows to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e40);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0640
     * @tc.name testFloat32ArrayEntries064
     * @tc.desc Verify -1.0e40 entry overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0e40);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0650
     * @tc.name testFloat32ArrayEntries065
     * @tc.desc Verify 1.0e-46 entry underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e-46);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0660
     * @tc.name testFloat32ArrayEntries066
     * @tc.desc Verify 16777216 (2^24) entry is exact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0670
     * @tc.name testFloat32ArrayEntries067
     * @tc.desc Verify 16777217 entry truncates to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777217.0);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0680
     * @tc.name testFloat32ArrayEntries068
     * @tc.desc Verify 1.0000001 entry equals $_get (precision truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0000001);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0690
     * @tc.name testFloat32ArrayEntries069
     * @tc.desc Verify 1.1 entry equals $_get (precision truncation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0700
     * @tc.name testFloat32ArrayEntries070
     * @tc.desc Verify integer 2147483647 entry equals $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2147483647.0);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0710
     * @tc.name testFloat32ArrayEntries071
     * @tc.desc Verify integer -2147483648 entry equals $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-2147483648.0);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0720
     * @tc.name testFloat32ArrayEntries072
     * @tc.desc Verify [0, NaN, Infinity] three-element entry each preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, NaN, Infinity);
      const it = arr.entries();
      const v0 = (it.next().value!)[1];
      const v1 = (it.next().value!)[1];
      const v2 = (it.next().value!)[1];
      expect(v0).assertEqual(0);
      expect(v1).assertNaN();
      expect(v2).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0730
     * @tc.name testFloat32ArrayEntries073
     * @tc.desc Verify all-same-value array entry value all equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.5, 2.5, 2.5);
      const it = arr.entries();
      const a = (it.next().value!)[1];
      const b = (it.next().value!)[1];
      const c = (it.next().value!)[1];
      expect(a).assertEqual(2.5);
      expect(b).assertEqual(2.5);
      expect(c).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0740
     * @tc.name testFloat32ArrayEntries074
     * @tc.desc Verify all-zero array entry value all are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0, 0.0);
      const it = arr.entries();
      let allZero = true;
      for (let i = 0; i < 4; i++) {
        if ((it.next().value!)[1] !== 0) {
          allZero = false;
        }
      }
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0750
     * @tc.name testFloat32ArrayEntries075
     * @tc.desc Verify array with negative values entry value preserves sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(-1);
      expect((it.next().value!)[1]).assertEqual(-2);
      expect((it.next().value!)[1]).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0760
     * @tc.name testFloat32ArrayEntries076
     * @tc.desc Verify [MAX, MIN_VALUE, NaN] mixed entry each preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38, 1.401298464324817e-45, NaN);
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(3.4028234663852886e+38);
      expect((it.next().value!)[1]).assertEqual(1.401298464324817e-45);
      expect((it.next().value!)[1]).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0770
     * @tc.name testFloat32ArrayEntries077
     * @tc.desc Verify 9.0 hexadecimal float entry equals $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0780
     * @tc.name testFloat32ArrayEntries078
     * @tc.desc Verify 1.0e3 scientific notation entry equals 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e3);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0790
     * @tc.name testFloat32ArrayEntries079
     * @tc.desc Verify 0b10 binary integer entry equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0b10);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0800
     * @tc.name testFloat32ArrayEntries080
     * @tc.desc Verify 0o17 octal integer entry equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0o17);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0810
     * @tc.name testFloat32ArrayEntries081
     * @tc.desc Verify 1e-10 scientific notation decimal entry equals $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1e-10);
      const r = arr.entries().next();
      expect((r.value!)[1]).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0820
     * @tc.name testFloat32ArrayEntries082
     * @tc.desc Verify 10-element array index sequence is 0..9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0);
      const it = arr.entries();
      let ok = true;
      for (let i = 0; i < 10; i++) {
        if ((it.next().value!)[0] !== i) {
          ok = false;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0830
     * @tc.name testFloat32ArrayEntries083
     * @tc.desc Verify 100-element array last entry index is 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        src.push(i);
      }
      const arr = Float32Array.from(src);
      const it = arr.entries();
      let last = -1;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const e = __f32e.value!;
        last = e[0].toInt();
      }
      expect(last).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0840
     * @tc.name testFloat32ArrayEntries084
     * @tc.desc Verify last entry index equals length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const it = arr.entries();
      let lastIdx = -1;
      while (true) {
        const r = it.next();
        if (r.done) {
          break;
        }
        lastIdx = (r.value!)[0].toInt();
      }
      expect(lastIdx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0850
     * @tc.name testFloat32ArrayEntries085
     * @tc.desc Verify entry index is always non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const it = arr.entries();
      let nonNeg = true;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const e = __f32e.value!;
        if (e[0] < 0) {
          nonNeg = false;
        }
      }
      expect(nonNeg).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0860
     * @tc.name testFloat32ArrayEntries086
     * @tc.desc Verify entry index is strictly increasing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const it = arr.entries();
      let prev = -1;
      let increasing = true;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const e = __f32e.value!;
        if (e[0] <= prev) {
          increasing = false;
        }
        prev = e[0].toInt();
      }
      expect(increasing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0870
     * @tc.name testFloat32ArrayEntries087
     * @tc.desc Verify entry value equals $_get(index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.5, 2.5, 3.5);
      const it = arr.entries();
      for (let i = 0; i < 3; i++) {
        const e = it.next().value!;
        expect(e[1]).assertEqual(arr.$_get(e[0].toInt()));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0880
     * @tc.name testFloat32ArrayEntries088
     * @tc.desc Verify entry value equals at(index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const it = arr.entries();
      for (let i = 0; i < 3; i++) {
        const e = it.next().value!;
        expect(e[1]).assertEqual(arr.at(e[0].toInt()));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0890
     * @tc.name testFloat32ArrayEntries089
     * @tc.desc Verify entry index is consistent with counter i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 6.0, 7.0);
      const it = arr.entries();
      for (let i = 0; i < 3; i++) {
        expect((it.next().value!)[0]).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0900
     * @tc.name testFloat32ArrayEntries090
     * @tc.desc Verify from() constructed array entries iterates normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([1, 2, 3]);
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(1);
      expect((it.next().value!)[1]).assertEqual(2);
      expect((it.next().value!)[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0910
     * @tc.name testFloat32ArrayEntries091
     * @tc.desc Verify of() constructed array entries iterates normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0, 8.0, 7.0);
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(9);
      expect((it.next().value!)[1]).assertEqual(8);
      expect((it.next().value!)[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0920
     * @tc.name testFloat32ArrayEntries092
     * @tc.desc Verify length constructed array entries all are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const it = arr.entries();
      let allZero = true;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const e = __f32e.value!;
        if (e[1] !== 0) {
          allZero = false;
        }
      }
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0930
     * @tc.name testFloat32ArrayEntries093
     * @tc.desc Verify buffer view entries reflects buffer data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(1);
      expect((it.next().value!)[1]).assertEqual(2);
      expect((it.next().value!)[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0940
     * @tc.name testFloat32ArrayEntries094
     * @tc.desc Verify subarray view entries range is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const sub = arr.subarray(1, 4);
      const it = sub.entries();
      expect((it.next().value!)[0]).assertEqual(0);
      expect((it.next().value!)[1]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0950
     * @tc.name testFloat32ArrayEntries095
     * @tc.desc Verify slice result entries is independent of the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const sl = arr.slice(1, 3);
      const it = sl.entries();
      expect((it.next().value!)[1]).assertEqual(10);
      expect((it.next().value!)[1]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0960
     * @tc.name testFloat32ArrayEntries096
     * @tc.desc Verify single-element literal constructed array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(99.0);
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(99);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0970
     * @tc.name testFloat32ArrayEntries097
     * @tc.desc Verify after fill entries reflects the filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(7);
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(7);
      expect((it.next().value!)[1]).assertEqual(7);
      expect((it.next().value!)[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0980
     * @tc.name testFloat32ArrayEntries098
     * @tc.desc Verify after set entries reflects the set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.set(Float32Array.of(10.0, 20.0, 30.0), 0);
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(10);
      expect((it.next().value!)[1]).assertEqual(20);
      expect((it.next().value!)[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_0990
     * @tc.name testFloat32ArrayEntries099
     * @tc.desc Verify after reverse entries reverses order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.reverse();
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(-1);
      expect((it.next().value!)[1]).assertEqual(10);
      expect((it.next().value!)[1]).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1000
     * @tc.name testFloat32ArrayEntries100
     * @tc.desc Verify after sort entries is ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      arr.sort();
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(1);
      expect((it.next().value!)[1]).assertEqual(2);
      expect((it.next().value!)[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1010
     * @tc.name testFloat32ArrayEntries101
     * @tc.desc Verify after map new array entries reflects the mapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const mapped = arr.map((v: number) => v * 2);
      const it = mapped.entries();
      expect((it.next().value!)[1]).assertEqual(32);
      expect((it.next().value!)[1]).assertEqual(20);
      expect((it.next().value!)[1]).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1020
     * @tc.name testFloat32ArrayEntries102
     * @tc.desc Verify after filter new array entries reflects the filtering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const filtered = arr.filter((v: number) => v % 2 === 0);
      const it = filtered.entries();
      expect((it.next().value!)[1]).assertEqual(2);
      expect((it.next().value!)[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1030
     * @tc.name testFloat32ArrayEntries103
     * @tc.desc Verify after copyWithin entries reflects the copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 3);
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(0);
      expect((it.next().value!)[1]).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1040
     * @tc.name testFloat32ArrayEntries104
     * @tc.desc Verify subarray entries shared buffer write is visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const sub = arr.subarray(1, 3);
      arr.$_set(1, 99);
      const it = sub.entries();
      expect((it.next().value!)[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1050
     * @tc.name testFloat32ArrayEntries105
     * @tc.desc Verify after writing to the view entries reads the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const sub = arr.subarray(0, 2);
      sub.$_set(0, 50);
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1060
     * @tc.name testFloat32ArrayEntries106
     * @tc.desc Verify multiple views sharing the same buffer entries is consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const v1 = new Float32Array(buf, 0, 2);
      const v2 = new Float32Array(buf, 0, 2);
      v1.$_set(0, 7);
      const it = v2.entries();
      expect((it.next().value!)[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1070
     * @tc.name testFloat32ArrayEntries107
     * @tc.desc Verify offset buffer view entries starts at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const base = new Float32Array(buf);
      base.$_set(2, 42);
      const view = new Float32Array(buf, 8, 2);
      const it = view.entries();
      const first = it.next().value!;
      expect(first[0]).assertEqual(0);
      expect(first[1]).assertEqual(42);
      const second = it.next().value!;
      expect(second[0]).assertEqual(1);
      expect(second[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1080
     * @tc.name testFloat32ArrayEntries108
     * @tc.desc Verify length-1 array entries is exhausted after a single entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const it = arr.entries();
      expect(it.next().done).assertFalse();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1090
     * @tc.name testFloat32ArrayEntries109
     * @tc.desc Verify ArrayBuffer capacity 0 view entries immediately done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Float32Array(buf);
      const r = arr.entries().next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1100
     * @tc.name testFloat32ArrayEntries110
     * @tc.desc Verify length constructed 0-length array entries is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      let count = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const e: Array<number> = [__f32i, arr.$_get(__f32i)];
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1110
     * @tc.name testFloat32ArrayEntries111
     * @tc.desc Verify next() return value is not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const r = arr.entries().next();
      expect(r.done).assertFalse();
      expect((r.value!)[0]).assertEqual(0);
      expect((r.value!)[1]).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1120
     * @tc.name testFloat32ArrayEntries112
     * @tc.desc Verify before first next done is false (non-empty array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const r = arr.entries().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1130
     * @tc.name testFloat32ArrayEntries113
     * @tc.desc Verify value is undefined and done is true when exhausted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const it = arr.entries();
      it.next();
      const r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1140
     * @tc.name testFloat32ArrayEntries114
     * @tc.desc Verify consecutive next does not reset iterator position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const it = arr.entries();
      const a = (it.next().value!)[0];
      const b = (it.next().value!)[0];
      const c = (it.next().value!)[0];
      expect(a).assertEqual(0);
      expect(b).assertEqual(1);
      expect(c).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1150
     * @tc.name testFloat32ArrayEntries115
     * @tc.desc Verify entry value cannot affect the original array by modifying the tuple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const it = arr.entries();
      const e = it.next().value!;
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1160
     * @tc.name testFloat32ArrayEntries116
     * @tc.desc Verify modifying an element during iteration entry reflects the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const it = arr.entries();
      const first = it.next();
      arr.$_set(1, 99);
      const second = it.next();
      expect((second.value!)[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1170
     * @tc.name testFloat32ArrayEntries117
     * @tc.desc Verify fill during iteration subsequent entry reflects the fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const it = arr.entries();
      it.next();
      arr.fill(0);
      const second = it.next();
      expect((second.value!)[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1180
     * @tc.name testFloat32ArrayEntries118
     * @tc.desc Verify reverse during iteration does not affect taken entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const it = arr.entries();
      const first = (it.next().value!)[1];
      arr.reverse();
      expect(first).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1190
     * @tc.name testFloat32ArrayEntries119
     * @tc.desc Verify entries nested calls are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const outer = arr.entries();
      const o0 = (outer.next().value!)[0];
      const inner = arr.entries();
      const i0 = (inner.next().value!)[0];
      const o1 = (outer.next().value!)[0];
      expect(o0).assertEqual(0);
      expect(i0).assertEqual(0);
      expect(o1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1200
     * @tc.name testFloat32ArrayEntries120
     * @tc.desc Verify entries value used for reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let sum = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const e: Array<number> = [__f32i, arr.$_get(__f32i)];
        sum += e[1];
      }
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1210
     * @tc.name testFloat32ArrayEntries121
     * @tc.desc Verify entries iterates independently within map callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const mapped = arr.map((v: number) => {
        const it = arr.entries();
        let c = 0;
        for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
          const e = __f32e.value!;
          c++;
        }
        return v + c;
      });
      const it = mapped.entries();
      expect((it.next().value!)[1]).assertEqual(3);
      expect((it.next().value!)[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1220
     * @tc.name testFloat32ArrayEntries122
     * @tc.desc Verify entries and keys index are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const eit = arr.entries();
      const kit = arr.keys();
      for (let i = 0; i < 3; i++) {
        expect((eit.next().value!)[0]).assertEqual(kit.next().value);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1230
     * @tc.name testFloat32ArrayEntries123
     * @tc.desc Verify entries and values value are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const eit = arr.entries();
      const vit = arr.values();
      for (let i = 0; i < 3; i++) {
        expect((eit.next().value!)[1]).assertEqual(vit.next().value);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1240
     * @tc.name testFloat32ArrayEntries124
     * @tc.desc Verify entries tuple index and value are consistent across multiple bases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0b1, 0o2, 0x3);
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(1);
      expect((it.next().value!)[1]).assertEqual(2);
      expect((it.next().value!)[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1250
     * @tc.name testFloat32ArrayEntries125
     * @tc.desc Verify single-element NaN array entries done sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(NaN);
      const it = arr.entries();
      expect(it.next().done).assertFalse();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1260
     * @tc.name testFloat32ArrayEntries126
     * @tc.desc Verify two-element Infinity boundary array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Infinity, -Infinity);
      const it = arr.entries();
      expect((it.next().value!)[1]).assertEqual(Infinity);
      expect((it.next().value!)[1]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1270
     * @tc.name testFloat32ArrayEntries127
     * @tc.desc Verify large number of same values entries count is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i = 0; i < 50; i++) {
        src.push(1);
      }
      const arr = Float32Array.from(src);
      let count = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const e: Array<number> = [__f32i, arr.$_get(__f32i)];
        count++;
      }
      expect(count).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1280
     * @tc.name testFloat32ArrayEntries128
     * @tc.desc Verify entries iterator has no return method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const it = arr.entries();
      const propNames: string[] = Object.getOwnPropertyNames(it);
      expect(propNames.indexOf('return')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1290
     * @tc.name testFloat32ArrayEntries129
     * @tc.desc Verify entries iterator has no throw method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const it = arr.entries();
      const propNames: string[] = Object.getOwnPropertyNames(it);
      expect(propNames.indexOf('throw')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ENTRIES_1300
     * @tc.name testFloat32ArrayEntries130
     * @tc.desc Verify entries iterator observes source updates before next is consumed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEntries130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const iter = arr.entries();
      arr.$_set(0, 9.0);
      const first = iter.next();
      expect((first.value!)[0]).assertEqual(0);
      expect((first.value!)[1]).assertEqual(9.0);
    });

  });
}
