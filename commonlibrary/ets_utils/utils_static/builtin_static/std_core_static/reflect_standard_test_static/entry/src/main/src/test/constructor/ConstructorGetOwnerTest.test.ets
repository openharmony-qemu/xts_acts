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

class MyClass001 {
    public constructor() {}
  }

class MyClass003 {
    public constructor() {}
  }

class ClassB004 {
    public constructor() {}
  }

class ClassA004 {
    public constructor() {}
  }

class ChildClass005 extends ParentClass005 {
    public constructor() {
      super();
    }
  }

class ParentClass005 {
    public constructor() {}
  }

class GenericClass006<T> {
    public constructor() {}
  }

abstract class AbstractClass007 {
    public constructor() {}
  }

class MyClass010 {
    public constructor(value?: int) {}
  }

final class FinalClass011 {
    public constructor() {}
  }

class MyClass012 {
    public constructor(value?: int | string) {}
  }

class MyClass013 {
    public constructor() {}
  }

class MyClass015 {
    public constructor(value?: int) {}
  }

class NormalClass016 {
    public constructor() {}
  }

final class FinalClass016 {
    public constructor() {}
  }

abstract class AbstractClass016 {
    public constructor() {}
  }

class MyClass017 {
    public constructor(value?: int | string, flag?: boolean) {}
  }

class MyClass018 {
    public constructor() {}
  }

class ParentClass {
    public constructor() {}
  }

class MyClass019 extends ParentClass {
    public constructor(value: int) {}
    public static staticMethod(): void {}
  }


export default function ConstructorGetOwnerTest(): void {
  describe('ConstructorGetOwnerTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_0100
     * @tc.name testConstructorGetOwner001
     * @tc.desc Verify ConstructorGetOwner case 001: getOwner()method no parameters verify empty parameters call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let constructors = cls.getConstructors();
        let owner = constructors[0].getOwner();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_0200
     * @tc.name testConstructorGetOwner002
     * @tc.desc Verify ConstructorGetOwner case 002: parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      Class.from<MyClass001>().getConstructors()[0].getOwner();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_0300
     * @tc.name testConstructorGetOwner003
     * @tc.desc Verify ConstructorGetOwner case 003: call return constructor Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass003>();
        let constructors = cls.getConstructors();
        let owner = constructors[0].getOwner();
        expect(owner != null).assertTrue();
        expect(owner.getName()).assertEqual("MyClass003");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_0400
     * @tc.name testConstructorGetOwner004
     * @tc.desc Verify ConstructorGetOwner case 004: verify different constructor return Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorA = Class.from<ClassA004>().getConstructors()[0];
        let ctorB = Class.from<ClassB004>().getConstructors()[0];
        expect(ctorA.getOwner().getName()).assertEqual("ClassA004");
        expect(ctorB.getOwner().getName()).assertEqual("ClassB004");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_0500
     * @tc.name testConstructorGetOwner005
     * @tc.desc Verify ConstructorGetOwner case 005: verify inheritance constructor getOwner()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let parentCtor = Class.from<ParentClass005>().getConstructors()[0];
        let childCtor = Class.from<ChildClass005>().getConstructors()[0];
        expect(parentCtor.getOwner().getName()).assertEqual("ParentClass005");
        expect(childCtor.getOwner().getName()).assertEqual("ChildClass005");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_0600
     * @tc.name testConstructorGetOwner006
     * @tc.desc Verify ConstructorGetOwner case 006: verify generic constructor getOwner()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GenericClass006<int>>();
        let ctorRef = cls.getConstructors()[0];
        expect(ctorRef.getOwner().getName()).assertEqual("GenericClass006");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_0700
     * @tc.name testConstructorGetOwner007
     * @tc.desc Verify ConstructorGetOwner case 007: verify abstract class constructor getOwner()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<AbstractClass007>().getConstructors()[0];
        expect(ctorRef.getOwner().getName()).assertEqual("AbstractClass007");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_0800
     * @tc.name testConstructorGetOwner008
     * @tc.desc Verify ConstructorGetOwner case 008: verify return type is Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let constructors = cls.getConstructors();
        let owner = constructors[0].getOwner();
        expect(typeof owner).assertEqual("object");
        expect(owner.getName != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_0900
     * @tc.name testConstructorGetOwner009
     * @tc.desc Verify ConstructorGetOwner case 009: verify return Classobject using
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = Class.from<MyClass001>().getConstructors()[0];
        let owner = ctor.getOwner();
        expect(owner.getName() != null).assertTrue();
        expect(owner.getSuper != null).assertTrue();
        expect(owner.isSubtypeOf != null).assertTrue();
        expect(owner.getConstructors != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_1000
     * @tc.name testConstructorGetOwner010
     * @tc.desc Verify ConstructorGetOwner case 010: via ownerget constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass010>();
        let constructors = cls.getConstructors();
        let owner = constructors[0].getOwner();
        let ownerConstructors = owner.getConstructors();
        expect(ownerConstructors.length).assertEqual(constructors.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_1100
     * @tc.name testConstructorGetOwner011
     * @tc.desc Verify ConstructorGetOwner case 011: final constructor getOwner()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<FinalClass011>().getConstructors()[0];
        expect(ctorRef.getOwner().getName()).assertEqual("FinalClass011");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_1200
     * @tc.name testConstructorGetOwner012
     * @tc.desc Verify ConstructorGetOwner case 012: multiple constructor return same Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = Class.from<MyClass012>().getConstructors();
        let ownerClass = constructors[0].getOwner();
        for (let i = 0; i < constructors.length; i++) {
          expect(constructors[i].getOwner().getName()).assertEqual(ownerClass.getName());
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_1300
     * @tc.name testConstructorGetOwner013
     * @tc.desc Verify ConstructorGetOwner case 013: getOwner().getName()should and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass013>();
        let ctorRef = cls.getConstructors()[0];
        expect(cls.getName()).assertEqual(ctorRef.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_1400
     * @tc.name testConstructorGetOwner014
     * @tc.desc Verify ConstructorGetOwner case 014: getOwner()method not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = Class.from<MyClass001>().getConstructors()[0];
        let owner = ctor.getOwner();
        expect(owner.getName().length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_1500
     * @tc.name testConstructorGetOwner015
     * @tc.desc Verify ConstructorGetOwner case 015: verify modifier constructor get owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass015>();
        let constructors = cls.getConstructors();
        for (let i = 0; i < constructors.length; i++) {
          expect(constructors[i].getOwner().getName()).assertEqual("MyClass015");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_1600
     * @tc.name testConstructorGetOwner016
     * @tc.desc Verify ConstructorGetOwner case 016: verify different type constructor getOwner()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let c1 = Class.from<AbstractClass016>().getConstructors()[0];
        let c2 = Class.from<FinalClass016>().getConstructors()[0];
        let c3 = Class.from<NormalClass016>().getConstructors()[0];
        expect(c1.getOwner().getName()).assertEqual("AbstractClass016");
        expect(c2.getOwner().getName()).assertEqual("FinalClass016");
        expect(c3.getOwner().getName()).assertEqual("NormalClass016");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_1700
     * @tc.name testConstructorGetOwner017
     * @tc.desc Verify ConstructorGetOwner case 017: verify constructor getOwner()return same Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = Class.from<MyClass017>().getConstructors();
        let ownerClass = constructors[0].getOwner();
        for (let i = 0; i < constructors.length; i++) {
          expect(constructors[i].getOwner().getName()).assertEqual(ownerClass.getName());
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_1800
     * @tc.name testConstructorGetOwner018
     * @tc.desc Verify ConstructorGetOwner case 018: verify getOwner() and getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass018>();
        let ctorRef = cls.getConstructors()[0];
        expect(ctorRef.getName()).assertEqual("constructor");
        expect(ctorRef.getOwner().getName()).assertEqual("MyClass018");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_1900
     * @tc.name testConstructorGetOwner019
     * @tc.desc Verify ConstructorGetOwner case 019: via getOwner() get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetOwner019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass019>().getConstructors()[0];
        let owner = ctorRef.getOwner();

        expect(owner.getName()).assertEqual("MyClass019");
        expect(owner.getSuper() != null).assertTrue();
        expect(owner.getStaticMethods().length).assertLarger(0);
    });

  });
}