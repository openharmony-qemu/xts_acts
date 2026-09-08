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

export default function extendedTestsPart2(): void {

  describe("ActsExtendedTestsPart2", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
@tc.number    SUB_TC_ANI_EXT_TEST_WEAKREF_CREATE_NULLREF_0100
     * @tc.name      test_WeakRef_Create_NullRef
     * @tc.desc      Verify test_WeakRef_Create_NullRef
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakRef_Create_NullRef", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_WeakRef_Create_NullRef();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_WEAKREF_DELETE_TWICE_0200
     * @tc.name      test_WeakRef_Delete_Twice
     * @tc.desc      Verify test_WeakRef_Delete_Twice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakRef_Delete_Twice", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_WeakRef_Delete_Twice();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_WEAKREF_GETREFERENCE_AFTERGC_0300
     * @tc.name      test_WeakRef_GetReference_AfterGC
     * @tc.desc      Verify test_WeakRef_GetReference_AfterGC
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WeakRef_GetReference_AfterGC", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_WeakRef_GetReference_AfterGC();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDMODULE_NORMAL_0400
     * @tc.name      test_FindModule_Normal
     * @tc.desc      Verify test_FindModule_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindModule_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindModule_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDMODULE_ABNORMAL_0500
     * @tc.name      test_FindModule_Abnormal
     * @tc.desc      Verify test_FindModule_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindModule_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindModule_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDMODULE_MULTITHREAD_0600
     * @tc.name      test_FindModule_MultiThread
     * @tc.desc      Verify test_FindModule_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindModule_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindModule_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDNAMESPACE_ABNORMAL_0700
     * @tc.name      test_FindNamespace_Abnormal
     * @tc.desc      Verify test_FindNamespace_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindNamespace_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindNamespace_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDNAMESPACE_MULTITHREAD_0800
     * @tc.name      test_FindNamespace_MultiThread
     * @tc.desc      Verify test_FindNamespace_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindNamespace_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindNamespace_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDCLASS_MULTITHREAD_0900
     * @tc.name      test_FindClass_MultiThread
     * @tc.desc      Verify test_FindClass_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindClass_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindClass_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDENUM_MULTITHREAD_1000
     * @tc.name      test_FindEnum_MultiThread
     * @tc.desc      Verify test_FindEnum_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindEnum_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindEnum_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDCLASS_EMPTYDESC_1100
     * @tc.name      test_FindClass_EmptyDesc
     * @tc.desc      Verify test_FindClass_EmptyDesc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindClass_EmptyDesc", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindClass_EmptyDesc();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDMODULE_EMPTYDESC_1200
     * @tc.name      test_FindModule_EmptyDesc
     * @tc.desc      Verify test_FindModule_EmptyDesc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindModule_EmptyDesc", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindModule_EmptyDesc();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDNAMESPACE_EMPTYDESC_1300
     * @tc.name      test_FindNamespace_EmptyDesc
     * @tc.desc      Verify test_FindNamespace_EmptyDesc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindNamespace_EmptyDesc", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindNamespace_EmptyDesc();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDENUM_EMPTYDESC_1400
     * @tc.name      test_FindEnum_EmptyDesc
     * @tc.desc      Verify test_FindEnum_EmptyDesc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindEnum_EmptyDesc", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindEnum_EmptyDesc();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDCLASS_LONGDESC_1500
     * @tc.name      test_FindClass_LongDesc
     * @tc.desc      Verify test_FindClass_LongDesc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindClass_LongDesc", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindClass_LongDesc();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_FINDMODULE_LONGDESC_1600
     * @tc.name      test_FindModule_LongDesc
     * @tc.desc      Verify test_FindModule_LongDesc
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindModule_LongDesc", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_FindModule_LongDesc();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_GETLENGTH_ABNORMAL_1700
     * @tc.name      test_Array_GetLength_Abnormal
     * @tc.desc      Verify test_Array_GetLength_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_GetLength_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_GetLength_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_GETLENGTH_MULTITHREAD_1800
     * @tc.name      test_Array_GetLength_MultiThread
     * @tc.desc      Verify test_Array_GetLength_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_GetLength_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_GetLength_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_NEW_MULTITHREAD_1900
     * @tc.name      test_Array_New_MultiThread
     * @tc.desc      Verify test_Array_New_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_New_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_New_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_SET_NORMAL_2000
     * @tc.name      test_Array_Set_Normal
     * @tc.desc      Verify test_Array_Set_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Set_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_Set_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_SET_ABNORMAL_2100
     * @tc.name      test_Array_Set_Abnormal
     * @tc.desc      Verify test_Array_Set_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Set_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_Set_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_SET_MULTITHREAD_2200
     * @tc.name      test_Array_Set_MultiThread
     * @tc.desc      Verify test_Array_Set_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Set_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_Set_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_GET_MULTITHREAD_2300
     * @tc.name      test_Array_Get_MultiThread
     * @tc.desc      Verify test_Array_Get_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Get_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_Get_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_PUSH_ABNORMAL_2400
     * @tc.name      test_Array_Push_Abnormal
     * @tc.desc      Verify test_Array_Push_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Push_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_Push_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_PUSH_MULTITHREAD_2500
     * @tc.name      test_Array_Push_MultiThread
     * @tc.desc      Verify test_Array_Push_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Push_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_Push_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_POP_ABNORMAL_2600
     * @tc.name      test_Array_Pop_Abnormal
     * @tc.desc      Verify test_Array_Pop_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Pop_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_Pop_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_POP_MULTITHREAD_2700
     * @tc.name      test_Array_Pop_MultiThread
     * @tc.desc      Verify test_Array_Pop_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Pop_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_Pop_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_NEW_LENGTHZERO_2800
     * @tc.name      test_Array_New_LengthZero
     * @tc.desc      Verify test_Array_New_LengthZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_New_LengthZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_New_LengthZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_GET_OUTOFRANGE_2900
     * @tc.name      test_Array_Get_OutOfRange
     * @tc.desc      Verify test_Array_Get_OutOfRange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Get_OutOfRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_Get_OutOfRange();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_GET_FIRSTELEMENT_3000
     * @tc.name      test_Array_Get_FirstElement
     * @tc.desc      Verify test_Array_Get_FirstElement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Get_FirstElement", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_Get_FirstElement();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_SET_OUTOFRANGE_3100
     * @tc.name      test_Array_Set_OutOfRange
     * @tc.desc      Verify test_Array_Set_OutOfRange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Set_OutOfRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_Set_OutOfRange();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ARRAY_POP_EMPTY_3200
     * @tc.name      test_Array_Pop_Empty
     * @tc.desc      Verify test_Array_Pop_Empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Array_Pop_Empty", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Array_Pop_Empty();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_DELETE_MULTITHREAD_3300
     * @tc.name      test_Reference_Delete_MultiThread
     * @tc.desc      Verify test_Reference_Delete_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_Delete_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_Delete_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_DELETE_COMBO_3400
     * @tc.name      test_Reference_Delete_Combo
     * @tc.desc      Verify test_Reference_Delete_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_Delete_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_Delete_Combo();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_ISNULL_NORMAL_3500
     * @tc.name      test_Reference_IsNull_Normal
     * @tc.desc      Verify test_Reference_IsNull_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_IsNull_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_IsNull_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_ISNULL_MULTITHREAD_3600
     * @tc.name      test_Reference_IsNull_MultiThread
     * @tc.desc      Verify test_Reference_IsNull_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_IsNull_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_IsNull_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_ISUNDEFINED_ABNORMAL_3700
     * @tc.name      test_Reference_IsUndefined_Abnormal
     * @tc.desc      Verify test_Reference_IsUndefined_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_IsUndefined_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_IsUndefined_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_ISUNDEFINED_MULTITHREAD_3800
     * @tc.name      test_Reference_IsUndefined_MultiThread
     * @tc.desc      Verify test_Reference_IsUndefined_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_IsUndefined_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_IsUndefined_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_ISNULLISHVALUE_NORMAL_3900
     * @tc.name      test_Reference_IsNullishValue_Normal
     * @tc.desc      Verify test_Reference_IsNullishValue_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_IsNullishValue_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_IsNullishValue_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_ISNULLISHVALUE_MULTITHREAD_4000
     * @tc.name      test_Reference_IsNullishValue_MultiThread
     * @tc.desc      Verify test_Reference_IsNullishValue_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_IsNullishValue_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_IsNullishValue_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_EQUALS_ABNORMAL_4100
     * @tc.name      test_Reference_Equals_Abnormal
     * @tc.desc      Verify test_Reference_Equals_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_Equals_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_Equals_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_EQUALS_MULTITHREAD_4200
     * @tc.name      test_Reference_Equals_MultiThread
     * @tc.desc      Verify test_Reference_Equals_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_Equals_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_Equals_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_STRICTEQUALS_MULTITHREAD_4300
     * @tc.name      test_Reference_StrictEquals_MultiThread
     * @tc.desc      Verify test_Reference_StrictEquals_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_StrictEquals_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_StrictEquals_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_DELETE_TWICE_4400
     * @tc.name      test_Reference_Delete_Twice
     * @tc.desc      Verify test_Reference_Delete_Twice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_Delete_Twice", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_Delete_Twice();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_DELETE_AFTERSCOPEDESTROY_4500
     * @tc.name      test_Reference_Delete_AfterScopeDestroy
     * @tc.desc      Verify test_Reference_Delete_AfterScopeDestroy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_Delete_AfterScopeDestroy", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_Delete_AfterScopeDestroy();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_EQUALS_BOTHNULL_4600
     * @tc.name      test_Reference_Equals_BothNull
     * @tc.desc      Verify test_Reference_Equals_BothNull
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_Equals_BothNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_Equals_BothNull();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_EQUALS_NULLVSUNDEFINED_4700
     * @tc.name      test_Reference_Equals_NullVsUndefined
     * @tc.desc      Verify test_Reference_Equals_NullVsUndefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_Equals_NullVsUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_Equals_NullVsUndefined();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_STRICTEQUALS_BOTHNULL_4800
     * @tc.name      test_Reference_StrictEquals_BothNull
     * @tc.desc      Verify test_Reference_StrictEquals_BothNull
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_StrictEquals_BothNull", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_StrictEquals_BothNull();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_REFERENCE_STRICTEQUALS_NULLVSUNDEFINED_4900
     * @tc.name      test_Reference_StrictEquals_NullVsUndefined
     * @tc.desc      Verify test_Reference_StrictEquals_NullVsUndefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Reference_StrictEquals_NullVsUndefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_Reference_StrictEquals_NullVsUndefined();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENSUREENOUGHREFS_MULTITHREAD_5000
     * @tc.name      test_EnsureEnoughRefs_MultiThread
     * @tc.desc      Verify test_EnsureEnoughRefs_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnsureEnoughRefs_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnsureEnoughRefs_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENSUREENOUGHREFS_COMBO_5100
     * @tc.name      test_EnsureEnoughRefs_Combo
     * @tc.desc      Verify test_EnsureEnoughRefs_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnsureEnoughRefs_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnsureEnoughRefs_Combo();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_CREATELOCALSCOPE_MULTITHREAD_5200
     * @tc.name      test_CreateLocalScope_MultiThread
     * @tc.desc      Verify test_CreateLocalScope_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateLocalScope_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_CreateLocalScope_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_CREATELOCALSCOPE_COMBO_5300
     * @tc.name      test_CreateLocalScope_Combo
     * @tc.desc      Verify test_CreateLocalScope_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateLocalScope_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_CreateLocalScope_Combo();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_DESTROYLOCALSCOPE_NORMAL_5400
     * @tc.name      test_DestroyLocalScope_Normal
     * @tc.desc      Verify test_DestroyLocalScope_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DestroyLocalScope_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DestroyLocalScope_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_DESTROYLOCALSCOPE_MULTITHREAD_5500
     * @tc.name      test_DestroyLocalScope_MultiThread
     * @tc.desc      Verify test_DestroyLocalScope_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DestroyLocalScope_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DestroyLocalScope_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_DESTROYLOCALSCOPE_COMBO_5600
     * @tc.name      test_DestroyLocalScope_Combo
     * @tc.desc      Verify test_DestroyLocalScope_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DestroyLocalScope_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DestroyLocalScope_Combo();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_CREATEESCAPELOCALSCOPE_MULTITHREAD_5700
     * @tc.name      test_CreateEscapeLocalScope_MultiThread
     * @tc.desc      Verify test_CreateEscapeLocalScope_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateEscapeLocalScope_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_CreateEscapeLocalScope_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_DESTROYESCAPELOCALSCOPE_NORMAL_5800
     * @tc.name      test_DestroyEscapeLocalScope_Normal
     * @tc.desc      Verify test_DestroyEscapeLocalScope_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DestroyEscapeLocalScope_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DestroyEscapeLocalScope_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_DESTROYESCAPELOCALSCOPE_ABNORMAL_5900
     * @tc.name      test_DestroyEscapeLocalScope_Abnormal
     * @tc.desc      Verify test_DestroyEscapeLocalScope_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DestroyEscapeLocalScope_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DestroyEscapeLocalScope_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_DESTROYESCAPELOCALSCOPE_MULTITHREAD_6000
     * @tc.name      test_DestroyEscapeLocalScope_MultiThread
     * @tc.desc      Verify test_DestroyEscapeLocalScope_MultiThread
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DestroyEscapeLocalScope_MultiThread", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DestroyEscapeLocalScope_MultiThread();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_DESTROYESCAPELOCALSCOPE_COMBO_6100
     * @tc.name      test_DestroyEscapeLocalScope_Combo
     * @tc.desc      Verify test_DestroyEscapeLocalScope_Combo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DestroyEscapeLocalScope_Combo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DestroyEscapeLocalScope_Combo();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_CREATELOCALSCOPE_REFZERO_6200
     * @tc.name      test_CreateLocalScope_RefZero
     * @tc.desc      Verify test_CreateLocalScope_RefZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateLocalScope_RefZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_CreateLocalScope_RefZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENSUREENOUGHREFS_REFZERO_6300
     * @tc.name      test_EnsureEnoughRefs_RefZero
     * @tc.desc      Verify test_EnsureEnoughRefs_RefZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnsureEnoughRefs_RefZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnsureEnoughRefs_RefZero();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENSUREENOUGHREFS_REFMAX_6400
     * @tc.name      test_EnsureEnoughRefs_RefMax
     * @tc.desc      Verify test_EnsureEnoughRefs_RefMax
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnsureEnoughRefs_RefMax", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnsureEnoughRefs_RefMax();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_ENSUREENOUGHREFS_EXCEEDCAPACITY_6500
     * @tc.name      test_EnsureEnoughRefs_ExceedCapacity
     * @tc.desc      Verify test_EnsureEnoughRefs_ExceedCapacity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_EnsureEnoughRefs_ExceedCapacity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_EnsureEnoughRefs_ExceedCapacity();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_CREATELOCALSCOPE_NESTEDDEEP_6600
     * @tc.name      test_CreateLocalScope_NestedDeep
     * @tc.desc      Verify test_CreateLocalScope_NestedDeep
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateLocalScope_NestedDeep", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_CreateLocalScope_NestedDeep();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_DESTROYLOCALSCOPE_NOSCOPE_6700
     * @tc.name      test_DestroyLocalScope_NoScope
     * @tc.desc      Verify test_DestroyLocalScope_NoScope
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DestroyLocalScope_NoScope", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DestroyLocalScope_NoScope();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_DESTROYESCAPELOCALSCOPE_NOSCOPE_6800
     * @tc.name      test_DestroyEscapeLocalScope_NoScope
     * @tc.desc      Verify test_DestroyEscapeLocalScope_NoScope
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DestroyEscapeLocalScope_NoScope", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_DestroyEscapeLocalScope_NoScope();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_THROWERROR_NORMAL_6900
     * @tc.name      test_ThrowError_Normal
     * @tc.desc      Verify test_ThrowError_Normal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ThrowError_Normal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ThrowError_Normal();
      expect(result).assertEqual(1);
      done();
    });
    /**
@tc.number    SUB_TC_ANI_EXT_TEST_THROWERROR_ABNORMAL_7000
     * @tc.name      test_ThrowError_Abnormal
     * @tc.desc      Verify test_ThrowError_Abnormal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ThrowError_Abnormal", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let cls = new Foo();
      let result = cls.test_ThrowError_Abnormal();
      expect(result).assertEqual(1);
      done();
    });
  })
}
