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

enum Color019 {
    Red,
    Green,
    Blue
  }

enum Color020 {
    Red,
    Green,
    Blue
  }

export default function SparseArrayPushTest(): void {
  describe('SparseArrayPushTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0001
     * @tc.name testSparseArrayPush001
     * @tc.desc Test SparseArray.push, verify method result (length equals 0, arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let length = arr.push()
        expect(length).assertEqual(0)
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0002
     * @tc.name testSparseArrayPush002
     * @tc.desc Test SparseArray.push, verify method result (length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let length = arr.push(10)
        expect(length).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0003
     * @tc.name testSparseArrayPush003
     * @tc.desc Test SparseArray.push, verify method result (length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let length = arr.push(10, 20)
        expect(length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0004
     * @tc.name testSparseArrayPush004
     * @tc.desc Test SparseArray.push, verify method result (length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let length = arr.push(10, 20, 30, 40, 50)
        expect(length).assertEqual(5)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0005
     * @tc.name testSparseArrayPush005
     * @tc.desc Test SparseArray.push, verify method result (length equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let length = arr.push(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        expect(length).assertEqual(10)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0006
     * @tc.name testSparseArrayPush006
     * @tc.desc Test SparseArray.push, verify method result (length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>()
        let length = arr.push(null, 10)
        expect(length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0007
     * @tc.name testSparseArrayPush007
     * @tc.desc Test SparseArray.push, verify method result (length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>()
        let length = arr.push(undefined, 20)
        expect(length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0008
     * @tc.name testSparseArrayPush008
     * @tc.desc Test SparseArray.push, verify method result (length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        let length = arr.push("hello", "world")
        expect(length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0009
     * @tc.name testSparseArrayPush009
     * @tc.desc Test SparseArray.push, verify method result (length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        let length = arr.push("")
        expect(length).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0010
     * @tc.name testSparseArrayPush010
     * @tc.desc Test SparseArray.push, verify method result (length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        let length = arr.push("\n", "\t", "\\")
        expect(length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0011
     * @tc.name testSparseArrayPush011
     * @tc.desc Test SparseArray.push, verify method result (length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        let length = arr.push("\udc04", "\xe4")
        expect(length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0012
     * @tc.name testSparseArrayPush012
     * @tc.desc Test SparseArray.push, verify method result (length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>()
        let length = arr.push(true, false, true)
        expect(length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0013
     * @tc.name testSparseArrayPush013
     * @tc.desc Test SparseArray.push, verify method result (length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>()
        let length = arr.push(c'A', c'B', c'C')
        expect(length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0014
     * @tc.name testSparseArrayPush014
     * @tc.desc Test SparseArray.push, verify method result (length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>()
        let length = arr.push(c'\n')
        expect(length).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0015
     * @tc.name testSparseArrayPush015
     * @tc.desc Test SparseArray.push, verify method result (length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>()
        let length = arr.push(100, "hello", 200)
        expect(length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0016
     * @tc.name testSparseArrayPush016
     * @tc.desc Test SparseArray.push, verify method result (length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>()
        let length = arr.push(100, null, 200)
        expect(length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0017
     * @tc.name testSparseArrayPush017
     * @tc.desc Test SparseArray.push, verify method result (length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>()
        let length = arr.push(100, undefined, 200)
        expect(length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0018
     * @tc.name testSparseArrayPush018
     * @tc.desc Test SparseArray.push, verify method result (length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string | boolean>()
        let length = arr.push(10, "hello", true, 20)
        expect(length).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0019
     * @tc.name testSparseArrayPush019
     * @tc.desc Test SparseArray.push, verify method result (length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Color019>()
        let length = arr.push(Color019.Red, Color019.Green, Color019.Blue)
        expect(length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0020
     * @tc.name testSparseArrayPush020
     * @tc.desc push invalid enum value; runtime throw depends on OH enum validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Color020>()
        let threw = false
        try {
          arr.push(999 as Color020)
        } catch (_e) {
          threw = true
        }
        expect(threw).assertTrue()
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0021
     * @tc.name testSparseArrayPush021
     * @tc.desc Test SparseArray.push, verify method result (length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let source = [10, 20, 30]
        let length = arr.push(...source)
        expect(length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0022
     * @tc.name testSparseArrayPush022
     * @tc.desc Test SparseArray.push, verify method result (length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let source1 = [10, 20]
        let source2 = [30, 40]
        let length = arr.push(...source1, ...source2)
        expect(length).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0023
     * @tc.name testSparseArrayPush023
     * @tc.desc Test SparseArray.push, verify method result (length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let source = [20, 30]
        let length = arr.push(10, ...source, 40)
        expect(length).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0024
     * @tc.name testSparseArrayPush024
     * @tc.desc Test SparseArray.push, verify method result (length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const source = new SparseArray<int>(1, 2, 3)
        const target = new SparseArray<int>()
        let length = target.length
        source.forEach((value: int, index: int): void => {
          length = target.push(value)
        })
        expect(length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0025
     * @tc.name testSparseArrayPush025
     * @tc.desc Test SparseArray.push, verify method result (length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let length = arr.push(10, 20, 30)
        expect(length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0026
     * @tc.name testSparseArrayPush026
     * @tc.desc Test SparseArray.push, verify method result (length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 10)
        let length = arr.push(15, 20)
        expect(length).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0027
     * @tc.name testSparseArrayPush027
     * @tc.desc Test SparseArray.push, verify method result (length1 equals 2, length2 equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let length1 = arr.push(10, 20)
        let length2 = arr.push(30, 40)
        expect(length1).assertEqual(2)
        expect(length2).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0028
     * @tc.name testSparseArrayPush028
     * @tc.desc Test SparseArray.push, verify method result (length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let length: int = arr.push(10, 20)
        expect(length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0029
     * @tc.name testSparseArrayPush029
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        for (let i = 0; i < 100; i++) {
          arr.push(i)
        }
        expect(arr.length).assertEqual(100)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0030
     * @tc.name testSparseArrayPush030
     * @tc.desc Test SparseArray.push, verify method result (length equals i + 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        for (let i = 0; i < 100; i++) {
          let length = arr.push(i)
          expect(length).assertEqual(i + 1)
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0031
     * @tc.name testSparseArrayPush031
     * @tc.desc Test SparseArray.push, verify method result (length >= 0 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let length = arr.push(10)
        expect(length >= 0).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0032
     * @tc.name testSparseArrayPush032
     * @tc.desc Test SparseArray.push, verify method result (len1 equals 1, len2 equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>()
        const len1 = arr1.push(10)
        expect(len1).assertEqual(1)

        const arr2 = new SparseArray<string>()
        const len2 = arr2.push("hello")
        expect(len2).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0033
     * @tc.name testSparseArrayPush033
     * @tc.desc Test SparseArray.push, verify method result (length equals 7, arr[5] equals 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[0] = 10
        arr[2] = 30
        let length = arr.push(40, 50)
        expect(length).assertEqual(7)
        expect(arr[5]).assertEqual(40)
        expect(arr[6]).assertEqual(50)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0034
     * @tc.name testSparseArrayPush034
     * @tc.desc Test SparseArray.push, verify method result (arr[1] equals undefined, arr[2] equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[0] = 10
        arr[4] = 50
        arr.push(60, 70)
        expect(arr[1]).assertEqual(undefined)
        expect(arr[2]).assertEqual(undefined)
        expect(arr[3]).assertEqual(undefined)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0035
     * @tc.name testSparseArrayPush035
     * @tc.desc Test SparseArray.push, verify method result (length equals 11, arr.length equals 11)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10)
        arr[0] = 100
        arr[9] = 900
        let length = arr.push(1000)
        expect(length).assertEqual(11)
        expect(arr.length).assertEqual(11)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0036
     * @tc.name testSparseArrayPush036
     * @tc.desc Test SparseArray.push, verify method result (arr[0] equals 10, arr[1] equals 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(10, 20, 30)
        expect(arr[0]).assertEqual(10)
        expect(arr[1]).assertEqual(20)
        expect(arr[2]).assertEqual(30)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0037
     * @tc.name testSparseArrayPush037
     * @tc.desc Test SparseArray.push, verify method result (arr[2] equals 15, arr[3] equals 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 10)
        arr.push(15, 20)
        expect(arr[2]).assertEqual(15)
        expect(arr[3]).assertEqual(20)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0038
     * @tc.name testSparseArrayPush038
     * @tc.desc Test SparseArray.push, verify method result (arr[0] equals 10, arr[1] equals 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(10, 20)
        arr.push(30, 40)
        expect(arr[0]).assertEqual(10)
        expect(arr[1]).assertEqual(20)
        expect(arr[2]).assertEqual(30)
        expect(arr[3]).assertEqual(40)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0039
     * @tc.name testSparseArrayPush039
     * @tc.desc Test SparseArray.push, verify method result (arr[0] === 100 is true, arr[1] === 200 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(100, 200, 300)
        expect(arr[0] === 100).assertTrue()
        expect(arr[1] === 200).assertTrue()
        expect(arr[2] === 300).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0040
     * @tc.name testSparseArrayPush040
     * @tc.desc Test SparseArray.push, verify method result (beforeLength equals afterLength)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20)
        let beforeLength = arr.length
        arr.push()
        let afterLength = arr.length
        expect(beforeLength).assertEqual(afterLength)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0041
     * @tc.name testSparseArrayPush041
     * @tc.desc Test SparseArray.push, verify method result (arr[0] equals 10, arr[1] equals 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        arr.push()
        expect(arr[0]).assertEqual(10)
        expect(arr[1]).assertEqual(20)
        expect(arr[2]).assertEqual(30)
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0042
     * @tc.name testSparseArrayPush042
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(10, 20, 30)
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0043
     * @tc.name testSparseArrayPush043
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 1, arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(10)
        expect(arr.length).assertEqual(1)
        arr.push(20, 30)
        expect(arr.length).assertEqual(3)
        arr.push(40)
        expect(arr.length).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0044
     * @tc.name testSparseArrayPush044
     * @tc.desc Test SparseArray.push, verify method result (returnLength equals arr.length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let returnLength = arr.push(10, 20, 30)
        expect(returnLength).assertEqual(arr.length)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0045
     * @tc.name testSparseArrayPush045
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        arr.push("a", "b", "c")
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0046
     * @tc.name testSparseArrayPush046
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>()
        arr.push(true, false, true)
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0047
     * @tc.name testSparseArrayPush047
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush047', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>()
        arr.push(c'A', c'B', c'C')
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0048
     * @tc.name testSparseArrayPush048
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush048', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>()
        arr.push(1, "hello", 2, "world")
        expect(arr.length).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0049
     * @tc.name testSparseArrayPush049
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush049', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Array<int>>()
        arr.push([1, 2], [3, 4])
        expect(arr.length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0050
     * @tc.name testSparseArrayPush050
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush050', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>()
        arr.push(1.5, 2.5, 3.5)
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0051
     * @tc.name testSparseArrayPush051
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 10000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush051', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        const startTime = Date.now()
        for (let i = 0; i < 10000; i++) {
          arr.push(i)
        }
        const endTime = Date.now()
        expect(arr.length).assertEqual(10000)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0052
     * @tc.name testSparseArrayPush052
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 50000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush052', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        const startTime = Date.now()
        for (let i = 0; i < 10000; i++) {
          arr.push(i, i + 1, i + 2, i + 3, i + 4)
        }
        const endTime = Date.now()
        expect(arr.length).assertEqual(50000)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0053
     * @tc.name testSparseArrayPush053
     * @tc.desc Test SparseArray.push, verify method result (found equals 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush053', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(10, 20, 30)
        const found = arr.find((v) => v > 15)
        expect(found).assertEqual(20)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0054
     * @tc.name testSparseArrayPush054
     * @tc.desc Test SparseArray.push, verify method result (filtered.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush054', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(1, 2, 3, 4)
        const filtered = arr.filter((v) => v % 2 === 0)
        expect(filtered.length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0055
     * @tc.name testSparseArrayPush055
     * @tc.desc Test SparseArray.push, verify method result (str equals ",,,,,1,2,3")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush055', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr.push(1, 2, 3)
        const str = arr.toString()
        expect(str).assertEqual(",,,,,1,2,3")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0056
     * @tc.name testSparseArrayPush056
     * @tc.desc Test SparseArray.push, verify method result (arr[2] equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush056', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(10, 20)
        expect(arr[2]).assertEqual(undefined)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0057
     * @tc.name testSparseArrayPush057
     * @tc.desc Test SparseArray.push, verify method result (length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush057', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.length = 3
        let length = arr.push(100, 200)
        expect(length).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0058
     * @tc.name testSparseArrayPush058
     * @tc.desc push byte boundary elements 127 and -128, verify stored values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush058', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>();
        arr.push(127 as byte, (-128 as byte));
        expect(arr[0]).assertEqual(127 as byte);
        expect(arr[1]).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0059
     * @tc.name testSparseArrayPush059
     * @tc.desc push short boundary elements, verify stored values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush059', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>();
        arr.push(32767 as short, (-32768 as short));
        expect(arr[0]).assertEqual(32767 as short);
        expect(arr[1]).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0060
     * @tc.name testSparseArrayPush060
     * @tc.desc push long large integer element, verify stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush060', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>();
        const big: long = 10000000000 as long;
        arr.push(big);
        expect(arr[0]).assertEqual(big);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0070
     * @tc.name testSparseArrayPush061
     * @tc.desc push float element, verify stored float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush061', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>();
        arr.push(3.14f);
        expect(arr[0]).assertEqual(3.14f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0080
     * @tc.name testSparseArrayPush062
     * @tc.desc push Set<int> element into SparseArray<Set<int>>, verify set stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush062', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const set = new Set<int>([1, 2, 3]);
        const arr = new SparseArray<Set<int>>();
        arr.push(set);
        expect(arr.length).assertEqual(1);
        expect(arr[0]!.size).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0090
     * @tc.name testSparseArrayPush063
     * @tc.desc push emoji elements then $_get at octal index 0o10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush063', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>();
        for (let i = 0; i < 9; i++) {
          arr.push("\uD83D\uDE00");
        }
        expect(arr.length).assertEqual(9);
        expect(arr.$_get(0o10 - 1)).assertEqual("\uD83D\uDE00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0100
     * @tc.name testSparseArrayPush064
     * @tc.desc push null into SparseArray<Color019|null> enum slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush064', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Color019 | null>();
        const len = arr.push(Color019.Red, null, Color019.Blue);
        expect(len).assertEqual(3);
        expect(arr[1]).assertEqual(null);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0110
     * @tc.name testSparseArrayPush065
     * @tc.desc push long element near LONG_MAX boundary 9223372036854775806
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush065', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>();
        const nearMax: long = 9223372036854775806 as long;
        arr.push(nearMax);
        expect(arr[0]).assertEqual(nearMax);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0111
     * @tc.name testSparseArrayPush066
     * @tc.desc push hex ordinal 0x1 as Color019 stores Green enum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush066', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Color019>();
        arr.push(0x1 as Color019);
        expect(arr[0]).assertEqual(Color019.Green);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0112
     * @tc.name testSparseArrayPush067
     * @tc.desc push char values returns updated length and stores char order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush067', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>();
        const len = arr.push(c'A', c'B');
        expect(len).assertEqual(2);
        expect(arr[0]).assertEqual(c'A');
        expect(arr[1]).assertEqual(c'B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0113
     * @tc.name testSparseArrayPush068
     * @tc.desc push explicit undefined into SparseArray<int|undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush068', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>();
        const len = arr.push(undefined, 7);
        expect(len).assertEqual(2);
        expect(arr[0]).assertUndefined();
        expect(arr[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_PUSH_0114
     * @tc.name testSparseArrayPush069
     * @tc.desc push byte boundary values returns updated length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPush069', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>();
        const len = arr.push(127 as byte, (-128 as byte));
        expect(len).assertEqual(2);
        expect(arr[0]).assertEqual(127 as byte);
        expect(arr[1]).assertEqual(-128 as byte);
    });

  });
}
