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
import Utils from './../Util.test';

class MyClass001 {
  public name: string = 'test';
}

class TestClass008 {
  public data: string = '';
}

class ModifierClass006 {
  public publicField: string = 'public';
  protected protectedField: string = 'protected';
  private privateField: string = 'private';
}

class ProtectedClass003 {
  public publicField: string = 'public';
  protected protectedField: string = 'value';
}

class PublicClass004 {
  public publicField: string = 'value';
}

class PrivateClass005 {
  public publicField: string = 'public';
  private privateField: string = 'value';
}

class DefaultClass007 {
  public defaultField: string = 'value';
}

class TestClass009 {
  public value: string = '';
}

class ProtectedTest010 {
  public publicField: string = 'public';
  protected protectedField: string = 'protected';
  private privateField: string = 'private';
}

class ParentClass011 {
  protected protectedField: string = 'protected';
}

class ChildClass011 extends ParentClass011 {
  public getChildAccess(): string {
    return this.protectedField;
  }
}

class ProtectedReadonly016 {
  public readonly PUBLIC_CONST: string = 'public';
  protected readonly PROTECTED_CONST: string = 'protected';
}

class ConstructorProtected017 {
  public publicParam: string;
  protected protectedParam: string;

  constructor(protectedParam: string, publicParam: string) {
    this.protectedParam = protectedParam;
    this.publicParam = publicParam;
  }
}

class ParentClass018 {
  public parentPublic: string = 'parent';
  protected parentProtected: string = 'parent';
}

class ChildClass018 extends ParentClass018 {
  public childPublic: string = 'child';
  protected childProtected: string = 'child';
}

class Parent019 {
  protected protectedValue: string = 'parent';
}

class Child019 extends Parent019 {
  public getProtectedValue(): string {
    return this.protectedValue;
  }

  public setProtectedValue(value: string): void {
    this.protectedValue = value;
  }
}

class ProtectedAccess020 {
  public publicField: string = 'public';
  protected protectedField: string = 'protected';
}

class StaticProtected021 {
  public static STATIC_PUBLIC: string = 'public';
  protected static STATIC_PROTECTED: string = 'protected';
}

class TestClass022 {
  public field1: string = '';
  protected field3: string = '';
  private field2: string = '';
}

