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

export default function Float32ArrayKeysTest(): void {
  describe('Float32ArrayKeysTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0010
     * @tc.name testFloat32ArrayKeys001
     * @tc.desc Verify keys() yields key 0 first for a non-empty Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it = arr.keys();
      const r = it.next();
      expect(r.value).assertEqual(0);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0020
     * @tc.name testFloat32ArrayKeys002
     * @tc.desc Verify keys() without args first next value is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0]);
      const it = arr.keys();
      const r = it.next();
      expect(r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0030
     * @tc.name testFloat32ArrayKeys003
     * @tc.desc Verify keys() without args on non-empty array first key is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0]);
      const it = arr.keys();
      const r = it.next();
      expect(r.value).assertEqual(0);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0040
     * @tc.name testFloat32ArrayKeys004
     * @tc.desc Verify keys() without args first key is 0 (not the element value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([8.0, 9.0]);
      const it = arr.keys();
      const iteratorValue004 = it.next().value;
      expect(iteratorValue004).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0050
     * @tc.name testFloat32ArrayKeys005
     * @tc.desc Verify keys() yields 0 then 1 for two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.keys();
      const iteratorValue005 = it.next().value;
      expect(iteratorValue005).assertEqual(0);
      const iteratorValue005Part2 = it.next().value;
      expect(iteratorValue005Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0060
     * @tc.name testFloat32ArrayKeys006
     * @tc.desc Verify keys() without args starts at key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0]);
      const it = arr.keys();
      const iteratorValue006 = it.next().value;
      expect(iteratorValue006).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0070
     * @tc.name testFloat32ArrayKeys007
     * @tc.desc Verify keys() first value is 0 on [1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const it = arr.keys();
      const observedValue007 = it.next().value;
      expect(observedValue007).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0080
     * @tc.name testFloat32ArrayKeys008
     * @tc.desc Verify keys() next() returns value 0 and done false on [1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const it = arr.keys();
      const result = it.next();
      expect(result.value).assertEqual(0);
      expect(result.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0090
     * @tc.name testFloat32ArrayKeys009
     * @tc.desc Verify keys() next().value equals 0 on [10.0,20.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      const it = arr.keys();
      const iteratorValue009 = it.next().value;
      expect(iteratorValue009).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0100
     * @tc.name testFloat32ArrayKeys010
     * @tc.desc Verify keys() first next().done is false on [10.0,20.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      const it = arr.keys();
      const iteratorValue010 = it.next().done;
      expect(iteratorValue010).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0110
     * @tc.name testFloat32ArrayKeys011
     * @tc.desc Verify keys() next().done is true after exhausting single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const it = arr.keys();
      it.next();
      const r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0120
     * @tc.name testFloat32ArrayKeys012
     * @tc.desc Verify keys() next().value is undefined after exhausting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const it = arr.keys();
      it.next();
      const r = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0130
     * @tc.name testFloat32ArrayKeys013
     * @tc.desc Verify keys() iteration does not modify array length on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const before = arr.length;
      const it = arr.keys();
      it.next();
      it.next();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0140
     * @tc.name testFloat32ArrayKeys014
     * @tc.desc Verify keys() iteration does not modify element values on [1.0,2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.keys();
      it.next();
      it.next();
      const element014 = arr.$_get(0);
      expect(element014).assertEqual(1.0);
      const element014Part2 = arr.$_get(1);
      expect(element014Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0150
     * @tc.name testFloat32ArrayKeys015
     * @tc.desc Verify two independent keys() iterators each start at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it1 = arr.keys();
      const it2 = arr.keys();
      it1.next();
      const iteratorValue015 = it2.next().value;
      expect(iteratorValue015).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0160
     * @tc.name testFloat32ArrayKeys016
     * @tc.desc Verify keys() on empty array done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.keys();
      const iteratorValue016 = it.next().done;
      expect(iteratorValue016).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0170
     * @tc.name testFloat32ArrayKeys017
     * @tc.desc Verify keys() on empty array value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.keys();
      const iteratorValue017 = it.next().value;
      expect(iteratorValue017).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0180
     * @tc.name testFloat32ArrayKeys018
     * @tc.desc Verify for loop on empty array count=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const iterator = arr.keys();
      const result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0190
     * @tc.name testFloat32ArrayKeys019
     * @tc.desc Verify keys() after exhaustion done is still true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.keys();
      it.next();
      const r2 = it.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0200
     * @tc.name testFloat32ArrayKeys020
     * @tc.desc Verify keys() on [42] value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      const it = arr.keys();
      const iteratorValue021 = it.next().value;
      expect(iteratorValue021).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0210
     * @tc.name testFloat32ArrayKeys021
     * @tc.desc Verify keys() on [42] done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      const it = arr.keys();
      const iteratorValue022 = it.next().done;
      expect(iteratorValue022).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0220
     * @tc.name testFloat32ArrayKeys022
     * @tc.desc Verify keys() on [42] after exhaustion done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      const it = arr.keys();
      it.next();
      const iteratorValue023 = it.next().done;
      expect(iteratorValue023).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0230
     * @tc.name testFloat32ArrayKeys023
     * @tc.desc Verify keys() on [42] after exhaustion value=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      const it = arr.keys();
      it.next();
      const iteratorValue024 = it.next().value;
      expect(iteratorValue024).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0240
     * @tc.name testFloat32ArrayKeys024
     * @tc.desc Verify keys() on [1.0,2.0,3.0] yields 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it = arr.keys();
      const iteratorValue026 = it.next().value;
      expect(iteratorValue026).assertEqual(0);
      const iteratorValue026Part2 = it.next().value;
      expect(iteratorValue026Part2).assertEqual(1);
      const iteratorValue026Part3 = it.next().value;
      expect(iteratorValue026Part3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0250
     * @tc.name testFloat32ArrayKeys025
     * @tc.desc Verify keys() on 5-element array yields 0..4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const it = arr.keys();
      const iteratorValue027 = it.next().value;
      expect(iteratorValue027).assertEqual(0);
      const iteratorValue027Part2 = it.next().value;
      expect(iteratorValue027Part2).assertEqual(1);
      const iteratorValue027Part3 = it.next().value;
      expect(iteratorValue027Part3).assertEqual(2);
      const iteratorValue027Part4 = it.next().value;
      expect(iteratorValue027Part4).assertEqual(3);
      const iteratorValue027Part5 = it.next().value;
      expect(iteratorValue027Part5).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0260
     * @tc.name testFloat32ArrayKeys026
     * @tc.desc Verify keys() last index is length-1 (9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(10);
      const it = arr.keys();
      let last = -1;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const k = __f32e.value!;
        last = k;
      }
      expect(last).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0270
     * @tc.name testFloat32ArrayKeys027
     * @tc.desc Verify keys() last yielded key equals length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0, 9.0]);
      const it = arr.keys();
      let last = -1;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const k = __f32e.value!;
        last = k;
      }
      expect(last).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0280
     * @tc.name testFloat32ArrayKeys028
     * @tc.desc Verify keys() yields consecutive indices diff=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const it = arr.keys();
      const vals: number[] = [];
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const k = __f32e.value!;
        vals.push(k);
      }
      const observedValue030 = vals[1] - vals[0];
      expect(observedValue030).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0290
     * @tc.name testFloat32ArrayKeys029
     * @tc.desc Verify keys() yields 0,1,2,3 for length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const it = arr.keys();
      const vals: number[] = [];
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const k = __f32e.value!;
        vals.push(k);
      }
      expect(vals[0]).assertEqual(0);
      expect(vals[1]).assertEqual(1);
      expect(vals[2]).assertEqual(2);
      expect(vals[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0300
     * @tc.name testFloat32ArrayKeys030
     * @tc.desc Verify sum of keys indices 0..99 equals 4950
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(100);
      const it = arr.keys();
      let sum = 0;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const k = __f32e.value!;
        sum = sum + k;
      }
      expect(sum).assertEqual(4950);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0310
     * @tc.name testFloat32ArrayKeys031
     * @tc.desc Verify keys() first value is 0 on [1.5,2.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5]);
      const v = arr.keys().next().value;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0320
     * @tc.name testFloat32ArrayKeys032
     * @tc.desc Verify keys() second value is 1 on [1.5,2.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5]);
      const it = arr.keys();
      it.next();
      const iteratorValue034 = it.next().value;
      expect(iteratorValue034).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0330
     * @tc.name testFloat32ArrayKeys033
     * @tc.desc Verify keys() third value is 2 on [1.5,2.5,3.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5]);
      const it = arr.keys();
      it.next();
      it.next();
      const iteratorValue035 = it.next().value;
      expect(iteratorValue035).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0340
     * @tc.name testFloat32ArrayKeys034
     * @tc.desc Verify keys() fourth value is 3 on [1.5..4.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5, 4.5]);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      const iteratorValue036 = it.next().value;
      expect(iteratorValue036).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0350
     * @tc.name testFloat32ArrayKeys035
     * @tc.desc Verify keys() fifth value is 4 on [1.5..5.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5, 4.5, 5.5]);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      it.next();
      const iteratorValue037 = it.next().value;
      expect(iteratorValue037).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0360
     * @tc.name testFloat32ArrayKeys036
     * @tc.desc Verify independent iterators: it2 unaffected by it1 advance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it1 = arr.keys();
      const it2 = arr.keys();
      it1.next();
      it1.next();
      const iteratorValue038 = it2.next().value;
      expect(iteratorValue038).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0370
     * @tc.name testFloat32ArrayKeys037
     * @tc.desc Verify three independent keys() iterators each start at 0 on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it1 = arr.keys();
      const it2 = arr.keys();
      const it3 = arr.keys();
      it1.next();
      it1.next();
      it2.next();
      const iteratorValue039 = it3.next().value;
      expect(iteratorValue039).assertEqual(0);
      const iteratorValue039Part2 = it2.next().value;
      expect(iteratorValue039Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0380
     * @tc.name testFloat32ArrayKeys038
     * @tc.desc Verify two iterators interleaved next() yield 0,0,1,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it1 = arr.keys();
      const it2 = arr.keys();
      const iteratorValue040 = it1.next().value;
      expect(iteratorValue040).assertEqual(0);
      const iteratorValue040Part2 = it2.next().value;
      expect(iteratorValue040Part2).assertEqual(0);
      const iteratorValue040Part3 = it1.next().value;
      expect(iteratorValue040Part3).assertEqual(1);
      const iteratorValue040Part4 = it2.next().value;
      expect(iteratorValue040Part4).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0390
     * @tc.name testFloat32ArrayKeys039
     * @tc.desc Verify keys() iterator exhausted by one consumer still yields 0 and 1 for a fresh consumer on [1.0,2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it1 = arr.keys();
      const it2 = arr.keys();
      it1.next();
      it1.next();
      it1.next();
      const iteratorValue041 = it2.next().value;
      expect(iteratorValue041).assertEqual(0);
      const iteratorValue041Part2 = it2.next().value;
      expect(iteratorValue041Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0400
     * @tc.name testFloat32ArrayKeys040
     * @tc.desc Verify fresh keys() iterator created after exhausting another starts at 0 on [1.0,2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it1 = arr.keys();
      it1.next();
      it1.next();
      it1.next();
      const it2 = arr.keys();
      const iteratorValue042 = it2.next().value;
      expect(iteratorValue042).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0410
     * @tc.name testFloat32ArrayKeys041
     * @tc.desc Verify for loop with nested fresh keys() iterator yields 0 each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let outerSum = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const k = __f32i;
        const it2 = arr.keys();
        const iteratorValue043 = it2.next().value;
        expect(iteratorValue043).assertEqual(0);
        outerSum = outerSum + k;
      }
      expect(outerSum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0420
     * @tc.name testFloat32ArrayKeys042
     * @tc.desc Verify exhausted iterator then fresh iterator yields 2 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it1 = arr.keys();
      it1.next();
      it1.next();
      it1.next();
      const it2 = arr.keys();
      let count = 0;
      for (let __f32e = it2.next();!__f32e.done; __f32e = it2.next()) {
        const k = __f32e.value!;
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0430
     * @tc.name testFloat32ArrayKeys043
     * @tc.desc Verify two keys() iterators both yield 0 first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it1 = arr.keys();
      const it2 = arr.keys();
      const iteratorValue045 = it1.next().value;
      expect(iteratorValue045).assertEqual(0);
      const iteratorValue045Part2 = it2.next().value;
      expect(iteratorValue045Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0440
     * @tc.name testFloat32ArrayKeys044
     * @tc.desc Verify iterator A exhausted then B starts at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const itA = arr.keys();
      const itB = arr.keys();
      let n = 0;
      for (let __f32e = itA.next();!__f32e.done; __f32e = itA.next()) {
        const k = __f32e.value!;
        n = n + 1;
      }
      expect(n).assertEqual(3);
      const iteratorValue046 = itB.next().value;
      expect(iteratorValue046).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0450
     * @tc.name testFloat32ArrayKeys045
     * @tc.desc Verify B iterator starts at 0 after A advanced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const itA = arr.keys();
      itA.next();
      itA.next();
      const itB = arr.keys();
      const iteratorValue047 = itB.next().value;
      expect(iteratorValue047).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0460
     * @tc.name testFloat32ArrayKeys046
     * @tc.desc Verify for loop yields keys 0 and 2 on [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const iterator = arr.keys();
      const collected: number[] = [];
      for (let entry = iterator.next(); !entry.done; entry = iterator.next()) {
        collected.push(entry.value!);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0470
     * @tc.name testFloat32ArrayKeys047
     * @tc.desc Verify for loop count=5 on [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const iterator = arr.keys();
      let count = 0;
      for (let entry = iterator.next(); !entry.done; entry = iterator.next()) {
        count = count + 1;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0480
     * @tc.name testFloat32ArrayKeys048
     * @tc.desc Verify for loop n(n-1)/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const iterator = arr.keys();
      let sum = 0;
      for (let entry = iterator.next(); !entry.done; entry = iterator.next()) {
        sum = sum + entry.value!;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0490
     * @tc.name testFloat32ArrayKeys049
     * @tc.desc Verify for loop break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const iterator = arr.keys();
      let last = -1;
      for (let entry = iterator.next(); !entry.done; entry = iterator.next()) {
        const key = entry.value!;
        last = key;
        if (key === 1) {
          break;
        }
      }
      expect(last).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0500
     * @tc.name testFloat32ArrayKeys050
     * @tc.desc Verify for loop continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const iterator = arr.keys();
      let sum = 0;
      for (let entry = iterator.next(); !entry.done; entry = iterator.next()) {
        const key = entry.value!;
        if (key === 1) {
          continue;
        }
        sum = sum + key;
      }
      expect(sum).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0510
     * @tc.name testFloat32ArrayKeys051
     * @tc.desc Verify for loop on [1.0] yields key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const iterator = arr.keys();
      const result = iterator.next();
      expect(result.done).assertFalse();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0520
     * @tc.name testFloat32ArrayKeys052
     * @tc.desc Verify for loop keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let first = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        first = first + 1;
      }
      expect(first).assertEqual(2);
      const it = arr.keys();
      const iteratorValue054 = it.next().value;
      expect(iteratorValue054).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0530
     * @tc.name testFloat32ArrayKeys053
     * @tc.desc Verify next().value is 0 on [1.0,2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.keys();
      const r = it.next();
      expect(r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0540
     * @tc.name testFloat32ArrayKeys054
     * @tc.desc Verify next().done is false on [1.0,2.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.keys();
      const r = it.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0550
     * @tc.name testFloat32ArrayKeys055
     * @tc.desc Verify empty Float32Array keys() next().done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const it = arr.keys();
      const r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0560
     * @tc.name testFloat32ArrayKeys056
     * @tc.desc Verify next() after length+1 calls done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      const r = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0570
     * @tc.name testFloat32ArrayKeys057
     * @tc.desc Verify next done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      it.next();
      const iteratorValue059 = it.next().done;
      expect(iteratorValue059).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0580
     * @tc.name testFloat32ArrayKeys058
     * @tc.desc Verify keys() next().value is 0 on [1.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const it = arr.keys();
      const r = it.next();
      const observedValue060 = r.value;
      expect(observedValue060).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0590
     * @tc.name testFloat32ArrayKeys059
     * @tc.desc Verify Float32Array.of() keys done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of();
      const iteratorValue061 = arr.keys().next().done;
      expect(iteratorValue061).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0600
     * @tc.name testFloat32ArrayKeys060
     * @tc.desc Verify Float32Array.of(1.0) keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      const iteratorValue062 = arr.keys().next().value;
      expect(iteratorValue062).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0610
     * @tc.name testFloat32ArrayKeys061
     * @tc.desc Verify new Float32Array(0) keys value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const iteratorValue063 = arr.keys().next().value;
      expect(iteratorValue063).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0620
     * @tc.name testFloat32ArrayKeys062
     * @tc.desc Verify new Float32Array(5) keys 0..4 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const it = arr.keys();
      let count = 0;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        count = count + 1;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0630
     * @tc.name testFloat32ArrayKeys063
     * @tc.desc Verify Float32Array.from([]) keys done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([]);
      const iteratorValue065 = arr.keys().next().done;
      expect(iteratorValue065).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0640
     * @tc.name testFloat32ArrayKeys064
     * @tc.desc Verify Float32Array.from([1,2,3]) keys 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([1.0, 2.0, 3.0]);
      const it = arr.keys();
      it.next();
      it.next();
      const iteratorValue066 = it.next().value;
      expect(iteratorValue066).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0650
     * @tc.name testFloat32ArrayKeys065
     * @tc.desc Verify subarray keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = base.subarray(1, 3);
      const it = view.keys();
      const iteratorValue067 = it.next().value;
      expect(iteratorValue067).assertEqual(0);
      const iteratorValue067Part2 = it.next().value;
      expect(iteratorValue067Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0660
     * @tc.name testFloat32ArrayKeys066
     * @tc.desc Verify slice keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0]);
      const copy = base.slice(1, 3);
      const it = copy.keys();
      const iteratorValue068 = it.next().value;
      expect(iteratorValue068).assertEqual(0);
      const iteratorValue068Part2 = it.next().value;
      expect(iteratorValue068Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0670
     * @tc.name testFloat32ArrayKeys067
     * @tc.desc Verify subarray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view = base.subarray(1, 4);
      const it = view.keys();
      let count = 0;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0680
     * @tc.name testFloat32ArrayKeys068
     * @tc.desc Verify NaN keys 0..n-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.NaN, Number.NaN, Number.NaN]);
      const it = arr.keys();
      const iteratorValue070 = it.next().value;
      expect(iteratorValue070).assertEqual(0);
      const iteratorValue070Part2 = it.next().value;
      expect(iteratorValue070Part2).assertEqual(1);
      const iteratorValue070Part3 = it.next().value;
      expect(iteratorValue070Part3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0690
     * @tc.name testFloat32ArrayKeys069
     * @tc.desc Verify Infinity keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY]);
      const it = arr.keys();
      const iteratorValue071 = it.next().value;
      expect(iteratorValue071).assertEqual(0);
      const iteratorValue071Part2 = it.next().value;
      expect(iteratorValue071Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0700
     * @tc.name testFloat32ArrayKeys070
     * @tc.desc Verify keys() on negative values yields 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, -2.0, -3.0]);
      const it = arr.keys();
      const iteratorValue072 = it.next().value;
      expect(iteratorValue072).assertEqual(0);
      const iteratorValue072Part2 = it.next().value;
      expect(iteratorValue072Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0710
     * @tc.name testFloat32ArrayKeys071
     * @tc.desc Verify Float32.MAX keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38, 1.0]);
      const it = arr.keys();
      const iteratorValue073 = it.next().value;
      expect(iteratorValue073).assertEqual(0);
      const iteratorValue073Part2 = it.next().value;
      expect(iteratorValue073Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0720
     * @tc.name testFloat32ArrayKeys072
     * @tc.desc Verify 0 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 0.0]);
      const it = arr.keys();
      const iteratorValue074 = it.next().value;
      expect(iteratorValue074).assertEqual(0);
      const iteratorValue074Part2 = it.next().value;
      expect(iteratorValue074Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0730
     * @tc.name testFloat32ArrayKeys073
     * @tc.desc Verify keys 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 5.0, 5.0, 5.0]);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      const iteratorValue075 = it.next().value;
      expect(iteratorValue075).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0740
     * @tc.name testFloat32ArrayKeys074
     * @tc.desc Verify (0.1,0.2,0.3) keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1, 0.2, 0.3]);
      const it = arr.keys();
      const iteratorValue076 = it.next().value;
      expect(iteratorValue076).assertEqual(0);
      const iteratorValue076Part2 = it.next().value;
      expect(iteratorValue076Part2).assertEqual(1);
      const iteratorValue076Part3 = it.next().value;
      expect(iteratorValue076Part3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0750
     * @tc.name testFloat32ArrayKeys075
     * @tc.desc Verify keys() iterator yields key 1 even after array element at index 1 is modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it = arr.keys();
      it.next();
      arr.$_set(1, 99.0);
      const second = it.next().value;
      expect(second).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0760
     * @tc.name testFloat32ArrayKeys076
     * @tc.desc Verify fill keys 0..n-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.fill(0.0);
      const it = arr.keys();
      const iteratorValue078 = it.next().value;
      expect(iteratorValue078).assertEqual(0);
      const iteratorValue078Part2 = it.next().value;
      expect(iteratorValue078Part2).assertEqual(1);
      const iteratorValue078Part3 = it.next().value;
      expect(iteratorValue078Part3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0770
     * @tc.name testFloat32ArrayKeys077
     * @tc.desc Verify reverse keys 0..n-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.reverse();
      const it = arr.keys();
      const iteratorValue079 = it.next().value;
      expect(iteratorValue079).assertEqual(0);
      const iteratorValue079Part2 = it.next().value;
      expect(iteratorValue079Part2).assertEqual(1);
      const iteratorValue079Part3 = it.next().value;
      expect(iteratorValue079Part3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0780
     * @tc.name testFloat32ArrayKeys078
     * @tc.desc Verify $_set keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      arr.$_set(0, 100.0);
      const it = arr.keys();
      const iteratorValue080 = it.next().value;
      expect(iteratorValue080).assertEqual(0);
      const iteratorValue080Part2 = it.next().value;
      expect(iteratorValue080Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0790
     * @tc.name testFloat32ArrayKeys079
     * @tc.desc Verify keys() does not modify array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const before0 = arr.$_get(0);
      const before1 = arr.$_get(1);
      arr.keys();
      const element081 = arr.$_get(0);
      expect(element081).assertEqual(before0);
      const element081Part2 = arr.$_get(1);
      expect(element081Part2).assertEqual(before1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0800
     * @tc.name testFloat32ArrayKeys080
     * @tc.desc Verify keys() continues to yield original keys 0,1,2 after $_set modifies the array on [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it = arr.keys();
      arr.$_set(2, 50.0);
      const iteratorValue082 = it.next().value;
      expect(iteratorValue082).assertEqual(0);
      const iteratorValue082Part2 = it.next().value;
      expect(iteratorValue082Part2).assertEqual(1);
      const iteratorValue082Part3 = it.next().value;
      expect(iteratorValue082Part3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0810
     * @tc.name testFloat32ArrayKeys081
     * @tc.desc Verify sort keys 0..n-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      arr.sort();
      const it = arr.keys();
      const iteratorValue083 = it.next().value;
      expect(iteratorValue083).assertEqual(0);
      const iteratorValue083Part2 = it.next().value;
      expect(iteratorValue083Part2).assertEqual(1);
      const iteratorValue083Part3 = it.next().value;
      expect(iteratorValue083Part3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0820
     * @tc.name testFloat32ArrayKeys082
     * @tc.desc Verify copyWithin keys 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.copyWithin(0, 2);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      const iteratorValue084 = it.next().value;
      expect(iteratorValue084).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0830
     * @tc.name testFloat32ArrayKeys083
     * @tc.desc Verify 1 keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const it = arr.keys();
      const iteratorValue085 = it.next().value;
      expect(iteratorValue085).assertEqual(0);
      const iteratorValue085Part2 = it.next().done;
      expect(iteratorValue085Part2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0840
     * @tc.name testFloat32ArrayKeys084
     * @tc.desc Verify 2 keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const it = arr.keys();
      const iteratorValue086 = it.next().value;
      expect(iteratorValue086).assertEqual(0);
      const iteratorValue086Part2 = it.next().value;
      expect(iteratorValue086Part2).assertEqual(1);
      const iteratorValue086Part3 = it.next().done;
      expect(iteratorValue086Part3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0850
     * @tc.name testFloat32ArrayKeys085
     * @tc.desc Verify 100 keys 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(100);
      const it = arr.keys();
      let count = 0;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        count = count + 1;
      }
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0860
     * @tc.name testFloat32ArrayKeys086
     * @tc.desc Verify 1000 keys 499500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1000);
      const it = arr.keys();
      let sum = 0;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const k = __f32e.value!;
        sum = sum + k;
      }
      expect(sum).assertEqual(499500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0870
     * @tc.name testFloat32ArrayKeys087
     * @tc.desc Verify 65535 keys 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(65535);
      const it = arr.keys();
      let last = -1;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const k = __f32e.value!;
        last = k;
      }
      expect(last).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0880
     * @tc.name testFloat32ArrayKeys088
     * @tc.desc Verify 5000 keys 5000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5000);
      const it = arr.keys();
      let count = 0;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        count = count + 1;
      }
      expect(count).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0890
     * @tc.name testFloat32ArrayKeys089
     * @tc.desc Verify keys values (0 vs )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      const kv = arr.keys().next().value;
      const vv = arr.values().next().value;
      expect(kv).assertEqual(0);
      expect(vv).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0900
     * @tc.name testFloat32ArrayKeys090
     * @tc.desc Verify keys() and entries() both start at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      const k = arr.keys().next().value;
      expect(k).assertEqual(0);
      const e = arr.entries().next().value!;
      expect(e[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0910
     * @tc.name testFloat32ArrayKeys091
     * @tc.desc Verify keys $_iterator ( vs )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0]);
      const k = arr.keys().next().value;
      const v = arr.$_iterator().next().value;
      expect(k).assertEqual(0);
      expect(v).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0920
     * @tc.name testFloat32ArrayKeys092
     * @tc.desc Verify keys count equals values count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let kc = 0;
      const iterK = arr.keys();
      for (let e = iterK.next(); !e.done; e = iterK.next()) {
        kc = kc + 1;
      }
      let vc = 0;
      const iterV = arr.values();
      for (let e = iterV.next(); !e.done; e = iterV.next()) {
        vc = vc + 1;
      }
      expect(kc).assertEqual(3);
      expect(vc).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0930
     * @tc.name testFloat32ArrayKeys093
     * @tc.desc Verify keys count equals entries count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let kc = 0;
      const iterK = arr.keys();
      for (let e = iterK.next(); !e.done; e = iterK.next()) {
        kc = kc + 1;
      }
      let ec = 0;
      const iterE = arr.entries();
      for (let e = iterE.next(); !e.done; e = iterE.next()) {
        ec = ec + 1;
      }
      expect(kc).assertEqual(4);
      expect(ec).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0940
     * @tc.name testFloat32ArrayKeys094
     * @tc.desc Verify nested for loop on keys yields 3x3=9 total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      let total = 0;
      const itOuter = arr.keys();
      for (let __f32eO = itOuter.next();!__f32eO.done; __f32eO = itOuter.next()) {
        const itInner = arr.keys();
        for (let __f32eI = itInner.next();!__f32eI.done; __f32eI = itInner.next()) {
          total = total + 1;
        }
      }
      expect(total).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0950
     * @tc.name testFloat32ArrayKeys095
     * @tc.desc Verify sum of three keys values equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it = arr.keys();
      const a = it.next().value!;
      const b = it.next().value!;
      const c = it.next().value!;
      const observedValue097 = a + b + c;
      expect(observedValue097).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0960
     * @tc.name testFloat32ArrayKeys096
     * @tc.desc Verify for loop on keys() iterator yields last=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.keys();
      let collected = -1;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const k = __f32e.value!;
        collected = k;
      }
      expect(collected).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0970
     * @tc.name testFloat32ArrayKeys097
     * @tc.desc Verify next()+for loop yields first=0 rest=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it = arr.keys();
      const first = it.next().value;
      let rest = 0;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        rest = rest + 1;
      }
      expect(first).assertEqual(0);
      expect(rest).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0980
     * @tc.name testFloat32ArrayKeys098
     * @tc.desc Verify 3 rounds of for loop keys yields 6 total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      let total = 0;
      for (let round = 0; round < 3; round++) {
        const iterator = arr.keys();
        for (let entry = iterator.next(); !entry.done; entry = iterator.next()) {
          total = total + 1;
        }
      }
      expect(total).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_0990
     * @tc.name testFloat32ArrayKeys099
     * @tc.desc Verify three keys() iterators in array all start at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const its: IterableIterator<int>[] = [arr.keys(), arr.keys(), arr.keys()];
      const iteratorValue101 = its[0].next().value;
      expect(iteratorValue101).assertEqual(0);
      const iteratorValue101Part2 = its[1].next().value;
      expect(iteratorValue101Part2).assertEqual(0);
      const iteratorValue101Part3 = its[2].next().value;
      expect(iteratorValue101Part3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_1000
     * @tc.name testFloat32ArrayKeys100
     * @tc.desc Verify ArrayBuffer keys 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 0, 4);
      const it = arr.keys();
      const iteratorValue102 = it.next().value;
      expect(iteratorValue102).assertEqual(0);
      const iteratorValue102Part2 = it.next().value;
      expect(iteratorValue102Part2).assertEqual(1);
      const iteratorValue102Part3 = it.next().value;
      expect(iteratorValue102Part3).assertEqual(2);
      const iteratorValue102Part4 = it.next().value;
      expect(iteratorValue102Part4).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_1010
     * @tc.name testFloat32ArrayKeys101
     * @tc.desc Verify ArrayBuffer-backed keys count=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float32Array(buf, 8, 3);
      const it = arr.keys();
      let count = 0;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_1020
     * @tc.name testFloat32ArrayKeys102
     * @tc.desc Verify two Float32Array from same buffer independent keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const observedValue104 = new Float32Array(buf, 0, 2);
      const observedValue104Part2 = new Float32Array(buf, 8, 2);
      const it1 = observedValue104.keys();
      const it2 = observedValue104Part2.keys();
      it1.next();
      const iteratorValue104 = it2.next().value;
      expect(iteratorValue104).assertEqual(0);
      const iteratorValue104Part2 = it1.next().value;
      expect(iteratorValue104Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_1030
     * @tc.name testFloat32ArrayKeys103
     * @tc.desc Verify buffer view keys yield 0,1,2 after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 0, 4);
      view.$_set(2, 99.0);
      const it = view.keys();
      const iteratorValue105 = it.next().value;
      expect(iteratorValue105).assertEqual(0);
      const iteratorValue105Part2 = it.next().value;
      expect(iteratorValue105Part2).assertEqual(1);
      const iteratorValue105Part3 = it.next().value;
      expect(iteratorValue105Part3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_1040
     * @tc.name testFloat32ArrayKeys104
     * @tc.desc Verify for loop on keys sum equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.keys();
      let sum = 0;
      for (let __f32e = it.next();!__f32e.done; __f32e = it.next()) {
        const k = __f32e.value!;
        sum = sum + k;
      }
      expect(sum).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_1050
     * @tc.name testFloat32ArrayKeys105
     * @tc.desc Verify result value done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const it = arr.keys();
      it.next();
      const r = it.next();
      expect(r.value).assertUndefined();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_1060
     * @tc.name testFloat32ArrayKeys106
     * @tc.desc Verify keys next value 0 then 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it = arr.keys();
      const a = it.next().value;
      const b = it.next().value;
      expect(a).assertEqual(0);
      expect(b).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_1070
     * @tc.name testFloat32ArrayKeys107
     * @tc.desc Verify keys next done after exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      const iteratorValue110 = it.next().done;
      expect(iteratorValue110).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_KEYS_1080
     * @tc.name testFloat32ArrayKeys108
     * @tc.desc Verify keys done=true after yielding all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayKeys108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const it = arr.keys();
      it.next();
      const iteratorValue111 = it.next().value;
      expect(iteratorValue111).assertEqual(1);
      const iteratorValue111Part2 = it.next().done;
      expect(iteratorValue111Part2).assertTrue();
    });

  });
}
