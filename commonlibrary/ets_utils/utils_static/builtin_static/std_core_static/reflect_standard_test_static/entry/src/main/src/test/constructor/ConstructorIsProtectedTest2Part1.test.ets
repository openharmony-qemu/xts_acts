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

import {TcAllVisA,TcTwoPubA,GN3_Mix4ISBD,CtorArr3D,EmptyCls,TcPub10,GetParamTypeABC,TcPub12,OT_Outer_OT_InnerGeneric,IsPublicGenericTwo,TcPub19,StringFieldWithMethod,Ctor_MapStrInt,TcPub23,TcPub24,DoubleFieldClass,PubDouble,TcPub33,TcPub34,IP2_110_PubDefBool,PubByteParam,PubShortParam,IP3_193_PubFloat,ParamCountCls,TcPubPrivA,TcPubProtA,TcPub13,TcPub14,TcPub15,TcGenPub,C1Char,Ext4_CharOptParam,Ext4_CharStringMix,GN_ByteArr,GN_SetStr,IP5_268_ProChar,ObjectParamCtor_Ext,PGN_UnionType,TcAllOpt5,TcBool2D,TcGapByte2D,TcGapCustArr,TcGapFloat2D,TcGapFnParam,TcGapIfcProt,TcGapIfcPub,TcGapMapII,TcGapNameGen,TcGapShort2D,TcGapUniNB,TcIntMap,TcMapSS,TcStr2D,TcStrIntArr,} from "../Util.test";
export default function ConstructorIsProtectedTest2Part1(): void {
  describe("ConstructorIsProtectedTest2Part1", (): void => {
    beforeAll(() => {});
    beforeEach((): void=> {});
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 100);
      });
    });
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_0100
     * @tc.name testConstructorIsProtected2P1Test001
     * @tc.desc Verify isProtected() returns false and parameter count is two for string double params public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcPub10>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_0200
     * @tc.name testConstructorIsProtected2P1Test002
     * @tc.desc Verify exposed public constructor of class with protected overload is not protected and is public
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcPubProtA>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_0300
     * @tc.name testConstructorIsProtected2P1Test003
     * @tc.desc Verify optional int param public constructor isProtected false and name is constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcTwoPubA>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_0400
     * @tc.name testConstructorIsProtected2P1Test004
     * @tc.desc Verify optional int param public constructor isProtected false and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcTwoPubA>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_0500
     * @tc.name testConstructorIsProtected2P1Test005
     * @tc.desc Verify isProtected() returns false and parameter count is one for int array param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcPub19>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_0600
     * @tc.name testConstructorIsProtected2P1Test006
     * @tc.desc Verify isProtected() returns false and parameter count is one for generic class public constructor with boolean type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<OT_Outer_OT_InnerGeneric<boolean>>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_0700
     * @tc.name testConstructorIsProtected2P1Test007
     * @tc.desc Verify isProtected() returns false for BigInt param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<TcPub23>().getConstructors()[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_0800
     * @tc.name testConstructorIsProtected2P1Test008
     * @tc.desc Verify isProtected() returns false for double[][] param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<TcPub24>().getConstructors()[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_0900
     * @tc.name testConstructorIsProtected2P1Test009
     * @tc.desc Verify constructor equals another handle of same constructor returns true and isProtected returns false for generic public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor1 = Class.from<TcPub14<double>>().getConstructors()[0];
      let ctor2 = Class.from<TcPub14<double>>().getConstructors()[0];
      expect(ctor1.equals(ctor2)).assertTrue();
      expect(ctor1.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_1000
     * @tc.name testConstructorIsProtected2P1Test010
     * @tc.desc Verify isProtected() returns false for Date param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<TcPub33>().getConstructors()[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_1100
     * @tc.name testConstructorIsProtected2P1Test011
     * @tc.desc Verify isProtected() returns false for RegExp param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<TcPub34>().getConstructors()[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_1200
     * @tc.name testConstructorIsProtected2P1Test012
     * @tc.desc Verify only public constructor exposed for class with private overload is not protected and not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcPubPrivA>().getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isProtected()).assertFalse();
      expect(ctors[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_1300
     * @tc.name testConstructorIsProtected2P1Test013
     * @tc.desc Verify public constructor (index 0) isProtected returns false (protected constructor not exposed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcPubProtA>().getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_1400
     * @tc.name testConstructorIsProtected2P1Test014
     * @tc.desc Verify public constructor (index 0) isProtected returns false (private constructor not exposed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcPubPrivA>().getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_1500
     * @tc.name testConstructorIsProtected2P1Test015
     * @tc.desc Verify public constructor (index 0) isProtected returns false (protected constructor not exposed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcAllVisA>().getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_1600
     * @tc.name testConstructorIsProtected2P1Test016
     * @tc.desc Verify only exposed public constructor of all-visibility class is not protected, is public and not private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcAllVisA>().getConstructors();
      let c = ctors[0];
      expect(ctors.length).assertEqual(1);
      expect(c.isProtected()).assertFalse();
      expect(c.isPublic()).assertTrue();
      expect(c.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_1700
     * @tc.name testConstructorIsProtected2P1Test017
     * @tc.desc Verify public constructor isProtected returns false and isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Class.from<EmptyCls>().getConstructors()[0];
      expect(c.isProtected()).assertFalse();
      expect(c.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_1800
     * @tc.name testConstructorIsProtected2P1Test018
     * @tc.desc Verify public constructor isProtected returns false and getName still returns 'constructor'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = Class.from<EmptyCls>().getConstructors()[0];
      expect(c.isProtected()).assertFalse();
      expect(c.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_1900
     * @tc.name testConstructorIsProtected2P1Test019
     * @tc.desc Verify isProtected() returns false and getOwner name contains class name for generic public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcPub15<boolean, double>>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getOwner().getName().includes("TcPub15")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_2000
     * @tc.name testConstructorIsProtected2P1Test020
     * @tc.desc Verify isProtected() returns false and parameter count is four for multi-int public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcPub12>().getConstructors()[0];
      expect(ctor.getParametersNum()).assertEqual(4);
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_2100
     * @tc.name testConstructorIsProtected2P1Test021
     * @tc.desc Verify isProtected() returns false and parameter count is three for int string boolean public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GetParamTypeABC>().getConstructors()[0];
      expect(ctor.getParametersNum()).assertEqual(3);
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_2200
     * @tc.name testConstructorIsProtected2P1Test022
     * @tc.desc Verify isProtected() does not modify getParameterType result for multi-param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GetParamTypeABC>().getConstructors()[0];
      let before: Class | undefined = ctor.getParameterType(0);
      ctor.isProtected();
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getParameterType(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_2300
     * @tc.name testConstructorIsProtected2P1Test023
     * @tc.desc Verify isProtected() returns false after calling getReturnType on public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      ctor.getReturnType();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_2400
     * @tc.name testConstructorIsProtected2P1Test024
     * @tc.desc Verify isProtected() returns false for public constructor with 3D int array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CtorArr3D>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_2500
     * @tc.name testConstructorIsProtected2P1Test025
     * @tc.desc Verify isProtected after calling getParameterType on all 4 indices of multi-param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GN3_Mix4ISBD>().getConstructors()[0];
      ctor.getParameterType(0);
      ctor.getParameterType(1);
      ctor.getParameterType(2);
      ctor.getParameterType(3);
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_2600
     * @tc.name testConstructorIsProtected2P1Test026
     * @tc.desc Verify empty class single constructor isProtected false and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<EmptyCls>().getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isProtected()).assertFalse();
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_2700
     * @tc.name testConstructorIsProtected2P1Test027
     * @tc.desc Verify Class.of two-parameter constructor isProtected false and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ParamCountCls(1, 'a');
      let ctor = Class.of(obj).getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_2800
     * @tc.name testConstructorIsProtected2P1Test028
     * @tc.desc Verify custom class array parameter constructor isProtected false and parameter count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcGapCustArr>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_2900
     * @tc.name testConstructorIsProtected2P1Test029
     * @tc.desc Verify constructor with 5 all-optional params isProtected returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcAllOpt5>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_3000
     * @tc.name testConstructorIsProtected2P1Test030
     * @tc.desc Verify constructor with 2D string array param isProtected returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcStr2D>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_3100
     * @tc.name testConstructorIsProtected2P1Test031
     * @tc.desc Verify constructor with Map<string,string> param isProtected returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcMapSS>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_3200
     * @tc.name testConstructorIsProtected2P1Test032
     * @tc.desc Verify isProtected consistency across two separate getConstructors calls on same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors1 = Class.from<EmptyCls>().getConstructors();
      let ctors2 = Class.from<EmptyCls>().getConstructors();
      expect(ctors1[0].isProtected()).assertEqual(ctors2[0].isProtected());
      expect(ctors1[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_3300
     * @tc.name testConstructorIsProtected2P1Test033
     * @tc.desc Verify isProtected returns false after calling all other Constructor methods on same object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      ctor.getName();
      ctor.getReturnType();
      ctor.getParametersNum();
      ctor.equals(ctor);
      ctor.getName();
      ctor.isPublic();
      ctor.isPrivate();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_3400
     * @tc.name testConstructorIsProtected2P1Test034
     * @tc.desc Verify public double constructor isProtected false and isPrivate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<PubDouble>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_3500
     * @tc.name testConstructorIsProtected2P1Test035
     * @tc.desc Verify TcPub19 int array param constructor isProtected false and getParameterTypes length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcPub19>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getParameterTypes().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_3600
     * @tc.name testConstructorIsProtected2P1Test036
     * @tc.desc Verify isProtected returns false for constructor mixing string and 2D int array params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcStrIntArr>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_3700
     * @tc.name testConstructorIsProtected2P1Test037
     * @tc.desc Verify visibility flags sum equals 1 for all-optional constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcAllOpt5>().getConstructors()[0];
      let sum: int = 0;
      if (ctor.isProtected()) {
        sum++;
      }
      if (ctor.isPublic()) {
        sum++;
      }
      if (ctor.isPrivate()) {
        sum++;
      }
      expect(sum).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_3800
     * @tc.name testConstructorIsProtected2P1Test038
     * @tc.desc Verify 3-parameter public constructor isProtected false and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GetParamTypeABC>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_3900
     * @tc.name testConstructorIsProtected2P1Test039
     * @tc.desc Verify protected interface constructor hidden while public interface constructor exposed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prot = Class.from<TcGapIfcProt>().getConstructors();
      let pub = Class.from<TcGapIfcPub>().getConstructors();
      expect(prot.length).assertEqual(0);
      expect(pub.length).assertEqual(1);
      expect(pub[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_4000
     * @tc.name testConstructorIsProtected2P1Test040
     * @tc.desc Verify char string dual-parameter constructor isProtected false and parameter count 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_CharStringMix>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_4100
     * @tc.name testConstructorIsProtected2P1Test041
     * @tc.desc Verify union number boolean constructor isProtected false isPublic true isPrivate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcGapUniNB>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_4200
     * @tc.name testConstructorIsProtected2P1Test042
     * @tc.desc Verify function parameter constructor isProtected consistent false on consecutive calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcGapFnParam>().getConstructors()[0];
      let first: boolean = ctor.isProtected();
      let second: boolean = ctor.isProtected();
      expect(first).assertEqual(second);
      expect(first).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_4300
     * @tc.name testConstructorIsProtected2P1Test043
     * @tc.desc Verify int map parameter class single constructor isProtected false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcIntMap>().getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_4400
     * @tc.name testConstructorIsProtected2P1Test044
     * @tc.desc Verify byte array parameter constructor isProtected false and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GN_ByteArr>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_4500
     * @tc.name testConstructorIsProtected2P1Test045
     * @tc.desc Verify TcTwoPubA optional int param constructor isProtected false idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcTwoPubA>().getConstructors()[0];
      let r1 = ctor.isProtected();
      let r2 = ctor.isProtected();
      expect(r1).assertFalse();
      expect(r2).assertFalse();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_4600
     * @tc.name testConstructorIsProtected2P1Test046
     * @tc.desc Verify StringFieldWithMethod string param constructor isProtected false and getName constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringFieldWithMethod>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_4700
     * @tc.name testConstructorIsProtected2P1Test047
     * @tc.desc Verify TcPub12 four int param constructor isProtected false and getParameterTypes length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcPub12>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getParameterTypes().length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_4800
     * @tc.name testConstructorIsProtected2P1Test048
     * @tc.desc Verify ParamCountCls int string dual param constructor isProtected false and getParametersNum 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_4900
     * @tc.name testConstructorIsProtected2P1Test049
     * @tc.desc Verify mutual exclusivity isPublic isPrivate isProtected sum equals 1 for two required params public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      let sum: int = 0;
      if (ctor.isPublic()) {
        sum++;
      }
      if (ctor.isPrivate()) {
        sum++;
      }
      if (ctor.isProtected()) {
        sum++;
      }
      expect(sum).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_5000
     * @tc.name testConstructorIsProtected2P1Test050
     * @tc.desc Verify mutual exclusivity isPublic isPrivate isProtected sum equals 1 for 3-param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GetParamTypeABC>().getConstructors()[0];
      let sum: int = 0;
      if (ctor.isProtected()) {
        sum++;
      }
      if (ctor.isPublic()) {
        sum++;
      }
      if (ctor.isPrivate()) {
        sum++;
      }
      expect(sum).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_5100
     * @tc.name testConstructorIsProtected2P1Test051
     * @tc.desc Verify visibility mutual exclusivity sum equals 1 for char parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<C1Char>().getConstructors()[0];
      let s: int = (ctor.isProtected() ? 1 : 0) + (ctor.isPublic() ? 1 : 0) + (ctor.isPrivate() ? 1 : 0);
      expect(s).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_5200
     * @tc.name testConstructorIsProtected2P1Test052
     * @tc.desc Verify isProtected does not alter getParameterType(0) for Map string int param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ctor_MapStrInt>().getConstructors()[0];
      let before: Class | undefined = ctor.getParameterType(0);
      ctor.isProtected();
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getParameterType(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_5300
     * @tc.name testConstructorIsProtected2P1Test053
     * @tc.desc Verify isProtected does not alter getParameterType(0) for int array param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcPub19>().getConstructors()[0];
      let before: Class | undefined = ctor.getParameterType(0);
      ctor.isProtected();
      expect(ctor.isProtected()).assertFalse();
      let after: Class | undefined = ctor.getParameterType(0);
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_5400
     * @tc.name testConstructorIsProtected2P1Test054
     * @tc.desc Verify isProtected then isPrivate then isPublic on all return expected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_5500
     * @tc.name testConstructorIsProtected2P1Test055
     * @tc.desc Verify isProtected after calling getParameterType on indices 0 and 1 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      ctor.getParameterType(0);
      ctor.getParameterType(1);
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_5600
     * @tc.name testConstructorIsProtected2P1Test056
     * @tc.desc Verify isProtected after calling getName and equals on single public constructor with optional param returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcTwoPubA>().getConstructors()[0];
      ctor.getName();
      ctor.equals(ctor);
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_5700
     * @tc.name testConstructorIsProtected2P1Test057
     * @tc.desc Verify isProtected after calling getName then getReturnType returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      ctor.getName();
      ctor.getReturnType();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_5800
     * @tc.name testConstructorIsProtected2P1Test058
     * @tc.desc Verify isProtected returns false and getParametersNum invariance for zero-parameter public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      let before: int = ctor.getParametersNum();
      let r: boolean = ctor.isProtected();
      expect(r).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(before);
      expect(ctor.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_5900
     * @tc.name testConstructorIsProtected2P1Test059
     * @tc.desc Verify map int int parameter constructor isProtected false and parameter count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcGapMapII>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_6000
     * @tc.name testConstructorIsProtected2P1Test060
     * @tc.desc Verify object parameter constructor isProtected boolean type and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<ObjectParamCtor_Ext>().getConstructors()[0].isProtected()).assertFalse();
      expect(Class.from<ObjectParamCtor_Ext>().getConstructors()[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_6100
     * @tc.name testConstructorIsProtected2P1Test061
     * @tc.desc Verify set string parameter constructor isProtected false isPublic true and parameter count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GN_SetStr>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_6200
     * @tc.name testConstructorIsProtected2P1Test062
     * @tc.desc Verify isProtected returns false for union type number|boolean param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcGapUniNB>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_6300
     * @tc.name testConstructorIsProtected2P1Test063
     * @tc.desc Verify boolean 2D array parameter constructor isProtected false and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcBool2D>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_6400
     * @tc.name testConstructorIsProtected2P1Test064
     * @tc.desc Verify getName unchanged after isProtected on generic class<string> constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcGapNameGen<string>>().getConstructors()[0];
      let nameBefore: string = ctor.getName();
      ctor.isProtected();
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getName()).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_6500
     * @tc.name testConstructorIsProtected2P1Test065
     * @tc.desc Verify isProtected returns false and getParametersNum invariance for 5 default-valued params constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcAllOpt5>().getConstructors()[0];
      let before: int = ctor.getParametersNum();
      let r: boolean = ctor.isProtected();
      expect(r).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(before);
      expect(ctor.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_6600
     * @tc.name testConstructorIsProtected2P1Test066
     * @tc.desc Verify isProtected returns false for byte 2D array param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcGapByte2D>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_6700
     * @tc.name testConstructorIsProtected2P1Test067
     * @tc.desc Verify single public byte constructor: isProtected false and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PubByteParam>().getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isProtected()).assertFalse();
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_6800
     * @tc.name testConstructorIsProtected2P1Test068
     * @tc.desc Verify isProtected returns false for short 2D array param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcGapShort2D>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_6900
     * @tc.name testConstructorIsProtected2P1Test069
     * @tc.desc Verify isProtected returns false for float 2D array param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcGapFloat2D>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_7000
     * @tc.name testConstructorIsProtected2P1Test070
     * @tc.desc Verify isProtected returns false for byte array param public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GN_ByteArr>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_7100
     * @tc.name testConstructorIsProtected2P1Test071
     * @tc.desc Verify isProtected returns false for interface implementing class public constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcGapIfcPub>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_7200
     * @tc.name testConstructorIsProtected2P1Test072
     * @tc.desc Verify isProtected returns false for public constructor with char param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<C1Char>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_7300
     * @tc.name testConstructorIsProtected2P1Test073
     * @tc.desc Verify abstract class char parameter constructor isProtected false and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<C1Char>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_7400
     * @tc.name testConstructorIsProtected2P1Test074
     * @tc.desc Verify isProtected returns false for optional char parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<Ext4_CharOptParam>().getConstructors()[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_7500
     * @tc.name testConstructorIsProtected2P1Test075
     * @tc.desc Verify visibility flags sum equals 1 for string parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringFieldWithMethod>().getConstructors()[0];
      let sum: int = 0;
      if (ctor.isProtected()) {
        sum++;
      }
      if (ctor.isPublic()) {
        sum++;
      }
      if (ctor.isPrivate()) {
        sum++;
      }
      expect(sum).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_7600
     * @tc.name testConstructorIsProtected2P1Test076
     * @tc.desc Verify isProtected false and getParametersNum invariance for union string int constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<PGN_UnionType>().getConstructors()[0];
      let before: int = ctor.getParametersNum();
      ctor.isProtected();
      expect(ctor.getParametersNum()).assertEqual(before);
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_7700
     * @tc.name testConstructorIsProtected2P1Test077
     * @tc.desc Verify string field class constructor isProtected false and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringFieldWithMethod>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_7800
     * @tc.name testConstructorIsProtected2P1Test078
     * @tc.desc Verify isProtected returns false for public constructor with char and string params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_CharStringMix>().getConstructors()[0];
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_7900
     * @tc.name testConstructorIsProtected2P1Test079
     * @tc.desc Verify protected char constructor hidden while public char constructor exposed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP5_268_ProChar>().getConstructors();
      expect(ctors.length).assertEqual(0);
      let pub = Class.from<C1Char>().getConstructors();
      expect(pub.length).assertEqual(1);
      expect(pub[0].isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPROTECTED_ExtP1_8000
     * @tc.name testConstructorIsProtected2P1Test080
     * @tc.desc Verify isProtected + isPublic + isPrivate mutual exclusivity sum equals 1 for interface class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsProtected2P1Test080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcGapIfcPub>().getConstructors()[0];
      let s: int = (ctor.isProtected() ? 1 : 0) + (ctor.isPublic() ? 1 : 0) + (ctor.isPrivate() ? 1 : 0);
      expect(s).assertEqual(1);
    });
  });
}
