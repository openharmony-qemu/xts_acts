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

export default function extendedTestsPart8(): void {

  describe("ActsExtendedTestsPart8", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_ABNORMAL_NULLCLS
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_ABNORMAL_NULLCTOR
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_V_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_V_ABNORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_A_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJNEW_A_ABNORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETTYPE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETTYPE_ABNORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETTYPE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETTYPE_COMBO
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJINSTANCEOF_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJINSTANCEOF_ABNORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJINSTANCEOF_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJINSTANCEOF_SELFTYPE
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJINSTANCEOF_UNRELATEDTYPE
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJINSTANCEOF_NULLTYPE
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_BOOLEAN_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_BOOLEAN_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_CHAR_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_CHAR_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_BYTE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_BYTE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_SHORT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_SHORT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_INT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_INT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_LONG_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_LONG_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_FLOAT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_FLOAT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_DOUBLE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_DOUBLE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_REF_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELD_REF_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_BOOLEAN_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_BOOLEAN_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_CHAR_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_CHAR_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_BYTE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_BYTE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_SHORT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_SHORT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_INT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_INT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_LONG_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_LONG_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_FLOAT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_FLOAT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_DOUBLE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_DOUBLE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_REF_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELD_REF_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_BOOLEAN_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_BOOLEAN_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_CHAR_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_CHAR_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_BYTE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_BYTE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_SHORT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_SHORT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_INT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_INT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_LONG_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_LONG_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_FLOAT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_FLOAT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_DOUBLE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_DOUBLE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_REF_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETFIELDBYNAME_REF_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_BOOLEAN_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_BOOLEAN_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_CHAR_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_CHAR_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_BYTE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_BYTE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_SHORT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_SHORT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_INT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_INT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_LONG_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_LONG_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_FLOAT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_FLOAT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_DOUBLE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_DOUBLE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_REF_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETFIELDBYNAME_REF_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_BOOLEAN_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_BOOLEAN_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_CHAR_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_CHAR_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_BYTE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_BYTE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_SHORT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_SHORT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_INT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_INT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_LONG_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_LONG_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_FLOAT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_FLOAT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_DOUBLE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_DOUBLE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_REF_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJGETPROPERTYBYNAME_REF_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_BOOLEAN_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_BOOLEAN_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_CHAR_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_CHAR_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_BYTE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_BYTE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_SHORT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_SHORT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_INT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_INT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_LONG_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_LONG_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_FLOAT_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_FLOAT_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_DOUBLE_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_DOUBLE_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_REF_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJSETPROPERTYBYNAME_REF_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_BOOLEAN_NORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_BOOLEAN_ABNORMAL
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_BOOLEAN_MULTITHREAD
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_OBJCALLBYNAME_BYTE_NORMAL
     * @tc.name      test_ObjCallByName_Byte_Normal
     * @tc.desc      Verify test_ObjCallByName_Byte_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */

