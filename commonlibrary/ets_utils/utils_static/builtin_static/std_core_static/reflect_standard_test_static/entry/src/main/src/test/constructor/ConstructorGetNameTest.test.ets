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

class MyClass004 {
    public constructor(value?: int | string, flag?: boolean) {}
  }

class MyClass005 {
    public constructor() {}
  }

class MyClass006 {
    public constructor(name: string, age: int) {}
  }

class MyClass007 {
    public constructor(required: string, optional?: int) {}
  }

abstract class AbstractClass011 {
    public constructor() {}
  }

final class FinalClass012 {
    public constructor() {}
  }

class GenericClass013<T> {
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

class ChildClass017 extends ParentClass017 {
    public constructor() {
      super();
    }
  }

class ParentClass017 {
    public constructor() {}
  }

class MyClass018 {
    public constructor(value?: int | string, flag?: boolean) {}
  }

class MyClass019 {
    public constructor() {}
  }

class MyClass020 {
    public constructor(name: string, age: int) {}
  }

class MyClass021 {
    public constructor(value?: int | string) {}
  }

class MyClass022 {
    public constructor(x?: int | string | boolean) {}
  }


export default function ConstructorGetNameTest(): void {
  describe('ConstructorGetNameTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_0100
     * @tc.name testConstructorGetName001
     * @tc.desc Verify ConstructorGetName case 001: getName()method no parameters verify empty parameters call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let constructors = cls.getConstructors();
        let name = constructors[0].getName();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_0200
     * @tc.name testConstructorGetName002
     * @tc.desc Verify ConstructorGetName case 002: parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      Class.from<MyClass003>().getConstructors()[0].getName();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_0300
     * @tc.name testConstructorGetName003
     * @tc.desc Verify ConstructorGetName case 003: call return constructor name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass003>();
        let constructors = cls.getConstructors();
        let name = constructors[0].getName();
        expect(name).assertEqual("constructor");
        expect(typeof name).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_0400
     * @tc.name testConstructorGetName004
     * @tc.desc Verify ConstructorGetName case 004: multiple constructor when return constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass004>();
        let constructors = cls.getConstructors();
        for (let i = 0; i < constructors.length; i++) {
          expect(constructors[i].getName()).assertEqual("constructor");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_0500
     * @tc.name testConstructorGetName005
     * @tc.desc Verify ConstructorGetName case 005: constructor getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass005>().getConstructors()[0];
        expect(ctorRef.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_0600
     * @tc.name testConstructorGetName006
     * @tc.desc Verify ConstructorGetName case 006: parameters constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass006>().getConstructors()[0];
        expect(ctorRef.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_0700
     * @tc.name testConstructorGetName007
     * @tc.desc Verify ConstructorGetName case 007: parameters constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass007>().getConstructors()[0];
        expect(ctorRef.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_0800
     * @tc.name testConstructorGetName008
     * @tc.desc Verify ConstructorGetName case 008: verify return type is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = Class.from<MyClass005>().getConstructors();
        let name = constructors[0].getName();
        expect(typeof name === "string").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_0900
     * @tc.name testConstructorGetName009
     * @tc.desc Verify ConstructorGetName case 009: constructor name empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = Class.from<MyClass005>().getConstructors()[0];
        let name = ctor.getName();
        expect(name.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_1000
     * @tc.name testConstructorGetName010
     * @tc.desc Verify ConstructorGetName case 010: verify return is constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = Class.from<MyClass005>().getConstructors()[0];
        let name = ctor.getName();
        expect(name).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_1100
     * @tc.name testConstructorGetName011
     * @tc.desc Verify ConstructorGetName case 011: abstract class constructor getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<AbstractClass011>().getConstructors()[0];
        expect(ctorRef.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_1200
     * @tc.name testConstructorGetName012
     * @tc.desc Verify ConstructorGetName case 012: final constructor getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<FinalClass012>().getConstructors()[0];
        expect(ctorRef.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_1300
     * @tc.name testConstructorGetName013
     * @tc.desc Verify ConstructorGetName case 013: generic constructor getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<GenericClass013<int>>().getConstructors()[0];
        expect(ctorRef.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_1400
     * @tc.name testConstructorGetName014
     * @tc.desc Verify ConstructorGetName case 014: getName()method not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = Class.from<MyClass005>().getConstructors()[0];
        let name = ctor.getName();
        expect(name.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_1500
     * @tc.name testConstructorGetName015
     * @tc.desc Verify ConstructorGetName case 015: verify modifier constructor get name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass015>();
        let constructors = cls.getConstructors();
        for (let i = 0; i < constructors.length; i++) {
          expect(constructors[i].getName()).assertEqual("constructor");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_1600
     * @tc.name testConstructorGetName016
     * @tc.desc Verify ConstructorGetName case 016: verify different type constructor getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let c1 = Class.from<AbstractClass016>().getConstructors()[0];
        let c2 = Class.from<FinalClass016>().getConstructors()[0];
        let c3 = Class.from<NormalClass016>().getConstructors()[0];
        expect(c1.getName()).assertEqual("constructor");
        expect(c2.getName()).assertEqual("constructor");
        expect(c3.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_1700
     * @tc.name testConstructorGetName017
     * @tc.desc Verify ConstructorGetName case 017: verify inheritance constructor getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let parentCtor = Class.from<ParentClass017>().getConstructors()[0];
        let childCtor = Class.from<ChildClass017>().getConstructors()[0];
        expect(parentCtor.getName()).assertEqual("constructor");
        expect(childCtor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_1800
     * @tc.name testConstructorGetName018
     * @tc.desc Verify ConstructorGetName case 018: verify constructor getName()return same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = Class.from<MyClass018>().getConstructors();
        for (let i = 0; i < constructors.length; i++) {
          expect(constructors[i].getName()).assertEqual("constructor");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_1900
     * @tc.name testConstructorGetName019
     * @tc.desc Verify ConstructorGetName case 019: verify constructor getName() and getOwner()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass019>().getConstructors()[0];
        expect(ctorRef.getName()).assertEqual("constructor");
        expect(ctorRef.getOwner().getName()).assertEqual("MyClass019");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_2000
     * @tc.name testConstructorGetName020
     * @tc.desc Verify ConstructorGetName case 020: verify getName() and Constructormethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass020>().getConstructors()[0];
        expect(ctorRef.getName()).assertEqual("constructor");
        expect(ctorRef.getParametersNum()).assertEqual(2);
        expect(ctorRef.isPublic()).assertTrue();
        expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_2100
     * @tc.name testConstructorGetName021
     * @tc.desc Verify ConstructorGetName case 021: multiple constructor via parameters type getName()same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass021>();
        let constructors = cls.getConstructors();
        expect(constructors.length).assertEqual(1);
        expect(constructors[0].getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_2200
     * @tc.name testConstructorGetName022
     * @tc.desc Verify ConstructorGetName case 022: getName()not constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetName022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = Class.from<MyClass022>().getConstructors();
        expect(constructors.length).assertEqual(1);
        expect(constructors[0].getName()).assertEqual("constructor");
    });

  });
}