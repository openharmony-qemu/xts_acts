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
  private name: string = 'test';
}

class MyClass003 {
  private name: string = 'test';
}

class MyClass004 {
  public name: string = 'test';
}

class MyClass005 {
  protected name: string = 'test';
}

class MyClass006 {
  name: string = 'test';
}

class MyClass007 {
  private name: string = 'test';
  private age: number = 18;
  private flag: boolean = true;
}

class MyClass008 {
  private priField: number = 1;
  public pubField: number = 2;
  protected proField: number = 3;
}

class MyClass009 {
  private static count: number = 0;
}

class MyClass010 {
  public static count: number = 0;
}

class MyClass011 {
  private readonly id: number = 1;
}

class MyClass012 {
  public readonly id: number = 1;
}

class MyClass013 {
  private nickname?: string;
}

class MyClass014 {
  private data: string = 'test';
}

class MyClass015 {
  private data: string = 'test';
  public value: number = 1;
}

class MyClass016 {
  private strField: string = 'a';
  private numField: number = 123;
  private boolField: boolean = false;
  private objField: Object = {};
  private arrField: Array<number> = [1, 2];
}

class Parent017 {
  public parentName: string = 'parent';
}

class Child017 extends Parent017 {
  private childName: string = 'child';
}

class Parent018 {
  private name: string = 'parent';
}

class Child018 extends Parent018 {
  private name: string = 'child';
}

class MyClass019 {
  private data: string = 'test';
}

class MyClass020 {
  private secret: string = 'secret';
  public info: string = 'info';
}

class EmptyClass021 {
}

class MyClass022 {
  public name: string = 'test';
}

class MyClass024 {
  private name: string = 'test';
}

class MyClass025 {
  public name: string = 'test';
}

class ClassA026 {
  private name: string = 'A';
}

class ClassB026 {
  public name: string = 'B';
}

class MyClass027 {
  private uninitField: number;
}

class Outer028 {
  private outerField: string = 'outer';
}

class Person029 {
  private id: number = 1;
  public name: string = 'test';
}

