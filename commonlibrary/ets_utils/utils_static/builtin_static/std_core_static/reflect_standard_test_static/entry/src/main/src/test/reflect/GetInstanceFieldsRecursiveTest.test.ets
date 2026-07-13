'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class NoFieldClass {
  public constructor() {
  }

  public method(): void {
  }
}

class BasicFieldClass {
  public name: string = "test";
}

class MixedTypeFieldClass {
  public name: string = "test";
  public age: int = 30;
  public score: float = 95.5f;
  public active: boolean = true;
}

class DefaultValueFieldClass {
  public name: string = "default";
  public count: int = 0;
  public enabled: boolean = false;
}

class ReadonlyFieldClass {
  public readonly constant: int = 100;
  public mutable: string = "text";
}

class BaseFieldClass {
  public baseField: string = "base";
}

class SingleInheritanceChildClass extends BaseFieldClass {
  public childField: string = "child";
}

class MidFieldClass extends BaseFieldClass {
  public midField: string = "mid";
}

class DerivedFieldClass extends MidFieldClass {
  public derivedField: string = "derived";
}

class ShadowBaseClass {
  public field: string = "base";
}

class ShadowDerivedClass extends ShadowBaseClass {
  public field: string = "derived";
}

class MixedAccessClass {
  public publicField: string = "public";
  private privateField: string = "private";
  protected protectedField: string = "protected";
}

class PrivateFieldClass {
  public publicField: string = "public";
  private privateField: string = "private";
}

class ProtectedFieldClass {
  public publicField: string = "public";
  protected protectedField: string = "protected";
}

interface EmptyFieldInterface {
  name: string;
  age: int;
}

class GenericFieldClass<T> {
  public readonly value: T;
  public count: int = 0;

  public constructor(value: T) {
    this.value = value;
  }
}

abstract class AbstractFieldClass {
  public field: string = "abstract";
}

class StaticFieldClass {
  public instanceField: string = "instance";
  public static staticField: string = "static";
}

class GetterSeparatedClass {
  public field: string = "field";
  private _prop: string = "prop";

  public get prop(): string {
    return this._prop;
  }
}

class DeepLevel1 {
  public field1: string = "1";
}

class DeepLevel2 extends DeepLevel1 {
  public field2: string = "2";
}

class DeepLevel3 extends DeepLevel2 {
  public field3: string = "3";
}

class DeepLevel4 extends DeepLevel3 {
  public field4: string = "4";
}

class DeepLevel5 extends DeepLevel4 {
  public field5: string = "5";
}

class ManyFieldsClass {
  public field1: string = "";
  public field2: string = "";
  public field3: string = "";
  public field4: string = "";
  public field5: string = "";
  public field6: string = "";
  public field7: string = "";
  public field8: string = "";
  public field9: string = "";
  public field10: string = "";
}

class SceneUser {
  public id: int = 0;
  public name: string = "";
  public email: string = "";
  public age: int = 0;
}

class SceneBaseClass {
  public baseProp: string = "base";
}

class SceneDerivedClass extends SceneBaseClass {
  public derivedProp: string = "derived";
}

class DynamicClass {
  public name: string = "Alice";
  public age: int = 30;
  public city: string = "Beijing";
}

class TypeInfoClass {
  public name: string = "";
  public age: int = 0;
  public score: float = 0.0f;
  public active: boolean = true;
  public data: Array<int> = [];
}

class ReadonlyGuardClass {
  public mutable: string = "change";
  public readonly immutable: string = "constant";
}

const FIELDS_TEST_MODULE_PREFIX: string =
  "entry.src.main.src.test.reflect.GetInstanceFieldsRecursiveTest.test.";

