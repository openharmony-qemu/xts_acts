'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index.ets";
import {
  PrimitiveTypeManager,
  StringObjectManager,
  DynamicArrayObjectManager,
  FixedArrayTypeManager,
  ArrayBufferObjectManager,
  FunctionObjectManager,
  ErrorObjectManager,
  EnumObjectManager,
  ClassObjectManager,
  ModuleObjectManager,
  NamespaceObjectManager
} from '../ets/Index.ets';

const UTF8_CONTENT: string = "Hello ANI";
const UTF8_LENGTH: int = 9;
const SUBSTR_START: int = 0;
const SUBSTR_LENGTH: int = 5;
const SUBSTR_EXPECT: string = "Hello";
const BUFFER_SIZE: int = 1024;
const EXPECTED_COLOR_RED: int = 1;
const EXPECTED_COLOR_BLUE: int = 3;
const EXPECTED_COLOR_COUNT: int = 3;
const EXPECTED_MODULE_RESULT: int = 42;
const EXPECTED_NAMESPACE_RESULT: int = 30;
const EXPECTED_FUNC_RESULT: number = 15.0;
const EXPECTED_CALLBACK_RESULT: int = 10;
const CHAR_A_CODE: int = 65;
const CHAR_X_CODE: int = 88;
const CHAR_Y_CODE: int = 89;

