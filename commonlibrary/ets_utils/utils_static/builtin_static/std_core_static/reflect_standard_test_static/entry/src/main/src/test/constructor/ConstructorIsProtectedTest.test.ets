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
  protected constructor() {}
}

class MyClass003 {
  protected constructor() {}
}

class MyClass004 {
  public constructor() {}
}

class MyClass005 {
  private constructor() {}
}

class MyClass006 {
  constructor() {}
}

class MyClass007 {
  protected constructor(value: int) {}
}

abstract class AbstractClass008 {
  protected constructor() {}
}

final class FinalClass009 {
  protected constructor() {}
}

class MyClass012 {
  public constructor(x?: int) {}
}

class GenericClass013<T> {
  protected constructor() {}
}

class ChildClass014 extends ParentClass014 {
  protected constructor() {
    super();
  }
}

class ParentClass014 {
  protected constructor() {}
}

class MyClass016 {
  protected constructor() {}
}

class NormalClass017 {
  protected constructor() {}
}

final class FinalClass017 {
  protected constructor() {}
}

abstract class AbstractClass017 {
  protected constructor() {}
}

class MyClass018 {
  protected constructor(value?: int) {}
}

class MyClass019 {
  protected constructor(value: int) {}
}

class MyClass020 {
  protected constructor(value?: int | string) {}
}

class MyClass021 {
  public constructor() {}
}

class MyClass022 {
  public constructor() {}
}

