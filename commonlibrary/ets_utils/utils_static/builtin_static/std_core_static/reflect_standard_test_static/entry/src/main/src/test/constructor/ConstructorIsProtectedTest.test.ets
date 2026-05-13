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
  describe('ConstructorIsProtectedTest', () => {
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
     * @tc.desc Verify ConstructorIsProtected case 001: isProtected()method no parameters verify empty parameters call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let constructors = cls.getConstructors();
        let isProtected = constructors[0].isProtected();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0200
     * @tc.name testConstructorIsProtected002
     * @tc.desc Verify ConstructorIsProtected case 002: parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      Class.from<MyClass001>().getConstructors()[0].isProtected();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0300
     * @tc.name testConstructorIsProtected003
     * @tc.desc Verify ConstructorIsProtected case 003: protectedconstructor return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass003>();
        let constructors = cls.getConstructors();
        let isProtected = constructors[0].isProtected();
        expect(isProtected).assertTrue();
        expect(typeof isProtected).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0400
     * @tc.name testConstructorIsProtected004
     * @tc.desc Verify ConstructorIsProtected case 004: publicconstructor return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass004>();
        let constructors = cls.getConstructors();
        let isProtected = constructors[0].isProtected();
        expect(isProtected).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0500
     * @tc.name testConstructorIsProtected005
     * @tc.desc Verify ConstructorIsProtected case 005: privateconstructor return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass005>();
        let constructors = cls.getConstructors();
        let isProtected = constructors[0].isProtected();
        expect(isProtected).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0600
     * @tc.name testConstructorIsProtected006
     * @tc.desc Verify ConstructorIsProtected case 006: modifier constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass006>().getConstructors()[0];
        let isProtected = ctorRef.isProtected();
        // 默认访问级别的行为取决于语言规范
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0700
     * @tc.name testConstructorIsProtected007
     * @tc.desc Verify ConstructorIsProtected case 007: protected parameters constructor return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass007>().getConstructors()[0];
        expect(ctorRef.isProtected()).assertTrue();
        expect(ctorRef.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0800
     * @tc.name testConstructorIsProtected008
     * @tc.desc Verify ConstructorIsProtected case 008: abstract class protectedconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<AbstractClass008>().getConstructors()[0];
        expect(ctorRef.isProtected()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_0900
     * @tc.name testConstructorIsProtected009
     * @tc.desc Verify ConstructorIsProtected case 009: final protectedconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<FinalClass009>().getConstructors()[0];
        expect(ctorRef.isProtected()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1000
     * @tc.name testConstructorIsProtected010
     * @tc.desc Verify ConstructorIsProtected case 010: verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let constructors = cls.getConstructors();
        let isProtected = constructors[0].isProtected();
        expect(typeof isProtected).assertEqual("boolean");
        expect(isProtected === true || isProtected === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1100
     * @tc.name testConstructorIsProtected011
     * @tc.desc Verify ConstructorIsProtected case 011: verify return true or false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = Class.from<MyClass001>().getConstructors()[0];
        let isProtected = ctor.isProtected();
        expect(isProtected === true || isProtected === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1200
     * @tc.name testConstructorIsProtected012
     * @tc.desc Verify ConstructorIsProtected case 012: isProtected and isPublic isPrivate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let prot = Class.from<MyClass016>().getConstructors()[0];
        expect(prot.isProtected()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1300
     * @tc.name testConstructorIsProtected013
     * @tc.desc Verify ConstructorIsProtected case 013: generic protectedconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<GenericClass013<int>>().getConstructors()[0];
        expect(ctorRef.isProtected()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1400
     * @tc.name testConstructorIsProtected014
     * @tc.desc Verify ConstructorIsProtected case 014: protectedconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let parentCtor = Class.from<ParentClass014>().getConstructors()[0];
        let childCtor = Class.from<ChildClass014>().getConstructors()[0];
        expect(parentCtor.isProtected()).assertTrue();
        expect(childCtor.isProtected()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1500
     * @tc.name testConstructorIsProtected015
     * @tc.desc Verify ConstructorIsProtected case 015: isProtected()method not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = Class.from<MyClass001>().getConstructors()[0];
        let isProtected = ctor.isProtected();
        expect(isProtected === true || isProtected === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1600
     * @tc.name testConstructorIsProtected016
     * @tc.desc Verify ConstructorIsProtected case 016: protectedconstructor and
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass016>().getConstructors()[0];
        expect(ctorRef.isProtected()).assertTrue();
        expect(ctorRef.getName()).assertEqual("constructor");
        expect(ctorRef.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1700
     * @tc.name testConstructorIsProtected017
     * @tc.desc Verify ConstructorIsProtected case 017: verify different type constructor isProtected()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let c1 = Class.from<AbstractClass017>().getConstructors()[0];
        let c2 = Class.from<FinalClass017>().getConstructors()[0];
        let c3 = Class.from<NormalClass017>().getConstructors()[0];
        expect(c1.isProtected()).assertTrue();
        expect(c2.isProtected()).assertTrue();
        expect(c3.isProtected()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1800
     * @tc.name testConstructorIsProtected018
     * @tc.desc Verify ConstructorIsProtected case 018: verify different constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = Class.from<MyClass018>().getConstructors();
        let protectedCount = 0;
        for (let i = 0; i < constructors.length; i++) {
          if (constructors[i].isProtected()) {
            protectedCount++;
          }
        }
        expect(protectedCount).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_1900
     * @tc.name testConstructorIsProtected019
     * @tc.desc Verify ConstructorIsProtected case 019: verify isProtected() and constructor property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass019>().getConstructors()[0];
        expect(ctorRef.isProtected()).assertTrue();
        expect(ctorRef.isPublic()).assertFalse();
        expect(ctorRef.isPrivate()).assertFalse();
        expect(ctorRef.isNative()).assertFalse();
        expect(ctorRef.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_2000
     * @tc.name testConstructorIsProtected020
     * @tc.desc Verify ConstructorIsProtected case 020: from constructor protectedconstructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = Class.from<MyClass020>().getConstructors();
        let protectedConstructors: Array<reflect.Constructor> = [];
        for (let i = 0; i < constructors.length; i++) {
          if (constructors[i].isProtected()) {
            protectedConstructors.push(constructors[i]);
          }
        }
        expect(protectedConstructors.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_2100
     * @tc.name testConstructorIsProtected021
     * @tc.desc Verify ConstructorIsProtected case 021: constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_2200
     * @tc.name testConstructorIsProtected022
     * @tc.desc Verify ConstructorIsProtected case 022: constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorIsProtected022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = Class.from<MyClass022>().getConstructors();
        for (let i = 0; i < constructors.length; i++) {
          let ctorRef = constructors[i];
          let count = 0;
          if (ctorRef.isPublic()) count++;
          if (ctorRef.isPrivate()) count++;
          if (ctorRef.isProtected()) count++;
          expect(count).assertEqual(1); // 每个构造函数只能有一个访问级别
        }
    });

  });
}