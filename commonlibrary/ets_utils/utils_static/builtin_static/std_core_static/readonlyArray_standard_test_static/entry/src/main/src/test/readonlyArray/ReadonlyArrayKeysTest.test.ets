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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class ComboObjarr {
  id: int = 1;
}

class ReadonlyArrayKeysGeneratedItem {
  id: int = 0;
  constructor(id: int) {
    this.id = id;
  }
}

export default function ReadonlyArrayKeysTest(): void {
  describe('ReadonlyArrayKeysTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_0100
     * @tc.name testReadonlyArrayKeys001
     * @tc.desc Verify ReadonlyArray.keys behavior: keys returns IterableIterator<int> for...of iteration index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const iter = arr.keys();
      let count = 0;
      for (const key of iter) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_0200
     * @tc.name testReadonlyArrayKeys002
     * @tc.desc Verify ReadonlyArray.keys behavior: empty array keys returns empty iterator iteration is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      let count = 0;
      for (const key of arr.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_0300
     * @tc.name testReadonlyArrayKeys003
     * @tc.desc Verify ReadonlyArray.keys behavior: element keys returns index 0 iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [42];
      for (const key of arr.keys()) {
        expect(key).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_0400
     * @tc.name testReadonlyArrayKeys004
     * @tc.desc Verify ReadonlyArray.keys behavior: iteration keys iterator when break break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      for (const key of arr.keys()) {
        expect(key).assertEqual(0);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_0500
     * @tc.name testReadonlyArrayKeys005
     * @tc.desc Verify ReadonlyArray.keys behavior: ReadonlyArray <string> keys returns int index iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "y", "z"];
      let expected: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(expected);
        expected++;
      }
      expect(expected).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_0600
     * @tc.name testReadonlyArrayKeys006
     * @tc.desc Verify ReadonlyArray.keys behavior: ReadonlyArray <double> keys returns int index iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, 2.2];
      const collected: Array<int> = [];
      for (const key of arr.keys()) {
        collected.push(key);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0);
      expect(collected[arr.length - 1]).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_0700
     * @tc.name testReadonlyArrayKeys007
     * @tc.desc Verify ReadonlyArray.keys behavior: returns iterator next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      const iter = arr.keys();
      const first = iter.next();
      expect(first.value).assertEqual(0);
      expect(first.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_0800
     * @tc.name testReadonlyArrayKeys008
     * @tc.desc Verify ReadonlyArray.keys behavior: iterator iteration after next returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1];
      const iter = arr.keys();
      iter.next();
      const second = iter.next();
      expect(second.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_0900
     * @tc.name testReadonlyArrayKeys009
     * @tc.desc Verify ReadonlyArray.keys behavior: verify returns key is int type index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [100];
      const iter = arr.keys();
      for (const key of iter) {
        expect(key).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_1000
     * @tc.name testReadonlyArrayKeys010
     * @tc.desc Verify ReadonlyArray.keys behavior: large array keys iterator iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) {
        source.push(i);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_1100
     * @tc.name testReadonlyArrayKeys011
     * @tc.desc Verify ReadonlyArray.keys behavior: keys iteration does not change original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      for (const key of arr.keys()) {}
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_1200
     * @tc.name testReadonlyArrayKeys012
     * @tc.desc Verify ReadonlyArray.keys behavior: and API iteration keys and after break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      for (const key of values.keys()) {
        expect(key.toString()).assertEqual("0");
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_1300
     * @tc.name testReadonlyArrayKeys013
     * @tc.desc Verify ReadonlyArray.keys behavior: ReadonlyArray <boolean> keys returns 0 int index iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_1400
     * @tc.name testReadonlyArrayKeys014
     * @tc.desc Verify ReadonlyArray.keys behavior: 0 when keys by 0,1,2... returns index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 5];
      let idx: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(idx);
        idx++;
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_1500
     * @tc.name testReadonlyArrayKeys015
     * @tc.desc Verify ReadonlyArray.keys behavior: iteration keys iterator when continue index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      let sum: int = 0;
      for (const key of arr.keys()) {
        if (key === 1) {
          continue;
        }
        sum += arr[key];
      }
      expect(sum).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_1600
     * @tc.name testReadonlyArrayKeys016
     * @tc.desc Verify ReadonlyArray.keys behavior: 16/8/2 int ReadonlyArray keys returns index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10];
      let idx: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(idx);
        idx++;
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_1700
     * @tc.name testReadonlyArrayKeys017
     * @tc.desc Verify ReadonlyArray.keys behavior: 0 - 1 int keys iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 1000000];
      const collected: Array<int> = [];
      for (const key of arr.keys()) {
        collected.push(key);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0);
      expect(collected[arr.length - 1]).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_1800
     * @tc.name testReadonlyArrayKeys018
     * @tc.desc Verify ReadonlyArray.keys behavior: empty empty element string keys iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["", " ", "text"];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_1900
     * @tc.name testReadonlyArrayKeys019
     * @tc.desc Verify ReadonlyArray.keys behavior: Unicode element string keys iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cn: string = "中文";
      const arr: ReadonlyArray<string> = ["a", cn, "b"];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_2000
     * @tc.name testReadonlyArrayKeys020
     * @tc.desc Verify ReadonlyArray.keys behavior: empty element string keys iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zwsp: string = "​";
      const arr: ReadonlyArray<string> = ["a", zwsp, "c"];
      const collected: Array<int> = [];
      for (const key of arr.keys()) {
        collected.push(key);
      }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0);
      expect(collected[arr.length - 1]).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_2100
     * @tc.name testReadonlyArrayKeys021
     * @tc.desc Verify ReadonlyArray.keys behavior: by API verify keys index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      let firstKey: int = -1;
      for (const key of values.keys()) {
        firstKey = key;
        break;
      }
      expect(firstKey).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_2200
     * @tc.name testReadonlyArrayKeys022
     * @tc.desc Verify ReadonlyArray.keys behavior: keys by 0..length - 1 ascending order returns index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [5, 6, 7];
      const collected: Array<int> = [];
      for (const key of values.keys()) {
        collected.push(key);
      }
      expect(collected.length).assertEqual(3);
      expect(collected[0]).assertEqual(0);
      expect(collected[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_2300
     * @tc.name testReadonlyArrayKeys023
     * @tc.desc Verify ReadonlyArray.keys behavior: byte keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 30 as byte];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_2400
     * @tc.name testReadonlyArrayKeys024
     * @tc.desc Verify ReadonlyArray.keys behavior: short keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, -32768 as short, 32767 as short];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_2500
     * @tc.name testReadonlyArrayKeys025
     * @tc.desc Verify ReadonlyArray.keys behavior: long keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 9223372036854775807, -9223372036854775808];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_2600
     * @tc.name testReadonlyArrayKeys026
     * @tc.desc Verify ReadonlyArray.keys behavior: float keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [0.0f, 3.14f, Double.toFloat(Number.POSITIVE_INFINITY)];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_2700
     * @tc.name testReadonlyArrayKeys027
     * @tc.desc Verify ReadonlyArray.keys behavior: emoji string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "😀", "b"];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_2800
     * @tc.name testReadonlyArrayKeys028
     * @tc.desc Verify ReadonlyArray.keys behavior: string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["13800138000", "x", "y"];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_2900
     * @tc.name testReadonlyArrayKeys029
     * @tc.desc Verify ReadonlyArray.keys behavior: string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["テスト", "en", "cn"];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_3000
     * @tc.name testReadonlyArrayKeys030
     * @tc.desc Verify ReadonlyArray.keys behavior: boolean keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_3100
     * @tc.name testReadonlyArrayKeys031
     * @tc.desc Verify ReadonlyArray.keys behavior: 100 element ReadonlyArray <int> keys iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      for (let i: int = 0; i < 100; i++) {
        (arr as Array<int>).push(i);
      }
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_3200
     * @tc.name testReadonlyArrayKeys032
     * @tc.desc Verify ReadonlyArray.keys behavior: ReadonlyArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["테스트", "en"];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_3300
     * @tc.name testReadonlyArrayKeys033
     * @tc.desc Verify ReadonlyArray.keys behavior: ReadonlyArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["الاختبار", "en"];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_3400
     * @tc.name testReadonlyArrayKeys034
     * @tc.desc Verify ReadonlyArray.keys behavior: ReadonlyArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["test@example.com", "x"];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_3500
     * @tc.name testReadonlyArrayKeys035
     * @tc.desc Verify ReadonlyArray.keys behavior: ReadonlyArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["310101199001011234", "x"];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_3600
     * @tc.name testReadonlyArrayKeys036
     * @tc.desc Verify ReadonlyArray.keys behavior: tab ReadonlyArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\t", "\n", "x"];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_3700
     * @tc.name testReadonlyArrayKeys037
     * @tc.desc Verify ReadonlyArray.keys behavior: ReadonlyArray keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["622202********1234", "x"];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_3800
     * @tc.name testReadonlyArrayKeys038
     * @tc.desc Verify ReadonlyArray.keys behavior: keys iteration count matches arr length with float NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 3.0f];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_3900
     * @tc.name testReadonlyArrayKeys039
     * @tc.desc Verify ReadonlyArray.keys behavior: special elements - Unicode - Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["中文"];
      const collected: Array<int> = [];
      for (const item of arr.keys()) { collected.push(item); }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_4000
     * @tc.name testReadonlyArrayKeys040
     * @tc.desc Verify ReadonlyArray.keys behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.keys();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_4100
     * @tc.name testReadonlyArrayKeys041
     * @tc.desc Verify ReadonlyArray.keys behavior: boundary scale - array length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_4200
     * @tc.name testReadonlyArrayKeys042
     * @tc.desc Verify ReadonlyArray.keys behavior: boundary scale - array length equals 1024 - /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrSource: Array<int> = [];
      for (let i: int = 0; i < 1024; i++) {
        arrSource.push(i);
      }
      const arr: ReadonlyArray<int> = arrSource as ReadonlyArray<int>;
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_4300
     * @tc.name testReadonlyArrayKeys043
     * @tc.desc Verify ReadonlyArray.keys behavior: call consistency - ReadonlyArray assigned from regular Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_4400
     * @tc.name testReadonlyArrayKeys044
     * @tc.desc Verify ReadonlyArray.keys behavior: combination coverage - ReadonlyArray<int> = 1, 2, 3 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const collected: Array<int> = [];
      for (const item of arr.keys()) { collected.push(item); }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0);
      expect(collected[arr.length - 1]).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_4500
     * @tc.name testReadonlyArrayKeys045
     * @tc.desc Verify ReadonlyArray.keys behavior: combination coverage - ReadonlyArray<string> = "a", "b", "" group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", ""];
      const collected: Array<int> = [];
      for (const item of arr.keys()) { collected.push(item); }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0);
      expect(collected[arr.length - 1]).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_4600
     * @tc.name testReadonlyArrayKeys046
     * @tc.desc Verify ReadonlyArray.keys behavior: combination coverage - ReadonlyArray<string> = " ", "emoji", "long..." group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["中文", "😀", "long-text"];
      const collected: Array<int> = [];
      for (const item of arr.keys()) { collected.push(item); }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0);
      expect(collected[arr.length - 1]).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_4700
     * @tc.name testReadonlyArrayKeys047
     * @tc.desc Verify ReadonlyArray.keys behavior: combination coverage - ReadonlyArray<boolean> = true, false group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const collected: Array<int> = [];
      for (const item of arr.keys()) { collected.push(item); }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0);
      expect(collected[arr.length - 1]).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_4800
     * @tc.name testReadonlyArrayKeys048
     * @tc.desc Verify ReadonlyArray.keys behavior: combination coverage - ReadonlyArray<number> = NaN, 0, - 0 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 0.0, -0.0];
      const collected: Array<int> = [];
      for (const item of arr.keys()) { collected.push(item); }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0);
      expect(collected[arr.length - 1]).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_4900
     * @tc.name testReadonlyArrayKeys049
     * @tc.desc Verify ReadonlyArray.keys behavior: combination coverage - ReadonlyArray<Object> = obj1, obj2 group 1 interface behavior - ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 2;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      const collected: Array<int> = [];
      for (const item of arr.keys()) { collected.push(item); }
      expect(collected.length).assertEqual(arr.length);
      expect(collected[0]).assertEqual(0);
      expect(collected[arr.length - 1]).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_5000
     * @tc.name testReadonlyArrayKeys050
     * @tc.desc Verify ReadonlyArray.keys behavior: combination coverage - nested int array values group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<Array<int>> = [[1], [2, 3]];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_5100
     * @tc.name testReadonlyArrayKeys051
     * @tc.desc Verify ReadonlyArray.keys behavior: combination coverage - repeated int elements group 1 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 2];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_5200
     * @tc.name testReadonlyArrayKeys052
     * @tc.desc Verify ReadonlyArray.keys behavior: combination coverage - object reference values group 2 interface behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ReadonlyArrayKeysGeneratedItem = new ReadonlyArrayKeysGeneratedItem(1);
      const obj2: ReadonlyArrayKeysGeneratedItem = new ReadonlyArrayKeysGeneratedItem(2);
      const arr: ReadonlyArray<ReadonlyArrayKeysGeneratedItem> = [obj1, obj2];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_5300
     * @tc.name testReadonlyArrayKeys053
     * @tc.desc Verify ReadonlyArray.keys behavior: calling next() repeatedly after done still returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 8];
      const iter = arr.keys();
      iter.next();
      iter.next();
      const r3 = iter.next();
      const r4 = iter.next();
      expect(r3.done).assertTrue();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_5400
     * @tc.name testReadonlyArrayKeys054
     * @tc.desc Verify ReadonlyArray.keys behavior: two independent iterators maintain independent state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30];
      const iter1 = arr.keys();
      const iter2 = arr.keys();
      const a1 = iter1.next();
      const b1 = iter2.next();
      const a2 = iter1.next();
      expect(a1.value).assertEqual(0);
      expect(b1.value).assertEqual(0);
      expect(a2.value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_5500
     * @tc.name testReadonlyArrayKeys055
     * @tc.desc Verify ReadonlyArray.keys behavior: new iterator after array reads starts from index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [11, 22, 33];
      const v0: int = arr[0];
      const v1: int = arr[1];
      const iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(v0).assertEqual(11);
      expect(v1).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_5600
     * @tc.name testReadonlyArrayKeys056
     * @tc.desc Verify ReadonlyArray.keys behavior: empty array iterator first next returns done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      const iter = arr.keys();
      const first = iter.next();
      expect(first.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_5700
     * @tc.name testReadonlyArrayKeys057
     * @tc.desc Verify ReadonlyArray.keys behavior: iterator.next() returns IteratorResult with value/done fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 6];
      const iter = arr.keys();
      const r1 = iter.next();
      expect(r1.value).assertEqual(0);
      expect(r1.done).assertFalse();
      const r2 = iter.next();
      expect(r2.value).assertEqual(1);
      expect(r2.done).assertFalse();
      const r3 = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_5800
     * @tc.name testReadonlyArrayKeys058
     * @tc.desc Verify ReadonlyArray.keys behavior: iterator collected via for-of equals manual index loop result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [100, 200, 300, 400];
      const fromKeys: Array<int> = [];
      for (const k of arr.keys()) {
        fromKeys.push(k);
      }
      const fromManual: Array<int> = [];
      for (let i: int = 0; i < arr.length; i++) {
        fromManual.push(i);
      }
      expect(fromKeys.length).assertEqual(fromManual.length);
      for (let j: int = 0; j < fromKeys.length; j++) {
        expect(fromKeys[j]).assertEqual(fromManual[j]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_5900
     * @tc.name testReadonlyArrayKeys059
     * @tc.desc Verify ReadonlyArray.keys behavior: nested for-of loops with independent keys iterators do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      let pairs: int = 0;
      const outerSeq: Array<int> = [];
      const innerSeq: Array<int> = [];
      for (const outer of arr.keys()) {
        outerSeq.push(outer);
        for (const inner of arr.keys()) {
          if (outer === 0) {
            innerSeq.push(inner);
          }
          pairs++;
        }
      }
      expect(pairs).assertEqual(arr.length * arr.length);
      expect(outerSeq.length).assertEqual(arr.length);
      expect(innerSeq.length).assertEqual(arr.length);
      for (let i: int = 0; i < arr.length; i++) {
        expect(outerSeq[i]).assertEqual(i);
        expect(innerSeq[i]).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_6000
     * @tc.name testReadonlyArrayKeys060
     * @tc.desc Verify ReadonlyArray.keys behavior: object reference identity unchanged after keys() call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      obj1.id = 11;
      const obj2: ComboObjarr = new ComboObjarr();
      obj2.id = 22;
      const arr: ReadonlyArray<ComboObjarr> = [obj1, obj2];
      arr.keys();
      expect(arr[0] === obj1).assertTrue();
      expect(arr[1] === obj2).assertTrue();
      expect(arr[0].id).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_6100
     * @tc.name testReadonlyArrayKeys061
     * @tc.desc Verify ReadonlyArray.keys behavior: two consecutive keys() calls produce equal sequences with no hidden shared state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [9, 8, 7, 6];
      const c1: Array<int> = [];
      for (const k of arr.keys()) { c1.push(k); }
      const c2: Array<int> = [];
      for (const k of arr.keys()) { c2.push(k); }
      expect(c1.length).assertEqual(c2.length);
      for (let i: int = 0; i < c1.length; i++) {
        expect(c1[i]).assertEqual(c2[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_6200
     * @tc.name testReadonlyArrayKeys062
     * @tc.desc Verify ReadonlyArray.keys behavior: keys does not mutate original elements order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [3, 1, 4, 1, 5];
      arr.keys();
      const iter = arr.keys();
      while (true) {
        const r = iter.next();
        if (r.done) break;
      }
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_6300
     * @tc.name testReadonlyArrayKeys063
     * @tc.desc Verify ReadonlyArray.keys behavior: collected indices sum equals N*(N-1)/2 for sequential length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 50; i++) {
        source.push(i * 2);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      let sum: int = 0;
      for (const key of arr.keys()) {
        sum += key;
      }
      expect(sum).assertEqual(1225);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_6400
     * @tc.name testReadonlyArrayKeys064
     * @tc.desc Verify ReadonlyArray.keys behavior: iterator after partial consumption then exhaustion stays done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const iter = arr.keys();
      const r0 = iter.next();
      expect(r0.value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_6500
     * @tc.name testReadonlyArrayKeys065
     * @tc.desc Verify ReadonlyArray.keys behavior: char array with null character index iteration order preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b', c'c'];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_6600
     * @tc.name testReadonlyArrayKeys066
     * @tc.desc Verify ReadonlyArray.keys behavior: iterating partially via break does not affect original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      let stoppedAt: int = -1;
      for (const key of arr.keys()) {
        stoppedAt = key;
        if (key === 2) {
          break;
        }
      }
      expect(stoppedAt).assertEqual(2);
      expect(arr.length).assertEqual(5);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_6700
     * @tc.name testReadonlyArrayKeys067
     * @tc.desc Verify ReadonlyArray.keys behavior: two consecutive keys() calls return distinct iterator instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const iter1 = arr.keys();
      const iter2 = arr.keys();
      expect((iter1 as Object) === (iter2 as Object)).assertFalse();
      expect(iter1.next().value).assertEqual(0);
      expect(iter2.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_KEYS_6800
     * @tc.name testReadonlyArrayKeys068
     * @tc.desc Verify ReadonlyArray.keys behavior: nullable object array with null element still yields full index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayKeys068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ComboObjarr = new ComboObjarr();
      const arr: ReadonlyArray<ComboObjarr | null> = [obj1, null, obj1];
      let count: int = 0;
      for (const key of arr.keys()) {
        expect(key).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(arr.length);
      expect(arr[1]).assertEqual(null);
    });

  });
}
