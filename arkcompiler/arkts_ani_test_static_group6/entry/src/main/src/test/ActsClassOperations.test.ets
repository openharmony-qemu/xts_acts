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

export default function classOperationsTest():void {

  describe("ActsClassOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_0100
     * @tc.name      test_FindClass_RegularClass
     * @tc.desc      FindClass for regular class Point
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindClass_RegularClass", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_FindClass_RegularClass();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_0200
     * @tc.name      test_FindClass_ExportedClass
     * @tc.desc      FindClass for exported class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindClass_ExportedClass", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_FindClass_ExportedClass();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_0300
     * @tc.name      test_FindClass_FinalClass
     * @tc.desc      FindClass for final class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindClass_FinalClass", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_FindClass_FinalClass();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_0400
     * @tc.name      test_FindClass_AbstractClass
     * @tc.desc      FindClass for abstract class should succeed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindClass_AbstractClass", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_FindClass_AbstractClass();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_0500
     * @tc.name      test_FindClass_Interface
     * @tc.desc      FindClass for interface should succeed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindClass_Interface", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_FindClass_Interface();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_0600
     * @tc.name      test_FindClass_Enum
     * @tc.desc      FindClass for enum should succeed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FindClass_Enum", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_FindClass_Enum();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_0700
     * @tc.name      test_FindClass_NotExist
     * @tc.desc      FindClass for non-existent class returns ANI_NOT_FOUND
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_FindClass_NotExist", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_FindClass_NotExist();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_0800
     * @tc.name      test_ObjectNew_RegularClass
     * @tc.desc      Object_New for Point with params, verify fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectNew_RegularClass", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ObjectNew_RegularClass();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_0900
     * @tc.name      test_ObjectNew_DefaultConstructor
     * @tc.desc      Object_New with default constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectNew_DefaultConstructor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ObjectNew_DefaultConstructor();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_1000
     * @tc.name      test_ObjectNew_AbstractClass_Fail
     * @tc.desc      Object_New for abstract class should fail
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_ObjectNew_AbstractClass_Fail", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_ObjectNew_AbstractClass_Fail();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_1100
     * @tc.name      test_ObjectNew_Interface_Fail
     * @tc.desc      Object_New for interface should fail
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("test_ObjectNew_Interface_Fail", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let cls = new Foo();
      let result = cls.test_ObjectNew_Interface_Fail();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_1200
     * @tc.name      test_ObjectNew_OverloadedConstructor
     * @tc.desc      Object_New with overloaded constructors
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectNew_OverloadedConstructor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ObjectNew_OverloadedConstructor();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_1300
     * @tc.name      test_ObjectNew_ConcreteFromAbstract
     * @tc.desc      Object_New for concrete subclass of abstract
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectNew_ConcreteFromAbstract", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ObjectNew_ConcreteFromAbstract();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_1400
     * @tc.name      test_ObjectNew_ImplementsOne
     * @tc.desc      Object_New for class implementing one interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectNew_ImplementsOne", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ObjectNew_ImplementsOne();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_1500
     * @tc.name      test_ObjectNew_ImplementsMany
     * @tc.desc      Object_New for class implementing many interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectNew_ImplementsMany", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ObjectNew_ImplementsMany();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_1600
     * @tc.name      test_ObjectInstanceOf_Class
     * @tc.desc      Object_InstanceOf verifies class membership
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectInstanceOf_Class", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ObjectInstanceOf_Class();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_1700
     * @tc.name      test_ObjectInstanceOf_Interface
     * @tc.desc      Object_InstanceOf verifies interface implementation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectInstanceOf_Interface", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ObjectInstanceOf_Interface();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ANI_CLASSOPS_STATIC_1800
     * @tc.name      test_ObjectInstanceOf_NotRelated
     * @tc.desc      Object_InstanceOf returns false for unrelated types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectInstanceOf_NotRelated", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_ObjectInstanceOf_NotRelated();
      expect(result).assertEqual(1);
    });
  })
}
