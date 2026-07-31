'use static';
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
import { Foo } from '../ets/Index'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function fieldAccessTest():void {

  describe("ActsFieldAccessTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_0100
     * @tc.name      test_GetField_Int
     * @tc.desc      GetFieldByName_Int for Point.x
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetField_Int", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_Int();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_0200
     * @tc.name      test_SetField_Int
     * @tc.desc      SetFieldByName_Int for Point.x
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetField_Int", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_SetField_Int();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_0300
     * @tc.name      test_GetField_String
     * @tc.desc      GetFieldByName_Ref for Base.publicField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetField_String", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_String();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_0400
     * @tc.name      test_SetField_String
     * @tc.desc      SetFieldByName_Ref for Base.publicField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetField_String", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_SetField_String();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_0500
     * @tc.name      test_GetField_ReadOnly
     * @tc.desc      GetFieldByName_Int for Final.readonlyField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetField_ReadOnly", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_ReadOnly();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_0600
     * @tc.name      test_GetField_Boolean
     * @tc.desc      GetFieldByName_Boolean for FieldTypes.booleanField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_GetField_Boolean", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_Boolean();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_0700
     * @tc.name      test_GetField_Double
     * @tc.desc      GetFieldByName_Double for FieldTypes.doubleField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_GetField_Double", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_Double();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_0800
     * @tc.name      test_GetField_Float
     * @tc.desc      GetFieldByName_Float for FieldTypes.floatField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_GetField_Float", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_Float();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_0900
     * @tc.name      test_GetField_Long
     * @tc.desc      GetFieldByName_Long for FieldTypes.longField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_GetField_Long", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_Long();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_1000
     * @tc.name      test_GetField_Byte
     * @tc.desc      GetFieldByName_Byte for FieldTypes.byteField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_GetField_Byte", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_Byte();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_1100
     * @tc.name      test_GetField_Short
     * @tc.desc      GetFieldByName_Short for FieldTypes.shortField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_GetField_Short", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_Short();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_1200
     * @tc.name      test_GetField_Char
     * @tc.desc      GetFieldByName_Char for FieldTypes.charField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_GetField_Char", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_Char();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_1300
     * @tc.name      test_GetField_Static
     * @tc.desc      Class_GetStaticFieldByName_Int for Base.staticField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetField_Static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_Static();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_1400
     * @tc.name      test_SetField_Static
     * @tc.desc      Class_SetStaticFieldByName_Int for Base.staticField
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetField_Static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_SetField_Static();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_1500
     * @tc.name      test_GetField_Private
     * @tc.desc      GetFieldByName_Int for Base.privateField (ANI allows)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_GetField_Private", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_Private();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_1600
     * @tc.name      test_GetField_ReferenceType
     * @tc.desc      GetFieldByName_Ref for classField, verify instanceof
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_GetField_ReferenceType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_ReferenceType();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_FIELD_STATIC_1700
     * @tc.name      test_GetField_EnumType
     * @tc.desc      GetFieldByName_Ref for enumField, verify instanceof
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_GetField_EnumType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_GetField_EnumType();
      expect(result).assertEqual(1);
    });
  })
}
