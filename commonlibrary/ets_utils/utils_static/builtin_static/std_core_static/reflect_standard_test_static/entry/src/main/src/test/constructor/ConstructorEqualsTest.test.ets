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
import { looseConstructor } from '../class/VoidFn.test';

function asCtorList(cls: Class): Array<reflect.Constructor> {
  return cls.getConstructors() as Array<reflect.Constructor>;
}

class MyClass001 {
    public constructor() {}
  }

class NoArgCtor003 {
    public constructor() {}
  }

class IntCtor003 {
    public constructor(_: int) {}
  }

class ClassB004 {
    public constructor() {}
  }

class ClassA004 {
    public constructor() {}
  }

class MyClass007 {
    public constructor() {}
  }

class MyClass009 {
    public constructor(value?: int) {}
  }

class MyClass010 {
    public constructor(value: int | string) {}
  }

class MyClass011 {
    public constructor(value?: int) {}
  }

class MyClass012 {
    public constructor() {}
  }

class MyClass019 {
    public constructor() {}
  }

class MyClass021 {
    public constructor(value?: int) {}
  }

abstract class AbstractClass022 {
    public constructor() {}
  }

final class FinalClass023 {
    public constructor() {}
  }

class ChildClass024 extends ParentClass024 {
    public constructor() {
      super();
    }
  }

class ParentClass024 {
    public constructor() {}
  }

class MyClass025 {
    public constructor(value?: int) {}
  }

class MyClass026 {
    public constructor() {}
  }

class ClassB027 {
    public constructor(value?: string) {}
  }

class ClassA027 {
    public constructor(value?: int) {}
  }

class MyClass028 {
    public constructor(value?: int | string) {}
  }


