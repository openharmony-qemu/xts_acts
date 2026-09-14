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
import Utils from "../Util.test";
import {StringFieldWithMethod,IP2_110_PubDefBool,ParamCountCls,TcPub19,Ctor_ConstructorParam,EmptyCls,GenericsMultiResolved_Ext,OT_Outer_OT_InnerGeneric,EqOverloadCls,Eq04_TripleOL,IP2_128_5CIdx0,IP_Ext_DerivGen,TcTwoPubA,PrivFixedArrParam,TcPriv5,PrivateCtorWithDefault,IsPrivateWithFactory,IsPrivateThenPublicCtor,GO2_Ext_AbstractGeneric,GetParamTypeABC,Ext4_FixedArrOptParam,OT_DerivedWithParam,IsPublicCtorRefParam,PubDouble,GN3_Mix4ISBD,IsPublicGenericTwo,IsPublicImplIfc,ObjectParamCtor_Ext,IsPublicThenPrivateCtor,IsPublicGeneric,IsPublicGenericParam,IsPublicGenericBound,IsPrivateGenericParam,IP_Ext_GenCls,IP2_121_GenTUPub,IP2_122_GenTCtor,IP3_181_PubDblInt,IP3_183_PubClsParam,IP3_191_ArrIdx4,IP3_198_PubMap,IP3_200_PubDblFixedArr,IP3_209_7Overload,IP3_211_PubObjArr,IP3_214_PubCtorArr,IP3_216_All6Idx2,IP3_217_PubClsArr,TcPubPrivA,} from "../Util.test";

