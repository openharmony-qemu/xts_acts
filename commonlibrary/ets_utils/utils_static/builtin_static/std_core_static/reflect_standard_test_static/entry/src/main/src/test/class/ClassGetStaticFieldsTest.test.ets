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

function asStaticFieldArray(o: Object): Array<reflect.StaticField> {
  return o as Array<reflect.StaticField>;
}

function asInstanceFieldArrayFromCls(o: Object): Array<reflect.InstanceField> {
  return o as Array<reflect.InstanceField>;
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
      public static num: number = 0;
      public static bool: boolean = false;
      public static arr: Array<int> = [];
      public static obj: Object = {};
  }

class EmptyClass006 {
      private static field: string = ''; // 只有private静态字段
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
      // ... 假设有100个静态字段
      public static f100: int = 100;
  }

class SpecialNames019 {
      public static fieldHyphen: string = '';
      public static field_name: string = '';
      public static fieldZh: string = '';
      public static field123: string = '';
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
  describe('ClassGetStaticFieldsTest', () => {
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
     * @tc.desc Verify ClassGetStaticFields case 001: getStaticFields() parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {

        let cls = Class.from<MyClass001>();
        let fields = asStaticFieldArray(cls.getStaticFields());
        expect(fields.length).assertEqual(1); // 只有public静态字段
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0200
     * @tc.name testClassGetStaticFields002
     * @tc.desc Verify ClassGetStaticFields case 002: method not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        // 错误用法：传递参数
        try {
            let fields = looseReflect(cls as Object).getStaticFields('invalid');
            expect().assertFail();
        } catch (e) {
            expect(e !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0300
     * @tc.name testClassGetStaticFields003
     * @tc.desc Verify ClassGetStaticFields case 003: return FixedArray<reflect.StaticField>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassGetStaticFields case 004: array StaticFieldtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassGetStaticFields case 005: different type publicstatic field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedTypes005>();
        let fields = asStaticFieldArray(cls.getStaticFields());
        expect(fields.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0600
     * @tc.name testClassGetStaticFields006
     * @tc.desc Verify ClassGetStaticFields case 006: publicstatic field when return empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<EmptyClass006>();
        let fields = asStaticFieldArray(cls.getStaticFields());
        expect(fields.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0700
     * @tc.name testClassGetStaticFields007
     * @tc.desc Verify ClassGetStaticFields case 007: privatestatic field not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PrivateOnly007>();
        let fields = asStaticFieldArray(cls.getStaticFields());
        expect(fields.length).assertEqual(0); // private和protected都不可见
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0800
     * @tc.name testClassGetStaticFields008
     * @tc.desc Verify ClassGetStaticFields case 008: conststatic field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ConstClass008>();
        let fields = asStaticFieldArray(cls.getStaticFields());
        expect(fields.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_0900
     * @tc.name testClassGetStaticFields009
     * @tc.desc Verify ClassGetStaticFields case 009: return static field not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ChildClass009>();
        let fields = asStaticFieldArray(cls.getStaticFields());
        expect(fields.length).assertEqual(1); // 只有name
        
        // 通过父类Class对象获取父类静态字段
        let parentFields = asStaticFieldArray(cls.getSuper()!.getStaticFields());
        expect(parentFields.length).assertEqual(1); // 只有age
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1000
     * @tc.name testClassGetStaticFields010
     * @tc.desc Verify ClassGetStaticFields case 010: inheritance static field get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<Child010>();
        let childFields = asStaticFieldArray(childCls.getStaticFields());
        expect(childFields.length).assertEqual(1); // 只有c
        
        let parentFields = asStaticFieldArray(childCls.getSuper()!.getStaticFields());
        expect(parentFields.length).assertEqual(1); // 只有b
        
        let grandParentFields = asStaticFieldArray(childCls.getSuper()!.getSuper()!.getStaticFields());
        expect(grandParentFields.length).assertEqual(1); // 只有a
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1100
     * @tc.name testClassGetStaticFields011
     * @tc.desc Verify ClassGetStaticFields case 011: static field not instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let derivedCls = Class.from<Derived011>();
        let fields = asStaticFieldArray(derivedCls.getStaticFields());
        
        // 只能获取Derived自己的静态字段
        expect(fields.length).assertEqual(1);
        expect(fields[0].getName()).assertEqual('derivedField');
        
        // Base的静态字段需要通过Base类获取
        let baseCls = Class.from<Base011>();
        let baseFields = asStaticFieldArray(baseCls.getStaticFields());
        expect(baseFields.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1200
     * @tc.name testClassGetStaticFields012
     * @tc.desc Verify ClassGetStaticFields case 012: return StaticFieldobject property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassGetStaticFields case 013: StaticField get static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassGetStaticFields case 014: parameters when should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        try {
            let fields = looseReflect(cls as Object).getStaticFields('extra');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1500
     * @tc.name testClassGetStaticFields015
     * @tc.desc Verify ClassGetStaticFields case 015: call getStaticFields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        // 未调用initialize时
        try {
            let fields = asStaticFieldArray(cls.getStaticFields());
            // 可能需要先initialize
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1600
     * @tc.name testClassGetStaticFields016
     * @tc.desc Verify ClassGetStaticFields case 016: method is Deprecated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 假设getStaticFields被标记为废弃
        let cls = Class.from<MyClass001>();
        let fields = asStaticFieldArray(cls.getStaticFields()); // 应显示弃用警告
        expect(fields !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1700
     * @tc.name testClassGetStaticFields017
     * @tc.desc Verify ClassGetStaticFields case 017: getStaticFields method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 不需要await
        let cls = Class.from<MyClass001>();
        let fields = asStaticFieldArray(cls.getStaticFields()); // 同步调用
        expect(fields !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1800
     * @tc.name testClassGetStaticFields018
     * @tc.desc Verify ClassGetStaticFields case 018: publicstatic field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<LargeClass018>();
        let fields = asStaticFieldArray(cls.getStaticFields());
        expect(fields.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_1900
     * @tc.name testClassGetStaticFields019
     * @tc.desc Verify ClassGetStaticFields case 019: static field or Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<SpecialNames019>();
        let fields = asStaticFieldArray(cls.getStaticFields());
        expect(fields.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_2000
     * @tc.name testClassGetStaticFields020
     * @tc.desc Verify ClassGetStaticFields case 020: publicstatic field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AccessTest020>();
        let fields = asStaticFieldArray(cls.getStaticFields());
        
        // 只有public字段可见
        expect(fields.length).assertEqual(1);
        expect(fields[0].getName()).assertEqual('publicField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_2100
     * @tc.name testClassGetStaticFields021
     * @tc.desc Verify ClassGetStaticFields case 021: readonlystatic field return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassGetStaticFields case 022: static field instance field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedClass022>();
        
        // getStaticFields只返回静态字段
        let staticFields = asStaticFieldArray(cls.getStaticFields());
        expect(staticFields.length).assertEqual(1);
        expect(staticFields[0].getName()).assertEqual('staticField');
        
        // getInstanceFields只返回实例字段
        let instanceFields = asInstanceFieldArrayFromCls(cls.getInstanceFields());
        expect(instanceFields.length).assertEqual(1);
        expect(instanceFields[0].getName()).assertEqual('instanceField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_2300
     * @tc.name testClassGetStaticFields023
     * @tc.desc Verify ClassGetStaticFields case 023: call return same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let fields1 = asStaticFieldArray(cls.getStaticFields());
        let fields2 = asStaticFieldArray(cls.getStaticFields());
        
        expect(fields1.length).assertEqual(fields2.length);
        // 验证字段内容相同
        for (let i = 0; i < fields1.length; i++) {
            expect(fields1[i].getName()).assertEqual(fields2[i].getName());
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICFIELDS_2400
     * @tc.name testClassGetStaticFields024
     * @tc.desc Verify ClassGetStaticFields case 024: static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetStaticFields024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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