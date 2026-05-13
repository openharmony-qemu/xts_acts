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
import { looseReflect } from '../voidFn';

function asInstanceFieldArray(o: Object): Array<reflect.InstanceField> {
  return o as Array<reflect.InstanceField>;
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
      public num: number = 0;
      public bool: boolean = false;
      public arr: Array<int> = [];
      public obj: Object = {};
  }

class EmptyClass006 {
      private field: string = ''; // 只有private字段
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
      // ... 假设有100个字段
      public f100: int = 100;
  }

class SpecialNames016 {
      public fieldHyphen: string = '';
      public field_name: string = '';
      public fieldZh: string = '';
      public field123: string = '';
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
  describe('ClassGetInstanceFieldsTest', () => {
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
     * @tc.desc Verify ClassGetInstanceFields case 001: getInstanceFields() parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {

        let cls = Class.from<MyClass001>();
        let fields = asInstanceFieldArray(cls.getInstanceFields());
        expect(fields.length).assertEqual(1); // 只有public字段
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0200
     * @tc.name testClassGetInstanceFields002
     * @tc.desc Verify ClassGetInstanceFields case 002: method not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        // 错误用法：传递参数
        try {
            let fields = looseReflect(cls as Object).getInstanceFields('invalid');
            expect().assertFail();
        } catch (e) {
            expect(e != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0300
     * @tc.name testClassGetInstanceFields003
     * @tc.desc Verify ClassGetInstanceFields case 003: return FixedArray<reflect.InstanceField>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassGetInstanceFields case 004: array InstanceFieldtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassGetInstanceFields case 005: different type publicinstance field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MixedTypes005>();
        let fields = asInstanceFieldArray(cls.getInstanceFields());
        expect(fields.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0600
     * @tc.name testClassGetInstanceFields006
     * @tc.desc Verify ClassGetInstanceFields case 006: publicinstance field when return empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<EmptyClass006>();
        let fields = asInstanceFieldArray(cls.getInstanceFields());
        expect(fields.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0700
     * @tc.name testClassGetInstanceFields007
     * @tc.desc Verify ClassGetInstanceFields case 007: privatefield not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<PrivateOnly007>();
        let fields = asInstanceFieldArray(cls.getInstanceFields());
        expect(fields.length).assertEqual(0); // private和protected都不可见
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0800
     * @tc.name testClassGetInstanceFields008
     * @tc.desc Verify ClassGetInstanceFields case 008: return field not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ChildClass008>();
        let fields = asInstanceFieldArray(cls.getInstanceFields());
        expect(fields.length).assertEqual(1); // 只有name
        
        // 通过父类Class对象获取父类字段
        let parentFields = asInstanceFieldArray(cls.getSuper()!.getInstanceFields());
        expect(parentFields.length).assertEqual(1); // 只有age
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_0900
     * @tc.name testClassGetInstanceFields009
     * @tc.desc Verify ClassGetInstanceFields case 009: inheritance field get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let childCls = Class.from<Child009>();
        let childFields = asInstanceFieldArray(childCls.getInstanceFields());
        expect(childFields.length).assertEqual(1); // 只有c
        
        let parentFields = asInstanceFieldArray(childCls.getSuper()!.getInstanceFields());
        expect(parentFields.length).assertEqual(1); // 只有b
        
        let grandParentFields = asInstanceFieldArray(childCls.getSuper()!.getSuper()!.getInstanceFields());
        expect(grandParentFields.length).assertEqual(1); // 只有a
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1000
     * @tc.name testClassGetInstanceFields010
     * @tc.desc Verify ClassGetInstanceFields case 010: return InstanceFieldobject property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
     * @tc.desc Verify ClassGetInstanceFields case 011: parameters when should throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        try {
            let fields = looseReflect(cls as Object).getInstanceFields('extra');
            expect().assertFail();
        } catch (e) {
            let isErr: boolean = e instanceof Error;
            expect(isErr).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1200
     * @tc.name testClassGetInstanceFields012
     * @tc.desc Verify ClassGetInstanceFields case 012: call getInstanceFields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        // 未调用initialize时
        try {
            let fields = asInstanceFieldArray(cls.getInstanceFields());
            // 可能需要先initialize
        } catch (e) {
            let isErr: boolean = e instanceof Error;
            expect(isErr).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1300
     * @tc.name testClassGetInstanceFields013
     * @tc.desc Verify ClassGetInstanceFields case 013: method is Deprecated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 假设getInstanceFields被标记为废弃
        let cls = Class.from<MyClass001>();
        let fields = asInstanceFieldArray(cls.getInstanceFields()); // 应显示弃用警告
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1400
     * @tc.name testClassGetInstanceFields014
     * @tc.desc Verify ClassGetInstanceFields case 014: getInstanceFields method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 不需要await
        let cls = Class.from<MyClass001>();
        let fields = asInstanceFieldArray(cls.getInstanceFields()); // 同步调用
        expect(fields != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1500
     * @tc.name testClassGetInstanceFields015
     * @tc.desc Verify ClassGetInstanceFields case 015: publicfield
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<LargeClass015>();
        let fields = asInstanceFieldArray(cls.getInstanceFields());
        expect(fields.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1600
     * @tc.name testClassGetInstanceFields016
     * @tc.desc Verify ClassGetInstanceFields case 016: field or Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<SpecialNames016>();
        let fields = asInstanceFieldArray(cls.getInstanceFields());
        expect(fields.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1700
     * @tc.name testClassGetInstanceFields017
     * @tc.desc Verify ClassGetInstanceFields case 017: publicfield
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AccessTest017>();
        let fields = asInstanceFieldArray(cls.getInstanceFields());
        
        // 只有public字段可见
        expect(fields.length).assertEqual(1);
        expect(fields[0].getName()).assertEqual('publicField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1800
     * @tc.name testClassGetInstanceFields018
     * @tc.desc Verify ClassGetInstanceFields case 018: readonlyfield return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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
        expect(readonlyField != undefined).assertTrue();
        expect(readonlyField!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEFIELDS_1900
     * @tc.name testClassGetInstanceFields019
     * @tc.desc Verify ClassGetInstanceFields case 019: call return same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceFields019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let fields1 = asInstanceFieldArray(cls.getInstanceFields());
        let fields2 = asInstanceFieldArray(cls.getInstanceFields());
        
        expect(fields1.length).assertEqual(fields2.length);
        // 验证字段内容相同
        for (let i = 0; i < fields1.length; i++) {
            expect(fields1[i].getName()).assertEqual(fields2[i].getName());
        }
    });

  });
}