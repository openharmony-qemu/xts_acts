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

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function objectOperationsTest() {

  describe("ActsObjectOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_REF_0100
     * @tc.name        test_Object_Get_Field_Ref_0001
     * @tc.desc        get field ref
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Ref_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Ref_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Ref_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Ref_0001 done');
      done();
      console.log('test_Object_Get_Field_Ref_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_REF_0200
     * @tc.name        test_Object_Get_Field_Ref_0002
     * @tc.desc        get field invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Ref_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Ref_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Ref_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Ref_0002 done');
      done();
      console.log('test_Object_Get_Field_Ref_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_REF_0300
     * @tc.name        test_Object_Get_Field_Ref_0003
     * @tc.desc        get field ref invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Ref_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Ref_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Ref_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Ref_0003 done');
      done();
      console.log('test_Object_Get_Field_Ref_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_REF_0400
     * @tc.name        test_Object_Get_Field_Ref_0004
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Ref_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Ref_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Ref_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Ref_0004 done');
      done();
      console.log('test_Object_Get_Field_Ref_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_REF_0500
     * @tc.name        test_Object_Get_Field_Ref_0005
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Ref_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Ref_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Ref_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Ref_0005 done');
      done();
      console.log('test_Object_Get_Field_Ref_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_REF_0600
     * @tc.name        test_Object_Get_Field_Ref_0006
     * @tc.desc        invalid_argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_Ref_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_Ref_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_Ref_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_Ref_0006 done');
      done();
      console.log('test_Object_Get_Field_Ref_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BOOLEAN_0100
     * @tc.name        test_Object_Get_Field_By_Name_Boolean_0001
     * @tc.desc        get field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Boolean_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Boolean_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Boolean_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Boolean_0001 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Boolean_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BOOLEAN_0200
     * @tc.name        test_Object_Get_Field_By_Name_Boolean_0002
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Boolean_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Boolean_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Boolean_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Boolean_0002 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Boolean_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BOOLEAN_0300
     * @tc.name        test_Object_Get_Field_By_Name_Boolean_0003
     * @tc.desc        not found
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Boolean_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Boolean_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Boolean_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Boolean_0003 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Boolean_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BOOLEAN_0400
     * @tc.name        test_Object_Get_Field_By_Name_Boolean_0004
     * @tc.desc        invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Boolean_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Boolean_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Boolean_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Boolean_0004 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Boolean_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BOOLEAN_0500
     * @tc.name        test_Object_Get_Field_By_Name_Boolean_0005
     * @tc.desc        invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Boolean_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Boolean_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Boolean_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Boolean_0005 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Boolean_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BOOLEAN_0600
     * @tc.name        test_Object_Get_Field_By_Name_Boolean_0006
     * @tc.desc        invalid name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Boolean_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Boolean_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Boolean_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Boolean_0006 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Boolean_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BOOLEAN_0700
     * @tc.name        test_Object_Get_Field_By_Name_Boolean_0007
     * @tc.desc        invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Boolean_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Boolean_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Boolean_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Boolean_0007 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Boolean_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BYTE_0100
     * @tc.name        test_Object_Get_Field_By_Name_Byte_0001
     * @tc.desc        get field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Byte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Byte_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Byte_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Byte_0001 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Byte_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BYTE_0200
     * @tc.name        test_Object_Get_Field_By_Name_Byte_0002
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Byte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Byte_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Byte_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Byte_0002 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Byte_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BYTE_0300
     * @tc.name        test_Object_Get_Field_By_Name_Byte_0003
     * @tc.desc        not found
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Byte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Byte_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Byte_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Byte_0003 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Byte_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BYTE_0400
     * @tc.name        test_Object_Get_Field_By_Name_Byte_0004
     * @tc.desc        invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Byte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Byte_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Byte_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Byte_0004 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Byte_0004 end');
    })