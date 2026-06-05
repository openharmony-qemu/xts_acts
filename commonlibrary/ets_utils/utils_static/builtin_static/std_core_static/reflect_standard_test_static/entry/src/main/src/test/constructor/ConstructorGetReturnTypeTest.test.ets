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

class ChildClass014 extends ParentClass014 {
  public constructor() {
    super();
  }
}

class ParentClass014 {
  public constructor() {}
}

class MyClass016 {
  public constructor(value?: int) {}
}

class NormalClass017 {
  public constructor() {}
}

final class FinalClass017 {
  public constructor() {}
}

abstract class AbstractClass017 {
  public constructor() {}
}

class MyClass018 {
  public constructor(value?: int | string, flag?: boolean) {}
}

class MyClass019 {
  public constructor() {}
}

class MyClass020 {
  public constructor() {}
  public static staticMethod(): string {
    return "test";
  }
}

class MyClass021 {
  public constructor(x: int, y: string) {}
}

export default function ConstructorGetReturnTypeTest(): void {
  describe('ConstructorGetReturnTypeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_0100
     * @tc.name testConstructorGetReturnType001
     * @tc.desc Verify ConstructorGetReturnType case 001: Class.from<MyClass001>(), getName returns "void", return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let constructors = cls.getConstructors();
      let returnType = constructors[0].getReturnType();
      expect(returnType.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_0200
     * @tc.name testConstructorGetReturnType002
     * @tc.desc Verify ConstructorGetReturnType case 002: Class.from<MyClass003>(), return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass003>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_0300
     * @tc.name testConstructorGetReturnType003
     * @tc.desc Verify ConstructorGetReturnType case 003: Class.from<MyClass003>(), getName returns "void", return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let constructors = cls.getConstructors();
      let returnType = constructors[0].getReturnType();
      expect(returnType.getName()).assertEqual("void");
      expect(typeof returnType).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_0400
     * @tc.name testConstructorGetReturnType004
     * @tc.desc Verify ConstructorGetReturnType case 004: Class.from<MyClass004>(), return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass004>().getConstructors();
      for (let i = 0; i < constructors.length; i++) {
        expect(constructors[i].getReturnType().getName()).assertEqual("void");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_0500
     * @tc.name testConstructorGetReturnType005
     * @tc.desc Verify ConstructorGetReturnType case 005: Class.from<MyClass005>(), return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass005>().getConstructors()[0];
      expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_0600
     * @tc.name testConstructorGetReturnType006
     * @tc.desc Verify ConstructorGetReturnType case 006: Class.from<MyClass006>(), return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass006>().getConstructors()[0];
      expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_0700
     * @tc.name testConstructorGetReturnType007
     * @tc.desc Verify ConstructorGetReturnType case 007: Class.from<MyClass007>(), return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass007>().getConstructors()[0];
      expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_0800
     * @tc.name testConstructorGetReturnType008
     * @tc.desc Verify ConstructorGetReturnType case 008: Class.from<MyClass005>(), getName returns "void", return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass005>().getConstructors();
      let returnType = constructors[0].getReturnType();
      expect(typeof returnType).assertEqual("object");
      expect(returnType.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_0900
     * @tc.name testConstructorGetReturnType009
     * @tc.desc Verify ConstructorGetReturnType case 009: Class.from<MyClass005>(), isPrimitive returns true, getName returns "void", return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass005>().getConstructors()[0];
      let returnType = ctor.getReturnType();
      expect(returnType.getName()).assertEqual("void");
      expect(returnType.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_1000
     * @tc.name testConstructorGetReturnType010
     * @tc.desc Verify ConstructorGetReturnType case 010: Class.from<MyClass005>(), isInterface returns false, isPrimitive returns true, isFinal returns true, getName returns "void"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass005>().getConstructors()[0];
      let returnType = ctor.getReturnType();
      expect(returnType.getName()).assertEqual("void");
      expect(returnType.isPrimitive()).assertTrue();
      expect(returnType.isInterface()).assertFalse();
      expect(returnType.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_1100
     * @tc.name testConstructorGetReturnType011
     * @tc.desc Verify ConstructorGetReturnType case 011: Class.from<AbstractClass011>(), return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<AbstractClass011>().getConstructors()[0];
      expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_1200
     * @tc.name testConstructorGetReturnType012
     * @tc.desc Verify ConstructorGetReturnType case 012: Class.from<FinalClass012>(), return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<FinalClass012>().getConstructors()[0];
      expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_1300
     * @tc.name testConstructorGetReturnType013
     * @tc.desc Verify ConstructorGetReturnType case 013: Class.from<GenericClass013<int>>(), return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<GenericClass013<int>>().getConstructors()[0];
      expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_1400
     * @tc.name testConstructorGetReturnType014
     * @tc.desc Verify ConstructorGetReturnType case 014: Class.from<ParentClass014>(), return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCtor = Class.from<ParentClass014>().getConstructors()[0];
      let childCtor = Class.from<ChildClass014>().getConstructors()[0];
      expect(parentCtor.getReturnType().getName()).assertEqual("void");
      expect(childCtor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_1500
     * @tc.name testConstructorGetReturnType015
     * @tc.desc Verify ConstructorGetReturnType case 015: Class.from<MyClass005>(), getName returns "void", return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass005>().getConstructors()[0];
      let returnType = ctor.getReturnType();
      expect(returnType.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_1600
     * @tc.name testConstructorGetReturnType016
     * @tc.desc Verify ConstructorGetReturnType case 016: Class.from<MyClass016>(), return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass016>();
      let constructors = cls.getConstructors();
      for (let i = 0; i < constructors.length; i++) {
        expect(constructors[i].getReturnType().getName()).assertEqual("void");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_1700
     * @tc.name testConstructorGetReturnType017
     * @tc.desc Verify ConstructorGetReturnType case 017: Class.from<AbstractClass017>(), return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = Class.from<AbstractClass017>().getConstructors()[0];
      let c2 = Class.from<FinalClass017>().getConstructors()[0];
      let c3 = Class.from<NormalClass017>().getConstructors()[0];
      expect(c1.getReturnType().getName()).assertEqual("void");
      expect(c2.getReturnType().getName()).assertEqual("void");
      expect(c3.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_1800
     * @tc.name testConstructorGetReturnType018
     * @tc.desc Verify ConstructorGetReturnType case 018: Class.from<MyClass018>(), return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass018>().getConstructors();
      for (let i = 0; i < constructors.length; i++) {
        expect(constructors[i].getReturnType().getName()).assertEqual("void");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_1900
     * @tc.name testConstructorGetReturnType019
     * @tc.desc Verify ConstructorGetReturnType case 019: Class.from<MyClass019>(), return type verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass019>().getConstructors()[0];
      expect(ctorRef.getReturnType().getName()).assertEqual("void");
      expect(ctorRef.getOwner().getName()).assertEqual("entry.src.main.src.test.constructor.ConstructorGetReturnTypeTest.test.MyClass019");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_2000
     * @tc.name testConstructorGetReturnType020
     * @tc.desc Verify ConstructorGetReturnType case 020: Class.from<MyClass020>(), getStaticMethod resolves expected method, return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let ctorRef = cls.getConstructors()[0];
      let method = cls.getStaticMethod("staticMethod");

      expect(ctorRef.getReturnType().getName()).assertEqual("void");
      expect(method!.getReturnType().getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_2100
     * @tc.name testConstructorGetReturnType021
     * @tc.desc Verify ConstructorGetReturnType case 021: Class.from<MyClass021>(), getName returns "constructor", constructor getName returns constructor, parameter count verified, return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetReturnType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass021>().getConstructors()[0];

      expect(ctorRef.getName()).assertEqual("constructor");
      expect(ctorRef.getReturnType().getName()).assertEqual("void");
      expect(ctorRef.getParametersNum()).assertEqual(2);
      expect(ctorRef.getOwner().getName()).assertEqual("entry.src.main.src.test.constructor.ConstructorGetReturnTypeTest.test.MyClass021");
    });

  });
}

