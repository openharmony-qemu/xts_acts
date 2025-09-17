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
import { sleep } from '../../testability/pages/Utils'

export default function typeArrayBigUint64ArrayTest() {
  describe('TypeArrayBigUint64ArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0000
     * @tc.name TypeArrayBigUint64ArrayBufferDv0000
     * @tc.desc 验证BigUint64Array基本构造和初始化
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = new BigUint64Array(2);
      expect(arr1.length).assertEqual(2);
      expect(arr1.byteLength).assertEqual(16);
      expect(arr1[0]).assertEqual(0n);
      expect(arr1[1]).assertEqual(0n);

      const arr2 = new BigUint64Array([10n, 20n, 30n]);
      expect(arr2.length).assertEqual(3);
      expect(arr2[0]).assertEqual(10n);
      expect(arr2[1]).assertEqual(20n);
      expect(arr2[2]).assertEqual(30n);

      const buf = new ArrayBuffer(16);
      const arr3 = new BigUint64Array(buf);
      expect(arr3.length).assertEqual(2);
      expect(arr3.buffer).assertEqual(buf);
      expect(arr3[0]).assertEqual(0n);
      expect(arr3[1]).assertEqual(0n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0001
     * @tc.name TypeArrayBigUint64ArrayBufferDv0001
     * @tc.desc 验证BigUint64Array与DataView的基础同步
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);

      uintArr[0] = 0x123456789ABCDEF0n;
      expect(dv.getBigUint64(0, true)).assertEqual(0x123456789ABCDEF0n);

      dv.setBigUint64(0, 0xFEDCBA9876543210n, true);
      expect(uintArr[0]).assertEqual(0xFEDCBA9876543210n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0002
     * @tc.name TypeArrayBigUint64ArrayBufferDv0002
     * @tc.desc 验证BigUint64Array的索引访问和修改
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);

      arr[1] = 100n;
      expect(arr[1]).assertEqual(100n);
      expect(arr[3]).assertEqual(undefined);

      arr[5] = 200n;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(100n);
      expect(arr[2]).assertEqual(3n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0003
     * @tc.name TypeArrayBigUint64ArrayBufferDv0003
     * @tc.desc 验证BigUint64Array与SharedArrayBuffer的同步性
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(16);
      const view1 = new BigUint64Array(sab);
      const view2 = new BigUint64Array(sab);

      view1[0] = 12345n;
      view1[1] = 67890n;
      expect(view2[0]).assertEqual(12345n);
      expect(view2[1]).assertEqual(67890n);

      view2[0] = 98765n;
      expect(view1[0]).assertEqual(98765n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0004
     * @tc.name TypeArrayBigUint64ArrayBufferDv0004
     * @tc.desc 验证BigUint64Array的set方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array(5);
      const source = new BigUint64Array([10n, 20n, 30n]);

      arr.set(source, 1);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(10n);
      expect(arr[2]).assertEqual(20n);
      expect(arr[3]).assertEqual(30n);
      expect(arr[4]).assertEqual(0n);

      arr.set([40n], 3);
      expect(arr[3]).assertEqual(40n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0005
     * @tc.name TypeArrayBigUint64ArrayBufferDv0005
     * @tc.desc 验证BigUint64Array的subarray方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);

      const sub = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(2n);
      expect(sub[1]).assertEqual(3n);
      expect(sub[2]).assertEqual(4n);

      sub[1] = 30n;
      expect(arr[2]).assertEqual(30n);

      arr[3] = 40n;
      expect(sub[2]).assertEqual(40n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0006
     * @tc.name TypeArrayBigUint64ArrayBufferDv0006
     * @tc.desc 验证BigUint64Array的slice方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);

      const slice = arr.slice(1, 4);
      expect(slice.length).assertEqual(3);
      expect(slice[0]).assertEqual(2n);
      expect(slice[1]).assertEqual(3n);
      expect(slice[2]).assertEqual(4n);

      slice[1] = 30n;
      expect(arr[2]).assertEqual(3n);

      arr[3] = 40n;
      expect(slice[2]).assertEqual(4n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0007
     * @tc.name TypeArrayBigUint64ArrayBufferDv0007
     * @tc.desc 验证BigUint64Array与DataView的8位值交互
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);

      dv.setUint8(0, 0xFF);
      dv.setUint8(7, 0xAA);

      const expected = 0xAA000000000000FFn;
      expect(uintArr[0]).assertEqual(expected);

      uintArr[0] = 0x1122334455667788n;
      expect(dv.getUint8(0)).assertEqual(0x88);
      expect(dv.getUint8(1)).assertEqual(0x77);
      expect(dv.getUint8(6)).assertEqual(0x22);
      expect(dv.getUint8(7)).assertEqual(0x11);
    })
    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0008
     * @tc.name TypeArrayBigUint64ArrayBufferDv0008
     * @tc.desc 验证BigUint64Array与DataView的16位值交互
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      dv.setUint16(0, 0x1234, true);
      dv.setUint16(6, 0xABCD, true);
      const expected = 0xabcd000000001234n;
      expect(uintArr[0]).assertEqual(expected);

      expect(uintArr.length).assertEqual(1);

      uintArr[0] = 0xAABBCCDD11223344n;


      expect(dv.getUint16(0, true)).assertEqual(0x3344);
      expect(dv.getUint16(2, true)).assertEqual(0x1122);
      expect(dv.getUint16(4, true)).assertEqual(0xCCDD);
      expect(dv.getUint16(6, true)).assertEqual(0xAABB);
      expect(uintArr[0]).assertEqual(0xAABBCCDD11223344n);
      expect(uintArr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0009
     * @tc.name TypeArrayBigUint64ArrayBufferDv0009
     * @tc.desc 验证BigUint64Array与DataView的32位值交互
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      dv.setUint32(0, 0x12345678, true);
      dv.setUint32(4, 0x9ABCDEF0, true);
      const expected = 0x9ABCDEF012345678n;
      expect(uintArr[0]).assertEqual(expected);
      expect(uintArr.length).assertEqual(1);

      uintArr[0] = 0x0011223344556677n;
      expect(uintArr[0]).assertEqual(0x0011223344556677n);

      expect(dv.getUint32(0, true)).assertEqual(0x44556677);
      expect(dv.getUint32(4, true)).assertEqual(0x00112233);
      expect(uintArr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0010
     * @tc.name TypeArrayBigUint64ArrayBufferDv0010
     * @tc.desc 验证BigUint64Array的fill方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(0n);
      arr.fill(10n);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(10n);
      }
      expect(arr.length).assertEqual(5);
      arr.fill(20n, 1, 4);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(20n);
      expect(arr[3]).assertEqual(20n);
      expect(arr[4]).assertEqual(10n);

      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0011
     * @tc.name TypeArrayBigUint64ArrayBufferDv0011
     * @tc.desc 验证BigUint64Array的copyWithin方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
      expect(arr[4]).assertEqual(5n);
      arr.copyWithin(0, 3, 5);
      expect(arr.toString()).assertEqual([4n, 5n, 3n, 4n, 5n].toString());
      expect(arr[0]).assertEqual(4n);
      expect(arr[1]).assertEqual(5n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
      expect(arr[4]).assertEqual(5n);
      expect(arr.length).assertEqual(5);
      arr.set([1n, 2n, 3n, 4n, 5n]);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
      expect(arr[4]).assertEqual(5n);
      arr.copyWithin(2, 0, 2);
      expect(arr.toString()).assertEqual([1n, 2n, 1n, 2n, 5n].toString());
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(1n);
      expect(arr[3]).assertEqual(2n);
      expect(arr[4]).assertEqual(5n);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0012
     * @tc.name TypeArrayBigUint64ArrayBufferDv0012
     * @tc.desc 验证BigUint64Array的indexOf方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([10n, 20n, 30n, 20n, 40n]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(20n);
      expect(arr[4]).assertEqual(40n);
      expect(arr.indexOf(20n)).assertEqual(1);
      expect(arr.indexOf(25n)).assertEqual(-1);
      expect(arr.indexOf(20n, 2)).assertEqual(3);
      expect(arr.indexOf(10n, 10)).assertEqual(-1);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(20n);
      expect(arr[4]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0013
     * @tc.name TypeArrayBigUint64ArrayBufferDv0013
     * @tc.desc 验证BigUint64Array的lastIndexOf方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([10n, 20n, 30n, 20n, 40n]);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(20n);
      expect(arr[4]).assertEqual(40n);
      expect(arr.lastIndexOf(20n)).assertEqual(3);
      expect(arr.lastIndexOf(25n)).assertEqual(-1);

      expect(arr.lastIndexOf(20n, 2)).assertEqual(1);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(20n);
      expect(arr[4]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0014
     * @tc.name TypeArrayBigUint64ArrayBufferDv0014
     * @tc.desc 验证BigUint64Array的includes方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([5n, 10n, 15n, 20n]);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(5n);
      expect(arr[1]).assertEqual(10n);
      expect(arr[2]).assertEqual(15n);
      expect(arr[3]).assertEqual(20n);
      expect(arr.includes(10n)).assertEqual(true);

      expect(arr.includes(12n)).assertEqual(false);
      expect(arr.includes(10n, 2)).assertEqual(false);
      expect(arr.includes(15n, 2)).assertEqual(true);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(5n);
      expect(arr[1]).assertEqual(10n);
      expect(arr[2]).assertEqual(15n);
      expect(arr[3]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0015
     * @tc.name TypeArrayBigUint64ArrayBufferDv0015
     * @tc.desc 验证BigUint64Array的entries迭代器
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      const entries = Array.from(arr.entries());
      expect(entries.length).assertEqual(3);
      expect(entries[0].toString()).assertEqual([0, 1n].toString());
      expect(entries[1].toString()).assertEqual([1, 2n].toString());
      expect(entries[2].toString()).assertEqual([2, 3n].toString());
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });
    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0016
     * @tc.name TypeArrayBigUint64ArrayBufferDv0016
     * @tc.desc 验证BigUint64Array的keys迭代器
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array(3);
      const keys = Array.from(arr.keys());
      expect(keys.toString()).assertEqual([0, 1, 2].toString());
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(1);
      expect(keys[2]).assertEqual(2);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0017
     * @tc.name TypeArrayBigUint64ArrayBufferDv0017
     * @tc.desc 验证BigUint64Array的values迭代器
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([10n, 20n, 30n]);
      const values = Array.from(arr.values());
      expect(values.toString()).assertEqual([10n, 20n, 30n].toString());
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(10n);
      expect(values[1]).assertEqual(20n);
      expect(values[2]).assertEqual(30n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0018
     * @tc.name TypeArrayBigUint64ArrayBufferDv0018
     * @tc.desc 验证BigUint64Array的forEach方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const result: bigint[] = [];

      arr.forEach((value) => {
        result.push(value * 2n);
      });
      expect(result.toString()).assertEqual([2n, 4n, 6n].toString());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2n);
      expect(result[1]).assertEqual(4n);
      expect(result[2]).assertEqual(6n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0019
     * @tc.name TypeArrayBigUint64ArrayBufferDv0019
     * @tc.desc 验证BigUint64Array的every方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = new BigUint64Array([2n, 4n, 6n, 8n]);
      const arr2 = new BigUint64Array([2n, 3n, 6n, 8n]);
      const allEven = (val: bigint) => val % 2n === 0n;
      expect(arr1.every(allEven)).assertEqual(true);
      expect(arr2.every(allEven)).assertEqual(false);

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0020
     * @tc.name TypeArrayBigUint64ArrayBufferDv0020
     * @tc.desc 验证BigUint64Array的some方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = new BigUint64Array([1n, 3n, 5n, 7n]);
      const arr2 = new BigUint64Array([1n, 3n, 6n, 7n]);
      const isEven = (val: bigint) => val % 2n === 0n;
      expect(arr1.some(isEven)).assertEqual(false);
      expect(arr2.some(isEven)).assertEqual(true);

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0021
     * @tc.name TypeArrayBigUint64ArrayBufferDv0021
     * @tc.desc 验证BigUint64Array的reduce方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const sum = arr.reduce((acc, val) => acc + val, 0n);
      expect(sum).assertEqual(10n);
      const product = arr.reduce((acc, val) => acc * val, 1n);
      expect(product).assertEqual(24n);

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0022
     * @tc.name TypeArrayBigUint64ArrayBufferDv0022
     * @tc.desc 验证BigUint64Array的reduceRight方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const str = arr.reduceRight((acc, val) => acc + val.toString(), '');
      expect(str).assertEqual('321');

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0023
     * @tc.name TypeArrayBigUint64ArrayBufferDv0023
     * @tc.desc 验证BigUint64Array的map方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const mapped = arr.map((val) => val * val);
      expect(mapped.toString()).assertEqual(new BigUint64Array([1n, 4n, 9n, 16n]).toString());
      expect(mapped.length).assertEqual(4);
      expect(mapped[0]).assertEqual(1n);
      expect(mapped[1]).assertEqual(4n);
      expect(mapped[2]).assertEqual(9n);
      expect(mapped[3]).assertEqual(16n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0024
     * @tc.name TypeArrayBigUint64ArrayBufferDv0024
     * @tc.desc 验证BigUint64Array的filter方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      const filtered = arr.filter((val) => val % 2n === 0n);
      expect(filtered.toString()).assertEqual(new BigUint64Array([2n, 4n, 6n]).toString());
      expect(filtered.length).assertEqual(3);
      expect(filtered[0]).assertEqual(2n);
      expect(filtered[1]).assertEqual(4n);
      expect(filtered[2]).assertEqual(6n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0025
     * @tc.name TypeArrayBigUint64ArrayBufferDv0025
     * @tc.desc 验证BigUint64Array与DataView的字节序差异
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      const value = 0x0123456789ABCDEFn;
      uintArr[0] = value;
      expect(dv.getBigUint64(0, true)).assertEqual(value);
      expect(dv.getBigUint64(0, false).toString()).assertEqual('17279655951921914625');
      dv.setBigUint64(0, value, false);
      expect(uintArr[0].toString()).assertEqual('17279655951921914625');
      expect(buf.byteLength).assertEqual(8);
      expect(uintArr.length).assertEqual(1);

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0026
     * @tc.name TypeArrayBigUint64ArrayBufferDv0026
     * @tc.desc 验证BigUint64Array处理超出32位范围的值
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(1);
      const largeValue = 0x123456789ABCDEF0n;
      arr[0] = largeValue;
      expect(arr[0]).assertEqual(largeValue);
      const dv = new DataView(arr.buffer);
      expect(dv.getUint32(4, true)).assertEqual(0x12345678);
      expect(dv.getUint32(0, true)).assertEqual(0x9ABCDEF0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0x123456789ABCDEF0n);
      expect(arr.buffer.byteLength).assertEqual(8);
      expect(dv.byteLength).assertEqual(8);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0027
     * @tc.name TypeArrayBigUint64ArrayBufferDv0027
     * @tc.desc 验证BigUint64Array的最大可能值
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(1);
      const maxValue = 0xFFFFFFFFFFFFFFFFn;
      arr[0] = maxValue;
      expect(arr[0]).assertEqual(maxValue);
      const dv = new DataView(arr.buffer);
      expect(dv.getBigUint64(0, true)).assertEqual(maxValue);
      expect(arr.buffer.byteLength).assertEqual(8);
      expect(dv.byteLength).assertEqual(8);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0xFFFFFFFFFFFFFFFFn);
      expect(dv.getUint32(0, true)).assertEqual(0xFFFFFFFF);
      expect(dv.getUint32(4, true)).assertEqual(0xFFFFFFFF);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0028
     * @tc.name TypeArrayBigUint64ArrayBufferDv0028
     * @tc.desc 验证BigUint64Array与普通数组的转换
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const original = [1n, 2n, 3n, 4n];
      const uintArr = new BigUint64Array(original);
      const converted = Array.from(uintArr);
      expect(converted.toString()).assertEqual(original.toString());
      expect(converted.length).assertEqual(4);
      expect(converted[0]).assertEqual(1n);
      expect(converted[1]).assertEqual(2n);
      expect(converted[2]).assertEqual(3n);
      expect(converted[3]).assertEqual(4n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0029
     * @tc.name TypeArrayBigUint64ArrayBufferDv0029
     * @tc.desc 验证BigUint64Array的byteOffset和byteLength属性
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf = new ArrayBuffer(32);
      const fullArr = new BigUint64Array(buf);
      expect(fullArr.byteOffset).assertEqual(0);
      expect(fullArr.byteLength).assertEqual(32);
      const offsetArr = new BigUint64Array(buf, 8, 1);
      expect(offsetArr.byteOffset).assertEqual(8);
      expect(offsetArr.byteLength).assertEqual(8);
      const subArr = fullArr.subarray(1, 3);
      expect(subArr.byteOffset).assertEqual(8);
      expect(subArr.byteLength).assertEqual(16);
      expect(fullArr.length).assertEqual(4);
      expect(offsetArr.length).assertEqual(1);
      expect(subArr.length).assertEqual(2);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0030
     * @tc.name TypeArrayBigUint64ArrayBufferDv0030
     * @tc.desc 验证BigUint64Array使用不同偏移量创建视图
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(24);
      const baseArr = new BigUint64Array(buf);
      baseArr.set([10n, 20n, 30n]);
      const view1 = new BigUint64Array(buf, 8);
      expect(view1.length).assertEqual(2);
      expect(view1[0]).assertEqual(20n);
      expect(view1[1]).assertEqual(30n);
      const view2 = new BigUint64Array(buf, 8, 1);
      expect(view2.length).assertEqual(1);
      expect(view2[0]).assertEqual(20n);
      view2[0] = 25n;
      expect(baseArr[1]).assertEqual(25n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0031
     * @tc.name TypeArrayBigUint64ArrayBufferDv0031
     * @tc.desc 验证BigUint64Array对无效偏移量的处理
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      let errorThrown = false;
      try {
        new BigUint64Array(buf, 4);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);
      errorThrown = false;
      try {
        new BigUint64Array(buf, 20);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);
      expect(buf.byteLength).assertEqual(16);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0032
     * @tc.name TypeArrayBigUint64ArrayBufferDv0032
     * @tc.desc 验证BigUint64Array与DataView处理特殊数值
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      uintArr[0] = 0n;
      expect(dv.getBigUint64(0, true)).assertEqual(0n);
      const maxVal = 0xFFFFFFFFFFFFFFFFn;
      uintArr[0] = maxVal;
      expect(dv.getBigUint64(0, true)).assertEqual(maxVal);
      const boundaryVal = 0x8000000000000000n;
      uintArr[0] = boundaryVal;
      expect(dv.getBigUint64(0, true)).assertEqual(boundaryVal);
      expect(uintArr.length).assertEqual(1);
      expect(uintArr[0]).assertEqual(0x8000000000000000n);
      expect(dv.getUint32(0, true)).assertEqual(0x00000000);
      expect(dv.getUint32(4, true)).assertEqual(0x80000000);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0033
     * @tc.name TypeArrayBigUint64ArrayBufferDv0033
     * @tc.desc 验证BigUint64Array的find方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([5n, 10n, 15n, 20n, 25n]);
      const found = arr.find(val => val > 15n);
      expect(found).assertEqual(20n);
      const notFound = arr.find(val => val === 30n);
      expect(notFound).assertEqual(undefined);

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0034
     * @tc.name TypeArrayBigUint64ArrayBufferDv0034
     * @tc.desc 验证BigUint64Array的findIndex方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([5n, 10n, 15n, 20n, 25n]);
      const index = arr.findIndex(val => val > 15n);
      expect(index).assertEqual(3);
      const notFoundIndex = arr.findIndex(val => val === 30n);
      expect(notFoundIndex).assertEqual(-1);

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0035
     * @tc.name TypeArrayBigUint64ArrayBufferDv0035
     * @tc.desc 验证BigUint64Array与DataView混合类型读写
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      dv.setInt32(0, -1, true);
      dv.setUint32(4, 0x12345678, true);
      const expected = 0x12345678FFFFFFFFn;
      expect(uintArr[0]).assertEqual(expected);
      uintArr[0] = 0xABCDEF1234567890n;
      expect(dv.getInt32(0, true)).assertEqual(0x34567890);
      expect(dv.getUint32(4, true)).assertEqual(0xABCDEF12);
      expect(uintArr.length).assertEqual(1);
      expect(uintArr[0]).assertEqual(0xABCDEF1234567890n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0036
     * @tc.name TypeArrayBigUint64ArrayBufferDv0036
     * @tc.desc 验证BigUint64Array的join方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      expect(arr.join()).assertEqual('1,2,3,4');
      expect(arr.join('-')).assertEqual('1-2-3-4');
      expect(arr.join('')).assertEqual('1234');

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0037
     * @tc.name TypeArrayBigUint64ArrayBufferDv0037
     * @tc.desc 验证BigUint64Array的reverse方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const reversed = arr.reverse();
      expect(reversed.toString()).assertEqual(new BigUint64Array([4n, 3n, 2n, 1n]).toString());
      expect(arr.toString()).assertEqual(new BigUint64Array([4n, 3n, 2n, 1n]).toString());
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(4n);
      expect(arr[1]).assertEqual(3n);
      expect(arr[2]).assertEqual(2n);
      expect(arr[3]).assertEqual(1n);
      expect(reversed.length).assertEqual(4);
      expect(reversed[0]).assertEqual(4n);
      expect(reversed[1]).assertEqual(3n);
      expect(reversed[2]).assertEqual(2n);
      expect(reversed[3]).assertEqual(1n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0038
     * @tc.name TypeArrayBigUint64ArrayBufferDv0038
     * @tc.desc 验证BigUint64Array的sort方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([3n, 1n, 4n, 2n]);
      const sorted = arr.sort((a, b) => Number(a - b));
      expect(sorted.toString()).assertEqual(new BigUint64Array([1n, 2n, 3n, 4n]).toString());
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 2n, 3n, 4n]).toString());
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
      expect(sorted.length).assertEqual(4);
      expect(sorted[0]).assertEqual(1n);
      expect(sorted[1]).assertEqual(2n);
      expect(sorted[2]).assertEqual(3n);
      expect(sorted[3]).assertEqual(4n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0039
     * @tc.name TypeArrayBigUint64ArrayBufferDv0039
     * @tc.desc 验证BigUint64Array与SharedArrayBuffer的并发模拟
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (Done: Function) => {
        const sab = new SharedArrayBuffer(8);
        const view1 = new BigUint64Array(sab);
        const view2 = new BigUint64Array(sab);
        view1[0] = 100n;
        expect(view2[0]).assertEqual(100n);
        const promise1 = new Promise<void>(resolve => {
          setTimeout(() => {
            view1[0] = 200n;
            resolve();
          }, 10);
        });
        const promise2 = new Promise<void>(resolve => {
          setTimeout(() => {
            view2[0] = 300n;
            resolve();
          }, 20);
        });
        await Promise.all([promise1, promise2]);
        expect(view1[0]).assertEqual(300n);
        expect(view2[0]).assertEqual(300n);
        expect(view1.length).assertEqual(1);
        expect(view2.length).assertEqual(1);
        expect(view1[0]).assertEqual(300n);
        expect(view2[0]).assertEqual(300n);
        expect(sab.byteLength).assertEqual(8);
        Done();
      })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0040
     * @tc.name TypeArrayBigUint64ArrayBufferDv0040
     * @tc.desc 验证BigUint64Array的slice方法边界情况
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const slice3 = arr.slice(-3, -1);
      expect(slice3.toString()).assertEqual(new BigUint64Array([3n, 4n]).toString());
      const slice4 = arr.slice(undefined, 3);
      expect(slice4.toString()).assertEqual(new BigUint64Array([1n, 2n, 3n]).toString());
      expect(slice3.length).assertEqual(2);
      expect(slice3[0]).assertEqual(3n);
      expect(slice3[1]).assertEqual(4n);
      expect(slice4.length).assertEqual(3);
      expect(slice4[0]).assertEqual(1n);
      expect(slice4[1]).assertEqual(2n);
      expect(slice4[2]).assertEqual(3n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0041
     * @tc.name TypeArrayBigUint64ArrayBufferDv0041
     * @tc.desc 验证BigUint64Array的subarray方法边界情况
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const sub3 = arr.subarray(-3, -1);
      expect(sub3.toString()).assertEqual(new BigUint64Array([3n, 4n]).toString());
      expect(sub3.length).assertEqual(2);
      expect(sub3[0]).assertEqual(3n);
      expect(sub3[1]).assertEqual(4n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0042
     * @tc.name TypeArrayBigUint64ArrayBufferDv0042
     * @tc.desc 验证BigUint64Array的set方法边界情况
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(5);
      const source = new BigUint64Array([10n, 20n, 30n]);
      try {
        arr.set(source, 3);
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(0n);
      arr.fill(0n);
      arr.set(source);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(0n);
      expect(arr.length).assertEqual(5);
      expect(source.length).assertEqual(3);
      expect(source[0]).assertEqual(10n);
      expect(source[1]).assertEqual(20n);
      expect(source[2]).assertEqual(30n);

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0043
     * @tc.name TypeArrayBigUint64ArrayBufferDv0043
     * @tc.desc 验证BigUint64Array的fill方法边界情况
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      const fillVal = 9n;
      arr.fill(fillVal, -3);
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 2n, 9n, 9n, 9n]).toString());
      arr.set([1n, 2n, 3n, 4n, 5n]);
      arr.fill(fillVal, 1, -1);
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 9n, 9n, 9n, 5n]).toString());
      arr.fill(fillVal, 10, 20);
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 9n, 9n, 9n, 5n]).toString());
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(9n);
      expect(arr[2]).assertEqual(9n);
      expect(arr[3]).assertEqual(9n);
      expect(arr[4]).assertEqual(5n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0044
     * @tc.name TypeArrayBigUint64ArrayBufferDv0044
     * @tc.desc 验证BigUint64Array的copyWithin方法边界情况
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 3, 10);
      expect(arr.toString()).assertEqual(new BigUint64Array([4n, 5n, 3n, 4n, 5n]).toString());
      arr.set([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(4, 0, 2);
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 2n, 3n, 4n, 1n]).toString());
      arr.set([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(-2, -4, -2);
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 2n, 3n, 2n, 3n]).toString());
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(2n);
      expect(arr[4]).assertEqual(3n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0045
     * @tc.name TypeArrayBigUint64ArrayBufferDv0045
     * @tc.desc 验证BigUint64Array与DataView处理浮点数表示
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf = new ArrayBuffer(8);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      const floatVal = 12345.6789;
      dv.setFloat64(0, floatVal, true);
      const uintVal = uintArr[0];
      dv.setBigUint64(0, uintVal, true);
      expect(dv.getFloat64(0, true)).assertEqual(floatVal);
      expect(uintArr.length).assertEqual(1);
      expect(uintArr[0]).assertEqual(uintVal);

    })


    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0047
     * @tc.name TypeArrayBigUint64ArrayBufferDv0047
     * @tc.desc 验证BigUint64Array的of方法
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = BigUint64Array.of(1n, 2n, 3n, 4n);
      expect(arr.toString()).assertEqual(new BigUint64Array([1n, 2n, 3n, 4n]).toString());
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0049
     * @tc.name TypeArrayBigUint64ArrayBufferDv0049
     * @tc.desc 验证BigUint64Array与其他TypedArray的交互
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const uint64Arr = new BigUint64Array(buf);
      const uint32Arr = new Uint32Array(buf);
      uint64Arr[0] = 0x0001020304050607n;
      uint64Arr[1] = 0x08090A0B0C0D0E0Fn;
      expect(uint32Arr.toString()).assertEqual(new Uint32Array([
        0x04050607,
        0x00010203,
        0x0C0D0E0F,
        0x08090A0B
      ]).toString());
      uint32Arr[0] = 0x11111111;
      uint32Arr[3] = 0x22222222;
      expect(uint64Arr[0]).assertEqual(0x0001020311111111n);
      expect(uint64Arr[1]).assertEqual(0x222222220C0D0E0Fn);
      expect(uint64Arr.length).assertEqual(2);
      expect(uint64Arr[0]).assertEqual(0x0001020311111111n);
      expect(uint64Arr[1]).assertEqual(0x222222220C0D0E0Fn);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0056
     * @tc.name TypeArrayBigUint64ArrayBufferDv0056
     * @tc.desc 验证BigUint64Array与DataView处理NaN和Infinity
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buf = new ArrayBuffer(16);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      dv.setFloat64(0, NaN, true);
      const nanBits = uintArr[0];
      dv.setFloat64(8, Infinity, true);
      const infBits = uintArr[1];
      expect(nanBits.toString()).assertEqual('9221120237041090560');
      expect(infBits.toString()).assertEqual('9218868437227405312');
      expect(uintArr.length).assertEqual(2);
      expect(uintArr[0]).assertEqual(0x7FF8000000000000n);
      expect(uintArr[1]).assertEqual(0x7FF0000000000000n);


    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0057
     * @tc.name TypeArrayBigUint64ArrayBufferDv0057
     * @tc.desc 验证BigUint64Array的reduce方法在中途修改数组的行为
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const sum = arr.reduce((acc, val, index) => {
        if (index === 0) {
          arr[3] = 40n;
        }
        return acc + val;
      }, 0n);
      expect(sum.toString()).assertEqual('46');
      expect(arr.toString()).assertEqual('1,2,3,40');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(40n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0062
     * @tc.name TypeArrayBigUint64ArrayBufferDv0062
     * @tc.desc 验证BigUint64Array与JSON的转换
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      try {
        JSON.stringify(Array.from(arr));
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0063
     * @tc.name TypeArrayBigUint64ArrayBufferDv0063
     * @tc.desc 验证BigUint64Array的values迭代器在数组修改后的行为
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const values = Array.from(arr.values());
      arr[1] = 20n;
      arr[2] = 30n;
      expect(values.toString()).assertEqual('1,2,3,4');
      expect(arr.toString()).assertEqual('1,20,30,4');
      expect(values.length).assertEqual(4);
      expect(values[0]).assertEqual(1n);
      expect(values[1]).assertEqual(2n);
      expect(values[2]).assertEqual(3n);
      expect(values[3]).assertEqual(4n);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(4n);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0064
     * @tc.name TypeArrayBigUint64ArrayBufferDv0064
     * @tc.desc 验证BigUint64Array的迭代器在数组长度变化时的行为
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const iterator = arr[Symbol.iterator]();
      expect(iterator.next().value.toString()).assertEqual('1');
      const newArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let errorThrown = false;
      try {
        arr.set(newArr);
      } catch (e) {
        errorThrown = (e instanceof RangeError);
      }
      expect(errorThrown).assertEqual(true);
      expect(iterator.next().value.toString()).assertEqual('2');
      expect(iterator.next().value.toString()).assertEqual('3');
      expect(iterator.next().value).assertEqual(undefined);
      expect(iterator.next().value).assertEqual(undefined);
      expect(iterator.next().done).assertEqual(true);

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0065
     * @tc.name TypeArrayBigUint64ArrayBufferDv0065
     * @tc.desc 验证BigUint64Array的includes方法对NaN的处理
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(16);
      const uintArr = new BigUint64Array(buf);
      const dv = new DataView(buf);
      dv.setFloat64(0, NaN, true);
      dv.setFloat64(8, 123, true);
      expect(uintArr.includes(uintArr[0])).assertEqual(true);
      expect(uintArr.includes(uintArr[1])).assertEqual(true);
      expect(uintArr.includes(0n)).assertEqual(false);
      expect(uintArr.length).assertEqual(2);

    })


    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0069
     * @tc.name TypeArrayBigUint64ArrayBufferDv0069
     * @tc.desc 验证BigUint64Array与SharedArrayBuffer的原子操作
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const arr = new BigUint64Array(sab);
      arr[0] = 10n;
      let value = Atomics.load(arr, 0);
      expect(value.toString()).assertEqual('10');
      Atomics.store(arr, 0, 20n);
      expect(arr[0].toString()).assertEqual('20');
      const oldValue = Atomics.exchange(arr, 0, 30n);
      expect(oldValue.toString()).assertEqual('20');
      expect(arr[0].toString()).assertEqual('30');
      expect(arr.length).assertEqual(1);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0070
     * @tc.name TypeArrayBigUint64ArrayBufferDv0070
     * @tc.desc 验证BigUint64Array的forEach方法对稀疏数组的处理
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array(5);
      arr[0] = 1n;
      arr[2] = 3n;
      arr[4] = 5n;
      const visited: number[] = [];
      arr.forEach((_val, index) => {
        visited.push(index);
      });
      expect(visited.toString()).assertEqual('0,1,2,3,4');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(5n);

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0071
     * @tc.name TypeArrayBigUint64ArrayBufferDv0071
     * @tc.desc 验证BigUint64Array的reduceRight方法在中途修改数组的行为
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n, 4n]);
      const sum = arr.reduceRight((acc, val, index) => {
        if (index === 3) {
          arr[0] = 10n;
        }
        return acc + val;
      }, 0n);
      expect(sum.toString()).assertEqual('19');
      expect(arr.toString()).assertEqual('10,2,3,4');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0073
     * @tc.name TypeArrayBigUint64ArrayBufferDv0073
     * @tc.desc 验证BigUint64Array的indexOf方法对重复值的处理
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([5n, 3n, 5n, 7n, 5n, 9n]);
      expect(arr.indexOf(5n)).assertEqual(0);
      expect(arr.indexOf(5n, 1)).assertEqual(2);
      expect(arr.indexOf(5n, 3)).assertEqual(4);
      expect(arr.indexOf(5n, 5)).assertEqual(-1);
      expect(arr.length).assertEqual(6);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0074
     * @tc.name TypeArrayBigUint64ArrayBufferDv0074
     * @tc.desc 验证BigUint64Array的lastIndexOf方法对重复值的处理
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([5n, 3n, 5n, 7n, 5n, 9n]);
      expect(arr.lastIndexOf(5n)).assertEqual(4);
      expect(arr.lastIndexOf(5n, 3)).assertEqual(2);
      expect(arr.lastIndexOf(5n, 1)).assertEqual(0);
      expect(arr.lastIndexOf(5n, -3)).assertEqual(2);
      expect(arr.length).assertEqual(6);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0076
     * @tc.name TypeArrayBigUint64ArrayBufferDv0076
     * @tc.desc 验证BigUint64Array的find方法对重复值的处理
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([10n, 20n, 10n, 30n, 10n]);
      const result = arr.find(val => val > 15n);
      expect(result?.toString()).assertEqual('20');
      const firstTen = arr.find(val => val === 10n);
      expect(firstTen?.toString()).assertEqual('10');

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0077
     * @tc.name TypeArrayBigUint64ArrayBufferDv0077
     * @tc.desc 验证BigUint64Array的findIndex方法对重复值的处理
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('TypeArrayBigUint64ArrayBufferDv0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new BigUint64Array([10n, 20n, 10n, 30n, 10n]);
      const index = arr.findIndex(val => val > 15n);
      expect(index).assertEqual(1);
      let lastTenIndex = -1;
      arr.findIndex((val, i) => {
        if (val === 10n) {
          lastTenIndex = i;
        }
        return false;
      });
      expect(lastTenIndex).assertEqual(4);

    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0078
     * @tc.name TypeArrayBigUint64ArrayBufferDv0078
     * @tc.desc 验证BigUint64Array与ArrayBuffer的slice方法交互
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const original = new BigUint64Array([1n, 2n, 3n, 4n]);
      const bufferSlice = original.buffer.slice(8, 24);
      const slicedArr = new BigUint64Array(bufferSlice);
      expect(slicedArr.toString()).assertEqual('2,3');
      slicedArr[0] = 20n;
      expect(original.toString()).assertEqual('1,2,3,4');
      expect(original.length).assertEqual(4);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0079
     * @tc.name TypeArrayBigUint64ArrayBufferDv0079
     * @tc.desc 验证BigUint64Array的keys迭代器在数组修改后的行为
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const keys = Array.from(arr.keys());
      arr[1] = 20n;
      expect(keys.toString()).assertEqual('0,1,2');
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(1);
      expect(keys[2]).assertEqual(2);
    })

    /**
     * @tc.number SUB_BUILDINS_TYPEARRAY_BIGUINT64ARRAY_BUFFER_DV_0080
     * @tc.name TypeArrayBigUint64ArrayBufferDv0080
     * @tc.desc 验证BigUint64Array的entries迭代器在数组修改后的行为
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('TypeArrayBigUint64ArrayBufferDv0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = new BigUint64Array([1n, 2n, 3n]);
      const entries = Array.from(arr.entries());
      arr[1] = 20n;
      expect(entries.toString()).assertEqual('0,1,1,2,2,3');
      expect(entries.length).assertEqual(3);

    })

   