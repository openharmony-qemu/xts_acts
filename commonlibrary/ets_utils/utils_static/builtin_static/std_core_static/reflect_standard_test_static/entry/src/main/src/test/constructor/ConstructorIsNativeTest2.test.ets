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

import {GN_P5,Eq02_B,Eq02_C,GenExt,GenOne,GenTwo,ParentD,AbsClass,Concrete,DerivedC,DerivedD,EmptyCls,GenBound,HasField,CtorMulti,Eq04_StrP,GenMethod,HasGetter,HasSetter,MixedArgs,Over2Idx0,Over2Idx1,Over3Idx0,Over4Idx0,Over5Idx0,TcTwoPubA,BooleanArg,BothGetSet,EqOneParam,GenDefault,ManyFields,StaticOnly,TwoSameInt,Ext2_GenBox,HasReadonly,CtorOverload,Ext4_GenChar,ImplRunnable,Ext4_BaseChar,Ext4_CharImpl,Ext_ByteParam,Ext_LongParam,IN_IntArrCtor,ParamCountCls,AfterParamType,Ext3_ImplIface,Ext_FloatParam,Ext_ShortParam,HasStaticField,Ext2_ManyFields,Ext3_TwoGeneric,Ext_DoubleParam,HasStaticMethod,IN_RefOuterCtor,DoubleFieldClass,Ext3_AllDefaults,Ext3_HasSetParam,Ext4_DerivedChar,Ext4_GenFixedArr,Ext_LoopBodyCtor,Ext2_DerivedSuper,Ext2_GetterMethod,Ext2_ThreeGeneric,Ext2_TryCatchBody,Ext2_TwoFloatCtor,Ext4_BaseFixedArr,Ext4_CharOptParam,Ext4_FixedArrImpl,Ext_EmptyBodyCtor,Ext_MixedNumTypes,IN_EightParamCtor,Ext2_ArrayStrParam,Ext2_InitLogicCtor,Ext2_ThrowBodyCtor,Ext2_TwentyIntCtor,Ext4_CharStringMix,Ext_BranchBodyCtor,Ext_HasObjectField,IP2_110_PubDefBool,Ext2_BoundedGeneric,Ext2_LongDoubleCtor,Ext2_MultiContainer,Ext2_SwitchBodyCtor,Ext4_BoundedGenChar,Ext4_FixedArrIntMix,Ext4_MixedQuadParam,Ext2_AllNumericTypes,Ext2_MapStrBoolParam,Ext2_PrivateFieldCls,Ext4_CharFixedArrMix,Ext4_DerivedFixedArr,Ext4_TwoGenCharFixed,Ext_NestedArrayParam,Ext2_ByteShortIntCtor,Ext2_FifteenParamCtor,Ext2_NestedIfElseCtor,Ext4_FixedArrOptParam,Ext2_MixedPrivatePublic,GO2_Ext_AbstractGeneric,Ext2_StaticInstanceField,} from "../Util.test";

