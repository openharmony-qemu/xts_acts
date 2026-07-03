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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';
import { looseReflect } from './VoidFn.test';

class MyClass001 {
  public static name: string = 'test';
  public static count: int = 0;
}

class TestClass004 {
  public static name: string = '';
  public static age: int = 0;
}

class SpecialClass006 {
  public static field_name: string = '';
  public static $dollarField: string = '';
  public static 字段名: string = '';
}

class UnicodeClass007 {
  public static 名字: string = '';
  public static имя: string = '';
  public static 名前: string = '';
}

class CaseClass011 {
  public static Name: string = '';
  public static name: string = '';
  public static NAME: string = '';
}

class TestClass012 {
  public static myField: string = 'test';
}

class CompleteTest014 {
  public static readonly CONSTANT: int = 42;
}

class ValueClass015 {
  public static value: string = 'static value';
}

class TestClass016 {
  public static name: string = '';
}

class PrivateTest017 {
  public static publicField: string = '';
  private static privateField: string = '';
}

class ProtectedTest018 {
  protected static protectedField: string = '';
}

class ConstClass019 {
  public static readonly MAX_VALUE: int = 100;
}

class ChildClass020 extends ParentClass020 {
  public static name: string = '';
}

class ParentClass020 {
  public static age: int = 0;
}

class Child021 extends Parent021 {
  public static c: boolean = false;
}

class Parent021 extends GrandParent021 {
  public static b: string = '';
}

class GrandParent021 {
  public static a: int = 1;
}

class Child022 extends Parent022 {
  public static data: string = 'child';
}

class Parent022 {
  public static data: string = 'parent';
}

class TypedClass023 {
  public static strField: string = '';
  public static numField: int = 0;
  public static boolField: boolean = false;
  public static arrField: Array<int> = [];
}

class LongName028 {
}

class KeywordName029 {
  public static kwClass: string = '';
  public static kwFunction: string = '';
  public static kwReturn: string = '';
}

class ValueTest030 {
  public static counter: int = 0;
}

class ValueTest031 {
  public static counter: int = 0;
}

class ReadonlyTest032 {
  public static readonly CONSTANT: int = 100;
}

class ModifierClass033 {
  public static readonly CONSTANT: string = '';
  public static variable: string = '';
}

class SameName035 {
  public static data: string = 'static';
  public data: string = 'instance';
}

