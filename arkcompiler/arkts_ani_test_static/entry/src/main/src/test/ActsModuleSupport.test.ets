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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function moduleSupportTest() {

  describe("ActsModuleSupportTest", (): void => {
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number     SUB_ANI_MODULE_FINDFUNCTION_0100
     * @tc.name       test_Module_FindFunction_0001
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_FindFunction_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_FindFunction_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_FindFunction();
        expect(result).assertTrue();
        console.log('test_Module_FindFunction_0001 done');
        done();
        console.log('test_Module_FindFunction_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FINDVARABLE_0100
     * @tc.name       test_Module_FindVariable_0001
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_FindVariable_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_FindVariable_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_FindVariable();
        expect(result).assertTrue();
        console.log('test_Module_FindVariable_0001 done');
        done();
        console.log('test_Module_FindVariable_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FINDCLASS_0100
     * @tc.name       test_Module_FindClass_0001
     * @tc.desc       find class
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_FindClass_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_FindClass_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_FindClass();
        expect(result).assertTrue();
        console.log('test_Module_FindClass_0001 done');
        done();
        console.log('test_Module_FindClass_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FINDINTERFACE_0100
     * @tc.name       test_Module_FindInterface_0001
     * @tc.desc       find interface
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_FindInterface_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_FindInterface_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_FindInterface();
        expect(result).assertTrue();
        console.log('test_Module_FindInterface_0001 done');
        done();
        console.log('test_Module_FindInterface_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FINDABSTARCTCLASS_0100
     * @tc.name       test_Module_FindAbstractClass_0001
     * @tc.desc       find abstract class
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_FindAbstractClass_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_FindAbstractClass_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_FindAbstractClass();
        expect(result).assertTrue();
        console.log('test_Module_FindAbstractClass_0001 done');
        done();
        console.log('test_Module_FindAbstractClass_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FINDFINALCLASS_0100
     * @tc.name       test_Module_FindFinalClass_0001
     * @tc.desc       find final class
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_FindFinalClass_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_FindFinalClass_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_FindFinalClass();
        expect(result).assertTrue();
        console.log('test_Module_FindFinalClass_0001 done');
        done();
        console.log('test_Module_FindFinalClass_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_INVALID_ARG_CLASS_0100
     * @tc.name       test_Module_invalid_Arg_Class_0001
     * @tc.desc       test invalid arg class
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_invalid_Arg_Class_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_invalid_Arg_Class_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_invalid_Arg_Class();
        expect(result).assertTrue();
        console.log('test_Module_invalid_Arg_Class_0001 done');
        done();
        console.log('test_Module_invalid_Arg_Class_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_INVALID_ARG_RESULT_0100
     * @tc.name       test_Module_Invalid_Arg_Result_0001
     * @tc.desc       invalid arg result
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Invalid_Arg_Result_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Invalid_Arg_Result_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Invalid_Arg_Result();
        expect(result).assertTrue();
        console.log('test_Module_Invalid_Arg_Result_0001 done');
        done();
        console.log('test_Module_Invalid_Arg_Result_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_INVALID_ARG_DESCRIPTOR_0100
     * @tc.name       test_Module_Invalid_Arg_Descriptor_0001
     * @tc.desc       invalid arg descriptor
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Invalid_Arg_Descriptor_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Invalid_Arg_Descriptor_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Invalid_Arg_Descriptor();
        expect(result).assertTrue();
        console.log('test_Module_Invalid_Arg_Descriptor_0001 done');
        done();
        console.log('test_Module_Invalid_Arg_Descriptor_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_INVALID_ENV_0100
     * @tc.name       test_Module_Invalid_Env_0001
     * @tc.desc       invalid env
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Invalid_Env_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Invalid_Env_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Invalid_Env();
        expect(result).assertTrue();
        console.log('test_Module_Invalid_Env_0001 done');
        done();
        console.log('test_Module_Invalid_Env_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_INVALID_MODULE_0100
     * @tc.name       test_Module_Invalid_Module_0001
     * @tc.desc       invalid module
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Invalid_Module_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Invalid_Module_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Invalid_Module();
        expect(result).assertTrue();
        console.log('test_Module_Invalid_Module_0001 done');
        done();
        console.log('test_Module_Invalid_Module_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_MANY_DESCRIPTOR_0100
     * @tc.name       test_Module_Many_Descriptor_0001
     * @tc.desc       module many descriptor
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Many_Descriptor_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Many_Descriptor_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Many_Descriptor();
        expect(result).assertTrue();
        console.log('test_Module_Many_Descriptor_0001 done');
        done();
        console.log('test_Module_Many_Descriptor_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_ALLTYPE_0100
     * @tc.name       test_Module_AllType_0001
     * @tc.desc       test all type
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_AllType_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_AllType_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_AllType();
        expect(result).assertTrue();
        console.log('test_Module_AllType_0001 done');
        done();
        console.log('test_Module_AllType_0001 end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_B_IN_NAMESPACE_A_0100
     * @tc.name       test_Module_Find_B_In_Namespace_A
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_B_In_Namespace_A", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_B_In_Namespace_A start');
        let cls = new Foo();
        let result = cls.test_Module_Find_B_In_Namespace_A();
        expect(result).assertTrue();
        console.log('test_Module_Find_B_In_Namespace_A done');
        done();
        console.log('test_Module_Find_B_In_Namespace_A end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_B_EXTENDS_A_0100
     * @tc.name       Module_Find_B_Extends_A
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("Module_Find_B_Extends_A", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('Module_Find_B_Extends_A start');
        let cls = new Foo();
        let result = cls.test_Module_Find_B_Extends_A();
        expect(result).assertTrue();
        console.log('Module_Find_B_Extends_A done');
        done();
        console.log('Module_Find_B_Extends_A end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_C_EXTENDS_B_EXTENDS_A_0100
     * @tc.name       test_Module_Find_C_Extends_B_Extends_A
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_C_Extends_B_Extends_A", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_C_Extends_B_Extends_A start');
        let cls = new Foo();
        let result = cls.test_Module_Find_C_Extends_B_Extends_A();
        expect(result).assertTrue();
        console.log('test_Module_Find_C_Extends_B_Extends_A done');
        done();
        console.log('test_Module_Find_C_Extends_B_Extends_A end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_GENERIC_CLASS_0100
     * @tc.name       test_Module_Find_Generic_Class
     * @tc.desc       find generic vlass
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Generic_Class", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Generic_Class start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Generic_Class();
        expect(result).assertTrue();
        console.log('test_Module_Find_Generic_Class done');
        done();
        console.log('test_Module_Find_Generic_Class end');
      })

    /**
     * @tc.number     SUB_ANI_MODULE_FIND_COMBINATION_0100
     * @tc.name       test_Module_Find_Combination_0001
     * @tc.desc       MediumTest
     * @tc.size       Function
     * @tc.type       Function test
     * @tc.level      Level 0
     */
    it("test_Module_Find_Combination_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Module_Find_Combination_0001 start');
        let cls = new Foo();
        let result = cls.test_Module_Find_Combination_01();
        expect(result).assertTrue();
        console.log('test_Module_Find_Combination_0001 done');
        done();
        console.log('test_Module_Find_Combination_0001 end');
      })
  })
}