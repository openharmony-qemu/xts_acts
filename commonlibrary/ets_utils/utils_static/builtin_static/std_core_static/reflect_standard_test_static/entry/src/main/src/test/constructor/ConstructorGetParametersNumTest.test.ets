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
  public constructor(name: string, age: int) {}
}

class MyClass003 {
  public constructor(name: string, age: int) {}
}

class MyClass004 {
  public constructor() {}
}

class MyClass005 {
  public constructor(value: int) {}
}

class MyClass006 {
  public constructor(a: int, b: string, c: boolean, d: float) {}
}

class MyClass007 {
  public constructor(required: int, optional?: string) {}
}

class MyClass008 {
  public constructor(map: Map<string, int>, arr: Array<boolean>) {}
}

class MyClass009 {
  public constructor(obj: MyClass009) {}
}

class MyClass012 {
  public constructor() {}
}

class MyClass013 {
  public constructor(
    p1: int, p2: int, p3: int, p4: int, p5: int,
    p6: int, p7: int, p8: int, p9: int, p10: int
  ) {}
}

class MyClass014 {
  public constructor(
    b: byte, s: short, i: int, l: long,
    f: float, d: double, n: number, bool: boolean, ch: char
  ) {}
}

class MyClass015 {
  public constructor(value?: int | string, flag?: boolean) {}
}

class MyClass017 {
  public constructor(p?: int | string | boolean) {}
}

final class FinalClass018 {
  public constructor(x: boolean, y: float, z: double) {}
}

abstract class AbstractClass018 {
  public constructor(a: string, b: int) {}
}

class ChildClass019 extends ParentClass019 {
  public constructor(name: string, age: int) {
    super(name);
  }
}

class ParentClass019 {
  public constructor(name: string) {}
}

class MyClass020 {
  public constructor(a?: int, b?: string, c?: boolean) {}
}

class MyClass021 {
  public constructor(a: int, b: string, c: boolean) {}
}

class MyClass022 {
  public constructor(value?: int | string) {}
}

