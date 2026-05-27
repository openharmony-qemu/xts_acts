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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '../../../../hypium/index';
import Utils from './../Util.test';
class MyClass001 {
  public name: string = 'test';
}

class TestClass008 {
  public data: string = '';
}
class ModifierClass006 {
  public publicField: string = 'public';
  private privateField: string = 'private';
  protected protectedField: string = 'protected';
}

class PrivateClass003 {
  private privateField: string = 'value';
  public publicField: string = 'public';
}

class PublicClass004 {
  public publicField: string = 'value';
}

class ProtectedClass005 {
  protected protectedField: string = 'value';
  public publicField: string = 'public';
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
  private readonly PRIVATE_CONST: string = 'private';
  public readonly PUBLIC_CONST: string = 'public';
}

class ConstructorPrivate017 {
  private privateParam: string;
  public publicParam: string;
  constructor(privateParam: string, publicParam: string) {
    this.privateParam = privateParam;
    this.publicParam = publicParam;
  }
}

class ParentClass018 {
  private parentPrivate: string = 'parent';
  public parentPublic: string = 'parent';
}

class ChildClass018 extends ParentClass018 {
  private childPrivate: string = 'child';
  public childPublic: string = 'child';
}

class PrivateAccess019 {
  private privateField: string = 'secret';
  public publicField: string = 'public';
}

class StaticPrivate020 {
  private static STATIC_PRIVATE: string = 'private';
  public static STATIC_PUBLIC: string = 'public';
}

class TestClass021 {
  public field1: string = '';
  private field2: string = '';
  protected field3: string = '';
}

export default function InstanceFieldIsPrivateTest(): void {
  let runTests: () => void = (): void => {
        // FILTER: bit0=FUNCTION bit17=MEDIUMTEST bit26=LEVEL2
    const FILTER: int = 0B1 | (0B1 << 17) | (0B1 << 26);
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0100
     * @tc.name testIsPrivate001
     * @tc.desc Verify isPrivate() requires no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate001', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let result = field.isPrivate();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0200
     * @tc.name testIsPrivate003
     * @tc.desc Verify private field cannot be reflected and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate003', FILTER, (): void => {
      let cls = Class.from<PrivateClass003>();

      let privateField = cls.getInstanceField('privateField');
      expect(privateField === undefined).assertTrue();

      let publicField = cls.getInstanceField('publicField')!;
      expect(publicField.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0300
     * @tc.name testIsPrivate004
     * @tc.desc Verify public field isPrivate() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate004', FILTER, (): void => {
      let cls = Class.from<PublicClass004>();
      let field = cls.getInstanceField('publicField')!;
      expect(field.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0400
     * @tc.name testIsPrivate005
     * @tc.desc Verify protected fields cannot be reflected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate005', FILTER, (): void => {
      let cls = Class.from<ProtectedClass005>();

      let protectedField = cls.getInstanceField('protectedField');
      expect(protectedField === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0500
     * @tc.name testIsPrivate006
     * @tc.desc Verify private is mutually exclusive with public/protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate006', FILTER, (): void => {
      let cls = Class.from<ModifierClass006>();

      let field = cls.getInstanceField('publicField')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isPrivate()).assertFalse();
      expect(field.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0600
     * @tc.name testIsPrivate007
     * @tc.desc Verify default access level is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate007', FILTER, (): void => {
      let cls = Class.from<DefaultClass007>();
      let field = cls.getInstanceField('defaultField')!;
      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0700
     * @tc.name testIsPrivate008
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate008', FILTER, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('data')!;
      let result = field.isPrivate();

      expect(typeof result).assertEqual('boolean');
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_0800
     * @tc.name testIsPrivate009
     * @tc.desc Verify multiple calls to isPrivate() return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate009', FILTER, (): void => {
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
     * @tc.name testIsPrivate010
     * @tc.desc Verify private fields cannot be accessed via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate010', FILTER, (): void => {
      let cls = Class.from<PrivateTest010>();
      let fields = cls.getInstanceFields();

      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('publicField');
      expect(fields[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1000
     * @tc.name testIsPrivate011
     * @tc.desc Verify isPrivate() returns correctly for InstanceField object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate011', FILTER, (): void => {
      let cls = Class.from<TestClass011>();
      let field = cls.getInstanceField('field')!;

      expect(field.isPrivate()).assertFalse();
      expect(field.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1100
     * @tc.name testIsPrivate013
     * @tc.desc Verify calling isPrivate on initialized InstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate013', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      cls.initialize();
      let field = cls.getInstanceField('name')!;
      let result = field.isPrivate();
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1200
     * @tc.name testIsPrivate014
     * @tc.desc Verify basic functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate014', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let result = field.isPrivate();
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1300
     * @tc.name testIsPrivate015
     * @tc.desc Verify isPrivate works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate015', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let result = field.isPrivate();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1400
     * @tc.name testIsPrivate016
     * @tc.desc Verify private combined with readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate016', FILTER, (): void => {
      let cls = Class.from<PrivateReadonly016>();

      let privateField = cls.getInstanceField('PRIVATE_CONST');
      expect(privateField === undefined).assertTrue();

      let publicField = cls.getInstanceField('PUBLIC_CONST')!;
      expect(publicField !== null).assertTrue();
      expect(publicField.isPrivate()).assertFalse();
      expect(publicField.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1500
     * @tc.name testIsPrivate017
     * @tc.desc Verify private in constructor parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate017', FILTER, (): void => {
      let cls = Class.from<ConstructorPrivate017>();
      let fields = cls.getInstanceFields();

      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('publicParam');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1600
     * @tc.name testIsPrivate018
     * @tc.desc Verify parent class private fields invisible to child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate018', FILTER, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1700
     * @tc.name testIsPrivate019
     * @tc.desc Verify private fields cannot be accessed via getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate019', FILTER, (): void => {
      let cls = Class.from<PrivateAccess019>();

      let privateField = cls.getInstanceField('privateField');
      expect(privateField === undefined).assertTrue();

      let publicField = cls.getInstanceField('publicField')!;
      let instance = cls.createInstance();
      let value: string = publicField.getValue(instance) as string;
      expect(value).assertEqual('public');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1800
     * @tc.name testIsPrivate020
     * @tc.desc Verify StaticField also has isPrivate for static private fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate020', FILTER, (): void => {
      let cls = Class.from<StaticPrivate020>();

      let staticPrivateField = cls.getStaticField('STATIC_PRIVATE');
      expect(staticPrivateField === undefined).assertTrue();

      let staticPublicField = cls.getStaticField('STATIC_PUBLIC')!;
      expect(staticPublicField !== null).assertTrue();
      expect(staticPublicField.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_1900
     * @tc.name testIsPrivate021
     * @tc.desc Verify consistency of isPublic, isPrivate, isProtected results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate021', FILTER, (): void => {
      let cls = Class.from<TestClass021>();

      let field1 = cls.getInstanceField('field1')!;
      expect(field1.isPublic()).assertTrue();
      expect(field1.isPrivate()).assertFalse();
      expect(field1.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_PRIVATE_2000
     * @tc.name testIsPrivate022
     * @tc.desc Verify isPrivate consistency on multiple InstanceField instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsPrivate022', FILTER, (): void => {
      let cls = Class.from<PublicClass004>();
      let field1 = cls.getInstanceField('publicField')!;
      let field2 = cls.getInstanceField('publicField')!;
      expect(field1.isPrivate()).assertEqual(field2.isPrivate());
    });
  };
  describe('InstanceFieldIsPrivateTest', runTests);
}
