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

import {DoubleFieldClass,GN2_D0P,GN2_D2P,TcPub19,EmptyCls,GN2_LvlB,GN2_LvlC,GN_2Bool,PubDouble,TcTwoPubA,PGN_Level2,PGN_Level3,PGN_Level4,PGN_Level5,TwoSameInt,GN2_Gen3Mix,GN3_Mix3IBF,GN3_Mix4ISBD,GN_JointName,PGN_SixParam,PGN_TenParam,PubByteParam,GN3_Derived1P,PGN_EnumParam,PGN_FiveParam,PGN_FourParam,PGN_NineParam,PGN_UnionType,PGN_VoidParam,ParamCountCls,PubShortParam,TwoSameString,ChildWithSuper,Ctor3BoolParam,Ctor_MapStrInt,GN3_Mix6ISBDLS,PGN_EightParam,PGN_GenericTwo,PGN_SevenParam,PGN_TupleParam,PGN_TwoDefault,PGN_UnionParam,Ext_FixedArrObj,Ext_FixedArrStr,GN2_GenMixOrder,GN3_Gen3StrBool,GN3_Mix7ISBDLSB,GN_CrossComplex,GetParamTypeABC,PGN_ObjectParam,PGN_ThreeLevelC,Ext3_HasSetParam,IP3_193_PubFloat,PGN_FifteenMixed,PGN_FifteenParam,PGN_GenericArray,PGN_GenericChild,PGN_GenericThree,PGN_InheritChild,PGN_RestWithMand,Ext4_CharOptParam,PGN_AllPrimitives,PGN_AllSpecialMix,PGN_ArrayIntParam,PGN_GenericSingle,PGN_OverloadMixed,PGN_SingleDefault,Ext2_TwentyIntCtor,IP2_110_PubDefBool,PGN_GenericDefault,PGN_InterfaceParam,PGN_OverloadMinMax,Ctor_FixedArray_Int,NestedTypeParam_Ext,ObjectParamCtor_Ext,PGN_InterfaceNoCtor,PGN_CustomClassParam,PGN_MultiDefaultMand,Ext4_FixedArrOptParam,PGN_ImplInterfaceProp,PGN_InterfaceTwoParam,StringFieldWithMethod,DefaultAndRequired_Ext,PGN_GenericConstrained,PGN_ImplMultiInterface,GO2_Ext_AbstractGeneric,PGN_ImplSingleInterface,PGN_InheritAndInterface,PGN_InterfaceThreeParam,OT_Outer_OT_InnerGeneric,PGN_GenericImplInterface,PGN_GenericInterfaceImpl,PGN_ComplexGenericInherit,PGN_SuperCallTwoParamChild,PGN_AbstractGenericInterface,PGN_MultiInheritMultiInterface,EightMixed_Ext,} from "../Util.test";
final class PGN_FinalClass {
  public constructor(a: int, b: int) {}
}

