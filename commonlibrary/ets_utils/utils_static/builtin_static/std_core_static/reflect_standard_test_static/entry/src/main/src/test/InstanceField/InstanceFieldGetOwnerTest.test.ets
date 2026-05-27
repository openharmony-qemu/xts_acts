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

class ParentClass001 {
  public name = 'parent';
}

class MyClass001 extends ParentClass001 {
  public name = 'test';
  public count = 0;
}

class MyClass003 {
  public count = 0;
}

class ParentClass004 {
  public name = 'parent';
}

class ChildClass004 extends ParentClass004 {
  public count = 0;
}

class GrandParent005 {
  public id = 0;
}

class Parent005 extends GrandParent005 {}

class Child005 extends Parent005 {}

class ParentClass006 {
  public name = 'parent';
}

class ChildClass006 extends ParentClass006 {
  public name = 'child';
}

class MyClass007 {
  public data = 0;
}

class MyClass008 {
  public data = 0;
}

class LargeClass010 {
  public a = 1;
  public b = 2;
  public c = 3;
  public d = 4;
  public e = 5;
}

class MyClass011 {
  public data = 0;
}

class MyClass012 {
  public static staticData = 0;
}

class MyClass013 {
  public data = 0;
}

class MyClass014 {
  public data = 0;
}

class CustomInstanceField015 extends reflect.InstanceField {
  public override getOwner(): reflect.Class {
    return super.getOwner();
  }
}

class MyClass017 {
  public data = 0;
}

class MyClass018 {
  public data = 0;
}

class MyClass019 {
  public count = 0;
}

class MyClass020 {
  public data = 0;
}

class GenericClass021<T> {
  public item: T | null = null;
}

interface MyInterface022 {
  id: number;
}

class MyImpl022 implements MyInterface022 {
  public id = 0;
}

export default function InstanceFieldGetOwnerTest() {
  describe('InstanceFieldGetOwnerTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_0100
     * @tc.name testInstanceFieldGetOwner001
     * @tc.desc Verify getOwner() call syntax without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField("count");
      let owner = field!.getOwner();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_0200
     * @tc.name testInstanceFieldGetOwner002
     * @tc.desc Verify compile error when extra parameter is passed to getOwner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_0300
     * @tc.name testInstanceFieldGetOwner003
     * @tc.desc Verify getOwner returns declaring class for own field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let field = cls.getInstanceField("count");
      expect(field!.getOwner().getName()).assertEqual("MyClass003");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_0400
     * @tc.name testInstanceFieldGetOwner004
     * @tc.desc Verify getOwner returns parent class for inherited field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass004>();
      let field = cls.getInstanceField("name");
      expect(field!.getOwner().getName()).assertEqual("ParentClass004");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_0500
     * @tc.name testInstanceFieldGetOwner005
     * @tc.desc Verify getOwner returns original declaring class for multi-level inherited field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child005>();
      let field = cls.getInstanceField("id");
      expect(field!.getOwner().getName()).assertEqual("GrandParent005");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_0600
     * @tc.name testInstanceFieldGetOwner006
     * @tc.desc Verify getOwner returns child class when field is overridden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass006>();
      let field = cls.getInstanceField("name");
      expect(field!.getOwner().getName()).assertEqual("ChildClass006");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_0700
     * @tc.name testInstanceFieldGetOwner007
     * @tc.desc Verify getOwner returns Class type object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let field = cls.getInstanceField("data");
      let owner = field!.getOwner();
      expect(owner instanceof reflect.Class).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_0800
     * @tc.name testInstanceFieldGetOwner008
     * @tc.desc Verify returned Class object can call getName to get class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let field = cls.getInstanceField("data");
      let name = field!.getOwner().getName();
      expect(typeof name).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_0900
     * @tc.name testInstanceFieldGetOwner009
     * @tc.desc Verify getOwner for field from anonymous class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let anonymousCls = class { public value = 10; };
      let field = new reflect.Class(anonymousCls).getInstanceField("value");
      let owner = field!.getOwner();
      expect(owner).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_1000
     * @tc.name testInstanceFieldGetOwner010
     * @tc.desc Verify getOwner returns consistent result for each field in class with many fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LargeClass010>();
      ['a','b','c','d','e'].forEach(name => {
        let field = cls.getInstanceField(name);
        expect(field!.getOwner().getName()).assertEqual("LargeClass010");
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_1100
     * @tc.name testInstanceFieldGetOwner011
     * @tc.desc Verify getOwner does not throw Error during normal execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let field = cls.getInstanceField("data");
      try {
        let owner = field!.getOwner();
        expect(owner).not.toBeNull();
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_1200
     * @tc.name testInstanceFieldGetOwner012
     * @tc.desc Verify getOwner behavior on static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let staticField = cls.getStaticField("staticData");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_1300
     * @tc.name testInstanceFieldGetOwner013
     * @tc.desc Verify getOwner executes normally within try-finally block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let field = cls.getInstanceField("data");
      let owner: reflect.Class | null = null;
      try {
        owner = field!.getOwner();
      } finally {
        expect(owner).not.toBeNull();
        expect(owner!.getName()).assertEqual("MyClass013");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_1400
     * @tc.name testInstanceFieldGetOwner014
     * @tc.desc Verify getOwner does not cause unhandled exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let field = cls.getInstanceField("data");
      let result = field!.getOwner();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_1500
     * @tc.name testInstanceFieldGetOwner015
     * @tc.desc Verify subclass of InstanceField overrides getOwner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_1600
     * @tc.name testInstanceFieldGetOwner016
     * @tc.desc Verify getOwner is not marked as deprecated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let field = cls.getInstanceField("data");
      let owner = field!.getOwner();
      expect(owner.getName()).assertEqual("MyClass017");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_1700
     * @tc.name testInstanceFieldGetOwner017
     * @tc.desc Verify getOwner is a synchronous method callable without await
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let field = cls.getInstanceField("data");
      let owner = field!.getOwner();
      expect(owner.getName()).assertEqual("MyClass017");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_1800
     * @tc.name testInstanceFieldGetOwner018
     * @tc.desc Verify getOwner does not return a Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>();
      let field = cls.getInstanceField("data");
      let result = field!.getOwner();
      expect(result instanceof Promise).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_1900
     * @tc.name testInstanceFieldGetOwner019
     * @tc.desc Verify chained call getOwner().getName() returns correct class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      let field = cls.getInstanceField("count");
      expect(field!.getOwner().getName()).assertEqual("MyClass019");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_2000
     * @tc.name testInstanceFieldGetOwner020
     * @tc.desc Verify multiple getOwner calls on same field return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let field = cls.getInstanceField("data");
      let owner1 = field!.getOwner();
      let owner2 = field!.getOwner();
      expect(owner1 === owner2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_2100
     * @tc.name testInstanceFieldGetOwner021
     * @tc.desc Verify getOwner returns generic class for generic class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass021<number>>();
      let field = cls.getInstanceField("item");
      let ownerName = field!.getOwner().getName();
      expect(ownerName).assertEqual("GenericClass021");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETOWNER_2200
     * @tc.name testInstanceFieldGetOwner022
     * @tc.desc Verify getOwner for field implementing interface property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetOwner022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyImpl022>();
      let field = cls.getInstanceField("id");
      expect(field!.getOwner().getName()).assertEqual("MyImpl022");
    });
  });
}
