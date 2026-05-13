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
  describe('ConstructorIsPrivateTest', () => {
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
     * @tc.desc Verify ConstructorIsPrivate case 001: isPrivate()method no parameters verify empty parameters call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let constructors = cls.getConstructors();
        let isPrivate = constructors[0].isPrivate();
        expect(isPrivate).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0200
     * @tc.name testConstructorIsPrivate002
     * @tc.desc Verify ConstructorIsPrivate case 002: parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(Class.from<MyClass001>().getConstructors()[0].isPrivate()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0300
     * @tc.name testConstructorIsPrivate003
     * @tc.desc Verify ConstructorIsPrivate case 003: privateconstructor return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass003>();
        let constructors = cls.getConstructors();
        let isPrivate = constructors[0].isPrivate();
        expect(isPrivate).assertTrue();
        expect(typeof isPrivate).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0400
     * @tc.name testConstructorIsPrivate004
     * @tc.desc Verify ConstructorIsPrivate case 004: publicconstructor return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass004>();
        let constructors = cls.getConstructors();
        let isPrivate = constructors[0].isPrivate();
        expect(isPrivate).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0500
     * @tc.name testConstructorIsPrivate005
     * @tc.desc Verify ConstructorIsPrivate case 005: protectedconstructor return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass005>();
        let constructors = cls.getConstructors();
        let isPrivate = constructors[0].isPrivate();
        expect(isPrivate).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0600
     * @tc.name testConstructorIsPrivate006
     * @tc.desc Verify ConstructorIsPrivate case 006: modifier constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass006>().getConstructors()[0];
        let isPrivate = ctorRef.isPrivate();
        expect(isPrivate).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0700
     * @tc.name testConstructorIsPrivate007
     * @tc.desc Verify ConstructorIsPrivate case 007: private parameters constructor return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass007>().getConstructors()[0];
        expect(ctorRef.isPrivate()).assertTrue();
        expect(ctorRef.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0800
     * @tc.name testConstructorIsPrivate008
     * @tc.desc Verify ConstructorIsPrivate case 008: abstract class privateconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<AbstractClass008>().getConstructors()[0];
        expect(ctorRef.isPrivate()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_0900
     * @tc.name testConstructorIsPrivate009
     * @tc.desc Verify ConstructorIsPrivate case 009: final privateconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<FinalClass009>().getConstructors()[0];
        expect(ctorRef.isPrivate()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1000
     * @tc.name testConstructorIsPrivate010
     * @tc.desc Verify ConstructorIsPrivate case 010: verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let constructors = cls.getConstructors();
        let isPrivate = constructors[0].isPrivate();
        expect(typeof isPrivate).assertEqual("boolean");
        expect(isPrivate === true || isPrivate === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1100
     * @tc.name testConstructorIsPrivate011
     * @tc.desc Verify ConstructorIsPrivate case 011: verify return true or false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = Class.from<MyClass001>().getConstructors()[0];
        let isPrivate = ctor.isPrivate();
        expect(isPrivate === true || isPrivate === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1200
     * @tc.name testConstructorIsPrivate012
     * @tc.desc Verify ConstructorIsPrivate case 012: isPrivate and isPublic isProtected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let priv = Class.from<MyClass016>().getConstructors()[0];
        expect(priv.isPrivate()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1300
     * @tc.name testConstructorIsPrivate013
     * @tc.desc Verify ConstructorIsPrivate case 013: generic privateconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<GenericClass013<int>>().getConstructors()[0];
        expect(ctorRef.isPrivate()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1400
     * @tc.name testConstructorIsPrivate014
     * @tc.desc Verify ConstructorIsPrivate case 014: privateconstructor should
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<Singleton014>().getConstructors()[0];
        expect(ctorRef.isPrivate()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1500
     * @tc.name testConstructorIsPrivate015
     * @tc.desc Verify ConstructorIsPrivate case 015: isPrivate()method not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = Class.from<MyClass001>().getConstructors()[0];
        let isPrivate = ctor.isPrivate();
        expect(isPrivate === true || isPrivate === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1600
     * @tc.name testConstructorIsPrivate016
     * @tc.desc Verify ConstructorIsPrivate case 016: privateconstructor and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass016>().getConstructors()[0];
        expect(ctorRef.isPrivate()).assertTrue();
        expect(ctorRef.getName()).assertEqual("constructor");
        expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1700
     * @tc.name testConstructorIsPrivate017
     * @tc.desc Verify ConstructorIsPrivate case 017: verify different type constructor isPrivate()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let c1 = Class.from<AbstractClass017>().getConstructors()[0];
        let c2 = Class.from<FinalClass017>().getConstructors()[0];
        let c3 = Class.from<NormalClass017>().getConstructors()[0];
        expect(c1.isPrivate()).assertTrue();
        expect(c2.isPrivate()).assertTrue();
        expect(c3.isPrivate()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1800
     * @tc.name testConstructorIsPrivate018
     * @tc.desc Verify ConstructorIsPrivate case 018: verify different constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = Class.from<MyClass018>().getConstructors();
        let privateCount = 0;
        for (let i = 0; i < constructors.length; i++) {
          if (constructors[i].isPrivate()) {
            privateCount++;
          }
        }
        expect(privateCount).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_1900
     * @tc.name testConstructorIsPrivate019
     * @tc.desc Verify ConstructorIsPrivate case 019: verify isPrivate() and constructor property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass019>().getConstructors()[0];
        expect(ctorRef.isPrivate()).assertTrue();
        expect(ctorRef.isPublic()).assertFalse();
        expect(ctorRef.isProtected()).assertFalse();
        expect(ctorRef.isNative()).assertFalse();
        expect(ctorRef.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_2000
     * @tc.name testConstructorIsPrivate020
     * @tc.desc Verify ConstructorIsPrivate case 020: from constructor privateconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = Class.from<MyClass020>().getConstructors();
        let privateConstructors: Array<reflect.Constructor> = [];
        for (let i = 0; i < constructors.length; i++) {
          if (constructors[i].isPrivate()) {
            privateConstructors.push(constructors[i]);
          }
        }
        expect(privateConstructors.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_2100
     * @tc.name testConstructorIsPrivate021
     * @tc.desc Verify ConstructorIsPrivate case 021: constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsPrivate021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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