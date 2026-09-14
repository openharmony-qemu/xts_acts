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
import {Pair,BoxInt,ExtArrB,ExtArrC,ExtCmpB,ExtCmpC,ExtCmpE,ExtLenC,MapPair,EmptyCls,LevelSub,WrapBool,ExtChainD,ExtChainE,LevelBase,StrIntCls,TcTwoPubA,TwoIntCls,TwoStrCls,BoolStrCls,BoxGeneric,BranchCtor,FourMixCls,GenericBox,TwoCtorCls,ArrParamCls,EnumUserCls,FiveCtorCls,FourCtorCls,InitThisCls,IntFieldCls,LevelSubSub,LoopCtorCls,MixThreeCls,StrFieldCls,ThreeIntCls,ThrowInCtor,TwoCtorCls3,TwoCtorCls4,BoolFieldCls,BoolParamCls,ByteFieldCls,ByteParamCls,CreateInCtor,CtorMapParam,CtorSetParam,FiveParamCls,LongFieldCls,LongParamCls,LoopBodyCtor,MultiInitCls,PubLongParam,ThreeCtorCls,WrongArgCtor,ClassParamCls,CompactIntCls,Ctor5IntParam,Ctor5StrParam,EqOverloadCls,FloatFieldCls,FloatParamCls,InitMethodCls,MultiFieldCls,ParamCountCls,ShortFieldCls,ShortParamCls,ThreeCtorCls2,Ctor3BoolParam,Ctor_MapStrInt,DoubleFieldCls,ThrowParamCtor,Ctor6MixedParam,CtorCustomParam,CtorStrArrParam,FltDblIntStrCls,ProtectFieldCls,ByteShortLongCls,Ctor4DoubleParam,CtorBoolArrParam,CtorArrayIntParam,CtorArrayStrParam,CtorDoubleArrParam,CtorFloatCharParam,OverloadMiddleCtor,CtorFixedArrStrParam,CtorMultiDimArrParam,ImplInterfaceCtorCls,Ctor_ConstructorParam,StringFieldWithMethod,CtorAllPrimitivesParam,CtorCombineArraysParam,CtorNestedGenericParam,CtorCombineComplexParam,CtorComplexGenericParam,CtorDoubleExtremesParam,CtorCombineCollectionsParam,} from "../Util.test";
export default function ConstructorGetReturnTypeTest2Part1(): void {
  describe("ConstructorGetReturnTypeTest2Part1", (): void => {
    beforeAll(() => {});
    beforeEach((): void=> {});
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 150);
      });
    });
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_0100     
     * @tc.name testConstructorGetReturnType2P1Test001
     * @tc.desc Verify getReturnType returns void for class with string field and default constructor (StrFieldCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrFieldCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_0200     
     * @tc.name testConstructorGetReturnType2P1Test002
     * @tc.desc Verify getReturnType returns void for class with boolean field and default constructor (BoolFieldCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolFieldCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_0300     
     * @tc.name testConstructorGetReturnType2P1Test003
     * @tc.desc Verify getReturnType returns void for class with double field and default constructor (DoubleFieldCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleFieldCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_0400     
     * @tc.name testConstructorGetReturnType2P1Test004
     * @tc.desc Verify getReturnType returns void for class with float field and default constructor (FloatFieldCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FloatFieldCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_0500     
     * @tc.name testConstructorGetReturnType2P1Test005
     * @tc.desc Verify getReturnType returns void for class with byte field and default constructor (ByteFieldCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ByteFieldCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_0600     
     * @tc.name testConstructorGetReturnType2P1Test006
     * @tc.desc Verify getReturnType returns void for class with long field and default constructor (LongFieldCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongFieldCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_0700     
     * @tc.name testConstructorGetReturnType2P1Test007
     * @tc.desc Verify getReturnType returns void for class with short field and default constructor (ShortFieldCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShortFieldCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_0800     
     * @tc.name testConstructorGetReturnType2P1Test008
     * @tc.desc Verify getReturnType returns void for class with multi-type fields and default constructor (MultiFieldCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFieldCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_0900     
     * @tc.name testConstructorGetReturnType2P1Test009
     * @tc.desc Verify getReturnType returns void when constructor has boolean parameter (BoolParamCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolParamCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_1000     
     * @tc.name testConstructorGetReturnType2P1Test010
     * @tc.desc Verify getReturnType returns void when constructor has float parameter (FloatParamCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FloatParamCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_1100     
     * @tc.name testConstructorGetReturnType2P1Test011
     * @tc.desc Verify getReturnType returns void when constructor has byte parameter (ByteParamCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ByteParamCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_1200     
     * @tc.name testConstructorGetReturnType2P1Test012
     * @tc.desc Verify getReturnType returns void when constructor has short parameter (ShortParamCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShortParamCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_1300     
     * @tc.name testConstructorGetReturnType2P1Test013
     * @tc.desc Verify getReturnType returns void when constructor has Class type parameter (ClassParamCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ClassParamCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_1400     
     * @tc.name testConstructorGetReturnType2P1Test014
     * @tc.desc Verify getReturnType returns void when constructor has FixedArray parameter (ArrParamCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrParamCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_1500     
     * @tc.name testConstructorGetReturnType2P1Test015
     * @tc.desc Verify getReturnType returns void when constructor has two int parameters (TwoIntCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoIntCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_1600     
     * @tc.name testConstructorGetReturnType2P1Test016
     * @tc.desc Verify getReturnType returns void when constructor has boolean and string parameters (BoolStrCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolStrCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_1700     
     * @tc.name testConstructorGetReturnType2P1Test017
     * @tc.desc Verify getReturnType returns void when constructor has three int parameters (ThreeIntCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeIntCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_1800     
     * @tc.name testConstructorGetReturnType2P1Test018
     * @tc.desc Verify getReturnType returns void when constructor has int, string, boolean parameters (MixThreeCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixThreeCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_1900     
     * @tc.name testConstructorGetReturnType2P1Test019
     * @tc.desc Verify getReturnType returns void when constructor has string, boolean, int, double parameters (FourMixCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FourMixCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_2000     
     * @tc.name testConstructorGetReturnType2P1Test020
     * @tc.desc Verify getReturnType returns void when constructor has byte, short, long parameters (ByteShortLongCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ByteShortLongCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_2100     
     * @tc.name testConstructorGetReturnType2P1Test021
     * @tc.desc Verify getReturnType returns void when constructor has float, double, int, string parameters (FltDblIntStrCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FltDblIntStrCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_2200     
     * @tc.name testConstructorGetReturnType2P1Test022
     * @tc.desc Verify getReturnType returns void when constructor has two string parameters (TwoStrCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoStrCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_2300     
     * @tc.name testConstructorGetReturnType2P1Test023
     * @tc.desc Verify getReturnType returns void for no-arg constructor in two-constructor class (TwoCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoCtorCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_2400     
     * @tc.name testConstructorGetReturnType2P1Test024
     * @tc.desc Verify getReturnType returns void for no-arg constructor in three-constructor class (ThreeCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeCtorCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_2500     
     * @tc.name testConstructorGetReturnType2P1Test025
     * @tc.desc Verify getReturnType returns void for string-param constructor in TwoCtorCls3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoCtorCls3>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_2600     
     * @tc.name testConstructorGetReturnType2P1Test026
     * @tc.desc Verify getReturnType returns void for long-param constructor in TwoCtorCls4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoCtorCls4>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_2700     
     * @tc.name testConstructorGetReturnType2P1Test027
     * @tc.desc Verify getReturnType returns void when constructor calls private init method (InitMethodCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InitMethodCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_2800     
     * @tc.name testConstructorGetReturnType2P1Test028
     * @tc.desc Verify getReturnType returns void for class with protected field constructor (ProtectFieldCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectFieldCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_2900     
     * @tc.name testConstructorGetReturnType2P1Test029
     * @tc.desc Verify getReturnType returns void for constructor initializing multiple fields (MultiInitCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiInitCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_3000     
     * @tc.name testConstructorGetReturnType2P1Test030
     * @tc.desc Verify two different constructors of the same class return the same type name (EqOverloadCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<EqOverloadCls>().getConstructors();
      let n0 = ctors[0].getReturnType().getName();
      let n1 = ctors[1].getReturnType().getName();
      expect(n0).assertEqual("void");
      expect(n1).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_3100     
     * @tc.name testConstructorGetReturnType2P1Test031
     * @tc.desc Verify constructors from different classes return the same type name (EmptyCls, StringFieldWithMethod)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nA = Class.from<EmptyCls>().getConstructors()[0].getReturnType().getName();
      let nB = Class.from<StringFieldWithMethod>().getConstructors()[0].getReturnType().getName();
      expect(nA).assertEqual("void");
      expect(nB).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_3200     
     * @tc.name testConstructorGetReturnType2P1Test032
     * @tc.desc Verify getReturnType returns void for compact class with int parameter (CompactIntCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<CompactIntCls>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_3300     
     * @tc.name testConstructorGetReturnType2P1Test033
     * @tc.desc Verify getReturnType returns void for compact class with long parameter (PubLongParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<PubLongParam>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_3400     
     * @tc.name testConstructorGetReturnType2P1Test034
     * @tc.desc Verify getReturnType returns void for constructor with five different parameter types (FiveParamCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<FiveParamCls>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_3500     
     * @tc.name testConstructorGetReturnType2P1Test035
     * @tc.desc Verify getReturnType returns void after getParametersNum call (ParamCountCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      let paramNum = ctor.getParametersNum();
      expect(paramNum).assertEqual(2);
      let retName = ctor.getReturnType().getName();
      expect(retName).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_3600     
     * @tc.name testConstructorGetReturnType2P1Test036
     * @tc.desc Verify isAbstract returns true on void return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<EmptyCls>().getConstructors()[0].getReturnType();
      expect(rt.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_3700     
     * @tc.name testConstructorGetReturnType2P1Test037
     * @tc.desc Verify getConstructors empty on void return type of CtorCombineComplexParam constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<CtorCombineComplexParam>().getConstructors()[0].getReturnType();
      let arr = rt.getConstructors();
      expect(arr.length).assertEqual(0);
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_3800     
     * @tc.name testConstructorGetReturnType2P1Test038
     * @tc.desc Verify void return type combines getName, isPrimitive, isInterface checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<EmptyCls>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.isPrimitive()).assertTrue();
      expect(rt.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_3900     
     * @tc.name testConstructorGetReturnType2P1Test039
     * @tc.desc Verify void return type of Map-param constructor has primitive flag and no sub-constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt: Class = Class.from<Ctor_MapStrInt>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.isPrimitive()).assertTrue();
      expect(rt.getConstructors().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_4000     
     * @tc.name testConstructorGetReturnType2P1Test040
     * @tc.desc Verify getReturnType returns void for class that initializes this in constructor (InitThisCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<InitThisCls>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_4100     
     * @tc.name testConstructorGetReturnType2P1Test041
     * @tc.desc Verify getReturnType returns void for class with conditional branching in constructor (BranchCtor)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<BranchCtor>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_4200     
     * @tc.name testConstructorGetReturnType2P1Test042
     * @tc.desc Verify getReturnType returns void for class with for loop in constructor (LoopBodyCtor)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<LoopBodyCtor>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_4300     
     * @tc.name testConstructorGetReturnType2P1Test043
     * @tc.desc Verify getReturnType returns void for class creating objects in constructor (CreateInCtor)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<CreateInCtor>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_4400     
     * @tc.name testConstructorGetReturnType2P1Test044
     * @tc.desc Verify getReturnType returns void for class with enum parameter (EnumUserCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<EnumUserCls>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_4500     
     * @tc.name testConstructorGetReturnType2P1Test045
     * @tc.desc Verify void return type isPrimitive true, isInterface false, getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<EmptyCls>().getConstructors()[0].getReturnType();
      expect(rt.isPrimitive()).assertTrue();
      expect(rt.isInterface()).assertFalse();
      expect(rt.getConstructors().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_4600     
     * @tc.name testConstructorGetReturnType2P1Test046
     * @tc.desc Verify getReturnType returns void for class whose constructor throws (ThrowInCtor)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ThrowInCtor>().getConstructors()[0];
      let rtName = ctor.getReturnType().getName();
      expect(rtName).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_4700     
     * @tc.name testConstructorGetReturnType2P1Test047
     * @tc.desc Verify getReturnType returns void for class whose constructor conditionally throws (ThrowParamCtor)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ThrowParamCtor>().getConstructors()[0];
      let rtName = ctor.getReturnType().getName();
      expect(rtName).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_4800     
     * @tc.name testConstructorGetReturnType2P1Test048
     * @tc.desc Verify getReturnType stays void after getParametersNum on throwing constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ThrowInCtor>().getConstructors()[0];
      let pn = ctor.getParametersNum();
      expect(pn).assertEqual(0);
      let rtName = ctor.getReturnType().getName();
      expect(rtName).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_4900     
     * @tc.name testConstructorGetReturnType2P1Test049
     * @tc.desc Verify getReturnType returns void on WrongArgCtor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<WrongArgCtor>().getConstructors()[0];
      let rtName = ctor.getReturnType().getName();
      expect(rtName).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_5000     
     * @tc.name testConstructorGetReturnType2P1Test050
     * @tc.desc Verify getReturnType of ExtChainE constructor yields object Class named void not array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtChainE>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.getName().includes("Array")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_5100     
     * @tc.name testConstructorGetReturnType2P1Test051
     * @tc.desc Verify all LoopCtorCls overloaded constructors return void primitive type via loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<LoopCtorCls>().getConstructors();
      for (let i = 0; i < ctors.length; i++) {
        let rt = ctors[i].getReturnType();
        expect(rt.getName()).assertEqual("void");
        expect(rt.isPrimitive()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_5200     
     * @tc.name testConstructorGetReturnType2P1Test052
     * @tc.desc Verify getReturnType stays void after createInstance on CreateInCtor constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CreateInCtor>().getConstructors()[0];
      let before = ctor.getReturnType().getName();
      ctor.createInstance();
      let after = ctor.getReturnType().getName();
      expect(before).assertEqual("void");
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_5300     
     * @tc.name testConstructorGetReturnType2P1Test053
     * @tc.desc Verify getReturnType returns void for 3-level parameterized inheritance (LevelSubSub)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<LevelSubSub>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_5400     
     * @tc.name testConstructorGetReturnType2P1Test054
     * @tc.desc Verify getReturnType returns void for 3-level parameterized inheritance (LevelSub)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<LevelSub>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_5500     
     * @tc.name testConstructorGetReturnType2P1Test055
     * @tc.desc Verify getReturnType returns void for 3-level parameterized inheritance root (LevelBase)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<LevelBase>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_5600     
     * @tc.name testConstructorGetReturnType2P1Test056
     * @tc.desc Verify all levels in 3-level param chain return same type name (LevelSubSub vs root class)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leafName = Class.from<LevelSubSub>().getConstructors()[0].getReturnType().getName();
      let rootName = Class.from<TcTwoPubA>().getConstructors()[0].getReturnType().getName();
      expect(leafName).assertEqual(rootName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_5700     
     * @tc.name testConstructorGetReturnType2P1Test057
     * @tc.desc Verify getReturnType returns void for first constructor of FourCtorCls (no-arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<FourCtorCls>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_5800     
     * @tc.name testConstructorGetReturnType2P1Test058
     * @tc.desc Verify all 5 constructors of FiveCtorCls return void via loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<FiveCtorCls>().getConstructors();
      for (let i = 0; i < ctors.length; i++) {
        expect(ctors[i].getReturnType().getName()).assertEqual("void");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_5900     
     * @tc.name testConstructorGetReturnType2P1Test059
     * @tc.desc Verify getReturnType returns void when constructor has string array parameter (CtorStrArrParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorStrArrParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_6000     
     * @tc.name testConstructorGetReturnType2P1Test060
     * @tc.desc Verify getReturnType returns void when constructor has boolean array parameter (CtorBoolArrParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorBoolArrParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_6100     
     * @tc.name testConstructorGetReturnType2P1Test061
     * @tc.desc Verify getReturnType returns void when constructor has double array parameter (CtorDoubleArrParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorDoubleArrParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_6200     
     * @tc.name testConstructorGetReturnType2P1Test062
     * @tc.desc Verify getReturnType returns void when constructor has multi-dimensional int array parameter (CtorMultiDimArrParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMultiDimArrParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_6300     
     * @tc.name testConstructorGetReturnType2P1Test063
     * @tc.desc Verify getReturnType returns void when constructor has Map<string, int> parameter (CtorMapParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMapParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_6400     
     * @tc.name testConstructorGetReturnType2P1Test064
     * @tc.desc Verify getReturnType returns void when constructor has Set<int> parameter (CtorSetParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorSetParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_6500     
     * @tc.name testConstructorGetReturnType2P1Test065
     * @tc.desc Verify getReturnType returns void when constructor has Array<int> parameter (CtorArrayIntParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorArrayIntParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_6600     
     * @tc.name testConstructorGetReturnType2P1Test066
     * @tc.desc Verify getReturnType returns void when constructor has Array<string> parameter (CtorArrayStrParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorArrayStrParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_6700     
     * @tc.name testConstructorGetReturnType2P1Test067
     * @tc.desc Verify getReturnType returns void when constructor has FixedArray<string> parameter (CtorFixedArrStrParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorFixedArrStrParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_6800     
     * @tc.name testConstructorGetReturnType2P1Test068
     * @tc.desc Verify getReturnType returns void when constructor has custom class parameter (CtorCustomParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorCustomParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_6900     
     * @tc.name testConstructorGetReturnType2P1Test069
     * @tc.desc Verify getReturnType returns void for Constructor-typed parameter constructor (Ctor_ConstructorParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ctor_ConstructorParam>().getConstructors()[0];
      let rt = ctor.getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.getConstructors().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_7000     
     * @tc.name testConstructorGetReturnType2P1Test070
     * @tc.desc Verify void return type of IntFieldCls default constructor is primitive non-interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<IntFieldCls>().getConstructors()[0];
      let rt: Class = ctor.getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.isPrimitive()).assertTrue();
      expect(rt.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_7100     
     * @tc.name testConstructorGetReturnType2P1Test071
     * @tc.desc Verify getReturnType returns void for constructor in interface-implementing class (ImplInterfaceCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplInterfaceCtorCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_7200     
     * @tc.name testConstructorGetReturnType2P1Test072
     * @tc.desc Verify getReturnType returns void when constructor has float and char parameters (CtorFloatCharParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorFloatCharParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_7300     
     * @tc.name testConstructorGetReturnType2P1Test073
     * @tc.desc Verify getReturnType returns void when constructor has all 9 primitive types (CtorAllPrimitivesParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorAllPrimitivesParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_7400     
     * @tc.name testConstructorGetReturnType2P1Test074
     * @tc.desc Verify getReturnType returns void when constructor has 5 string parameters (Ctor5StrParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor5StrParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_7500     
     * @tc.name testConstructorGetReturnType2P1Test075
     * @tc.desc Verify getReturnType returns void when constructor has 5 int parameters (Ctor5IntParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor5IntParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_7600     
     * @tc.name testConstructorGetReturnType2P1Test076
     * @tc.desc Verify getReturnType returns void when constructor has 3 boolean parameters (Ctor3BoolParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor3BoolParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_7700     
     * @tc.name testConstructorGetReturnType2P1Test077
     * @tc.desc Verify getReturnType returns void when constructor has 4 double parameters (Ctor4DoubleParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor4DoubleParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_7800     
     * @tc.name testConstructorGetReturnType2P1Test078
     * @tc.desc Verify getReturnType returns void when constructor has 6 mixed type parameters (Ctor6MixedParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor6MixedParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_7900     
     * @tc.name testConstructorGetReturnType2P1Test079
     * @tc.desc Verify getReturnType returns void when constructor has string[], int[], boolean[] combination (CtorCombineArraysParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorCombineArraysParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_8000     
     * @tc.name testConstructorGetReturnType2P1Test080
     * @tc.desc Verify getReturnType returns void when constructor has FixedArray, Array, Map combination (CtorCombineCollectionsParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorCombineCollectionsParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_8100     
     * @tc.name testConstructorGetReturnType2P1Test081
     * @tc.desc Verify getReturnType returns void when constructor has double extremes combination (CtorDoubleExtremesParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorDoubleExtremesParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_8200     
     * @tc.name testConstructorGetReturnType2P1Test082
     * @tc.desc Verify getReturnType returns void when constructor has nested generic Array<Array<int>> parameter (CtorNestedGenericParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorNestedGenericParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_8300     
     * @tc.name testConstructorGetReturnType2P1Test083
     * @tc.desc Verify getReturnType returns void when constructor has complex generic Map<string, Array<int>> parameter (CtorComplexGenericParam)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorComplexGenericParam>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_8400     
     * @tc.name testConstructorGetReturnType2P1Test084
     * @tc.desc Verify getName length equals 4 for void return type from dual-param constructor (ExtLenC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtLenC>().getConstructors()[0].getReturnType();
      expect(rt.getName().length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_8500     
     * @tc.name testConstructorGetReturnType2P1Test085
     * @tc.desc Verify getName does not include 'Array' for void return type from int-string-param constructor (ExtArrC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtArrC>().getConstructors()[0].getReturnType();
      expect(rt.getName().includes("Array")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP1_8600     
     * @tc.name testConstructorGetReturnType2P1Test086
     * @tc.desc Verify isFinal returns true for void return type from no-arg constructor (EmptyCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetReturnType2P1Test086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<EmptyCls>().getConstructors()[0].getReturnType();
      expect(rt.isFinal()).assertTrue();
    });
  });
}