function verifyTypeInfoClassFieldTypes(): void {
  let cls = Class.from<TypeInfoClass>();
  let fields = reflect.getInstanceFieldsRecursive(cls);
  expect(fields.length).assertEqual(5);
  let nameType: string = "";
  let ageType: string = "";
  let scoreType: string = "";
  let activeType: string = "";
  let dataType: string = "";
  for (let field of fields) {
    if (field.getName() === "name") {
      nameType = field.getType().getName();
    }
    if (field.getName() === "age") {
      ageType = field.getType().getName();
    }
    if (field.getName() === "score") {
      scoreType = field.getType().getName();
    }
    if (field.getName() === "active") {
      activeType = field.getType().getName();
    }
    if (field.getName() === "data") {
      dataType = field.getType().getName();
    }
  }
  expect(nameType).assertEqual("std.core.String");
  expect(ageType).assertEqual("i32");
  expect(scoreType).assertEqual("f32");
  expect(activeType).assertEqual("u1");
  expect(dataType).assertEqual("std.core.Array");
}

function verifySceneDerivedClassFieldOwners(): void {
  let cls = Class.from<SceneDerivedClass>();
  let fields = reflect.getInstanceFieldsRecursive(cls);
  expect(fields.length).assertEqual(2);
  let baseOwner: string = "";
  let derivedOwner: string = "";
  for (let field of fields) {
    if (field.getName() === "baseProp") {
      baseOwner = field.getOwner().getName();
    }
    if (field.getName() === "derivedProp") {
      derivedOwner = field.getOwner().getName();
    }
  }
  expect(baseOwner).assertEqual(`${FIELDS_TEST_MODULE_PREFIX}SceneBaseClass`);
  expect(derivedOwner).assertEqual(`${FIELDS_TEST_MODULE_PREFIX}SceneDerivedClass`);
}

