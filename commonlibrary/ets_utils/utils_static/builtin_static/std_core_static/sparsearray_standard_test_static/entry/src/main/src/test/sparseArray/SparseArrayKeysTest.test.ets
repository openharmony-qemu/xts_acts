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

export default function SparseArrayKeysTest(): void {
  describe('SparseArrayKeysTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_0100
     * @tc.name testSparseArrayKeys001
     * @tc.desc Test SparseArray.keys, verify method result (result!.done equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>();
        const iterator = arr.keys();
        const result = iterator.next();
        expect(result!.done).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_0200
     * @tc.name testSparseArrayKeys002
     * @tc.desc Test SparseArray.keys, verify method result (keys.length equals 3, keys[0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const iterator = arr.keys();
        let result = iterator.next();
        let keys: Array<int> = [];
        while (!result.done) {
          const vk = result.value
          if (vk !== undefined) {
            keys.push(vk)
          }
          result = iterator.next();
        }
        expect(keys.length).assertEqual(3);
        expect(keys[0]).assertEqual(0);
        expect(keys[1]).assertEqual(1);
        expect(keys[2]).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_0300
     * @tc.name testSparseArrayKeys003
     * @tc.desc Test SparseArray.keys, verify method result (keys.length equals 2, keys[0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(3);
        arr[0] = "a";
        arr[2] = "c";
        const iterator = arr.keys();
        let result = iterator.next();
        let keys: Array<int> = [];
        while (!result.done) {
          const vk = result.value
          if (vk !== undefined) {
            keys.push(vk)
          }
          result = iterator.next();
        }
        expect(keys.length).assertEqual(2);
        expect(keys[0]).assertEqual(0);
        expect(keys[1]).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_0400
     * @tc.name testSparseArrayKeys004
     * @tc.desc Test SparseArray.keys, verify method result (result!.value equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(2);
        arr[1] = "b";
        const iterator = arr.keys();
        const result = iterator.next();
        expect(result!.value).assertEqual(1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_0500
     * @tc.name testSparseArrayKeys005
     * @tc.desc Test SparseArray.keys on single element: first key 0 and value is defined int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a");
        const iterator = arr.keys();
        let result = iterator.next();
        // keys() yields int indices; avoid Number.isInteger(... as number) — ClassCastError Int→Double on OHOS
        expect(result!.value).assertEqual(0);
        const v = result.value;
        expect(v !== undefined && v === 0).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_0600
     * @tc.name testSparseArrayKeys006
     * @tc.desc Test SparseArray.keys, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a");
        const iterator = arr.keys();
        const result = iterator.next();
        expect(result.hasOwnProperty("done")).assertEqual(true);
        expect(result.hasOwnProperty("value")).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_0700
     * @tc.name testSparseArrayKeys007
     * @tc.desc Test SparseArray.keys, verify method result (typeof iterator.next equals "function")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a");
        const iterator = arr.keys();
        expect(typeof iterator.next).assertEqual("function");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_0800
     * @tc.name testSparseArrayKeys008
     * @tc.desc Test SparseArray.keys, verify method result (result!.done equals false, result!.value equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("single");
        const iterator = arr.keys();
        let result = iterator.next();
        expect(result!.done).assertEqual(false);
        expect(result!.value).assertEqual(0);
        result = iterator.next();
        expect(result!.done).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_0900
     * @tc.name testSparseArrayKeys009
     * @tc.desc Test SparseArray.keys, verify method result (result!.value equals 999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(1000);
        arr[999] = "last";
        const iterator = arr.keys();
        let result = iterator.next();
        expect(result!.value).assertEqual(999);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_1000
     * @tc.name testSparseArrayKeys010
     * @tc.desc Test SparseArray.keys, verify method result (result!.value equals 1, result!.value equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(5);
        arr[3] = "d";
        arr[1] = "b";
        arr[4] = "e";
        const iterator = arr.keys();
        let result = iterator.next();
        expect(result!.value).assertEqual(1);
        result = iterator.next();
        expect(result!.value).assertEqual(3);
        result = iterator.next();
        expect(result!.value).assertEqual(4);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_1100
     * @tc.name testSparseArrayKeys011
     * @tc.desc Test SparseArray.keys, verify method result (iterator1 !== iterator2 equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        const iterator1 = arr.keys();
        const iterator2 = arr.keys();
        const result1 = iterator1.next();
        const result2 = iterator2.next();
        expect(iterator1 !== iterator2).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_1200
     * @tc.name testSparseArrayKeys012
     * @tc.desc Test SparseArray.keys, verify method result (result!.value equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        const iterator1 = arr.keys();
        iterator1.next();
        const iterator2 = arr.keys();
        const result = iterator1.next();
        expect(result!.value).assertEqual(1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_1300
     * @tc.name testSparseArrayKeys013
     * @tc.desc Test SparseArray.keys, verify method result (result1.value equals 0, result1.done equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a");
        const iterator1 = arr.keys();
        arr[1] = "b";
        const iterator2 = arr.keys();
        let result1 = iterator1.next();
        let result2 = iterator2.next();
        expect(result1.value).assertEqual(0);
        result1 = iterator1.next();
        expect(result1.done).assertEqual(false);
        expect(result1.value).assertEqual(1);
        result1 = iterator1.next();
        expect(result1.done).assertEqual(true);
        // iterator2: first next() at start was key 0; second next() is key 1
        result2 = iterator2.next();
        expect(result2.value).assertEqual(1);
        result2 = iterator2.next();
        expect(result2.done).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_1400
     * @tc.name testSparseArrayKeys014
     * @tc.desc Test SparseArray.keys, verify method result (result!.value equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const iterator = arr.keys();
        iterator.next();
        arr[1] = "bb";
        const result = iterator.next();
        expect(result!.value).assertEqual(1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_1500
     * @tc.name testSparseArrayKeys015
     * @tc.desc keys iterator on SparseArray<long> yields index keys in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(100 as long, 200 as long);
        const iterator = arr.keys();
        expect(iterator.next().value).assertEqual(0);
        expect(iterator.next().value).assertEqual(1);
        expect(iterator.next().done).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_KEYS_1600
     * @tc.name testSparseArrayKeys016
     * @tc.desc keys iterator yields index 0x3 for null element slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayKeys016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(0, 0, 0, null);
        const keys: Array<int> = [];
        const it = arr.keys();
        let step = it.next();
        while (!step.done) {
          keys.push(step.value as int);
          step = it.next();
        }
        expect(keys.length).assertEqual(4);
        expect(keys[0x3]).assertEqual(0x3);
    });


  });
}