final class Ext_FinalFixedArr {
  public constructor(value: FixedArray<int>) {}
}
export default function ConstructorGetParametersNumTest2Part1(): void {
  describe("ConstructorGetParametersNumTest2Part1", (): void => {
    beforeAll(() => {
    });
    beforeEach((): void=> {});
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 150)
      })
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_0100     
     * @tc.name testConstructorGetParametersNum2P1Test001
     * @tc.desc Verify getParametersNum returns 2 for two parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<DefaultAndRequired_Ext>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_0200     
     * @tc.name testConstructorGetParametersNum2P1Test002
     * @tc.desc Verify getParametersNum returns 4 for four parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_FourParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_0300     
     * @tc.name testConstructorGetParametersNum2P1Test003
     * @tc.desc Verify getParametersNum returns 6 for six parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_SixParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_0400     
     * @tc.name testConstructorGetParametersNum2P1Test004
     * @tc.desc Verify getParametersNum returns 7 for seven parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_SevenParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_0500     
     * @tc.name testConstructorGetParametersNum2P1Test005
     * @tc.desc Verify getParametersNum returns 8 for eight parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_EightParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_0600     
     * @tc.name testConstructorGetParametersNum2P1Test006
     * @tc.desc Verify getParametersNum returns 9 for nine parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_NineParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_0700     
     * @tc.name testConstructorGetParametersNum2P1Test007
     * @tc.desc Verify getParametersNum returns 10 for ten parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_TenParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_0800     
     * @tc.name testConstructorGetParametersNum2P1Test008
     * @tc.desc Verify getParametersNum correctly counts all primitive type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_AllPrimitives>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_0900     
     * @tc.name testConstructorGetParametersNum2P1Test009
     * @tc.desc Verify getParametersNum returns 1 for Array<int> type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_ArrayIntParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_1000     
     * @tc.name testConstructorGetParametersNum2P1Test010
     * @tc.desc Verify getParametersNum returns 1 for tuple type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_TupleParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_1100     
     * @tc.name testConstructorGetParametersNum2P1Test011
     * @tc.desc Verify getParametersNum returns 1 for union type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_UnionParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_1200     
     * @tc.name testConstructorGetParametersNum2P1Test012
     * @tc.desc Verify getParametersNum returns 1 for enum type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_EnumParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_1300     
     * @tc.name testConstructorGetParametersNum2P1Test013
     * @tc.desc Verify getParametersNum returns 1 for interface type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_InterfaceParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_1400     
     * @tc.name testConstructorGetParametersNum2P1Test014
     * @tc.desc Verify getParametersNum returns 1 for custom class type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_CustomClassParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_1500     
     * @tc.name testConstructorGetParametersNum2P1Test015
     * @tc.desc Verify getParametersNum returns 1 for undefined type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_VoidParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_1600     
     * @tc.name testConstructorGetParametersNum2P1Test016
     * @tc.desc Verify getParametersNum returns 1 for single optional fixed array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<Ext4_FixedArrOptParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_1700     
     * @tc.name testConstructorGetParametersNum2P1Test017
     * @tc.desc Verify getParametersNum returns 3 for map boolean int parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<GN_CrossComplex>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_1800     
     * @tc.name testConstructorGetParametersNum2P1Test018
     * @tc.desc Verify getParametersNum returns 3 for optional default rest mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_AllSpecialMix>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_1900     
     * @tc.name testConstructorGetParametersNum2P1Test019
     * @tc.desc Verify getParametersNum counts correctly for parent 1 param and child 2 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentNum = Class.from<TcTwoPubA>().getConstructors()[0].getParametersNum();
      let childNum = Class.from<PGN_InheritChild>().getConstructors()[0].getParametersNum();
      expect(parentNum).assertEqual(1);
      expect(childNum).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_2000     
     * @tc.name testConstructorGetParametersNum2P1Test020
     * @tc.desc Verify getParametersNum returns 1, 2, 3 for TcTwoPubA, PGN_Level2, PGN_Level3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gpNum = Class.from<TcTwoPubA>().getConstructors()[0].getParametersNum();
      let pNum = Class.from<PGN_Level2>().getConstructors()[0].getParametersNum();
      let cNum = Class.from<PGN_Level3>().getConstructors()[0].getParametersNum();
      expect(gpNum).assertEqual(1);
      expect(pNum).assertEqual(2);
      expect(cNum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_2100     
     * @tc.name testConstructorGetParametersNum2P1Test021
     * @tc.desc Verify getParametersNum returns 4 for 4-level inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l4 = Class.from<PGN_Level4>().getConstructors()[0].getParametersNum();
      expect(l4).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_2200     
     * @tc.name testConstructorGetParametersNum2P1Test022
     * @tc.desc Verify getParametersNum returns 5 for 5-level inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l5 = Class.from<PGN_Level5>().getConstructors()[0].getParametersNum();
      expect(l5).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_2300     
     * @tc.name testConstructorGetParametersNum2P1Test023
     * @tc.desc Verify getParametersNum for child class extending parent returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<ChildWithSuper>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_2400     
     * @tc.name testConstructorGetParametersNum2P1Test024
     * @tc.desc Verify getParametersNum returns 3 for int boolean float parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<GN3_Mix3IBF>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_2500     
     * @tc.name testConstructorGetParametersNum2P1Test025
     * @tc.desc Verify getParametersNum returns 6 for six mixed primitive parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<GN3_Mix6ISBDLS>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_2600     
     * @tc.name testConstructorGetParametersNum2P1Test026
     * @tc.desc Verify getParametersNum for child with super(a,b) call returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_SuperCallTwoParamChild>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_2700     
     * @tc.name testConstructorGetParametersNum2P1Test027
     * @tc.desc Verify getParametersNum returns 0 for class with empty constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<EmptyCls>().getConstructors();
      expect(constructors.length).assertEqual(1);
      expect(constructors[0].getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_2800     
     * @tc.name testConstructorGetParametersNum2P1Test028
     * @tc.desc Verify getParametersNum returns 0 for EmptyCls and 1 for child PGN_ThreeLevelC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gpNum = Class.from<EmptyCls>().getConstructors()[0].getParametersNum();
      let pNum = Class.from<EmptyCls>().getConstructors()[0].getParametersNum();
      let cNum = Class.from<PGN_ThreeLevelC>().getConstructors()[0].getParametersNum();
      expect(gpNum).assertEqual(0);
      expect(pNum).assertEqual(0);
      expect(cNum).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_2900     
     * @tc.name testConstructorGetParametersNum2P1Test029
     * @tc.desc Verify getParametersNum for single interface implementation returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_ImplSingleInterface>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_3000     
     * @tc.name testConstructorGetParametersNum2P1Test030
     * @tc.desc Verify getParametersNum for multi interface implementation returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_ImplMultiInterface>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_3100     
     * @tc.name testConstructorGetParametersNum2P1Test031
     * @tc.desc Verify getParametersNum for interface with property implementation returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_ImplInterfaceProp>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_3200     
     * @tc.name testConstructorGetParametersNum2P1Test032
     * @tc.desc Verify getParametersNum for inheritance plus interface implementation returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_InheritAndInterface>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_3300     
     * @tc.name testConstructorGetParametersNum2P1Test033
     * @tc.desc Verify getParametersNum for single-level inheritance plus multi-interface returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_MultiInheritMultiInterface>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_3400     
     * @tc.name testConstructorGetParametersNum2P1Test034
     * @tc.desc Verify getParametersNum for interface implementation with explicit empty constructor returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<PGN_InterfaceNoCtor>().getConstructors();
      expect(constructors.length).assertEqual(1);
      expect(constructors[0].getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_3500     
     * @tc.name testConstructorGetParametersNum2P1Test035
     * @tc.desc Verify getParametersNum for interface implementation with 3 params returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_InterfaceThreeParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_3600     
     * @tc.name testConstructorGetParametersNum2P1Test036
     * @tc.desc Verify generic type parameter does not affect parameter count consistency across types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numInt = Class.from<PGN_GenericSingle<int>>().getConstructors()[0].getParametersNum();
      let numStr = Class.from<PGN_GenericSingle<string>>().getConstructors()[0].getParametersNum();
      expect(numInt).assertEqual(numStr);
      expect(numInt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_3700     
     * @tc.name testConstructorGetParametersNum2P1Test037
     * @tc.desc Verify parameter counts of independent classes are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerNum = Class.from<EmptyCls>().getConstructors()[0].getParametersNum();
      let innerNum = Class.from<ParamCountCls>().getConstructors()[0].getParametersNum();
      expect(outerNum).assertEqual(0);
      expect(innerNum).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_3800     
     * @tc.name testConstructorGetParametersNum2P1Test038
     * @tc.desc Verify getParametersNum returns 1 for class with single int parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<GN2_LvlB>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_3900     
     * @tc.name testConstructorGetParametersNum2P1Test039
     * @tc.desc Verify getParametersNum returns 1 for object type constructor parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<ObjectParamCtor_Ext>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_4000     
     * @tc.name testConstructorGetParametersNum2P1Test040
     * @tc.desc Verify repeated calls to getParametersNum return consistent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GetParamTypeABC>().getConstructors()[0];
      let n1 = ctor.getParametersNum();
      let n2 = ctor.getParametersNum();
      let n3 = ctor.getParametersNum();
      expect(n1).assertEqual(n2);
      expect(n2).assertEqual(n3);
      expect(n1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_4100     
     * @tc.name testConstructorGetParametersNum2P1Test041
     * @tc.desc Verify getParametersNum matches getParameterTypes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<PGN_FiveParam>().getConstructors()[0];
      let num = ctor.getParametersNum();
      let types = ctor.getParameterTypes();
      expect(num).assertEqual(types.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_4200     
     * @tc.name testConstructorGetParametersNum2P1Test042
     * @tc.desc Verify getParametersNum returns non-negative values across multiple scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: Array<int> = [
        Class.from<EmptyCls>().getConstructors()[0].getParametersNum(),
        Class.from<StringFieldWithMethod>().getConstructors()[0].getParametersNum(),
        Class.from<PGN_FiveParam>().getConstructors()[0].getParametersNum()
      ];
      expect(nums[0]).assertEqual(0);
      expect(nums[1]).assertEqual(1);
      expect(nums[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_4300     
     * @tc.name testConstructorGetParametersNum2P1Test043
     * @tc.desc Verify multiple constructors each have independent parameter counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = Class.from<StringFieldWithMethod>().getConstructors()[0].getParametersNum();
      let c2 = Class.from<DefaultAndRequired_Ext>().getConstructors()[0].getParametersNum();
      let c3 = Class.from<GetParamTypeABC>().getConstructors()[0].getParametersNum();
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(2);
      expect(c3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_4400     
     * @tc.name testConstructorGetParametersNum2P1Test044
     * @tc.desc Verify getParametersNum matches getParameterTypes length for five parameter class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GN_JointName>().getConstructors()[0];
      let num = ctor.getParametersNum();
      let types = ctor.getParameterTypes();
      expect(num).assertEqual(types.length);
      expect(num).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_4500     
     * @tc.name testConstructorGetParametersNum2P1Test045
     * @tc.desc Verify getParametersNum matches getParameterTypes length in inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<PGN_InheritChild>().getConstructors()[0];
      expect(ctor.getParametersNum()).assertEqual(ctor.getParameterTypes().length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_4600     
     * @tc.name testConstructorGetParametersNum2P1Test046
     * @tc.desc Verify getParametersNum matches getParameterTypes length in generic class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<PGN_GenericTwo<int, string>>().getConstructors()[0];
      expect(ctor.getParametersNum()).assertEqual(ctor.getParameterTypes().length);
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_4700     
     * @tc.name testConstructorGetParametersNum2P1Test047
     * @tc.desc Verify getParametersNum matches getParameterTypes length in interface implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<PGN_InterfaceTwoParam>().getConstructors()[0];
      expect(ctor.getParametersNum()).assertEqual(ctor.getParameterTypes().length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_4800     
     * @tc.name testConstructorGetParametersNum2P1Test048
     * @tc.desc Verify getParametersNum matches getParameterTypes length for rest parameter class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<PGN_RestWithMand>().getConstructors()[0];
      expect(ctor.getParametersNum()).assertEqual(ctor.getParameterTypes().length);
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_4900     
     * @tc.name testConstructorGetParametersNum2P1Test049
     * @tc.desc Verify final modifier does not affect getParametersNum, returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_FinalClass>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_5000     
     * @tc.name testConstructorGetParametersNum2P1Test050
     * @tc.desc Verify getParametersNum returns 2 for two int type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<TwoSameInt>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_5100     
     * @tc.name testConstructorGetParametersNum2P1Test051
     * @tc.desc Verify getConstructors length 1 and getParametersNum 0 for empty constructor class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<GN2_D0P>().getConstructors();
      expect(constructors.length).assertEqual(1);
      expect(constructors[0].getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_5200     
     * @tc.name testConstructorGetParametersNum2P1Test052
     * @tc.desc Verify getParametersNum returns 1 for derived class with one parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<GN3_Derived1P>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_5300     
     * @tc.name testConstructorGetParametersNum2P1Test053
     * @tc.desc Verify getParametersNum returns 7 for seven mixed primitive parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<GN3_Mix7ISBDLSB>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_5400     
     * @tc.name testConstructorGetParametersNum2P1Test054
     * @tc.desc Verify getParametersNum returns 1 for abstract class with fixed array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<Ext_FixedArrStr>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_5500     
     * @tc.name testConstructorGetParametersNum2P1Test055
     * @tc.desc Verify getParametersNum returns 1 for final class with fixed int array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<Ext_FinalFixedArr>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_5600     
     * @tc.name testConstructorGetParametersNum2P1Test056
     * @tc.desc Verify union type parameter does not affect count, returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_UnionType>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_5700     
     * @tc.name testConstructorGetParametersNum2P1Test057
     * @tc.desc Verify getParametersNum returns 2 for two parameter derived class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<GN2_D2P>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_5800     
     * @tc.name testConstructorGetParametersNum2P1Test058
     * @tc.desc Verify getParametersNum returns 1 for fixed object array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<Ext_FixedArrObj>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_5900     
     * @tc.name testConstructorGetParametersNum2P1Test059
     * @tc.desc Verify getParametersNum returns 2 for two string parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<TwoSameString>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_6000     
     * @tc.name testConstructorGetParametersNum2P1Test060
     * @tc.desc Verify getParametersNum returns 2 for two boolean parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<GN_2Bool>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_6100     
     * @tc.name testConstructorGetParametersNum2P1Test061
     * @tc.desc Verify getParametersNum returns 3 for three boolean parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<Ctor3BoolParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_6200     
     * @tc.name testConstructorGetParametersNum2P1Test062
     * @tc.desc Verify getParametersNum returns 2 for level class with two parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<GN2_LvlC>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_6300     
     * @tc.name testConstructorGetParametersNum2P1Test063
     * @tc.desc Verify getParametersNum returns 4 for mixed int string boolean double parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<GN3_Mix4ISBD>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_6400     
     * @tc.name testConstructorGetParametersNum2P1Test064
     * @tc.desc Verify getParametersNum returns 2 for fixed array and int parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<Ctor_FixedArray_Int>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_6500     
     * @tc.name testConstructorGetParametersNum2P1Test065
     * @tc.desc Verify getParametersNum returns 15 for fifteen int parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_FifteenParam>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_6600     
     * @tc.name testConstructorGetParametersNum2P1Test066
     * @tc.desc Verify getParametersNum returns 20 for twenty int parameter constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<Ext2_TwentyIntCtor>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_6700     
     * @tc.name testConstructorGetParametersNum2P1Test067
     * @tc.desc Verify getParametersNum returns 15 for fifteen mixed types constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_FifteenMixed>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_6800     
     * @tc.name testConstructorGetParametersNum2P1Test068
     * @tc.desc Verify getParametersNum returns correct count for default parameter semantics - PGN_SingleDefault returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_SingleDefault>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_6900     
     * @tc.name testConstructorGetParametersNum2P1Test069
     * @tc.desc Verify getParametersNum counts default value parameters correctly - PGN_MultiDefaultMand returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_MultiDefaultMand>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_7000     
     * @tc.name testConstructorGetParametersNum2P1Test070
     * @tc.desc Verify getParametersNum counts correctly for PGN_TwoDefault returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num = Class.from<PGN_TwoDefault>().getConstructors()[0].getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_7100     
     * @tc.name testConstructorGetParametersNum2P1Test071
     * @tc.desc Verify min arity among overloads - PGN_OverloadMinMax empty ctor has 0 params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PGN_OverloadMinMax>().getConstructors();
      let minArity = 999;
      let maxArity = 0;
      for (let i = 0; i < ctors.length; i++) {
        let num = ctors[i].getParametersNum();
        if (num < minArity) minArity = num;
        if (num > maxArity) maxArity = num;
      }
      expect(minArity).assertEqual(0);
      expect(maxArity).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_7200     
     * @tc.name testConstructorGetParametersNum2P1Test072
     * @tc.desc Verify arity selection among overloads - PGN_OverloadMixed has 1,2,3 param variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PGN_OverloadMixed>().getConstructors();
      let counts: Set<int> = new Set<int>();
      for (let i = 0; i < ctors.length; i++) {
        counts.add(ctors[i].getParametersNum());
      }
      expect(counts.has(1)).assertTrue();
      expect(counts.has(2)).assertTrue();
      expect(counts.has(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERSNUM_ExtP1_7300     
     * @tc.name testConstructorGetParametersNum2P1Test073
     * @tc.desc Verify getParametersNum combined with getOwner returns correct owner class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParametersNum2P1Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DefaultAndRequired_Ext>().getConstructors()[0];
      let num = ctor.getParametersNum();
      let owner = ctor.getOwner();
      expect(num).assertEqual(2);
      expect(owner.getName().includes("DefaultAndRequired_Ext")).assertTrue();
    });

  });
}