export default function ClassGetStaticFieldTest(): void {
  describe('ClassGetStaticFieldTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_0100
     * @tc.name testClassGetStaticField001
     * @tc.desc Verify ClassGetStaticField case 001: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getStaticField('name');
      expect(field !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_0200
     * @tc.name testClassGetStaticField002
     * @tc.desc Verify ClassGetStaticField case 002: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let field = looseReflect(cls as Object).getStaticField();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_0300
     * @tc.name testClassGetStaticField003
     * @tc.desc Verify ClassGetStaticField case 003: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let field = looseReflect(cls as Object).getStaticField('name', 'extra');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_0400
     * @tc.name testClassGetStaticField004
     * @tc.desc Verify ClassGetStaticField case 004: Class.from<TestClass004>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass004>();
      let field1 = cls.getStaticField('name');
      expect(field1!.getName()).assertEqual('name');

      let field2 = cls.getStaticField('age');
      expect(field2!.getName()).assertEqual('age');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_0500
     * @tc.name testClassGetStaticField005
     * @tc.desc Verify ClassGetStaticField case 005: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getStaticField('');
      expect(Utils.isAbsentOptional(field)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_0600
     * @tc.name testClassGetStaticField006
     * @tc.desc Verify ClassGetStaticField case 006: Class.from<SpecialClass006>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialClass006>();
      let field1 = cls.getStaticField('field_name');
      expect(field1 !== undefined).assertTrue();
      expect(field1!.getName()).assertEqual('field_name');

      let field2 = cls.getStaticField('$dollarField');
      expect(field2 !== undefined).assertTrue();
      expect(field2!.getName()).assertEqual('$dollarField');

      let field3 = cls.getStaticField('字段名');
      expect(field3 !== undefined).assertTrue();
      expect(field3!.getName()).assertEqual('字段名');

      expect(cls.getStaticField('field-name') === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_0700
     * @tc.name testClassGetStaticField007
     * @tc.desc Verify ClassGetStaticField case 007: Class.from<UnicodeClass007>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnicodeClass007>();
      let field1 = cls.getStaticField('名字');
      expect(field1 !== undefined).assertTrue();
      expect(field1!.getName()).assertEqual('名字');

      let field2 = cls.getStaticField('имя');
      expect(field2 !== undefined).assertTrue();
      expect(field2!.getName()).assertEqual('имя');

      let field3 = cls.getStaticField('名前');
      expect(field3 !== undefined).assertTrue();
      expect(field3!.getName()).assertEqual('名前');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_0800
     * @tc.name testClassGetStaticField008
     * @tc.desc Verify ClassGetStaticField case 008: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let field = cls.getStaticField(null as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_0900
     * @tc.name testClassGetStaticField009
     * @tc.desc Verify ClassGetStaticField case 009: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let field = cls.getStaticField(undefined as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_1000
     * @tc.name testClassGetStaticField010
     * @tc.desc Verify ClassGetStaticField case 010: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let field = looseReflect(cls as Object).getStaticField(123 as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_1100
     * @tc.name testClassGetStaticField011
     * @tc.desc Verify ClassGetStaticField case 011: Class.from<CaseClass011>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CaseClass011>();
      let field1 = cls.getStaticField('Name');
      let field2 = cls.getStaticField('name');
      let field3 = cls.getStaticField('NAME');

      expect(field1!.getName()).assertEqual('Name');
      expect(field2!.getName()).assertEqual('name');
      expect(field3!.getName()).assertEqual('NAME');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_1200
     * @tc.name testClassGetStaticField012
     * @tc.desc Verify ClassGetStaticField case 012: Class.from<TestClass012>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass012>();
      let field = cls.getStaticField('myField');

      expect(field !== null).assertTrue();
      expect(field instanceof reflect.StaticField).assertTrue();
      expect(field!.getName()).assertEqual('myField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_1300
     * @tc.name testClassGetStaticField013
     * @tc.desc Verify ClassGetStaticField case 013: Class.from<TestClass012>(), isPublic flag verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass012>();
      let field = cls.getStaticField('myField');

      expect(field!.getName() !== null).assertTrue();
      expect(field!.getType() !== null).assertTrue();
      expect(field!.getOwner() !== null).assertTrue();
      expect(typeof field!.isPublic()).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_1400
     * @tc.name testClassGetStaticField014
     * @tc.desc Verify ClassGetStaticField case 014: Class.from<CompleteTest014>(), isPrivate flag verified, isProtected flag verified, isPublic flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CompleteTest014>();
      let field = cls.getStaticField('CONSTANT');

      expect(field!.getName()).assertEqual('CONSTANT');
      expect(field!.isReadonly()).assertTrue();
      expect(field!.isPublic()).assertTrue();
      expect(field!.isPrivate()).assertFalse();
      expect(field!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_1500
     * @tc.name testClassGetStaticField015
     * @tc.desc Verify ClassGetStaticField case 015: Class.from<ValueClass015>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValueClass015>();
      let field = cls.getStaticField('value');

      expect(field!.getName()).assertEqual('value');
      let value = field!.getValue(cls);
      expect(value as string).assertEqual('static value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_1600
     * @tc.name testClassGetStaticField016
     * @tc.desc Verify ClassGetStaticField case 016: Class.from<TestClass016>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass016>();
      let field = cls.getStaticField('remark');

      expect(field === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_1700
     * @tc.name testClassGetStaticField017
     * @tc.desc Verify ClassGetStaticField case 017: Class.from<PrivateTest017>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateTest017>();
      let field1 = cls.getStaticField('publicField');
      expect(field1 !== null).assertTrue();

      let field2 = cls.getStaticField('privateField');
      expect(field2 === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_1800
     * @tc.name testClassGetStaticField018
     * @tc.desc Verify ClassGetStaticField case 018: Class.from<ProtectedTest018>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedTest018>();
      let field = cls.getStaticField('protectedField');
      expect(field === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_1900
     * @tc.name testClassGetStaticField019
     * @tc.desc Verify ClassGetStaticField case 019: Class.from<ConstClass019>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConstClass019>();
      let field = cls.getStaticField('MAX_VALUE');
      expect(field !== null).assertTrue();
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_2000
     * @tc.name testClassGetStaticField020
     * @tc.desc Verify ClassGetStaticField case 020: Class.from<ChildClass020>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass020>();

      let nameField = cls.getStaticField('name');
      expect(nameField !== null).assertTrue();

      let ageField = cls.getStaticField('age');
      expect(ageField === undefined).assertTrue();

      let parentAgeField = cls.getSuper()!.getStaticField('age');
      expect(parentAgeField !== null).assertTrue();
      expect(parentAgeField!.getName()).assertEqual('age');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_2100
     * @tc.name testClassGetStaticField021
     * @tc.desc Verify ClassGetStaticField case 021: Class.from<Child021>(), getSuper returns expected parent Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Child021>();

      expect(childCls.getStaticField('c') !== null).assertTrue();
      expect(childCls.getStaticField('b') === undefined).assertTrue();
      expect(childCls.getStaticField('a') === undefined).assertTrue();

      let parentCls = childCls.getSuper()!;
      expect(parentCls.getStaticField('b') !== null).assertTrue();
      expect(parentCls.getStaticField('a') === undefined).assertTrue();

      let grandParentCls = parentCls.getSuper()!;
      expect(grandParentCls.getStaticField('a') !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_2200
     * @tc.name testClassGetStaticField022
     * @tc.desc Verify ClassGetStaticField case 022: Class.from<Child022>(), getSuper returns expected parent Class, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Child022>();

      let childField = childCls.getStaticField('data');
      expect(childField !== null).assertTrue();
      expect(childField!.getOwner().getName()).assertEqual('entry.src.main.src.test.class.ClassGetStaticFieldTest.test.Child022');
      expect(childField!.getValue(childCls) as string).assertEqual('child');

      let parentField = childCls.getSuper()!.getStaticField('data');
      expect(parentField !== null).assertTrue();
      expect(parentField!.getOwner().getName()).assertEqual('entry.src.main.src.test.class.ClassGetStaticFieldTest.test.Parent022');
      expect(parentField!.getValue(childCls.getSuper()!) as string).assertEqual('parent');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_2300
     * @tc.name testClassGetStaticField023
     * @tc.desc Verify ClassGetStaticField case 023: Class.from<TypedClass023>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TypedClass023>();

      let strField = cls.getStaticField('strField');
      expect(strField!.getType().getName()).assertEqual('std.core.String');

      let numField = cls.getStaticField('numField');
      expect(numField!.getType().getName()).assertEqual('i32');

      let boolField = cls.getStaticField('boolField');
      expect(boolField!.getType().getName()).assertEqual(Class.PRIMITIVE_BOOLEAN.getName());

      let arrField = cls.getStaticField('arrField');
      expect(arrField!.getType().getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_2400
     * @tc.name testClassGetStaticField024
     * @tc.desc Verify ClassGetStaticField case 024: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let field = looseReflect(cls as Object).getStaticField(true as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_2500
     * @tc.name testClassGetStaticField025
     * @tc.desc Verify ClassGetStaticField case 025: Class.from<MyClass001>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      cls.initialize();
      let field = cls.getStaticField('name');
      expect(field !== null).assertTrue();
      expect(field!.getName()).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_2600
     * @tc.name testClassGetStaticField026
     * @tc.desc Verify ClassGetStaticField case 026: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getStaticField('name');
      let field2 = cls.getStaticField('name');
      expect(field1 !== null).assertTrue();
      expect(field2 !== null).assertTrue();
      expect(field1!.getName()).assertEqual(field2!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_2700
     * @tc.name testClassGetStaticField027
     * @tc.desc Verify ClassGetStaticField case 027: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getStaticField('name');
      expect(field !== null).assertTrue();
      expect(field!.getName()).assertEqual('name');
      expect(field!.getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_2800
     * @tc.name testClassGetStaticField028
     * @tc.desc Verify ClassGetStaticField case 028: Class.from<LongName028>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongName028>();
      let longName = 'a'.repeat(1000);
      let field = cls.getStaticField(longName);
      expect(field === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_2900
     * @tc.name testClassGetStaticField029
     * @tc.desc Verify ClassGetStaticField case 029: Class.from<KeywordName029>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<KeywordName029>();
      let field1 = cls.getStaticField('kwClass');
      let field2 = cls.getStaticField('kwFunction');
      let field3 = cls.getStaticField('kwReturn');

      expect(field1 !== null).assertTrue();
      expect(field2 !== null).assertTrue();
      expect(field3 !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_3000
     * @tc.name testClassGetStaticField030
     * @tc.desc Verify ClassGetStaticField case 030: Class.from<ValueTest030>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValueTest030>();
      let field = cls.getStaticField('counter');
      let value = field!.getValue(cls);
      expect(value as int).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_3100
     * @tc.name testClassGetStaticField031
     * @tc.desc Verify ClassGetStaticField case 031: Class.from<ValueTest031>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValueTest031>();
      let field = cls.getStaticField('counter');

      field!.setValue(cls, 42);
      let newValue = field!.getValue(cls);
      expect(newValue as int).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_3200
     * @tc.name testClassGetStaticField032
     * @tc.desc Verify ClassGetStaticField case 032: invalid input throws TypeError, Class.from<ReadonlyTest032>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyTest032>();
      let field = cls.getStaticField('CONSTANT');
      expect(field !== undefined && field !== null).assertTrue();
      expect(field!.isReadonly()).assertTrue();

      try {
        field!.setValue(200);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_3300
     * @tc.name testClassGetStaticField033
     * @tc.desc Verify ClassGetStaticField case 033: Class.from<ModifierClass033>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierClass033>();

      let field1 = cls.getStaticField('CONSTANT');
      expect(field1 !== null).assertTrue();
      expect(field1!.isReadonly()).assertTrue();

      let field2 = cls.getStaticField('variable');
      expect(field2 !== null).assertTrue();
      expect(field2!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_3400
     * @tc.name testClassGetStaticField034
     * @tc.desc Verify ClassGetStaticField case 034: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getStaticField('name');
      let field2 = cls.getStaticField('name');

      expect(field1!.getName()).assertEqual(field2!.getName());
      expect(field1!.getType().getName()).assertEqual(field2!.getType().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELD_3500
     * @tc.name testClassGetStaticField035
     * @tc.desc Verify ClassGetStaticField case 035: Class.from<SameName035>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticField035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SameName035>();

      let staticField = cls.getStaticField('data');
      expect(staticField !== null).assertTrue();
      expect(staticField!.getValue(cls) as string).assertEqual('static');

      let instanceField = cls.getInstanceField('data');
      expect(instanceField !== null).assertTrue();
    });

  });
}

