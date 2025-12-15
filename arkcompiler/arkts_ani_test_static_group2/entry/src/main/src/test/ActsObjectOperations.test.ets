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

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BYTE_0500
     * @tc.name        test_Object_Get_Field_By_Name_Byte_0005
     * @tc.desc        invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Byte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Byte_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Byte_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Byte_0005 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Byte_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BYTE_0600
     * @tc.name        test_Object_Get_Field_By_Name_Byte_0006
     * @tc.desc        invalid name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Byte_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Byte_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Byte_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Byte_0006 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Byte_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_BYTE_0700
     * @tc.name        test_Object_Get_Field_By_Name_Byte_0007
     * @tc.desc        invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Byte_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Byte_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Byte_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Byte_0007 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Byte_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_CHAR_0100
     * @tc.name        test_Object_Get_Field_By_Name_Char_0001
     * @tc.desc        get field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Char_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Char_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Char_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Char_0001 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Char_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_CHAR_0200
     * @tc.name        test_Object_Get_Field_By_Name_Char_0002
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Char_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Char_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Char_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Char_0002 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Char_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_CHAR_0300
     * @tc.name        test_Object_Get_Field_By_Name_Char_0003
     * @tc.desc        not found
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Char_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Char_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Char_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Char_0003 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Char_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_CHAR_0400
     * @tc.name        test_Object_Get_Field_By_Name_Char_0004
     * @tc.desc        invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Char_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Char_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Char_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Char_0004 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Char_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_CHAR_0500
     * @tc.name        test_Object_Get_Field_By_Name_Char_0005
     * @tc.desc        invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Char_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Char_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Char_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Char_0005 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Char_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_CHAR_0600
     * @tc.name        test_Object_Get_Field_By_Name_Char_0006
     * @tc.desc        invalid name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Char_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Char_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Char_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Char_0006 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Char_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_CHAR_0700
     * @tc.name        test_Object_Get_Field_By_Name_Char_0007
     * @tc.desc        invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Char_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Char_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Char_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Char_0007 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Char_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_DOUBLE_0100
     * @tc.name        test_Object_Get_Field_By_Name_Double_0001
     * @tc.desc        get field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Double_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Double_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Double_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Double_0001 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Double_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_DOUBLE_0200
     * @tc.name        test_Object_Get_Field_By_Name_Double_0002
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Double_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Double_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Double_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Double_0002 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Double_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_DOUBLE_0300
     * @tc.name        test_Object_Get_Field_By_Name_Double_0003
     * @tc.desc        not found
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Double_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Double_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Double_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Double_0003 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Double_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_DOUBLE_0400
     * @tc.name        test_Object_Get_Field_By_Name_Double_0004
     * @tc.desc        invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Double_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Double_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Double_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Double_0004 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Double_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_DOUBLE_0500
     * @tc.name        test_Object_Get_Field_By_Name_Double_0005
     * @tc.desc        invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Double_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Double_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Double_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Double_0005 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Double_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_DOUBLE_0600
     * @tc.name        test_Object_Get_Field_By_Name_Double_0006
     * @tc.desc        invalid name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Double_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Double_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Double_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Double_0006 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Double_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_DOUBLE_0700
     * @tc.name        test_Object_Get_Field_By_Name_Double_0007
     * @tc.desc        invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Double_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Double_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Double_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Double_0007 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Double_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_FLOAT_0100
     * @tc.name        test_Object_Get_Field_By_Name_Float_0001
     * @tc.desc        get field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Float_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Float_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Float_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Float_0001 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Float_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_FLOAT_0200
     * @tc.name        test_Object_Get_Field_By_Name_Float_0002
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Float_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Float_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Float_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Float_0002 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Float_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_FLOAT_0300
     * @tc.name        test_Object_Get_Field_By_Name_Float_0003
     * @tc.desc        not found
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Float_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Float_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Float_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Float_0003 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Float_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_FLOAT_0400
     * @tc.name        test_Object_Get_Field_By_Name_Float_0004
     * @tc.desc        invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Float_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Float_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Float_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Float_0004 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Float_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_FLOAT_0500
     * @tc.name        test_Object_Get_Field_By_Name_Float_0005
     * @tc.desc        invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Float_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Float_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Float_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Float_0005 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Float_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_FLOAT_0600
     * @tc.name        test_Object_Get_Field_By_Name_Float_0006
     * @tc.desc        invalid name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Float_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Float_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Float_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Float_0006 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Float_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_FLOAT_0700
     * @tc.name        test_Object_Get_Field_By_Name_Float_0007
     * @tc.desc        invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Float_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Float_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Float_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Float_0007 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Float_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_INT_0100
     * @tc.name        test_Object_Get_Field_By_Name_Int_0001
     * @tc.desc        get field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Int_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Int_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Int_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Int_0001 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Int_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_INT_0200
     * @tc.name        test_Object_Get_Field_By_Name_Int_0002
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Int_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Int_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Int_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Int_0002 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Int_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_INT_0300
     * @tc.name        test_Object_Get_Field_By_Name_Int_0003
     * @tc.desc        not found
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Int_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Int_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Int_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Int_0003 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Int_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_INT_0400
     * @tc.name        test_Object_Get_Field_By_Name_Int_0004
     * @tc.desc        invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Int_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Int_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Int_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Int_0004 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Int_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_INT_0500
     * @tc.name        test_Object_Get_Field_By_Name_Int_0005
     * @tc.desc        invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Int_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Int_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Int_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Int_0005 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Int_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_INT_0600
     * @tc.name        test_Object_Get_Field_By_Name_Int_0006
     * @tc.desc        invalid name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Int_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Int_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Int_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Int_0006 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Int_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_INT_0700
     * @tc.name        test_Object_Get_Field_By_Name_Int_0007
     * @tc.desc        invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Int_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Int_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Int_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Int_0007 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Int_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_LONG_0100
     * @tc.name        test_Object_Get_Field_By_Name_Long_0001
     * @tc.desc        get field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Long_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Long_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Long_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Long_0001 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Long_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_LONG_0200
     * @tc.name        test_Object_Get_Field_By_Name_Long_0002
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Long_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Long_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Long_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Long_0002 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Long_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_LONG_0300
     * @tc.name        test_Object_Get_Field_By_Name_Long_0003
     * @tc.desc        not found
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Long_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Long_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Long_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Long_0003 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Long_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_LONG_0400
     * @tc.name        test_Object_Get_Field_By_Name_Long_0004
     * @tc.desc        invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Long_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Long_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Long_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Long_0004 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Long_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_LONG_0500
     * @tc.name        test_Object_Get_Field_By_Name_Long_0005
     * @tc.desc        invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Long_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Long_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Long_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Long_0005 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Long_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_LONG_0600
     * @tc.name        test_Object_Get_Field_By_Name_Long_0006
     * @tc.desc        invalid name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Long_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Long_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Long_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Long_0006 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Long_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_LONG_0700
     * @tc.name        test_Object_Get_Field_By_Name_Long_0007
     * @tc.desc        invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Long_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Long_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Long_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Long_0007 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Long_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_REF_0100
     * @tc.name        test_Object_Get_Field_By_Name_Ref_0001
     * @tc.desc        get field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Ref_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Ref_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Ref_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Ref_0001 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Ref_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_REF_0200
     * @tc.name        test_Object_Get_Field_By_Name_Ref_0002
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Ref_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Ref_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Ref_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Ref_0002 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Ref_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_REF_0300
     * @tc.name        test_Object_Get_Field_By_Name_Ref_0003
     * @tc.desc        not found
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Ref_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Ref_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Ref_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Ref_0003 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Ref_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_REF_0400
     * @tc.name        test_Object_Get_Field_By_Name_Ref_0004
     * @tc.desc        invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Ref_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Ref_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Ref_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Ref_0004 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Ref_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_REF_0500
     * @tc.name        test_Object_Get_Field_By_Name_Ref_0005
     * @tc.desc        invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Ref_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Ref_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Ref_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Ref_0005 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Ref_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_REF_0600
     * @tc.name        test_Object_Get_Field_By_Name_Ref_0006
     * @tc.desc        invalid name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Ref_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Ref_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Ref_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Ref_0006 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Ref_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_REF_0700
     * @tc.name        test_Object_Get_Field_By_Name_Ref_0007
     * @tc.desc        invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Ref_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Ref_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Ref_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Ref_0007 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Ref_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_SHORT_0100
     * @tc.name        test_Object_Get_Field_By_Name_Short_0001
     * @tc.desc        get field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Short_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Short_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Short_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Short_0001 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Short_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_SHORT_0200
     * @tc.name        test_Object_Get_Field_By_Name_Short_0002
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Short_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Short_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Short_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Short_0002 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Short_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_SHORT_0300
     * @tc.name        test_Object_Get_Field_By_Name_Short_0003
     * @tc.desc        not found
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Short_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Short_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Short_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Short_0003 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Short_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_SHORT_0400
     * @tc.name        test_Object_Get_Field_By_Name_Short_0004
     * @tc.desc        invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Short_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Short_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Short_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Short_0004 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Short_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_SHORT_0500
     * @tc.name        test_Object_Get_Field_By_Name_Short_0005
     * @tc.desc        invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Short_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Short_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Short_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Short_0005 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Short_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_SHORT_0600
     * @tc.name        test_Object_Get_Field_By_Name_Short_0006
     * @tc.desc        invalid name
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Short_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Short_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Short_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Short_0006 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Short_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_FIELD_BY_NAME_SHORT_0700
     * @tc.name        test_Object_Get_Field_By_Name_Short_0007
     * @tc.desc        invalid result
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Field_By_Name_Short_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Field_By_Name_Short_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Field_By_Name_Short_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Field_By_Name_Short_0007 done');
      done();
      console.log('test_Object_Get_Field_By_Name_Short_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BOOL_0100
     * @tc.name        test_Object_Get_Property_By_Name_Boolean_0001
     * @tc.desc        get field property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Boolean_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Boolean_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Boolean_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Boolean_0001 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Boolean_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BOOL_0200
     * @tc.name        test_Object_Get_Property_By_Name_Boolean_0002
     * @tc.desc        get getter property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Boolean_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Boolean_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Boolean_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Boolean_0002 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Boolean_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BOOL_0300
     * @tc.name        test_Object_Get_Property_By_Name_Boolean_0003
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Boolean_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Boolean_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Boolean_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Boolean_0003 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Boolean_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BOOL_0400
     * @tc.name        test_Object_Get_Property_By_Name_Boolean_0004
     * @tc.desc        invalid parameter
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Boolean_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Boolean_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Boolean_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Boolean_0004 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Boolean_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BOOL_0500
     * @tc.name        test_Object_Get_Property_By_Name_Boolean_0005
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Boolean_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Boolean_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Boolean_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Boolean_0005 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Boolean_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BOOL_0600
     * @tc.name        test_Object_Get_Property_By_Name_Boolean_0006
     * @tc.desc        get field property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Boolean_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Boolean_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Boolean_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Boolean_0006 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Boolean_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BOOL_0700
     * @tc.name        test_Object_Get_Property_By_Name_Boolean_0007
     * @tc.desc        get getter property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Boolean_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Boolean_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Boolean_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Boolean_0007 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Boolean_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BYTE_0100
     * @tc.name        test_Object_Get_Property_By_Name_Byte_0001
     * @tc.desc        get field property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Byte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Byte_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Byte_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Byte_0001 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Byte_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BYTE_0200
     * @tc.name        test_Object_Get_Property_By_Name_Byte_0002
     * @tc.desc        get getter property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Byte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Byte_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Byte_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Byte_0002 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Byte_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BYTE_0300
     * @tc.name        test_Object_Get_Property_By_Name_Byte_0003
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Byte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Byte_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Byte_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Byte_0003 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Byte_0003 end');
    })
    
    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BYTE_0400
     * @tc.name        test_Object_Get_Property_By_Name_Byte_0004
     * @tc.desc        invalid parameter
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Byte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Byte_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Byte_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Byte_0004 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Byte_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BYTE_0500
     * @tc.name        test_Object_Get_Property_By_Name_Byte_0005
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Byte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Byte_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Byte_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Byte_0005 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Byte_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BYTE_0600
     * @tc.name        test_Object_Get_Property_By_Name_Byte_0006
     * @tc.desc        get field property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Byte_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Byte_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Byte_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Byte_0006 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Byte_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_BYTE_0700
     * @tc.name        test_Object_Get_Property_By_Name_Byte_0007
     * @tc.desc        get getter property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Byte_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Byte_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Byte_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Byte_0007 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Byte_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_CHAR_0100
     * @tc.name        test_Object_Get_Property_By_Name_Char_0001
     * @tc.desc        get field property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Char_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Char_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Char_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Char_0001 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Char_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_CHAR_0200
     * @tc.name        test_Object_Get_Property_By_Name_Char_0002
     * @tc.desc        get getter property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Char_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Char_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Char_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Char_0002 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Char_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_CHAR_0300
     * @tc.name        test_Object_Get_Property_By_Name_Char_0003
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Char_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Char_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Char_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Char_0003 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Char_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_CHAR_0400
     * @tc.name        test_Object_Get_Property_By_Name_Char_0004
     * @tc.desc        invalid parameter
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Char_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Char_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Char_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Char_0004 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Char_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_CHAR_0500
     * @tc.name        test_Object_Get_Property_By_Name_Char_0005
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Char_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Char_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Char_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Char_0005 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Char_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_CHAR_0600
     * @tc.name        test_Object_Get_Property_By_Name_Char_0006
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Char_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Char_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Char_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Char_0006 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Char_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_CHAR_0700
     * @tc.name        test_Object_Get_Property_By_Name_Char_0007
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Char_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Char_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Char_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Char_0007 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Char_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_CHAR_0800
     * @tc.name        test_Object_Get_Property_By_Name_Char_0008
     * @tc.desc        get field property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Char_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Char_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Char_08();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Char_0008 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Char_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_CHAR_0900
     * @tc.name        test_Object_Get_Property_By_Name_Char_0009
     * @tc.desc        get getter property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Char_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Char_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Char_09();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Char_0009 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Char_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_DOUBLE_0100
     * @tc.name        test_Object_Get_Property_By_Name_Double_0001
     * @tc.desc        get field property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Double_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Double_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Double_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Double_0001 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Double_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_DOUBLE_0200
     * @tc.name        test_Object_Get_Property_By_Name_Double_0002
     * @tc.desc        get getter property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Double_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Double_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Double_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Double_0002 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Double_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_DOUBLE_0300
     * @tc.name        test_Object_Get_Property_By_Name_Double_0003
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Double_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Double_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Double_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Double_0003 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Double_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_DOUBLE_0400
     * @tc.name        test_Object_Get_Property_By_Name_Double_0004
     * @tc.desc        invalid parameter
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Double_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Double_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Double_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Double_0004 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Double_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_DOUBLE_0500
     * @tc.name        test_Object_Get_Property_By_Name_Double_0005
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Double_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Double_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Double_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Double_0005 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Double_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_DOUBLE_0600
     * @tc.name        test_Object_Get_Property_By_Name_Double_0006
     * @tc.desc        get field property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Double_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Double_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Double_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Double_0006 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Double_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_DOUBLE_0700
     * @tc.name        test_Object_Get_Property_By_Name_Double_0007
     * @tc.desc        get getter property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Double_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Double_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Double_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Double_0007 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Double_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_FLOAT_0100
     * @tc.name        test_Object_Get_Property_By_Name_Float_0001
     * @tc.desc        get field property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Float_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Float_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Float_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Float_0001 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Float_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_FLOAT_0200
     * @tc.name        test_Object_Get_Property_By_Name_Float_0002
     * @tc.desc        get getter property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Float_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Float_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Float_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Float_0002 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Float_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_FLOAT_0300
     * @tc.name        test_Object_Get_Property_By_Name_Float_0003
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Float_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Float_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Float_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Float_0003 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Float_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_FLOAT_0400
     * @tc.name        test_Object_Get_Property_By_Name_Float_0004
     * @tc.desc        invalid parameter
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Float_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Float_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Float_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Float_0004 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Float_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_FLOAT_0500
     * @tc.name        test_Object_Get_Property_By_Name_Float_0005
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Float_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Float_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Float_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Float_0005 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Float_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_FLOAT_0600
     * @tc.name        test_Object_Get_Property_By_Name_Float_0006
     * @tc.desc        get field property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Float_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Float_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Float_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Float_0006 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Float_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_FLOAT_0700
     * @tc.name        test_Object_Get_Property_By_Name_Float_0007
     * @tc.desc        get getter property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Float_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Float_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Float_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Float_0007 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Float_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_INT_0100
     * @tc.name        test_Object_Get_Property_By_Name_Int_0001
     * @tc.desc        get field property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Int_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Int_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Int_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Int_0001 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Int_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_INT_0200
     * @tc.name        test_Object_Get_Property_By_Name_Int_0002
     * @tc.desc        get getter property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Int_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Int_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Int_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Int_0002 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Int_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_INT_0300
     * @tc.name        test_Object_Get_Property_By_Name_Int_0003
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Int_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Int_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Int_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Int_0003 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Int_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_INT_0400
     * @tc.name        test_Object_Get_Property_By_Name_Int_0004
     * @tc.desc        invalid parameter
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Int_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Int_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Int_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Int_0004 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Int_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_INT_0500
     * @tc.name        test_Object_Get_Property_By_Name_Int_0005
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Int_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Int_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Int_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Int_0005 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Int_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_INT_0600
     * @tc.name        test_Object_Get_Property_By_Name_Int_0006
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Int_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Int_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Int_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Int_0006 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Int_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_INT_0700
     * @tc.name        test_Object_Get_Property_By_Name_Int_0007
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Int_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Int_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Int_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Int_0007 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Int_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_INT_0800
     * @tc.name        test_Object_Get_Property_By_Name_Int_0008
     * @tc.desc        get field property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Int_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Int_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Int_08();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Int_0008 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Int_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_INT_0900
     * @tc.name        test_Object_Get_Property_By_Name_Int_0009
     * @tc.desc        get getter property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Int_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Int_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Int_09();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Int_0009 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Int_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_LONG_0100
     * @tc.name        test_Object_Get_Property_By_Name_Long_0001
     * @tc.desc        get field property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Long_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Long_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Long_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Long_0001 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Long_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_LONG_0200
     * @tc.name        test_Object_Get_Property_By_Name_Long_0002
     * @tc.desc        get getter property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Long_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Long_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Long_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Long_0002 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Long_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_LONG_0300
     * @tc.name        test_Object_Get_Property_By_Name_Long_0003
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Long_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Long_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Long_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Long_0003 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Long_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_LONG_0400
     * @tc.name        test_Object_Get_Property_By_Name_Long_0004
     * @tc.desc        invalid parameter
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Long_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Long_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Long_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Long_0004 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Long_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_LONG_0500
     * @tc.name        test_Object_Get_Property_By_Name_Long_0005
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Long_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Long_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Long_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Long_0005 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Long_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_LONG_0600
     * @tc.name        test_Object_Get_Property_By_Name_Long_0006
     * @tc.desc        get field property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Long_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Long_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Long_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Long_0006 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Long_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_LONG_0700
     * @tc.name        test_Object_Get_Property_By_Name_Long_0007
     * @tc.desc        get getter property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Long_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Long_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Long_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Long_0007 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Long_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_REF_0100
     * @tc.name        test_Object_Get_Property_By_Name_Ref_0001
     * @tc.desc        get field property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Ref_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Ref_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Ref_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Ref_0001 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Ref_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_REF_0200
     * @tc.name        test_Object_Get_Property_By_Name_Ref_0002
     * @tc.desc        get getter property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Ref_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Ref_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Ref_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Ref_0002 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Ref_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_REF_0300
     * @tc.name        test_Object_Get_Property_By_Name_Ref_0003
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Ref_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Ref_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Ref_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Ref_0003 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Ref_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_REF_0400
     * @tc.name        test_Object_Get_Property_By_Name_Ref_0004
     * @tc.desc        invalid parameter
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Ref_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Ref_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Ref_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Ref_0004 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Ref_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_REF_0500
     * @tc.name        test_Object_Get_Property_By_Name_Ref_0005
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Ref_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Ref_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Ref_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Ref_0005 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Ref_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_REF_0600
     * @tc.name        test_Object_Get_Property_By_Name_Ref_0006
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Ref_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Ref_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Ref_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Ref_0006 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Ref_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_REF_0700
     * @tc.name        test_Object_Get_Property_By_Name_Ref_0007
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Ref_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Ref_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Ref_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Ref_0007 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Ref_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_REF_0800
     * @tc.name        test_Object_Get_Property_By_Name_Ref_0008
     * @tc.desc        get field property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Ref_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Ref_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Ref_08();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Ref_0008 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Ref_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_REF_0900
     * @tc.name        test_Object_Get_Property_By_Name_Ref_0009
     * @tc.desc        get getter property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Ref_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Ref_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Ref_09();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Ref_0009 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Ref_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_SHORT_0100
     * @tc.name        test_Object_Get_Property_By_Name_Short_0001
     * @tc.desc        get field property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Short_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Short_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Short_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Short_0001 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Short_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_SHORT_0200
     * @tc.name        test_Object_Get_Property_By_Name_Short_0002
     * @tc.desc        get getter property
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Short_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Short_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Short_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Short_0002 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Short_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_SHORT_0300
     * @tc.name        test_Object_Get_Property_By_Name_Short_0003
     * @tc.desc        invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Short_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Short_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Short_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Short_0003 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Short_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_SHORT_0400
     * @tc.name        test_Object_Get_Property_By_Name_Short_0004
     * @tc.desc        invalid parameter
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Short_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Short_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Short_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Short_0004 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Short_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_SHORT_0500
     * @tc.name        test_Object_Get_Property_By_Name_Short_0005
     * @tc.desc        invalid argument
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Short_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Short_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Short_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Short_0005 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Short_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_SHORT_0600
     * @tc.name        test_Object_Get_Property_By_Name_Short_0006
     * @tc.desc        get field property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Short_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Short_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Short_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Short_0006 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Short_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_PROPERTY_BY_NAME_SHORT_0700
     * @tc.name        test_Object_Get_Property_By_Name_Short_0007
     * @tc.desc        get getter property invalid type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Property_By_Name_Short_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Property_By_Name_Short_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Property_By_Name_Short_07();
      expect(result).assertTrue();
      console.log('test_Object_Get_Property_By_Name_Short_0007 done');
      done();
      console.log('test_Object_Get_Property_By_Name_Short_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_TYPE_0100
     * @tc.name        test_Object_Get_Type_0001
     * @tc.desc        class obect type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Type_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Type_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Type_01();
      expect(result).assertTrue();
      console.log('test_Object_Get_Type_0001 done');
      done();
      console.log('test_Object_Get_Type_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_TYPE_0200
     * @tc.name        test_Object_Get_Type_0002
     * @tc.desc        string obect type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Type_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Type_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Type_02();
      expect(result).assertTrue();
      console.log('test_Object_Get_Type_0002 done');
      done();
      console.log('test_Object_Get_Type_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_TYPE_0300
     * @tc.name        test_Object_Get_Type_0003
     * @tc.desc        invalid parameters
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Type_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Type_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Type_03();
      expect(result).assertTrue();
      console.log('test_Object_Get_Type_0003 done');
      done();
      console.log('test_Object_Get_Type_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_TYPE_0400
     * @tc.name        test_Object_Get_Type_0004
     * @tc.desc        invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Type_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Type_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Type_04();
      expect(result).assertTrue();
      console.log('test_Object_Get_Type_0004 done');
      done();
      console.log('test_Object_Get_Type_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_TYPE_0500
     * @tc.name        test_Object_Get_Type_0005
     * @tc.desc        class object type loop
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Type_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Type_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Type_05();
      expect(result).assertTrue();
      console.log('test_Object_Get_Type_0005 done');
      done();
      console.log('test_Object_Get_Type_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_GET_TYPE_0600
     * @tc.name        test_Object_Get_Type_0006
     * @tc.desc        eq obj type enum
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Get_Type_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Get_Type_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Get_Type_06();
      expect(result).assertTrue();
      console.log('test_Object_Get_Type_0006 done');
      done();
      console.log('test_Object_Get_Type_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_INSTANCE_0100
     * @tc.name        test_Object_Instance_0001
     * @tc.desc        object instance of
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Instance_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Instance_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Instance_01();
      expect(result).assertTrue();
      console.log('test_Object_Instance_0001 done');
      done();
      console.log('test_Object_Instance_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_INSTANCE_0200
     * @tc.name        test_Object_Instance_0002
     * @tc.desc        invalid parameter
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Instance_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Instance_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Instance_02();
      expect(result).assertTrue();
      console.log('test_Object_Instance_0002 done');
      done();
      console.log('test_Object_Instance_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_INSTANCE_0300
     * @tc.name        test_Object_Instance_0003
     * @tc.desc        object instance of loop
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Instance_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Instance_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Instance_03();
      expect(result).assertTrue();
      console.log('test_Object_Instance_0003 done');
      done();
      console.log('test_Object_Instance_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_INSTANCE_0400
     * @tc.name        test_Object_Instance_0004
     * @tc.desc        object instance of array
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Instance_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Instance_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Instance_04();
      expect(result).assertTrue();
      console.log('test_Object_Instance_0004 done');
      done();
      console.log('test_Object_Instance_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_INSTANCE_0500
     * @tc.name        test_Object_Instance_0005
     * @tc.desc        object interface instance of
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Instance_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Instance_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Instance_05();
      expect(result).assertTrue();
      console.log('test_Object_Instance_0005 done');
      done();
      console.log('test_Object_Instance_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_INSTANCE_0600
     * @tc.name        test_Object_Instance_0006
     * @tc.desc        object union instance of
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Instance_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Instance_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Instance_06();
      expect(result).assertTrue();
      console.log('test_Object_Instance_0006 done');
      done();
      console.log('test_Object_Instance_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_INSTANCE_0700
     * @tc.name        test_Object_Instance_0007
     * @tc.desc        pure object instance of
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Instance_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Instance_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Instance_07();
      expect(result).assertTrue();
      console.log('test_Object_Instance_0007 done');
      done();
      console.log('test_Object_Instance_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_INSTANCE_0800
     * @tc.name        test_Object_Instance_0008
     * @tc.desc        object boxed primitive instance of
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Instance_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Instance_0008 start');
      let cls = new Foo();
      let result = cls.test_Object_Instance_08();
      expect(result).assertTrue();
      console.log('test_Object_Instance_0008 done');
      done();
      console.log('test_Object_Instance_0008 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_INSTANCE_0900
     * @tc.name        test_Object_Instance_0009
     * @tc.desc        ani enum instance of
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Instance_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Instance_0009 start');
      let cls = new Foo();
      let result = cls.test_Object_Instance_09();
      expect(result).assertTrue();
      console.log('test_Object_Instance_0009 done');
      done();
      console.log('test_Object_Instance_0009 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_INSTANCE_1000
     * @tc.name        test_Object_Instance_0010
     * @tc.desc        ani enum item instance of
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Instance_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Instance_0010 start');
      let cls = new Foo();
      let result = cls.test_Object_Instance_10();
      expect(result).assertTrue();
      console.log('test_Object_Instance_0010 done');
      done();
      console.log('test_Object_Instance_0010 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_BOOL_0100
     * @tc.name        test_Object_Set_Field_Bool_0001
     * @tc.desc        set field boolean success
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Bool_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Bool_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Bool_01();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Bool_0001 done');
      done();
      console.log('test_Object_Set_Field_Bool_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_BOOL_0200
     * @tc.name        test_Object_Set_Field_Bool_0002
     * @tc.desc        set field boolean invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Bool_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Bool_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Bool_02();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Bool_0002 done');
      done();
      console.log('test_Object_Set_Field_Bool_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_BOOL_0300
     * @tc.name        test_Object_Set_Field_Bool_0003
     * @tc.desc        set field boolean invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Bool_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Bool_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Bool_03();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Bool_0003 done');
      done();
      console.log('test_Object_Set_Field_Bool_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_BOOL_0400
     * @tc.name        test_Object_Set_Field_Bool_0004
     * @tc.desc        set field boolean invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Bool_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Bool_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Bool_04();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Bool_0004 done');
      done();
      console.log('test_Object_Set_Field_Bool_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_BOOL_0500
     * @tc.name        test_Object_Set_Field_Bool_0005
     * @tc.desc        set field boolean invalid field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Bool_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Bool_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Bool_05();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Bool_0005 done');
      done();
      console.log('test_Object_Set_Field_Bool_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_BOOL_0600
     * @tc.name        test_Object_Set_Field_Bool_0006
     * @tc.desc        set field boolean false
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Bool_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Bool_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Bool_06();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Bool_0006 done');
      done();
      console.log('test_Object_Set_Field_Bool_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_BYTE_0100
     * @tc.name        test_Object_Set_Field_Byte_0001
     * @tc.desc        set field byte
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Byte_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Byte_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Byte_01();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Byte_0001 done');
      done();
      console.log('test_Object_Set_Field_Byte_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_BYTE_0200
     * @tc.name        test_Object_Set_Field_Byte_0002
     * @tc.desc        set field byte invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Byte_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Byte_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Byte_02();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Byte_0002 done');
      done();
      console.log('test_Object_Set_Field_Byte_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_BYTE_0300
     * @tc.name        test_Object_Set_Field_Byte_0003
     * @tc.desc        set field byteinvalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Byte_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Byte_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Byte_03();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Byte_0003 done');
      done();
      console.log('test_Object_Set_Field_Byte_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_BYTE_0400
     * @tc.name        test_Object_Set_Field_Byte_0004
     * @tc.desc        set field byte invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Byte_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Byte_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Byte_04();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Byte_0004 done');
      done();
      console.log('test_Object_Set_Field_Byte_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_BYTE_0500
     * @tc.name        test_Object_Set_Field_Byte_0005
     * @tc.desc        set field byte invalid field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Byte_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Byte_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Byte_05();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Byte_0005 done');
      done();
      console.log('test_Object_Set_Field_Byte_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_CHAR_0100
     * @tc.name        test_Object_Set_Field_Char_0001
     * @tc.desc        set field char success
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Char_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Char_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Char_01();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Char_0001 done');
      done();
      console.log('test_Object_Set_Field_Char_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_CHAR_0200
     * @tc.name        test_Object_Set_Field_Char_0002
     * @tc.desc        set field char invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Char_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Char_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Char_02();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Char_0002 done');
      done();
      console.log('test_Object_Set_Field_Char_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_CHAR_0300
     * @tc.name        test_Object_Set_Field_Char_0003
     * @tc.desc        set field char invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Char_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Char_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Char_03();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Char_0003 done');
      done();
      console.log('test_Object_Set_Field_Char_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_CHAR_0400
     * @tc.name        test_Object_Set_Field_Char_0004
     * @tc.desc        set field char invalid object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Char_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Char_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Char_04();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Char_0004 done');
      done();
      console.log('test_Object_Set_Field_Char_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_CHAR_0500
     * @tc.name        test_Object_Set_Field_Char_0005
     * @tc.desc        set field char invalid field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Char_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Char_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Char_05();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Char_0005 done');
      done();
      console.log('test_Object_Set_Field_Char_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_DOUBLE_0100
     * @tc.name        test_Object_Set_Field_Double_0001
     * @tc.desc        set field double success
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Double_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Double_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Double_01();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Double_0001 done');
      done();
      console.log('test_Object_Set_Field_Double_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_DOUBLE_0200
     * @tc.name        test_Object_Set_Field_Double_0002
     * @tc.desc        set field double negative value
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Double_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Double_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Double_02();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Double_0002 done');
      done();
      console.log('test_Object_Set_Field_Double_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_DOUBLE_0300
     * @tc.name        test_Object_Set_Field_Double_0003
     * @tc.desc        set field double boundary values
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Double_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Double_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Double_03();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Double_0003 done');
      done();
      console.log('test_Object_Set_Field_Double_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_DOUBLE_0400
     * @tc.name        test_Object_Set_Field_Double_0004
     * @tc.desc        set field double invalid args env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Double_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Double_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Double_04();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Double_0004 done');
      done();
      console.log('test_Object_Set_Field_Double_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_DOUBLE_0500
     * @tc.name        test_Object_Set_Field_Double_0005
     * @tc.desc        set field double invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Double_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Double_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Double_05();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Double_0005 done');
      done();
      console.log('test_Object_Set_Field_Double_0005 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_DOUBLE_0600
     * @tc.name        test_Object_Set_Field_Double_0006
     * @tc.desc        set field double invalid args object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Double_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Double_0006 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Double_06();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Double_0006 done');
      done();
      console.log('test_Object_Set_Field_Double_0006 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_DOUBLE_0700
     * @tc.name        test_Object_Set_Field_Double_0007
     * @tc.desc        set field double invalid args field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Double_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Double_0007 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Double_07();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Double_0007 done');
      done();
      console.log('test_Object_Set_Field_Double_0007 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_FLOAT_0100
     * @tc.name        test_Object_Set_Field_Float_0001
     * @tc.desc        set field float success
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Float_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Float_0001 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Float_01();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Float_0001 done');
      done();
      console.log('test_Object_Set_Field_Float_0001 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_FLOAT_0200
     * @tc.name        test_Object_Set_Field_Float_0002
     * @tc.desc        set field float invalid env
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Float_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Float_0002 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Float_02();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Float_0002 done');
      done();
      console.log('test_Object_Set_Field_Float_0002 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_FLOAT_0300
     * @tc.name        test_Object_Set_Field_Float_0003
     * @tc.desc        set field float invalid field type
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Float_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Float_0003 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Float_03();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Float_0003 done');
      done();
      console.log('test_Object_Set_Field_Float_0003 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_FLOAT_0400
     * @tc.name        test_Object_Set_Field_Float_0004
     * @tc.desc        set field float invalid args object
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Float_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Float_0004 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Float_04();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Float_0004 done');
      done();
      console.log('test_Object_Set_Field_Float_0004 end');
    })

    /**
     * @tc.number      SUB_ANI_OBJECT_SET_FIELD_FLOAT_0500
     * @tc.name        test_Object_Set_Field_Float_0005
     * @tc.desc        set field float invalid args field
     * @tc.size        Function
     * @tc.type        Function test
     * @tc.level       Level 0
     */
    it("test_Object_Set_Field_Float_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Object_Set_Field_Float_0005 start');
      let cls = new Foo();
      let result = cls.test_Object_Set_Field_Float_05();
      expect(result).assertTrue();
      console.log('test_Object_Set_Field_Float_0005 done');
      done();
      console.log('test_Object_Set_Field_Float_0005 end');
    })