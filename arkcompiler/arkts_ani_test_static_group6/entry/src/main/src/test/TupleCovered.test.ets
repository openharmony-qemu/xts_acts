'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function extendedTestsPart6(): void {

  describe("ActsExtendedTestsPart6", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETNUMBEROFITEMS_MULTITHREAD_0100
     * @tc.name      test_Tuple_GetNumberOfItems_MultiThread
     * @tc.desc      Verify test_Tuple_GetNumberOfItems_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetNumberOfItems_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetNumberOfItems_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETNUMBEROFITEMS_ABNORMAL_0200
     * @tc.name      test_Tuple_GetNumberOfItems_Abnormal
     * @tc.desc      Verify test_Tuple_GetNumberOfItems_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetNumberOfItems_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetNumberOfItems_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_BOOLEAN_MULTITHREAD_0300
     * @tc.name      test_Tuple_GetItem_Boolean_MultiThread
     * @tc.desc      Verify test_Tuple_GetItem_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_BOOLEAN_ABNORMAL_0400
     * @tc.name      test_Tuple_GetItem_Boolean_Abnormal
     * @tc.desc      Verify test_Tuple_GetItem_Boolean_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Boolean_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Boolean_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_BOOLEAN_BOUNDARY_INDEXZERO_0500
     * @tc.name      test_Tuple_GetItem_Boolean_Boundary_IndexZero
     * @tc.desc      Verify test_Tuple_GetItem_Boolean_Boundary_IndexZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Boolean_Boundary_IndexZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Boolean_Boundary_IndexZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_BOOLEAN_BOUNDARY_OUTOFRANGE_0600
     * @tc.name      test_Tuple_GetItem_Boolean_Boundary_OutOfRange
     * @tc.desc      Verify test_Tuple_GetItem_Boolean_Boundary_OutOfRange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Boolean_Boundary_OutOfRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Boolean_Boundary_OutOfRange();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_CHAR_MULTITHREAD_0700
     * @tc.name      test_Tuple_GetItem_Char_MultiThread
     * @tc.desc      Verify test_Tuple_GetItem_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_CHAR_ABNORMAL_0800
     * @tc.name      test_Tuple_GetItem_Char_Abnormal
     * @tc.desc      Verify test_Tuple_GetItem_Char_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Char_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Char_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_CHAR_BOUNDARY_INDEXZERO_0900
     * @tc.name      test_Tuple_GetItem_Char_Boundary_IndexZero
     * @tc.desc      Verify test_Tuple_GetItem_Char_Boundary_IndexZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Char_Boundary_IndexZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Char_Boundary_IndexZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_CHAR_BOUNDARY_OUTOFRANGE_1000
     * @tc.name      test_Tuple_GetItem_Char_Boundary_OutOfRange
     * @tc.desc      Verify test_Tuple_GetItem_Char_Boundary_OutOfRange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Char_Boundary_OutOfRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Char_Boundary_OutOfRange();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_BYTE_MULTITHREAD_1100
     * @tc.name      test_Tuple_GetItem_Byte_MultiThread
     * @tc.desc      Verify test_Tuple_GetItem_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_BYTE_ABNORMAL_1200
     * @tc.name      test_Tuple_GetItem_Byte_Abnormal
     * @tc.desc      Verify test_Tuple_GetItem_Byte_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Byte_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Byte_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_BYTE_BOUNDARY_INDEXZERO_1300
     * @tc.name      test_Tuple_GetItem_Byte_Boundary_IndexZero
     * @tc.desc      Verify test_Tuple_GetItem_Byte_Boundary_IndexZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Byte_Boundary_IndexZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Byte_Boundary_IndexZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_BYTE_BOUNDARY_OUTOFRANGE_1400
     * @tc.name      test_Tuple_GetItem_Byte_Boundary_OutOfRange
     * @tc.desc      Verify test_Tuple_GetItem_Byte_Boundary_OutOfRange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Byte_Boundary_OutOfRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Byte_Boundary_OutOfRange();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_SHORT_MULTITHREAD_1500
     * @tc.name      test_Tuple_GetItem_Short_MultiThread
     * @tc.desc      Verify test_Tuple_GetItem_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_SHORT_ABNORMAL_1600
     * @tc.name      test_Tuple_GetItem_Short_Abnormal
     * @tc.desc      Verify test_Tuple_GetItem_Short_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Short_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Short_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_SHORT_BOUNDARY_INDEXZERO_1700
     * @tc.name      test_Tuple_GetItem_Short_Boundary_IndexZero
     * @tc.desc      Verify test_Tuple_GetItem_Short_Boundary_IndexZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Short_Boundary_IndexZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Short_Boundary_IndexZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_SHORT_BOUNDARY_OUTOFRANGE_1800
     * @tc.name      test_Tuple_GetItem_Short_Boundary_OutOfRange
     * @tc.desc      Verify test_Tuple_GetItem_Short_Boundary_OutOfRange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Short_Boundary_OutOfRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Short_Boundary_OutOfRange();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_INT_MULTITHREAD_1900
     * @tc.name      test_Tuple_GetItem_Int_MultiThread
     * @tc.desc      Verify test_Tuple_GetItem_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_INT_ABNORMAL_2000
     * @tc.name      test_Tuple_GetItem_Int_Abnormal
     * @tc.desc      Verify test_Tuple_GetItem_Int_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Int_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Int_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_INT_BOUNDARY_INDEXZERO_2100
     * @tc.name      test_Tuple_GetItem_Int_Boundary_IndexZero
     * @tc.desc      Verify test_Tuple_GetItem_Int_Boundary_IndexZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Int_Boundary_IndexZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Int_Boundary_IndexZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_INT_BOUNDARY_OUTOFRANGE_2200
     * @tc.name      test_Tuple_GetItem_Int_Boundary_OutOfRange
     * @tc.desc      Verify test_Tuple_GetItem_Int_Boundary_OutOfRange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Int_Boundary_OutOfRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Int_Boundary_OutOfRange();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_LONG_MULTITHREAD_2300
     * @tc.name      test_Tuple_GetItem_Long_MultiThread
     * @tc.desc      Verify test_Tuple_GetItem_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_LONG_ABNORMAL_2400
     * @tc.name      test_Tuple_GetItem_Long_Abnormal
     * @tc.desc      Verify test_Tuple_GetItem_Long_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Long_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Long_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_LONG_BOUNDARY_INDEXZERO_2500
     * @tc.name      test_Tuple_GetItem_Long_Boundary_IndexZero
     * @tc.desc      Verify test_Tuple_GetItem_Long_Boundary_IndexZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Long_Boundary_IndexZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Long_Boundary_IndexZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_LONG_BOUNDARY_OUTOFRANGE_2600
     * @tc.name      test_Tuple_GetItem_Long_Boundary_OutOfRange
     * @tc.desc      Verify test_Tuple_GetItem_Long_Boundary_OutOfRange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Long_Boundary_OutOfRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Long_Boundary_OutOfRange();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_FLOAT_MULTITHREAD_2700
     * @tc.name      test_Tuple_GetItem_Float_MultiThread
     * @tc.desc      Verify test_Tuple_GetItem_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_FLOAT_ABNORMAL_2800
     * @tc.name      test_Tuple_GetItem_Float_Abnormal
     * @tc.desc      Verify test_Tuple_GetItem_Float_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Float_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Float_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_FLOAT_BOUNDARY_INDEXZERO_2900
     * @tc.name      test_Tuple_GetItem_Float_Boundary_IndexZero
     * @tc.desc      Verify test_Tuple_GetItem_Float_Boundary_IndexZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Float_Boundary_IndexZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Float_Boundary_IndexZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_FLOAT_BOUNDARY_OUTOFRANGE_3000
     * @tc.name      test_Tuple_GetItem_Float_Boundary_OutOfRange
     * @tc.desc      Verify test_Tuple_GetItem_Float_Boundary_OutOfRange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Float_Boundary_OutOfRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Float_Boundary_OutOfRange();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_DOUBLE_MULTITHREAD_3100
     * @tc.name      test_Tuple_GetItem_Double_MultiThread
     * @tc.desc      Verify test_Tuple_GetItem_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_DOUBLE_ABNORMAL_3200
     * @tc.name      test_Tuple_GetItem_Double_Abnormal
     * @tc.desc      Verify test_Tuple_GetItem_Double_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Double_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Double_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_DOUBLE_BOUNDARY_INDEXZERO_3300
     * @tc.name      test_Tuple_GetItem_Double_Boundary_IndexZero
     * @tc.desc      Verify test_Tuple_GetItem_Double_Boundary_IndexZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Double_Boundary_IndexZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Double_Boundary_IndexZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_DOUBLE_BOUNDARY_OUTOFRANGE_3400
     * @tc.name      test_Tuple_GetItem_Double_Boundary_OutOfRange
     * @tc.desc      Verify test_Tuple_GetItem_Double_Boundary_OutOfRange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Double_Boundary_OutOfRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Double_Boundary_OutOfRange();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_REF_MULTITHREAD_3500
     * @tc.name      test_Tuple_GetItem_Ref_MultiThread
     * @tc.desc      Verify test_Tuple_GetItem_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_REF_ABNORMAL_3600
     * @tc.name      test_Tuple_GetItem_Ref_Abnormal
     * @tc.desc      Verify test_Tuple_GetItem_Ref_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Ref_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Ref_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_REF_BOUNDARY_INDEXZERO_3700
     * @tc.name      test_Tuple_GetItem_Ref_Boundary_IndexZero
     * @tc.desc      Verify test_Tuple_GetItem_Ref_Boundary_IndexZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Ref_Boundary_IndexZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Ref_Boundary_IndexZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_REF_BOUNDARY_OUTOFRANGE_3800
     * @tc.name      test_Tuple_GetItem_Ref_Boundary_OutOfRange
     * @tc.desc      Verify test_Tuple_GetItem_Ref_Boundary_OutOfRange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Ref_Boundary_OutOfRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Ref_Boundary_OutOfRange();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_BOOLEAN_MULTITHREAD_3900
     * @tc.name      test_Tuple_SetItem_Boolean_MultiThread
     * @tc.desc      Verify test_Tuple_SetItem_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_BOOLEAN_ABNORMAL_4000
     * @tc.name      test_Tuple_SetItem_Boolean_Abnormal
     * @tc.desc      Verify test_Tuple_SetItem_Boolean_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Boolean_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Boolean_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_CHAR_MULTITHREAD_4100
     * @tc.name      test_Tuple_SetItem_Char_MultiThread
     * @tc.desc      Verify test_Tuple_SetItem_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_CHAR_ABNORMAL_4200
     * @tc.name      test_Tuple_SetItem_Char_Abnormal
     * @tc.desc      Verify test_Tuple_SetItem_Char_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Char_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Char_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_BYTE_MULTITHREAD_4300
     * @tc.name      test_Tuple_SetItem_Byte_MultiThread
     * @tc.desc      Verify test_Tuple_SetItem_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_BYTE_ABNORMAL_4400
     * @tc.name      test_Tuple_SetItem_Byte_Abnormal
     * @tc.desc      Verify test_Tuple_SetItem_Byte_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Byte_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Byte_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_SHORT_MULTITHREAD_4500
     * @tc.name      test_Tuple_SetItem_Short_MultiThread
     * @tc.desc      Verify test_Tuple_SetItem_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_SHORT_ABNORMAL_4600
     * @tc.name      test_Tuple_SetItem_Short_Abnormal
     * @tc.desc      Verify test_Tuple_SetItem_Short_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Short_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Short_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_INT_MULTITHREAD_4700
     * @tc.name      test_Tuple_SetItem_Int_MultiThread
     * @tc.desc      Verify test_Tuple_SetItem_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_INT_ABNORMAL_4800
     * @tc.name      test_Tuple_SetItem_Int_Abnormal
     * @tc.desc      Verify test_Tuple_SetItem_Int_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Int_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Int_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_LONG_MULTITHREAD_4900
     * @tc.name      test_Tuple_SetItem_Long_MultiThread
     * @tc.desc      Verify test_Tuple_SetItem_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_LONG_ABNORMAL_5000
     * @tc.name      test_Tuple_SetItem_Long_Abnormal
     * @tc.desc      Verify test_Tuple_SetItem_Long_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Long_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Long_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_FLOAT_MULTITHREAD_5100
     * @tc.name      test_Tuple_SetItem_Float_MultiThread
     * @tc.desc      Verify test_Tuple_SetItem_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_FLOAT_ABNORMAL_5200
     * @tc.name      test_Tuple_SetItem_Float_Abnormal
     * @tc.desc      Verify test_Tuple_SetItem_Float_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Float_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Float_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_DOUBLE_MULTITHREAD_5300
     * @tc.name      test_Tuple_SetItem_Double_MultiThread
     * @tc.desc      Verify test_Tuple_SetItem_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_DOUBLE_ABNORMAL_5400
     * @tc.name      test_Tuple_SetItem_Double_Abnormal
     * @tc.desc      Verify test_Tuple_SetItem_Double_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Double_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Double_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_REF_MULTITHREAD_5500
     * @tc.name      test_Tuple_SetItem_Ref_MultiThread
     * @tc.desc      Verify test_Tuple_SetItem_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_SETITEM_REF_ABNORMAL_5600
     * @tc.name      test_Tuple_SetItem_Ref_Abnormal
     * @tc.desc      Verify test_Tuple_SetItem_Ref_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_SetItem_Ref_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_SetItem_Ref_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_COMBO_5700
     * @tc.name      test_Tuple_Combo
     * @tc.desc      Verify test_Tuple_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_Combo();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_BOUNDARY_NEGATIVEINDEX_5800
     * @tc.name      test_Tuple_Boundary_NegativeIndex
     * @tc.desc      Verify test_Tuple_Boundary_NegativeIndex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_Boundary_NegativeIndex", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_Boundary_NegativeIndex();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_BOUNDARY_ALLGETTYPEPOINTERS_5900
     * @tc.name      test_Tuple_Boundary_AllGetTypePointers
     * @tc.desc      Verify test_Tuple_Boundary_AllGetTypePointers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_Boundary_AllGetTypePointers", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_Boundary_AllGetTypePointers();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_BOUNDARY_ALLSETTYPEPOINTERS_6000
     * @tc.name      test_Tuple_Boundary_AllSetTypePointers
     * @tc.desc      Verify test_Tuple_Boundary_AllSetTypePointers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_Boundary_AllSetTypePointers", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_Boundary_AllSetTypePointers();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETNUMBEROFITEMS_BOUNDARY_ZEROITEMS_6100
     * @tc.name      test_Tuple_GetNumberOfItems_Boundary_ZeroItems
     * @tc.desc      Verify test_Tuple_GetNumberOfItems_Boundary_ZeroItems
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetNumberOfItems_Boundary_ZeroItems", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetNumberOfItems_Boundary_ZeroItems();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TUPLE_GETITEM_BOUNDARY_ALLTYPESROUNDTRIP_6200
     * @tc.name      test_Tuple_GetItem_Boundary_AllTypesRoundTrip
     * @tc.desc      Verify test_Tuple_GetItem_Boundary_AllTypesRoundTrip
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Tuple_GetItem_Boundary_AllTypesRoundTrip", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Tuple_GetItem_Boundary_AllTypesRoundTrip();
      expect(result).assertEqual(1);
      done();
    });
  })
}
