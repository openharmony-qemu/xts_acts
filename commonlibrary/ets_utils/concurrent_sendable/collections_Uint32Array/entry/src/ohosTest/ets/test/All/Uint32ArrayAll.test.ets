/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from './pages/Utils'
import { arrayLike } from './pages/TypeArrayConst'
import { collections } from '@kit.ArkTS';



interface GeneratedObjectLiteralInterface_1 {
  id: number;
  values: collections.Uint32Array;
}

export default function Uint32ArrayAllTest() {
  describe('Uint32ArrayAllTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   TypeArrayUint32Array001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0001
     * @tc.desc   用长度参数创建空Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint32Array001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = new collections.Uint32Array(5);
        expect(arr.length).assertEqual(5);
        expect(arr.byteLength).assertEqual(20);
        expect(collections.Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        expect(arr[3]).assertEqual(0);
        expect(arr[4]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0002
     * @tc.desc   从普通数字数组创建Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint32Array002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4]);
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
        expect(arr[3]).assertEqual(4);
        expect(arr.toString()).assertEqual('1,2,3,4');
      })

    /**
     * @tc.name   TypeArrayUint32Array003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0003
     * @tc.desc   从ArrayBuffer创建Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(16);
        const arr = new collections.Uint32Array(buffer);
        expect(arr.length).assertEqual(4);
        expect(arr.buffer).assertEqual(buffer);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        expect(arr[3]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0004
     * @tc.desc   从ArrayBuffer和偏移量、长度创建Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(20);
        const arr = new collections.Uint32Array(buffer, 4, 3);
        expect(arr.length).assertEqual(3);
        expect(arr.byteOffset).assertEqual(4);
        expect(arr.byteLength).assertEqual(12);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0005
     * @tc.desc   从其他TypedArray创建Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const source = new Uint16Array([100, 200, 300]);
        const arr = new collections.Uint32Array(source);
        expect(arr.length).assertEqual(3);
        expect(arr.toString()).assertEqual('100,200,300');
        expect(arr[0]).assertEqual(100);
        expect(arr[1]).assertEqual(200);
        expect(arr[2]).assertEqual(300);
      })

    /**
     * @tc.name   TypeArrayUint32Array006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0006
     * @tc.desc   从类数组对象创建Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(arrayLike);
        expect(arr.toString()).assertEqual('10,20,30');
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(20);
        expect(arr[2]).assertEqual(30);
      })

    /**
     * @tc.name   TypeArrayUint32Array007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0007
     * @tc.desc   验证BYTES_PER_ELEMENT静态属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint32Array007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        expect(collections.Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0008
     * @tc.desc   验证实例的byteLength属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint32Array008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = new collections.Uint32Array(5);
        expect(arr.byteLength).assertEqual(20);
        expect(arr.length).assertEqual(5)
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        expect(arr[3]).assertEqual(0);
        expect(arr[4]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0009
     * @tc.desc   验证buffer属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(3);
        expect(arr.buffer instanceof collections.ArrayBuffer).assertEqual(true);
        expect(arr.buffer.byteLength).assertEqual(12);
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0010
     * @tc.desc   验证byteOffset属性
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const buffer = new collections.ArrayBuffer(20);
        const arr = new collections.Uint32Array(buffer, 8);
        expect(arr.byteOffset).assertEqual(8);
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array011
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0011
     * @tc.desc   设置和获取元素值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('TypeArrayUint32Array011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        const arr = new collections.Uint32Array(3);
        arr[0] = 123456;
        arr[1] = 78901234;
        arr[2] = 987654321;
        expect(arr[0]).assertEqual(123456);
        expect(arr[1]).assertEqual(78901234);
        expect(arr[2]).assertEqual(987654321);
        expect(arr.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array012
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0012
     * @tc.desc   设置超出最大值的元素（溢出处理）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(1);
        const maxVal = 4294967295;
        arr[0] = maxVal + 1;
        expect(arr[0]).assertEqual(0);
        expect(arr.length).assertEqual(1);
      })

    /**
     * @tc.name   TypeArrayUint32Array013
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0013
     * @tc.desc   设置负值元素（溢出处理）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(2);
        arr[0] = -1;
        arr[1] = -100;
        expect(arr[0]).assertEqual(4294967295);
        expect(arr[1]).assertEqual(4294967196);
        expect(arr.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array014
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0014
     * @tc.desc   使用set方法复制数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(4);
        arr.set([10, 20, 30, 40]);
        expect(arr.toString()).assertEqual('10,20,30,40');
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(20);
        expect(arr[2]).assertEqual(30);
        expect(arr[3]).assertEqual(40);
      })

    /**
     * @tc.name   TypeArrayUint32Array015
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0015
     * @tc.desc   使用set方法带偏移量复制
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(5);
        arr.fill(0);
        arr.set([100, 200], 2);
        expect(arr.toString()).assertEqual('0,0,100,200,0');
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(100);
        expect(arr[3]).assertEqual(200);
        expect(arr[4]).assertEqual(0);
      })

    /**
     * @tc.name   TypeArrayUint32Array016
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0016
     * @tc.desc   使用subarray创建子数组视图
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4, 5]);
        const sub = arr.subarray(1, 4);
        expect(sub.toString()).assertEqual('2,3,4');
        expect(sub.buffer).assertEqual(arr.buffer);
        expect(sub.length).assertEqual(3);
        expect(sub[0]).assertEqual(2);
        expect(sub[1]).assertEqual(3);
        expect(sub[2]).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array017
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0017
     * @tc.desc   修改subarray影响原始数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10, 20, 30, 40]);
        const sub = arr.subarray(1, 3);
        sub[0] = 200;
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(200);
        expect(arr[2]).assertEqual(30);
        expect(arr[3]).assertEqual(40);
        expect(arr.length).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array018
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0018
     * @tc.desc   使用slice创建新数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10, 20, 30, 40]);
        const sliced = arr.slice(1, 3);
        expect(sliced.toString()).assertEqual('20,30');
        expect(sliced.buffer === arr.buffer).assertFalse();
        expect(sliced[0]).assertEqual(20);
        expect(sliced[1]).assertEqual(30);
        expect(sliced.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array019
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0019
     * @tc.desc   修改slice结果不影响原始数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10, 20, 30, 40]);
        const sliced = arr.slice(1, 3);
        sliced[0] = 200;
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(20);
        expect(arr[2]).assertEqual(30);
        expect(arr[3]).assertEqual(40);
        expect(arr.length).assertEqual(4);
      })

    /**
     * @tc.name   TypeArrayUint32Array020
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0020
     * @tc.desc   使用fill方法填充数组
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(5);
        arr.fill(123456);
        expect(arr.every(v => v === 123456)).assertEqual(true);
        expect(arr[0]).assertEqual(123456);
        expect(arr[1]).assertEqual(123456);
        expect(arr[2]).assertEqual(123456);
        expect(arr[3]).assertEqual(123456);
        expect(arr[4]).assertEqual(123456);
        expect(arr.length).assertEqual(5);
      })
    /**
     * @tc.name   TypeArrayUint32Array021
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0021
     * @tc.desc   使用fill方法填充指定范围元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1, 2, 3, 4, 5, 6]);
        arr.fill(999, 2, 5);
        expect(arr.toString()).assertEqual('1,2,999,999,999,6');
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(999);
        expect(arr[3]).assertEqual(999);
        expect(arr[4]).assertEqual(999);
        expect(arr[5]).assertEqual(6);
        expect(arr.length).assertEqual(6);
      })

    /**
     * @tc.name   TypeArrayUint32Array022
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0022
     * @tc.desc   使用fill方法填充超出范围的值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array(3);
        arr.fill(5000000000);
        expect(arr.every(v => v === 705032704)).assertEqual(true);
        expect(arr[0]).assertEqual(705032704);
        expect(arr[1]).assertEqual(705032704);
        expect(arr[2]).assertEqual(705032704);
        expect(arr.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array023
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0023
     * @tc.desc   使用map方法转换元素（范围内）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([100, 200, 300]);
        const mapped = arr.map(v => v * 2);
        expect(mapped.toString()).assertEqual('200,400,600');
        expect(mapped[0]).assertEqual(200);
        expect(mapped[1]).assertEqual(400);
        expect(mapped[2]).assertEqual(600);
        expect(mapped.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array024
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0024
     * @tc.desc   使用map方法转换元素（范围外截断）
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([2000000000, 3000000000]);
        const mapped = arr.map(v => v * 2);
        expect(mapped.toString()).assertEqual('4000000000,1705032704');
        expect(mapped[0]).assertEqual(4000000000);
        expect(mapped[1]).assertEqual(1705032704);
        expect(mapped.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array025
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0025
     * @tc.desc   使用filter方法筛选元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([1000000, 5000000, 10000000, 20000000]);
        const filtered = arr.filter(v => v > 5000000);
        expect(filtered.toString()).assertEqual('10000000,20000000');
        expect(filtered[0]).assertEqual(10000000);
        expect(filtered[1]).assertEqual(20000000);
        expect(filtered.length).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array026
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0026
     * @tc.desc   使用reduce方法计算总和
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([10, 20, 30, 40]);
        const sum = arr.reduce((acc, val) => acc + val, 0);
        expect(sum).assertEqual(100);
      })

    /**
     * @tc.name   TypeArrayUint32Array027
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0027
     * @tc.desc   使用reduce方法处理溢出值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([4294967290, 10]);
        const sum = arr.reduce((acc, val) => acc + val, 0);
        expect(sum).assertEqual(4294967300);
        expect(sum > 4294967295).assertEqual(true);
      })

    /**
     * @tc.name   TypeArrayUint32Array028
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0028
     * @tc.desc   使用every方法检查所有元素是否满足条件
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr1 = new collections.Uint32Array([1000, 2000, 3000]);
        const arr2 = new collections.Uint32Array([1000, 5000000000, 3000]);
        const allBelow4000 = (v: number) => v < 4000;
        expect(arr1.every(allBelow4000)).assertEqual(true);
        expect(arr2.every(allBelow4000)).assertEqual(false);
        expect(arr1[0]).assertEqual(1000);
        expect(arr1[1]).assertEqual(2000);
        expect(arr1[2]).assertEqual(3000);
        expect(arr1.length).assertEqual(3);
        expect(arr2[0]).assertEqual(1000);
        expect(arr2[1]).assertEqual(705032704);
        expect(arr2[2]).assertEqual(3000);
        expect(arr2.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array029
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0029
     * @tc.desc   使用some方法检查是否有元素满足条件
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr1 = new collections.Uint32Array([100, 200, 300]);
        const arr2 = new collections.Uint32Array([100, 200, 300]);
        const has200 = (v: number) => v === 200;
        const has400 = (v: number) => v === 400;
        expect(arr1.some(has200)).assertEqual(true);
        expect(arr1[0]).assertEqual(100);
        expect(arr1[1]).assertEqual(200);
        expect(arr1[2]).assertEqual(300);
        expect(arr1.length).assertEqual(3);
        expect(arr2.some(has400)).assertEqual(false);
        expect(arr2[0]).assertEqual(100);
        expect(arr2[1]).assertEqual(200);
        expect(arr2[2]).assertEqual(300);
        expect(arr2.length).assertEqual(3);
      })

    /**
     * @tc.name   TypeArrayUint32Array030
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0030
     * @tc.desc   使用find方法查找满足条件的元素
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([500000, 1000000, 1500000, 2000000]);
        const found = arr.find(v => v > 1200000);
        expect(found).assertEqual(1500000);
      })

    /**
     * @tc.name   TypeArrayUint32Array031
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0031
     * @tc.desc   使用findIndex方法查找满足条件的元素索引
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([500000, 1000000, 1500000, 2000000]);
        const index = arr.findIndex(v => v > 1200000);
        expect(index).assertEqual(2);
      })

    /**
     * @tc.name   TypeArrayUint32Array032
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_UINT32_ARRAY_ALL_0032
     * @tc.desc   使用includes方法检查元素是否存在
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('TypeArrayUint32Array032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        const arr = new collections.Uint32Array([123456, 7890123, 4567890]);
        expect(arr.includes(7890123)).assertEqual(true);
        expect(arr.includes(111111)).assertEqual(false);
        expect(arr[0]).assertEqual(123456);
        expect(arr[1]).assertEqual(7890123);
