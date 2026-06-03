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
import Utils from './../Util.test';

class MyClass001 {
  public name: string = 'test';
}

class StaticTest019 {
  public static STATIC_VALUE: string = 'static';
  public instanceValue: string = 'instance';
}

class TestClass003 {
  public value: int = 0;
}

class OwnerClass004 {
  public field1: string = '';
  public field2: int = 0;
}

interface MyInterface006 {
  interfaceField: string;
}

class ImplClass006 implements MyInterface006 {
  public interfaceField: string = '';
}

class OuterClass013 {
  public outerField: string = 'outer';
}

class MyClass1014 {
  public field: string = '';
}

class MyClass2014 {
  public field: string = '';
}

class TestClass015 {
  public data: string = 'test';
}

class TestClass016 {
  public field1: string = '';
  public field2: int = 0;
  public field3: boolean = false;
}

class TestClass017 {
  public data: string = '';
}

class Parent020 {
  public parentData: string = 'parent';
}

class Child020 extends Parent020 {
  public childData: string = 'child';
}

export default function InstanceFieldGetOwnerTest(): void {
  describe('InstanceFieldGetOwnerTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0100
     * @tc.name testGetOwner0100
     * @tc.desc Verify calling getOwner on initialized InstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      cls.initialize();
      let field = cls.getInstanceField('name')!;
      let owner = field.getOwner();
      expect(owner.getName().includes('MyClass001')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0200
     * @tc.name testGetOwner0200
     * @tc.desc Verify getOwner returns correct class owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let owner = field.getOwner();
      expect(owner.getName().includes('MyClass001')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0300
     * @tc.name testGetOwner0300
     * @tc.desc Verify getOwner returns non-null Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let owner = field.getOwner();
      expect(owner !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0400
     * @tc.name testGetOwner0400
     * @tc.desc Verify getOwner() returns correct class name for a top-level class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerCls = Class.from<OuterClass013>();
      let outerField = outerCls.getInstanceField('outerField')!;
      let ownerName = outerField.getOwner().getName();
      expect(ownerName.includes('OuterClass013')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0500
     * @tc.name testGetOwner0500
     * @tc.desc Verify classes with different names produce different owner names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MyClass1014>();
      let field1 = cls1.getInstanceField('field')!;

      let cls2 = Class.from<MyClass2014>();
      let field2 = cls2.getInstanceField('field')!;

      let name1 = field1.getOwner().getName();
      let name2 = field2.getOwner().getName();
      expect(name1 !== name2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0600
     * @tc.name testGetOwner0600
     * @tc.desc Verify combining getOwner, getName, getType for full info
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass015>();
      let field = cls.getInstanceField('data')!;

      expect(field.getName()).assertEqual('data');
      expect(field.getOwner().getName().includes('TestClass015')).assertTrue();
      expect(field.getType() !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0700
     * @tc.name testGetOwner0700
     * @tc.desc Verify iterating all fields and their owners
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass016>();
      let fields = cls.getInstanceFields();

      expect(fields.length).assertEqual(3);
      for (let i = 0; i < fields.length; i++) {
        let owner = fields[i].getOwner();
        expect(owner.getName().length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0800
     * @tc.name testGetOwner0800
     * @tc.desc Verify performance of repeated getOwner() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass017>();
      let field = cls.getInstanceField('data')!;

      for (let i = 0; i < 100; i++) {
        let owner = field.getOwner();
        expect(owner !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0900
     * @tc.name testGetOwner0900
     * @tc.desc Verify same field returns same Class object on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass003>();
      let field = cls.getInstanceField('value')!;

      let owner1 = field.getOwner();
      let owner2 = field.getOwner();
      let owner3 = field.getOwner();

      expect(owner1.getName()).assertEqual(owner2.getName());
      expect(owner2.getName()).assertEqual(owner3.getName());
      expect(owner1 === owner2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_1000
     * @tc.name testGetOwner1000
     * @tc.desc Verify StaticField also has getOwner()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTest019>();

      let staticField = cls.getStaticField('STATIC_VALUE')!;
      let staticOwner = staticField.getOwner();
      expect(staticOwner.getName().includes('StaticTest019')).assertTrue();

      let instanceField = cls.getInstanceField('instanceValue')!;
      let instanceOwner = instanceField.getOwner();
      expect(instanceOwner.getName().includes('StaticTest019')).assertTrue();

      expect(staticOwner.getName()).assertEqual(instanceOwner.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_1100
     * @tc.name testGetOwner1100
     * @tc.desc Verify using getOwner() to analyze field origin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Child020>();
      let childFields = childCls.getInstanceFields();

      expect(childFields.length).assertEqual(1);
      expect(childFields[0].getOwner().getName().includes('Child020')).assertTrue();

      let parentCls = childCls.getSuper()!;
      let parentFields = parentCls.getInstanceFields();
      expect(parentFields.length).assertEqual(1);
      expect(parentFields[0].getOwner().getName().includes('Parent020')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_1200
     * @tc.name testGetOwner1200
     * @tc.desc Verify owner of field from interface implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplClass006>();
      let field = cls.getInstanceField('interfaceField')!;
      let owner = field.getOwner();
      expect(owner.getName().includes('ImplClass006')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_1300
     * @tc.name testGetOwner1300
     * @tc.desc Verify owner consistency across multiple fields in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerClass004>();
      let field1 = cls.getInstanceField('field1')!;
      let field2 = cls.getInstanceField('field2')!;
      let owner1 = field1.getOwner().getName();
      let owner2 = field2.getOwner().getName();
      expect(owner1).assertEqual(owner2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_1400
     * @tc.name testGetOwner1400
     * @tc.desc Verify getOwner returns non-null for every public field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass016>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].getOwner() !== null).assertTrue();
      }
    });

  });
}