final class IsPrivateFinal {
  private constructor() {}
  public static create(): IsPrivateFinal { return new IsPrivateFinal(); }
}
export default function ConstructorIsPublicTest2Part1(): void {
  describe("ConstructorIsPublicTest2Part1", (): void => {
    beforeAll(() => {
    });
    beforeEach((): void=> {});
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 50)
      })
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_0100     
     * @tc.name testConstructorIsPublic2P1Test001
     * @tc.desc Verify isPublic() returns true for explicit public no-arg constructor of two-overload class created from instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(new EqOverloadCls());
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_0200     
     * @tc.name testConstructorIsPublic2P1Test002
     * @tc.desc Verify isPublic() returns true and isPrivate() false for no-arg optional int parameter public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(new TcTwoPubA());
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_0300     
     * @tc.name testConstructorIsPublic2P1Test003
     * @tc.desc Verify isPublic() returns true for public constructor with custom class type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IsPublicCtorRefParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_0400     
     * @tc.name testConstructorIsPublic2P1Test004
     * @tc.desc Verify isPublic() true and isPrivate() false for bounded generic public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IsPublicGenericBound<string>>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_0500     
     * @tc.name testConstructorIsPublic2P1Test005
     * @tc.desc Verify isPublic() true and isProtected() false for Class-bounded generic public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP_Ext_GenCls<Class>>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_0600     
     * @tc.name testConstructorIsPublic2P1Test006
     * @tc.desc Verify isPublic() true and isNative() false for generic param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IsPublicGenericParam<string>>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_0700     
     * @tc.name testConstructorIsPublic2P1Test007
     * @tc.desc Verify isPublic() true and isPrivate() false for Object parameter public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ObjectParamCtor_Ext>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_0800     
     * @tc.name testConstructorIsPublic2P1Test008
     * @tc.desc Verify isPublic() returns true and parameter count is 1 for inner generic public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_Outer_OT_InnerGeneric<int>>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_0900     
     * @tc.name testConstructorIsPublic2P1Test009
     * @tc.desc Verify isPublic() true and isPrivate() false for derived generic class public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP_Ext_DerivGen>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_1000     
     * @tc.name testConstructorIsPublic2P1Test010
     * @tc.desc Verify isPublic() returns true and parameter count is 1 for derived class constructor calling super
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_DerivedWithParam>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isPublic()).assertTrue();
      expect(ctors[0].getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_1100     
     * @tc.name testConstructorIsPublic2P1Test011
     * @tc.desc Verify isPublic() true and isProtected() false for public constructor in mixed visibility overload class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IsPublicThenPrivateCtor>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_1200     
     * @tc.name testConstructorIsPublic2P1Test012
     * @tc.desc Verify isPublic() returns true and parameter count is 1 for public constructor created from instance of mixed visibility class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(new IsPrivateThenPublicCtor(5));
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_1300     
     * @tc.name testConstructorIsPublic2P1Test013
     * @tc.desc Verify getConstructors() empty for private generic param constructor while public class exposes one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let privCls = Class.from<IsPrivateGenericParam<Object>>();
      let privCtors = privCls.getConstructors();
      expect(privCtors.length).assertEqual(0);
      let pubCls = Class.from<TcTwoPubA>();
      let pubCtors = pubCls.getConstructors();
      expect(pubCtors.length).assertEqual(1);
      expect(pubCtors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_1400     
     * @tc.name testConstructorIsPublic2P1Test014
     * @tc.desc Verify first overloaded public constructor isPublic returns true (private constructor not exposed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IsPublicThenPrivateCtor>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_1500     
     * @tc.name testConstructorIsPublic2P1Test015
     * @tc.desc Verify first overloaded constructor isPublic returns true (private constructor not exposed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IsPrivateThenPublicCtor>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_1600     
     * @tc.name testConstructorIsPublic2P1Test016
     * @tc.desc Verify isPublic() returns true for two-parameter public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParamCountCls>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_1700     
     * @tc.name testConstructorIsPublic2P1Test017
     * @tc.desc Verify isPublic() returns same true value on consecutive calls for public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO2_Ext_AbstractGeneric<int>>();
      let ctor = cls.getConstructors()[0];
      let firstResult = ctor.isPublic();
      let secondResult = ctor.isPublic();
      expect(firstResult).assertTrue();
      expect(secondResult).assertTrue();
      let same: boolean = firstResult===secondResult;
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_1800     
     * @tc.name testConstructorIsPublic2P1Test018
     * @tc.desc Verify getConstructors() empty for private default int constructor while public class exposes one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let privCls = Class.from<PrivateCtorWithDefault>();
      let privCtors = privCls.getConstructors();
      expect(privCtors.length).assertEqual(0);
      let pubCls = Class.from<GO2_Ext_AbstractGeneric<int>>();
      let pubCtors = pubCls.getConstructors();
      expect(pubCtors.length).assertEqual(1);
      expect(pubCtors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_1900     
     * @tc.name testConstructorIsPublic2P1Test019
     * @tc.desc Verify getConstructors() empty for factory private constructor while three-param public class exposes one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let privCls = Class.from<IsPrivateWithFactory>();
      let privCtors = privCls.getConstructors();
      expect(privCtors.length).assertEqual(0);
      let pubCls = Class.from<GetParamTypeABC>();
      let pubCtors = pubCls.getConstructors();
      expect(pubCtors.length).assertEqual(1);
      expect(pubCtors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_2000     
     * @tc.name testConstructorIsPublic2P1Test020
     * @tc.desc Verify isPublic() result unchanged after calling getName getOwner getParameterTypes getParametersNum getReturnType and isNative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO2_Ext_AbstractGeneric<int>>();
      let ctor = cls.getConstructors()[0];
      let firstResult = ctor.isPublic();
      ctor.getName();
      ctor.getOwner();
      ctor.getParameterTypes();
      ctor.getParametersNum();
      ctor.getReturnType();
      ctor.isNative();
      let secondResult = ctor.isPublic();
      expect(firstResult).assertTrue();
      let same: boolean = firstResult === secondResult;
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_2100     
     * @tc.name testConstructorIsPublic2P1Test021
     * @tc.desc Verify getConstructors() empty for private double constructor while four-param public class exposes one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let privCls = Class.from<TcPriv5>();
      let privCtors = privCls.getConstructors();
      expect(privCtors.length).assertEqual(0);
      let pubCls = Class.from<GN3_Mix4ISBD>();
      let pubCtors = pubCls.getConstructors();
      expect(pubCtors.length).assertEqual(1);
      expect(pubCtors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_2200     
     * @tc.name testConstructorIsPublic2P1Test022
     * @tc.desc Verify getConstructors() empty for private FixedArray param constructor while Object param public class exposes one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let privCls = Class.from<PrivFixedArrParam>();
      let privCtors = privCls.getConstructors();
      expect(privCtors.length).assertEqual(0);
      let pubCls = Class.from<ObjectParamCtor_Ext>();
      let pubCtors = pubCls.getConstructors();
      expect(pubCtors.length).assertEqual(1);
      expect(pubCtors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_2300     
     * @tc.name testConstructorIsPublic2P1Test023
     * @tc.desc Verify getConstructors() empty for final class private constructor while optional param public class exposes one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let privCls = Class.from<IsPrivateFinal>();
      let privCtors = privCls.getConstructors();
      expect(privCtors.length).assertEqual(0);
      let pubCls = Class.from<Ext4_FixedArrOptParam>();
      let pubCtors = pubCls.getConstructors();
      expect(pubCtors.length).assertEqual(1);
      expect(pubCtors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_2400     
     * @tc.name testConstructorIsPublic2P1Test024
     * @tc.desc Verify isPublic=true, isNative=false, isPrivate=false, isProtected=false for public constructor (Comb0100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO2_Ext_AbstractGeneric<int>>();
      let ctors = cls.getConstructors();
      expect(ctors[0].isNative()).assertFalse();
      expect(ctors[0].isPublic()).assertTrue();
      expect(ctors[0].isPrivate()).assertFalse();
      expect(ctors[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_2500     
     * @tc.name testConstructorIsPublic2P1Test025
     * @tc.desc Verify isPublic() returns true for public constructor with boolean parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP2_110_PubDefBool>();
      let ctors = cls.getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
      expect(ctors[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_2600     
     * @tc.name testConstructorIsPublic2P1Test026
     * @tc.desc Verify isPublic() returns true for public constructor with double parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PubDouble>();
      let ctors = cls.getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
      expect(ctors[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_2700     
     * @tc.name testConstructorIsPublic2P1Test027
     * @tc.desc Verify interface implement class public constructor isPublic=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IsPublicImplIfc>();
      let ctors = cls.getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
      expect(ctors[0].isPrivate()).assertFalse();
      expect(ctors[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_2800     
     * @tc.name testConstructorIsPublic2P1Test028
     * @tc.desc Verify isPublic() returns true for built-in int type public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int>();
      let ctors = cls.getConstructors();
      let found: boolean = false;
      for (let i: int = 0; i < ctors.length; i++) {
        if (ctors[i].isPublic()) {
          found = true;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_2900     
     * @tc.name testConstructorIsPublic2P1Test029
     * @tc.desc Verify isPublic() returns true for built-in boolean type public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<boolean>();
      let ctors = cls.getConstructors();
      let found: boolean = false;
      for (let i: int = 0; i < ctors.length; i++) {
        if (ctors[i].isPublic()) {
          found = true;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_3000     
     * @tc.name testConstructorIsPublic2P1Test030
     * @tc.desc Verify isPublic() true and isNative() false for int array parameter public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcPub19>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_3100     
     * @tc.name testConstructorIsPublic2P1Test031
     * @tc.desc Verify isPublic() returns true and parameter count is 4 for mixed four-param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN3_Mix4ISBD>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getParametersNum()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_3200     
     * @tc.name testConstructorIsPublic2P1Test032
     * @tc.desc Verify isPublic() returns true for public constructor created with empty string parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(new StringFieldWithMethod(''));
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_3300     
     * @tc.name testConstructorIsPublic2P1Test033
     * @tc.desc Verify isPublic() returns true for public constructor derived from generic base class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP_Ext_DerivGen>();
      let ctors = cls.getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_3400     
     * @tc.name testConstructorIsPublic2P1Test034
     * @tc.desc Verify isPublic() returns true and parameter count is 1 for public constructor created with binary literal int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(new TcTwoPubA(0b1010));
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_3500     
     * @tc.name testConstructorIsPublic2P1Test035
     * @tc.desc Verify isPublic() returns true and parameter count is 1 for public constructor created with scientific notation double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(new PubDouble(1.5e3));
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_3600     
     * @tc.name testConstructorIsPublic2P1Test036
     * @tc.desc Verify isPublic() returns true and isPrivate() false for public constructor created with negative zero double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(new PubDouble(-0.0));
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_3700     
     * @tc.name testConstructorIsPublic2P1Test037
     * @tc.desc Verify isPublic() returns true and parameter count is 1 for public constructor created with hello string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(new StringFieldWithMethod("hello"));
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_3800     
     * @tc.name testConstructorIsPublic2P1Test038
     * @tc.desc Verify isPublic() returns true and parameter count is 2 for two-param public constructor created from instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(new ParamCountCls(1, 'a'));
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_3900     
     * @tc.name testConstructorIsPublic2P1Test039
     * @tc.desc Verify isPublic() returns true for first three overloaded constructors of five-overload class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP2_128_5CIdx0>();
      let ctors = cls.getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
      expect(ctors[1].isPublic()).assertTrue();
      expect(ctors[2].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_4000     
     * @tc.name testConstructorIsPublic2P1Test040
     * @tc.desc Verify isPublic() returns true and isNative() false for public constructor created with negative one int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(new TcTwoPubA(-1));
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_4100     
     * @tc.name testConstructorIsPublic2P1Test041
     * @tc.desc Verify isPublic() returns true and isNative() false for public constructor created with null literal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(new StringFieldWithMethod("null"));
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_4200     
     * @tc.name testConstructorIsPublic2P1Test042
     * @tc.desc Verify isPublic() returns true and isNative() false for public constructor created with zero double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorIsPublic2P1Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(new PubDouble(0.0));
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_4300
     * @tc.name testConstructorIsPublic2P1Test043
     * @tc.desc Verify isPublic() returns true at every index for three explicit overload public constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Eq04_TripleOL>();
      let ctors = cls.getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
      expect(ctors[1].isPublic()).assertTrue();
      expect(ctors[2].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_4400
     * @tc.name testConstructorIsPublic2P1Test044
     * @tc.desc Verify isPublic() call does not alter the getName() return value for public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GO2_Ext_AbstractGeneric<int>>().getConstructors()[0];
      ctor.isPublic();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_4500
     * @tc.name testConstructorIsPublic2P1Test045
     * @tc.desc Verify isPublic() call does not alter the getParametersNum() return value for public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GetParamTypeABC>().getConstructors()[0];
      ctor.isPublic();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_4600
     * @tc.name testConstructorIsPublic2P1Test046
     * @tc.desc Verify isPublic() call does not alter the getParameterType(0) return value for public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GetParamTypeABC>().getConstructors()[0];
      ctor.isPublic();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getParameterType(0)!.getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_4700
     * @tc.name testConstructorIsPublic2P1Test047
     * @tc.desc Verify isPublic() result unchanged after getName and getParametersNum interleaved between two isPublic() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GO2_Ext_AbstractGeneric<int>>().getConstructors()[0];
      let r1 = ctor.isPublic();
      ctor.getName();
      ctor.getParametersNum();
      let r2 = ctor.isPublic();
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_4800
     * @tc.name testConstructorIsPublic2P1Test048
     * @tc.desc Verify isPublic() result unchanged after getReturnType and isNative interleaved between two isPublic() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GO2_Ext_AbstractGeneric<int>>().getConstructors()[0];
      let r1 = ctor.isPublic();
      ctor.getReturnType();
      ctor.isNative();
      let r2 = ctor.isPublic();
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_4900
     * @tc.name testConstructorIsPublic2P1Test049
     * @tc.desc Verify isPublic() returns true for public constructor with Map<String, int> type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP3_198_PubMap>().getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_5000
     * @tc.name testConstructorIsPublic2P1Test050
     * @tc.desc Verify isPublic() returns true for public constructor with FixedArray<double> type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP3_200_PubDblFixedArr>().getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_5100
     * @tc.name testConstructorIsPublic2P1Test051
     * @tc.desc Verify getConstructors() exposes only the public constructor in mixed visibility class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcPubPrivA>().getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isPublic()).assertTrue();
      expect(ctors[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_5200
     * @tc.name testConstructorIsPublic2P1Test052
     * @tc.desc Verify isPublic() returns true for all four public constructors in four-overload class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP3_191_ArrIdx4>().getConstructors();
      for (let i = 0; i < ctors.length; i++) {
        expect(ctors[i].isPublic()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_5300
     * @tc.name testConstructorIsPublic2P1Test053
     * @tc.desc Verify isPublic, isPrivate, isProtected return mutually consistent boolean values for same public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GO2_Ext_AbstractGeneric<int>>().getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_5400
     * @tc.name testConstructorIsPublic2P1Test054
     * @tc.desc Verify isPublic() returns true for first and last public constructors in seven-overload class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP3_209_7Overload>().getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
      expect(ctors[6].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_5500
     * @tc.name testConstructorIsPublic2P1Test055
     * @tc.desc Verify isPublic() returns true for public constructor with Object[] array type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP3_211_PubObjArr>().getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_5600
     * @tc.name testConstructorIsPublic2P1Test056
     * @tc.desc Verify getParametersNum() returns same value before and after isPublic() for default public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      let before = ctor.getParametersNum();
      ctor.isPublic();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getParametersNum()).assertEqual(before);
      expect(ctor.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_5700
     * @tc.name testConstructorIsPublic2P1Test057
     * @tc.desc Verify isPublic() returns true for public constructor with Constructor[] array type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP3_214_PubCtorArr>().getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_5800
     * @tc.name testConstructorIsPublic2P1Test058
     * @tc.desc Verify isPublic() returns true for third overload at index 2 in six-overload all-public constructor class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP3_216_All6Idx2>().getConstructors();
      expect(ctors[2].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_5900
     * @tc.name testConstructorIsPublic2P1Test059
     * @tc.desc Verify isPublic() returns true for public constructor with Class[] array type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP3_217_PubClsArr>().getConstructors();
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_6000
     * @tc.name testConstructorIsPublic2P1Test060
     * @tc.desc Verify EmptyCls default public constructor isPublic true idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      let r1 = ctor.isPublic();
      let r2 = ctor.isPublic();
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_6100
     * @tc.name testConstructorIsPublic2P1Test061
     * @tc.desc Verify two consecutive isPublic() calls return equal true for double int parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<IP3_181_PubDblInt>().getConstructors()[0];
      let r1 = ctor.isPublic();
      let r2 = ctor.isPublic();
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_6200
     * @tc.name testConstructorIsPublic2P1Test062
     * @tc.desc Verify consecutive isPublic() calls return consistent true for four mixed parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GN3_Mix4ISBD>().getConstructors()[0];
      let r2 = ctor.isPublic();
      let r3 = ctor.isPublic();
      expect(r2).assertEqual(r3);
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_6300
     * @tc.name testConstructorIsPublic2P1Test063
     * @tc.desc Verify consecutive isPublic() calls return equal true and parameter count is one for Class parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<IP3_183_PubClsParam>().getConstructors()[0];
      let r2 = ctor.isPublic();
      let r3 = ctor.isPublic();
      expect(r2).assertEqual(r3);
      expect(r3).assertTrue();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_6400
     * @tc.name testConstructorIsPublic2P1Test064
     * @tc.desc Verify first and fifth isPublic() calls return equal true for two-overload public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EqOverloadCls>().getConstructors()[0];
      let r1 = ctor.isPublic();
      let r5 = ctor.isPublic();
      expect(r1).assertEqual(r5);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_6500
     * @tc.name testConstructorIsPublic2P1Test065
     * @tc.desc Verify isPublic() result unchanged after createInstance() interleaved between two isPublic() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GO2_Ext_AbstractGeneric<int>>().getConstructors()[0];
      let r1 = ctor.isPublic();
      ctor.createInstance();
      let r2 = ctor.isPublic();
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_6600
     * @tc.name testConstructorIsPublic2P1Test066
     * @tc.desc Verify isPublic() result unchanged after getOwner() interleaved between two isPublic() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GO2_Ext_AbstractGeneric<int>>().getConstructors()[0];
      let r1 = ctor.isPublic();
      ctor.getOwner();
      let r2 = ctor.isPublic();
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_6700
     * @tc.name testConstructorIsPublic2P1Test067
     * @tc.desc Verify isPublic() returns consistent result after interleaved getParameterTypes() call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GO2_Ext_AbstractGeneric<int>>().getConstructors()[0];
      let r1 = ctor.isPublic();
      ctor.getParameterTypes();
      let r2 = ctor.isPublic();
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPUBLIC_ExtP1_6800
     * @tc.name testConstructorIsPublic2P1Test068
     * @tc.desc Verify isPublic() returns consistent result after interleaved getReturnType() and getOwner() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPublic2P1Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GO2_Ext_AbstractGeneric<int>>().getConstructors()[0];
      let r1 = ctor.isPublic();
      ctor.getReturnType();
      ctor.getOwner();
      let r2 = ctor.isPublic();
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

  });
}