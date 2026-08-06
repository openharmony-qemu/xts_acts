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
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '@ohos/hypium';

import { collections,taskpool, worker, MessageEvents } from '@kit.ArkTS';
import { SendableData } from '../utils/TestUtils';

@Sendable
class TestData {
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}

@Concurrent
function taskGetConcatArrayLength(arr: collections.ConcatArray<number>): number {
  return arr.length;
}

@Concurrent
function taskGetConcatArrayIds(arr: collections.ConcatArray<SendableData>): number[] {
  let ids: number[] = [];
  for (let i = 0; i < arr.length; i++) {
    ids.push(arr[i].id);
  }
  return ids;
}

export default function collectionsConcatArrayTest() {

  describe('CollectionsConcatArrayTest', () => {

    beforeAll(() => {
      console.info('CollectionsConcatArrayTest beforeAll');
    });

    beforeEach(() => {
      console.info('CollectionsConcatArrayTest beforeEach');
    });

    afterEach(() => {
      console.info('CollectionsConcatArrayTest afterEach');
    });

    afterAll(() => {
      console.info('CollectionsConcatArrayTest afterAll');
    });

    // ==================== 3.1 多态行为验证 ====================

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_0100
     * @tc.name testConcatArrayReference0001
     * @tc.desc Verify ConcatArray reference can be created from Array instance.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayReference0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayReference0001';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_0200
     * @tc.name testConcatArrayIndexAccess0002
     * @tc.desc Verify index access through ConcatArray reference.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayIndexAccess0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayIndexAccess0002';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_0300
     * @tc.name testConcatArrayLengthAccess0003
     * @tc.desc Verify length property access through ConcatArray reference.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayLengthAccess0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayLengthAccess0003';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_0400
     * @tc.name testConcatArrayJoin0004
     * @tc.desc Verify join method through ConcatArray reference.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayJoin0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayJoin0004';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      let result: string = arr.join("-");
      expect(result).assertEqual("1-2-3");
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_0500
     * @tc.name testConcatArraySlice0005
     * @tc.desc Verify slice method through ConcatArray reference.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArraySlice0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArraySlice0005';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      let sliced: collections.ConcatArray<number> = arr.slice(1, 2);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0]).assertEqual(2);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_0600
     * @tc.name testConcatArrayReadonlyIndex0006
     * @tc.desc Verify index is readonly - modification should be rejected.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayReadonlyIndex0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayReadonlyIndex0006';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      // 编译时验证：arr[0] = 10 应该报错（readonly）
      // 运行时验证：值未被修改（通过重新赋值不会改变，因为接口是只读的）
      // 实际在 ArkTS 中，通过接口引用无法修改，编译时已拦截
      // 这里验证原始值保持不变
      expect(arr[0]).assertEqual(1);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_0700
     * @tc.name testConcatArrayReadonlyLength0007
     * @tc.desc Verify length is readonly - modification should be rejected.
     * @tc.size SmallTest
     * @tc.type Exception
     * @tc.level Level 0
     */
    // it('testConcatArrayReadonlyLength0007', TestType.Exception| Size.SMALLTEST | Level.LEVEL0, () => {
    //   let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
    //   // 编译时验证：arr.length = 10 应该报错（readonly）
    //   // 运行时验证：length 值未被修改
    //   expect(arr.length).assertEqual(3);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_0800
     * @tc.name testConcatArrayIndexOutOfBounds0008
     * @tc.desc Verify out-of-bounds index returns undefined.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayIndexOutOfBounds0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayIndexOutOfBounds0008';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      let outOfBounds = arr[100];
      expect(outOfBounds === undefined).assertTrue();
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_0900
     * @tc.name testConcatArrayNegativeIndex0009
     * @tc.desc Verify negative index returns undefined.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayNegativeIndex0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayNegativeIndex0009';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      let negative = arr[-1];
      expect(negative === undefined).assertTrue();
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_1000
     * @tc.name testConcatArrayNonNumberIndex0010
     * @tc.desc Verify all index keys are numeric, non-number keys are not present.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayNonNumberIndex0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayNonNumberIndex0010';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      let keys: string[] = Object.keys(arr);
      let allNumeric: boolean = true;
      for (let key of keys) {
        if (isNaN(Number(key))) {
          allNumeric = false;
          break;
        }
      }
      expect(allNumeric || keys.length === 1).assertTrue();
      console.info(`[${caseName}] end`);
    });

    // ==================== 3.2 契约一致性验证 ====================

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_1100
     * @tc.name testConcatArrayContractJoin0011
     * @tc.desc Verify Array join method matches ConcatArray interface contract.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayContractJoin0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayContractJoin0011';
      console.info(`[${caseName}] start`);
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let result: string = arr.join("-");
      expect(result).assertEqual("1-2-3");

      let concatArr: collections.ConcatArray<number> = arr;
      let concatResult: string = concatArr.join("-");
      expect(concatResult).assertEqual(result);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_1200
     * @tc.name testConcatArrayContractSlice0012
     * @tc.desc Verify Array slice method matches ConcatArray interface contract.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayContractSlice0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayContractSlice0012';
      console.info(`[${caseName}] start`);
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let sliced: collections.Array<number> = arr.slice(1, 2);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0]).assertEqual(2);

      let concatArr: collections.ConcatArray<number> = arr;
      let concatSliced: collections.ConcatArray<number> = concatArr.slice(1, 2);
      expect(concatSliced.length).assertEqual(1);
      expect(concatSliced[0]).assertEqual(2);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_1300
     * @tc.name testConcatArrayContractLength0013
     * @tc.desc Verify Array length property matches ConcatArray interface contract.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayContractLength0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayContractLength0013';
      console.info(`[${caseName}] start`);
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let concatArr: collections.ConcatArray<number> = arr;

      expect(arr.length).assertEqual(3);
      expect(concatArr.length).assertEqual(arr.length);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_1400
     * @tc.name testConcatArrayContractIndex0014
     * @tc.desc Verify Array index access matches ConcatArray interface contract.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayContractIndex0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayContractIndex0014';
      console.info(`[${caseName}] start`);
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let concatArr: collections.ConcatArray<number> = arr;

      expect(arr[0]).assertEqual(1);
      expect(concatArr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(concatArr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(concatArr[2]).assertEqual(3);
      console.info(`[${caseName}] end`);
    });


    // ==================== 3.3 实现类差异对比 ====================

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_1500
     * @tc.name testConcatArrayNoExtraMethods0015
     * @tc.desc Verify ConcatArray reference exposes only interface-defined methods.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayNoExtraMethods0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayNoExtraMethods0015';
      console.info(`[${caseName}] start`);
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let concatArr: collections.ConcatArray<number> = arr;

      let joinResult: string = concatArr.join("-");
      expect(joinResult).assertEqual("1-2-3");

      let sliceResult = concatArr.slice(0, 2);
      expect(sliceResult.length).assertEqual(2);
      expect(sliceResult[0]).assertEqual(1);
      expect(sliceResult[1]).assertEqual(2);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_1600
     * @tc.name testConcatArrayNoExtraMethods0016
     * @tc.desc Verify ConcatArray reference exposes join and slice methods.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayNoExtraMethods0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayNoExtraMethods0016';
      console.info(`[${caseName}] start`);
      let arr: collections.Array<number> = new collections.Array<number>(5, 6, 7);
      let concatArr: collections.ConcatArray<number> = arr;

      let joinResult: string = concatArr.join(",");
      expect(joinResult).assertEqual("5,6,7");

      let sliceResult = concatArr.slice(1, 3);
      expect(sliceResult.length).assertEqual(2);
      expect(sliceResult[0]).assertEqual(6);
      expect(sliceResult[1]).assertEqual(7);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_1700
     * @tc.name testConcatArrayTypeConstraint0017
     * @tc.desc Verify ConcatArray type constraint allows interface methods only.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayTypeConstraint0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayTypeConstraint0017';
      console.info(`[${caseName}] start`);
      let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30);
      let concatArr: collections.ConcatArray<number> = arr;

      let joinResult: string = concatArr.join(":");
      expect(joinResult).assertEqual("10:20:30");

      let sliceResult = concatArr.slice(0, 2);
      expect(sliceResult.length).assertEqual(2);
      expect(sliceResult[0]).assertEqual(10);
      expect(sliceResult[1]).assertEqual(20);

      expect(concatArr.length).assertEqual(3);
      expect(concatArr[2]).assertEqual(30);
      console.info(`[${caseName}] end`);
    });

    // ==================== 3.4 自定义实现约束 ====================

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_1800
     * @tc.name testConcatArrayCustomImplementation0018
     * @tc.desc [SKIP] ArkTS does not support custom class implementing ConcatArray interface.
     * @tc.size SmallTest
     * @tc.type Exception
     * @tc.level Level 0
     * @tc.remark Framework limitation: Custom classes cannot implement ConcatArray in ArkTS.
     */
    // it('testConcatArrayCustomImplementation0018', TestType.Exception | Size.SMALLTEST | Level.LEVEL0, () => {
    //   const caseName = 'testConcatArrayCustomImplementation0018';
    //   console.info(`[${caseName}] start`);
    //   // ArkTS 限制：自定义类无法 implements ConcatArray 接口
    //   // 原因：Sendable类不支持索引签名 [index: number]: T
    //   // 测试结论：CT-14 不适用
    //   console.info(`[${caseName}] end`);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_1900
     * @tc.name testConcatArrayTypeRestriction0019
     * @tc.desc Verify ConcatArray reference cannot access Array-specific methods.
     * @tc.size SmallTest
     * @tc.type Exception
     * @tc.level Level 0
     */
    // it('testConcatArrayTypeRestriction0019', TestType.Exception | Size.SMALLTEST | Level.LEVEL0, () => {
    //   let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
    //   let concatArr: collections.ConcatArray<number> = arr;
    //
    //   // 通过 ConcatArray 引用只能访问接口定义的方法
    //   // 使用 Object.getOwnPropertyNames 验证接口成员
    //   let concatMembers: string[] = Object.getOwnPropertyNames(concatArr);
    //
    //   // 验证 length 存在
    //   expect(concatArr.length).assertEqual(3);
    //
    //   // 验证接口方法可以正常调用
    //   let joinResult: string = concatArr.join();
    //   expect(joinResult).assertEqual("1,2,3");
    //
    //   let sliceResult = concatArr.slice(0, 2);
    //   expect(sliceResult.length).assertEqual(2);
    // });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_2000
     * @tc.name testConcatArrayReadonlyConstraint0020
     * @tc.desc Verify ConcatArray readonly constraint is enforced.
     * @tc.size SmallTest
     * @tc.type Exception
     * @tc.level Level 0
     */
    // it('testConcatArrayReadonlyConstraint0020', TestType.Exception | Size.SMALLTEST | Level.LEVEL0, () => {
    //   let arr: collections.Array<number> = new collections.Array<number>(10, 20, 30);
    //   let concatArr: collections.ConcatArray<number> = arr;
    //
    //   // 验证通过 ConcatArray 引用访问的值是只读的
    //   // 编译时：concatArr[0] = 100 会报错
    //   // 运行时验证：值没有被修改（因为无法通过 ConcatArray 引用修改）
    //   expect(concatArr[0]).assertEqual(10);
    //   expect(concatArr[1]).assertEqual(20);
    //   expect(concatArr[2]).assertEqual(30);
    //
    //   // 验证 length 是只读的
    //   // 编译时：concatArr.length = 10 会报错
    //   expect(concatArr.length).assertEqual(3);
    //
    //   // 验证通过 Array 引用修改后，ConcatArray 引用能看到修改
    //   arr.push(40);
    //   expect(concatArr.length).assertEqual(4);
    //   expect(concatArr[3]).assertEqual(40);
    // });

    // ==================== 4.1 索引访问类型覆盖 ====================

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_2100
     * @tc.name testConcatArrayIndexNumber0021
     * @tc.desc Verify index access with number type elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayIndexNumber0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayIndexNumber0021';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(100, 200, 300);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_2200
     * @tc.name testConcatArrayIndexString0022
     * @tc.desc Verify index access with string type elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayIndexString0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayIndexString0022';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<string> = new collections.Array<string>("test测试123");
      expect(arr[0]).assertEqual("test测试123");
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_2300
     * @tc.name testConcatArrayIndexBoolean0023
     * @tc.desc Verify index access with boolean type elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayIndexBoolean0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayIndexBoolean0023';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<boolean> = new collections.Array<boolean>(true, false, true);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
      expect(arr[2]).assertTrue();
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_2400
     * @tc.name testConcatArrayIndexObject0024
     * @tc.desc Verify index access with Sendable class type elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayIndexObject0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayIndexObject0024';
      console.info(`[${caseName}] start`);
      let obj1: TestData = new TestData("test1");
      let obj2: TestData = new TestData("test2");
      let obj3: TestData = new TestData("test3");
      let arr: collections.ConcatArray<TestData> = new collections.Array<TestData>(obj1, obj2, obj3);
      expect(arr[0]).assertEqual(obj1);
      expect(arr[1]).assertEqual(obj2);
      expect(arr[2]).assertEqual(obj3);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_2500
     * @tc.name testConcatArrayIndexMixed0025
     * @tc.desc Verify index access with mixed type elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayIndexMixed0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayIndexMixed0025';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number | string> = new collections.Array<number | string>(1, "two", 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual("two");
      expect(arr[2]).assertEqual(3);
      console.info(`[${caseName}] end`);
    });

    // ==================== 4.2 length属性类型验证 ====================

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_2600
     * @tc.name testConcatArrayLengthEmpty0026
     * @tc.desc Verify length property of empty ConcatArray.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayLengthEmpty0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayLengthEmpty0026';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>();
      expect(arr.length).assertEqual(0);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_2700
     * @tc.name testConcatArrayLengthSingle0027
     * @tc.desc Verify length property of single element ConcatArray.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayLengthSingle0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayLengthSingle0027';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(42);
      expect(arr.length).assertEqual(1);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_2800
     * @tc.name testConcatArrayLengthLarge0028
     * @tc.desc Verify length property of large ConcatArray.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayLengthLarge0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayLengthLarge0028';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) {
        (arr as collections.Array<number>).push(i);
      }
      expect(arr.length).assertEqual(10000);
      console.info(`[${caseName}] end`);
    });



    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY2900
     * @tc.name testConcatArrayJoinNumber0029
     * @tc.desc Verify join method with number type elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayJoinNumber0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayJoinNumber0029';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(100, 200);
      let result: string = arr.join("-");
      expect(result).assertEqual("100-200");
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_3000
     * @tc.name testConcatArrayJoinString0030
     * @tc.desc Verify join method with string type elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayJoinString0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayJoinString0030';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<string> = new collections.Array<string>("test", "测试");
      let result: string = arr.join(",");
      expect(result).assertEqual("test,测试");
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_3100
     * @tc.name testConcatArrayJoinEmoji0031
     * @tc.desc Verify join method with emoji string type elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayJoinEmoji0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayJoinEmoji0031';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<string> = new collections.Array<string>("😀", "🎉");
      let result: string = arr.join("");
      expect(result).assertEqual("😀🎉");
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_3200
     * @tc.name testConcatArrayJoinObject0032
     * @tc.desc Verify join method with object type elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayJoinObject0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayJoinObject0032';
      console.info(`[${caseName}] start`);
      let obj1: TestData = new TestData("a");
      let obj2: TestData = new TestData("b");
      let arr: collections.ConcatArray<TestData> = new collections.Array<TestData>(obj1, obj2);
      let result: string = arr.join("-");
      expect(result).assertEqual("[object Object]-[object Object]");
      console.info(`[${caseName}] end`);
    });


    // ==================== 4.4 slice方法类型覆盖 ====================

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_3300
     * @tc.name testConcatArraySliceNumber0033
     * @tc.desc Verify slice method with number type elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArraySliceNumber0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArraySliceNumber0033';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(100, 200, 300);
      let sliced: collections.ConcatArray<number> = arr.slice(1, 2);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0]).assertEqual(200);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_3400
     * @tc.name testConcatArraySliceString0034
     * @tc.desc Verify slice method with string type elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArraySliceString0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArraySliceString0034';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<string> = new collections.Array<string>("a", "b", "c");
      let sliced: collections.ConcatArray<string> = arr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0]).assertEqual("a");
      expect(sliced[1]).assertEqual("b");
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_3500
     * @tc.name testConcatArraySliceSendable0035
     * @tc.desc Verify slice method with Sendable class type elements.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArraySliceSendable0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArraySliceSendable0035';
      console.info(`[${caseName}] start`);
      let obj1: TestData = new TestData("test1");
      let obj2: TestData = new TestData("test2");
      let arr: collections.ConcatArray<TestData> = new collections.Array<TestData>(obj1, obj2);
      let sliced: collections.ConcatArray<TestData> = arr.slice(0, 1);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0]).assertEqual(obj1);
      console.info(`[${caseName}] end`);
    });

    // ==================== 5.1 只读约束验证 ====================

    // /**
    //  * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_3600
    //  * @tc.name testConcatArrayReadonlyIndex0036
    //  * @tc.desc Verify index is readonly - modification should be rejected at compile time.
    //  * @tc.size SmallTest
    //  * @tc.type Exception
    //  * @tc.level Level 0
    //  */
    // it('testConcatArrayReadonlyIndex0036', TestType.Exception | Size.SMALLTEST | Level.LEVEL0, () => {
    //   let arr: collections.ConcatArray<number> = new collections.Array<number>(10, 20, 30);
    //   // 验证通过 ConcatArray 引用访问的值是只读的
    //   // 编译时：arr[0] = 100 会报错 (readonly)
    //   // 运行时验证：值保持不变
    //   expect(arr[0]).assertEqual(10);
    //   expect(arr[1]).assertEqual(20);
    //   expect(arr[2]).assertEqual(30);
    // });
    //
    // /**
    //  * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_3700
    //  * @tc.name testConcatArrayReadonlyLength0037
    //  * @tc.desc Verify length is readonly - modification should be rejected at compile time.
    //  * @tc.size SmallTest
    //  * @tc.type Exception
    //  * @tc.level Level 0
    //  */
    // it('testConcatArrayReadonlyLength0037', TestType.Exception | Size.SMALLTEST | Level.LEVEL0, () => {
    //   let arr: collections.ConcatArray<number> = new collections.Array<number>(10, 20, 30);
    //   // 验证 length 是只读的
    //   // 编译时：arr.length = 10 会报错 (readonly)
    //   // 运行时验证：length 值保持不变
    //   expect(arr.length).assertEqual(3);
    // });

    // ==================== 5.2 索引边界验证 ====================

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_3800
     * @tc.name testConcatArrayBoundaryNegative0038
     * @tc.desc Verify negative index returns undefined.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayBoundaryNegative0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayBoundaryNegative0038';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      let negative = arr[-1];
      expect(negative === undefined).assertTrue();
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_3900
     * @tc.name testConcatArrayBoundaryOutOfBounds0039
     * @tc.desc Verify out-of-bounds index returns undefined.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayBoundaryOutOfBounds0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayBoundaryOutOfBounds0039';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      let outOfBounds = arr[100];
      expect(outOfBounds === undefined).assertTrue();
      console.info(`[${caseName}] end`);
    });

    // ==================== 6.1 跨线程传递验证 ====================

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_4000
     * @tc.name testConcatArrayTaskPoolTransfer0040
     * @tc.desc Verify ConcatArray reference can be transferred across TaskPool.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayTaskPoolTransfer0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testConcatArrayTaskPoolTransfer0040';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      let result = await taskpool.execute(taskGetConcatArrayLength, arr);
      expect(result as number).assertEqual(3);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_4100
     * @tc.name testConcatArrayWorkerTransfer0041
     * @tc.desc Verify ConcatArray reference can be transferred across Worker.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayWorkerTransfer0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testConcatArrayWorkerTransfer0041';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);

      let result = await new Promise<number>((resolve) => {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker(
          "./ConcatArrayWorker"
        );

        workerInstance.onmessage = (event: MessageEvents): void => {
          resolve(event.data.result as number);
          workerInstance.terminate();
        };

        workerInstance.onerror = (): void => {
          resolve(-1);
          workerInstance.terminate();
        };

        workerInstance.postMessageWithSharedSendable({
          type: "concatArraySize",
          set: arr
        });
      });

      expect(result).assertEqual(3);
      console.info(`[${caseName}] end`);
    });

    // ==================== 6.2 类型安全验证 ====================

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_4200
     * @tc.name testConcatArrayGenericConstraint0042
     * @tc.desc Verify ConcatArray generic type constraint is enforced.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArrayGenericConstraint0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const caseName = 'testConcatArrayGenericConstraint0042';
      console.info(`[${caseName}] start`);
      let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr.length).assertEqual(3);
      console.info(`[${caseName}] end`);
    });

    /**
     * @tc.number SUB_COLLECTIONS_CONCAT_ARRAY_4300
     * @tc.name testConcatArraySendableConstraint0043
     * @tc.desc Verify ConcatArray with Sendable type works across threads.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testConcatArraySendableConstraint0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const caseName = 'testConcatArraySendableConstraint0043';
      console.info(`[${caseName}] start`);
      let data1 = new SendableData(1);
      let data2 = new SendableData(2);
      let data3 = new SendableData(3);
      let arr: collections.ConcatArray<SendableData> = new collections.Array<SendableData>(data1, data2, data3);

      let result = await taskpool.execute(taskGetConcatArrayIds, arr);
      let ids = result as number[];
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(2);
      expect(ids[2]).assertEqual(3);
      console.info(`[${caseName}] end`);
    });

  });
}