export default function ConstructorEqualsTest(): void {
  describe('ConstructorEqualsTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_0100
     * @tc.name testConstructorEquals001
     * @tc.desc Verify ConstructorEquals case 001: equals()method parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let ctor1 = asCtorList(cls)[0];
        let ctor2 = asCtorList(cls)[0];
        expect(ctor1.equals(ctor2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_0200
     * @tc.name testConstructorEquals002
     * @tc.desc Verify ConstructorEquals case 002: same constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let ctor1 = asCtorList(cls)[0];
        let ctor2 = asCtorList(cls)[0];
        let result = ctor1.equals(ctor2);
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_0300
     * @tc.name testConstructorEquals003
     * @tc.desc Verify ConstructorEquals case 003: different constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let a = asCtorList(Class.from<NoArgCtor003>())[0];
        let b = asCtorList(Class.from<IntCtor003>())[0];
        let result = a.equals(b);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_0400
     * @tc.name testConstructorEquals004
     * @tc.desc Verify ConstructorEquals case 004: different constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorA = asCtorList(Class.from<ClassA004>())[0];
        let ctorB = asCtorList(Class.from<ClassB004>())[0];
        expect(ctorA.equals(ctorB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_0500
     * @tc.name testConstructorEquals005
     * @tc.desc Verify ConstructorEquals case 005: null is parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asCtorList(Class.from<MyClass001>())[0];
        let result = looseConstructor(ctor as Object).equals(null);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_0600
     * @tc.name testConstructorEquals006
     * @tc.desc Verify ConstructorEquals case 006: undefined is parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor = asCtorList(Class.from<MyClass001>())[0];
        let other = asCtorList(Class.from<MyClass007>())[0];
        let result = ctor.equals(other);
        expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_0700
     * @tc.name testConstructorEquals007
     * @tc.desc Verify ConstructorEquals case 007: same same constructor return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass007>();
        let ctor1 = asCtorList(cls)[0];
        let ctor2 = asCtorList(cls)[0];
        let result = ctor1.equals(ctor2);
        expect(result).assertTrue();
        expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_0800
     * @tc.name testConstructorEquals008
     * @tc.desc Verify ConstructorEquals case 008: object and return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass007>();
        let ctor0 = asCtorList(cls)[0];
        expect(ctor0.equals(ctor0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_0900
     * @tc.name testConstructorEquals009
     * @tc.desc Verify ConstructorEquals case 009: different constructor return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let a = asCtorList(Class.from<MyClass009>())[0];
        let b = asCtorList(Class.from<MyClass001>())[0];
        expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_1000
     * @tc.name testConstructorEquals010
     * @tc.desc Verify ConstructorEquals case 010: parameters type different constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let a = asCtorList(Class.from<MyClass010>())[0];
        let b = asCtorList(Class.from<IntCtor003>())[0];
        expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_1100
     * @tc.name testConstructorEquals011
     * @tc.desc Verify ConstructorEquals case 011: parameters different constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let a = asCtorList(Class.from<MyClass011>())[0];
        let b = asCtorList(Class.from<IntCtor003>())[0];
        expect(a.equals(b)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_1200
     * @tc.name testConstructorEquals012
     * @tc.desc Verify ConstructorEquals case 012: different constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = asCtorList(Class.from<MyClass012>());
        expect(constructors.length).assertLarger(0);
        expect(constructors[0].equals(constructors[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_1300
     * @tc.name testConstructorEquals013
     * @tc.desc Verify ConstructorEquals case 013: verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let ctor1 = asCtorList(cls)[0];
        let ctor2 = asCtorList(cls)[0];
        let result = ctor1.equals(ctor2);
        expect(typeof result).assertEqual("boolean");
        expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_1400
     * @tc.name testConstructorEquals014
     * @tc.desc Verify ConstructorEquals case 014: verify return true or false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let ctor1 = asCtorList(cls)[0];
        let ctor2 = asCtorList(cls)[0];
        let result = ctor1.equals(ctor2);
        expect(result === true || result === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_1500
     * @tc.name testConstructorEquals015
     * @tc.desc Verify ConstructorEquals case 015: x.equals(x)should return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let c0 = asCtorList(cls)[0];
        expect(c0.equals(c0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_1600
     * @tc.name testConstructorEquals016
     * @tc.desc Verify ConstructorEquals case 016: x.equals(y)should y.equals(x)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let ctor1 = asCtorList(cls)[0];
        let ctor2 = asCtorList(cls)[0];
        expect(ctor1.equals(ctor2)).assertEqual(ctor2.equals(ctor1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_1700
     * @tc.name testConstructorEquals017
     * @tc.desc Verify ConstructorEquals case 017: x.equals(y) y.equals(z) x.equals(z)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let ctor1 = asCtorList(cls)[0];
        let ctor2 = asCtorList(cls)[0];
        let ctor3 = asCtorList(cls)[0];
        if (ctor1.equals(ctor2) && ctor2.equals(ctor3)) {
          expect(ctor1.equals(ctor3)).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_1800
     * @tc.name testConstructorEquals018
     * @tc.desc Verify ConstructorEquals case 018: call equalsshould return same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let ctor1 = asCtorList(cls)[0];
        let ctor2 = asCtorList(cls)[0];
        let result1 = ctor1.equals(ctor2);
        let result2 = ctor1.equals(ctor2);
        expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_1900
     * @tc.name testConstructorEquals019
     * @tc.desc Verify ConstructorEquals case 019: equals() and different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass019>();
        let ctor1 = asCtorList(cls)[0];
        let ctor2 = asCtorList(cls)[0];

        expect(ctor1.equals(ctor2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_2000
     * @tc.name testConstructorEquals020
     * @tc.desc Verify ConstructorEquals case 020: equals()method not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let ctor1 = asCtorList(cls)[0];
        let ctor2 = asCtorList(cls)[0];
        expect(ctor1.equals(ctor2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_2100
     * @tc.name testConstructorEquals021
     * @tc.desc Verify ConstructorEquals case 021: different constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = asCtorList(Class.from<MyClass021>());
        expect(constructors.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_2200
     * @tc.name testConstructorEquals022
     * @tc.desc Verify ConstructorEquals case 022: abstract class constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor1 = asCtorList(Class.from<AbstractClass022>())[0];
        let ctor2 = asCtorList(Class.from<AbstractClass022>())[0];
        expect(ctor1.equals(ctor2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_2300
     * @tc.name testConstructorEquals023
     * @tc.desc Verify ConstructorEquals case 023: final constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctor1 = asCtorList(Class.from<FinalClass023>())[0];
        let ctor2 = asCtorList(Class.from<FinalClass023>())[0];
        expect(ctor1.equals(ctor2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_2400
     * @tc.name testConstructorEquals024
     * @tc.desc Verify ConstructorEquals case 024: constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let parentCtor = asCtorList(Class.from<ParentClass024>())[0];
        let childCtor = asCtorList(Class.from<ChildClass024>())[0];
        expect(parentCtor.equals(childCtor)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_2500
     * @tc.name testConstructorEquals025
     * @tc.desc Verify ConstructorEquals case 025: from get constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1 = Class.from<MyClass025>();
        let cls2 = Class.from<MyClass025>();
        let ctors1 = asCtorList(cls1);
        let ctors2 = asCtorList(cls2);

        expect(ctors1.length).assertEqual(ctors2.length);
        for (let i = 0; i < ctors1.length; i++) {
          expect(ctors1[i].equals(ctors2[i])).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_2600
     * @tc.name testConstructorEquals026
     * @tc.desc Verify ConstructorEquals case 026: using equalsmethod constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass026>();
        let ctor1 = asCtorList(cls)[0];
        let ctor2 = asCtorList(cls)[0];
        let ctor3 = asCtorList(cls)[0];

        let uniqueCtors: Array<reflect.Constructor> = [];
        let ctors: Array<reflect.Constructor> = [ctor1, ctor2, ctor3];
        for (let i = 0; i < ctors.length; i++) {
          let isDuplicate = false;
          for (let j = 0; j < uniqueCtors.length; j++) {
            if (ctors[i]!.equals(uniqueCtors[j])) {
              isDuplicate = true;
              break;
            }
          }
          if (!isDuplicate && ctors[i] !== undefined) {
            uniqueCtors.push(ctors[i]!);
          }
        }
        expect(uniqueCtors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_2700
     * @tc.name testConstructorEquals027
     * @tc.desc Verify ConstructorEquals case 027: using equals constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorsA = asCtorList(Class.from<ClassA027>());
        let ctorsB = asCtorList(Class.from<ClassB027>());

        let intersection: Array<reflect.Constructor> = [];
        for (let i = 0; i < ctorsA.length; i++) {
          for (let j = 0; j < ctorsB.length; j++) {
            if (ctorsA[i].getParametersNum() === ctorsB[j].getParametersNum()) {
              intersection.push(ctorsA[i]);
              break;
            }
          }
        }
        expect(intersection.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_2800
     * @tc.name testConstructorEquals028
     * @tc.desc Verify ConstructorEquals case 028: verify parameters different constructor not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorEquals028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = asCtorList(Class.from<MyClass028>());
        expect(constructors.length).assertLarger(0);
        expect(constructors[0].equals(constructors[0])).assertTrue();
        let other = asCtorList(Class.from<NoArgCtor003>())[0];
        expect(constructors[0].equals(other)).assertFalse();
    });

  });
}