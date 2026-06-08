'use static'
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

function asInstanceFieldArray(fields: FixedArray<reflect.InstanceField>): Array<reflect.InstanceField> {
  return Utils.fixedArrayToArray(fields);
}

class MyClass001 {
  public name: string = 'test';
  private count: int = 0;
}

class TestClass003 {
  public field1: string = '';
  public field2: int = 0;
  private field3: boolean = true;
}

class MixedTypes005 {
  public str: string = '';
  public num: int = 0;
  public bool: boolean = false;
  public arr: Array<int> = [];
  public obj: Object = {};
}

class EmptyClass006 {
  private field: string = '';
}

class PrivateOnly007 {
  private secret: string = 'hidden';
  protected data: int = 42;
}

class ChildClass008 extends ParentClass008 {
  public name: string = '';
}

class ParentClass008 {
  public age: int = 0;
}

class Child009 extends Parent009 {
  public c: boolean = false;
}

class Parent009 extends GrandParent009 {
  public b: string = '';
}

class GrandParent009 {
  public a: int = 1;
}

class TestClass010 {
  public readonly name: string = 'test';
  public count: int = 0;
}

class LargeClass015 {
  public f1: int = 1;
  public f2: int = 2;
  public f3: int = 3;
  public f4: int = 4;
  public f5: int = 5;
  public f6: int = 6;
  public f7: int = 7;
  public f8: int = 8;
  public f9: int = 9;
  public f10: int = 10;
  public f11: int = 11;
  public f12: int = 12;
  public f13: int = 13;
  public f14: int = 14;
  public f15: int = 15;
  public f16: int = 16;
  public f17: int = 17;
  public f18: int = 18;
  public f19: int = 19;
  public f20: int = 20;
  public f21: int = 21;
  public f22: int = 22;
  public f23: int = 23;
  public f24: int = 24;
  public f25: int = 25;
  public f26: int = 26;
  public f27: int = 27;
  public f28: int = 28;
  public f29: int = 29;
  public f30: int = 30;
  public f31: int = 31;
  public f32: int = 32;
  public f33: int = 33;
  public f34: int = 34;
  public f35: int = 35;
  public f36: int = 36;
  public f37: int = 37;
  public f38: int = 38;
  public f39: int = 39;
  public f40: int = 40;
  public f41: int = 41;
  public f42: int = 42;
  public f43: int = 43;
  public f44: int = 44;
  public f45: int = 45;
  public f46: int = 46;
  public f47: int = 47;
  public f48: int = 48;
  public f49: int = 49;
  public f50: int = 50;
  public f51: int = 51;
  public f52: int = 52;
  public f53: int = 53;
  public f54: int = 54;
  public f55: int = 55;
  public f56: int = 56;
  public f57: int = 57;
  public f58: int = 58;
  public f59: int = 59;
  public f60: int = 60;
  public f61: int = 61;
  public f62: int = 62;
  public f63: int = 63;
  public f64: int = 64;
  public f65: int = 65;
  public f66: int = 66;
  public f67: int = 67;
  public f68: int = 68;
  public f69: int = 69;
  public f70: int = 70;
  public f71: int = 71;
  public f72: int = 72;
  public f73: int = 73;
  public f74: int = 74;
  public f75: int = 75;
  public f76: int = 76;
  public f77: int = 77;
  public f78: int = 78;
  public f79: int = 79;
  public f80: int = 80;
  public f81: int = 81;
  public f82: int = 82;
  public f83: int = 83;
  public f84: int = 84;
  public f85: int = 85;
  public f86: int = 86;
  public f87: int = 87;
  public f88: int = 88;
  public f89: int = 89;
  public f90: int = 90;
  public f91: int = 91;
  public f92: int = 92;
  public f93: int = 93;
  public f94: int = 94;
  public f95: int = 95;
  public f96: int = 96;
  public f97: int = 97;
  public f98: int = 98;
  public f99: int = 99;
  public f100: int = 100;
}

class SpecialNames016 {
  public field_name: string = '';
  public 字段名: string = '';
  public 名字: string = '';
  public имя: string = '';
}

class AccessTest017 {
  public publicField: string = 'public';
  private privateField: string = 'private';
  protected protectedField: string = 'protected';
  private pkgField: string = 'internal';
}

class ReadonlyTest018 {
  public readonly readonlyField: string = 'readonly';
  public mutableField: string = 'mutable';
}

