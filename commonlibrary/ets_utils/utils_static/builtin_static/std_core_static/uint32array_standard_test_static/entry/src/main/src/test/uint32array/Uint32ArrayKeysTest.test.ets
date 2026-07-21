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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayKeysTest(): void {
  describe('Uint32ArrayKeysTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_0100
     * @tc.name testUint32ArrayKeys001
     * @tc.desc Verify arity 0 - keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_0200
     * @tc.name testUint32ArrayKeys002
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array(0);
      const it = empty.keys();
      expect(it.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_0300
     * @tc.name testUint32ArrayKeys003
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const it = arr.keys();
      const first = it.next();
      expect(first.value).assertEqual(0);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_0400
     * @tc.name testUint32ArrayKeys004
     * @tc.desc Verify keys() next() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8);
      const it = arr.keys();
      const r = it.next();
      expect(r.value).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_0500
     * @tc.name testUint32ArrayKeys005
     * @tc.desc Verify keys() next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8);
      const it = arr.keys();
      const r = it.next();
      expect(r.done).assertFalse();
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_0600
     * @tc.name testUint32ArrayKeys006
     * @tc.desc Verify keys() 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_0700
     * @tc.name testUint32ArrayKeys007
     * @tc.desc Verify keys() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_0800
     * @tc.name testUint32ArrayKeys008
     * @tc.desc Verify keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_0900
     * @tc.name testUint32ArrayKeys009
     * @tc.desc Verify keys() 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_1000
     * @tc.name testUint32ArrayKeys010
     * @tc.desc Verify keys() 0,1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9, 8, 7, 6);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      expect(it.next().value).assertEqual(3);
      expect(it.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_1100
     * @tc.name testUint32ArrayKeys011
     * @tc.desc Verify keys() 0..4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 4, 3, 2, 1);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      expect(it.next().value).assertEqual(3);
      expect(it.next().value).assertEqual(4);
      expect(it.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_1200
     * @tc.name testUint32ArrayKeys012
     * @tc.desc Verify for...of keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const collected: number[] = [];
      for (const k of arr.keys()) {
        collected.push(k);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(1);
      expect(collected[2]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_1300
     * @tc.name testUint32ArrayKeys013
     * @tc.desc Verify for...of keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      let count = 0;
      for (const k of arr.keys()) {
        count = count + 1;
      }
      expect(count).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_1400
     * @tc.name testUint32ArrayKeys014
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      const it = arr.keys();
      for (const k of it) {
      }
      expect(it.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_1500
     * @tc.name testUint32ArrayKeys015
     * @tc.desc Verify keys() next() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array(0);
      const it = empty.keys();
      expect(it.next().value).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_1600
     * @tc.name testUint32ArrayKeys016
     * @tc.desc Verify keys() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array(0);
      let count = 0;
      for (const k of empty.keys()) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_1700
     * @tc.name testUint32ArrayKeys017
     * @tc.desc Verify keys() next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array(0);
      const it = empty.keys();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_1800
     * @tc.name testUint32ArrayKeys018
     * @tc.desc Verify for...of break keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      const collected: number[] = [];
      for (const k of arr.keys()) {
        collected.push(k);
        if (k === 1) {
          break;
        }
      }
      expect(collected.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_1900
     * @tc.name testUint32ArrayKeys019
     * @tc.desc Verify keys() after skipping 2 calls with next() returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      const it = arr.keys();
      it.next();
      it.next();
      const r = it.next();
      expect(r.value).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_2000
     * @tc.name testUint32ArrayKeys020
     * @tc.desc Verify break 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const collected: number[] = [];
      for (const k of arr.keys()) {
        collected.push(k);
        break;
      }
      expect(collected[0]).assertEqual(0);
      expect(collected.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_2100
     * @tc.name testUint32ArrayKeys021
     * @tc.desc Verify break value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      let last = -1;
      for (const k of arr.keys()) {
        last = k;
        if (k === 2) {
          break;
        }
      }
      expect(last).assertEqual(2);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_2200
     * @tc.name testUint32ArrayKeys022
     * @tc.desc Verify length=100 keys() 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(100);
      const it = big.keys();
      let last = -1;
      for (const k of it) {
        last = k;
      }
      expect(last).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_2300
     * @tc.name testUint32ArrayKeys023
     * @tc.desc Verify length=100 keys() 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(100);
      let count = 0;
      for (const k of big.keys()) {
        count = count + 1;
      }
      expect(count).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_2400
     * @tc.name testUint32ArrayKeys024
     * @tc.desc Verify length=65535 keys() 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(65535);
      const it = big.keys();
      let last = -1;
      for (const k of it) {
        last = k;
      }
      expect(last).assertEqual(65534);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_2500
     * @tc.name testUint32ArrayKeys025
     * @tc.desc Verify next() 6 done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_2600
     * @tc.name testUint32ArrayKeys026
     * @tc.desc Verify next() value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      expect(it.next().value).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_2700
     * @tc.name testUint32ArrayKeys027
     * @tc.desc Verify done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const it = arr.keys();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_2800
     * @tc.name testUint32ArrayKeys028
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      for (const k of arr.keys()) {
      }
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_2900
     * @tc.name testUint32ArrayKeys029
     * @tc.desc Verify keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const before = arr.length;
      for (const k of arr.keys()) {
      }
      expect(arr.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_3000
     * @tc.name testUint32ArrayKeys030
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const it1 = arr.keys();
      const it2 = arr.keys();
      it1.next();
      it1.next();
      expect(it2.next().value).assertEqual(0);
    });


    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_3100
     * @tc.name testUint32ArrayKeys031
     * @tc.desc Verify subarray keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(10, 20, 30, 40, 50);
      const view = base.subarray(1, 4);
      let count = 0;
      for (const k of view.keys()) {
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_3200
     * @tc.name testUint32ArrayKeys032
     * @tc.desc Verify slice keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(10, 20, 30, 40);
      const copy = base.slice(1, 3);
      const it = copy.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_3300
     * @tc.name testUint32ArrayKeys033
     * @tc.desc Verify ArrayBuffer keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint32Array(buf, 0, 4);
      const it = view.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      expect(it.next().value).assertEqual(3);
    });


    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_3400
     * @tc.name testUint32ArrayKeys034
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 7, 7, 7);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      expect(it.next().value).assertEqual(3);
    });


    
    
    
    
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_3500
     * @tc.name testUint32ArrayKeys035
     * @tc.desc Verify keys() next() value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const it = arr.keys();
      it.next();
      expect(it.next().value).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_3600
     * @tc.name testUint32ArrayKeys036
     * @tc.desc Verify keys() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200, 300);
      const it = arr.keys();
      const firstKey = it.next().value;
      const secondKey = it.next().value;
      expect(firstKey).assertEqual(0);
      expect(secondKey).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_3700
     * @tc.name testUint32ArrayKeys037
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const it1 = arr.keys();
      const it2 = arr.keys();
      expect(it1.next().value).assertEqual(0);
      expect(it2.next().value).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_3800
     * @tc.name testUint32ArrayKeys038
     * @tc.desc Verify keys iterator independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const it1 = arr.keys();
      const it2 = arr.keys();
      it1.next();
      it1.next();
      expect(it2.next().value).assertEqual(0);
      expect(it2.next().value).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_3900
     * @tc.name testUint32ArrayKeys039
     * @tc.desc Verify done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      const it1 = arr.keys();
      const it2 = arr.keys();
      it1.next();
      it1.next();
      it1.next();
      expect(it2.next().done).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_4000
     * @tc.name testUint32ArrayKeys040
     * @tc.desc Verify keys() for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      let first = -1;
      for (const k of arr.keys()) {
        first = k;
        break;
      }
      expect(first).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_4100
     * @tc.name testUint32ArrayKeys041
     * @tc.desc Verify keys() $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const collected: number[] = [];
      for (const k of arr.keys()) {
        collected.push(arr[k]);
      }
      expect(collected[0]).assertEqual(10);
      expect(collected[1]).assertEqual(20);
      expect(collected[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_4200
     * @tc.name testUint32ArrayKeys042
     * @tc.desc Verify keys() $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0);
      for (const k of arr.keys()) {
        arr[k] = k * 10;
      }
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_4300
     * @tc.name testUint32ArrayKeys043
     * @tc.desc Verify keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      let count = 0;
      for (const k of arr.keys()) {
        count = count + 1;
      }
      expect(count).assertEqual(arr.length);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_4400
     * @tc.name testUint32ArrayKeys044
     * @tc.desc Verify keys() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      let count = 0;
      for (const k of arr.keys()) {
        count = count + 1;
      }
      expect(count).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_4500
     * @tc.name testUint32ArrayKeys045
     * @tc.desc Verify keys() 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2);
      let count = 0;
      for (const k of arr.keys()) {
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_4600
     * @tc.name testUint32ArrayKeys046
     * @tc.desc Verify keys() 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let last = -1;
      for (const k of arr.keys()) {
        last = k;
      }
      expect(last).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_4700
     * @tc.name testUint32ArrayKeys047
     * @tc.desc Verify keys() 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      let last = -1;
      for (const k of arr.keys()) {
        last = k;
      }
      expect(last).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_4800
     * @tc.name testUint32ArrayKeys048
     * @tc.desc Verify keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      let last = -1;
      for (const k of arr.keys()) {
        last = k;
      }
      expect(last).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_4900
     * @tc.name testUint32ArrayKeys049
     * @tc.desc Verify for...of continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const collected: number[] = [];
      for (const k of arr.keys()) {
        if (k === 1) {
          continue;
        }
        collected.push(k);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(2);
      expect(collected[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_5000
     * @tc.name testUint32ArrayKeys050
     * @tc.desc Verify continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      let count = 0;
      for (const k of arr.keys()) {
        if (k % 2 === 0) {
          continue;
        }
        count = count + 1;
      }
      expect(count).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_5100
     * @tc.name testUint32ArrayKeys051
     * @tc.desc Verify for...of keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(1, 2);
      const b = Uint32Array.of(3, 4);
      let pairs = 0;
      for (const i of a.keys()) {
        for (const j of b.keys()) {
          pairs = pairs + 1;
        }
      }
      expect(pairs).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_5200
     * @tc.name testUint32ArrayKeys052
     * @tc.desc Verify keys nested iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Uint32Array.of(1, 2);
      const b = Uint32Array.of(3, 4, 5);
      let lastOuter = -1;
      let lastInner = -1;
      for (const i of a.keys()) {
        lastOuter = i;
        for (const j of b.keys()) {
          lastInner = j;
        }
      }
      expect(lastOuter).assertEqual(1);
      expect(lastInner).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_5300
     * @tc.name testUint32ArrayKeys053
     * @tc.desc Verify keys() 50 49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(100);
      const it = big.keys();
      let idx = 0;
      let fiftiethKey = -1;
      for (const k of it) {
        if (idx === 49) {
          fiftiethKey = k;
          break;
        }
        idx = idx + 1;
      }
      expect(fiftiethKey).assertEqual(49);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_5400
     * @tc.name testUint32ArrayKeys054
     * @tc.desc Verify keys() break next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(100);
      const it = big.keys();
      for (const k of it) {
        if (k === 5) {
          break;
        }
      }
      expect(it.next().value).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_5500
     * @tc.name testUint32ArrayKeys055
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const it = arr.keys();
      arr[0] = 100;
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_5600
     * @tc.name testUint32ArrayKeys056
     * @tc.desc Verify keys iterator after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const it = arr.keys();
      arr[0] = 999;
      let count = 0;
      for (const k of it) {
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_5700
     * @tc.name testUint32ArrayKeys057
     * @tc.desc Verify keys() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const kit = arr.keys();
      const eit = arr.entries();
      const kv = kit.next().value;
      const ev = eit.next().value;
      expect(kv).assertEqual(0);
      expect(ev![0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_5800
     * @tc.name testUint32ArrayKeys058
     * @tc.desc Verify keys() values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      let kcount = 0;
      let vcount = 0;
      for (const k of arr.keys()) {
        kcount = kcount + 1;
      }
      for (const v of arr.values()) {
        vcount = vcount + 1;
      }
      expect(kcount).assertEqual(vcount);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_5900
     * @tc.name testUint32ArrayKeys059
     * @tc.desc Verify length=1000 keys() 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(1000);
      let last = -1;
      for (const k of big.keys()) {
        last = k;
      }
      expect(last).assertEqual(999);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_6000
     * @tc.name testUint32ArrayKeys060
     * @tc.desc Verify length=1000 keys() 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Uint32Array(1000);
      let count = 0;
      for (const k of big.keys()) {
        count = count + 1;
      }
      expect(count).assertEqual(1000);
    });



    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_6100
     * @tc.name testUint32ArrayKeys061
     * @tc.desc Verify ArrayBuffer keys() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Uint32Array(buf, 8, 4);
      const it = arr.keys();
      expect(it.next().value).assertEqual(0);
      expect(it.next().value).assertEqual(1);
      expect(it.next().value).assertEqual(2);
      expect(it.next().value).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_6200
     * @tc.name testUint32ArrayKeys062
     * @tc.desc Verify ArrayBuffer keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Uint32Array(buf, 4, 3);
      let count = 0;
      for (const k of arr.keys()) {
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_6300
     * @tc.name testUint32ArrayKeys063
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      const collected: number[] = [];
      for (const k of arr.keys()) {
        collected.push(k);
      }
      expect(collected[0]).assertEqual(0);
      expect(collected[4]).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_6400
     * @tc.name testUint32ArrayKeys064
     * @tc.desc Verify keys() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5, 6);
      const collected: number[] = [];
      for (const k of arr.keys()) {
        collected.push(k);
      }
      expect(collected.length).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_6500
     * @tc.name testUint32ArrayKeys065
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      const collected: number[] = [];
      for (const k of arr.keys()) {
        collected.push(k);
      }
      let ascending = true;
      for (let i = 1; i < collected.length; i++) {
        if (collected[i] <= collected[i - 1]) {
          ascending = false;
        }
      }
      expect(ascending).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_6600
     * @tc.name testUint32ArrayKeys066
     * @tc.desc Verify next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      const it = arr.keys();
      it.next();
      const r = it.next();
      expect(r.done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_6700
     * @tc.name testUint32ArrayKeys067
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new Uint32Array(0);
      const iter = empty.keys();
      const ret = iter.next();
      expect(ret.done).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_6800
     * @tc.name testUint32ArrayKeys068
     * @tc.desc Verify keys() 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      const it = arr.keys();
      let idx = 0;
      let mid = -1;
      for (const k of it) {
        if (idx === 5) {
          mid = k;
          break;
        }
        idx = idx + 1;
      }
      expect(mid).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_6900
     * @tc.name testUint32ArrayKeys069
     * @tc.desc Verify keys() 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5, 6, 7);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      expect(it.next().value).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_7000
     * @tc.name testUint32ArrayKeys070
     * @tc.desc Verify keys() 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const it = arr.keys();
      it.next();
      it.next();
      expect(it.next().value).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_7100
     * @tc.name testUint32ArrayKeys071
     * @tc.desc Verify keys() 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5, 6, 7, 8);
      const it = arr.keys();
      for (let i = 0; i < 7; i++) {
        it.next();
      }
      expect(it.next().value).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_7200
     * @tc.name testUint32ArrayKeys072
     * @tc.desc Verify break keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      const it1 = arr.keys();
      it1.next();
      it1.next();
      for (const k of it1) {
        break;
      }
      const it2 = arr.keys();
      expect(it2.next().value).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_7300
     * @tc.name testUint32ArrayKeys073
     * @tc.desc Verify break next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5, 6);
      const it = arr.keys();
      it.next();
      it.next();
      it.next();
      expect(it.next().value).assertEqual(3);
      expect(it.next().value).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_7400
     * @tc.name testUint32ArrayKeys074
     * @tc.desc Verify keys() 0 0x0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const it = arr.keys();
      const v = it.next().value;
      expect(v).assertEqual(0x0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_7500
     * @tc.name testUint32ArrayKeys075
     * @tc.desc Verify keys() 2 0x2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const it = arr.keys();
      it.next();
      it.next();
      const v = it.next().value;
      expect(v).assertEqual(0x2);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_7600
     * @tc.name testUint32ArrayKeys076
     * @tc.desc Verify keys() 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let sum = 0;
      for (const k of arr.keys()) {
        sum = sum + k;
      }
      expect(sum).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_7700
     * @tc.name testUint32ArrayKeys077
     * @tc.desc Verify keys() 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      let sum = 0;
      for (const k of arr.keys()) {
        sum = sum + k;
      }
      expect(sum).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_KEYS_7800
     * @tc.name testUint32ArrayKeys078
     * @tc.desc Verify keys() 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayKeys078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      let sum = 0;
      for (const k of arr.keys()) {
        sum = sum + k;
      }
      expect(sum).assertEqual(45);
    });

  });
}
