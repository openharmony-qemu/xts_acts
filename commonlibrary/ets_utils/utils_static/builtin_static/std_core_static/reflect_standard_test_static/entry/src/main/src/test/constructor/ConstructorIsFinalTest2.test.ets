'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from "../../../../hypium/index";
import Utils, { Runnable } from "../Util.test";

final class FinalEmptyA {}
final class FinalEmptyB {}

class NonFinalEmptyA {}
class NonFinalEmptyB {}

final class FinalNoParam {
  public constructor() {}
}

final class FinalOneInt {
  public constructor(x: int) {}
}

final class FinalOneString {
  public constructor(s: string) {}
}

final class FinalOneBool {
  public constructor(b: boolean) {}
}

final class FinalOneDouble {
  public constructor(d: double) {}
}

final class FinalTwoParams {
  public constructor(x: int, s: string) {}
}

final class FinalThreeParams {
  public constructor(x: int, s: string, b: boolean) {}
}

final class FinalDefaultParam {
  public constructor(x: int = 42) {}
}

final class FinalGeneric<T> {
  public constructor(val: T) {}
}

final class FinalImplementsRunnable implements Runnable {
  run(): void {}
}

final class FinalWithField {
  value: int = 0;
  public constructor(v: int) {
    this.value = v;
  }
}

class BaseForFinal {
  public constructor() {}
}

final class FinalExtendsBase extends BaseForFinal {
  public constructor() { super(); }
}

class NonFinalNoParam {
  public constructor() {}
}

class NonFinalOneInt {
  public constructor(x: int) {}
}

class NonFinalDefaultParam {
  public constructor(x: int = 10) {}
}

export default function ConstructorIsFinalTest2(): void {
  describe("ConstructorIsFinalTest2", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_0100     
     * @tc.name testConstructorIsFinal2Test001
     * @tc.desc Verify isFinal returns true for final class empty constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalEmptyA>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_0200     
     * @tc.name testConstructorIsFinal2Test002
     * @tc.desc Verify isFinal returns false for non-final class empty constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NonFinalEmptyA>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_0300     
     * @tc.name testConstructorIsFinal2Test003
     * @tc.desc Verify isFinal returns true for final class no-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalNoParam>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_0400     
     * @tc.name testConstructorIsFinal2Test004
     * @tc.desc Verify isFinal returns true for final class single int param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalOneInt>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_0500     
     * @tc.name testConstructorIsFinal2Test005
     * @tc.desc Verify isFinal returns true for final class single string param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalOneString>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_0600     
     * @tc.name testConstructorIsFinal2Test006
     * @tc.desc Verify isFinal returns true for final class single bool param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalOneBool>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_0700     
     * @tc.name testConstructorIsFinal2Test007
     * @tc.desc Verify isFinal returns true for final class single double param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalOneDouble>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_0800     
     * @tc.name testConstructorIsFinal2Test008
     * @tc.desc Verify isFinal returns true for final class two-param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalTwoParams>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_0900     
     * @tc.name testConstructorIsFinal2Test009
     * @tc.desc Verify isFinal returns true for final class three-param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalThreeParams>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_1000     
     * @tc.name testConstructorIsFinal2Test010
     * @tc.desc Verify isFinal returns true for final class default param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalDefaultParam>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_1100     
     * @tc.name testConstructorIsFinal2Test011
     * @tc.desc Verify isFinal returns false for non-final class no-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NonFinalNoParam>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_1200     
     * @tc.name testConstructorIsFinal2Test012
     * @tc.desc Verify isFinal returns false for non-final class single int param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NonFinalOneInt>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_1300     
     * @tc.name testConstructorIsFinal2Test013
     * @tc.desc Verify isFinal returns false for non-final class default param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NonFinalDefaultParam>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_1400     
     * @tc.name testConstructorIsFinal2Test014
     * @tc.desc Verify isFinal returns true for final class that implements interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalImplementsRunnable>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_1500     
     * @tc.name testConstructorIsFinal2Test015
     * @tc.desc Verify isFinal returns true for final class that extends base class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalExtendsBase>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_1600     
     * @tc.name testConstructorIsFinal2Test016
     * @tc.desc Verify isFinal returns false for base class constructor (non-final)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BaseForFinal>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_1700     
     * @tc.name testConstructorIsFinal2Test017
     * @tc.desc Verify isFinal and isPublic are not mutually exclusive (final class can be public)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalEmptyA>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_1800     
     * @tc.name testConstructorIsFinal2Test018
     * @tc.desc Verify two different final class constructors both return true for isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<FinalEmptyA>();
      let clsB = Class.from<FinalEmptyB>();
      expect(clsA.getConstructors()[0].getOwner().isFinal()).assertTrue();
      expect(clsB.getConstructors()[0].getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_1900     
     * @tc.name testConstructorIsFinal2Test019
     * @tc.desc Verify two different non-final class constructors both return false for isFinal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<NonFinalEmptyA>();
      let clsB = Class.from<NonFinalEmptyB>();
      expect(clsA.getConstructors()[0].getOwner().isFinal()).assertFalse();
      expect(clsB.getConstructors()[0].getOwner().isFinal()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_2000     
     * @tc.name testConstructorIsFinal2Test020
     * @tc.desc Verify isFinal call does not change getName result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalEmptyA>();
      let ctor = cls.getConstructors()[0];
      let beforeName = ctor.getName();
      ctor.getOwner().isFinal();
      let afterName = ctor.getName();
      expect(afterName).assertEqual(beforeName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_2100     
     * @tc.name testConstructorIsFinal2Test021
     * @tc.desc Verify isFinal returns true for final class with field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalWithField>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_2200     
     * @tc.name testConstructorIsFinal2Test022
     * @tc.desc Verify final class implicit constructor is not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalEmptyA>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISFINAL_Ext_2300     
     * @tc.name testConstructorIsFinal2Test023
     * @tc.desc Verify isFinal returns true for final class createInstance success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsFinal2Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalWithField>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isFinal()).assertTrue();
      let inst = ctor.createInstance([42]) as FinalWithField;
      expect(inst.value).assertEqual(42);
    });
  });
}