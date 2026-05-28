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

class TestClass008 {
  public data: string = '';
}

class PublicStatic017 {
  public static STATIC_VALUE: string = 'static';
}

class ModifierClass006 {
  public publicField: string = 'public';
  protected protectedField: string = 'protected';
  private privateField: string = 'private';
}

class PublicClass003 {
  public publicField: string = 'value';
}

class AccessClass004 {
  public internalField: string = '';
  protected protectedField: string = '';
  private privateField: string = '';
}

class DefaultClass005 {
  public accessibleField: string = 'value';
}

class ParentClass007 {
  public inheritedPublic: string = 'parent';
}

class ChildClass007 extends ParentClass007 {
  public ownPublic: string = 'child';
}

class TestClass009 {
  public value: string = '';
}

interface MyInterface015 {
  field: string;
}

class ImplClass015 implements MyInterface015 {
  public field: string = '';
}

class VariousTypes011 {
  public str: string = '';
  public num: number = 0;
  public bool: boolean = false;
  public arr: Array<int> = [];
  public obj: Object = {};
  public nullable: string | null = null;
}

class PublicReadonly016 {
  public readonly value: string = 'public readonly';
}

class VisibilityClass018 {
  public visible: string = 'visible';
  maybeVisible: string = 'internal';
  protected alsoInvisible: string = 'protected';
  private invisible: string = 'invisible';
}

class AccessibleClass020 {
  public accessible: string = 'original';
}

class TestClass021 {
  public field1: string = '';
  protected field3: string = '';
  private field2: string = '';
}

export default function InstanceFieldIsPublicTest(): void {
  describe('InstanceFieldIsPublicTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0100
     * @tc.name testIsPublic001
     * @tc.desc Verify isPublic() requires no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let result = field.isPublic();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0200
     * @tc.name testIsPublic003
     * @tc.desc Verify public field returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicClass003>();
      let field = cls.getInstanceField('publicField')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0300
     * @tc.name testIsPublic004
     * @tc.desc Verify private and protected fields are not reflectable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AccessClass004>();

      let privateField = cls.getInstanceField('privateField');
      expect(privateField === undefined).assertTrue();

      let protectedField = cls.getInstanceField('protectedField');
      expect(protectedField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0400
     * @tc.name testIsPublic005
     * @tc.desc Verify default access level is public
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultClass005>();
      let field = cls.getInstanceField('accessibleField')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0500
     * @tc.name testIsPublic006
     * @tc.desc Verify public is mutually exclusive with private/protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierClass006>();

      let field = cls.getInstanceField('publicField')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isPrivate()).assertFalse();
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0600
     * @tc.name testIsPublic007
     * @tc.desc Verify child class inherits parent class public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass007>();

      let ownField = childCls.getInstanceField('ownPublic')!;
      expect(ownField.isPublic()).assertTrue();

      let parentCls = childCls.getSuper()!;
      let inheritedField = parentCls.getInstanceField('inheritedPublic')!;
      expect(inheritedField.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0700
     * @tc.name testIsPublic008
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('data')!;
      let result = field.isPublic();

      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0800
     * @tc.name testIsPublic009
     * @tc.desc Verify multiple calls to isPublic() return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass009>();
      let field = cls.getInstanceField('value')!;

      let result1 = field.isPublic();
      let result2 = field.isPublic();
      let result3 = field.isPublic();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_0900
     * @tc.name testIsPublic014
     * @tc.desc Verify various types of public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<VariousTypes011>();
      let fields = cls.getInstanceFields();

      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].isPublic()).assertTrue();
        expect(fields[i].isPrivate()).assertFalse();
        expect(fields[i].isProtected()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_1000
     * @tc.name testIsPublic015
     * @tc.desc Verify interface fields are public by default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplClass015>();
      let field = cls.getInstanceField('field')!;
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_1100
     * @tc.name testIsPublic016
     * @tc.desc Verify public readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicReadonly016>();
      let field = cls.getInstanceField('value')!;

      expect(field.isPublic()).assertTrue();
      expect(field.isReadonly()).assertTrue();
      expect(field.isPrivate()).assertFalse();
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_1200
     * @tc.name testIsPublic017
     * @tc.desc Verify static public field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicStatic017>();
      let field = cls.getStaticField('STATIC_VALUE')!;

      expect(field.isPublic()).assertTrue();
      expect(field.isPrivate()).assertFalse();
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_1300
     * @tc.name testIsPublic018
     * @tc.desc Verify reflection can only access public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<VisibilityClass018>();
      let fields = cls.getInstanceFields();

      expect(fields.length).assertEqual(2);
      expect(fields[0].getName()).assertEqual('visible');
      expect(fields[0].isPublic()).assertTrue();
      expect(fields[1].getName()).assertEqual('maybeVisible');
      expect(fields[1].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_1400
     * @tc.name testIsPublic019
     * @tc.desc Verify performance of repeated isPublic() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('data')!;

      for (let i = 0; i < 100; i++) {
        let result = field.isPublic();
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_1500
     * @tc.name testIsPublic020
     * @tc.desc Verify public field can be accessed with getValue and setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AccessibleClass020>();
      let field = cls.getInstanceField('accessible')!;
      let instance = cls.createInstance();

      let value: string = field.getValue(instance) as string;
      expect(value).assertEqual('original');

      field.setValue(instance, 'modified');
      expect(field.getValue(instance) as string).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_1600
     * @tc.name testIsPublic021
     * @tc.desc Verify consistency of isPublic, isPrivate, isProtected results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass021>();

      let field1 = cls.getInstanceField('field1')!;
      expect(field1.isPublic()).assertTrue();
      expect(field1.isPrivate()).assertFalse();
      expect(field1.isProtected()).assertFalse();

      let field2 = cls.getInstanceField('field2');
      expect(field2 === undefined).assertTrue();

      let field3 = cls.getInstanceField('field3');
      expect(field3 === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PUBLIC_1700
     * @tc.name testIsPublic022
     * @tc.desc Verify isPublic consistency on multiple InstanceField instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPublic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicClass003>();
      let field1 = cls.getInstanceField('publicField')!;
      let field2 = cls.getInstanceField('publicField')!;
      expect(field1.isPublic()).assertEqual(field2.isPublic());
    });

  });
}
