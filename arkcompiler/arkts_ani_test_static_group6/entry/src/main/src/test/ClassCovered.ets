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

export default function extendedTestsPart7(): void {

  describe("ActsExtendedTestsPart7", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_NORMAL
     * @tc.name      test_Class_FindField_Normal
     * @tc.desc      Verify test_Class_FindField_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindField_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindField_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_ABNORMAL
     * @tc.name      test_Class_FindField_Abnormal
     * @tc.desc      Verify test_Class_FindField_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindField_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindField_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_EMPTYNAME
     * @tc.name      test_Class_FindField_EmptyName
     * @tc.desc      Verify test_Class_FindField_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindField_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindField_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_MULTITHREAD
     * @tc.name      test_Class_FindField_MultiThread
     * @tc.desc      Verify test_Class_FindField_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindField_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindField_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_NORMAL
     * @tc.name      test_Class_FindStaticField_Normal
     * @tc.desc      Verify test_Class_FindStaticField_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticField_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticField_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_ABNORMAL
     * @tc.name      test_Class_FindStaticField_Abnormal
     * @tc.desc      Verify test_Class_FindStaticField_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticField_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticField_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_EMPTYNAME
     * @tc.name      test_Class_FindStaticField_EmptyName
     * @tc.desc      Verify test_Class_FindStaticField_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticField_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticField_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_MULTITHREAD
     * @tc.name      test_Class_FindStaticField_MultiThread
     * @tc.desc      Verify test_Class_FindStaticField_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticField_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticField_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_NOTEXIST
     * @tc.name      test_Class_FindField_NotExist
     * @tc.desc      Verify test_Class_FindField_NotExist
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindField_NotExist", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindField_NotExist();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_LONGNAME
     * @tc.name      test_Class_FindField_LongName
     * @tc.desc      Verify test_Class_FindField_LongName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindField_LongName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindField_LongName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_NOTEXIST
     * @tc.name      test_Class_FindStaticField_NotExist
     * @tc.desc      Verify test_Class_FindStaticField_NotExist
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticField_NotExist", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticField_NotExist();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_LONGNAME
     * @tc.name      test_Class_FindStaticField_LongName
     * @tc.desc      Verify test_Class_FindStaticField_LongName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticField_LongName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticField_LongName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_NORMAL
     * @tc.name      test_Class_FindMethod_Normal
     * @tc.desc      Verify test_Class_FindMethod_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindMethod_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindMethod_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_ABNORMAL
     * @tc.name      test_Class_FindMethod_Abnormal
     * @tc.desc      Verify test_Class_FindMethod_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindMethod_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindMethod_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_EMPTYNAME
     * @tc.name      test_Class_FindMethod_EmptyName
     * @tc.desc      Verify test_Class_FindMethod_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindMethod_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindMethod_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_MULTITHREAD
     * @tc.name      test_Class_FindMethod_MultiThread
     * @tc.desc      Verify test_Class_FindMethod_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindMethod_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindMethod_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_NORMAL
     * @tc.name      test_Class_FindStaticMethod_Normal
     * @tc.desc      Verify test_Class_FindStaticMethod_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticMethod_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethod_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_ABNORMAL
     * @tc.name      test_Class_FindStaticMethod_Abnormal
     * @tc.desc      Verify test_Class_FindStaticMethod_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticMethod_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethod_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_EMPTYNAME
     * @tc.name      test_Class_FindStaticMethod_EmptyName
     * @tc.desc      Verify test_Class_FindStaticMethod_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticMethod_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethod_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_MULTITHREAD
     * @tc.name      test_Class_FindStaticMethod_MultiThread
     * @tc.desc      Verify test_Class_FindStaticMethod_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticMethod_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethod_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_NOTEXIST
     * @tc.name      test_Class_FindMethod_NotExist
     * @tc.desc      Verify test_Class_FindMethod_NotExist
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindMethod_NotExist", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindMethod_NotExist();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_NULLSIG
     * @tc.name      test_Class_FindMethod_NullSig
     * @tc.desc      Verify test_Class_FindMethod_NullSig
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindMethod_NullSig", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindMethod_NullSig();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_NOTEXIST
     * @tc.name      test_Class_FindStaticMethod_NotExist
     * @tc.desc      Verify test_Class_FindStaticMethod_NotExist
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticMethod_NotExist", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethod_NotExist();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_NULLSIG
     * @tc.name      test_Class_FindStaticMethod_NullSig
     * @tc.desc      Verify test_Class_FindStaticMethod_NullSig
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticMethod_NullSig", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethod_NullSig();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_BOOLEAN_NORMAL
     * @tc.name      test_Class_GetStaticField_Boolean_Normal
     * @tc.desc      Verify test_Class_GetStaticField_Boolean_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Boolean_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Boolean_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_BOOLEAN_MULTITHREAD
     * @tc.name      test_Class_GetStaticField_Boolean_MultiThread
     * @tc.desc      Verify test_Class_GetStaticField_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_CHAR_NORMAL
     * @tc.name      test_Class_GetStaticField_Char_Normal
     * @tc.desc      Verify test_Class_GetStaticField_Char_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Char_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Char_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_CHAR_MULTITHREAD
     * @tc.name      test_Class_GetStaticField_Char_MultiThread
     * @tc.desc      Verify test_Class_GetStaticField_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_BYTE_NORMAL
     * @tc.name      test_Class_GetStaticField_Byte_Normal
     * @tc.desc      Verify test_Class_GetStaticField_Byte_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Byte_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Byte_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_BYTE_MULTITHREAD
     * @tc.name      test_Class_GetStaticField_Byte_MultiThread
     * @tc.desc      Verify test_Class_GetStaticField_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_SHORT_NORMAL
     * @tc.name      test_Class_GetStaticField_Short_Normal
     * @tc.desc      Verify test_Class_GetStaticField_Short_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Short_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Short_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_SHORT_MULTITHREAD
     * @tc.name      test_Class_GetStaticField_Short_MultiThread
     * @tc.desc      Verify test_Class_GetStaticField_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_INT_NORMAL
     * @tc.name      test_Class_GetStaticField_Int_Normal
     * @tc.desc      Verify test_Class_GetStaticField_Int_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Int_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Int_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_INT_MULTITHREAD
     * @tc.name      test_Class_GetStaticField_Int_MultiThread
     * @tc.desc      Verify test_Class_GetStaticField_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_LONG_NORMAL
     * @tc.name      test_Class_GetStaticField_Long_Normal
     * @tc.desc      Verify test_Class_GetStaticField_Long_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Long_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Long_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_LONG_MULTITHREAD
     * @tc.name      test_Class_GetStaticField_Long_MultiThread
     * @tc.desc      Verify test_Class_GetStaticField_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_FLOAT_NORMAL
     * @tc.name      test_Class_GetStaticField_Float_Normal
     * @tc.desc      Verify test_Class_GetStaticField_Float_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Float_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Float_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_FLOAT_MULTITHREAD
     * @tc.name      test_Class_GetStaticField_Float_MultiThread
     * @tc.desc      Verify test_Class_GetStaticField_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_DOUBLE_NORMAL
     * @tc.name      test_Class_GetStaticField_Double_Normal
     * @tc.desc      Verify test_Class_GetStaticField_Double_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Double_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Double_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_DOUBLE_MULTITHREAD
     * @tc.name      test_Class_GetStaticField_Double_MultiThread
     * @tc.desc      Verify test_Class_GetStaticField_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_REF_NORMAL
     * @tc.name      test_Class_GetStaticField_Ref_Normal
     * @tc.desc      Verify test_Class_GetStaticField_Ref_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Ref_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Ref_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_REF_MULTITHREAD
     * @tc.name      test_Class_GetStaticField_Ref_MultiThread
     * @tc.desc      Verify test_Class_GetStaticField_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_BOOLEAN_NORMAL
     * @tc.name      test_Class_SetStaticField_Boolean_Normal
     * @tc.desc      Verify test_Class_SetStaticField_Boolean_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Boolean_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Boolean_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_BOOLEAN_MULTITHREAD
     * @tc.name      test_Class_SetStaticField_Boolean_MultiThread
     * @tc.desc      Verify test_Class_SetStaticField_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_CHAR_NORMAL
     * @tc.name      test_Class_SetStaticField_Char_Normal
     * @tc.desc      Verify test_Class_SetStaticField_Char_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Char_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Char_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_CHAR_MULTITHREAD
     * @tc.name      test_Class_SetStaticField_Char_MultiThread
     * @tc.desc      Verify test_Class_SetStaticField_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_BYTE_NORMAL
     * @tc.name      test_Class_SetStaticField_Byte_Normal
     * @tc.desc      Verify test_Class_SetStaticField_Byte_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Byte_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Byte_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_BYTE_MULTITHREAD
     * @tc.name      test_Class_SetStaticField_Byte_MultiThread
     * @tc.desc      Verify test_Class_SetStaticField_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_SHORT_NORMAL
     * @tc.name      test_Class_SetStaticField_Short_Normal
     * @tc.desc      Verify test_Class_SetStaticField_Short_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Short_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Short_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_SHORT_MULTITHREAD
     * @tc.name      test_Class_SetStaticField_Short_MultiThread
     * @tc.desc      Verify test_Class_SetStaticField_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_INT_NORMAL
     * @tc.name      test_Class_SetStaticField_Int_Normal
     * @tc.desc      Verify test_Class_SetStaticField_Int_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Int_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Int_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_INT_MULTITHREAD
     * @tc.name      test_Class_SetStaticField_Int_MultiThread
     * @tc.desc      Verify test_Class_SetStaticField_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_LONG_NORMAL
     * @tc.name      test_Class_SetStaticField_Long_Normal
     * @tc.desc      Verify test_Class_SetStaticField_Long_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Long_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Long_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_LONG_MULTITHREAD
     * @tc.name      test_Class_SetStaticField_Long_MultiThread
     * @tc.desc      Verify test_Class_SetStaticField_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_FLOAT_NORMAL
     * @tc.name      test_Class_SetStaticField_Float_Normal
     * @tc.desc      Verify test_Class_SetStaticField_Float_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Float_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Float_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_FLOAT_MULTITHREAD
     * @tc.name      test_Class_SetStaticField_Float_MultiThread
     * @tc.desc      Verify test_Class_SetStaticField_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_DOUBLE_NORMAL
     * @tc.name      test_Class_SetStaticField_Double_Normal
     * @tc.desc      Verify test_Class_SetStaticField_Double_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Double_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Double_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_DOUBLE_MULTITHREAD
     * @tc.name      test_Class_SetStaticField_Double_MultiThread
     * @tc.desc      Verify test_Class_SetStaticField_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_REF_NORMAL
     * @tc.name      test_Class_SetStaticField_Ref_Normal
     * @tc.desc      Verify test_Class_SetStaticField_Ref_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Ref_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Ref_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_REF_MULTITHREAD
     * @tc.name      test_Class_SetStaticField_Ref_MultiThread
     * @tc.desc      Verify test_Class_SetStaticField_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDNATIVEMETHODS_NORMAL
     * @tc.name      test_Class_BindNativeMethods_Normal
     * @tc.desc      Verify test_Class_BindNativeMethods_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindNativeMethods_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindNativeMethods_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDNATIVEMETHODS_ABNORMAL
     * @tc.name      test_Class_BindNativeMethods_Abnormal
     * @tc.desc      Verify test_Class_BindNativeMethods_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindNativeMethods_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindNativeMethods_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDNATIVEMETHODS_EMPTYNAME
     * @tc.name      test_Class_BindNativeMethods_EmptyName
     * @tc.desc      Verify test_Class_BindNativeMethods_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindNativeMethods_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindNativeMethods_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDNATIVEMETHODS_MULTITHREAD
     * @tc.name      test_Class_BindNativeMethods_MultiThread
     * @tc.desc      Verify test_Class_BindNativeMethods_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindNativeMethods_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindNativeMethods_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDSTATICNATIVEMETHODS_NORMAL
     * @tc.name      test_Class_BindStaticNativeMethods_Normal
     * @tc.desc      Verify test_Class_BindStaticNativeMethods_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindStaticNativeMethods_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindStaticNativeMethods_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDSTATICNATIVEMETHODS_ABNORMAL
     * @tc.name      test_Class_BindStaticNativeMethods_Abnormal
     * @tc.desc      Verify test_Class_BindStaticNativeMethods_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindStaticNativeMethods_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindStaticNativeMethods_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDSTATICNATIVEMETHODS_EMPTYNAME
     * @tc.name      test_Class_BindStaticNativeMethods_EmptyName
     * @tc.desc      Verify test_Class_BindStaticNativeMethods_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindStaticNativeMethods_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindStaticNativeMethods_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDSTATICNATIVEMETHODS_MULTITHREAD
     * @tc.name      test_Class_BindStaticNativeMethods_MultiThread
     * @tc.desc      Verify test_Class_BindStaticNativeMethods_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindStaticNativeMethods_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindStaticNativeMethods_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BOOLEAN_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Boolean_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Boolean_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Boolean_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Boolean_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BOOLEAN_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Boolean_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BOOLEAN_A_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Boolean_A_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Boolean_A_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Boolean_A_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Boolean_A_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BOOLEAN_A_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Boolean_A_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Boolean_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Boolean_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Boolean_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BOOLEAN_V_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Boolean_V_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Boolean_V_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Boolean_V_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Boolean_V_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BOOLEAN_V_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Boolean_V_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Boolean_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Boolean_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Boolean_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_CHAR_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Char_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Char_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Char_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Char_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_CHAR_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Char_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_CHAR_A_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Char_A_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Char_A_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Char_A_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Char_A_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_CHAR_A_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Char_A_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Char_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Char_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Char_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_CHAR_V_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Char_V_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Char_V_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Char_V_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Char_V_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_CHAR_V_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Char_V_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Char_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Char_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Char_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BYTE_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Byte_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Byte_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Byte_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Byte_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BYTE_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Byte_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BYTE_A_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Byte_A_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Byte_A_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Byte_A_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Byte_A_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BYTE_A_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Byte_A_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Byte_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Byte_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Byte_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BYTE_V_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Byte_V_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Byte_V_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Byte_V_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Byte_V_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BYTE_V_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Byte_V_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Byte_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Byte_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Byte_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_SHORT_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Short_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Short_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Short_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Short_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_SHORT_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Short_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_SHORT_A_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Short_A_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Short_A_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Short_A_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Short_A_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_SHORT_A_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Short_A_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Short_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Short_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Short_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_SHORT_V_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Short_V_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Short_V_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Short_V_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Short_V_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_SHORT_V_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Short_V_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Short_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Short_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Short_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_INT_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Int_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Int_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Int_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Int_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_INT_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Int_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_INT_A_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Int_A_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Int_A_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Int_A_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Int_A_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_INT_A_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Int_A_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Int_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Int_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Int_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_INT_V_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Int_V_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Int_V_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Int_V_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Int_V_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_INT_V_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Int_V_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Int_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Int_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Int_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_LONG_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Long_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Long_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Long_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Long_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_LONG_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Long_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_LONG_A_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Long_A_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Long_A_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Long_A_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Long_A_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_LONG_A_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Long_A_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Long_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Long_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Long_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_LONG_V_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Long_V_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Long_V_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Long_V_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Long_V_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_LONG_V_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Long_V_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Long_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Long_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Long_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_FLOAT_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Float_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Float_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Float_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Float_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_FLOAT_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Float_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_FLOAT_A_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Float_A_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Float_A_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Float_A_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Float_A_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_FLOAT_A_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Float_A_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Float_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Float_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Float_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_FLOAT_V_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Float_V_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Float_V_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Float_V_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Float_V_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_FLOAT_V_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Float_V_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Float_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Float_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Float_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_DOUBLE_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Double_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Double_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Double_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Double_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_DOUBLE_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Double_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_DOUBLE_A_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Double_A_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Double_A_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Double_A_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Double_A_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_DOUBLE_A_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Double_A_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Double_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Double_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Double_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_DOUBLE_V_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Double_V_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Double_V_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Double_V_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Double_V_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_DOUBLE_V_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Double_V_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Double_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Double_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Double_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_REF_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Ref_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Ref_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Ref_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Ref_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_REF_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Ref_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_REF_A_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Ref_A_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Ref_A_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Ref_A_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Ref_A_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_REF_A_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Ref_A_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Ref_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Ref_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Ref_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_REF_V_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Ref_V_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Ref_V_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Ref_V_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Ref_V_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_REF_V_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Ref_V_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Ref_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Ref_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Ref_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_VOID_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Void_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Void_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Void_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Void_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_VOID_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Void_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Void_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Void_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Void_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_VOID_A_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Void_A_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Void_A_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Void_A_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Void_A_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_VOID_A_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Void_A_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Void_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Void_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Void_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_VOID_V_NORMAL
     * @tc.name      test_Class_CallStaticMethodByName_Void_V_Normal
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Void_V_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Void_V_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Void_V_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_VOID_V_MULTITHREAD
     * @tc.name      test_Class_CallStaticMethodByName_Void_V_MultiThread
     * @tc.desc      Verify test_Class_CallStaticMethodByName_Void_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_CallStaticMethodByName_Void_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_CallStaticMethodByName_Void_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_BOOLEAN_BOUNDARY_DEFAULTVALUE
     * @tc.name      test_Class_GetStaticField_Boolean_Boundary_DefaultValue
     * @tc.desc      Verify test_Class_GetStaticField_Boolean_Boundary_DefaultValue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Boolean_Boundary_DefaultValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Boolean_Boundary_DefaultValue();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_INT_BOUNDARY_MIN
     * @tc.name      test_Class_GetStaticField_Int_Boundary_Min
     * @tc.desc      Verify test_Class_GetStaticField_Int_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Int_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Int_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });

}
