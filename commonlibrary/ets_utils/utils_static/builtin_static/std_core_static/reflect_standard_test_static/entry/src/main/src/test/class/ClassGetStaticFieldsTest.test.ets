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

function asStaticFieldArray(fields: FixedArray<reflect.StaticField>): Array<reflect.StaticField> {
  return Utils.fixedArrayToArray(fields);
}

function asInstanceFieldArrayFromCls(fields: FixedArray<reflect.InstanceField>): Array<reflect.InstanceField> {
  return Utils.fixedArrayToArray(fields);
}

class MyClass001 {
  public static name: string = 'test';
  private static count: int = 0;
}

class TestClass003 {
  public static field1: string = '';
  public static field2: int = 0;
  private static field3: boolean = true;
}

class MixedTypes005 {
  public static str: string = '';
  public static num: int = 0;
  public static bool: boolean = false;
  public static arr: Array<int> = [];
  public static obj: Object = {};
}

class EmptyClass006 {
  private static field: string = '';
}

class PrivateOnly007 {
  private static secret: string = 'hidden';
  protected static data: int = 42;
}

class ConstClass008 {
  public static readonly CONSTANT: string = 'constant';
  public static variable: string = 'variable';
}

class ChildClass009 extends ParentClass009 {
  public static name: string = '';
}

class ParentClass009 {
  public static age: int = 0;
}

class Child010 extends Parent010 {
  public static c: boolean = false;
}

class Parent010 extends GrandParent010 {
  public static b: string = '';
}

class GrandParent010 {
  public static a: int = 1;
}

class Derived011 extends Base011 {
  public static derivedField: string = 'derived';
}

class Base011 {
  public static baseField: string = 'base';
}

class TestClass012 {
  public static readonly NAME: string = 'test';
  public static count: int = 0;
}

class ValueClass013 {
  public static value: string = 'static value';
}

class LargeClass018 {
  public static f1: int = 1;
  public static f2: int = 2;
  public static f3: int = 3;
  public static f4: int = 4;
  public static f5: int = 5;
  public static f6: int = 6;
  public static f7: int = 7;
  public static f8: int = 8;
  public static f9: int = 9;
  public static f10: int = 10;
  public static f11: int = 11;
  public static f12: int = 12;
  public static f13: int = 13;
  public static f14: int = 14;
  public static f15: int = 15;
  public static f16: int = 16;
  public static f17: int = 17;
  public static f18: int = 18;
  public static f19: int = 19;
  public static f20: int = 20;
  public static f21: int = 21;
  public static f22: int = 22;
  public static f23: int = 23;
  public static f24: int = 24;
  public static f25: int = 25;
  public static f26: int = 26;
  public static f27: int = 27;
  public static f28: int = 28;
  public static f29: int = 29;
  public static f30: int = 30;
  public static f31: int = 31;
  public static f32: int = 32;
  public static f33: int = 33;
  public static f34: int = 34;
  public static f35: int = 35;
  public static f36: int = 36;
  public static f37: int = 37;
  public static f38: int = 38;
  public static f39: int = 39;
  public static f40: int = 40;
  public static f41: int = 41;
  public static f42: int = 42;
  public static f43: int = 43;
  public static f44: int = 44;
  public static f45: int = 45;
  public static f46: int = 46;
  public static f47: int = 47;
  public static f48: int = 48;
  public static f49: int = 49;
  public static f50: int = 50;
  public static f51: int = 51;
  public static f52: int = 52;
  public static f53: int = 53;
  public static f54: int = 54;
  public static f55: int = 55;
  public static f56: int = 56;
  public static f57: int = 57;
  public static f58: int = 58;
  public static f59: int = 59;
  public static f60: int = 60;
  public static f61: int = 61;
  public static f62: int = 62;
  public static f63: int = 63;
  public static f64: int = 64;
  public static f65: int = 65;
  public static f66: int = 66;
  public static f67: int = 67;
  public static f68: int = 68;
  public static f69: int = 69;
  public static f70: int = 70;
  public static f71: int = 71;
  public static f72: int = 72;
  public static f73: int = 73;
  public static f74: int = 74;
  public static f75: int = 75;
  public static f76: int = 76;
  public static f77: int = 77;
  public static f78: int = 78;
  public static f79: int = 79;
  public static f80: int = 80;
  public static f81: int = 81;
  public static f82: int = 82;
  public static f83: int = 83;
  public static f84: int = 84;
  public static f85: int = 85;
  public static f86: int = 86;
  public static f87: int = 87;
  public static f88: int = 88;
  public static f89: int = 89;
  public static f90: int = 90;
  public static f91: int = 91;
  public static f92: int = 92;
  public static f93: int = 93;
  public static f94: int = 94;
  public static f95: int = 95;
  public static f96: int = 96;
  public static f97: int = 97;
  public static f98: int = 98;
  public static f99: int = 99;
  public static f100: int = 100;
}

