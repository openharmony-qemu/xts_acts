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
import Utils from "../Util.test";

class AM_PublicCtor {
  public constructor() {}
}

class AM_PublicOneParam {
  public constructor(x: int) {}
}

class AM_PublicManyParam {
  public constructor(a: int, b: string, c: boolean, d: double) {}
}

class AM_PublicOptParam {
  public constructor(x?: int) {}
}

class AM_PublicDefaultParam {
  public constructor(x: int = 10) {}
}

abstract class AM_AbstractCtor {
  public constructor() {}
  public abstract foo(): void;
}

class AM_ConcreteExtendsAbstract extends AM_AbstractCtor {
  public constructor() {
    super();
  }
  public foo(): void {}
}

class AM_PrivateCtor {
  private constructor() {}
}

class AM_ProtectedCtor {
  protected constructor() {}
}

class AM_PrivateOneParam {
  private constructor(x: int) {}
}

class AM_ProtectedOneParam {
  protected constructor(x: string) {}
}

export default function ConstructorAccessModifierCombo2Test2(): void {
  describe("ConstructorAccessModifierCombo2Test2", (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 100);
      });
    });
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_0100     
     * @tc.name testConstructorAMCombo2Test001
     * @tc.desc Verify public constructor: isNative=false isPublic=true isPrivate=false isProtected=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AM_PublicCtor>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      let ctor = ctors[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_0200     
     * @tc.name testConstructorAMCombo2Test002
     * @tc.desc Verify public one-param constructor: isNative=false isPublic=true isPrivate=false isProtected=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AM_PublicOneParam>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      let ctor = ctors[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_0300     
     * @tc.name testConstructorAMCombo2Test003
     * @tc.desc Verify public many-param constructor: isNative=false isPublic=true isPrivate=false isProtected=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AM_PublicManyParam>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      let ctor = ctors[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_0400     
     * @tc.name testConstructorAMCombo2Test004
     * @tc.desc Verify public optional param constructor: isPublic=true isPrivate=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AM_PublicOptParam>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      let ctor = ctors[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_0500     
     * @tc.name testConstructorAMCombo2Test005
     * @tc.desc Verify public default param constructor: isPublic=true isProtected=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AM_PublicDefaultParam>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      let ctor = ctors[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_0600     
     * @tc.name testConstructorAMCombo2Test006
     * @tc.desc Verify native constructor (String): isNative=true isPublic=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<String>();
      let ctors = cls.getConstructors();
      let found: boolean = false;
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].isNative()) {
          expect(ctors[i].isPublic()).assertTrue();
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_0700     
     * @tc.name testConstructorAMCombo2Test007
     * @tc.desc Verify abstract class public constructor: isNative=false isPublic=true isPrivate=false isProtected=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AM_AbstractCtor>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      let ctor = ctors[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_0800     
     * @tc.name testConstructorAMCombo2Test008
     * @tc.desc Verify abstract class's Class.isAbstract() is true and its constructor is public
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AM_AbstractCtor>();
      let isAbstract = cls.isAbstract();
      expect(isAbstract).assertTrue();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      let ctor = ctors[0];
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_0900     
     * @tc.name testConstructorAMCombo2Test009
     * @tc.desc Verify concrete class extending abstract: constructor is public, not native/private/protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AM_ConcreteExtendsAbstract>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      let ctor = ctors[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_1000     
     * @tc.name testConstructorAMCombo2Test010
     * @tc.desc Verify private no-arg constructor (AM_PrivateCtor) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<AM_PrivateCtor>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_1100     
     * @tc.name testConstructorAMCombo2Test011
     * @tc.desc Verify private one-param constructor (AM_PrivateOneParam) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<AM_PrivateOneParam>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_1200     
     * @tc.name testConstructorAMCombo2Test012
     * @tc.desc Verify protected no-arg constructor (AM_ProtectedCtor) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<AM_ProtectedCtor>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isProtected()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_AMCOMBO_Ext_1300     
     * @tc.name testConstructorAMCombo2Test013
     * @tc.desc Verify protected one-param constructor (AM_ProtectedOneParam) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorAMCombo2Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<AM_ProtectedOneParam>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isProtected()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });
  });
}