export default function ConstructorGetParametersNumTest(): void {
  describe('ConstructorGetParametersNumTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_0100
     * @tc.name testConstructorGetParametersNum001
     * @tc.desc Verify ConstructorGetParametersNum case 001: Class.from<MyClass001>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let constructors = cls.getConstructors();
      let num = constructors[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_0200
     * @tc.name testConstructorGetParametersNum002
     * @tc.desc Verify ConstructorGetParametersNum case 002: Class.from<MyClass003>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let constructors = cls.getConstructors();
      let num = constructors[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_0300
     * @tc.name testConstructorGetParametersNum003
     * @tc.desc Verify ConstructorGetParametersNum case 003: Class.from<MyClass004>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let constructors = cls.getConstructors();
      let num = constructors[0].getParametersNum();
      expect(num).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_0400
     * @tc.name testConstructorGetParametersNum004
     * @tc.desc Verify ConstructorGetParametersNum case 004: Class.from<MyClass005>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let constructors = cls.getConstructors();
      let num = constructors[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_0500
     * @tc.name testConstructorGetParametersNum005
     * @tc.desc Verify ConstructorGetParametersNum case 005: Class.from<MyClass006>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      let constructors = cls.getConstructors();
      let num = constructors[0].getParametersNum();
      expect(num).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_0600
     * @tc.name testConstructorGetParametersNum006
     * @tc.desc Verify ConstructorGetParametersNum case 006: Class.from<MyClass007>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let constructors = cls.getConstructors();
      let num = constructors[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_0700
     * @tc.name testConstructorGetParametersNum007
     * @tc.desc Verify ConstructorGetParametersNum case 007: Class.from<MyClass008>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let constructors = cls.getConstructors();
      let num = constructors[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_0800
     * @tc.name testConstructorGetParametersNum008
     * @tc.desc Verify ConstructorGetParametersNum case 008: Class.from<MyClass009>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let constructors = cls.getConstructors();
      let num = constructors[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_0900
     * @tc.name testConstructorGetParametersNum009
     * @tc.desc Verify ConstructorGetParametersNum case 009: Class.from<MyClass006>(), parameter type verified, parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass006>().getConstructors()[0];
      let num = ctor.getParametersNum();
      let types = ctor.getParameterTypes();
      expect(num).assertEqual(4);
      expect(types.length).assertEqual(num);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_1000
     * @tc.name testConstructorGetParametersNum010
     * @tc.desc Verify ConstructorGetParametersNum case 010: Class.from<MyClass012>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroNum = Class.from<MyClass012>().getConstructors()[0].getParametersNum();
      let nonZeroNum = Class.from<FinalClass018>().getConstructors()[0].getParametersNum();
      expect(zeroNum).assertEqual(0);
      expect(nonZeroNum).assertEqual(3);
      expect(nonZeroNum > zeroNum).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_1100
     * @tc.name testConstructorGetParametersNum011
     * @tc.desc Verify ConstructorGetParametersNum case 011: Class.from<MyClass012>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<MyClass012>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_1200
     * @tc.name testConstructorGetParametersNum012
     * @tc.desc Verify ConstructorGetParametersNum case 012: Class.from<MyClass013>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let constructors = cls.getConstructors();
      let num = constructors[0].getParametersNum();
      expect(num).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_1300
     * @tc.name testConstructorGetParametersNum013
     * @tc.desc Verify ConstructorGetParametersNum case 013: Class.from<MyClass014>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let constructors = cls.getConstructors();
      let num = constructors[0].getParametersNum();
      expect(num).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_1400
     * @tc.name testConstructorGetParametersNum014
     * @tc.desc Verify ConstructorGetParametersNum case 014: Class.from<MyClass015>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass015>().getConstructors();
      expect(constructors.length).assertEqual(1);
      expect(constructors[0].getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_1500
     * @tc.name testConstructorGetParametersNum015
     * @tc.desc Verify ConstructorGetParametersNum case 015: Class.from<ChildClass019>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ChildClass019>().getConstructors()[0];
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_1600
     * @tc.name testConstructorGetParametersNum016
     * @tc.desc Verify ConstructorGetParametersNum case 016: Class.from<MyClass017>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let constructors = cls.getConstructors();
      expect(constructors.length).assertEqual(1);
      expect(constructors[0].getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_1700
     * @tc.name testConstructorGetParametersNum017
     * @tc.desc Verify ConstructorGetParametersNum case 017: Class.from<AbstractClass018>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = Class.from<AbstractClass018>().getConstructors()[0];
      let c2 = Class.from<FinalClass018>().getConstructors()[0];
      expect(c1.getParametersNum()).assertEqual(2);
      expect(c2.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_1800
     * @tc.name testConstructorGetParametersNum018
     * @tc.desc Verify ConstructorGetParametersNum case 018: Class.from<ParentClass019>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCtor = Class.from<ParentClass019>().getConstructors()[0];
      let childCtor = Class.from<ChildClass019>().getConstructors()[0];
      expect(parentCtor.getParametersNum()).assertEqual(1);
      expect(childCtor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_1900
     * @tc.name testConstructorGetParametersNum019
     * @tc.desc Verify ConstructorGetParametersNum case 019: Class.from<MyClass020>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass020>().getConstructors();
      expect(constructors.length).assertEqual(1);
      expect(constructors[0].getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_2000
     * @tc.name testConstructorGetParametersNum020
     * @tc.desc Verify ConstructorGetParametersNum case 020: Class.from<MyClass021>(), parameter type verified, parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass021>().getConstructors()[0];
      let num = ctorRef.getParametersNum();
      let paramTypes = ctorRef.getParameterTypes();
      expect(num).assertEqual(paramTypes.length);
      expect(num).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_2100
     * @tc.name testConstructorGetParametersNum021
     * @tc.desc Verify ConstructorGetParametersNum case 021: Class.from<MyClass022>(), parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParametersNum021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let constructors = cls.getConstructors();
      expect(constructors.length).assertEqual(1);
      expect(constructors[0].getParametersNum()).assertEqual(1);
    });

  });
}

