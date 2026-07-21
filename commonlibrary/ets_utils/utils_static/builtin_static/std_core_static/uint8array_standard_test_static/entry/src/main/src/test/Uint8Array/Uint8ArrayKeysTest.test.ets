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

export default function Uint8ArrayKeysTest(): void {
  describe('Uint8ArrayKeysTest', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_0100
     * @tc.name testUint8ArrayKeys001
     * @tc.desc Verify keys() with zero parameters returns non-null iterator object
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      const iter = arr.keys();
      expect(iter).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_0200
     * @tc.name testUint8ArrayKeys002
     * @tc.desc Verify keys() with zero parameters can iterate all elements normally
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      let count: int = 0;
      for (const key of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_0300
     * @tc.name testUint8ArrayKeys003
     * @tc.desc Verify empty array (constructor()) keys() first next().done is true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      const iter = arr.keys();
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_0400
     * @tc.name testUint8ArrayKeys004
     * @tc.desc Verify empty array (new Uint8Array(0)) keys() first next().done is true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const iter = arr.keys();
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_0500
     * @tc.name testUint8ArrayKeys005
     * @tc.desc Verify empty array keys() consecutive next() always done
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      const iter = arr.keys();
      iter.next();
      expect(iter.next().done).assertEqual(true);
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_0600
     * @tc.name testUint8ArrayKeys006
     * @tc.desc Verify empty array keys() for...of loop body does not execute
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      let executed: boolean = false;
      for (const key of arr.keys()) {
        executed = true;
      }
      expect(executed).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_0700
     * @tc.name testUint8ArrayKeys007
     * @tc.desc Verify empty array keys() spread operator yields empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_0800
     * @tc.name testUint8ArrayKeys008
     * @tc.desc Verify single element array keys() first next().value is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_0900
     * @tc.name testUint8ArrayKeys009
     * @tc.desc Verify single element array keys() second next().done is true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      const iter = arr.keys();
      iter.next();
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_1000
     * @tc.name testUint8ArrayKeys010
     * @tc.desc Verify single element array keys() for...of iterates once with value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      let key: int = -1;
      for (const k of arr.keys()) {
        key = k;
      }
      expect(key).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_1100
     * @tc.name testUint8ArrayKeys011
     * @tc.desc Verify single element array keys() spread yields [0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1);
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_1200
     * @tc.name testUint8ArrayKeys012
     * @tc.desc Verify three element array keys() yields 0,1,2 in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_1300
     * @tc.name testUint8ArrayKeys013
     * @tc.desc Verify three element array keys() iteration completes after third next()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      const iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_1400
     * @tc.name testUint8ArrayKeys014
     * @tc.desc Verify five element array keys() index sum is 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      let sum: int = 0;
      for (const key of arr.keys()) {
        sum += key;
      }
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_1500
     * @tc.name testUint8ArrayKeys015
     * @tc.desc Verify ten element array keys() spread length is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_1600
     * @tc.name testUint8ArrayKeys016
     * @tc.desc Verify ten element array keys() spread first and last values are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10);
      const result: Array<int> = [...arr.keys()];
      expect(result[0]).assertEqual(0);
      expect(result[9]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_1700
     * @tc.name testUint8ArrayKeys017
     * @tc.desc Verify length=100 array keys() complete iteration count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      let count: int = 0;
      for (const key of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_1800
     * @tc.name testUint8ArrayKeys018
     * @tc.desc Verify length=255 array keys() complete iteration count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(255);
      let count: int = 0;
      for (const key of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_1900
     * @tc.name testUint8ArrayKeys019
     * @tc.desc Verify length=256 array keys() complete iteration count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(256);
      let count: int = 0;
      for (const key of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_2000
     * @tc.name testUint8ArrayKeys020
     * @tc.desc Verify length=1000 array keys() complete iteration count
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(1000);
      let count: int = 0;
      for (const key of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(1000);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_2100
     * @tc.name testUint8ArrayKeys021
     * @tc.desc Verify length=2 array keys() produces indices 0,1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(2);
      const result: Array<int> = [...arr.keys()];
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_2200
     * @tc.name testUint8ArrayKeys022
     * @tc.desc Verify length=127 array keys() first and last indices are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(127);
      const result: Array<int> = [...arr.keys()];
      expect(result[0]).assertEqual(0);
      expect(result[126]).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_2300
     * @tc.name testUint8ArrayKeys023
     * @tc.desc Verify length=128 array keys() first and last indices are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(128);
      const result: Array<int> = [...arr.keys()];
      expect(result[0]).assertEqual(0);
      expect(result[127]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_2400
     * @tc.name testUint8ArrayKeys024
     * @tc.desc Verify Uint8Array.of() empty array keys() immediately done
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      const iter = arr.keys();
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_2500
     * @tc.name testUint8ArrayKeys025
     * @tc.desc Verify Uint8Array.of(1,2,3) array keys() iterates three times
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let count: int = 0;
      for (const key of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_2600
     * @tc.name testUint8ArrayKeys026
     * @tc.desc Verify Uint8Array.from(FixedArray) array keys() is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [10, 20];
      const arr = Uint8Array.from(source);
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_2700
     * @tc.name testUint8ArrayKeys027
     * @tc.desc Verify FixedArray<int> constructor array keys() is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numbers: FixedArray<int> = [5, 10, 15];
      const arr = new Uint8Array(numbers);
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_2800
     * @tc.name testUint8ArrayKeys028
     * @tc.desc Verify copy constructor array keys() is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(4);
      const arr = new Uint8Array(src);
      let count: int = 0;
      for (const key of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_2900
     * @tc.name testUint8ArrayKeys029
     * @tc.desc Verify ArrayBuffer offset 0 view keys() is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf, 0);
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(0);
      expect(result[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_3000
     * @tc.name testUint8ArrayKeys030
     * @tc.desc Verify ArrayBuffer offset 1 view keys() starts from 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8Array(buf, 1);
      const result: Array<int> = [...arr.keys()];
      expect(result[0]).assertEqual(0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_3100
     * @tc.name testUint8ArrayKeys031
     * @tc.desc Verify ArrayBuffer offset 2 view keys() starts from 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const arr = new Uint8Array(buf, 2);
      const result: Array<int> = [...arr.keys()];
      expect(result[0]).assertEqual(0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_3200
     * @tc.name testUint8ArrayKeys032
     * @tc.desc Verify subarray() subview keys() starts from 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3, 4, 5]);
      const sub = arr.subarray(1, 4);
      const result: Array<int> = [...sub.keys()];
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_3300
     * @tc.name testUint8ArrayKeys033
     * @tc.desc Verify two independent keys() iterators advance independently
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(3);
      const iter1 = arr.keys();
      const iter2 = arr.keys();
      expect(iter1.next().value).assertEqual(0);
      expect(iter2.next().value).assertEqual(0);
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
      expect(iter1.next().value).assertEqual(2);
      expect(iter2.next().value).assertEqual(2);
      expect(iter1.next().done).assertEqual(true);
      expect(iter2.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_3400
     * @tc.name testUint8ArrayKeys034
     * @tc.desc Verify nested for...of uses independent keys() iterators
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(2);
      let sum: int = 0;
      for (const i of arr.keys()) {
        for (const j of arr.keys()) {
          sum += (i + j);
        }
      }
      expect(sum).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_3500
     * @tc.name testUint8ArrayKeys035
     * @tc.desc Verify for...of with break exits early consuming only partial indices
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      let count: int = 0;
      for (const key of arr.keys()) {
        if (key >= 2) {
          break;
        }
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_3600
     * @tc.name testUint8ArrayKeys036
     * @tc.desc Verify break then new keys() iterator restarts from beginning
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      for (const key of arr.keys()) {
        if (key >= 2) {
          break;
        }
      }
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_3700
     * @tc.name testUint8ArrayKeys037
     * @tc.desc Verify after iteration completes, consecutive next() calls always done
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(2);
      const iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().done).assertEqual(true);
      expect(iter.next().done).assertEqual(true);
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_3800
     * @tc.name testUint8ArrayKeys038
     * @tc.desc Verify all zero element array keys() indices are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([0, 0, 0]);
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_3900
     * @tc.name testUint8ArrayKeys039
     * @tc.desc Verify all 255 element array keys() indices are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([255, 255, 255]);
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(3);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_4000
     * @tc.name testUint8ArrayKeys040
     * @tc.desc Verify mixed value element array keys() indices are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([127, 0, 255, 1]);
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(4);
      expect(result[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_4100
     * @tc.name testUint8ArrayKeys041
     * @tc.desc Verify array with overflow truncated values (256) keys() indices are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([256, 257, 258]);
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_4200
     * @tc.name testUint8ArrayKeys042
     * @tc.desc Verify array with wrap-around values (-1) keys() indices are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([-1, -2]);
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_4300
     * @tc.name testUint8ArrayKeys043
     * @tc.desc Verify array with floating point truncated values keys() indices are correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1.5, 2.7, 3.2]);
      const result: Array<int> = [...arr.keys()];
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_4400
     * @tc.name testUint8ArrayKeys044
     * @tc.desc Verify keys() iteration does not modify original array element content
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const before: string = arr.join(',');
      const iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      const after: string = arr.join(',');
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_4500
     * @tc.name testUint8ArrayKeys045
     * @tc.desc Verify keys() iteration does not affect array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const before: int = arr.length;
      for (const key of arr.keys()) {
      }
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_4600
     * @tc.name testUint8ArrayKeys046
     * @tc.desc Verify empty array keys() does not throw exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      let caught: boolean = false;
      try {
        const iter = arr.keys();
        iter.next();
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_KEYS_4700
     * @tc.name testUint8ArrayKeys047
     * @tc.desc Verify large array keys() complete iteration does not throw exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayKeys047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(10000);
      let caught: boolean = false;
      try {
        for (const key of arr.keys()) {
        }
      } catch (e) {
        caught = true;
        expect(e.name).assertEqual('Error');
      }
      expect(caught).assertEqual(false);
    });
  });
}