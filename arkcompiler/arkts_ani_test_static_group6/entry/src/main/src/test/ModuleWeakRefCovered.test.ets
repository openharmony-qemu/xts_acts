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

export default function extendedTestsPart1(): void {

  describe("ActsExtendedTestsPart1", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FUNCOBJ_CALL_MULTITHREAD_0100
     * @tc.name      test_FuncObj_Call_MultiThread
     * @tc.desc      Verify test_FuncObj_Call_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncObj_Call_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncObj_Call_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FUNCOBJ_CALL_ARGCZERO_0200
     * @tc.name      test_FuncObj_Call_ArgcZero
     * @tc.desc      Verify test_FuncObj_Call_ArgcZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FuncObj_Call_ArgcZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FuncObj_Call_ArgcZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_PROMISE_RESOLVE_MULTITHREAD_0300
     * @tc.name      test_Promise_Resolve_MultiThread
     * @tc.desc      Verify test_Promise_Resolve_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Promise_Resolve_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Promise_Resolve_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_PROMISE_REJECT_MULTITHREAD_0400
     * @tc.name      test_Promise_Reject_MultiThread
     * @tc.desc      Verify test_Promise_Reject_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Promise_Reject_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Promise_Reject_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_PROMISE_RESOLVE_TWICE_0500
     * @tc.name      test_Promise_Resolve_Twice
     * @tc.desc      Verify test_Promise_Resolve_Twice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Promise_Resolve_Twice", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Promise_Resolve_Twice();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_PROMISE_REJECT_AFTER_RESOLVE_0600
     * @tc.name      test_Promise_Reject_After_Resolve
     * @tc.desc      Verify test_Promise_Reject_After_Resolve
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Promise_Reject_After_Resolve", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Promise_Reject_After_Resolve();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_PROMISE_REJECT_TWICE_0700
     * @tc.name      test_Promise_Reject_Twice
     * @tc.desc      Verify test_Promise_Reject_Twice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Promise_Reject_Twice", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Promise_Reject_Twice();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GLOBALREF_DELETE_MULTITHREAD_0800
     * @tc.name      test_GlobalRef_Delete_MultiThread
     * @tc.desc      Verify test_GlobalRef_Delete_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalRef_Delete_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GlobalRef_Delete_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GLOBALREF_DELETE_COMBO_0900
     * @tc.name      test_GlobalRef_Delete_Combo
     * @tc.desc      Verify test_GlobalRef_Delete_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalRef_Delete_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GlobalRef_Delete_Combo();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GLOBALREF_CREATE_LIMIT_1000
     * @tc.name      test_GlobalRef_Create_Limit
     * @tc.desc      Verify test_GlobalRef_Create_Limit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalRef_Create_Limit", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GlobalRef_Create_Limit();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GLOBALREF_CREATE_DUPLICATE_1100
     * @tc.name      test_GlobalRef_Create_Duplicate
     * @tc.desc      Verify test_GlobalRef_Create_Duplicate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalRef_Create_Duplicate", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GlobalRef_Create_Duplicate();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GLOBALREF_DELETE_TWICE_1200
     * @tc.name      test_GlobalRef_Delete_Twice
     * @tc.desc      Verify test_GlobalRef_Delete_Twice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalRef_Delete_Twice", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GlobalRef_Delete_Twice();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAYBUFFER_ABNORMAL_1300
     * @tc.name      test_ArrayBuffer_Abnormal
     * @tc.desc      Verify test_ArrayBuffer_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayBuffer_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ArrayBuffer_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAYBUFFER_MULTITHREAD_1400
     * @tc.name      test_ArrayBuffer_MultiThread
     * @tc.desc      Verify test_ArrayBuffer_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayBuffer_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ArrayBuffer_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAYBUFFER_GETINFO_ABNORMAL_1500
     * @tc.name      test_ArrayBuffer_GetInfo_Abnormal
     * @tc.desc      Verify test_ArrayBuffer_GetInfo_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayBuffer_GetInfo_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ArrayBuffer_GetInfo_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAYBUFFER_SIZEZERO_1600
     * @tc.name      test_ArrayBuffer_SizeZero
     * @tc.desc      Verify test_ArrayBuffer_SizeZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayBuffer_SizeZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ArrayBuffer_SizeZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAYBUFFER_GETINFO_ZEROLENGTH_1700
     * @tc.name      test_ArrayBuffer_GetInfo_ZeroLength
     * @tc.desc      Verify test_ArrayBuffer_GetInfo_ZeroLength
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayBuffer_GetInfo_ZeroLength", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ArrayBuffer_GetInfo_ZeroLength();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_NAMESPACE_FINDFUNCTION_ABNORMAL_1800
     * @tc.name      test_Namespace_FindFunction_Abnormal
     * @tc.desc      Verify test_Namespace_FindFunction_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_FindFunction_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Namespace_FindFunction_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_NAMESPACE_FINDFUNCTION_MULTITHREAD_1900
     * @tc.name      test_Namespace_FindFunction_MultiThread
     * @tc.desc      Verify test_Namespace_FindFunction_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_FindFunction_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Namespace_FindFunction_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_NAMESPACE_FINDVARIABLE_MULTITHREAD_2000
     * @tc.name      test_Namespace_FindVariable_MultiThread
     * @tc.desc      Verify test_Namespace_FindVariable_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_FindVariable_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Namespace_FindVariable_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_NAMESPACE_BINDNATIVEFUNCTIONS_MULTITHREAD_2100
     * @tc.name      test_Namespace_BindNativeFunctions_MultiThread
     * @tc.desc      Verify test_Namespace_BindNativeFunctions_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_BindNativeFunctions_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Namespace_BindNativeFunctions_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_NAMESPACE_BIND_COUNTZERO_2200
     * @tc.name      test_Namespace_Bind_CountZero
     * @tc.desc      Verify test_Namespace_Bind_CountZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_Bind_CountZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Namespace_Bind_CountZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_NAMESPACE_FINDFUNCTION_EMPTYNAME_2300
     * @tc.name      test_Namespace_FindFunction_EmptyName
     * @tc.desc      Verify test_Namespace_FindFunction_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Namespace_FindFunction_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Namespace_FindFunction_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TYPE_GETSUPERCLASS_MULTITHREAD_2400
     * @tc.name      test_Type_GetSuperClass_MultiThread
     * @tc.desc      Verify test_Type_GetSuperClass_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Type_GetSuperClass_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Type_GetSuperClass_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TYPE_ISASSIGNABLEFROM_NORMAL_2500
     * @tc.name      test_Type_IsAssignableFrom_Normal
     * @tc.desc      Verify test_Type_IsAssignableFrom_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Type_IsAssignableFrom_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Type_IsAssignableFrom_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TYPE_ISASSIGNABLEFROM_ABNORMAL_2600
     * @tc.name      test_Type_IsAssignableFrom_Abnormal
     * @tc.desc      Verify test_Type_IsAssignableFrom_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Type_IsAssignableFrom_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Type_IsAssignableFrom_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TYPE_ISASSIGNABLEFROM_MULTITHREAD_2700
     * @tc.name      test_Type_IsAssignableFrom_MultiThread
     * @tc.desc      Verify test_Type_IsAssignableFrom_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Type_IsAssignableFrom_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Type_IsAssignableFrom_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TYPE_ISASSIGNABLEFROM_SELF_2800
     * @tc.name      test_Type_IsAssignableFrom_Self
     * @tc.desc      Verify test_Type_IsAssignableFrom_Self
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Type_IsAssignableFrom_Self", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Type_IsAssignableFrom_Self();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TYPE_ISASSIGNABLEFROM_UNRELATED_2900
     * @tc.name      test_Type_IsAssignableFrom_Unrelated
     * @tc.desc      Verify test_Type_IsAssignableFrom_Unrelated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Type_IsAssignableFrom_Unrelated", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Type_IsAssignableFrom_Unrelated();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_TYPE_GETSUPERCLASS_TOPLEVEL_3000
     * @tc.name      test_Type_GetSuperClass_TopLevel
     * @tc.desc      Verify test_Type_GetSuperClass_TopLevel
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Type_GetSuperClass_TopLevel", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Type_GetSuperClass_TopLevel();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUM_GETITEMBYNAME_MULTITHREAD_3100
     * @tc.name      test_Enum_GetItemByName_MultiThread
     * @tc.desc      Verify test_Enum_GetItemByName_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Enum_GetItemByName_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Enum_GetItemByName_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUM_GETITEMBYINDEX_MULTITHREAD_3200
     * @tc.name      test_Enum_GetItemByIndex_MultiThread
     * @tc.desc      Verify test_Enum_GetItemByIndex_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Enum_GetItemByIndex_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Enum_GetItemByIndex_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUM_GETITEMBYINDEX_OUTOFRANGE_3300
     * @tc.name      test_Enum_GetItemByIndex_OutOfRange
     * @tc.desc      Verify test_Enum_GetItemByIndex_OutOfRange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Enum_GetItemByIndex_OutOfRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Enum_GetItemByIndex_OutOfRange();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETINDEX_BOUNDARY_3400
     * @tc.name      test_EnumItem_GetIndex_Boundary
     * @tc.desc      Verify test_EnumItem_GetIndex_Boundary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetIndex_Boundary", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetIndex_Boundary();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETVALUE_INT_MIN_3500
     * @tc.name      test_EnumItem_GetValue_Int_Min
     * @tc.desc      Verify test_EnumItem_GetValue_Int_Min
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetValue_Int_Min", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetValue_Int_Min();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETVALUE_INT_MAX_3600
     * @tc.name      test_EnumItem_GetValue_Int_Max
     * @tc.desc      Verify test_EnumItem_GetValue_Int_Max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetValue_Int_Max", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetValue_Int_Max();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETVALUE_STRING_EMPTY_3700
     * @tc.name      test_EnumItem_GetValue_String_Empty
     * @tc.desc      Verify test_EnumItem_GetValue_String_Empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetValue_String_Empty", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetValue_String_Empty();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GETVERSION_MULTITHREAD_3800
     * @tc.name      test_GetVersion_MultiThread
     * @tc.desc      Verify test_GetVersion_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetVersion_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GetVersion_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GETVM_NORMAL_3900
     * @tc.name      test_GetVM_Normal
     * @tc.desc      Verify test_GetVM_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetVM_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GetVM_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GETVM_ABNORMAL_4000
     * @tc.name      test_GetVM_Abnormal
     * @tc.desc      Verify test_GetVM_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetVM_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GetVM_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GETVM_MULTITHREAD_4100
     * @tc.name      test_GetVM_MultiThread
     * @tc.desc      Verify test_GetVM_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetVM_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GetVM_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GETNULL_NORMAL_4200
     * @tc.name      test_GetNull_Normal
     * @tc.desc      Verify test_GetNull_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetNull_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GetNull_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GETNULL_MULTITHREAD_4300
     * @tc.name      test_GetNull_MultiThread
     * @tc.desc      Verify test_GetNull_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetNull_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GetNull_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GETUNDEFINED_ABNORMAL_4400
     * @tc.name      test_GetUndefined_Abnormal
     * @tc.desc      Verify test_GetUndefined_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetUndefined_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GetUndefined_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_GETUNDEFINED_MULTITHREAD_4500
     * @tc.name      test_GetUndefined_MultiThread
     * @tc.desc      Verify test_GetUndefined_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetUndefined_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_GetUndefined_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_MODULE_FINDFUNCTION_MULTITHREAD_4600
     * @tc.name      test_Module_FindFunction_MultiThread
     * @tc.desc      Verify test_Module_FindFunction_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Module_FindFunction_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Module_FindFunction_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_MODULE_FINDVARIABLE_MULTITHREAD_4700
     * @tc.name      test_Module_FindVariable_MultiThread
     * @tc.desc      Verify test_Module_FindVariable_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Module_FindVariable_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Module_FindVariable_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_MODULE_BINDNATIVEFUNCTIONS_ABNORMAL_4800
     * @tc.name      test_Module_BindNativeFunctions_Abnormal
     * @tc.desc      Verify test_Module_BindNativeFunctions_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Module_BindNativeFunctions_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Module_BindNativeFunctions_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_MODULE_BINDNATIVEFUNCTIONS_MULTITHREAD_4900
     * @tc.name      test_Module_BindNativeFunctions_MultiThread
     * @tc.desc      Verify test_Module_BindNativeFunctions_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Module_BindNativeFunctions_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Module_BindNativeFunctions_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_MODULE_BIND_COUNTZERO_5000
     * @tc.name      test_Module_Bind_CountZero
     * @tc.desc      Verify test_Module_Bind_CountZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Module_Bind_CountZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Module_Bind_CountZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_MODULE_FINDFUNCTION_EMPTYNAME_5100
     * @tc.name      test_Module_FindFunction_EmptyName
     * @tc.desc      Verify test_Module_FindFunction_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Module_FindFunction_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Module_FindFunction_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_MODULE_FINDFUNCTION_EMPTYSIG_5200
     * @tc.name      test_Module_FindFunction_EmptySig
     * @tc.desc      Verify test_Module_FindFunction_EmptySig
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Module_FindFunction_EmptySig", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Module_FindFunction_EmptySig();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_MODULE_FINDVARIABLE_EMPTYNAME_5300
     * @tc.name      test_Module_FindVariable_EmptyName
     * @tc.desc      Verify test_Module_FindVariable_EmptyName
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Module_FindVariable_EmptyName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Module_FindVariable_EmptyName();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETENUM_MULTITHREAD_5400
     * @tc.name      test_EnumItem_GetEnum_MultiThread
     * @tc.desc      Verify test_EnumItem_GetEnum_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetEnum_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetEnum_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETVALUE_INT_ABNORMAL_5500
     * @tc.name      test_EnumItem_GetValue_Int_Abnormal
     * @tc.desc      Verify test_EnumItem_GetValue_Int_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetValue_Int_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetValue_Int_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETVALUE_INT_MULTITHREAD_5600
     * @tc.name      test_EnumItem_GetValue_Int_MultiThread
     * @tc.desc      Verify test_EnumItem_GetValue_Int_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetValue_Int_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetValue_Int_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETVALUE_STRING_ABNORMAL_5700
     * @tc.name      test_EnumItem_GetValue_String_Abnormal
     * @tc.desc      Verify test_EnumItem_GetValue_String_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetValue_String_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetValue_String_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETVALUE_STRING_MULTITHREAD_5800
     * @tc.name      test_EnumItem_GetValue_String_MultiThread
     * @tc.desc      Verify test_EnumItem_GetValue_String_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetValue_String_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetValue_String_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETNAME_ABNORMAL_5900
     * @tc.name      test_EnumItem_GetName_Abnormal
     * @tc.desc      Verify test_EnumItem_GetName_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetName_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetName_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETNAME_MULTITHREAD_6000
     * @tc.name      test_EnumItem_GetName_MultiThread
     * @tc.desc      Verify test_EnumItem_GetName_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetName_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetName_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETINDEX_ABNORMAL_6100
     * @tc.name      test_EnumItem_GetIndex_Abnormal
     * @tc.desc      Verify test_EnumItem_GetIndex_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetIndex_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetIndex_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENUMITEM_GETINDEX_MULTITHREAD_6200
     * @tc.name      test_EnumItem_GetIndex_MultiThread
     * @tc.desc      Verify test_EnumItem_GetIndex_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnumItem_GetIndex_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnumItem_GetIndex_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_WEAKREF_CREATE_MULTITHREAD_6300
     * @tc.name      test_WeakRef_Create_MultiThread
     * @tc.desc      Verify test_WeakRef_Create_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakRef_Create_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_WeakRef_Create_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_WEAKREF_CREATE_COMBO_6400
     * @tc.name      test_WeakRef_Create_Combo
     * @tc.desc      Verify test_WeakRef_Create_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakRef_Create_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_WeakRef_Create_Combo();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_WEAKREF_DELETE_NORMAL_6500
     * @tc.name      test_WeakRef_Delete_Normal
     * @tc.desc      Verify test_WeakRef_Delete_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakRef_Delete_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_WeakRef_Delete_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_WEAKREF_DELETE_ABNORMAL_6600
     * @tc.name      test_WeakRef_Delete_Abnormal
     * @tc.desc      Verify test_WeakRef_Delete_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakRef_Delete_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_WeakRef_Delete_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_WEAKREF_DELETE_MULTITHREAD_6700
     * @tc.name      test_WeakRef_Delete_MultiThread
     * @tc.desc      Verify test_WeakRef_Delete_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakRef_Delete_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_WeakRef_Delete_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_WEAKREF_DELETE_COMBO_6800
     * @tc.name      test_WeakRef_Delete_Combo
     * @tc.desc      Verify test_WeakRef_Delete_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakRef_Delete_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_WeakRef_Delete_Combo();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_WEAKREF_GETREFERENCE_MULTITHREAD_6900
     * @tc.name      test_WeakRef_GetReference_MultiThread
     * @tc.desc      Verify test_WeakRef_GetReference_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakRef_GetReference_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_WeakRef_GetReference_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_WEAKREF_GETREFERENCE_COMBO_7000
     * @tc.name      test_WeakRef_GetReference_Combo
     * @tc.desc      Verify test_WeakRef_GetReference_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakRef_GetReference_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_WeakRef_GetReference_Combo();
      expect(result).assertEqual(1);
      done();
    });
  })
}
