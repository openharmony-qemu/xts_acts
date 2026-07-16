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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class MyClass001 {
  public constructor() {}
}

class MyClass003 {
  public constructor() {}
}

class MyClass004 {
  public constructor() {}
}

abstract class AbstractClass005 {
  public constructor() {}
}

final class FinalClass006 {
  public constructor() {}
}

class GenericClass007<T> {
  public constructor() {}
}

class MyClass008 {
  public constructor(value?: int) {}
}

class MyClass011 {
  public constructor(x?: int) {}
}

class MyClass012 {
  public constructor() {}
}

class MyClass014 {
  public constructor(value?: int) {}
}

class NormalClass015 {
  public constructor() {}
}

final class FinalClass015 {
  public constructor() {}
}

abstract class AbstractClass015 {
  public constructor() {}
}

class ChildClass016 extends ParentClass016 {
  public constructor() {
    super();
  }
}

class ParentClass016 {
  public constructor() {}
}

class MyClass017 {
  public constructor(value?: int | string) {}
}

class MyClass018 {
  public constructor(value: int) {}
}

class MyClass019 {
  public constructor() {}
}

export default function ConstructorIsNativeTest(): void {
  describe('ConstructorIsNativeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_0100
     * @tc.name testConstructorIsNative001
     * @tc.desc Verify ConstructorIsNative case 001: Class.from<MyClass003>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let constructors = cls.getConstructors();
      let isNative = constructors[0].isNative();
      expect(isNative).assertFalse();
      expect(typeof isNative).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_0200
     * @tc.name testConstructorIsNative002
     * @tc.desc Verify ConstructorIsNative case 002: Class.from<MyClass004>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass004>().getConstructors()[0];
      expect(ctorRef.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_0300
     * @tc.name testConstructorIsNative003
     * @tc.desc Verify ConstructorIsNative case 003: Class.from<AbstractClass005>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<AbstractClass005>().getConstructors()[0];
      expect(ctorRef.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_0400
     * @tc.name testConstructorIsNative004
     * @tc.desc Verify ConstructorIsNative case 004: Class.from<FinalClass006>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<FinalClass006>().getConstructors()[0];
      expect(ctorRef.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_0500
     * @tc.name testConstructorIsNative005
     * @tc.desc Verify ConstructorIsNative case 005: Class.from<GenericClass007<int>>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<GenericClass007<int>>().getConstructors()[0];
      expect(ctorRef.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_0600
     * @tc.name testConstructorIsNative006
     * @tc.desc Verify ConstructorIsNative case 006: Class.from<MyClass008>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let constructors = cls.getConstructors();
      for (let i = 0; i < constructors.length; i++) {
        expect(constructors[i].isNative()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_0700
     * @tc.name testConstructorIsNative007
     * @tc.desc Verify ConstructorIsNative case 007: Class.from<MyClass001>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let constructors = cls.getConstructors();
      let isNative = constructors[0].isNative();
      expect(typeof isNative).assertEqual("boolean");
      expect(isNative).assertFalse();
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_0800
     * @tc.name testConstructorIsNative008
     * @tc.desc Verify ConstructorIsNative case 008: Class.from<MyClass011>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let constructors = cls.getConstructors();
      for (let i = 0; i < constructors.length; i++) {
        expect(constructors[i].isNative()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_0900
     * @tc.name testConstructorIsNative009
     * @tc.desc Verify ConstructorIsNative case 009: Class.from<MyClass012>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass012>().getConstructors()[0];
      expect(ctorRef.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_1000
     * @tc.name testConstructorIsNative010
     * @tc.desc Verify ConstructorIsNative case 010: Class.from<MyClass001>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass001>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_1100
     * @tc.name testConstructorIsNative011
     * @tc.desc Verify ConstructorIsNative case 011: Class.from<MyClass014>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let constructors = cls.getConstructors();
      for (let i = 0; i < constructors.length; i++) {
        expect(constructors[i].isNative()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_1200
     * @tc.name testConstructorIsNative012
     * @tc.desc Verify ConstructorIsNative case 012: Class.from<AbstractClass015>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = Class.from<AbstractClass015>().getConstructors()[0];
      let c2 = Class.from<FinalClass015>().getConstructors()[0];
      let c3 = Class.from<NormalClass015>().getConstructors()[0];
      expect(c1.isNative()).assertFalse();
      expect(c2.isNative()).assertFalse();
      expect(c3.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_1300
     * @tc.name testConstructorIsNative013
     * @tc.desc Verify ConstructorIsNative case 013: Class.from<ParentClass016>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCtor = Class.from<ParentClass016>().getConstructors()[0];
      let childCtor = Class.from<ChildClass016>().getConstructors()[0];
      expect(parentCtor.isNative()).assertFalse();
      expect(childCtor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_1400
     * @tc.name testConstructorIsNative014
     * @tc.desc Verify ConstructorIsNative case 014: Class.from<MyClass017>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass017>().getConstructors();
      for (let i = 0; i < constructors.length; i++) {
        let isNative = constructors[i].isNative();
        expect(isNative).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_1500
     * @tc.name testConstructorIsNative015
     * @tc.desc Verify ConstructorIsNative case 015: Class.from<MyClass018>(), isNative flag verified, parameter count verified, return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass018>().getConstructors()[0];
      expect(ctorRef.isNative()).assertFalse();
      expect(ctorRef.isPublic()).assertTrue();
      expect(ctorRef.getParametersNum()).assertEqual(1);
      expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_1600
     * @tc.name testConstructorIsNative016
     * @tc.desc Verify ConstructorIsNative case 016: Class.from<MyClass019>(), isNative flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorIsNative016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let userConstructor = Class.from<MyClass019>().getConstructors()[0];
      expect(userConstructor.isNative()).assertFalse();

      let arrayConstructors = Class.from<Array<int>>().getConstructors();
      for (let i = 0; i < arrayConstructors.length; i++) {
        let name = arrayConstructors[i].getName();
        let isNative = arrayConstructors[i].isNative();
        console.info(`Array constructor ${name} isNative: ${isNative}`);
      }
    });

  });
}