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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function extendedTestsPart8(): void {

  describe("ActsExtendedTestsPart8", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_NORMAL_0100
     * @tc.name      test_ObjNew_Normal
     * @tc.desc      Verify test_ObjNew_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjNew_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjNew_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_ABNORMAL_NULLCLS_0200
     * @tc.name      test_ObjNew_Abnormal_NullCls
     * @tc.desc      Verify test_ObjNew_Abnormal_NullCls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjNew_Abnormal_NullCls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjNew_Abnormal_NullCls();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_ABNORMAL_NULLCTOR_0300
     * @tc.name      test_ObjNew_Abnormal_NullCtor
     * @tc.desc      Verify test_ObjNew_Abnormal_NullCtor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjNew_Abnormal_NullCtor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjNew_Abnormal_NullCtor();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_MULTITHREAD_0400
     * @tc.name      test_ObjNew_MultiThread
     * @tc.desc      Verify test_ObjNew_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjNew_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjNew_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_V_NORMAL_0500
     * @tc.name      test_ObjNew_V_Normal
     * @tc.desc      Verify test_ObjNew_V_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjNew_V_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjNew_V_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_V_ABNORMAL_0600
     * @tc.name      test_ObjNew_V_Abnormal
     * @tc.desc      Verify test_ObjNew_V_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjNew_V_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjNew_V_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_A_NORMAL_0700
     * @tc.name      test_ObjNew_A_Normal
     * @tc.desc      Verify test_ObjNew_A_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjNew_A_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjNew_A_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_A_ABNORMAL_0800
     * @tc.name      test_ObjNew_A_Abnormal
     * @tc.desc      Verify test_ObjNew_A_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjNew_A_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjNew_A_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETTYPE_NORMAL_0900
     * @tc.name      test_ObjGetType_Normal
     * @tc.desc      Verify test_ObjGetType_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetType_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetType_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETTYPE_ABNORMAL_1000
     * @tc.name      test_ObjGetType_Abnormal
     * @tc.desc      Verify test_ObjGetType_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetType_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetType_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETTYPE_MULTITHREAD_1100
     * @tc.name      test_ObjGetType_MultiThread
     * @tc.desc      Verify test_ObjGetType_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetType_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetType_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETTYPE_COMBO_1200
     * @tc.name      test_ObjGetType_Combo
     * @tc.desc      Verify test_ObjGetType_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetType_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetType_Combo();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJINSTANCEOF_NORMAL_1300
     * @tc.name      test_ObjInstanceOf_Normal
     * @tc.desc      Verify test_ObjInstanceOf_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjInstanceOf_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjInstanceOf_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJINSTANCEOF_ABNORMAL_1400
     * @tc.name      test_ObjInstanceOf_Abnormal
     * @tc.desc      Verify test_ObjInstanceOf_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjInstanceOf_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjInstanceOf_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJINSTANCEOF_MULTITHREAD_1500
     * @tc.name      test_ObjInstanceOf_MultiThread
     * @tc.desc      Verify test_ObjInstanceOf_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjInstanceOf_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjInstanceOf_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJINSTANCEOF_SELFTYPE_1600
     * @tc.name      test_ObjInstanceOf_SelfType
     * @tc.desc      Verify test_ObjInstanceOf_SelfType
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjInstanceOf_SelfType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjInstanceOf_SelfType();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJINSTANCEOF_UNRELATEDTYPE_1700
     * @tc.name      test_ObjInstanceOf_UnrelatedType
     * @tc.desc      Verify test_ObjInstanceOf_UnrelatedType
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjInstanceOf_UnrelatedType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjInstanceOf_UnrelatedType();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJINSTANCEOF_NULLTYPE_1800
     * @tc.name      test_ObjInstanceOf_NullType
     * @tc.desc      Verify test_ObjInstanceOf_NullType
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjInstanceOf_NullType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjInstanceOf_NullType();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_BOOLEAN_NORMAL_1900
     * @tc.name      test_ObjGetField_Boolean_Normal
     * @tc.desc      Verify test_ObjGetField_Boolean_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Boolean_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Boolean_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_BOOLEAN_MULTITHREAD_2000
     * @tc.name      test_ObjGetField_Boolean_MultiThread
     * @tc.desc      Verify test_ObjGetField_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_CHAR_NORMAL_2100
     * @tc.name      test_ObjGetField_Char_Normal
     * @tc.desc      Verify test_ObjGetField_Char_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Char_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Char_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_CHAR_MULTITHREAD_2200
     * @tc.name      test_ObjGetField_Char_MultiThread
     * @tc.desc      Verify test_ObjGetField_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_BYTE_NORMAL_2300
     * @tc.name      test_ObjGetField_Byte_Normal
     * @tc.desc      Verify test_ObjGetField_Byte_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Byte_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Byte_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_BYTE_MULTITHREAD_2400
     * @tc.name      test_ObjGetField_Byte_MultiThread
     * @tc.desc      Verify test_ObjGetField_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_SHORT_NORMAL_2500
     * @tc.name      test_ObjGetField_Short_Normal
     * @tc.desc      Verify test_ObjGetField_Short_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Short_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Short_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_SHORT_MULTITHREAD_2600
     * @tc.name      test_ObjGetField_Short_MultiThread
     * @tc.desc      Verify test_ObjGetField_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_INT_NORMAL_2700
     * @tc.name      test_ObjGetField_Int_Normal
     * @tc.desc      Verify test_ObjGetField_Int_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Int_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Int_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_INT_MULTITHREAD_2800
     * @tc.name      test_ObjGetField_Int_MultiThread
     * @tc.desc      Verify test_ObjGetField_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_LONG_NORMAL_2900
     * @tc.name      test_ObjGetField_Long_Normal
     * @tc.desc      Verify test_ObjGetField_Long_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Long_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Long_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_LONG_MULTITHREAD_3000
     * @tc.name      test_ObjGetField_Long_MultiThread
     * @tc.desc      Verify test_ObjGetField_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_FLOAT_NORMAL_3100
     * @tc.name      test_ObjGetField_Float_Normal
     * @tc.desc      Verify test_ObjGetField_Float_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Float_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Float_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_FLOAT_MULTITHREAD_3200
     * @tc.name      test_ObjGetField_Float_MultiThread
     * @tc.desc      Verify test_ObjGetField_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_DOUBLE_NORMAL_3300
     * @tc.name      test_ObjGetField_Double_Normal
     * @tc.desc      Verify test_ObjGetField_Double_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Double_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Double_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_DOUBLE_MULTITHREAD_3400
     * @tc.name      test_ObjGetField_Double_MultiThread
     * @tc.desc      Verify test_ObjGetField_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_REF_NORMAL_3500
     * @tc.name      test_ObjGetField_Ref_Normal
     * @tc.desc      Verify test_ObjGetField_Ref_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Ref_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Ref_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_REF_MULTITHREAD_3600
     * @tc.name      test_ObjGetField_Ref_MultiThread
     * @tc.desc      Verify test_ObjGetField_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_BOOLEAN_NORMAL_3700
     * @tc.name      test_ObjSetField_Boolean_Normal
     * @tc.desc      Verify test_ObjSetField_Boolean_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Boolean_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Boolean_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_BOOLEAN_MULTITHREAD_3800
     * @tc.name      test_ObjSetField_Boolean_MultiThread
     * @tc.desc      Verify test_ObjSetField_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_CHAR_NORMAL_3900
     * @tc.name      test_ObjSetField_Char_Normal
     * @tc.desc      Verify test_ObjSetField_Char_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Char_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Char_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_CHAR_MULTITHREAD_4000
     * @tc.name      test_ObjSetField_Char_MultiThread
     * @tc.desc      Verify test_ObjSetField_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_BYTE_NORMAL_4100
     * @tc.name      test_ObjSetField_Byte_Normal
     * @tc.desc      Verify test_ObjSetField_Byte_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Byte_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Byte_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_BYTE_MULTITHREAD_4200
     * @tc.name      test_ObjSetField_Byte_MultiThread
     * @tc.desc      Verify test_ObjSetField_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_SHORT_NORMAL_4300
     * @tc.name      test_ObjSetField_Short_Normal
     * @tc.desc      Verify test_ObjSetField_Short_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Short_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Short_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_SHORT_MULTITHREAD_4400
     * @tc.name      test_ObjSetField_Short_MultiThread
     * @tc.desc      Verify test_ObjSetField_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_INT_NORMAL_4500
     * @tc.name      test_ObjSetField_Int_Normal
     * @tc.desc      Verify test_ObjSetField_Int_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Int_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Int_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_INT_MULTITHREAD_4600
     * @tc.name      test_ObjSetField_Int_MultiThread
     * @tc.desc      Verify test_ObjSetField_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_LONG_NORMAL_4700
     * @tc.name      test_ObjSetField_Long_Normal
     * @tc.desc      Verify test_ObjSetField_Long_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Long_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Long_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_LONG_MULTITHREAD_4800
     * @tc.name      test_ObjSetField_Long_MultiThread
     * @tc.desc      Verify test_ObjSetField_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_FLOAT_NORMAL_4900
     * @tc.name      test_ObjSetField_Float_Normal
     * @tc.desc      Verify test_ObjSetField_Float_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Float_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Float_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_FLOAT_MULTITHREAD_5000
     * @tc.name      test_ObjSetField_Float_MultiThread
     * @tc.desc      Verify test_ObjSetField_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_DOUBLE_NORMAL_5100
     * @tc.name      test_ObjSetField_Double_Normal
     * @tc.desc      Verify test_ObjSetField_Double_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Double_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Double_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_DOUBLE_MULTITHREAD_5200
     * @tc.name      test_ObjSetField_Double_MultiThread
     * @tc.desc      Verify test_ObjSetField_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_REF_NORMAL_5300
     * @tc.name      test_ObjSetField_Ref_Normal
     * @tc.desc      Verify test_ObjSetField_Ref_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Ref_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Ref_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_REF_MULTITHREAD_5400
     * @tc.name      test_ObjSetField_Ref_MultiThread
     * @tc.desc      Verify test_ObjSetField_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_BOOLEAN_NORMAL_5500
     * @tc.name      test_ObjGetFieldByName_Boolean_Normal
     * @tc.desc      Verify test_ObjGetFieldByName_Boolean_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Boolean_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Boolean_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_BOOLEAN_MULTITHREAD_5600
     * @tc.name      test_ObjGetFieldByName_Boolean_MultiThread
     * @tc.desc      Verify test_ObjGetFieldByName_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_CHAR_NORMAL_5700
     * @tc.name      test_ObjGetFieldByName_Char_Normal
     * @tc.desc      Verify test_ObjGetFieldByName_Char_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Char_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Char_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_CHAR_MULTITHREAD_5800
     * @tc.name      test_ObjGetFieldByName_Char_MultiThread
     * @tc.desc      Verify test_ObjGetFieldByName_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_BYTE_NORMAL_5900
     * @tc.name      test_ObjGetFieldByName_Byte_Normal
     * @tc.desc      Verify test_ObjGetFieldByName_Byte_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Byte_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Byte_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_BYTE_MULTITHREAD_6000
     * @tc.name      test_ObjGetFieldByName_Byte_MultiThread
     * @tc.desc      Verify test_ObjGetFieldByName_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_SHORT_NORMAL_6100
     * @tc.name      test_ObjGetFieldByName_Short_Normal
     * @tc.desc      Verify test_ObjGetFieldByName_Short_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Short_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Short_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_SHORT_MULTITHREAD_6200
     * @tc.name      test_ObjGetFieldByName_Short_MultiThread
     * @tc.desc      Verify test_ObjGetFieldByName_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_INT_NORMAL_6300
     * @tc.name      test_ObjGetFieldByName_Int_Normal
     * @tc.desc      Verify test_ObjGetFieldByName_Int_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Int_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Int_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_INT_MULTITHREAD_6400
     * @tc.name      test_ObjGetFieldByName_Int_MultiThread
     * @tc.desc      Verify test_ObjGetFieldByName_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_LONG_NORMAL_6500
     * @tc.name      test_ObjGetFieldByName_Long_Normal
     * @tc.desc      Verify test_ObjGetFieldByName_Long_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Long_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Long_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_LONG_MULTITHREAD_6600
     * @tc.name      test_ObjGetFieldByName_Long_MultiThread
     * @tc.desc      Verify test_ObjGetFieldByName_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_FLOAT_NORMAL_6700
     * @tc.name      test_ObjGetFieldByName_Float_Normal
     * @tc.desc      Verify test_ObjGetFieldByName_Float_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Float_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Float_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_FLOAT_MULTITHREAD_6800
     * @tc.name      test_ObjGetFieldByName_Float_MultiThread
     * @tc.desc      Verify test_ObjGetFieldByName_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_DOUBLE_NORMAL_6900
     * @tc.name      test_ObjGetFieldByName_Double_Normal
     * @tc.desc      Verify test_ObjGetFieldByName_Double_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Double_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Double_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_DOUBLE_MULTITHREAD_7000
     * @tc.name      test_ObjGetFieldByName_Double_MultiThread
     * @tc.desc      Verify test_ObjGetFieldByName_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_REF_NORMAL_7100
     * @tc.name      test_ObjGetFieldByName_Ref_Normal
     * @tc.desc      Verify test_ObjGetFieldByName_Ref_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Ref_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Ref_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_REF_MULTITHREAD_7200
     * @tc.name      test_ObjGetFieldByName_Ref_MultiThread
     * @tc.desc      Verify test_ObjGetFieldByName_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_BOOLEAN_NORMAL_7300
     * @tc.name      test_ObjSetFieldByName_Boolean_Normal
     * @tc.desc      Verify test_ObjSetFieldByName_Boolean_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Boolean_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Boolean_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_BOOLEAN_MULTITHREAD_7400
     * @tc.name      test_ObjSetFieldByName_Boolean_MultiThread
     * @tc.desc      Verify test_ObjSetFieldByName_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_CHAR_NORMAL_7500
     * @tc.name      test_ObjSetFieldByName_Char_Normal
     * @tc.desc      Verify test_ObjSetFieldByName_Char_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Char_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Char_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_CHAR_MULTITHREAD_7600
     * @tc.name      test_ObjSetFieldByName_Char_MultiThread
     * @tc.desc      Verify test_ObjSetFieldByName_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_BYTE_NORMAL_7700
     * @tc.name      test_ObjSetFieldByName_Byte_Normal
     * @tc.desc      Verify test_ObjSetFieldByName_Byte_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Byte_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Byte_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_BYTE_MULTITHREAD_7800
     * @tc.name      test_ObjSetFieldByName_Byte_MultiThread
     * @tc.desc      Verify test_ObjSetFieldByName_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_SHORT_NORMAL_7900
     * @tc.name      test_ObjSetFieldByName_Short_Normal
     * @tc.desc      Verify test_ObjSetFieldByName_Short_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Short_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Short_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_SHORT_MULTITHREAD_8000
     * @tc.name      test_ObjSetFieldByName_Short_MultiThread
     * @tc.desc      Verify test_ObjSetFieldByName_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_INT_NORMAL_8100
     * @tc.name      test_ObjSetFieldByName_Int_Normal
     * @tc.desc      Verify test_ObjSetFieldByName_Int_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Int_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Int_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_INT_MULTITHREAD_8200
     * @tc.name      test_ObjSetFieldByName_Int_MultiThread
     * @tc.desc      Verify test_ObjSetFieldByName_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_LONG_NORMAL_8300
     * @tc.name      test_ObjSetFieldByName_Long_Normal
     * @tc.desc      Verify test_ObjSetFieldByName_Long_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Long_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Long_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_LONG_MULTITHREAD_8400
     * @tc.name      test_ObjSetFieldByName_Long_MultiThread
     * @tc.desc      Verify test_ObjSetFieldByName_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_FLOAT_NORMAL_8500
     * @tc.name      test_ObjSetFieldByName_Float_Normal
     * @tc.desc      Verify test_ObjSetFieldByName_Float_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Float_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Float_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_FLOAT_MULTITHREAD_8600
     * @tc.name      test_ObjSetFieldByName_Float_MultiThread
     * @tc.desc      Verify test_ObjSetFieldByName_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_DOUBLE_NORMAL_8700
     * @tc.name      test_ObjSetFieldByName_Double_Normal
     * @tc.desc      Verify test_ObjSetFieldByName_Double_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Double_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Double_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_DOUBLE_MULTITHREAD_8800
     * @tc.name      test_ObjSetFieldByName_Double_MultiThread
     * @tc.desc      Verify test_ObjSetFieldByName_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_REF_NORMAL_8900
     * @tc.name      test_ObjSetFieldByName_Ref_Normal
     * @tc.desc      Verify test_ObjSetFieldByName_Ref_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Ref_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Ref_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_REF_MULTITHREAD_9000
     * @tc.name      test_ObjSetFieldByName_Ref_MultiThread
     * @tc.desc      Verify test_ObjSetFieldByName_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_BOOLEAN_NORMAL_9100
     * @tc.name      test_ObjGetPropertyByName_Boolean_Normal
     * @tc.desc      Verify test_ObjGetPropertyByName_Boolean_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Boolean_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Boolean_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_BOOLEAN_MULTITHREAD_9200
     * @tc.name      test_ObjGetPropertyByName_Boolean_MultiThread
     * @tc.desc      Verify test_ObjGetPropertyByName_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_CHAR_NORMAL_9300
     * @tc.name      test_ObjGetPropertyByName_Char_Normal
     * @tc.desc      Verify test_ObjGetPropertyByName_Char_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Char_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Char_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_CHAR_MULTITHREAD_9400
     * @tc.name      test_ObjGetPropertyByName_Char_MultiThread
     * @tc.desc      Verify test_ObjGetPropertyByName_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_BYTE_NORMAL_9500
     * @tc.name      test_ObjGetPropertyByName_Byte_Normal
     * @tc.desc      Verify test_ObjGetPropertyByName_Byte_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Byte_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Byte_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_BYTE_MULTITHREAD_9600
     * @tc.name      test_ObjGetPropertyByName_Byte_MultiThread
     * @tc.desc      Verify test_ObjGetPropertyByName_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_SHORT_NORMAL_9700
     * @tc.name      test_ObjGetPropertyByName_Short_Normal
     * @tc.desc      Verify test_ObjGetPropertyByName_Short_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Short_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Short_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_SHORT_MULTITHREAD_9800
     * @tc.name      test_ObjGetPropertyByName_Short_MultiThread
     * @tc.desc      Verify test_ObjGetPropertyByName_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_INT_NORMAL_9900
     * @tc.name      test_ObjGetPropertyByName_Int_Normal
     * @tc.desc      Verify test_ObjGetPropertyByName_Int_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Int_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Int_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_INT_MULTITHREAD_0100
     * @tc.name      test_ObjGetPropertyByName_Int_MultiThread
     * @tc.desc      Verify test_ObjGetPropertyByName_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_LONG_NORMAL_0200
     * @tc.name      test_ObjGetPropertyByName_Long_Normal
     * @tc.desc      Verify test_ObjGetPropertyByName_Long_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Long_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Long_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_LONG_MULTITHREAD_0300
     * @tc.name      test_ObjGetPropertyByName_Long_MultiThread
     * @tc.desc      Verify test_ObjGetPropertyByName_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_FLOAT_NORMAL_0400
     * @tc.name      test_ObjGetPropertyByName_Float_Normal
     * @tc.desc      Verify test_ObjGetPropertyByName_Float_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Float_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Float_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_FLOAT_MULTITHREAD_0500
     * @tc.name      test_ObjGetPropertyByName_Float_MultiThread
     * @tc.desc      Verify test_ObjGetPropertyByName_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_DOUBLE_NORMAL_0600
     * @tc.name      test_ObjGetPropertyByName_Double_Normal
     * @tc.desc      Verify test_ObjGetPropertyByName_Double_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Double_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Double_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_DOUBLE_MULTITHREAD_0700
     * @tc.name      test_ObjGetPropertyByName_Double_MultiThread
     * @tc.desc      Verify test_ObjGetPropertyByName_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_REF_NORMAL_0800
     * @tc.name      test_ObjGetPropertyByName_Ref_Normal
     * @tc.desc      Verify test_ObjGetPropertyByName_Ref_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Ref_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Ref_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_REF_MULTITHREAD_0900
     * @tc.name      test_ObjGetPropertyByName_Ref_MultiThread
     * @tc.desc      Verify test_ObjGetPropertyByName_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetPropertyByName_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetPropertyByName_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_BOOLEAN_NORMAL_1000
     * @tc.name      test_ObjSetPropertyByName_Boolean_Normal
     * @tc.desc      Verify test_ObjSetPropertyByName_Boolean_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Boolean_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Boolean_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_BOOLEAN_MULTITHREAD_1100
     * @tc.name      test_ObjSetPropertyByName_Boolean_MultiThread
     * @tc.desc      Verify test_ObjSetPropertyByName_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_CHAR_NORMAL_1200
     * @tc.name      test_ObjSetPropertyByName_Char_Normal
     * @tc.desc      Verify test_ObjSetPropertyByName_Char_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Char_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Char_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_CHAR_MULTITHREAD_1300
     * @tc.name      test_ObjSetPropertyByName_Char_MultiThread
     * @tc.desc      Verify test_ObjSetPropertyByName_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_BYTE_NORMAL_1400
     * @tc.name      test_ObjSetPropertyByName_Byte_Normal
     * @tc.desc      Verify test_ObjSetPropertyByName_Byte_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Byte_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Byte_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_BYTE_MULTITHREAD_1500
     * @tc.name      test_ObjSetPropertyByName_Byte_MultiThread
     * @tc.desc      Verify test_ObjSetPropertyByName_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_SHORT_NORMAL_1600
     * @tc.name      test_ObjSetPropertyByName_Short_Normal
     * @tc.desc      Verify test_ObjSetPropertyByName_Short_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Short_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Short_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_SHORT_MULTITHREAD_1700
     * @tc.name      test_ObjSetPropertyByName_Short_MultiThread
     * @tc.desc      Verify test_ObjSetPropertyByName_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_INT_NORMAL_1800
     * @tc.name      test_ObjSetPropertyByName_Int_Normal
     * @tc.desc      Verify test_ObjSetPropertyByName_Int_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Int_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Int_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_INT_MULTITHREAD_1900
     * @tc.name      test_ObjSetPropertyByName_Int_MultiThread
     * @tc.desc      Verify test_ObjSetPropertyByName_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_LONG_NORMAL_2000
     * @tc.name      test_ObjSetPropertyByName_Long_Normal
     * @tc.desc      Verify test_ObjSetPropertyByName_Long_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Long_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Long_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_LONG_MULTITHREAD_2100
     * @tc.name      test_ObjSetPropertyByName_Long_MultiThread
     * @tc.desc      Verify test_ObjSetPropertyByName_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_FLOAT_NORMAL_2200
     * @tc.name      test_ObjSetPropertyByName_Float_Normal
     * @tc.desc      Verify test_ObjSetPropertyByName_Float_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Float_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Float_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_FLOAT_MULTITHREAD_2300
     * @tc.name      test_ObjSetPropertyByName_Float_MultiThread
     * @tc.desc      Verify test_ObjSetPropertyByName_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_DOUBLE_NORMAL_2400
     * @tc.name      test_ObjSetPropertyByName_Double_Normal
     * @tc.desc      Verify test_ObjSetPropertyByName_Double_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Double_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Double_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_DOUBLE_MULTITHREAD_2500
     * @tc.name      test_ObjSetPropertyByName_Double_MultiThread
     * @tc.desc      Verify test_ObjSetPropertyByName_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_REF_NORMAL_2600
     * @tc.name      test_ObjSetPropertyByName_Ref_Normal
     * @tc.desc      Verify test_ObjSetPropertyByName_Ref_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Ref_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Ref_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_REF_MULTITHREAD_2700
     * @tc.name      test_ObjSetPropertyByName_Ref_MultiThread
     * @tc.desc      Verify test_ObjSetPropertyByName_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetPropertyByName_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetPropertyByName_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_BOOLEAN_NORMAL_2800
     * @tc.name      test_ObjCallByName_Boolean_Normal
     * @tc.desc      Verify test_ObjCallByName_Boolean_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Boolean_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Boolean_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_BOOLEAN_ABNORMAL_2900
     * @tc.name      test_ObjCallByName_Boolean_Abnormal
     * @tc.desc      Verify test_ObjCallByName_Boolean_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Boolean_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Boolean_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_BOOLEAN_MULTITHREAD_3000
     * @tc.name      test_ObjCallByName_Boolean_MultiThread
     * @tc.desc      Verify test_ObjCallByName_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_BYTE_NORMAL_3100
     * @tc.name      test_ObjCallByName_Byte_Normal
     * @tc.desc      Verify test_ObjCallByName_Byte_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Byte_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Byte_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_BYTE_ABNORMAL_3200
     * @tc.name      test_ObjCallByName_Byte_Abnormal
     * @tc.desc      Verify test_ObjCallByName_Byte_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Byte_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Byte_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_BYTE_MULTITHREAD_3300
     * @tc.name      test_ObjCallByName_Byte_MultiThread
     * @tc.desc      Verify test_ObjCallByName_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_CHAR_NORMAL_3400
     * @tc.name      test_ObjCallByName_Char_Normal
     * @tc.desc      Verify test_ObjCallByName_Char_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Char_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Char_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_CHAR_ABNORMAL_3500
     * @tc.name      test_ObjCallByName_Char_Abnormal
     * @tc.desc      Verify test_ObjCallByName_Char_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Char_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Char_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_CHAR_MULTITHREAD_3600
     * @tc.name      test_ObjCallByName_Char_MultiThread
     * @tc.desc      Verify test_ObjCallByName_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_SHORT_NORMAL_3700
     * @tc.name      test_ObjCallByName_Short_Normal
     * @tc.desc      Verify test_ObjCallByName_Short_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Short_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Short_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_SHORT_ABNORMAL_3800
     * @tc.name      test_ObjCallByName_Short_Abnormal
     * @tc.desc      Verify test_ObjCallByName_Short_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Short_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Short_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_SHORT_MULTITHREAD_3900
     * @tc.name      test_ObjCallByName_Short_MultiThread
     * @tc.desc      Verify test_ObjCallByName_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_LONG_NORMAL_4000
     * @tc.name      test_ObjCallByName_Long_Normal
     * @tc.desc      Verify test_ObjCallByName_Long_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Long_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Long_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_LONG_ABNORMAL_4100
     * @tc.name      test_ObjCallByName_Long_Abnormal
     * @tc.desc      Verify test_ObjCallByName_Long_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Long_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Long_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_LONG_MULTITHREAD_4200
     * @tc.name      test_ObjCallByName_Long_MultiThread
     * @tc.desc      Verify test_ObjCallByName_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_FLOAT_NORMAL_4300
     * @tc.name      test_ObjCallByName_Float_Normal
     * @tc.desc      Verify test_ObjCallByName_Float_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Float_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Float_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_FLOAT_ABNORMAL_4400
     * @tc.name      test_ObjCallByName_Float_Abnormal
     * @tc.desc      Verify test_ObjCallByName_Float_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Float_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Float_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_FLOAT_MULTITHREAD_4500
     * @tc.name      test_ObjCallByName_Float_MultiThread
     * @tc.desc      Verify test_ObjCallByName_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_DOUBLE_NORMAL_4600
     * @tc.name      test_ObjCallByName_Double_Normal
     * @tc.desc      Verify test_ObjCallByName_Double_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Double_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Double_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_DOUBLE_ABNORMAL_4700
     * @tc.name      test_ObjCallByName_Double_Abnormal
     * @tc.desc      Verify test_ObjCallByName_Double_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Double_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Double_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_DOUBLE_MULTITHREAD_4800
     * @tc.name      test_ObjCallByName_Double_MultiThread
     * @tc.desc      Verify test_ObjCallByName_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_INT_NORMAL_4900
     * @tc.name      test_ObjCallByName_Int_Normal
     * @tc.desc      Verify test_ObjCallByName_Int_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Int_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Int_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_INT_ABNORMAL_5000
     * @tc.name      test_ObjCallByName_Int_Abnormal
     * @tc.desc      Verify test_ObjCallByName_Int_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Int_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Int_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_INT_MULTITHREAD_5100
     * @tc.name      test_ObjCallByName_Int_MultiThread
     * @tc.desc      Verify test_ObjCallByName_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_REF_NORMAL_5200
     * @tc.name      test_ObjCallByName_Ref_Normal
     * @tc.desc      Verify test_ObjCallByName_Ref_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Ref_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Ref_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_REF_ABNORMAL_5300
     * @tc.name      test_ObjCallByName_Ref_Abnormal
     * @tc.desc      Verify test_ObjCallByName_Ref_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Ref_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Ref_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_REF_MULTITHREAD_5400
     * @tc.name      test_ObjCallByName_Ref_MultiThread
     * @tc.desc      Verify test_ObjCallByName_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_VOID_NORMAL_5500
     * @tc.name      test_ObjCallByName_Void_Normal
     * @tc.desc      Verify test_ObjCallByName_Void_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Void_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Void_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_VOID_ABNORMAL_5600
     * @tc.name      test_ObjCallByName_Void_Abnormal
     * @tc.desc      Verify test_ObjCallByName_Void_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Void_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Void_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_VOID_MULTITHREAD_5700
     * @tc.name      test_ObjCallByName_Void_MultiThread
     * @tc.desc      Verify test_ObjCallByName_Void_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Void_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Void_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_INT_BOUNDARY_MIN_5800
     * @tc.name      test_ObjGetField_Int_Boundary_Min
     * @tc.desc      Verify test_ObjGetField_Int_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Int_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Int_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_INT_BOUNDARY_MAX_5900
     * @tc.name      test_ObjGetField_Int_Boundary_Max
     * @tc.desc      Verify test_ObjGetField_Int_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Int_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Int_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_LONG_BOUNDARY_MIN_6000
     * @tc.name      test_ObjGetField_Long_Boundary_Min
     * @tc.desc      Verify test_ObjGetField_Long_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Long_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Long_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_LONG_BOUNDARY_MAX_6100
     * @tc.name      test_ObjGetField_Long_Boundary_Max
     * @tc.desc      Verify test_ObjGetField_Long_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Long_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Long_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_FLOAT_BOUNDARY_NAN_6200
     * @tc.name      test_ObjGetField_Float_Boundary_NaN
     * @tc.desc      Verify test_ObjGetField_Float_Boundary_NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Float_Boundary_NaN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Float_Boundary_NaN();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_FLOAT_BOUNDARY_INFINITY_6300
     * @tc.name      test_ObjGetField_Float_Boundary_Infinity
     * @tc.desc      Verify test_ObjGetField_Float_Boundary_Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Float_Boundary_Infinity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Float_Boundary_Infinity();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_DOUBLE_BOUNDARY_NAN_6400
     * @tc.name      test_ObjGetField_Double_Boundary_NaN
     * @tc.desc      Verify test_ObjGetField_Double_Boundary_NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Double_Boundary_NaN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Double_Boundary_NaN();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_DOUBLE_BOUNDARY_INFINITY_6500
     * @tc.name      test_ObjGetField_Double_Boundary_Infinity
     * @tc.desc      Verify test_ObjGetField_Double_Boundary_Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Double_Boundary_Infinity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Double_Boundary_Infinity();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_INT_BOUNDARY_MIN_6600
     * @tc.name      test_ObjSetField_Int_Boundary_Min
     * @tc.desc      Verify test_ObjSetField_Int_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Int_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Int_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_INT_BOUNDARY_MAX_6700
     * @tc.name      test_ObjSetField_Int_Boundary_Max
     * @tc.desc      Verify test_ObjSetField_Int_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Int_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Int_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_FLOAT_BOUNDARY_NAN_6800
     * @tc.name      test_ObjSetField_Float_Boundary_NaN
     * @tc.desc      Verify test_ObjSetField_Float_Boundary_NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Float_Boundary_NaN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Float_Boundary_NaN();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_DOUBLE_BOUNDARY_NAN_6900
     * @tc.name      test_ObjSetField_Double_Boundary_NaN
     * @tc.desc      Verify test_ObjSetField_Double_Boundary_NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetField_Double_Boundary_NaN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetField_Double_Boundary_NaN();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_BOOLEAN_BOUNDARY_FALSE_7000
     * @tc.name      test_ObjGetField_Boolean_Boundary_False
     * @tc.desc      Verify test_ObjGetField_Boolean_Boundary_False
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Boolean_Boundary_False", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Boolean_Boundary_False();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_REF_BOUNDARY_NULL_7100
     * @tc.name      test_ObjGetField_Ref_Boundary_Null
     * @tc.desc      Verify test_ObjGetField_Ref_Boundary_Null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetField_Ref_Boundary_Null", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetField_Ref_Boundary_Null();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_INT_BOUNDARY_MIN_7200
     * @tc.name      test_ObjGetFieldByName_Int_Boundary_Min
     * @tc.desc      Verify test_ObjGetFieldByName_Int_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Int_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Int_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_INT_BOUNDARY_MAX_7300
     * @tc.name      test_ObjGetFieldByName_Int_Boundary_Max
     * @tc.desc      Verify test_ObjGetFieldByName_Int_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetFieldByName_Int_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetFieldByName_Int_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_INT_BOUNDARY_MIN_7400
     * @tc.name      test_ObjSetFieldByName_Int_Boundary_Min
     * @tc.desc      Verify test_ObjSetFieldByName_Int_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Int_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Int_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_INT_BOUNDARY_MAX_7500
     * @tc.name      test_ObjSetFieldByName_Int_Boundary_Max
     * @tc.desc      Verify test_ObjSetFieldByName_Int_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjSetFieldByName_Int_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjSetFieldByName_Int_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_INT_BOUNDARY_MIN_7600
     * @tc.name      test_ObjCallByName_Int_Boundary_Min
     * @tc.desc      Verify test_ObjCallByName_Int_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Int_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Int_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_INT_BOUNDARY_MAX_7700
     * @tc.name      test_ObjCallByName_Int_Boundary_Max
     * @tc.desc      Verify test_ObjCallByName_Int_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Int_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Int_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_INT_BOUNDARY_ZERO_7800
     * @tc.name      test_ObjCallByName_Int_Boundary_Zero
     * @tc.desc      Verify test_ObjCallByName_Int_Boundary_Zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjCallByName_Int_Boundary_Zero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjCallByName_Int_Boundary_Zero();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETTYPE_BOUNDARY_NULLOBJECT_7900
     * @tc.name      test_ObjGetType_Boundary_NullObject
     * @tc.desc      Verify test_ObjGetType_Boundary_NullObject
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjGetType_Boundary_NullObject", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ObjGetType_Boundary_NullObject();
      expect(result).assertEqual(1);
      done();
    });
  })
}
