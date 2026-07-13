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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';
import { looseReflect } from './VoidFn.test';

class MyClass001 {
  public name: string = 'test';
  public count: int = 0;
}

class TestClass004 {
  public name: string = '';
  public age: int = 0;
}

class SpecialClass006 {
  public field_name: string = '';
  public $dollarField: string = '';
  public 字段名: string = '';
}

class UnicodeClass007 {
  public 名字: string = '';
  public имя: string = '';
  public 名前: string = '';
}

class CaseClass011 {
  public Name: string = '';
  public name: string = '';
  public NAME: string = '';
}

class TestClass012 {
  public myField: string = 'test';
}

class CompleteTest014 {
  public readonly data: string = 'value';
}

class TestClass015 {
  public name: string = '';
}

class PrivateTest016 {
  public publicField: string = '';
  private privateField: string = '';
}

class ProtectedTest017 {
  protected protectedField: string = '';
}

class ChildClass018 extends ParentClass018 {
  public name: string = '';
}

class ParentClass018 {
  public age: int = 0;
}

class Child019 extends Parent019 {
  public c: boolean = false;
}

class Parent019 extends GrandParent019 {
  public b: string = '';
}

class GrandParent019 {
  public a: int = 1;
}

class TypedClass021 {
  public strField: string = '';
  public numField: int = 0;
  public boolField: boolean = false;
  public arrField: Array<int> = [];
}

class LongName026 {
}

class KeywordName027 {
  public kwClass: string = '';
  public kwFunction: string = '';
  public kwReturn: string = '';
}

class ModifierClass028 {
  public readonly readonlyPublic: string = '';
  public mutablePublic: string = '';
}

