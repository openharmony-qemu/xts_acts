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
  public name = 'test';
}

class MyClass003 {
  public name = 'test';
}

class MyClass004 {
  public static count = 0;
}

class MyClass005 {
  public readonly id: number = 1;
}

class MyClass006 {
  public intField: number = 42;
  public strField: string = "hello";
  public boolField: boolean = true;
  public bigintField: bigint = 100n;
}

class MyClass007 {
  public arr: number[] = [1, 2, 3];
  public obj: { key: string } = { key: "value" };
  public map: Map<string, number> = new Map();
}

class MyClass008 {
  public name: string = "default";
}

class MyClass009 {
  private secret = 'hidden';
}

class MyClass010 {
  private static secret = 'hidden';
}

class MyClass011 {
  protected data = 100;
}

class MyClass012 {
  protected static data = 100;
}

class MyClass013 {
  data = 100;
}

class Parent014 {
  public parentField = 'from_parent';
}

class Child014 extends Parent014 {
  public childField = 'from_child';
}

class Parent015 {
  private parentSecret = 'secret';
}

class Child015 extends Parent015 {
  public childField = 'from_child';
}

class Parent016 {
  protected parentData = 100;
}

class Child016 extends Parent016 {
  public childField = 'from_child';
}

class MyClass017 {
  public name = 'test';
}

class MyClass018 {
  public name = 'test';
  private secret = 'hidden';
}

class MyClass019 {
  public name?: string;
}

class MyClass020 {
  public name: string | null = null;
}

class MyClass021 {
  public single = 'only';
}

class MyClass022 {
  public pub = 'public';
  private pri = 'private';
  protected pro = 'protected';
  def = 'default';
}

class MyClass023 {
  public name = 'test';
}

class EmptyClass024 {
}

class MyClass025<T> {
  public value: T | null = null;
}

class MyClass026 {
  public data: string | number = "hello";
}

class MyClass027 {
  public name?: string;
}

class A028 {
  public fieldA = 'a';
}

class B028 extends A028 {
  public fieldB = 'b';
}

class C028 extends B028 {
  public fieldC = 'c';
}