export default function aniObjectTypeTest(): void {
  describe("AniObjectTypeTest", (): void => {

    /**
     * @tc.number    SUB_ANI_OBJ_TYPE_PRIMITIVE_BOXED_0100
     * @tc.name      test_primitiveBoxedTypes_0001
     * @tc.desc      Scenario 7.1: Primitive boxed object traversal (8 types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_primitiveBoxedTypes_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new PrimitiveTypeManager();
        manager.boxedBoolean = manager.createBoxedBoolean(true);
        expect(manager.verifyBoxedBoolean()).assertTrue();
        manager.boxedBoolean = manager.createBoxedBoolean(false);
        expect(manager.verifyBoxedBoolean()).assertFalse();
        manager.boxedChar = manager.createBoxedChar(CHAR_A_CODE);
        expect(manager.verifyBoxedChar() as int).assertEqual(CHAR_A_CODE);
        manager.boxedByte = manager.createBoxedByte(127);
        expect(manager.verifyBoxedByte()).assertEqual(127);
        manager.boxedByte = manager.createBoxedByte(-128);
        expect(manager.verifyBoxedByte()).assertEqual(-128);
        manager.boxedShort = manager.createBoxedShort(32767);
        expect(manager.verifyBoxedShort()).assertEqual(32767);
        manager.boxedShort = manager.createBoxedShort(-32768);
        expect(manager.verifyBoxedShort()).assertEqual(-32768);
        manager.boxedInt = manager.createBoxedInt(2147483647);
        expect(manager.verifyBoxedInt()).assertEqual(2147483647);
        manager.boxedInt = manager.createBoxedInt(-2147483648);
        expect(manager.verifyBoxedInt()).assertEqual(-2147483648);
        manager.boxedLong = manager.createBoxedLong(9223372036854775807 as long);
        expect(manager.verifyBoxedLong()).assertEqual(9223372036854775807 as long);
        manager.boxedFloat = manager.createBoxedFloat(3.14 as float);
        expect(manager.verifyBoxedFloat()).assertEqual(3.14 as float);
        manager.boxedDouble = manager.createBoxedDouble(2.718281828);
        expect(manager.verifyBoxedDouble()).assertEqual(2.718281828);
        done();
      });

    /**
     * @tc.number    SUB_ANI_OBJ_TYPE_STRING_0200
     * @tc.name      test_stringObjectTypes_0002
     * @tc.desc      Scenario 7.2: String object traversal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_stringObjectTypes_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new StringObjectManager();
        manager.strField = manager.createUtf8String(UTF8_CONTENT);
        expect(manager.strField).assertEqual(UTF8_CONTENT);
        expect(manager.getStringLength()).assertEqual(UTF8_LENGTH);
        let substr = manager.getSubstring(SUBSTR_START, SUBSTR_LENGTH);
        expect(substr).assertEqual(SUBSTR_EXPECT);
        done();
      });

    /**
     * @tc.number    SUB_ANI_OBJ_TYPE_ARRAY_DYNAMIC_0300
     * @tc.name      test_dynamicArrayObject_0003
     * @tc.desc      Scenario 7.3: Dynamic array object traversal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_dynamicArrayObject_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new DynamicArrayObjectManager();
        manager.objArray = manager.createObjectArray(5);
        expect(manager.getArrayLength()).assertEqual(5);
        let obj1 = new Object();
        manager.setArrayElement(0, obj1);
        let retrieved = manager.getArrayElement(0);
        expect(retrieved != null).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_OBJ_TYPE_FIXEDARRAY_ALL_TYPES_0400
     * @tc.name      test_fixedArrayAllTypes_0004
     * @tc.desc      Scenario 7.4: Fixed array object traversal (9 types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_fixedArrayAllTypes_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new FixedArrayTypeManager();
        manager.boolFixedArray = manager.createBooleanFixedArray(3);
        manager.setBooleanElement(0, true);
        manager.setBooleanElement(1, false);
        manager.setBooleanElement(2, true);
        expect(manager.getBooleanElement(0)).assertTrue();
        expect(manager.getBooleanElement(1)).assertFalse();
        expect(manager.getBooleanElement(2)).assertTrue();
        manager.charFixedArray = manager.createCharFixedArray(2);
        manager.setCharElement(0, CHAR_X_CODE);
        manager.setCharElement(1, CHAR_Y_CODE);
        expect(manager.getCharElement(0) as int).assertEqual(CHAR_X_CODE);
        expect(manager.getCharElement(1) as int).assertEqual(CHAR_Y_CODE);
        manager.byteFixedArray = manager.createByteFixedArray(2);
        manager.setByteElement(0, 100);
        manager.setByteElement(1, -50);
        expect(manager.getByteElement(0)).assertEqual(100);
        expect(manager.getByteElement(1)).assertEqual(-50);
        manager.shortFixedArray = manager.createShortFixedArray(2);
        manager.setShortElement(0, 1000);
        manager.setShortElement(1, -2000);
        expect(manager.getShortElement(0)).assertEqual(1000);
        expect(manager.getShortElement(1)).assertEqual(-2000);
        manager.intFixedArray = manager.createIntFixedArray(5);
        manager.setIntRegion(0, 5, [10, 20, 30, 40, 50]);
        expect(manager.getIntElement(0)).assertEqual(10);
        expect(manager.getIntElement(2)).assertEqual(30);
        expect(manager.getIntElement(4)).assertEqual(50);
        manager.longFixedArray = manager.createLongFixedArray(2);
        manager.setLongElement(0, 123456789 as long);
        manager.setLongElement(1, -987654321 as long);
        expect(manager.getLongElement(0)).assertEqual(123456789 as long);
        expect(manager.getLongElement(1)).assertEqual(-987654321 as long);
        manager.floatFixedArray = manager.createFloatFixedArray(2);
        manager.setFloatElement(0, 1.5 as float);
        manager.setFloatElement(1, 2.5 as float);
        expect(manager.getFloatElement(0)).assertEqual(1.5 as float);
        expect(manager.getFloatElement(1)).assertEqual(2.5 as float);
        manager.doubleFixedArray = manager.createDoubleFixedArray(2);
        manager.setDoubleElement(0, 3.14159);
        manager.setDoubleElement(1, 2.71828);
        expect(manager.getDoubleElement(0)).assertEqual(3.14159);
        expect(manager.getDoubleElement(1)).assertEqual(2.71828);
        manager.refFixedArray = manager.createRefFixedArray(3);
        expect(manager.getRefElement(0) == null).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_OBJ_TYPE_ARRAYBUFFER_0500
     * @tc.name      test_arrayBufferObject_0005
     * @tc.desc      Scenario 7.5: ArrayBuffer object traversal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_arrayBufferObject_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ArrayBufferObjectManager();
        manager.bufferField = manager.createArrayBuffer(BUFFER_SIZE);
        expect(manager.bufferField != null).assertTrue();
        expect(manager.getByteLength()).assertEqual(BUFFER_SIZE);
        done();
      });

    /**
     * @tc.number    SUB_ANI_OBJ_TYPE_FUNCTION_OBJECT_0600
     * @tc.name      test_functionObject_0006
     * @tc.desc      Scenario 7.6: Function object traversal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_functionObject_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new FunctionObjectManager();
        let result = manager.createAndCallFunction();
        expect(result).assertEqual(EXPECTED_FUNC_RESULT);
        let callback = (x: int): int => x * 2;
        let callbackResult = manager.callWithCallback(callback, 5);
        expect(callbackResult).assertEqual(EXPECTED_CALLBACK_RESULT);
        let storedCallback = (): void => {
          console.log("Callback executed");
        };
        manager.storeCallback(storedCallback);
        manager.executeStoredCallback();
        done();
      });

    /**
     * @tc.number    SUB_ANI_OBJ_TYPE_ERROR_0700
     * @tc.name      test_errorObject_0007
     * @tc.desc      Scenario 7.7: Error object traversal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_errorObject_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ErrorObjectManager();
        try {
          manager.throwCustomError("Custom error message");
        } catch (e) {
          expect(e instanceof Error).assertTrue();
          if (e instanceof Error) {
            expect(e.message).assertEqual("Custom error message");
          }
        }
        let errorInfo = manager.catchAndHandleError();
        expect(errorInfo != null).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_OBJ_TYPE_ENUM_0800
     * @tc.name      test_enumObject_0008
     * @tc.desc      Scenario 7.8: Enum object traversal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_enumObject_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new EnumObjectManager();
        let redValue = manager.getEnumValueByName("Color", "RED");
        expect(redValue).assertEqual(EXPECTED_COLOR_RED);
        let blueValue = manager.getEnumValueByName("Color", "BLUE");
        expect(blueValue).assertEqual(EXPECTED_COLOR_BLUE);
        let colorCount = manager.getEnumItemCount("Color");
        expect(colorCount).assertEqual(EXPECTED_COLOR_COUNT);
        done();
      });

    /**
     * @tc.number    SUB_ANI_OBJ_TYPE_CLASS_0900
     * @tc.name      test_classObject_0009
     * @tc.desc      Scenario 7.9: Class object traversal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_classObject_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ClassObjectManager();
        let classObj = manager.findClassByName("std.core.String");
        expect(classObj != null).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_OBJ_TYPE_MODULE_1000
     * @tc.name      test_moduleObject_0010
     * @tc.desc      Scenario 7.10: Module object traversal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_moduleObject_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ModuleObjectManager();
        let funcResult = manager.getModuleFunction("TestModule", "moduleFunc");
        expect(funcResult).assertEqual(EXPECTED_MODULE_RESULT);
        done();
      });

    /**
     * @tc.number    SUB_ANI_OBJ_TYPE_NAMESPACE_1100
     * @tc.name      test_namespaceObject_0011
     * @tc.desc      Scenario 7.11: Namespace object traversal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_namespaceObject_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new NamespaceObjectManager();
        let funcResult = manager.getNamespaceFunction("TestNamespace", "namespaceFunc", [10, 20]);
        expect(funcResult).assertEqual(EXPECTED_NAMESPACE_RESULT);
        done();
      });
  })
}
