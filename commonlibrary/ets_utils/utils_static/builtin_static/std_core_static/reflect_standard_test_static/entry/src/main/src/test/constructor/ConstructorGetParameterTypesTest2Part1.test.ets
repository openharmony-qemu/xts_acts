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
import {EmptyCls,GO2_Ext_AbstractGeneric,StringFieldWithMethod,DefaultAndRequired_Ext,FourParams,CtorMultiI,Ctor6MixedParam,SevenParams,EightParams,CtorAllPrimitivesParam,TenParams,PubDouble,IP2_110_PubDefBool,PubShortParam,PubByteParam,IP3_193_PubFloat,Ext4_CharOptParam,CustomParamCtor,TcPub19,EnumParamCtor,ObjectParamCtor_Ext,TwoSameString,TwoSameInt,ParamCountCls,BoolDoubleString,FivePrimitiveTypes,RefAndInt,TwoCustomTypes,ArrayAndPrimitive,EnumAndInt,CtorDoubleExtremesParam,StrIntStr,TcMixArr,Pub2BoolIntExt,PGN_RestWithMand,Ctor_double_String_boolean,OrdPrimitiveThenRef,FourTypesOrder,FourTypesReverse,IntBoolFloatStr,AllIndexesAccessible,ConsistencyWithNum,TwoCtorsNoArg,TwoCtorsSameArity,CtorOverload3,EqOverloadCls,OT_OverloadDefaultValue,IndepCtorTypes,FourOverloads,Ctor_long_String_double,Ctor_int_bool_String,Ctor_boolArr_intArr_StringArr,Ctor_Bool_Int_String,Ctor_Object_String_Int,GetParamTypeABC,LongParamCls,Eq02_D,ThreeParamCtor,MultiParamCtor,CI_DefaultMix,StrIntCls,PGN_Config,TwoParamCtor,} from "../Util.test";

