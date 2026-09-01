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

abstract class AbstractEmptyA {}

class NonAbstractEmptyA {}

abstract class AbstractNoParam {
  public constructor() {}
}

abstract class AbstractOneInt {
  public constructor(x: int) {}
}

abstract class AbstractOneString {
  public constructor(s: string) {}
}

abstract class AbstractOneBool {
  public constructor(b: boolean) {}
}

abstract class AbstractOneDouble {
  public constructor(d: double) {}
}

abstract class AbstractTwoParams {
  public constructor(x: int, s: string) {}
}

abstract class AbstractThreeParams {
  public constructor(x: int, s: string, b: boolean) {}
}

abstract class AbstractDefaultParam {
  public constructor(x: int = 42) {}
}

abstract class AbstractGeneric<T> {
  public constructor(val: T) {}
}

abstract class AbstractImplementsRunnable implements Runnable {
  run(): void {}
}

class BaseForAbstract {
  public constructor() {}
}

abstract class AbstractExtendsBase extends BaseForAbstract {
  public constructor() { super(); }
}

class NonAbstractNoParam {
  public constructor() {}
}

class NonAbstractOneInt {
  public constructor(x: int) {}
}

class NonAbstractDefaultParam {
  public constructor(x: int = 10) {}
}

export default function ConstructorIsAbstractTest2(): void {
  describe("ConstructorIsAbstractTest2", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_0100     
     * @tc.name testConstructorIsAbstract2Test001
     * @tc.desc Verify isAbstract returns true for abstract class empty constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractEmptyA>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_0200     
     * @tc.name testConstructorIsAbstract2Test002
     * @tc.desc Verify isAbstract returns false for non-abstract class empty constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NonAbstractEmptyA>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_0300     
     * @tc.name testConstructorIsAbstract2Test003
     * @tc.desc Verify isAbstract returns true for abstract class no-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractNoParam>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_0400     
     * @tc.name testConstructorIsAbstract2Test004
     * @tc.desc Verify isAbstract returns true for abstract class single int param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractOneInt>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_0500     
     * @tc.name testConstructorIsAbstract2Test005
     * @tc.desc Verify isAbstract returns true for abstract class single string param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractOneString>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_0600     
     * @tc.name testConstructorIsAbstract2Test006
     * @tc.desc Verify isAbstract returns true for abstract class single bool param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractOneBool>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_0700     
     * @tc.name testConstructorIsAbstract2Test007
     * @tc.desc Verify isAbstract returns true for abstract class single double param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractOneDouble>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_0800     
     * @tc.name testConstructorIsAbstract2Test008
     * @tc.desc Verify isAbstract returns true for abstract class two-param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractTwoParams>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_0900     
     * @tc.name testConstructorIsAbstract2Test009
     * @tc.desc Verify isAbstract returns true for abstract class three-param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractThreeParams>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_1000     
     * @tc.name testConstructorIsAbstract2Test010
     * @tc.desc Verify isAbstract returns true for abstract class default param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractDefaultParam>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_1100     
     * @tc.name testConstructorIsAbstract2Test011
     * @tc.desc Verify isAbstract returns false for non-abstract class no-arg constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NonAbstractNoParam>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_1200     
     * @tc.name testConstructorIsAbstract2Test012
     * @tc.desc Verify isAbstract returns false for non-abstract class single int param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NonAbstractOneInt>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_1300     
     * @tc.name testConstructorIsAbstract2Test013
     * @tc.desc Verify isAbstract returns false for non-abstract class default param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NonAbstractDefaultParam>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_1400     
     * @tc.name testConstructorIsAbstract2Test014
     * @tc.desc Verify isAbstract returns true for abstract class that implements interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractImplementsRunnable>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_1500     
     * @tc.name testConstructorIsAbstract2Test015
     * @tc.desc Verify isAbstract returns true for abstract class that extends base class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractExtendsBase>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_1600     
     * @tc.name testConstructorIsAbstract2Test016
     * @tc.desc Verify isAbstract returns false for base class constructor (non-abstract)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BaseForAbstract>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_1700     
     * @tc.name testConstructorIsAbstract2Test017
     * @tc.desc Verify isAbstract and isPublic are not mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractEmptyA>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_1800     
     * @tc.name testConstructorIsAbstract2Test018
     * @tc.desc Verify isAbstract call does not change getName result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractEmptyA>();
      let ctor = cls.getConstructors()[0];
      let beforeName = ctor.getName();
      expect(ctor.getOwner().isAbstract()).assertTrue();
      let afterName = ctor.getName();
      expect(afterName).assertEqual(beforeName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISABSTRACT_Ext_1900     
     * @tc.name testConstructorIsAbstract2Test019
     * @tc.desc Verify isAbstract returns true for abstract class, isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsAbstract2Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractEmptyA>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });
  });
}