export default function InstanceFieldIsProtectedTest(): void {
  describe('InstanceFieldIsProtectedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0100
     * @tc.name testIsProtected0100
     * @tc.desc Verify isProtected() requires no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let result = field.isProtected();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0200
     * @tc.name testIsProtected0200
     * @tc.desc Verify protected fields cannot be reflected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedClass003>();

      let protectedField = cls.getInstanceField('protectedField');
      expect(protectedField === undefined).assertTrue();

      let publicField = cls.getInstanceField('publicField')!;
      expect(publicField.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0300
     * @tc.name testIsProtected0300
     * @tc.desc Verify public field isProtected() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicClass004>();
      let field = cls.getInstanceField('publicField')!;
      expect(field.isProtected()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0400
     * @tc.name testIsProtected0400
     * @tc.desc Verify private field isProtected() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateClass005>();

      let privateField = cls.getInstanceField('privateField');
      expect(privateField === undefined).assertTrue();

      let publicField = cls.getInstanceField('publicField')!;
      expect(publicField.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0500
     * @tc.name testIsProtected0500
     * @tc.desc Verify protected is mutually exclusive with public/private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierClass006>();

      let field = cls.getInstanceField('publicField')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isPrivate()).assertFalse();
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0600
     * @tc.name testIsProtected0600
     * @tc.desc Verify default access level is not protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultClass007>();
      let field = cls.getInstanceField('defaultField')!;
      expect(field.isProtected()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0700
     * @tc.name testIsProtected0700
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('data')!;
      let result = field.isProtected();

      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0800
     * @tc.name testIsProtected0800
     * @tc.desc Verify multiple calls to isProtected() return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass009>();
      let field = cls.getInstanceField('value')!;

      let result1 = field.isProtected();
      let result2 = field.isProtected();
      let result3 = field.isProtected();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_0900
     * @tc.name testIsProtected0900
     * @tc.desc Verify protected fields cannot be accessed via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedTest010>();
      let fields = cls.getInstanceFields();

      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('publicField');
      expect(fields[0].isProtected()).assertFalse();
      expect(fields[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1000
     * @tc.name testIsProtected1000
     * @tc.desc Verify protected field access for child classes in code but not reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass011>();

      let protectedField = cls.getInstanceField('protectedField');
      expect(protectedField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1100
     * @tc.name testIsProtected1100
     * @tc.desc Verify protected combined with readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedReadonly016>();

      let protectedField = cls.getInstanceField('PROTECTED_CONST');
      expect(protectedField === undefined).assertTrue();

      let publicField = cls.getInstanceField('PUBLIC_CONST')!;
      expect(publicField !== null).assertTrue();
      expect(publicField.isProtected()).assertFalse();
      expect(publicField.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1200
     * @tc.name testIsProtected1200
     * @tc.desc Verify protected in constructor parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConstructorProtected017>();
      let fields = cls.getInstanceFields();

      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('publicParam');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1300
     * @tc.name testIsProtected1300
     * @tc.desc Verify parent class protected fields visible to child but not reflectable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass018>();

      let childPublicField = childCls.getInstanceField('childPublic')!;
      expect(childPublicField.isProtected()).assertFalse();

      let childProtectedField = childCls.getInstanceField('childProtected');
      expect(childProtectedField === undefined).assertTrue();

      let parentCls = childCls.getSuper()!;
      let parentPublicField = parentCls.getInstanceField('parentPublic')!;
      expect(parentPublicField.isProtected()).assertFalse();

      let parentProtectedField = parentCls.getInstanceField('parentProtected');
      expect(parentProtectedField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1400
     * @tc.name testIsProtected1400
     * @tc.desc Verify child class can access parent protected field via method but not reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child019>();
      let instance = cls.createInstance();

      let getter = cls.getInstanceMethod('getProtectedValue')!;
      expect(getter !== null).assertTrue();
      let value: string = getter.invoke(instance) as string;
      expect(value).assertEqual('parent');

      let protectedField = cls.getInstanceField('protectedValue');
      expect(protectedField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1500
     * @tc.name testIsProtected1500
     * @tc.desc Verify protected fields cannot be accessed via getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedAccess020>();

      let protectedField = cls.getInstanceField('protectedField');
      expect(protectedField === undefined).assertTrue();

      let publicField = cls.getInstanceField('publicField')!;
      let instance = cls.createInstance();
      let value: string = publicField.getValue(instance) as string;
      expect(value).assertEqual('public');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1600
     * @tc.name testIsProtected1600
     * @tc.desc Verify StaticField also has isProtected for static protected fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticProtected021>();

      let staticProtectedField = cls.getStaticField('STATIC_PROTECTED');
      expect(staticProtectedField === undefined).assertTrue();

      let staticPublicField = cls.getStaticField('STATIC_PUBLIC')!;
      expect(staticPublicField !== null).assertTrue();
      expect(staticPublicField.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1700
     * @tc.name testIsProtected1700
     * @tc.desc Verify consistency of isPublic, isPrivate, isProtected results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass022>();

      let field1 = cls.getInstanceField('field1')!;
      expect(field1.isPublic()).assertTrue();
      expect(field1.isPrivate()).assertFalse();
      expect(field1.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PROTECTED_1800
     * @tc.name testIsProtected1800
     * @tc.desc Verify isProtected consistency on multiple InstanceField instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsProtected1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicClass004>();
      let field1 = cls.getInstanceField('publicField')!;
      let field2 = cls.getInstanceField('publicField')!;
      expect(field1.isProtected()).assertEqual(field2.isProtected());
    });

  });
}