export default function ConstructorGetParameterTypesTest2Part1(): void {
  describe("ConstructorGetParameterTypesTest2Part1", (): void => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_0100     
     * @tc.name testConstructorGetParameterTypes2P1Test001
     * @tc.desc Verify getParameterType out of range on no-arg constructor throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      let types = ctor.getParameterTypes();
      expect(types.length).assertEqual(0);
      try {
        ctor.getParameterType(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_0200     
     * @tc.name testConstructorGetParameterTypes2P1Test002
     * @tc.desc Verify getOwner call before getParameterTypes does not affect empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().getName().includes("EmptyCls")).assertTrue();
      let types = ctor.getParameterTypes();
      expect(types.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_0300     
     * @tc.name testConstructorGetParameterTypes2P1Test003
     * @tc.desc Verify constructor getName is constructor before empty getParameterTypes result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getName()).assertEqual("constructor");
      let types = ctor.getParameterTypes();
      expect(types.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_0400     
     * @tc.name testConstructorGetParameterTypes2P1Test004
     * @tc.desc Verify getParameterTypes returns std.core.String for string type single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_0500     
     * @tc.name testConstructorGetParameterTypes2P1Test005
     * @tc.desc Verify getParameterTypes returns f64 for double type single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PubDouble>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_0600     
     * @tc.name testConstructorGetParameterTypes2P1Test006
     * @tc.desc Verify getParameterTypes returns std.core.Boolean for boolean default parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP2_110_PubDefBool>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.Boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_0700     
     * @tc.name testConstructorGetParameterTypes2P1Test007
     * @tc.desc Verify getParameterTypes returns i64 for long type single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongParamCls>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("i64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_0800     
     * @tc.name testConstructorGetParameterTypes2P1Test008
     * @tc.desc Verify getParameterTypes returns i16 for short type single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PubShortParam>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("i16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_0900     
     * @tc.name testConstructorGetParameterTypes2P1Test009
     * @tc.desc Verify getParameterTypes returns i8 for byte type single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PubByteParam>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("i8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_1000     
     * @tc.name testConstructorGetParameterTypes2P1Test010
     * @tc.desc Verify getParameterTypes returns f32 for float type single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP3_193_PubFloat>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("f32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_1100     
     * @tc.name testConstructorGetParameterTypes2P1Test011
     * @tc.desc Verify getParameterTypes returns std.core.Char for optional char type single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ext4_CharOptParam>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.Char");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_1200     
     * @tc.name testConstructorGetParameterTypes2P1Test012
     * @tc.desc Verify getParameterTypes returns custom class type name for custom class single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CustomParamCtor>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName().includes("CustomType")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_1300     
     * @tc.name testConstructorGetParameterTypes2P1Test013
     * @tc.desc Verify getParameterTypes returns std.core.Array for int array single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcPub19>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_1400     
     * @tc.name testConstructorGetParameterTypes2P1Test014
     * @tc.desc Verify getParameterTypes returns std.core.Array for boolean int string array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor_boolArr_intArr_StringArr>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(3);
      expect(types[0].getName()).assertEqual("std.core.Array");
      expect(types[1].getName()).assertEqual("std.core.Array");
      expect(types[2].getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_1500     
     * @tc.name testConstructorGetParameterTypes2P1Test015
     * @tc.desc Verify getParameterTypes returns enum type name for enum single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumParamCtor>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName().includes("TestEnum")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_1600     
     * @tc.name testConstructorGetParameterTypes2P1Test016
     * @tc.desc Verify getParameterTypes returns std.core.Object for Object type single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ObjectParamCtor_Ext>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.Object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_1700     
     * @tc.name testConstructorGetParameterTypes2P1Test017
     * @tc.desc Verify getParameterTypes returns correct types for two same string type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoSameString>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual("std.core.String");
      expect(types[1].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_1800     
     * @tc.name testConstructorGetParameterTypes2P1Test018
     * @tc.desc Verify getParameterTypes returns correct types for two same int type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoSameInt>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("i32");
      expect(types[1].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_1900     
     * @tc.name testConstructorGetParameterTypes2P1Test019
     * @tc.desc Verify getParameterTypes returns int and string types for int and string parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParamCountCls>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("i32");
      expect(types[1].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_2000     
     * @tc.name testConstructorGetParameterTypes2P1Test020
     * @tc.desc Verify getParameterTypes returns boolean, f64 and std.core.String for boolean double string parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolDoubleString>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("u1");
      expect(types[1].getName()).assertEqual("f64");
      expect(types[2].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_2100     
     * @tc.name testConstructorGetParameterTypes2P1Test021
     * @tc.desc Verify getParameterTypes returns correct primitive type names for long short byte float char parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FivePrimitiveTypes>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("i64");
      expect(types[1].getName()).assertEqual("i16");
      expect(types[2].getName()).assertEqual("i8");
      expect(types[3].getName()).assertEqual("f32");
      expect(types[4].getName()).assertEqual("u16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_2200     
     * @tc.name testConstructorGetParameterTypes2P1Test022
     * @tc.desc Verify getParameterTypes returns custom class name and i32 for ref type and int parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RefAndInt>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName().includes("OrdRef")).assertTrue();
      expect(types[1].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_2300     
     * @tc.name testConstructorGetParameterTypes2P1Test023
     * @tc.desc Verify getParameterTypes returns correct type names for two different custom class parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoCustomTypes>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName().includes("TypeA")).assertTrue();
      expect(types[1].getName().includes("TypeB")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_2400     
     * @tc.name testConstructorGetParameterTypes2P1Test024
     * @tc.desc Verify getParameterTypes returns std.core.Array and std.core.String for array and primitive mixed parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayAndPrimitive>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.Array");
      expect(types[1].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_2500     
     * @tc.name testConstructorGetParameterTypes2P1Test025
     * @tc.desc Verify getParameterTypes returns enum name and i32 for enum and int mixed parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumAndInt>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName().includes("MixEnum")).assertTrue();
      expect(types[1].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_2600     
     * @tc.name testConstructorGetParameterTypes2P1Test026
     * @tc.desc Verify getParameterTypes returns all f64 for three double parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorDoubleExtremesParam>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("f64");
      expect(types[1].getName()).assertEqual("f64");
      expect(types[2].getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_2700     
     * @tc.name testConstructorGetParameterTypes2P1Test027
     * @tc.desc Verify getParameterTypes returns alternating std.core.String and i32 for string int string parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrIntStr>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.String");
      expect(types[1].getName()).assertEqual("i32");
      expect(types[2].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_2800     
     * @tc.name testConstructorGetParameterTypes2P1Test028
     * @tc.desc Verify getParameterTypes returns std.core.Array for multi-dimensional array and 1-dim array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcMixArr>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.Array");
      expect(types[1].getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_2900     
     * @tc.name testConstructorGetParameterTypes2P1Test029
     * @tc.desc Verify getParameterTypes returns boolean and i32 for flag and count parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Pub2BoolIntExt>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("u1");
      expect(types[1].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_3000     
     * @tc.name testConstructorGetParameterTypes2P1Test030
     * @tc.desc Verify getParameterTypes returns i32 and std.core.Array for int and int array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PGN_RestWithMand>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("i32");
      expect(types[1].getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_3100     
     * @tc.name testConstructorGetParameterTypes2P1Test031
     * @tc.desc Verify getParameterTypes preserves string then int parameter order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.String");
      expect(types[1].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_3200     
     * @tc.name testConstructorGetParameterTypes2P1Test032
     * @tc.desc Verify getParameterTypes returns u1 i32 std.core.String for boolean int string parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor_Bool_Int_String>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(3);
      expect(types[0].getName()).assertEqual("u1");
      expect(types[1].getName()).assertEqual("i32");
      expect(types[2].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_3300     
     * @tc.name testConstructorGetParameterTypes2P1Test033
     * @tc.desc Verify getParameterTypes preserves primitive then custom class parameter order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OrdPrimitiveThenRef>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual("i32");
      expect(types[1].getName().includes("OrdRef")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_3400     
     * @tc.name testConstructorGetParameterTypes2P1Test034
     * @tc.desc Verify getParameterTypes preserves long int short byte descending size order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FourTypesOrder>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("i64");
      expect(types[1].getName()).assertEqual("i32");
      expect(types[2].getName()).assertEqual("i16");
      expect(types[3].getName()).assertEqual("i8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_3500     
     * @tc.name testConstructorGetParameterTypes2P1Test035
     * @tc.desc Verify getParameterTypes preserves byte short int long ascending size order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FourTypesReverse>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("i8");
      expect(types[1].getName()).assertEqual("i16");
      expect(types[2].getName()).assertEqual("i32");
      expect(types[3].getName()).assertEqual("i64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_3600     
     * @tc.name testConstructorGetParameterTypes2P1Test036
     * @tc.desc Verify getParameterTypes returns i32 u1 std.core.String for int boolean string parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor_int_bool_String>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(3);
      expect(types[0].getName()).assertEqual("i32");
      expect(types[1].getName()).assertEqual("u1");
      expect(types[2].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_3700     
     * @tc.name testConstructorGetParameterTypes2P1Test037
     * @tc.desc Verify last index element is a valid Class object with correct getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let types = cls.getConstructors()[0].getParameterTypes();
      let lastType: string = types[types.length - 1].getName();
      expect(lastType).assertEqual("u1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_3800     
     * @tc.name testConstructorGetParameterTypes2P1Test038
     * @tc.desc Verify all indexes in FixedArray are accessible via subscript
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllIndexesAccessible>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.String");
      expect(types[1].getName()).assertEqual("i32");
      expect(types[2].getName()).assertEqual("f64");
      expect(types[3].getName()).assertEqual("u1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_3900     
     * @tc.name testConstructorGetParameterTypes2P1Test039
     * @tc.desc Verify each element getName returns correct type: std.core.String and std.core.Int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual("std.core.String");
      expect(types[1].getName()).assertEqual("std.core.Int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_4000     
     * @tc.name testConstructorGetParameterTypes2P1Test040
     * @tc.desc Verify exactly one of two constructors returns empty parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoCtorsNoArg>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(2);
      let emptyCount: int = 0;
      for (let i = 0; i < ctors.length; i++) {
        let types = ctors[i].getParameterTypes();
        if (types.length == 0) {
          emptyCount++;
        }
      }
      expect(emptyCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_4100     
     * @tc.name testConstructorGetParameterTypes2P1Test041
     * @tc.desc Verify FixedArray length property is stable across multiple reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamCtor>();
      let types = cls.getConstructors()[0].getParameterTypes();
      let len1: int = types.length;
      let len2: int = types.length;
      let len3: int = types.length;
      expect(len1).assertEqual(len2);
      expect(len2).assertEqual(len3);
      expect(len1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_4200     
     * @tc.name testConstructorGetParameterTypes2P1Test042
     * @tc.desc Verify FixedArray supports forward for loop iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let types = cls.getConstructors()[0].getParameterTypes();
      let count: int = 0;
      for (let i = 0; i < types.length; i++) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_4300     
     * @tc.name testConstructorGetParameterTypes2P1Test043
     * @tc.desc Verify out of bounds index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let types = cls.getConstructors()[0].getParameterTypes();
      try {
        types[100];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_4400     
     * @tc.name testConstructorGetParameterTypes2P1Test044
     * @tc.desc Verify negative index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let types = cls.getConstructors()[0].getParameterTypes();
      let idx: int = -1;
      try {
        types[idx];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_4500     
     * @tc.name testConstructorGetParameterTypes2P1Test045
     * @tc.desc Verify three calls to getParameterTypes on same constructor return consistent length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      let t1 = ctor.getParameterTypes();
      let t2 = ctor.getParameterTypes();
      let t3 = ctor.getParameterTypes();
      expect(t1.length).assertEqual(1);
      expect(t2.length).assertEqual(1);
      expect(t3.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_4600     
     * @tc.name testConstructorGetParameterTypes2P1Test046
     * @tc.desc Verify multiple calls on empty constructor all return length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      let types1 = ctor.getParameterTypes();
      let types2 = ctor.getParameterTypes();
      let types3 = ctor.getParameterTypes();
      expect(types1.length).assertEqual(0);
      expect(types2.length).assertEqual(0);
      expect(types3.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_4700     
     * @tc.name testConstructorGetParameterTypes2P1Test047
     * @tc.desc Verify getParameterTypes length is consistent with getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistencyWithNum>();
      let ctor = cls.getConstructors()[0];
      let paramCount: int = ctor.getParametersNum();
      let types = ctor.getParameterTypes();
      expect(types.length).assertEqual(paramCount);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_4800     
     * @tc.name testConstructorGetParameterTypes2P1Test048
     * @tc.desc Verify getParameterTypes is consistent with getParameterType by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      let types = ctor.getParameterTypes();
      for (let i = 0; i < types.length; i++) {
        let byTypes = types[i];
        let byIdx = ctor.getParameterType(i);
        expect(byTypes.getName()).assertEqual(byIdx!.getName());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_4900     
     * @tc.name testConstructorGetParameterTypes2P1Test049
     * @tc.desc Verify getOwner call before getParameterTypes does not affect result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      ctor.getOwner();
      let types = ctor.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_5000     
     * @tc.name testConstructorGetParameterTypes2P1Test050
     * @tc.desc Verify createInstance call before getParameterTypes does not change result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      ctor.createInstance(["hello"]);
      let types = ctor.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_5100     
     * @tc.name testConstructorGetParameterTypes2P1Test051
     * @tc.desc Verify single 1-param constructor getParameterTypes length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoCtorsNoArg>();
      let ctors = cls.getConstructors();
      let found: boolean = false;
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParametersNum() == 1) {
          expect(ctors[i].getParameterTypes().length).assertEqual(1);
          found = true;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_5200     
     * @tc.name testConstructorGetParameterTypes2P1Test052
     * @tc.desc Verify different classes return independent FixedArrays from getParameterTypes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<StringFieldWithMethod>();
      let clsB = Class.from<TwoSameInt>();
      let typesA = clsA.getConstructors()[0].getParameterTypes();
      let typesB = clsB.getConstructors()[0].getParameterTypes();
      expect(typesA.length).assertEqual(1);
      expect(typesB.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_5300     
     * @tc.name testConstructorGetParameterTypes2P1Test053
     * @tc.desc Verify two constructors where single-arg returns correct parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoCtorsNoArg>();
      let ctors = cls.getConstructors();
      let found: boolean = false;
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParametersNum() == 1) {
          let types = ctors[i].getParameterTypes();
          expect(types.length).assertEqual(1);
          expect(types[0].getName()).assertEqual("std.core.String");
          found = true;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_5400     
     * @tc.name testConstructorGetParameterTypes2P1Test054
     * @tc.desc Verify two constructors with same arity but different types each have one parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoCtorsSameArity>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(2);
      let hasString: boolean = false;
      let hasInt: boolean = false;
      for (let i = 0; i < ctors.length; i++) {
        let types = ctors[i].getParameterTypes();
        expect(types.length).assertEqual(1);
        if (types[0].getName() === "std.core.String") {
          hasString = true;
        } else {
          expect(types[0].getName()).assertEqual("i32");
          hasInt = true;
        }
      }
      expect(hasString).assertTrue();
      expect(hasInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_5500     
     * @tc.name testConstructorGetParameterTypes2P1Test055
     * @tc.desc Verify three constructors overload each return correct parameter type lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorOverload3>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(3);
      for (let i = 0; i < ctors.length; i++) {
        let num: int = ctors[i].getParametersNum();
        let types = ctors[i].getParameterTypes();
        expect(types.length).assertEqual(num);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_5600     
     * @tc.name testConstructorGetParameterTypes2P1Test056
     * @tc.desc Verify mixed no-arg and one-arg overloads return correct parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EqOverloadCls>();
      let ctors = cls.getConstructors();
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParametersNum() == 0) {
          expect(ctors[i].getParameterTypes().length).assertEqual(0);
        } else {
          expect(ctors[i].getParameterTypes()[0].getName()).assertEqual("i32");
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_5700     
     * @tc.name testConstructorGetParameterTypes2P1Test057
     * @tc.desc Verify one-arg and two-args overloads return correct parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_OverloadDefaultValue>();
      let ctors = cls.getConstructors();
      for (let i = 0; i < ctors.length; i++) {
        let num: int = ctors[i].getParametersNum();
        let types = ctors[i].getParameterTypes();
        expect(types.length).assertEqual(num);
        if (num == 2) {
          expect(types[1].getName()).assertEqual("std.core.String");
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_5800     
     * @tc.name testConstructorGetParameterTypes2P1Test058
     * @tc.desc Verify each constructor overload has independent parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IndepCtorTypes>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(2);
      let found1Param: boolean = false;
      let found2Param: boolean = false;
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParametersNum() == 2) {
          let types = ctors[i].getParameterTypes();
          expect(types[0].getName()).assertEqual("i32");
          expect(types[1].getName()).assertEqual("u1");
          found2Param = true;
        } else if (ctors[i].getParametersNum() == 1) {
          expect(ctors[i].getParameterTypes()[0].getName()).assertEqual("std.core.String");
          found1Param = true;
        }
      }
      expect(found1Param).assertTrue();
      expect(found2Param).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_5900     
     * @tc.name testConstructorGetParameterTypes2P1Test059
     * @tc.desc Verify overloads with same arity each have getParameterTypes length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoCtorsSameArity>();
      let ctors = cls.getConstructors();
      for (let i = 0; i < ctors.length; i++) {
        let types = ctors[i].getParameterTypes();
        expect(types.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_6000     
     * @tc.name testConstructorGetParameterTypes2P1Test060
     * @tc.desc Verify four overloads each have correct getParameterTypes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FourOverloads>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(4);
      let hasLen0: boolean = false,
        hasLen1: boolean = false,
        hasLen2: boolean = false,
        hasLen3: boolean = false;
      for (let i = 0; i < ctors.length; i++) {
        let len = ctors[i].getParameterTypes().length;
        if (len === 0) hasLen0 = true;
        if (len === 1) hasLen1 = true;
        if (len === 2) hasLen2 = true;
        if (len === 3) hasLen3 = true;
      }
      expect(hasLen0).assertTrue();
      expect(hasLen1).assertTrue();
      expect(hasLen2).assertTrue();
      expect(hasLen3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_6100     
     * @tc.name testConstructorGetParameterTypes2P1Test061
     * @tc.desc Verify CI_DefaultMix constructor parameter type is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CI_DefaultMix>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_6200     
     * @tc.name testConstructorGetParameterTypes2P1Test062
     * @tc.desc Verify StrIntCls constructor parameter types are correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrIntCls>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual("std.core.String");
      expect(types[1].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP1_6300     
     * @tc.name testConstructorGetParameterTypes2P1Test063
     * @tc.desc Verify PGN_Config constructor parameter types are correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterTypes2P1Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PGN_Config>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual("std.core.String");
      expect(types[1].getName()).assertEqual("i32");
    });
  });
}