export default function ClassGetInstanceFieldTest(): void {
  describe('ClassGetInstanceFieldTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_0100
     * @tc.name testClassGetInstanceField001
     * @tc.desc Verify ClassGetInstanceField case 001: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name');
      expect(field !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_0200
     * @tc.name testClassGetInstanceField002
     * @tc.desc Verify ClassGetInstanceField case 002: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let field = looseReflect(cls as Object).getInstanceField();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_0300
     * @tc.name testClassGetInstanceField003
     * @tc.desc Verify ClassGetInstanceField case 003: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let field = looseReflect(cls as Object).getInstanceField('name', 'extra');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_0400
     * @tc.name testClassGetInstanceField004
     * @tc.desc Verify ClassGetInstanceField case 004: Class.from<TestClass004>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass004>();
      let field1 = cls.getInstanceField('name');
      expect(field1!.getName()).assertEqual('name');

      let field2 = cls.getInstanceField('age');
      expect(field2!.getName()).assertEqual('age');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_0500
     * @tc.name testClassGetInstanceField005
     * @tc.desc Verify ClassGetInstanceField case 005: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('');
      expect(Utils.isAbsentOptional(field)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_0600
     * @tc.name testClassGetInstanceField006
     * @tc.desc Verify ClassGetInstanceField case 006: Class.from<SpecialClass006>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialClass006>();
      let field1 = cls.getInstanceField('field_name');
      expect(field1 !== undefined).assertTrue();
      expect(field1!.getName()).assertEqual('field_name');

      let field2 = cls.getInstanceField('$dollarField');
      expect(field2 !== undefined).assertTrue();
      expect(field2!.getName()).assertEqual('$dollarField');

      let field3 = cls.getInstanceField('字段名');
      expect(field3 !== undefined).assertTrue();
      expect(field3!.getName()).assertEqual('字段名');

      expect(cls.getInstanceField('field-name') === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_0700
     * @tc.name testClassGetInstanceField007
     * @tc.desc Verify ClassGetInstanceField case 007: Class.from<UnicodeClass007>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnicodeClass007>();
      let field1 = cls.getInstanceField('名字');
      expect(field1 !== undefined).assertTrue();
      expect(field1!.getName()).assertEqual('名字');

      let field2 = cls.getInstanceField('имя');
      expect(field2 !== undefined).assertTrue();
      expect(field2!.getName()).assertEqual('имя');

      let field3 = cls.getInstanceField('名前');
      expect(field3 !== undefined).assertTrue();
      expect(field3!.getName()).assertEqual('名前');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_0800
     * @tc.name testClassGetInstanceField008
     * @tc.desc Verify ClassGetInstanceField case 008: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let field = cls.getInstanceField(null as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_0900
     * @tc.name testClassGetInstanceField009
     * @tc.desc Verify ClassGetInstanceField case 009: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let field = cls.getInstanceField(undefined as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_1000
     * @tc.name testClassGetInstanceField010
     * @tc.desc Verify ClassGetInstanceField case 010: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let field = looseReflect(cls as Object).getInstanceField(123 as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_1100
     * @tc.name testClassGetInstanceField011
     * @tc.desc Verify ClassGetInstanceField case 011: Class.from<CaseClass011>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CaseClass011>();
      let field1 = cls.getInstanceField('Name');
      let field2 = cls.getInstanceField('name');
      let field3 = cls.getInstanceField('NAME');

      expect(field1!.getName()).assertEqual('Name');
      expect(field2!.getName()).assertEqual('name');
      expect(field3!.getName()).assertEqual('NAME');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_1200
     * @tc.name testClassGetInstanceField012
     * @tc.desc Verify ClassGetInstanceField case 012: Class.from<TestClass012>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass012>();
      let field = cls.getInstanceField('myField');

      expect(field !== null).assertTrue();
      expect(field instanceof reflect.InstanceField).assertTrue();
      expect(field!.getName()).assertEqual('myField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_1300
     * @tc.name testClassGetInstanceField013
     * @tc.desc Verify ClassGetInstanceField case 013: Class.from<TestClass012>(), isPublic flag verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass012>();
      let field = cls.getInstanceField('myField');

      expect(field!.getName() !== null).assertTrue();
      expect(field!.getType() !== null).assertTrue();
      expect(field!.getOwner() !== null).assertTrue();
      expect(typeof field!.isPublic()).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_1400
     * @tc.name testClassGetInstanceField014
     * @tc.desc Verify ClassGetInstanceField case 014: Class.from<CompleteTest014>(), isPrivate flag verified, isProtected flag verified, isPublic flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CompleteTest014>();
      let field = cls.getInstanceField('data');

      expect(field!.getName()).assertEqual('data');
      expect(field!.isReadonly()).assertTrue();
      expect(field!.isPublic()).assertTrue();
      expect(field!.isPrivate()).assertFalse();
      expect(field!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_1500
     * @tc.name testClassGetInstanceField015
     * @tc.desc Verify ClassGetInstanceField case 015: Class.from<TestClass015>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass015>();
      let field = cls.getInstanceField('remark');

      expect(field === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_1600
     * @tc.name testClassGetInstanceField016
     * @tc.desc Verify ClassGetInstanceField case 016: Class.from<PrivateTest016>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateTest016>();
      let field1 = cls.getInstanceField('publicField');
      expect(field1 !== null).assertTrue();

      let field2 = cls.getInstanceField('privateField');
      expect(field2 === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_1700
     * @tc.name testClassGetInstanceField017
     * @tc.desc Verify ClassGetInstanceField case 017: Class.from<ProtectedTest017>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedTest017>();
      let field = cls.getInstanceField('protectedField');
      expect(field === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_1800
     * @tc.name testClassGetInstanceField018
     * @tc.desc Verify ClassGetInstanceField case 018: Class.from<ChildClass018>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass018>();

      let nameField = cls.getInstanceField('name');
      expect(nameField !== null).assertTrue();

      let ageField = cls.getInstanceField('age');
      expect(ageField === undefined).assertTrue();

      let parentAgeField = cls.getSuper()!.getInstanceField('age');
      expect(parentAgeField !== null).assertTrue();
      expect(parentAgeField!.getName()).assertEqual('age');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_1900
     * @tc.name testClassGetInstanceField019
     * @tc.desc Verify ClassGetInstanceField case 019: Class.from<Child019>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Child019>();

      expect(childCls.getInstanceField('c') !== null).assertTrue();
      expect(childCls.getInstanceField('b') === undefined).assertTrue();
      expect(childCls.getInstanceField('a') === undefined).assertTrue();

      let parentCls = childCls.getSuper()!;
      expect(parentCls.getInstanceField('b') !== null).assertTrue();
      expect(parentCls.getInstanceField('a') === undefined).assertTrue();

      let grandParentCls = parentCls.getSuper()!;
      expect(grandParentCls.getInstanceField('a') !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_2000
     * @tc.name testClassGetInstanceField020
     * @tc.desc Verify ClassGetInstanceField case 020: Class.from<TypedClass021>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypedClass021>();

      let strField = cls.getInstanceField('strField');
      expect(strField!.getType().getName()).assertEqual('std.core.String');

      let numField = cls.getInstanceField('numField');
      expect(numField!.getType().getName()).assertEqual('i32');

      let boolField = cls.getInstanceField('boolField');
      expect(boolField!.getType().getName()).assertEqual(Class.PRIMITIVE_BOOLEAN.getName());

      let arrField = cls.getInstanceField('arrField');
      expect(arrField!.getType().getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_2100
     * @tc.name testClassGetInstanceField021
     * @tc.desc Verify ClassGetInstanceField case 021: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let field = looseReflect(cls as Object).getInstanceField(true as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_2200
     * @tc.name testClassGetInstanceField022
     * @tc.desc Verify ClassGetInstanceField case 022: Class.from<MyClass001>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      cls.initialize();
      let field = cls.getInstanceField('name');
      expect(field !== null).assertTrue();
      expect(field!.getName()).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_2300
     * @tc.name testClassGetInstanceField023
     * @tc.desc Verify ClassGetInstanceField case 023: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField('name');
      let field2 = cls.getInstanceField('name');
      expect(field1 !== null).assertTrue();
      expect(field2 !== null).assertTrue();
      expect(field1!.getName()).assertEqual(field2!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_2400
     * @tc.name testClassGetInstanceField024
     * @tc.desc Verify ClassGetInstanceField case 024: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name');
      expect(field !== null).assertTrue();
      expect(field!.getName()).assertEqual('name');
      expect(field!.getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_2500
     * @tc.name testClassGetInstanceField025
     * @tc.desc Verify ClassGetInstanceField case 025: Class.from<LongName026>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongName026>();
      let longName = 'a'.repeat(1000);
      let field = cls.getInstanceField(longName);
      expect(field === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_2600
     * @tc.name testClassGetInstanceField026
     * @tc.desc Verify ClassGetInstanceField case 026: Class.from<KeywordName027>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<KeywordName027>();
      let field1 = cls.getInstanceField('kwClass');
      let field2 = cls.getInstanceField('kwFunction');
      let field3 = cls.getInstanceField('kwReturn');

      expect(field1 !== null).assertTrue();
      expect(field2 !== null).assertTrue();
      expect(field3 !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_2700
     * @tc.name testClassGetInstanceField027
     * @tc.desc Verify ClassGetInstanceField case 027: Class.from<ModifierClass028>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierClass028>();

      let field1 = cls.getInstanceField('readonlyPublic');
      expect(field1 !== null).assertTrue();
      expect(field1!.isReadonly()).assertTrue();

      let field2 = cls.getInstanceField('mutablePublic');
      expect(field2 !== null).assertTrue();
      expect(field2!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELD_2800
     * @tc.name testClassGetInstanceField028
     * @tc.desc Verify ClassGetInstanceField case 028: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceField028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField('name');
      let field2 = cls.getInstanceField('name');

      expect(field1!.getName()).assertEqual(field2!.getName());
      expect(field1!.getType().getName()).assertEqual(field2!.getType().getName());
    });

  });
}