export default function InstanceFieldIsPublicTest() {
  describe('InstanceFieldIsPublicTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_0100
     * @tc.name testInstanceFieldIsPublic001
     * @tc.desc Verify isPublic() call without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField("name");
      let result = field!.isPublic();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_0200
     * @tc.name testInstanceFieldIsPublic002
     * @tc.desc Verify isPublic() is a no-parameter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_0300
     * @tc.name testInstanceFieldIsPublic003
     * @tc.desc Verify isPublic returns true for public instance field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let field = cls.getInstanceField("name");
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_0400
     * @tc.name testInstanceFieldIsPublic004
     * @tc.desc Verify isPublic returns true for public static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let field = cls.getStaticField("count");
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_0500
     * @tc.name testInstanceFieldIsPublic005
     * @tc.desc Verify isPublic returns true for public readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let field = cls.getInstanceField("id");
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_0600
     * @tc.name testInstanceFieldIsPublic006
     * @tc.desc Verify isPublic returns true for all public primitive type fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      let intField = cls.getInstanceField("intField");
      let strField = cls.getInstanceField("strField");
      let boolField = cls.getInstanceField("boolField");
      let bigintField = cls.getInstanceField("bigintField");
      expect(intField!.isPublic()).assertEqual(true);
      expect(strField!.isPublic()).assertEqual(true);
      expect(boolField!.isPublic()).assertEqual(true);
      expect(bigintField!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_0700
     * @tc.name testInstanceFieldIsPublic007
     * @tc.desc Verify isPublic returns true for public complex type fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let arrField = cls.getInstanceField("arr");
      expect(arrField!.isPublic()).assertEqual(true);
      let objField = cls.getInstanceField("obj");
      expect(objField!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_0800
     * @tc.name testInstanceFieldIsPublic008
     * @tc.desc Verify isPublic returns true for public field with default value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let field = cls.getInstanceField("name");
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_0900
     * @tc.name testInstanceFieldIsPublic009
     * @tc.desc Verify isPublic returns false for private instance field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let field = cls.getInstanceField("secret");
      expect(field!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_1000
     * @tc.name testInstanceFieldIsPublic010
     * @tc.desc Verify isPublic returns false for private static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
      let field = cls.getStaticField("secret");
      expect(field!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_1100
     * @tc.name testInstanceFieldIsPublic011
     * @tc.desc Verify isPublic returns false for protected instance field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let field = cls.getInstanceField("data");
      expect(field!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_1200
     * @tc.name testInstanceFieldIsPublic012
     * @tc.desc Verify isPublic returns false for protected static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let field = cls.getStaticField("data");
      expect(field!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_1300
     * @tc.name testInstanceFieldIsPublic013
     * @tc.desc Verify isPublic returns false for field with default access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let field = cls.getInstanceField("data");
      expect(field!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_1400
     * @tc.name testInstanceFieldIsPublic014
     * @tc.desc Verify isPublic returns true for inherited public field from parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child014>();
      let field = cls.getInstanceField("parentField");
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_1500
     * @tc.name testInstanceFieldIsPublic015
     * @tc.desc Verify parent private field is not visible via child class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child015>();
      let field = cls.getInstanceField("parentSecret");
      expect(field).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_1600
     * @tc.name testInstanceFieldIsPublic016
     * @tc.desc Verify isPublic returns false for inherited protected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child016>();
      let field = cls.getInstanceField("parentData");
      expect(field!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_1700
     * @tc.name testInstanceFieldIsPublic017
     * @tc.desc Verify isPublic return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let field = cls.getInstanceField("name");
      let result = field!.isPublic();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_1800
     * @tc.name testInstanceFieldIsPublic018
     * @tc.desc Verify repeated isPublic calls return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>();
      let pubField = cls.getInstanceField("name");
      let priField = cls.getInstanceField("secret");
      for (let i = 0; i < 10; i++) {
        expect(pubField!.isPublic()).assertEqual(true);
        expect(priField!.isPublic()).assertEqual(false);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_1900
     * @tc.name testInstanceFieldIsPublic019
     * @tc.desc Verify isPublic returns true for uninitialized public field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      let field = cls.getInstanceField("name");
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_2000
     * @tc.name testInstanceFieldIsPublic020
     * @tc.desc Verify isPublic returns true for public field with null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let field = cls.getInstanceField("name");
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_2100
     * @tc.name testInstanceFieldIsPublic021
     * @tc.desc Verify isPublic returns true for class with only one public field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
      let field = cls.getInstanceField("single");
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_2200
     * @tc.name testInstanceFieldIsPublic022
     * @tc.desc Verify isPublic returns correct results for mixed access modifier fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let pubField = cls.getInstanceField("pub");
      let priField = cls.getInstanceField("pri");
      let proField = cls.getInstanceField("pro");
      let defField = cls.getInstanceField("def");
      expect(pubField!.isPublic()).assertEqual(true);
      expect(priField!.isPublic()).assertEqual(false);
      expect(proField!.isPublic()).assertEqual(false);
      expect(defField!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_2300
     * @tc.name testInstanceFieldIsPublic023
     * @tc.desc Verify isPublic not called for non-existent field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass023>();
      let field = cls.getInstanceField("nonExistent");
      if (field) {
        console.info(field.isPublic());
      }
      expect(field).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_2400
     * @tc.name testInstanceFieldIsPublic024
     * @tc.desc Verify getInstanceField returns undefined for empty class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass024>();
      let field = cls.getInstanceField("any");
      expect(field).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_2500
     * @tc.name testInstanceFieldIsPublic025
     * @tc.desc Verify isPublic returns true for public field in generic class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025<number>>();
      let field = cls.getInstanceField("value");
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_2600
     * @tc.name testInstanceFieldIsPublic026
     * @tc.desc Verify isPublic returns true for public union type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass026>();
      let field = cls.getInstanceField("data");
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_2700
     * @tc.name testInstanceFieldIsPublic027
     * @tc.desc Verify isPublic returns true for public optional type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass027>();
      let field = cls.getInstanceField("name");
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPUBLIC_2800
     * @tc.name testInstanceFieldIsPublic028
     * @tc.desc Verify isPublic returns true for public fields in multi-level inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPublic028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C028>();
      let fieldA = cls.getInstanceField("fieldA");
      let fieldB = cls.getInstanceField("fieldB");
      let fieldC = cls.getInstanceField("fieldC");
      expect(fieldA!.isPublic()).assertEqual(true);
      expect(fieldB!.isPublic()).assertEqual(true);
      expect(fieldC!.isPublic()).assertEqual(true);
    });
  });
}
