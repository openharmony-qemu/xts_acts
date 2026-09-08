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

export default function extendedTestsPart5(): void {

  describe("ActsExtendedTestsPart5", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_BOOLEAN_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Boolean_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_BOOLEAN_A_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Boolean_A_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Boolean_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Boolean_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Boolean_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_BOOLEAN_V_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Boolean_V_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Boolean_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Boolean_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Boolean_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_BYTE_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Byte_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_BYTE_A_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Byte_A_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Byte_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Byte_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Byte_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_BYTE_V_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Byte_V_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Byte_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Byte_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Byte_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_CHAR_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Char_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_CHAR_A_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Char_A_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Char_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Char_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Char_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_CHAR_V_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Char_V_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Char_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Char_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Char_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_SHORT_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Short_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_SHORT_A_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Short_A_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Short_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Short_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Short_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_SHORT_V_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Short_V_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Short_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Short_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Short_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_INT_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Int_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_INT_A_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Int_A_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Int_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Int_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Int_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_INT_V_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Int_V_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Int_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Int_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Int_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_LONG_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Long_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_LONG_A_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Long_A_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Long_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Long_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Long_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_LONG_V_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Long_V_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Long_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Long_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Long_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_FLOAT_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Float_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_FLOAT_A_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Float_A_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Float_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Float_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Float_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_FLOAT_V_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Float_V_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Float_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Float_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Float_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_DOUBLE_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Double_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_DOUBLE_A_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Double_A_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Double_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Double_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Double_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_DOUBLE_V_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Double_V_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Double_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Double_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Double_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_REF_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Ref_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_REF_A_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Ref_A_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Ref_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Ref_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Ref_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_REF_V_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Ref_V_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Ref_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Ref_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Ref_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_VOID_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Void_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Void_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Void_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Void_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_VOID_A_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Void_A_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Void_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Void_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Void_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_OBJCALL_VOID_V_MULTITHREAD
     * @tc.name      test_FuncCall_ObjCall_Void_V_MultiThread
     * @tc.desc      Verify test_FuncCall_ObjCall_Void_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_ObjCall_Void_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_ObjCall_Void_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_BOOLEAN_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Boolean_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Boolean_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Boolean_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Boolean_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_BOOLEAN_A_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Boolean_A_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Boolean_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Boolean_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Boolean_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_BOOLEAN_V_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Boolean_V_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Boolean_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Boolean_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Boolean_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_BYTE_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Byte_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Byte_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Byte_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Byte_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_BYTE_A_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Byte_A_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Byte_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Byte_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Byte_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_BYTE_V_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Byte_V_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Byte_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Byte_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Byte_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_CHAR_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Char_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Char_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Char_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Char_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_CHAR_A_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Char_A_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Char_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Char_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Char_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_CHAR_V_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Char_V_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Char_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Char_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Char_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_SHORT_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Short_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Short_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Short_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Short_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_SHORT_A_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Short_A_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Short_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Short_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Short_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_SHORT_V_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Short_V_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Short_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Short_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Short_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_INT_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Int_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_INT_A_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Int_A_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Int_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Int_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Int_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_INT_V_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Int_V_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Int_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Int_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Int_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_LONG_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Long_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Long_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Long_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Long_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_LONG_A_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Long_A_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Long_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Long_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Long_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_LONG_V_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Long_V_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Long_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Long_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Long_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_FLOAT_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Float_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Float_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Float_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Float_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_FLOAT_A_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Float_A_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Float_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Float_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Float_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_FLOAT_V_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Float_V_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Float_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Float_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Float_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_DOUBLE_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Double_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Double_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Double_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Double_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_DOUBLE_A_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Double_A_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Double_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Double_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Double_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_DOUBLE_V_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Double_V_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Double_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Double_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Double_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_REF_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Ref_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Ref_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Ref_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Ref_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_REF_A_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Ref_A_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Ref_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Ref_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Ref_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_REF_V_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Ref_V_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Ref_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Ref_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Ref_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_VOID_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Void_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Void_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Void_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Void_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_VOID_A_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Void_A_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Void_A_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Void_A_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Void_A_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_VOID_V_MULTITHREAD
     * @tc.name      test_FuncCall_StaticCall_Void_V_MultiThread
     * @tc.desc      Verify test_FuncCall_StaticCall_Void_V_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Void_V_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Void_V_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number    SUB_TC_ANI_EXT_TEST_FUNCCALL_STATICCALL_COMBO
     * @tc.name      test_FuncCall_StaticCall_Combo
     * @tc.desc      Verify test_FuncCall_StaticCall_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncCall_StaticCall_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncCall_StaticCall_Combo();
      expect(result).assertEqual(1);
      done();
    });
  })
}
