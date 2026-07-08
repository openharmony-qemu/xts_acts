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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class MyClass001 {
  public constructor() {}
}

class MyClass003 {
  public constructor() {}
}

class MyClass004 {
  private constructor() {}
}

class MyClass005 {
  protected constructor() {}
}

class MyClass006 {
  public constructor() {}
}

class MyClass007 {
  public constructor(value: int) {}
}

abstract class AbstractClass008 {
  public constructor() {}
}

final class FinalClass009 {
  public constructor() {}
}

class MyClass012 {
  public constructor(x?: int) {}
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
  public constructor() {}
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
  public constructor(value?: int) {}
}

class MyClass019 {
  public constructor(value: int) {}
}

class MyClass020 {
  public constructor(value?: int) {}
}

export default function ConstructorIsPublicTest(): void {
  describe('ConstructorIsPublicTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_0100
     * @tc.name testConstructorIsPublic001
     * @tc.desc Verify ConstructorIsPublic case 001: Class.from<MyClass003>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let constructors = cls.getConstructors();
      let isPublic = constructors[0].isPublic();
      expect(isPublic).assertTrue();
      expect(typeof isPublic).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_0200
     * @tc.name testConstructorIsPublic002
     * @tc.desc Verify ConstructorIsPublic case 002: Class.from<MyClass004>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<MyClass004>().getConstructors().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_0300
     * @tc.name testConstructorIsPublic003
     * @tc.desc Verify ConstructorIsPublic case 003: Class.from<MyClass005>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<MyClass005>().getConstructors().length).assertEqual(0);
      expect(Class.from<MyClass006>().getConstructors()[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_0400
     * @tc.name testConstructorIsPublic004
     * @tc.desc Verify ConstructorIsPublic case 004: Class.from<MyClass006>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass006>().getConstructors()[0];
      let isPublic = ctorRef.isPublic();
      expect(isPublic).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_0500
     * @tc.name testConstructorIsPublic005
     * @tc.desc Verify ConstructorIsPublic case 005: Class.from<MyClass007>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass007>().getConstructors()[0];
      expect(ctorRef.isPublic()).assertTrue();
      expect(ctorRef.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_0600
     * @tc.name testConstructorIsPublic006
     * @tc.desc Verify ConstructorIsPublic case 006: Class.from<AbstractClass008>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<AbstractClass008>().getConstructors()[0];
      expect(ctorRef.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_0700
     * @tc.name testConstructorIsPublic007
     * @tc.desc Verify ConstructorIsPublic case 007: Class.from<FinalClass009>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<FinalClass009>().getConstructors()[0];
      expect(ctorRef.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_0800
     * @tc.name testConstructorIsPublic008
     * @tc.desc Verify ConstructorIsPublic case 008: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let constructors = cls.getConstructors();
      let ctor = constructors[0];
      let isPublic = ctor.isPublic();
      expect(typeof isPublic).assertEqual("boolean");
      expect(isPublic).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_0900
     * @tc.name testConstructorIsPublic009
     * @tc.desc Verify ConstructorIsPublic case 009: Class.from<MyClass012>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass012>().getConstructors();
      expect(constructors.length).assertEqual(1);
      expect(constructors[0].isPublic()).assertTrue();
      expect(constructors[0].isPrivate()).assertFalse();
      expect(constructors[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_1000
     * @tc.name testConstructorIsPublic010
     * @tc.desc Verify ConstructorIsPublic case 010: Class.from<GenericClass013<int>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<GenericClass013<int>>().getConstructors()[0];
      expect(ctorRef.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_1100
     * @tc.name testConstructorIsPublic011
     * @tc.desc Verify ConstructorIsPublic case 011: Class.from<ParentClass014>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCtor = Class.from<ParentClass014>().getConstructors()[0];
      let childCtor = Class.from<ChildClass014>().getConstructors()[0];
      expect(parentCtor.isPublic()).assertTrue();
      expect(childCtor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_1200
     * @tc.name testConstructorIsPublic012
     * @tc.desc Verify ConstructorIsPublic case 012: Class.from<MyClass001>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass001>().getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_1300
     * @tc.name testConstructorIsPublic013
     * @tc.desc Verify ConstructorIsPublic case 013: Class.from<MyClass016>(), getName returns "constructor", constructor getName returns constructor, return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass016>().getConstructors()[0];
      expect(ctorRef.isPublic()).assertTrue();
      expect(ctorRef.getName()).assertEqual("constructor");
      expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_1400
     * @tc.name testConstructorIsPublic014
     * @tc.desc Verify ConstructorIsPublic case 014: Class.from<AbstractClass017>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = Class.from<AbstractClass017>().getConstructors()[0];
      let c2 = Class.from<FinalClass017>().getConstructors()[0];
      let c3 = Class.from<NormalClass017>().getConstructors()[0];
      expect(c1.isPublic()).assertTrue();
      expect(c2.isPublic()).assertTrue();
      expect(c3.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_1500
     * @tc.name testConstructorIsPublic015
     * @tc.desc Verify ConstructorIsPublic case 015: Class.from<MyClass018>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass018>().getConstructors();
      let publicCount = 0;
      for (let i = 0; i < constructors.length; i++) {
        if (constructors[i].isPublic()) {
          publicCount++;
        }
      }
      expect(publicCount).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_1600
     * @tc.name testConstructorIsPublic016
     * @tc.desc Verify ConstructorIsPublic case 016: Class.from<MyClass019>(), isNative flag verified, parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass019>().getConstructors()[0];
      expect(ctorRef.isPublic()).assertTrue();
      expect(ctorRef.isPrivate()).assertFalse();
      expect(ctorRef.isProtected()).assertFalse();
      expect(ctorRef.isNative()).assertFalse();
      expect(ctorRef.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_1700
     * @tc.name testConstructorIsPublic017
     * @tc.desc Verify ConstructorIsPublic case 017: Class.from<MyClass020>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPublic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass020>().getConstructors();
      let publicConstructors: Array<reflect.Constructor> = [];
      for (let i = 0; i < constructors.length; i++) {
        if (constructors[i].isPublic()) {
          publicConstructors.push(constructors[i]);
        }
      }
      expect(publicConstructors.length).assertLarger(0);
    });

  });
}