export default function GetInstanceFieldsRecursiveTest(): void {
  describe('GetInstanceFieldsRecursiveTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_0100
     * @tc.name testGetInstanceFieldsRecursive001
     * @tc.desc Verify GetInstanceFieldsRecursive case 001: Class.from<BasicFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_0200
     * @tc.name testGetInstanceFieldsRecursive002
     * @tc.desc Verify GetInstanceFieldsRecursive case 002: Class.from<NoFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_0300
     * @tc.name testGetInstanceFieldsRecursive003
     * @tc.desc Verify GetInstanceFieldsRecursive case 003: Class.of(instance), instance fields result verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new BasicFieldClass();
      let cls = Class.of(obj);
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual("name");
      expect(fields[0].getOwner().getName()).assertEqual(`${FIELDS_TEST_MODULE_PREFIX}BasicFieldClass`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_0400
     * @tc.name testGetInstanceFieldsRecursive004
     * @tc.desc Verify GetInstanceFieldsRecursive case 004: Class.from<MixedTypeFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypeFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields.length).assertEqual(4);
      let hasName = false;
      let hasAge = false;
      let hasScore = false;
      let hasActive = false;
      for (let field of fields) {
        if (field.getName() === "name") {
          hasName = true;
        }
        if (field.getName() === "age") {
          hasAge = true;
        }
        if (field.getName() === "score") {
          hasScore = true;
        }
        if (field.getName() === "active") {
          hasActive = true;
        }
      }
      expect(hasName).assertTrue();
      expect(hasAge).assertTrue();
      expect(hasScore).assertTrue();
      expect(hasActive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_0500
     * @tc.name testGetInstanceFieldsRecursive005
     * @tc.desc Verify GetInstanceFieldsRecursive case 005: Class.from<MixedTypeFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypeFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields.length).assertEqual(4);
      let nameType: string = "";
      let ageType: string = "";
      let scoreType: string = "";
      let activeType: string = "";
      for (let field of fields) {
        if (field.getName() === "name") {
          nameType = field.getType().getName();
        }
        if (field.getName() === "age") {
          ageType = field.getType().getName();
        }
        if (field.getName() === "score") {
          scoreType = field.getType().getName();
        }
        if (field.getName() === "active") {
          activeType = field.getType().getName();
        }
      }
      expect(nameType).assertEqual("std.core.String");
      expect(ageType).assertEqual("i32");
      expect(scoreType).assertEqual("f32");
      expect(activeType).assertEqual("u1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_0600
     * @tc.name testGetInstanceFieldsRecursive006
     * @tc.desc Verify GetInstanceFieldsRecursive case 006: Class.from<DefaultValueFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultValueFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(3);
      let nameCount: int = 0;
      let countCount: int = 0;
      let enabledCount: int = 0;
      for (let field of fields) {
        if (field.getName() === "name") {
          nameCount++;
        } else if (field.getName() === "count") {
          countCount++;
        } else if (field.getName() === "enabled") {
          enabledCount++;
        }
      }
      expect(nameCount).assertEqual(1);
      expect(countCount).assertEqual(1);
      expect(enabledCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_0700
     * @tc.name testGetInstanceFieldsRecursive007
     * @tc.desc Verify GetInstanceFieldsRecursive case 007: Class.from<ReadonlyFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      let constantFound = false;
      for (let field of fields) {
        if (field.getName() === "constant") {
          constantFound = true;
          expect(field.isReadonly()).assertTrue();
        }
      }
      expect(constantFound).assertTrue();
      expect(fields.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_0800
     * @tc.name testGetInstanceFieldsRecursive008
     * @tc.desc Verify GetInstanceFieldsRecursive case 008: Class.from<SingleInheritanceChildClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleInheritanceChildClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields.length).assertEqual(2);
      let hasBaseField = false;
      let hasChildField = false;
      for (let field of fields) {
        if (field.getName() === "baseField") {
          hasBaseField = true;
        }
        if (field.getName() === "childField") {
          hasChildField = true;
        }
      }
      expect(hasBaseField).assertTrue();
      expect(hasChildField).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_0900
     * @tc.name testGetInstanceFieldsRecursive009
     * @tc.desc Verify GetInstanceFieldsRecursive case 009: Class.from<DerivedFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DerivedFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(3);
      let baseFieldCount: int = 0;
      let midFieldCount: int = 0;
      let derivedFieldCount: int = 0;
      for (let field of fields) {
        if (field.getName() === "baseField") {
          baseFieldCount++;
        } else if (field.getName() === "midField") {
          midFieldCount++;
        } else if (field.getName() === "derivedField") {
          derivedFieldCount++;
        }
      }
      expect(baseFieldCount).assertEqual(1);
      expect(midFieldCount).assertEqual(1);
      expect(derivedFieldCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_1000
     * @tc.name testGetInstanceFieldsRecursive010
     * @tc.desc Verify GetInstanceFieldsRecursive case 010: Class.from<ShadowDerivedClass>(), instance fields result verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShadowDerivedClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      let fieldCount = 0;
      for (let field of fields) {
        if (field.getName() === "field") {
          fieldCount++;
        }
      }
      expect(fieldCount).assertEqual(1);
      expect(fields.length).assertEqual(1);
      expect(fields[0].getOwner().getName()).assertEqual(`${FIELDS_TEST_MODULE_PREFIX}ShadowBaseClass`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_1100
     * @tc.name testGetInstanceFieldsRecursive011
     * @tc.desc Verify GetInstanceFieldsRecursive case 011: Class.from<MixedAccessClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedAccessClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(1);
      let publicFieldCount: int = 0;
      for (let field of fields) {
        if (field.getName() === "publicField") {
          publicFieldCount++;
        }
      }
      expect(publicFieldCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_1200
     * @tc.name testGetInstanceFieldsRecursive012
     * @tc.desc Verify GetInstanceFieldsRecursive case 012: Class.from<PrivateFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(1);
      let publicFieldCount: int = 0;
      for (let field of fields) {
        if (field.getName() === "publicField") {
          publicFieldCount++;
        }
      }
      expect(publicFieldCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_1300
     * @tc.name testGetInstanceFieldsRecursive013
     * @tc.desc Verify GetInstanceFieldsRecursive case 013: Class.from<ProtectedFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(1);
      let publicFieldCount: int = 0;
      for (let field of fields) {
        if (field.getName() === "publicField") {
          publicFieldCount++;
        }
      }
      expect(publicFieldCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_1400
     * @tc.name testGetInstanceFieldsRecursive014
     * @tc.desc Verify GetInstanceFieldsRecursive case 014: Class.from<EmptyFieldInterface>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyFieldInterface>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_1500
     * @tc.name testGetInstanceFieldsRecursive015
     * @tc.desc Verify GetInstanceFieldsRecursive case 015: Class.from<GenericFieldClass<string>>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericFieldClass<string>>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(2);
      let valueCount: int = 0;
      let countCount: int = 0;
      for (let field of fields) {
        if (field.getName() === "value") {
          valueCount++;
        } else if (field.getName() === "count") {
          countCount++;
        }
      }
      expect(valueCount).assertEqual(1);
      expect(countCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_1600
     * @tc.name testGetInstanceFieldsRecursive016
     * @tc.desc Verify GetInstanceFieldsRecursive case 016: Class.from<AbstractFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(1);
      let fieldCount: int = 0;
      for (let field of fields) {
        if (field.getName() === "field") {
          fieldCount++;
        }
      }
      expect(fieldCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_1700
     * @tc.name testGetInstanceFieldsRecursive017
     * @tc.desc Verify GetInstanceFieldsRecursive case 017: Class.from<StaticFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(1);
      let instanceFieldCount: int = 0;
      for (let field of fields) {
        if (field.getName() === "instanceField") {
          instanceFieldCount++;
        }
      }
      expect(instanceFieldCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_1800
     * @tc.name testGetInstanceFieldsRecursive018
     * @tc.desc Verify GetInstanceFieldsRecursive case 018: invalid input throws ClassCastError, instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：nullish cast 至非 nullish 类型，运行时抛 ClassCastError
      try {
        reflect.getInstanceFieldsRecursive(null as Class);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_1900
     * @tc.name testGetInstanceFieldsRecursive019
     * @tc.desc Verify GetInstanceFieldsRecursive case 019: invalid input throws ClassCastError, instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：nullish cast 至非 nullish 类型，运行时抛 ClassCastError
      try {
        reflect.getInstanceFieldsRecursive(undefined as Class);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_2000
     * @tc.name testGetInstanceFieldsRecursive020
     * @tc.desc Verify GetInstanceFieldsRecursive case 020: invalid input throws ClassCastError, instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：非 Class 实例 cast，运行时抛 ClassCastError
      try {
        reflect.getInstanceFieldsRecursive((new BasicFieldClass()) as Class);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_2100
     * @tc.name testGetInstanceFieldsRecursive021
     * @tc.desc Verify GetInstanceFieldsRecursive case 021: invalid input throws ClassCastError, instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：非 Class 类型 cast，运行时抛 ClassCastError
      try {
        let invalidArg: int = 123;
        reflect.getInstanceFieldsRecursive(invalidArg as Class);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_2200
     * @tc.name testGetInstanceFieldsRecursive022
     * @tc.desc Verify GetInstanceFieldsRecursive case 022: invalid input throws ClassCastError, instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：非 Class 类型 cast，运行时抛 ClassCastError
      try {
        let invalidArg: string = "MyClass";
        reflect.getInstanceFieldsRecursive(invalidArg as Class);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_2300
     * @tc.name testGetInstanceFieldsRecursive023
     * @tc.desc Verify GetInstanceFieldsRecursive case 023: Class.from<SingleInheritanceChildClass>(), instance fields result verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleInheritanceChildClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      let baseOwner: string = "";
      for (let field of fields) {
        if (field.getName() === "baseField") {
          baseOwner = field.getOwner().getName();
        }
      }
      expect(baseOwner).assertEqual(`${FIELDS_TEST_MODULE_PREFIX}BaseFieldClass`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_2400
     * @tc.name testGetInstanceFieldsRecursive024
     * @tc.desc Verify GetInstanceFieldsRecursive case 024: Class.from<BasicFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicFieldClass>();
      let fields1 = reflect.getInstanceFieldsRecursive(cls);
      let fields2 = reflect.getInstanceFieldsRecursive(cls);
      expect(fields1 === fields2).assertFalse();
      expect(fields1.length).assertEqual(fields2.length);
      expect(fields1[0].getName()).assertEqual(fields2[0].getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_2500
     * @tc.name testGetInstanceFieldsRecursive025
     * @tc.desc Verify GetInstanceFieldsRecursive case 025: Class.from<GetterSeparatedClass>(), instance fields result verified, getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetterSeparatedClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(fields.length).assertEqual(1);
      expect(getters.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual("field");
      expect(getters[0].getName()).assertEqual("%%get-prop");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_2600
     * @tc.name testGetInstanceFieldsRecursive026
     * @tc.desc Verify GetInstanceFieldsRecursive case 026: Class.from<BasicFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(typeof fields).assertEqual("object");
      expect(fields.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_2700
     * @tc.name testGetInstanceFieldsRecursive027
     * @tc.desc Verify GetInstanceFieldsRecursive case 027: Class.from<BasicFieldClass>(), getName returns "name", instance fields result verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields.length).assertEqual(1);
      let field = fields[0];
      expect(field.getName()).assertEqual("name");
      expect(field.getType().getName()).assertEqual("std.core.String");
      expect(field.getOwner().getName()).assertEqual(`${FIELDS_TEST_MODULE_PREFIX}BasicFieldClass`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_2800
     * @tc.name testGetInstanceFieldsRecursive028
     * @tc.desc Verify GetInstanceFieldsRecursive case 028: Class.from<ReadonlyFieldClass>(), instance fields result verified, isPrivate flag verified, isProtected flag verified, isPublic flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields.length).assertEqual(2);
      let constantFound = false;
      for (let field of fields) {
        expect(field.isPublic()).assertTrue();
        expect(field.isPrivate()).assertFalse();
        expect(field.isProtected()).assertFalse();
        expect(field.isReadonly()).assertEqual(field.getName() === "constant");
        if (field.getName() === "constant") {
          constantFound = true;
        }
      }
      expect(constantFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_2900
     * @tc.name testGetInstanceFieldsRecursive029
     * @tc.desc Verify GetInstanceFieldsRecursive case 029: invalid input throws ClassCastError, Class.from<BasicFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      // 预期 compile-time warning：nullish cast 至非 nullish 类型，运行时抛 ClassCastError
      try {
        fields[0].getValue(null as Object);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_3000
     * @tc.name testGetInstanceFieldsRecursive030
     * @tc.desc Verify GetInstanceFieldsRecursive case 030: invalid input throws ClassCastError, Class.from<BasicFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      // 预期 compile-time warning：nullish cast 至非 nullish 类型，运行时抛 ClassCastError
      try {
        fields[0].getValue(undefined as Object);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_3100
     * @tc.name testGetInstanceFieldsRecursive031
     * @tc.desc Verify GetInstanceFieldsRecursive case 031: Class.from<DeepLevel5>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DeepLevel5>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(5);
      let field1Count: int = 0;
      let field2Count: int = 0;
      let field3Count: int = 0;
      let field4Count: int = 0;
      let field5Count: int = 0;
      for (let field of fields) {
        if (field.getName() === "field1") {
          field1Count++;
        } else if (field.getName() === "field2") {
          field2Count++;
        } else if (field.getName() === "field3") {
          field3Count++;
        } else if (field.getName() === "field4") {
          field4Count++;
        } else if (field.getName() === "field5") {
          field5Count++;
        }
      }
      expect(field1Count).assertEqual(1);
      expect(field2Count).assertEqual(1);
      expect(field3Count).assertEqual(1);
      expect(field4Count).assertEqual(1);
      expect(field5Count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_3200
     * @tc.name testGetInstanceFieldsRecursive032
     * @tc.desc Verify GetInstanceFieldsRecursive case 032: Class.from<ManyFieldsClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ManyFieldsClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(10);
      let field1Count: int = 0;
      let field2Count: int = 0;
      let field3Count: int = 0;
      let field4Count: int = 0;
      let field5Count: int = 0;
      let field6Count: int = 0;
      let field7Count: int = 0;
      let field8Count: int = 0;
      let field9Count: int = 0;
      let field10Count: int = 0;
      for (let field of fields) {
        if (field.getName() === "field1") {
          field1Count++;
        } else if (field.getName() === "field2") {
          field2Count++;
        } else if (field.getName() === "field3") {
          field3Count++;
        } else if (field.getName() === "field4") {
          field4Count++;
        } else if (field.getName() === "field5") {
          field5Count++;
        } else if (field.getName() === "field6") {
          field6Count++;
        } else if (field.getName() === "field7") {
          field7Count++;
        } else if (field.getName() === "field8") {
          field8Count++;
        } else if (field.getName() === "field9") {
          field9Count++;
        } else if (field.getName() === "field10") {
          field10Count++;
        }
      }
      expect(field1Count).assertEqual(1);
      expect(field2Count).assertEqual(1);
      expect(field3Count).assertEqual(1);
      expect(field4Count).assertEqual(1);
      expect(field5Count).assertEqual(1);
      expect(field6Count).assertEqual(1);
      expect(field7Count).assertEqual(1);
      expect(field8Count).assertEqual(1);
      expect(field9Count).assertEqual(1);
      expect(field10Count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_3300
     * @tc.name testGetInstanceFieldsRecursive033
     * @tc.desc Verify GetInstanceFieldsRecursive case 033: Class.from<SceneUser>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SceneUser>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(4);
      let idCount: int = 0;
      let nameCount: int = 0;
      let emailCount: int = 0;
      let ageCount: int = 0;
      for (let field of fields) {
        if (field.getName() === "id") {
          idCount++;
        } else if (field.getName() === "name") {
          nameCount++;
        } else if (field.getName() === "email") {
          emailCount++;
        } else if (field.getName() === "age") {
          ageCount++;
        }
      }
      expect(idCount).assertEqual(1);
      expect(nameCount).assertEqual(1);
      expect(emailCount).assertEqual(1);
      expect(ageCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_3400
     * @tc.name testGetInstanceFieldsRecursive034
     * @tc.desc Verify GetInstanceFieldsRecursive case 034: Class.from<SceneDerivedClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SceneDerivedClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      let baseFound = false;
      let derivedFound = false;
      for (let field of fields) {
        if (field.getName() === "baseProp") {
          baseFound = true;
        }
        if (field.getName() === "derivedProp") {
          derivedFound = true;
        }
      }
      expect(baseFound).assertTrue();
      expect(derivedFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_3500
     * @tc.name testGetInstanceFieldsRecursive035
     * @tc.desc Verify GetInstanceFieldsRecursive case 035: Class.from<DynamicClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new DynamicClass();
      let cls = Class.from<DynamicClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      let nameFound = false;
      let ageFound = false;
      let cityFound = false;
      for (let field of fields) {
        if (field.getName() === "name") {
          nameFound = true;
          let fieldValue = field.getValue(obj);
          expect(fieldValue instanceof string).assertTrue();
          expect(fieldValue as string).assertEqual("Alice");
          field.setValue(obj, "Bob");
        } else if (field.getName() === "age") {
          ageFound = true;
          let fieldValue = field.getValue(obj);
          expect(fieldValue instanceof int).assertTrue();
          expect(fieldValue as int).assertEqual(30);
          field.setValue(obj, 35);
        } else if (field.getName() === "city") {
          cityFound = true;
          let fieldValue = field.getValue(obj);
          expect(fieldValue instanceof string).assertTrue();
          expect(fieldValue as string).assertEqual("Beijing");
          field.setValue(obj, "Shanghai");
        }
      }
      expect(nameFound).assertTrue();
      expect(ageFound).assertTrue();
      expect(cityFound).assertTrue();
      expect(obj.name).assertEqual("Bob");
      expect(obj.age).assertEqual(35);
      expect(obj.city).assertEqual("Shanghai");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_3600
     * @tc.name testGetInstanceFieldsRecursive036
     * @tc.desc Verify GetInstanceFieldsRecursive case 036: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      verifyTypeInfoClassFieldTypes();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_3700
     * @tc.name testGetInstanceFieldsRecursive037
     * @tc.desc Verify GetInstanceFieldsRecursive case 037: invalid input throws TypeError, Class.from<ReadonlyGuardClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ReadonlyGuardClass();
      let cls = Class.from<ReadonlyGuardClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      let immutableFound = false;
      for (let field of fields) {
        if (field.getName() === "immutable") {
          immutableFound = true;
          expect(field.isReadonly()).assertTrue();
          try {
            field.setValue(obj, "new value");
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual('TypeError');
          }
        }
      }
      expect(immutableFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_3800
     * @tc.name testGetInstanceFieldsRecursive038
     * @tc.desc Verify GetInstanceFieldsRecursive case 038: Class.from<BasicFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicFieldClass>();
      for (let i = 0; i < 20; i++) {
        let fields = reflect.getInstanceFieldsRecursive(cls);
        expect(fields.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_3900
     * @tc.name testGetInstanceFieldsRecursive039
     * @tc.desc Verify GetInstanceFieldsRecursive case 039: Class.from<BasicFieldClass>(), instance fields result verified, isPrivate flag verified, isProtected flag verified, isPublic flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields.length).assertEqual(1);
      expect(fields[0].isPublic()).assertTrue();
      expect(fields[0].isPrivate()).assertFalse();
      expect(fields[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_4000
     * @tc.name testGetInstanceFieldsRecursive040
     * @tc.desc Verify GetInstanceFieldsRecursive case 040: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      verifySceneDerivedClassFieldOwners();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_4100
     * @tc.name testGetInstanceFieldsRecursive041
     * @tc.desc Verify GetInstanceFieldsRecursive case 041: invalid input throws TypeError, Class.from<ReadonlyFieldClass>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ReadonlyFieldClass();
      let cls = Class.from<ReadonlyFieldClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      let constantFound = false;
      for (let field of fields) {
        if (field.getName() === "constant") {
          constantFound = true;
          try {
            field.setValue(obj, 200);
            expect().assertFail();
          } catch (error) {
            expect(error.name).assertEqual('TypeError');
          }
        }
      }
      expect(constantFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_4200
     * @tc.name testGetInstanceFieldsRecursive042
     * @tc.desc Verify GetInstanceFieldsRecursive case 042: Class.from<BasicFieldClass>(), instance fields result verified, equals returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicFieldClass>();
      let fields1 = reflect.getInstanceFieldsRecursive(cls);
      let fields2 = reflect.getInstanceFieldsRecursive(cls);
      expect(fields1[0].equals(fields2[0])).assertTrue();
      expect(fields1[0] === fields2[0]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_4300
     * @tc.name testGetInstanceFieldsRecursive043
     * @tc.desc Verify GetInstanceFieldsRecursive case 043: instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new BasicFieldClass();
      let cls = Class.ofAny(obj);
      if (cls === undefined) {
        expect().assertFail();
        return;
      }
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual("name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_4400
     * @tc.name testGetInstanceFieldsRecursive044
     * @tc.desc Verify GetInstanceFieldsRecursive case 044: Class.from<int>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields instanceof Array).assertTrue();
      expect(fields.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_FIELDS_RECURSIVE_4500
     * @tc.name testGetInstanceFieldsRecursive045
     * @tc.desc Verify GetInstanceFieldsRecursive case 045: instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceFieldsRecursive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.PRIMITIVE_INT;
      let fields = reflect.getInstanceFieldsRecursive(cls);
      expect(fields.length).assertEqual(0);
    });
  });
}
