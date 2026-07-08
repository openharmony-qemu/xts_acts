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
  private constructor() {}
}

class MyClass003 {
  private constructor() {}
}

class MyClass004 {
  public constructor() {}
}

class MyClass005 {
  protected constructor() {}
}

class MyClass006 {
  constructor() {}
}

class MyClass007 {
  private constructor(value: int) {}
}

abstract class AbstractClass008 {
  private constructor() {}
}

final class FinalClass009 {
  private constructor() {}
}

class MyClass012 {
  public constructor(x?: int) {}
}

class GenericClass013<T> {
  private constructor() {}
}

class Singleton014 {
  private static instance: Singleton014 | null = null;
  private constructor() {}

  public static getInstance(): Singleton014 {
    if (Singleton014.instance === null) {
      Singleton014.instance = new Singleton014();
    }
    return Singleton014.instance as Singleton014;
  }
}

class MyClass016 {
  private constructor() {}
}

class NormalClass017 {
  private constructor() {}
}

final class FinalClass017 {
  private constructor() {}
}

abstract class AbstractClass017 {
  private constructor() {}
}

class MyClass018 {
  private constructor(value?: int | string) {}
}

class MyClass019 {
  private constructor(value: int) {}
}

class MyClass020 {
  private constructor(value?: int) {}
}

class MyClass021 {
  public constructor() {}
}

export default function ConstructorIsPrivateTest(): void {
  describe('ConstructorIsPrivateTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0100
     * @tc.name testConstructorIsPrivate001
     * @tc.desc Verify ConstructorIsPrivate case 001: Class.from<MyClass003>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<MyClass003>().getConstructors().length).assertEqual(0);
      expect(Class.from<MyClass003>().getName()).assertEqual(
        "entry.src.main.src.test.constructor.ConstructorIsPrivateTest.test.MyClass003");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0200
     * @tc.name testConstructorIsPrivate002
     * @tc.desc Verify ConstructorIsPrivate case 002: Class.from<MyClass012>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let constructors = cls.getConstructors();
      let isPrivate = constructors[0].isPrivate();
      expect(isPrivate).assertFalse();
      expect(constructors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0300
     * @tc.name testConstructorIsPrivate003
     * @tc.desc Verify ConstructorIsPrivate case 003: Class.from<MyClass005>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<MyClass005>().getConstructors().length).assertEqual(0);
      expect(Class.from<MyClass006>().getConstructors()[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0400
     * @tc.name testConstructorIsPrivate004
     * @tc.desc Verify ConstructorIsPrivate case 004: Class.from<MyClass006>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass006>().getConstructors()[0];
      let isPrivate = ctorRef.isPrivate();
      expect(isPrivate).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0500
     * @tc.name testConstructorIsPrivate005
     * @tc.desc Verify ConstructorIsPrivate case 005: Class.from<MyClass007>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<MyClass007>().getConstructors().length).assertEqual(0);
      expect(Class.from<MyClass007>().getName()).assertEqual(
        "entry.src.main.src.test.constructor.ConstructorIsPrivateTest.test.MyClass007");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0600
     * @tc.name testConstructorIsPrivate006
     * @tc.desc Verify ConstructorIsPrivate case 006: Class.from<AbstractClass008>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass008>();
      expect(cls.getConstructors().length).assertEqual(0);
      expect(cls.getName()).assertEqual(
        "entry.src.main.src.test.constructor.ConstructorIsPrivateTest.test.AbstractClass008");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0700
     * @tc.name testConstructorIsPrivate007
     * @tc.desc Verify ConstructorIsPrivate case 007: Class.from<FinalClass009>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass009>();
      expect(cls.getConstructors().length).assertEqual(0);
      expect(cls.getName()).assertEqual(
        "entry.src.main.src.test.constructor.ConstructorIsPrivateTest.test.FinalClass009");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0800
     * @tc.name testConstructorIsPrivate008
     * @tc.desc Verify ConstructorIsPrivate case 008: Class.from<MyClass004>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let constructors = cls.getConstructors();
      expect(constructors.length).assertLarger(0);
      let isPrivate = constructors[0].isPrivate();
      expect(typeof isPrivate).assertEqual("boolean");
      expect(isPrivate).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0900
     * @tc.name testConstructorIsPrivate009
     * @tc.desc Verify ConstructorIsPrivate case 009: Class.from<MyClass004>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1000
     * @tc.name testConstructorIsPrivate010
     * @tc.desc Verify ConstructorIsPrivate case 010: Class.from<GenericClass013<int>>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass013<int>>();
      expect(cls.getConstructors().length).assertEqual(0);
      expect(cls.getName()).assertEqual("entry.src.main.src.test.constructor.ConstructorIsPrivateTest.test.GenericClass013");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1100
     * @tc.name testConstructorIsPrivate011
     * @tc.desc Verify ConstructorIsPrivate case 011: Class.from<Singleton014>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<Singleton014>().getConstructors().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1200
     * @tc.name testConstructorIsPrivate012
     * @tc.desc Verify ConstructorIsPrivate case 012: Class.from<MyClass004>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass004>().getConstructors()[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1300
     * @tc.name testConstructorIsPrivate013
     * @tc.desc Verify ConstructorIsPrivate case 013: Class.from<MyClass004>(), getName returns "constructor", constructor getName returns constructor, return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass004>().getConstructors()[0];
      expect(ctorRef.isPrivate()).assertFalse();
      expect(ctorRef.getName()).assertEqual("constructor");
      expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1400
     * @tc.name testConstructorIsPrivate014
     * @tc.desc Verify ConstructorIsPrivate case 014: Class.from<AbstractClass017>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<AbstractClass017>().getConstructors().length).assertEqual(0);
      expect(Class.from<FinalClass017>().getConstructors().length).assertEqual(0);
      expect(Class.from<NormalClass017>().getConstructors().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1500
     * @tc.name testConstructorIsPrivate015
     * @tc.desc Verify ConstructorIsPrivate case 015: Class.from<MyClass018>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<MyClass018>().getConstructors().length).assertEqual(0);
      expect(Class.from<MyClass018>().getName()).assertEqual(
        "entry.src.main.src.test.constructor.ConstructorIsPrivateTest.test.MyClass018");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1600
     * @tc.name testConstructorIsPrivate016
     * @tc.desc Verify ConstructorIsPrivate case 016: Class.from<MyClass019>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<MyClass019>().getConstructors().length).assertEqual(0);
      let visibleCtor = Class.from<MyClass004>().getConstructors()[0];
      expect(visibleCtor.isPrivate()).assertFalse();
      expect(visibleCtor.isPublic()).assertTrue();
      expect(visibleCtor.isProtected()).assertFalse();
      expect(visibleCtor.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1700
     * @tc.name testConstructorIsPrivate017
     * @tc.desc Verify ConstructorIsPrivate case 017: Class.from<MyClass020>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<MyClass020>().getConstructors().length).assertEqual(0);
      let constructors = Class.from<MyClass021>().getConstructors();
      let nonPrivateCount = 0;
      for (let i = 0; i < constructors.length; i++) {
        if (!constructors[i].isPrivate()) {
          nonPrivateCount++;
        }
      }
      expect(nonPrivateCount).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1800
     * @tc.name testConstructorIsPrivate018
     * @tc.desc Verify ConstructorIsPrivate case 018: Class.from<MyClass021>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsPrivate018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass021>().getConstructors();
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

  });
}