class SpecialNames019 {
  public static field_name: string = '';
  public static 字段名: string = '';
  public static 名字: string = '';
  public static имя: string = '';
}

class AccessTest020 {
  public static publicField: string = 'public';
  private static privateField: string = 'private';
  protected static protectedField: string = 'protected';
  private static pkgField: string = 'internal';
}

class ReadonlyTest021 {
  public static readonly CONSTANT: int = 42;
  public static variable: int = 0;
}

class MixedClass022 {
  public static staticField: string = 'static';
  public instanceField: string = 'instance';
  private static privateStatic: string = '';
  private instancePrivate: string = '';
}

class InitClass024 {
  public static initialized: string = 'value';
  public static computed: int = 42 + 58;
}

export default function ClassGetStaticFieldsTest(): void {
  describe('ClassGetStaticFieldsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0100
     * @tc.name testClassGetStaticFields001
     * @tc.desc Verify ClassGetStaticFields case 001: Class.from<MyClass001>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      expect(fields.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0200
     * @tc.name testClassGetStaticFields002
     * @tc.desc Verify ClassGetStaticFields case 002: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let fields = looseReflect(cls as Object).getStaticFields('invalid');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0300
     * @tc.name testClassGetStaticFields003
     * @tc.desc Verify ClassGetStaticFields case 003: Class.from<TestClass003>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass003>();
      let fields = asStaticFieldArray(cls.getStaticFields());

      expect(fields.length).assertEqual(2);
      for (let i = 0; i < fields.length; i++) {
        let ok: boolean = fields[i] instanceof reflect.StaticField;
        expect(ok).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0400
     * @tc.name testClassGetStaticFields004
     * @tc.desc Verify ClassGetStaticFields case 004: Class.from<TestClass003>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass003>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      for (let i = 0; i < fields.length; i++) {
        let ok: boolean = fields[i] instanceof reflect.StaticField;
        expect(ok).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0500
     * @tc.name testClassGetStaticFields005
     * @tc.desc Verify ClassGetStaticFields case 005: Class.from<MixedTypes005>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes005>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      expect(fields.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0600
     * @tc.name testClassGetStaticFields006
     * @tc.desc Verify ClassGetStaticFields case 006: Class.from<EmptyClass006>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass006>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      expect(fields.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0700
     * @tc.name testClassGetStaticFields007
     * @tc.desc Verify ClassGetStaticFields case 007: Class.from<PrivateOnly007>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateOnly007>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      expect(fields.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0800
     * @tc.name testClassGetStaticFields008
     * @tc.desc Verify ClassGetStaticFields case 008: Class.from<ConstClass008>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConstClass008>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      expect(fields.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0900
     * @tc.name testClassGetStaticFields009
     * @tc.desc Verify ClassGetStaticFields case 009: Class.from<ChildClass009>(), getSuper returns expected parent Class, getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass009>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      expect(fields.length).assertEqual(1);

      let parentFields = asStaticFieldArray(cls.getSuper()!.getStaticFields());
      expect(parentFields.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1000
     * @tc.name testClassGetStaticFields010
     * @tc.desc Verify ClassGetStaticFields case 010: Class.from<Child010>(), getSuper returns expected parent Class, getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Child010>();
      let childFields = asStaticFieldArray(childCls.getStaticFields());
      expect(childFields.length).assertEqual(1);

      let parentFields = asStaticFieldArray(childCls.getSuper()!.getStaticFields());
      expect(parentFields.length).assertEqual(1);

      let grandParentFields = asStaticFieldArray(childCls.getSuper()!.getSuper()!.getStaticFields());
      expect(grandParentFields.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1100
     * @tc.name testClassGetStaticFields011
     * @tc.desc Verify ClassGetStaticFields case 011: Class.from<Derived011>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let derivedCls = Class.from<Derived011>();
      let fields = asStaticFieldArray(derivedCls.getStaticFields());

      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('derivedField');

      let baseCls = Class.from<Base011>();
      let baseFields = asStaticFieldArray(baseCls.getStaticFields());
      expect(baseFields.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1200
     * @tc.name testClassGetStaticFields012
     * @tc.desc Verify ClassGetStaticFields case 012: Class.from<TestClass012>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass012>();
      let fields = asStaticFieldArray(cls.getStaticFields());

      let nameField = fields[0];
      expect(nameField.getName()).assertEqual('NAME');
      expect(nameField.isReadonly()).assertTrue();

      let countField = fields[1];
      expect(countField.getName()).assertEqual('count');
      expect(countField.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1300
     * @tc.name testClassGetStaticFields013
     * @tc.desc Verify ClassGetStaticFields case 013: Class.from<ValueClass013>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValueClass013>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      let field = fields[0];

      expect(field.getName()).assertEqual('value');
      let value = field.getValue(cls);
      expect(value as string).assertEqual('static value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1400
     * @tc.name testClassGetStaticFields014
     * @tc.desc Verify ClassGetStaticFields case 014: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let fields = looseReflect(cls as Object).getStaticFields('extra');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1500
     * @tc.name testClassGetStaticFields015
     * @tc.desc Verify ClassGetStaticFields case 015: Class.from<MyClass001>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1600
     * @tc.name testClassGetStaticFields016
     * @tc.desc Verify ClassGetStaticFields case 016: Class.from<MyClass001>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let fields1 = asStaticFieldArray(cls.getStaticFields());
      let fields2 = asStaticFieldArray(cls.getStaticFields());
      expect(fields1.length).assertEqual(fields2.length);
      expect(fields1[0].getName()).assertEqual(fields2[0].getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1700
     * @tc.name testClassGetStaticFields017
     * @tc.desc Verify ClassGetStaticFields case 017: Class.from<MyClass001>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('name');
      expect(fields[0].getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1800
     * @tc.name testClassGetStaticFields018
     * @tc.desc Verify ClassGetStaticFields case 018: Class.from<LargeClass018>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LargeClass018>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      expect(fields.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1900
     * @tc.name testClassGetStaticFields019
     * @tc.desc Verify ClassGetStaticFields case 019: Class.from<SpecialNames019>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialNames019>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      expect(fields.length).assertEqual(4);
      let hasFieldName = false;
      let hasFieldZh = false;
      let hasName = false;
      let hasCyrillicName = false;
      for (let i = 0; i < fields.length; i++) {
        let n = fields[i].getName();
        if (n === 'field_name') {
          hasFieldName = true;
        } else if (n === '字段名') {
          hasFieldZh = true;
        } else if (n === '名字') {
          hasName = true;
        } else if (n === 'имя') {
          hasCyrillicName = true;
        }
      }
      expect(hasFieldName).assertTrue();
      expect(hasFieldZh).assertTrue();
      expect(hasName).assertTrue();
      expect(hasCyrillicName).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_2000
     * @tc.name testClassGetStaticFields020
     * @tc.desc Verify ClassGetStaticFields case 020: Class.from<AccessTest020>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AccessTest020>();
      let fields = asStaticFieldArray(cls.getStaticFields());

      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('publicField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_2100
     * @tc.name testClassGetStaticFields021
     * @tc.desc Verify ClassGetStaticFields case 021: Class.from<ReadonlyTest021>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyTest021>();
      let fields = asStaticFieldArray(cls.getStaticFields());
      expect(fields.length).assertEqual(2);

      let readonlyField: reflect.StaticField | undefined = undefined;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === 'CONSTANT') {
          readonlyField = fields[i];
          break;
        }
      }
      expect(readonlyField !== undefined).assertTrue();
      expect(readonlyField!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_2200
     * @tc.name testClassGetStaticFields022
     * @tc.desc Verify ClassGetStaticFields case 022: Class.from<MixedClass022>(), instance fields result verified, getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedClass022>();

      let staticFields = asStaticFieldArray(cls.getStaticFields());
      expect(staticFields.length).assertEqual(1);
      expect(staticFields[0].getName()).assertEqual('staticField');

      let instanceFields = asInstanceFieldArrayFromCls(cls.getInstanceFields());
      expect(instanceFields.length).assertEqual(1);
      expect(instanceFields[0].getName()).assertEqual('instanceField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_2300
     * @tc.name testClassGetStaticFields023
     * @tc.desc Verify ClassGetStaticFields case 023: Class.from<MyClass001>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let fields1 = asStaticFieldArray(cls.getStaticFields());
      let fields2 = asStaticFieldArray(cls.getStaticFields());

      expect(fields1.length).assertEqual(fields2.length);
      for (let i = 0; i < fields1.length; i++) {
        expect(fields1[i].getName()).assertEqual(fields2[i].getName());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_2400
     * @tc.name testClassGetStaticFields024
     * @tc.desc Verify ClassGetStaticFields case 024: Class.from<InitClass024>(), getStaticFields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticFields024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InitClass024>();
      let fields = asStaticFieldArray(cls.getStaticFields());

      let initField: reflect.StaticField | undefined = undefined;
      let computedField: reflect.StaticField | undefined = undefined;
      for (let i = 0; i < fields.length; i++) {
        let n = fields[i].getName();
        if (n === 'initialized') {
          initField = fields[i];
        } else if (n === 'computed') {
          computedField = fields[i];
        }
      }
      expect(initField !== undefined).assertTrue();
      expect((initField!.getValue(cls) as string)).assertEqual('value');

      expect(computedField !== undefined).assertTrue();
      expect((computedField!.getValue(cls) as int)).assertEqual(100);
    });

  });
}