export default function ConstructorIsProtectedTest(): void {
  describe('ConstructorIsProtectedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0100
     * @tc.name testConstructorIsProtected001
     * @tc.desc Verify ConstructorIsProtected case 001: Class.from<MyClass003>(), isAbstract returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      expect(cls.getConstructors().length).assertEqual(0);
      expect(cls.isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0200
     * @tc.name testConstructorIsProtected002
     * @tc.desc Verify ConstructorIsProtected case 002: Class.from<MyClass012>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let constructors = cls.getConstructors();
      let isProtected = constructors[0].isProtected();
      expect(isProtected).assertFalse();
      expect(constructors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0300
     * @tc.name testConstructorIsProtected003
     * @tc.desc Verify ConstructorIsProtected case 003: Class.from<MyClass005>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<MyClass005>().getConstructors().length).assertEqual(0);
      expect(Class.from<MyClass006>().getConstructors()[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0400
     * @tc.name testConstructorIsProtected004
     * @tc.desc Verify ConstructorIsProtected case 004: Class.from<MyClass006>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass006>().getConstructors()[0];
      let isProtected = ctorRef.isProtected();
      expect(isProtected).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0500
     * @tc.name testConstructorIsProtected005
     * @tc.desc Verify ConstructorIsProtected case 005: Class.from<MyClass007>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      expect(cls.getConstructors().length).assertEqual(0);
      expect(cls.getName()).assertEqual(
        "entry.src.main.src.test.constructor.ConstructorIsProtectedTest.test.MyClass007");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0600
     * @tc.name testConstructorIsProtected006
     * @tc.desc Verify ConstructorIsProtected case 006: Class.from<AbstractClass008>(), isAbstract returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass008>();
      expect(cls.getConstructors().length).assertEqual(0);
      expect(cls.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0700
     * @tc.name testConstructorIsProtected007
     * @tc.desc Verify ConstructorIsProtected case 007: Class.from<FinalClass009>(), isFinal returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass009>();
      expect(cls.getConstructors().length).assertEqual(0);
      expect(cls.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0800
     * @tc.name testConstructorIsProtected008
     * @tc.desc Verify ConstructorIsProtected case 008: Class.from<MyClass004>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let constructors = cls.getConstructors();
      expect(constructors.length).assertLarger(0);
      let isProtected = constructors[0].isProtected();
      expect(typeof isProtected).assertEqual("boolean");
      expect(isProtected).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0900
     * @tc.name testConstructorIsProtected009
     * @tc.desc Verify ConstructorIsProtected case 009: Class.from<MyClass004>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass004>().getConstructors()[0];
      let modifierCount = 0;
      if (ctor.isPrivate()) {
        modifierCount++;
      }
      if (ctor.isPublic()) {
        modifierCount++;
      }
      if (ctor.isProtected()) {
        modifierCount++;
      }
      expect(modifierCount).assertEqual(1);
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1000
     * @tc.name testConstructorIsProtected010
     * @tc.desc Verify ConstructorIsProtected case 010: Class.from<GenericClass013<int>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass013<int>>();
      expect(cls.getConstructors().length).assertEqual(0);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.constructor.ConstructorIsProtectedTest.test.GenericClass013");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1100
     * @tc.name testConstructorIsProtected011
     * @tc.desc Verify ConstructorIsProtected case 011: Class.from<ParentClass014>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<ParentClass014>().getConstructors().length).assertEqual(0);
      expect(Class.from<ChildClass014>().getConstructors().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1200
     * @tc.name testConstructorIsProtected012
     * @tc.desc Verify ConstructorIsProtected case 012: Class.from<MyClass004>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass004>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1300
     * @tc.name testConstructorIsProtected013
     * @tc.desc Verify ConstructorIsProtected case 013: Class.from<MyClass004>(), getName returns "constructor", constructor getName returns constructor, return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass004>().getConstructors()[0];
      expect(ctorRef.isProtected()).assertFalse();
      expect(ctorRef.getName()).assertEqual("constructor");
      expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1400
     * @tc.name testConstructorIsProtected014
     * @tc.desc Verify ConstructorIsProtected case 014: Class.from<AbstractClass017>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = Class.from<AbstractClass017>().getConstructors();
      let c2 = Class.from<FinalClass017>().getConstructors();
      let c3 = Class.from<NormalClass017>().getConstructors();
      expect(c1.length).assertEqual(0);
      expect(c2.length).assertEqual(0);
      expect(c3.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1500
     * @tc.name testConstructorIsProtected015
     * @tc.desc Verify ConstructorIsProtected case 015: Class.from<MyClass018>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass018>().getConstructors();
      expect(constructors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1600
     * @tc.name testConstructorIsProtected016
     * @tc.desc Verify ConstructorIsProtected case 016: Class.from<MyClass019>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<MyClass019>().getConstructors().length).assertEqual(0);
      let visibleCtor = Class.from<MyClass004>().getConstructors()[0];
      expect(visibleCtor.isProtected()).assertFalse();
      expect(visibleCtor.isPublic()).assertTrue();
      expect(visibleCtor.isPrivate()).assertFalse();
      expect(visibleCtor.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1700
     * @tc.name testConstructorIsProtected017
     * @tc.desc Verify ConstructorIsProtected case 017: Class.from<MyClass020>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<MyClass020>().getConstructors().length).assertEqual(0);
      let constructors = Class.from<MyClass021>().getConstructors();
      let nonProtectedCount = 0;
      for (let i = 0; i < constructors.length; i++) {
        if (!constructors[i].isProtected()) {
          nonProtectedCount++;
        }
      }
      expect(nonProtectedCount).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1800
     * @tc.name testConstructorIsProtected018
     * @tc.desc Verify ConstructorIsProtected case 018: Class.from<MyClass022>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass022>().getConstructors();
      let publicCount = 0;
      let privateCount = 0;
      let protectedCount = 0;
      for (let i = 0; i < constructors.length; i++) {
        if (constructors[i].isPublic()) {
          publicCount++;
        } else if (constructors[i].isPrivate()) {
          privateCount++;
        } else if (constructors[i].isProtected()) {
          protectedCount++;
        }
      }
      expect(publicCount).assertEqual(1);
      expect(privateCount).assertEqual(0);
      expect(protectedCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1900
     * @tc.name testConstructorIsProtected019
     * @tc.desc Verify ConstructorIsProtected case 019: Class.from<MyClass022>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsProtected019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass022>().getConstructors();
      for (let i = 0; i < constructors.length; i++) {
        let ctorRef = constructors[i];
        let count = 0;
        if (ctorRef.isPublic()) count++;
        if (ctorRef.isPrivate()) count++;
        if (ctorRef.isProtected()) count++;
        expect(count).assertEqual(1);
      }
    });

  });
}