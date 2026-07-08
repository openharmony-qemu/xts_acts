'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-binary/src/main/indexStatic";
import { Foo } from '../ets/Index';

export default function TcArrayTest(): void {
  describe("TcArrayTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_ARRAY_TEST_0100
     * @tc.name testTcArray0001
     * @tc.desc Verify that Array_New creates an empty array and Array_GetLength returns zero.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let array = cls.test_ArrayCreateEmpty();
      expect(cls.test_ArrayGetLength(array)).assertEqual(0);
      expect(array.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_0200
     * @tc.name testTcArray0002
     * @tc.desc Verify that Array_Set and Array_Get can write and read boxed integer elements.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let array = cls.test_ArrayCreateAndSetGet();
      expect(cls.test_ArrayCheckIntElements(array)).assertTrue();
      expect(array.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_0300
     * @tc.name testTcArray0003
     * @tc.desc Verify that Array_Push appends double values and grows array length.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let array = cls.test_ArrayPushDouble();
      expect(array.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_0400
     * @tc.name testTcArray0004
     * @tc.desc Verify that Array_Pop removes and returns the last element.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayPop()).assertEqual(300);
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_0500
     * @tc.name testTcArray0005
     * @tc.desc Verify that Array_Pop on an empty array returns undefined.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayPopEmptyIsUndefined()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_0600
     * @tc.name testTcArray0006
     * @tc.desc Verify that array elements can store mixed boxed and reference values.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let array = cls.test_ArrayMixedTypes();
      expect(array.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_0900
     * @tc.name testTcArray0009
     * @tc.desc Verify that Array_New fills elements with the specified undefined initial value.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayNewWithUndefined()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_1000
     * @tc.name testTcArray0010
     * @tc.desc Verify double precision when boxed double values are stored in an array.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let sum = cls.test_ArrayDoublePrecisionSum();
      expect(Math.abs(sum - 0.6) < 0.000001).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_1100
     * @tc.name testTcArray0011
     * @tc.desc Verify that Array_Set modifies an element and ArkTS can observe the updated array.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let array = cls.test_ArrayCreateAndSetGet();
      expect(cls.test_ArrayModifyIndexOne(array)).assertTrue();
      expect(array.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_1200
     * @tc.name testTcArray0012
     * @tc.desc Verify mixed Array_Push and Array_Pop operations.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayPushPopMixed()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_1300
     * @tc.name testTcArray0013
     * @tc.desc Verify pushing many elements keeps the final array length correct.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayPushMany(10000)).assertEqual(10000);
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_1400
     * @tc.name testTcArray0014
     * @tc.desc Verify that Array_New with an invalid length reports an error.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayNewInvalidLength()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_1700
     * @tc.name testTcArray0017
     * @tc.desc Verify that array elements can store null and undefined and native code can distinguish them.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayNullAndUndefined()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_1800
     * @tc.name testTcArray0018
     * @tc.desc Verify traversing all array elements with Array_GetLength and Array_Get.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ArrayTraverseSum()).assertEqual(55);
    });

    /**
     * @tc.number SUB_TC_ARRAY_TEST_2000
     * @tc.name testTcArray0020
     * @tc.desc Verify native creation and access of a multidimensional array.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcArray0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let matrix = cls.test_ArrayCreateMatrix();
      expect(cls.test_ArrayCheckMatrix(matrix)).assertTrue();
    });
  });
}