export default function InstanceFieldIsPrivateTest() {
  describe('InstanceFieldIsPrivateTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_0100
     * @tc.name testInstanceFieldIsPrivate001
     * @tc.desc Verify isPrivate() call without parameters returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField("name")!;
      let result = field.isPrivate();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_0200
     * @tc.name testInstanceFieldIsPrivate002
     * @tc.desc Verify isPrivate is a no-parameter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_0300
     * @tc.name testInstanceFieldIsPrivate003
     * @tc.desc Verify isPrivate returns true for private instance field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let field = cls.getInstanceField("name")!;
      expect(field.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_0400
     * @tc.name testInstanceFieldIsPrivate004
     * @tc.desc Verify isPrivate returns false for public instance field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let field = cls.getInstanceField("name")!;
      expect(field.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_0500
     * @tc.name testInstanceFieldIsPrivate005
     * @tc.desc Verify isPrivate returns false for protected instance field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let field = cls.getInstanceField("name")!;
      expect(field.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_0600
     * @tc.name testInstanceFieldIsPrivate006
     * @tc.desc Verify isPrivate returns false for field without access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      let field = cls.getInstanceField("name")!;
      expect(field.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_0700
     * @tc.name testInstanceFieldIsPrivate007
     * @tc.desc Verify isPrivate returns true for all multiple private fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let nameField = cls.getInstanceField("name")!;
      let ageField = cls.getInstanceField("age")!;
      let flagField = cls.getInstanceField("flag")!;
      expect(nameField.isPrivate()).assertEqual(true);
      expect(ageField.isPrivate()).assertEqual(true);
      expect(flagField.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_0800
     * @tc.name testInstanceFieldIsPrivate008
     * @tc.desc Verify isPrivate returns correct results for mixed access modifier fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let priF = cls.getInstanceField("priField")!;
      let pubF = cls.getInstanceField("pubField")!;
      let proF = cls.getInstanceField("proField")!;
      expect(priF.isPrivate()).assertEqual(true);
      expect(pubF.isPrivate()).assertEqual(false);
      expect(proF.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_0900
     * @tc.name testInstanceFieldIsPrivate009
     * @tc.desc Verify isPrivate returns true for private static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let field = cls.getStaticField("count")!;
      expect(field.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_1000
     * @tc.name testInstanceFieldIsPrivate010
     * @tc.desc Verify isPrivate returns false for public static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
      let field = cls.getStaticField("count")!;
      expect(field.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_1100
     * @tc.name testInstanceFieldIsPrivate011
     * @tc.desc Verify isPrivate returns true for private readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let field = cls.getInstanceField("id")!;
      expect(field.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_1200
     * @tc.name testInstanceFieldIsPrivate012
     * @tc.desc Verify isPrivate returns false for public readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let field = cls.getInstanceField("id")!;
      expect(field.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_1300
     * @tc.name testInstanceFieldIsPrivate013
     * @tc.desc Verify isPrivate returns true for private optional field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let field = cls.getInstanceField("nickname")!;
      expect(field.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_1400
     * @tc.name testInstanceFieldIsPrivate014
     * @tc.desc Verify isPrivate return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let field = cls.getInstanceField("data")!;
      let result = field.isPrivate();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_1500
     * @tc.name testInstanceFieldIsPrivate015
     * @tc.desc Verify isPrivate return value is not null or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();
      let privateField = cls.getInstanceField("data")!;
      let publicField = cls.getInstanceField("value")!;
      expect(privateField.isPrivate()).not.toBeNull();
      expect(privateField.isPrivate()).not.toBeUndefined();
      expect(publicField.isPrivate()).not.toBeNull();
      expect(publicField.isPrivate()).not.toBeUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_1600
     * @tc.name testInstanceFieldIsPrivate016
     * @tc.desc Verify isPrivate returns true for private fields of various types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass016>();
      expect(cls.getInstanceField("strField")!.isPrivate()).assertEqual(true);
      expect(cls.getInstanceField("numField")!.isPrivate()).assertEqual(true);
      expect(cls.getInstanceField("boolField")!.isPrivate()).assertEqual(true);
      expect(cls.getInstanceField("objField")!.isPrivate()).assertEqual(true);
      expect(cls.getInstanceField("arrField")!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_1700
     * @tc.name testInstanceFieldIsPrivate017
     * @tc.desc Verify isPrivate for inherited class private field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child017>();
      let parentField = cls.getInstanceField("parentName")!;
      let childField = cls.getInstanceField("childName")!;
      expect(parentField.isPrivate()).assertEqual(false);
      expect(childField.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_1800
     * @tc.name testInstanceFieldIsPrivate018
     * @tc.desc Verify isPrivate returns true for child overridden private field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child018>();
      let field = cls.getInstanceField("name")!;
      expect(field.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_1900
     * @tc.name testInstanceFieldIsPrivate019
     * @tc.desc Verify multiple isPrivate calls return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      let field = cls.getInstanceField("data")!;
      let result1 = field.isPrivate();
      let result2 = field.isPrivate();
      let result3 = field.isPrivate();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_2000
     * @tc.name testInstanceFieldIsPrivate020
     * @tc.desc Verify isPrivate for private field via getAllFields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let allFields = cls.getAllFields();
      for (let field of allFields) {
        if (field.getName() === "secret") {
          expect(field.isPrivate()).assertEqual(true);
        } else if (field.getName() === "info") {
          expect(field.isPrivate()).assertEqual(false);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_2100
     * @tc.name testInstanceFieldIsPrivate021
     * @tc.desc Verify getInstanceField returns undefined for empty class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass021>();
      let field = cls.getInstanceField("nonExistent");
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_2200
     * @tc.name testInstanceFieldIsPrivate022
     * @tc.desc Verify isPrivate throws TypeError when called on undefined InstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let field = cls.getInstanceField("nonExistentField");
      try {
        field!.isPrivate();
        expect().assertFail();
      } catch (error) {
        expect(error).not.toBeNull();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_2300
     * @tc.name testInstanceFieldIsPrivate023
     * @tc.desc Verify isPrivate throws TypeError when called on null InstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: InstanceField | null = null;
      try {
        field!.isPrivate();
        expect().assertFail();
      } catch (error) {
        expect(error).not.toBeNull();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_2400
     * @tc.name testInstanceFieldIsPrivate024
     * @tc.desc Verify getInstanceField returns undefined for non-existent field without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass024>();
      let field = cls.getInstanceField("nonExistent");
      expect(field).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_2500
     * @tc.name testInstanceFieldIsPrivate025
     * @tc.desc Verify try-catch-finally handles isPrivate on undefined InstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025>();
      let field = cls.getInstanceField("notExist");
      let finallyExecuted: boolean = false;
      try {
        field!.isPrivate();
        expect().assertFail();
      } catch (error) {
        expect(error).not.toBeNull();
      } finally {
        finallyExecuted = true;
        expect(finallyExecuted).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_2600
     * @tc.name testInstanceFieldIsPrivate026
     * @tc.desc Verify isPrivate returns correct result for same name field in different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<ClassA026>();
      let clsB = Class.from<ClassB026>();
      expect(clsA.getInstanceField("name")!.isPrivate()).assertEqual(true);
      expect(clsB.getInstanceField("name")!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_2700
     * @tc.name testInstanceFieldIsPrivate027
     * @tc.desc Verify isPrivate returns true for uninitialized private field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass027>();
      let field = cls.getInstanceField("uninitField")!;
      expect(field.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_2800
     * @tc.name testInstanceFieldIsPrivate028
     * @tc.desc Verify isPrivate returns true for private field in nested class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Outer028>();
      let field = cls.getInstanceField("outerField")!;
      expect(field.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPRIVATE_2900
     * @tc.name testInstanceFieldIsPrivate029
     * @tc.desc Verify isPrivate for fields obtained through Class.from reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsPrivate029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Person029>();
      expect(cls.getInstanceField("id")!.isPrivate()).assertEqual(true);
      expect(cls.getInstanceField("name")!.isPrivate()).assertEqual(false);
    });
  });
}