export default function ClassGetInstanceFieldsTest(): void {
  describe('ClassGetInstanceFieldsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0100
     * @tc.name testClassGetInstanceFields001
     * @tc.desc Verify ClassGetInstanceFields case 001: Class.from<MyClass001>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());
      expect(fields.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0200
     * @tc.name testClassGetInstanceFields002
     * @tc.desc Verify ClassGetInstanceFields case 002: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let fields = looseReflect(cls as Object).getInstanceFields('invalid');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0300
     * @tc.name testClassGetInstanceFields003
     * @tc.desc Verify ClassGetInstanceFields case 003: Class.from<TestClass003>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass003>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());

      expect(fields.length).assertEqual(2);
      for (let i = 0; i < fields.length; i++) {
        let ok: boolean = fields[i] instanceof reflect.InstanceField;
        expect(ok).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0400
     * @tc.name testClassGetInstanceFields004
     * @tc.desc Verify ClassGetInstanceFields case 004: Class.from<TestClass003>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass003>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());
      for (let i = 0; i < fields.length; i++) {
        let ok: boolean = fields[i] instanceof reflect.InstanceField;
        expect(ok).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0500
     * @tc.name testClassGetInstanceFields005
     * @tc.desc Verify ClassGetInstanceFields case 005: Class.from<MixedTypes005>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes005>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());
      expect(fields.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0600
     * @tc.name testClassGetInstanceFields006
     * @tc.desc Verify ClassGetInstanceFields case 006: Class.from<EmptyClass006>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass006>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());
      expect(fields.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0700
     * @tc.name testClassGetInstanceFields007
     * @tc.desc Verify ClassGetInstanceFields case 007: Class.from<PrivateOnly007>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateOnly007>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());
      expect(fields.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0800
     * @tc.name testClassGetInstanceFields008
     * @tc.desc Verify ClassGetInstanceFields case 008: Class.from<ChildClass008>(), getSuper returns expected parent Class, instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass008>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());
      expect(fields.length).assertEqual(1);

      let parentFields = asInstanceFieldArray(cls.getSuper()!.getInstanceFields());
      expect(parentFields.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0900
     * @tc.name testClassGetInstanceFields009
     * @tc.desc Verify ClassGetInstanceFields case 009: Class.from<Child009>(), getSuper returns expected parent Class, instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Child009>();
      let childFields = asInstanceFieldArray(childCls.getInstanceFields());
      expect(childFields.length).assertEqual(1);

      let parentFields = asInstanceFieldArray(childCls.getSuper()!.getInstanceFields());
      expect(parentFields.length).assertEqual(1);

      let grandParentFields = asInstanceFieldArray(childCls.getSuper()!.getSuper()!.getInstanceFields());
      expect(grandParentFields.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1000
     * @tc.name testClassGetInstanceFields010
     * @tc.desc Verify ClassGetInstanceFields case 010: Class.from<TestClass010>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass010>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());

      let nameField = fields[0];
      expect(nameField.getName()).assertEqual('name');
      expect(nameField.isReadonly()).assertTrue();

      let countField = fields[1];
      expect(countField.getName()).assertEqual('count');
      expect(countField.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1100
     * @tc.name testClassGetInstanceFields011
     * @tc.desc Verify ClassGetInstanceFields case 011: invalid input throws ClassCastError, Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      try {
        let fields = looseReflect(cls as Object).getInstanceFields('extra');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1200
     * @tc.name testClassGetInstanceFields012
     * @tc.desc Verify ClassGetInstanceFields case 012: Class.from<MyClass001>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());
      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1300
     * @tc.name testClassGetInstanceFields013
     * @tc.desc Verify ClassGetInstanceFields case 013: Class.from<MyClass001>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let fields1 = asInstanceFieldArray(cls.getInstanceFields());
      let fields2 = asInstanceFieldArray(cls.getInstanceFields());
      expect(fields1.length).assertEqual(fields2.length);
      expect(fields1[0].getName()).assertEqual(fields2[0].getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1400
     * @tc.name testClassGetInstanceFields014
     * @tc.desc Verify ClassGetInstanceFields case 014: Class.from<MyClass001>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());
      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('name');
      expect(fields[0].getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1500
     * @tc.name testClassGetInstanceFields015
     * @tc.desc Verify ClassGetInstanceFields case 015: Class.from<LargeClass015>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LargeClass015>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());
      expect(fields.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1600
     * @tc.name testClassGetInstanceFields016
     * @tc.desc Verify ClassGetInstanceFields case 016: Class.from<SpecialNames016>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialNames016>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1700
     * @tc.name testClassGetInstanceFields017
     * @tc.desc Verify ClassGetInstanceFields case 017: Class.from<AccessTest017>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AccessTest017>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());

      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('publicField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1800
     * @tc.name testClassGetInstanceFields018
     * @tc.desc Verify ClassGetInstanceFields case 018: Class.from<ReadonlyTest018>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyTest018>();
      let fields = asInstanceFieldArray(cls.getInstanceFields());
      expect(fields.length).assertEqual(2);

      let readonlyField: reflect.InstanceField | undefined = undefined;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === 'readonlyField') {
          readonlyField = fields[i];
          break;
        }
      }
      expect(readonlyField !== undefined).assertTrue();
      expect(readonlyField!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1900
     * @tc.name testClassGetInstanceFields019
     * @tc.desc Verify ClassGetInstanceFields case 019: Class.from<MyClass001>(), instance fields result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetInstanceFields019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let fields1 = asInstanceFieldArray(cls.getInstanceFields());
      let fields2 = asInstanceFieldArray(cls.getInstanceFields());

      expect(fields1.length).assertEqual(fields2.length);
      for (let i = 0; i < fields1.length; i++) {
        expect(fields1[i].getName()).assertEqual(fields2[i].getName());
      }
    });

  });
}