export default function ConstructorIsNativeTest2(): void {
  describe("ConstructorIsNativeTest2", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0010
     * @tc.name testConstructorIsNative2Test001
     * @tc.desc Verify isNative returns false for EmptyCls and getName returns constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0020
     * @tc.name testConstructorIsNative2Test002
     * @tc.desc Verify isNative returns false for EmptyCls and getParametersNum equals getParameterTypes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(ctor.getParameterTypes().length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0030
     * @tc.name testConstructorIsNative2Test003
     * @tc.desc Verify isNative returns false for EmptyCls and getReturnType is void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0040
     * @tc.name testConstructorIsNative2Test004
     * @tc.desc Verify isNative returns false for EmptyCls and getParameterTypes length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterTypes().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0050
     * @tc.name testConstructorIsNative2Test005
     * @tc.desc Verify isNative returns false for EmptyCls and getParametersNum is not 1 for 0-param constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0060
     * @tc.name testConstructorIsNative2Test006
     * @tc.desc Verify isNative returns false for EmptyCls and isPublic returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0070
     * @tc.name testConstructorIsNative2Test007
     * @tc.desc Verify isNative returns false for EmptyCls and isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0080
     * @tc.name testConstructorIsNative2Test008
     * @tc.desc Verify isNative returns false for EmptyCls and isProtected returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0090
     * @tc.name testConstructorIsNative2Test009
     * @tc.desc Verify isNative returns false for Eq02_B and first param type name contains 'f64' (internal for number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Eq02_B>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterType(0)!.getName().includes("f64")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0100
     * @tc.name testConstructorIsNative2Test010
     * @tc.desc Verify isNative returns false for Eq04_StrP and first param type name contains 'String' (internal for string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Eq04_StrP>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterType(0)!.getName().includes("String")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0110
     * @tc.name testConstructorIsNative2Test011
     * @tc.desc Verify isNative returns false for BooleanArg and first param type name contains 'u1' (internal for boolean)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<BooleanArg>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterType(0)!.getName().includes("u1")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0120
     * @tc.name testConstructorIsNative2Test012
     * @tc.desc Verify isNative returns false for CtorOverload and getParametersNum is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CtorOverload>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0130
     * @tc.name testConstructorIsNative2Test013
     * @tc.desc Verify isNative returns false for Ext_ByteParam and getParameterTypes length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext_ByteParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterTypes().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0140
     * @tc.name testConstructorIsNative2Test014
     * @tc.desc Verify isNative returns false for CtorMulti and getParametersNum is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CtorMulti>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0150
     * @tc.name testConstructorIsNative2Test015
     * @tc.desc Verify isNative returns false for AfterParamType and getParametersNum is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<AfterParamType>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0160
     * @tc.name testConstructorIsNative2Test016
     * @tc.desc Verify isNative returns false for HasField and owner name is HasField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<HasField>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("HasField")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0170
     * @tc.name testConstructorIsNative2Test017
     * @tc.desc Verify isNative returns false for ParentD and getReturnType is void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParentD>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0180
     * @tc.name testConstructorIsNative2Test018
     * @tc.desc Verify isNative returns false for HasGetter and isPublic returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<HasGetter>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0190
     * @tc.name testConstructorIsNative2Test019
     * @tc.desc Verify isNative returns false for HasSetter and isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<HasSetter>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0200
     * @tc.name testConstructorIsNative2Test020
     * @tc.desc Verify isNative returns false for HasStaticField and isProtected returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<HasStaticField>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0210
     * @tc.name testConstructorIsNative2Test021
     * @tc.desc Verify isNative returns false for HasStaticMethod and getParametersNum is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<HasStaticMethod>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0220
     * @tc.name testConstructorIsNative2Test022
     * @tc.desc Verify isNative returns false for HasReadonly and getParameterTypes length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<HasReadonly>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterTypes().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0230
     * @tc.name testConstructorIsNative2Test023
     * @tc.desc Verify isNative returns false for AbsClass and owner name is AbsClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<AbsClass>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("AbsClass")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0240
     * @tc.name testConstructorIsNative2Test024
     * @tc.desc Verify isNative returns false for BothGetSet and owner isAbstract returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<BothGetSet>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0250
     * @tc.name testConstructorIsNative2Test025
     * @tc.desc Verify isNative returns false for EmptyCls and getParametersNum is 0 and getParameterType(0) throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(0);
      try {
        ctor.getParameterType(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0260
     * @tc.name testConstructorIsNative2Test026
     * @tc.desc Verify isNative returns false for StaticOnly and isPublic returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StaticOnly>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0270
     * @tc.name testConstructorIsNative2Test027
     * @tc.desc Verify isNative returns false for Ext2_GetterMethod and owner name is Ext2_GetterMethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_GetterMethod>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext2_GetterMethod")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0280
     * @tc.name testConstructorIsNative2Test028
     * @tc.desc Verify isNative returns false for Ext2_AllNumericTypes and getParametersNum is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_AllNumericTypes>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0290
     * @tc.name testConstructorIsNative2Test029
     * @tc.desc Verify isNative returns false for Ext2_StaticInstanceField and getParametersNum is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_StaticInstanceField>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0300
     * @tc.name testConstructorIsNative2Test030
     * @tc.desc Verify isNative returns false for Over2Idx0 and owner name is Over2Idx0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Over2Idx0>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Over2Idx0")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0310
     * @tc.name testConstructorIsNative2Test031
     * @tc.desc Verify isNative returns false for Over2Idx1 and owner name is Over2Idx1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Over2Idx1>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Over2Idx1")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0320
     * @tc.name testConstructorIsNative2Test032
     * @tc.desc Verify isNative returns false for Over3Idx0 and owner name is Over3Idx0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Over3Idx0>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Over3Idx0")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0330
     * @tc.name testConstructorIsNative2Test033
     * @tc.desc Verify isNative returns false for Over4Idx0 and owner name is Over4Idx0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Over4Idx0>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Over4Idx0")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0340
     * @tc.name testConstructorIsNative2Test034
     * @tc.desc Verify isNative returns false for the single constructor of Over4Idx0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Over4Idx0>().getConstructors();
      expect(ctors.length).assertEqual(1);
      for (let i = 0; i < ctors.length; i++) {
        expect(ctors[i].isNative()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0350
     * @tc.name testConstructorIsNative2Test035
     * @tc.desc Verify isNative returns false for Over5Idx0 and owner name is Over5Idx0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Over5Idx0>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Over5Idx0")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0360
     * @tc.name testConstructorIsNative2Test036
     * @tc.desc Verify isNative returns false and isPublic returns true for Over5Idx0 owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Over5Idx0>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.getOwner().getName().includes("Over5Idx0")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0370
     * @tc.name testConstructorIsNative2Test037
     * @tc.desc Verify isNative returns false for EmptyCls and owner name is EmptyCls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("EmptyCls")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0380
     * @tc.name testConstructorIsNative2Test038
     * @tc.desc Verify isNative returns false for ImplRunnable and owner name is ImplRunnable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ImplRunnable>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("ImplRunnable")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0390
     * @tc.name testConstructorIsNative2Test039
     * @tc.desc Verify isNative returns false for GO2_Ext_AbstractGeneric and owner name is GO2_Ext_AbstractGeneric
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GO2_Ext_AbstractGeneric<int>>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("GO2_Ext_AbstractGeneric")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0400
     * @tc.name testConstructorIsNative2Test040
     * @tc.desc Verify isNative returns false for Concrete and owner name is Concrete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Concrete>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Concrete")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0410
     * @tc.name testConstructorIsNative2Test041
     * @tc.desc Verify isNative returns false for DerivedC and owner name is DerivedC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DerivedC>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("DerivedC")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0420
     * @tc.name testConstructorIsNative2Test042
     * @tc.desc Verify isNative returns false for DerivedD and owner name is DerivedD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DerivedD>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("DerivedD")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0430
     * @tc.name testConstructorIsNative2Test043
     * @tc.desc Verify isNative returns false for Ext2_DerivedSuper and owner name is Ext2_DerivedSuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_DerivedSuper>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext2_DerivedSuper")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0440
     * @tc.name testConstructorIsNative2Test044
     * @tc.desc Verify isNative returns false for GenOne and getParametersNum is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GenOne<number>>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0450
     * @tc.name testConstructorIsNative2Test045
     * @tc.desc Verify isNative returns false for ManyFields and owner name is ManyFields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ManyFields>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("ManyFields")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0460
     * @tc.name testConstructorIsNative2Test046
     * @tc.desc Verify isNative returns false for Ext2_ManyFields and owner name is Ext2_ManyFields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_ManyFields>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext2_ManyFields")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0470
     * @tc.name testConstructorIsNative2Test047
     * @tc.desc Verify isNative returns false for Ext_ByteParam and first param type name contains 'i8' (internal for byte)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext_ByteParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterType(0)!.getName().includes("i8")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0480
     * @tc.name testConstructorIsNative2Test048
     * @tc.desc Verify isNative returns false for Ext_ShortParam and first param type name contains 'i16' (internal for short)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext_ShortParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterType(0)!.getName().includes("i16")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0490
     * @tc.name testConstructorIsNative2Test049
     * @tc.desc Verify isNative returns false for Ext_LongParam and first param type name contains 'i64' (internal for long)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext_LongParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterType(0)!.getName().includes("i64")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0500
     * @tc.name testConstructorIsNative2Test050
     * @tc.desc Verify isNative returns false for Ext_FloatParam and first param type name contains 'f32' (internal for float)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext_FloatParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterType(0)!.getName().includes("f32")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0510
     * @tc.name testConstructorIsNative2Test051
     * @tc.desc Verify isNative returns false for Ext_DoubleParam and first param type name contains 'f64' (internal for double)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext_DoubleParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterType(0)!.getName().includes("f64")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0520
     * @tc.name testConstructorIsNative2Test052
     * @tc.desc Verify isNative returns false for Ext2_FifteenParamCtor and getParametersNum is 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_FifteenParamCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0530
     * @tc.name testConstructorIsNative2Test053
     * @tc.desc Verify isNative returns false for IN_IntArrCtor and owner name is IN_IntArrCtor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<IN_IntArrCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("IN_IntArrCtor")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0540
     * @tc.name testConstructorIsNative2Test054
     * @tc.desc Verify isNative returns false for IN_EightParamCtor and getParametersNum is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<IN_EightParamCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0550
     * @tc.name testConstructorIsNative2Test055
     * @tc.desc Verify isNative returns false for IN_RefOuterCtor and owner name is IN_RefOuterCtor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<IN_RefOuterCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("IN_RefOuterCtor")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0560
     * @tc.name testConstructorIsNative2Test056
     * @tc.desc Verify isNative returns false for Ext2_ByteShortIntCtor and getParametersNum is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_ByteShortIntCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0570
     * @tc.name testConstructorIsNative2Test057
     * @tc.desc Verify isNative returns false for Ext2_MapStrBoolParam and owner name is Ext2_MapStrBoolParam
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_MapStrBoolParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext2_MapStrBoolParam")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0580
     * @tc.name testConstructorIsNative2Test058
     * @tc.desc Verify isNative returns false for Ext_NestedArrayParam and owner name is Ext_NestedArrayParam
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext_NestedArrayParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext_NestedArrayParam")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0590
     * @tc.name testConstructorIsNative2Test059
     * @tc.desc Verify isNative returns false for Ext2_ArrayStrParam and getParameterType(0) name contains 'Array' (std.core.Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_ArrayStrParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterType(0)!.getName().includes("Array")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0600
     * @tc.name testConstructorIsNative2Test060
     * @tc.desc Verify isNative returns false for Ext_HasObjectField and owner name is Ext_HasObjectField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext_HasObjectField>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext_HasObjectField")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0610
     * @tc.name testConstructorIsNative2Test061
     * @tc.desc Verify isNative returns false for Ext_BranchBodyCtor and owner name is Ext_BranchBodyCtor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext_BranchBodyCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext_BranchBodyCtor")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0620
     * @tc.name testConstructorIsNative2Test062
     * @tc.desc Verify isNative returns false for Ext_LoopBodyCtor and owner name is Ext_LoopBodyCtor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext_LoopBodyCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext_LoopBodyCtor")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0630
     * @tc.name testConstructorIsNative2Test063
     * @tc.desc Verify isNative returns false for Ext2_TryCatchBody and owner name is Ext2_TryCatchBody
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_TryCatchBody>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext2_TryCatchBody")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0640
     * @tc.name testConstructorIsNative2Test064
     * @tc.desc Verify isNative returns false for Ext2_SwitchBodyCtor and owner name is Ext2_SwitchBodyCtor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_SwitchBodyCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext2_SwitchBodyCtor")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0650
     * @tc.name testConstructorIsNative2Test065
     * @tc.desc Verify isNative returns false for Ext2_ThrowBodyCtor and owner name is Ext2_ThrowBodyCtor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_ThrowBodyCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext2_ThrowBodyCtor")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0660
     * @tc.name testConstructorIsNative2Test066
     * @tc.desc Verify isNative returns false for Ext2_NestedIfElseCtor and getParametersNum is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_NestedIfElseCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0670
     * @tc.name testConstructorIsNative2Test067
     * @tc.desc Verify isNative returns false for Ext2_TwentyIntCtor and getParametersNum is 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_TwentyIntCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0680
     * @tc.name testConstructorIsNative2Test068
     * @tc.desc Verify isNative returns false for Ext2_PrivateFieldCls and owner name is Ext2_PrivateFieldCls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_PrivateFieldCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext2_PrivateFieldCls")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0690
     * @tc.name testConstructorIsNative2Test069
     * @tc.desc Verify isNative returns false for Ext2_MultiContainer and owner name is Ext2_MultiContainer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_MultiContainer>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext2_MultiContainer")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0700
     * @tc.name testConstructorIsNative2Test070
     * @tc.desc Verify isNative returns false for Ext2_MixedPrivatePublic and isPublic is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_MixedPrivatePublic>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0710
     * @tc.name testConstructorIsNative2Test071
     * @tc.desc Verify isNative returns false for MixedArgs and getParametersNum is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedArgs>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0720
     * @tc.name testConstructorIsNative2Test072
     * @tc.desc Verify isNative returns false for Ext3_AllDefaults and owner name is Ext3_AllDefaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext3_AllDefaults>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext3_AllDefaults")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0730
     * @tc.name testConstructorIsNative2Test073
     * @tc.desc Verify isNative returns false for Ext3_ImplIface and owner name is Ext3_ImplIface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext3_ImplIface>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext3_ImplIface")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0740
     * @tc.name testConstructorIsNative2Test074
     * @tc.desc Verify isNative returns false for Ext3_HasSetParam and owner name is Ext3_HasSetParam
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext3_HasSetParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext3_HasSetParam")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0750
     * @tc.name testConstructorIsNative2Test075
     * @tc.desc Verify isNative returns false for Error class constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Error>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0760
     * @tc.name testConstructorIsNative2Test076
     * @tc.desc Verify isNative returns false for Date class constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Date>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0770
     * @tc.name testConstructorIsNative2Test077
     * @tc.desc Verify isNative returns false for RegExp class constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<RegExp>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0780
     * @tc.name testConstructorIsNative2Test078
     * @tc.desc Verify isNative returns false for StringBuilder class constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringBuilder>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0790
     * @tc.name testConstructorIsNative2Test079
     * @tc.desc Verify isNative returns false for Object class constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Object>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0800
     * @tc.name testConstructorIsNative2Test080
     * @tc.desc Verify isNative consistency: built-in and user class both return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let builtinResult = Class.from<Array<int>>().getConstructors()[0].isNative();
      let userResult = Class.from<EmptyCls>().getConstructors()[0].isNative();
      expect(builtinResult).assertFalse();
      expect(userResult).assertFalse();
      expect(builtinResult).assertEqual(userResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0810
     * @tc.name testConstructorIsNative2Test081
     * @tc.desc Verify isNative stable after calling getParameterTypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DoubleFieldClass>().getConstructors()[0];
      ctor.getParameterTypes();
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0820
     * @tc.name testConstructorIsNative2Test082
     * @tc.desc Verify isNative stable after calling getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Eq02_C>().getConstructors()[0];
      ctor.getParametersNum();
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0830
     * @tc.name testConstructorIsNative2Test083
     * @tc.desc Verify isNative stable after calling equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      ctor.equals(ctor);
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0840
     * @tc.name testConstructorIsNative2Test084
     * @tc.desc Verify isNative stable after getParameterType(-1) throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcTwoPubA>().getConstructors()[0];
      try {
        ctor.getParameterType(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0850
     * @tc.name testConstructorIsNative2Test085
     * @tc.desc Verify isNative stable before and after equals with different constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcTwoPubA>().getConstructors()[0];
      let other = Class.from<TwoSameInt>().getConstructors()[0];
      let before = ctor.isNative();
      ctor.equals(other);
      let after = ctor.isNative();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0860
     * @tc.name testConstructorIsNative2Test086
     * @tc.desc Verify isNative stable after createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcTwoPubA>().getConstructors()[0];
      ctor.isNative();
      ctor.createInstance([42]);
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0870
     * @tc.name testConstructorIsNative2Test087
     * @tc.desc Verify isNative consistent across separate Class.from instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = Class.from<TcTwoPubA>().getConstructors()[0].isNative();
      let r2 = Class.from<TcTwoPubA>().getConstructors()[0].isNative();
      let r3 = Class.from<TcTwoPubA>().getConstructors()[0].isNative();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0880
     * @tc.name testConstructorIsNative2Test088
     * @tc.desc Verify isNative consistent on generic class across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_GenBox<string>>().getConstructors()[0];
      let nativeFirst = ctor.isNative();
      let nativeSecond = ctor.isNative();
      let nativeThird = ctor.isNative();
      expect(nativeFirst).assertEqual(nativeSecond);
      expect(nativeSecond).assertEqual(nativeThird);
      expect(nativeFirst).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0890
     * @tc.name testConstructorIsNative2Test089
     * @tc.desc Verify isNative false and getParametersNum correct for IP2_110_PubDefBool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<IP2_110_PubDefBool>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0900
     * @tc.name testConstructorIsNative2Test090
     * @tc.desc Verify isNative false and getParametersNum correct for TcTwoPubA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcTwoPubA>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0910
     * @tc.name testConstructorIsNative2Test091
     * @tc.desc Verify isNative false and getParametersNum correct for TwoSameInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TwoSameInt>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0920
     * @tc.name testConstructorIsNative2Test092
     * @tc.desc Verify getParameterType unchanged before and after isNative and isNative returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      let typeBefore = ctor.getParameterType(0);
      ctor.isNative();
      let typeAfter = ctor.getParameterType(0);
      expect(ctor.isNative()).assertFalse();
      expect(typeAfter).assertEqual(typeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0930
     * @tc.name testConstructorIsNative2Test093
     * @tc.desc Verify isNative returns false for multiple user-defined classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<EmptyCls>().getConstructors()[0].isNative()).assertFalse();
      expect(Class.from<TcTwoPubA>().getConstructors()[0].isNative()).assertFalse();
      expect(Class.from<ParamCountCls>().getConstructors()[0].isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0940
     * @tc.name testConstructorIsNative2Test094
     * @tc.desc Verify isNative false for Ext4_BaseChar and first param type name contains 'u16' (internal for char)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_BaseChar>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterType(0)!.getName().includes("u16")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0950
     * @tc.name testConstructorIsNative2Test095
     * @tc.desc Verify isNative false for Ext4_BaseFixedArr and first param type name contains 'Int[]' (internal for FixedArray)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_BaseFixedArr>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParameterType(0)!.getName().includes("Int[]")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0960
     * @tc.name testConstructorIsNative2Test096
     * @tc.desc Verify isNative false for Ext4_CharStringMix and getParametersNum is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_CharStringMix>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0970
     * @tc.name testConstructorIsNative2Test097
     * @tc.desc Verify isNative false for Ext4_CharOptParam and getParametersNum is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_CharOptParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0980
     * @tc.name testConstructorIsNative2Test098
     * @tc.desc Verify isNative false for Ext4_FixedArrOptParam and owner name is Ext4_FixedArrOptParam
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_FixedArrOptParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext4_FixedArrOptParam")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_0990
     * @tc.name testConstructorIsNative2Test099
     * @tc.desc Verify isNative false for Ext4_CharFixedArrMix and getParametersNum is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_CharFixedArrMix>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1000
     * @tc.name testConstructorIsNative2Test100
     * @tc.desc Verify isNative false for Ext4_DerivedChar and owner name is Ext4_DerivedChar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_DerivedChar>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext4_DerivedChar")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1010
     * @tc.name testConstructorIsNative2Test101
     * @tc.desc Verify isNative false for Ext4_CharImpl and owner name is Ext4_CharImpl
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_CharImpl>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext4_CharImpl")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1020
     * @tc.name testConstructorIsNative2Test102
     * @tc.desc Verify isNative false for Ext4_FixedArrImpl and owner name is Ext4_FixedArrImpl
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_FixedArrImpl>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext4_FixedArrImpl")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1030
     * @tc.name testConstructorIsNative2Test103
     * @tc.desc Verify isNative false for Ext4_MixedQuadParam and getParametersNum is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_MixedQuadParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1040
     * @tc.name testConstructorIsNative2Test104
     * @tc.desc Verify isNative false for Ext4_FixedArrIntMix and getParametersNum is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_FixedArrIntMix>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1050
     * @tc.name testConstructorIsNative2Test105
     * @tc.desc Verify isNative false for Ext4_DerivedFixedArr and owner name is Ext4_DerivedFixedArr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_DerivedFixedArr>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext4_DerivedFixedArr")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1060
     * @tc.name testConstructorIsNative2Test106
     * @tc.desc Verify isNative false for GN_P5 and getParametersNum is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GN_P5>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1070
     * @tc.name testConstructorIsNative2Test107
     * @tc.desc Verify isNative false for Ext_MixedNumTypes and getParametersNum is 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext_MixedNumTypes>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1080
     * @tc.name testConstructorIsNative2Test108
     * @tc.desc Verify isNative false for Ext2_InitLogicCtor and owner name is Ext2_InitLogicCtor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_InitLogicCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext2_InitLogicCtor")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1090
     * @tc.name testConstructorIsNative2Test109
     * @tc.desc Verify isNative false for Ext2_TwoFloatCtor and getParametersNum is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_TwoFloatCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1100
     * @tc.name testConstructorIsNative2Test110
     * @tc.desc Verify isNative false for Ext2_LongDoubleCtor and owner name is Ext2_LongDoubleCtor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext2_LongDoubleCtor>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("Ext2_LongDoubleCtor")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1110
     * @tc.name testConstructorIsNative2Test111
     * @tc.desc Verify isNative false for EqOneParam and owner name is EqOneParam
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EqOneParam>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.getOwner().getName().includes("EqOneParam")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1120
     * @tc.name testConstructorIsNative2Test112
     * @tc.desc Verify isNative stable after getParameterType(0) for TcTwoPubA
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcTwoPubA>().getConstructors()[0];
      let before = ctor.isNative();
      ctor.getParameterType(0);
      let after = ctor.isNative();
      expect(before).assertEqual(after);
      expect(before).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISNATIVE_Ext_1130
     * @tc.name testConstructorIsNative2Test113
     * @tc.desc Verify isNative false for Ext_EmptyBodyCtor via variable assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsNative2Test113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext_EmptyBodyCtor>().getConstructors()[0];
      let result = ctor.isNative();
      expect(result).assertFalse();
    });
  });
}
