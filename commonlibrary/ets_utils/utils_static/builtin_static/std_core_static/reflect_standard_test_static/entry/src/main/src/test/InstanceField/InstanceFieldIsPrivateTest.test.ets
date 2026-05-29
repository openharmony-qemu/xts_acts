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

class ModifierClass006 {
  public publicField: string = 'public';
  protected protectedField: string = 'protected';
  private privateField: string = 'private';
}

class PrivateClass003 {
  public publicField: string = 'public';
  private privateField: string = 'value';
}

class PublicClass004 {
  public publicField: string = 'value';
}

class ProtectedClass005 {
  public publicField: string = 'public';
  protected protectedField: string = 'value';
}

class DefaultClass007 {
  public defaultField: string = 'value';
}

class TestClass009 {
  public value: string = '';
}

class PrivateTest010 {
  public publicField: string = 'public';
  private privateField: string = 'private';
}

class TestClass011 {
  public field: string = '';
}

class PrivateReadonly016 {
  public readonly PUBLIC_CONST: string = 'public';
  private readonly PRIVATE_CONST: string = 'private';
}

class ConstructorPrivate017 {
  public publicParam: string;
  private privateParam: string;

  constructor(privateParam: string, publicParam: string) {
    this.privateParam = privateParam;
    this.publicParam = publicParam;
  }
}

class ParentClass018 {
  public parentPublic: string = 'parent';
  private parentPrivate: string = 'parent';
}

class ChildClass018 extends ParentClass018 {
  public childPublic: string = 'child';
  private childPrivate: string = 'child';
}

class PrivateAccess019 {
  public publicField: string = 'public';
  private privateField: string = 'secret';
}

class StaticPrivate020 {
  public static STATIC_PUBLIC: string = 'public';
  private static STATIC_PRIVATE: string = 'private';
}

class TestClass021 {
  public field1: string = '';
  protected field3: string = '';
  private field2: string = '';
}

export default function InstanceFieldIsPrivateTest(): void {
  describe('InstanceFieldIsPrivateTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0100
     * @tc.name testIsPrivate0100
     * @tc.desc Verify isPrivate() requires no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let result = field.isPrivate();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0200
     * @tc.name testIsPrivate0200
     * @tc.desc Verify private field cannot be reflected and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateClass003>();

      let privateField = cls.getInstanceField('privateField');
      expect(privateField === undefined).assertTrue();

      let publicField = cls.getInstanceField('publicField')!;
      expect(publicField.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0300
     * @tc.name testIsPrivate0300
     * @tc.desc Verify public field isPrivate() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicClass004>();
      let field = cls.getInstanceField('publicField')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0400
     * @tc.name testIsPrivate0400
     * @tc.desc Verify protected fields are not reflectable via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedClass005>();

      let protectedField = cls.getInstanceField('protectedField');
      expect(protectedField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0500
     * @tc.name testIsPrivate0500
     * @tc.desc Verify private is mutually exclusive with public/protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierClass006>();

      let field = cls.getInstanceField('publicField')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isPrivate()).assertFalse();
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0600
     * @tc.name testIsPrivate0600
     * @tc.desc Verify default access level is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultClass007>();
      let field = cls.getInstanceField('defaultField')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0700
     * @tc.name testIsPrivate0700
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('data')!;
      let result = field.isPrivate();

      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0800
     * @tc.name testIsPrivate0800
     * @tc.desc Verify multiple calls to isPrivate() return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass009>();
      let field = cls.getInstanceField('value')!;

      let result1 = field.isPrivate();
      let result2 = field.isPrivate();
      let result3 = field.isPrivate();

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0900
     * @tc.name testIsPrivate0900
     * @tc.desc Verify private fields cannot be accessed via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateTest010>();
      let fields = cls.getInstanceFields();

      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('publicField');
      expect(fields[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1000
     * @tc.name testIsPrivate1000
     * @tc.desc Verify isPrivate() returns correctly for InstanceField object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass011>();
      let field = cls.getInstanceField('field')!;

      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1100
     * @tc.name testIsPrivate1100
     * @tc.desc Verify private combined with readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateReadonly016>();

      let privateField = cls.getInstanceField('PRIVATE_CONST');
      expect(privateField === undefined).assertTrue();

      let publicField = cls.getInstanceField('PUBLIC_CONST')!;
      expect(publicField !== null).assertTrue();
      expect(publicField.isPrivate()).assertFalse();
      expect(publicField.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1200
     * @tc.name testIsPrivate1200
     * @tc.desc Verify private in constructor parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConstructorPrivate017>();
      let fields = cls.getInstanceFields();

      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('publicParam');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1300
     * @tc.name testIsPrivate1300
     * @tc.desc Verify parent class private fields invisible to child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass018>();

      let childPublicField = childCls.getInstanceField('childPublic')!;
      expect(childPublicField.isPrivate()).assertFalse();

      let childPrivateField = childCls.getInstanceField('childPrivate');
      expect(childPrivateField === undefined).assertTrue();

      let parentCls = childCls.getSuper()!;
      let parentPublicField = parentCls.getInstanceField('parentPublic')!;
      expect(parentPublicField.isPrivate()).assertFalse();

      let parentPrivateField = parentCls.getInstanceField('parentPrivate');
      expect(parentPrivateField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1400
     * @tc.name testIsPrivate1400
     * @tc.desc Verify private fields cannot be accessed via getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateAccess019>();

      let privateField = cls.getInstanceField('privateField');
      expect(privateField === undefined).assertTrue();

      let publicField = cls.getInstanceField('publicField')!;
      let instance = cls.createInstance();
      let value: string = publicField.getValue(instance) as string;
      expect(value).assertEqual('public');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1500
     * @tc.name testIsPrivate1500
     * @tc.desc Verify StaticField also has isPrivate for static private fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticPrivate020>();

      let staticPrivateField = cls.getStaticField('STATIC_PRIVATE');
      expect(staticPrivateField === undefined).assertTrue();

      let staticPublicField = cls.getStaticField('STATIC_PUBLIC')!;
      expect(staticPublicField !== null).assertTrue();
      expect(staticPublicField.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1600
     * @tc.name testIsPrivate1600
     * @tc.desc Verify consistency of isPublic, isPrivate, isProtected results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass021>();

      let field1 = cls.getInstanceField('field1')!;
      expect(field1.isPublic()).assertTrue();
      expect(field1.isPrivate()).assertFalse();
      expect(field1.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1700
     * @tc.name testIsPrivate1700
     * @tc.desc Verify isPrivate consistency on multiple InstanceField instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicClass004>();
      let field1 = cls.getInstanceField('publicField')!;
      let field2 = cls.getInstanceField('publicField')!;
      expect(field1.isPrivate()).assertEqual(field2.isPrivate());
    });

  });
}
