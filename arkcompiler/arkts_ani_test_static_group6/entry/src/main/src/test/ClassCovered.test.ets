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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_NORMAL_0100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_ABNORMAL_0200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_EMPTYNAME_0300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_MULTITHREAD_0400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_NORMAL_0500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_ABNORMAL_0600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_EMPTYNAME_0700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_MULTITHREAD_0800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_NOTEXIST_0900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_LONGNAME_1000
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_NOTEXIST_1100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_LONGNAME_1200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_NORMAL_1300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_ABNORMAL_1400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_EMPTYNAME_1500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_MULTITHREAD_1600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_NORMAL_1700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_ABNORMAL_1800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_EMPTYNAME_1900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_MULTITHREAD_2000
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_NOTEXIST_2100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_NULLSIG_2200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_NOTEXIST_2300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_NULLSIG_2400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_BOOLEAN_NORMAL_2500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_BOOLEAN_MULTITHREAD_2600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_CHAR_NORMAL_2700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_CHAR_MULTITHREAD_2800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_BYTE_NORMAL_2900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_BYTE_MULTITHREAD_3000
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_SHORT_NORMAL_3100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_SHORT_MULTITHREAD_3200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_INT_NORMAL_3300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_INT_MULTITHREAD_3400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_LONG_NORMAL_3500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_LONG_MULTITHREAD_3600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_FLOAT_NORMAL_3700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_FLOAT_MULTITHREAD_3800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_DOUBLE_NORMAL_3900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_DOUBLE_MULTITHREAD_4000
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_REF_NORMAL_4100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_REF_MULTITHREAD_4200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_BOOLEAN_NORMAL_4300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_BOOLEAN_MULTITHREAD_4400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_CHAR_NORMAL_4500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_CHAR_MULTITHREAD_4600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_BYTE_NORMAL_4700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_BYTE_MULTITHREAD_4800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_SHORT_NORMAL_4900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_SHORT_MULTITHREAD_5000
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_INT_NORMAL_5100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_INT_MULTITHREAD_5200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_LONG_NORMAL_5300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_LONG_MULTITHREAD_5400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_FLOAT_NORMAL_5500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_FLOAT_MULTITHREAD_5600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_DOUBLE_NORMAL_5700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_DOUBLE_MULTITHREAD_5800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_REF_NORMAL_5900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_REF_MULTITHREAD_6000
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDNATIVEMETHODS_NORMAL_6100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDNATIVEMETHODS_ABNORMAL_6200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDNATIVEMETHODS_EMPTYNAME_6300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDNATIVEMETHODS_MULTITHREAD_6400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDSTATICNATIVEMETHODS_NORMAL_6500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDSTATICNATIVEMETHODS_ABNORMAL_6600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDSTATICNATIVEMETHODS_EMPTYNAME_6700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDSTATICNATIVEMETHODS_MULTITHREAD_6800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BOOLEAN_NORMAL_6900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BOOLEAN_MULTITHREAD_7000
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BOOLEAN_A_NORMAL_7100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BOOLEAN_A_MULTITHREAD_7200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BOOLEAN_V_NORMAL_7300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BOOLEAN_V_MULTITHREAD_7400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_CHAR_NORMAL_7500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_CHAR_MULTITHREAD_7600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_CHAR_A_NORMAL_7700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_CHAR_A_MULTITHREAD_7800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_CHAR_V_NORMAL_7900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_CHAR_V_MULTITHREAD_8000
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BYTE_NORMAL_8100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BYTE_MULTITHREAD_8200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BYTE_A_NORMAL_8300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BYTE_A_MULTITHREAD_8400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BYTE_V_NORMAL_8500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_BYTE_V_MULTITHREAD_8600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_SHORT_NORMAL_8700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_SHORT_MULTITHREAD_8800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_SHORT_A_NORMAL_8900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_SHORT_A_MULTITHREAD_9000
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_SHORT_V_NORMAL_9100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_SHORT_V_MULTITHREAD_9200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_INT_NORMAL_9300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_INT_MULTITHREAD_9400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_INT_A_NORMAL_9500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_INT_A_MULTITHREAD_9600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_INT_V_NORMAL_9700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_INT_V_MULTITHREAD_9800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_LONG_NORMAL_9900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_LONG_MULTITHREAD_0100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_LONG_A_NORMAL_0200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_LONG_A_MULTITHREAD_0300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_LONG_V_NORMAL_0400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_LONG_V_MULTITHREAD_0500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_FLOAT_NORMAL_0600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_FLOAT_MULTITHREAD_0700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_FLOAT_A_NORMAL_0800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_FLOAT_A_MULTITHREAD_0900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_FLOAT_V_NORMAL_1000
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_FLOAT_V_MULTITHREAD_1100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_DOUBLE_NORMAL_1200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_DOUBLE_MULTITHREAD_1300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_DOUBLE_A_NORMAL_1400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_DOUBLE_A_MULTITHREAD_1500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_DOUBLE_V_NORMAL_1600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_DOUBLE_V_MULTITHREAD_1700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_REF_NORMAL_1800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_REF_MULTITHREAD_1900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_REF_A_NORMAL_2000
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_REF_A_MULTITHREAD_2100
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_REF_V_NORMAL_2200
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_REF_V_MULTITHREAD_2300
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_VOID_NORMAL_2400
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_VOID_MULTITHREAD_2500
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_VOID_A_NORMAL_2600
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_VOID_A_MULTITHREAD_2700
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_VOID_V_NORMAL_2800
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_CALLSTATICMETHODBYNAME_VOID_V_MULTITHREAD_2900
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_BOOLEAN_BOUNDARY_DEFAULTVALUE_3000
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
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_INT_BOUNDARY_MIN_3100
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
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_INT_BOUNDARY_MAX_3200
     * @tc.name      test_Class_GetStaticField_Int_Boundary_Max
     * @tc.desc      Verify test_Class_GetStaticField_Int_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Int_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Int_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_LONG_BOUNDARY_MIN_3300
     * @tc.name      test_Class_GetStaticField_Long_Boundary_Min
     * @tc.desc      Verify test_Class_GetStaticField_Long_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Long_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Long_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_LONG_BOUNDARY_MAX_3400
     * @tc.name      test_Class_GetStaticField_Long_Boundary_Max
     * @tc.desc      Verify test_Class_GetStaticField_Long_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Long_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Long_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_FLOAT_BOUNDARY_NAN_3500
     * @tc.name      test_Class_GetStaticField_Float_Boundary_NaN
     * @tc.desc      Verify test_Class_GetStaticField_Float_Boundary_NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Float_Boundary_NaN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Float_Boundary_NaN();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_FLOAT_BOUNDARY_INFINITY_3600
     * @tc.name      test_Class_GetStaticField_Float_Boundary_Infinity
     * @tc.desc      Verify test_Class_GetStaticField_Float_Boundary_Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Float_Boundary_Infinity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Float_Boundary_Infinity();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_DOUBLE_BOUNDARY_NAN_3700
     * @tc.name      test_Class_GetStaticField_Double_Boundary_NaN
     * @tc.desc      Verify test_Class_GetStaticField_Double_Boundary_NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Double_Boundary_NaN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Double_Boundary_NaN();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_DOUBLE_BOUNDARY_INFINITY_3800
     * @tc.name      test_Class_GetStaticField_Double_Boundary_Infinity
     * @tc.desc      Verify test_Class_GetStaticField_Double_Boundary_Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Double_Boundary_Infinity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Double_Boundary_Infinity();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_BOOLEAN_BOUNDARY_FALSE_3900
     * @tc.name      test_Class_GetStaticField_Boolean_Boundary_False
     * @tc.desc      Verify test_Class_GetStaticField_Boolean_Boundary_False
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Boolean_Boundary_False", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Boolean_Boundary_False();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_INT_BOUNDARY_MIN_4000
     * @tc.name      test_Class_SetStaticField_Int_Boundary_Min
     * @tc.desc      Verify test_Class_SetStaticField_Int_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Int_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Int_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_INT_BOUNDARY_MAX_4100
     * @tc.name      test_Class_SetStaticField_Int_Boundary_Max
     * @tc.desc      Verify test_Class_SetStaticField_Int_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Int_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Int_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_LONG_BOUNDARY_MIN_4200
     * @tc.name      test_Class_SetStaticField_Long_Boundary_Min
     * @tc.desc      Verify test_Class_SetStaticField_Long_Boundary_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Long_Boundary_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Long_Boundary_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_LONG_BOUNDARY_MAX_4300
     * @tc.name      test_Class_SetStaticField_Long_Boundary_Max
     * @tc.desc      Verify test_Class_SetStaticField_Long_Boundary_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Long_Boundary_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Long_Boundary_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_FLOAT_BOUNDARY_NAN_4400
     * @tc.name      test_Class_SetStaticField_Float_Boundary_NaN
     * @tc.desc      Verify test_Class_SetStaticField_Float_Boundary_NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Float_Boundary_NaN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Float_Boundary_NaN();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_DOUBLE_BOUNDARY_NAN_4500
     * @tc.name      test_Class_SetStaticField_Double_Boundary_NaN
     * @tc.desc      Verify test_Class_SetStaticField_Double_Boundary_NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Double_Boundary_NaN", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Double_Boundary_NaN();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_BOUNDARY_EMPTYNAME_4600
     * @tc.name      test_Class_FindField_Boundary_EmptyName
     * @tc.desc      Verify test_Class_FindField_Boundary_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindField_Boundary_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindField_Boundary_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_BOUNDARY_LONGNAME_4700
     * @tc.name      test_Class_FindField_Boundary_LongName
     * @tc.desc      Verify test_Class_FindField_Boundary_LongName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindField_Boundary_LongName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindField_Boundary_LongName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_BOUNDARY_NULLNAME_4800
     * @tc.name      test_Class_FindField_Boundary_NullName
     * @tc.desc      Verify test_Class_FindField_Boundary_NullName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindField_Boundary_NullName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindField_Boundary_NullName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_BOUNDARY_EMPTYNAME_4900
     * @tc.name      test_Class_FindMethod_Boundary_EmptyName
     * @tc.desc      Verify test_Class_FindMethod_Boundary_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindMethod_Boundary_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindMethod_Boundary_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_BOUNDARY_NULLSIG_5000
     * @tc.name      test_Class_FindMethod_Boundary_NullSig
     * @tc.desc      Verify test_Class_FindMethod_Boundary_NullSig
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindMethod_Boundary_NullSig", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindMethod_Boundary_NullSig();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_BOUNDARY_EMPTYSIG_5100
     * @tc.name      test_Class_FindMethod_Boundary_EmptySig
     * @tc.desc      Verify test_Class_FindMethod_Boundary_EmptySig
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindMethod_Boundary_EmptySig", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindMethod_Boundary_EmptySig();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_BOUNDARY_EMPTYNAME_5200
     * @tc.name      test_Class_FindStaticField_Boundary_EmptyName
     * @tc.desc      Verify test_Class_FindStaticField_Boundary_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticField_Boundary_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticField_Boundary_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_BOUNDARY_NULLNAME_5300
     * @tc.name      test_Class_FindStaticField_Boundary_NullName
     * @tc.desc      Verify test_Class_FindStaticField_Boundary_NullName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticField_Boundary_NullName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticField_Boundary_NullName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_BOUNDARY_EMPTYNAME_5400
     * @tc.name      test_Class_FindStaticMethod_Boundary_EmptyName
     * @tc.desc      Verify test_Class_FindStaticMethod_Boundary_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticMethod_Boundary_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethod_Boundary_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_BOUNDARY_NULLSIG_5500
     * @tc.name      test_Class_FindStaticMethod_Boundary_NullSig
     * @tc.desc      Verify test_Class_FindStaticMethod_Boundary_NullSig
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticMethod_Boundary_NullSig", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethod_Boundary_NullSig();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDNATIVEMETHODS_BOUNDARY_COUNTZERO_5600
     * @tc.name      test_Class_BindNativeMethods_Boundary_CountZero
     * @tc.desc      Verify test_Class_BindNativeMethods_Boundary_CountZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindNativeMethods_Boundary_CountZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindNativeMethods_Boundary_CountZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDNATIVEMETHODS_BOUNDARY_NULLMETHODS_5700
     * @tc.name      test_Class_BindNativeMethods_Boundary_NullMethods
     * @tc.desc      Verify test_Class_BindNativeMethods_Boundary_NullMethods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindNativeMethods_Boundary_NullMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindNativeMethods_Boundary_NullMethods();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDSTATICNATIVEMETHODS_BOUNDARY_COUNTZERO_5800
     * @tc.name      test_Class_BindStaticNativeMethods_Boundary_CountZero
     * @tc.desc      Verify test_Class_BindStaticNativeMethods_Boundary_CountZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindStaticNativeMethods_Boundary_CountZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindStaticNativeMethods_Boundary_CountZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDSTATICNATIVEMETHODS_BOUNDARY_NULLMETHODS_5900
     * @tc.name      test_Class_BindStaticNativeMethods_Boundary_NullMethods
     * @tc.desc      Verify test_Class_BindStaticNativeMethods_Boundary_NullMethods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindStaticNativeMethods_Boundary_NullMethods", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindStaticNativeMethods_Boundary_NullMethods();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_BOOLEAN_ABNORMAL_NULLCLS_6000
     * @tc.name      test_Class_GetStaticField_Boolean_Abnormal_NullCls
     * @tc.desc      Verify test_Class_GetStaticField_Boolean_Abnormal_NullCls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Boolean_Abnormal_NullCls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Boolean_Abnormal_NullCls();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_BOOLEAN_ABNORMAL_NULLCLS_6100
     * @tc.name      test_Class_SetStaticField_Boolean_Abnormal_NullCls
     * @tc.desc      Verify test_Class_SetStaticField_Boolean_Abnormal_NullCls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Boolean_Abnormal_NullCls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Boolean_Abnormal_NullCls();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDFIELD_ABNORMAL_NULLCLS_6200
     * @tc.name      test_Class_FindField_Abnormal_NullCls
     * @tc.desc      Verify test_Class_FindField_Abnormal_NullCls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindField_Abnormal_NullCls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindField_Abnormal_NullCls();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDMETHOD_ABNORMAL_NULLCLS_6300
     * @tc.name      test_Class_FindMethod_Abnormal_NullCls
     * @tc.desc      Verify test_Class_FindMethod_Abnormal_NullCls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindMethod_Abnormal_NullCls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindMethod_Abnormal_NullCls();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICFIELD_ABNORMAL_NULLCLS_6400
     * @tc.name      test_Class_FindStaticField_Abnormal_NullCls
     * @tc.desc      Verify test_Class_FindStaticField_Abnormal_NullCls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticField_Abnormal_NullCls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticField_Abnormal_NullCls();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_FINDSTATICMETHOD_ABNORMAL_NULLCLS_6500
     * @tc.name      test_Class_FindStaticMethod_Abnormal_NullCls
     * @tc.desc      Verify test_Class_FindStaticMethod_Abnormal_NullCls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_FindStaticMethod_Abnormal_NullCls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_FindStaticMethod_Abnormal_NullCls();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDNATIVEMETHODS_ABNORMAL_NULLCLS_6600
     * @tc.name      test_Class_BindNativeMethods_Abnormal_NullCls
     * @tc.desc      Verify test_Class_BindNativeMethods_Abnormal_NullCls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindNativeMethods_Abnormal_NullCls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindNativeMethods_Abnormal_NullCls();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_BINDSTATICNATIVEMETHODS_ABNORMAL_NULLCLS_6700
     * @tc.name      test_Class_BindStaticNativeMethods_Abnormal_NullCls
     * @tc.desc      Verify test_Class_BindStaticNativeMethods_Abnormal_NullCls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_BindStaticNativeMethods_Abnormal_NullCls", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_BindStaticNativeMethods_Abnormal_NullCls();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_GETSTATICFIELD_INT_ABNORMAL_NULLFIELD_6800
     * @tc.name      test_Class_GetStaticField_Int_Abnormal_NullField
     * @tc.desc      Verify test_Class_GetStaticField_Int_Abnormal_NullField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_GetStaticField_Int_Abnormal_NullField", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_GetStaticField_Int_Abnormal_NullField();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_CLASS_SETSTATICFIELD_INT_ABNORMAL_NULLFIELD_6900
     * @tc.name      test_Class_SetStaticField_Int_Abnormal_NullField
     * @tc.desc      Verify test_Class_SetStaticField_Int_Abnormal_NullField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Class_SetStaticField_Int_Abnormal_NullField", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Class_SetStaticField_Int_Abnormal_NullField();
      expect(result).assertEqual(1);
      done();
    });
  })
}
