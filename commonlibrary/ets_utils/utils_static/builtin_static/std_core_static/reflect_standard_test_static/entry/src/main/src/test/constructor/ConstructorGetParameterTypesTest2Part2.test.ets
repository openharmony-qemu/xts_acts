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

import {IA_Ext,TcPub19,Ctor3int,Ctor3str,Derived2,EmptyCls,PubDouble,TcTwoPubA,Ctor_5Objs,GN_3String,GN_4String,GN3_Mix4ISBD,Ctor5StrParam,Ctor_4Customs,Ctor_HD_Param,Ctor_MapIntStr,Ctor_MapStrInt,GetParamTypeBC,NestedMapParam,NoExplicitCtor,Ctor6MixedParam,IntBoolFloatStr,SelfRefType_Ext,SevenTypesOrder,Ctor4DoubleParam,Ctor_MapVariants,Ctor_mixed_eight,GenericClass_Ext,GenericMixed_Ext,GenericMulti_Ext,PGN_FifteenParam,Ctor_ArrayListInt,Eq03_FixedBoolCls,ImplInterface_Ext,TwoArrayTypes_Ext,Ctor_15MixedParams,Ctor_AllCategories,Ctor_byte_int_long,IP2_110_PubDefBool,MultiInterface_Ext,Ctor_DoubleBoolOnly,Ctor_FixedArray_Int,Ctor_NestedFixedArr,Ctor_String_Map_Int,GenericEmptyCtorExt,IP3_183_PubClsParam,NestedTypeParam_Ext,SameCustomTwice_Int,Bool_Bool_Int_String,CtorFixedArrStrParam,Ctor_Bool_Int_String,Ctor_Bool_Object_Int,Ctor_MixedContainers,Ctor_int_bool_String,Ctor_long_short_byte,String_Int_Int_Order,Ctor_ConstructorParam,Ext4_FixedArrOptParam,StringFieldWithMethod,Ctor_Object_Object_Int,Ctor_Object_String_Int,Ctor_int_String_double,CtorSigIndependence_Ext,Ctor_long_String_double,DoubleArrayAndString_Ext,ExtendsAndImplements_Ext,Ctor_Class_Constructor_Int,Ctor_double_String_boolean,Ctor_Int_FixedArray_Map_Ref,Ctor_StringArr_int_floatArr,Ctor_float_short_double_byte,Ctor_Custom_long_Custom_float,Ctor_boolArr_intArr_StringArr,Ctor_short_byte_boolean_float,Int_FAStr_MIntBool_Str_Double,Ctor_int_String_int_String_int,Ctor_boolean_short_int_float_byte,Ctor_intArr_double_boolArr_String,Ctor_String_int_double_boolean_long,AfterGetName,Eq02_E,GN3_12Str,} from "../Util.test";
final class FinalWithInterfaceExt implements IA_Ext {
  foo(): void {
  }

public constructor(a: string) {
  }
}
export default function ConstructorGetParameterTypesTest2Part2(): void {
  describe("ConstructorGetParameterTypesTest2Part2", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_0100     
     * @tc.name testConstructorGetParameterTypes2P2Test001
     * @tc.desc Verify interface implementing class constructor parameter type is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplInterface_Ext>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_0200     
     * @tc.name testConstructorGetParameterTypes2P2Test002
     * @tc.desc Verify class that extends and implements has correct parameter type length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExtendsAndImplements_Ext>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_0300     
     * @tc.name testConstructorGetParameterTypes2P2Test003
     * @tc.desc Verify class with multiple interface implementations has correct parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiInterface_Ext>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual("std.core.String");
      expect(types[1].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_0400     
     * @tc.name testConstructorGetParameterTypes2P2Test004
     * @tc.desc Verify AfterGetName constructor parameter types (String, i32)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AfterGetName>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.String");
      expect(types[1].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_0500     
     * @tc.name testConstructorGetParameterTypes2P2Test005
     * @tc.desc Verify class with self-referencing constructor parameter type returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SelfRefType_Ext>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName().includes("SelfRefType_Ext")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_0600     
     * @tc.name testConstructorGetParameterTypes2P2Test006
     * @tc.desc Verify GenericMulti_Ext generic type parameters resolve to std.core.Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let types = Class.from<GenericMulti_Ext<int, string>>().getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual("std.core.Object");
      expect(types[1].getName()).assertEqual("std.core.Object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_0700     
     * @tc.name testConstructorGetParameterTypes2P2Test007
     * @tc.desc Verify constructor signature independence across multiple overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorSigIndependence_Ext>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(3);
      let counts: Set<number> = new Set<number>();
      for (let i = 0; i < ctors.length; i++) {
        counts.add(ctors[i].getParameterTypes().length);
      }
      expect(counts.has(1)).assertTrue();
      expect(counts.has(2)).assertTrue();
      expect(counts.has(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_0800     
     * @tc.name testConstructorGetParameterTypes2P2Test008
     * @tc.desc Verify default-param constructor (Eq02_E) returns correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Eq02_E>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.Double");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_0900     
     * @tc.name testConstructorGetParameterTypes2P2Test009
     * @tc.desc Verify GetParamTypeBC constructor parameter types are correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetParamTypeBC>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].getName()).assertEqual("std.core.String");
      expect(types[1].getName()).assertEqual("u1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_1000     
     * @tc.name testConstructorGetParameterTypes2P2Test010
     * @tc.desc Verify constructor with double array and string parameters returns correct types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleArrayAndString_Ext>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual("std.core.Array");
      expect(types[1].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_1100     
     * @tc.name testConstructorGetParameterTypes2P2Test011
     * @tc.desc Verify constructor with two different array types returns correct types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoArrayTypes_Ext>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual("std.core.Array");
      expect(types[1].getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_1200     
     * @tc.name testConstructorGetParameterTypes2P2Test012
     * @tc.desc Verify constructor with default int value still returns int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcTwoPubA>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual("std.core.Int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_1300     
     * @tc.name testConstructorGetParameterTypes2P2Test013
     * @tc.desc Verify IntBoolFloatStr parameter types ordered as i32, u1, f32, std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IntBoolFloatStr>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(4);
      expect(params[0].getName()).assertEqual("i32");
      expect(params[1].getName()).assertEqual("u1");
      expect(params[2].getName()).assertEqual("f32");
      expect(params[3].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_1400     
     * @tc.name testConstructorGetParameterTypes2P2Test014
     * @tc.desc Verify Ctor6MixedParam returns six parameter types in declared order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor6MixedParam>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(6);
      expect(params[0].getName()).assertEqual("std.core.String");
      expect(params[1].getName()).assertEqual("i32");
      expect(params[2].getName()).assertEqual("u1");
      expect(params[3].getName()).assertEqual("f64");
      expect(params[4].getName()).assertEqual("i64");
      expect(params[5].getName()).assertEqual("i16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_1500     
     * @tc.name testConstructorGetParameterTypes2P2Test015
     * @tc.desc Verify isPrimitive returns false for optional int type parameter Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcTwoPubA>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_1600     
     * @tc.name testConstructorGetParameterTypes2P2Test016
     * @tc.desc Verify isPrimitive returns false for default boolean type parameter Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP2_110_PubDefBool>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types[0].isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_1700     
     * @tc.name testConstructorGetParameterTypes2P2Test017
     * @tc.desc Verify getParameterTypes returns correct length 5 for Ctor_int_String_int_String_int with alternating types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor_int_String_int_String_int>();
      let types = cls.getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(5);
      expect(types[0].getName()).assertEqual("i32");
      expect(types[1].getName()).assertEqual("std.core.String");
      expect(types[2].getName()).assertEqual("i32");
      expect(types[3].getName()).assertEqual("std.core.String");
      expect(types[4].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_1800     
     * @tc.name testConstructorGetParameterTypes2P2Test018
     * @tc.desc Verify isPrimitive on alternating int and String positions for Ctor_int_String_int_String_int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_int_String_int_String_int>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params[2].isPrimitive()).assertTrue();
      expect(params[3].isPrimitive()).assertFalse();
      expect(params[4].isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_1900     
     * @tc.name testConstructorGetParameterTypes2P2Test019
     * @tc.desc Verify each of 8 parameter types has correct getName for Ctor_mixed_eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_mixed_eight>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params[0].getName()).assertEqual("i32");
      expect(params[1].getName()).assertEqual("u1");
      expect(params[2].getName()).assertEqual("std.core.String");
      expect(params[3].getName()).assertEqual("f64");
      expect(params[4].getName()).assertEqual("i16");
      expect(params[5].getName()).assertEqual("i64");
      expect(params[6].getName()).assertEqual("i8");
      expect(params[7].getName()).assertEqual("f32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_2000     
     * @tc.name testConstructorGetParameterTypes2P2Test020
     * @tc.desc Verify isPrimitive for each of 8 parameter types in Ctor_mixed_eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_mixed_eight>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params[0].isPrimitive()).assertTrue();
      expect(params[1].isPrimitive()).assertTrue();
      expect(params[2].isPrimitive()).assertFalse();
      expect(params[3].isPrimitive()).assertTrue();
      expect(params[4].isPrimitive()).assertTrue();
      expect(params[5].isPrimitive()).assertTrue();
      expect(params[6].isPrimitive()).assertTrue();
      expect(params[7].isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_2100     
     * @tc.name testConstructorGetParameterTypes2P2Test021
     * @tc.desc Verify isPrimitive for custom class and primitive mix in Ctor_Custom_long_Custom_float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_Custom_long_Custom_float>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(4);
      expect(params[0].isPrimitive()).assertFalse();
      expect(params[1].isPrimitive()).assertTrue();
      expect(params[2].isPrimitive()).assertFalse();
      expect(params[3].isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_2200     
     * @tc.name testConstructorGetParameterTypes2P2Test022
     * @tc.desc Verify getName for each position in Ctor_Custom_long_Custom_float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_Custom_long_Custom_float>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params[0].getName().includes("MyCustomClass2")).assertTrue();
      expect(params[1].getName()).assertEqual("i64");
      expect(params[2].getName().includes("MyCustomClass2")).assertTrue();
      expect(params[3].getName()).assertEqual("f32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_2300     
     * @tc.name testConstructorGetParameterTypes2P2Test023
     * @tc.desc Verify getParameterTypes returns same length 3 for same reference type repeated (string x 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<GN_3String>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("std.core.String");
      expect(params[1].getName()).assertEqual("std.core.String");
      expect(params[2].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_2400     
     * @tc.name testConstructorGetParameterTypes2P2Test024
     * @tc.desc Verify isPrimitive returns false for all three repeated string params in Ctor3str
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor3str>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params[0].isPrimitive()).assertFalse();
      expect(params[1].isPrimitive()).assertFalse();
      expect(params[2].isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_2500     
     * @tc.name testConstructorGetParameterTypes2P2Test025
     * @tc.desc Verify cross-instance same-constructor comparison returns consistent getParameterTypes across two Class.from calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors1 = Class.from<Ctor_String_int_double_boolean_long>().getConstructors();
      let ctors2 = Class.from<Ctor_String_int_double_boolean_long>().getConstructors();
      let p1 = ctors1[0].getParameterTypes();
      let p2 = ctors2[0].getParameterTypes();
      expect(p1.length).assertEqual(p2.length);
      expect(p1[0].getName()).assertEqual(p2[0].getName());
      expect(p1[1].getName()).assertEqual(p2[1].getName());
      expect(p1[2].getName()).assertEqual(p2[2].getName());
      expect(p1[3].getName()).assertEqual(p2[3].getName());
      expect(p1[4].getName()).assertEqual(p2[4].getName());
      expect(p1[0].getName()).assertEqual("std.core.String");
      expect(p1[1].getName()).assertEqual("i32");
      expect(p1[2].getName()).assertEqual("f64");
      expect(p1[3].getName()).assertEqual("u1");
      expect(p1[4].getName()).assertEqual("i64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_2600     
     * @tc.name testConstructorGetParameterTypes2P2Test026
     * @tc.desc Verify getParameterTypes yields correct array of length 4 for Ctor_short_byte_boolean_float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_short_byte_boolean_float>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(4);
      expect(params[0].getName()).assertEqual("i16");
      expect(params[1].getName()).assertEqual("i8");
      expect(params[2].getName()).assertEqual("u1");
      expect(params[3].getName()).assertEqual("f32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_2700     
     * @tc.name testConstructorGetParameterTypes2P2Test027
     * @tc.desc Verify getParameterTypes for Ctor_long_String_double returns types in correct order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_long_String_double>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("i64");
      expect(params[1].getName()).assertEqual("std.core.String");
      expect(params[2].getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_2800     
     * @tc.name testConstructorGetParameterTypes2P2Test028
     * @tc.desc Verify getParameterTypes for Ctor_boolean_short_int_float_byte returns 5 primitive types in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_boolean_short_int_float_byte>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(5);
      expect(params[0].getName()).assertEqual("u1");
      expect(params[1].getName()).assertEqual("i16");
      expect(params[2].getName()).assertEqual("i32");
      expect(params[3].getName()).assertEqual("f32");
      expect(params[4].getName()).assertEqual("i8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_2900     
     * @tc.name testConstructorGetParameterTypes2P2Test029
     * @tc.desc Verify getParameterTypes length matches getParametersNum for Ctor_int_bool_String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_int_bool_String>().getConstructors();
      let params = ctors[0].getParameterTypes();
      let paramNum = ctors[0].getParametersNum();
      expect(params.length).assertEqual(paramNum);
      expect(params[0].getName()).assertEqual("i32");
      expect(params[1].getName()).assertEqual("u1");
      expect(params[2].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_3000     
     * @tc.name testConstructorGetParameterTypes2P2Test030
     * @tc.desc Verify getParameterTypes via subscript access for first, middle, and last positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_int_String_double>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params[0].getName()).assertEqual("i32");
      expect(params[1].getName()).assertEqual("std.core.String");
      expect(params[params.length - 1].getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_3100     
     * @tc.name testConstructorGetParameterTypes2P2Test031
     * @tc.desc Verify getParameterTypes for Derived2 subclass returns only its own parameter types (int, string, boolean)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Derived2>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("i32");
      expect(params[1].getName()).assertEqual("std.core.String");
      expect(params[2].getName()).assertEqual("u1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_3200     
     * @tc.name testConstructorGetParameterTypes2P2Test032
     * @tc.desc Verify isPrimitive and getName includes 'Array' for mixed array and scalar types in Ctor_intArr_double_boolArr_String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_intArr_double_boolArr_String>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(4);
      expect(params[0].isPrimitive()).assertFalse();
      expect(params[1].isPrimitive()).assertTrue();
      expect(params[2].isPrimitive()).assertFalse();
      expect(params[3].isPrimitive()).assertFalse();
      expect(params[1].getName()).assertEqual("f64");
      expect(params[3].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_3300     
     * @tc.name testConstructorGetParameterTypes2P2Test033
     * @tc.desc Verify same Constructor twice via getParameterTypes gives consistent getName for each index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_double_String_boolean>().getConstructors();
      let p1 = ctors[0].getParameterTypes();
      let p2 = ctors[0].getParameterTypes();
      expect(p1[0].getName()).assertEqual(p2[0].getName());
      expect(p1[1].getName()).assertEqual(p2[1].getName());
      expect(p1[2].getName()).assertEqual(p2[2].getName());
      expect(p1[0].getName()).assertEqual("f64");
      expect(p1[1].getName()).assertEqual("std.core.String");
      expect(p1[2].getName()).assertEqual("u1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_3400     
     * @tc.name testConstructorGetParameterTypes2P2Test034
     * @tc.desc Verify same reference type repeated (int x 3) returns all i32 for Ctor3int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor3int>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("i32");
      expect(params[1].getName()).assertEqual("i32");
      expect(params[2].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_3500     
     * @tc.name testConstructorGetParameterTypes2P2Test035
     * @tc.desc Verify three primitive types in Ctor_byte_int_long are ordered as i8 i32 i64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_byte_int_long>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params[0].getName()).assertEqual("i8");
      expect(params[1].getName()).assertEqual("i32");
      expect(params[2].getName()).assertEqual("i64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_3600     
     * @tc.name testConstructorGetParameterTypes2P2Test036
     * @tc.desc Verify four types in Ctor_float_short_double_byte are ordered as f32 i16 f64 i8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_float_short_double_byte>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params[0].getName()).assertEqual("f32");
      expect(params[1].getName()).assertEqual("i16");
      expect(params[2].getName()).assertEqual("f64");
      expect(params[3].getName()).assertEqual("i8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_3700     
     * @tc.name testConstructorGetParameterTypes2P2Test037
     * @tc.desc Verify all arrays in Ctor_boolArr_intArr_StringArr have isPrimitive false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_boolArr_intArr_StringArr>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params[0].isPrimitive()).assertFalse();
      expect(params[1].isPrimitive()).assertFalse();
      expect(params[2].isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_3800     
     * @tc.name testConstructorGetParameterTypes2P2Test038
     * @tc.desc Verify mixed array and scalar order in Ctor_StringArr_int_floatArr returns correct types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_StringArr_int_floatArr>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params[0].getName()).assertEqual("std.core.Array");
      expect(params[1].getName()).assertEqual("i32");
      expect(params[1].isPrimitive()).assertTrue();
      expect(params[0].isPrimitive()).assertFalse();
      expect(params[2].getName()).assertEqual("std.core.Array");
      expect(params[2].isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_3900     
     * @tc.name testConstructorGetParameterTypes2P2Test039
     * @tc.desc Verify three primitive types in Ctor_long_short_byte are ordered as i64 i16 i8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_long_short_byte>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params[0].getName()).assertEqual("i64");
      expect(params[1].getName()).assertEqual("i16");
      expect(params[2].getName()).assertEqual("i8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_4000     
     * @tc.name testConstructorGetParameterTypes2P2Test040
     * @tc.desc Verify getParameterTypes returns std.core.Int[] for FixedArray<int> single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ext4_FixedArrOptParam>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(1);
      expect(params[0].getName()).assertEqual("std.core.Int[]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_4100     
     * @tc.name testConstructorGetParameterTypes2P2Test041
     * @tc.desc Verify getParameterTypes returns std.core.String[] for FixedArray<string> single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<CtorFixedArrStrParam>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(1);
      expect(params[0].getName()).assertEqual("std.core.String[]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_4200     
     * @tc.name testConstructorGetParameterTypes2P2Test042
     * @tc.desc Verify getParameterTypes returns std.core.Boolean[] for FixedArray<boolean> single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Eq03_FixedBoolCls>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(1);
      expect(params[0].getName()).assertEqual("std.core.Boolean[]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_4300     
     * @tc.name testConstructorGetParameterTypes2P2Test043
     * @tc.desc Verify getParameterTypes returns std.core.Int[][] for FixedArray<FixedArray<int>> nested single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_NestedFixedArr>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(1);
      expect(params[0].getName()).assertEqual("std.core.Int[][]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_4400     
     * @tc.name testConstructorGetParameterTypes2P2Test044
     * @tc.desc Verify getParameterTypes returns std.core.Map for Map<string,int> single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_MapStrInt>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(1);
      expect(params[0].getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_4500     
     * @tc.name testConstructorGetParameterTypes2P2Test045
     * @tc.desc Verify getParameterTypes returns std.core.Map for Map<int,string> single parameter (reversed key-value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_MapIntStr>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(1);
      expect(params[0].getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_4600     
     * @tc.name testConstructorGetParameterTypes2P2Test046
     * @tc.desc Verify getParameterTypes returns @ohos.util.ArrayList.ArrayList for ArrayList<int> single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_ArrayListInt>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(1);
      expect(params[0].getName()).assertEqual("@ohos.util.ArrayList.ArrayList");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_4700     
     * @tc.name testConstructorGetParameterTypes2P2Test047
     * @tc.desc Verify getParameterTypes returns std.core.Class for Class type single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP3_183_PubClsParam>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(1);
      expect(params[0].getName()).assertEqual("std.core.Class");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_4800     
     * @tc.name testConstructorGetParameterTypes2P2Test048
     * @tc.desc Verify getParameterTypes returns std.core.reflect.Constructor for Constructor type single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_ConstructorParam>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(1);
      expect(params[0].getName()).assertEqual("std.core.reflect.Constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_4900     
     * @tc.name testConstructorGetParameterTypes2P2Test049
     * @tc.desc Verify getParameterTypes returns EmptyCls name for custom type EmptyCls single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_HD_Param>().getConstructors();
      let params = ctors[0].getParameterTypes();
      let expectedName: string = Class.from<EmptyCls>().getName();
      expect(params.length).assertEqual(1);
      expect(params[0].getName()).assertEqual(expectedName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_5000     
     * @tc.name testConstructorGetParameterTypes2P2Test050
     * @tc.desc Verify getParameterTypes returns length 12 for constructor with 12 string parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<GN3_12Str>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_5100     
     * @tc.name testConstructorGetParameterTypes2P2Test051
     * @tc.desc Verify getParameterTypes returns all std.core.String for 5 string parameters boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor5StrParam>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(5);
      expect(params[0].getName()).assertEqual("std.core.String");
      expect(params[1].getName()).assertEqual("std.core.String");
      expect(params[2].getName()).assertEqual("std.core.String");
      expect(params[3].getName()).assertEqual("std.core.String");
      expect(params[4].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_5200     
     * @tc.name testConstructorGetParameterTypes2P2Test052
     * @tc.desc Verify getParameterTypes returns all std.core.Object for 5 Object parameters boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_5Objs>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(5);
      expect(params[0].getName()).assertEqual("std.core.Object");
      expect(params[1].getName()).assertEqual("std.core.Object");
      expect(params[2].getName()).assertEqual("std.core.Object");
      expect(params[3].getName()).assertEqual("std.core.Object");
      expect(params[4].getName()).assertEqual("std.core.Object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_5300     
     * @tc.name testConstructorGetParameterTypes2P2Test053
     * @tc.desc Verify getParameterTypes returns same custom type name for 4 same custom type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_4Customs>().getConstructors();
      let params = ctors[0].getParameterTypes();
      let customName: string = Class.from<EmptyCls>().getName();
      expect(params.length).assertEqual(4);
      expect(params[0].getName()).assertEqual(customName);
      expect(params[1].getName()).assertEqual(customName);
      expect(params[2].getName()).assertEqual(customName);
      expect(params[3].getName()).assertEqual(customName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_5400     
     * @tc.name testConstructorGetParameterTypes2P2Test054
     * @tc.desc Verify getParameterTypes returns correct container type order for std.core.Int[], Map, Array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_MixedContainers>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("std.core.Int[]");
      expect(params[1].getName()).assertEqual("std.core.Map");
      expect(params[2].getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_5500     
     * @tc.name testConstructorGetParameterTypes2P2Test055
     * @tc.desc Verify getParameterTypes returns correct types for all categories mixed: int, custom, std.core.String[], Class, std.core.reflect.Constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_AllCategories>().getConstructors();
      let params = ctors[0].getParameterTypes();
      let customName: string = Class.from<EmptyCls>().getName();
      expect(params.length).assertEqual(5);
      expect(params[0].getName()).assertEqual("i32");
      expect(params[1].getName()).assertEqual(customName);
      expect(params[2].getName()).assertEqual("std.core.String[]");
      expect(params[3].getName()).assertEqual("std.core.Class");
      expect(params[4].getName()).assertEqual("std.core.reflect.Constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_5600     
     * @tc.name testConstructorGetParameterTypes2P2Test056
     * @tc.desc Verify getParameterTypes returns correct types for double and boolean only parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_DoubleBoolOnly>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(4);
      expect(params[0].getName()).assertEqual("f64");
      expect(params[1].getName()).assertEqual("u1");
      expect(params[2].getName()).assertEqual("f64");
      expect(params[3].getName()).assertEqual("u1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_5700     
     * @tc.name testConstructorGetParameterTypes2P2Test057
     * @tc.desc Verify getParameterTypes returns all std.core.Map for three Map parameters with different key-value type pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_MapVariants>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("std.core.Map");
      expect(params[1].getName()).assertEqual("std.core.Map");
      expect(params[2].getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_5800     
     * @tc.name testConstructorGetParameterTypes2P2Test058
     * @tc.desc Verify getParameterTypes returns correct length and types for 15 mixed parameters boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ctor_15MixedParams>().getConstructors();
      let params = ctors[0].getParameterTypes();
      expect(params.length).assertEqual(15);
      expect(params[0].getName()).assertEqual("i32");
      expect(params[4].getName()).assertEqual("std.core.Object");
      expect(params[7].getName()).assertEqual("u1");
      expect(params[14].getName()).assertEqual("std.core.Object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_5900     
     * @tc.name testConstructorGetParameterTypes2P2Test059
     * @tc.desc Verify getParameterTypes returns i32, std.core.String, u1 and f64 for int string boolean double four parameters order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<GN3_Mix4ISBD>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(4);
      expect(params[0].getName()).assertEqual("i32");
      expect(params[1].getName()).assertEqual("std.core.String");
      expect(params[2].getName()).assertEqual("u1");
      expect(params[3].getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_6000     
     * @tc.name testConstructorGetParameterTypes2P2Test060
     * @tc.desc Verify getParameterTypes returns all std.core.String for four string type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<GN_4String>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(params[i].getName()).assertEqual("std.core.String");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_6100     
     * @tc.name testConstructorGetParameterTypes2P2Test061
     * @tc.desc Verify getParameterTypes returns all f64 for four double type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<Ctor4DoubleParam>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(params[i].getName()).assertEqual("f64");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_6200     
     * @tc.name testConstructorGetParameterTypes2P2Test062
     * @tc.desc Verify getParameterTypes returns std.core.Object, std.core.String and i32 for Object string int parameters order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<Ctor_Object_String_Int>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("std.core.Object");
      expect(params[1].getName()).assertEqual("std.core.String");
      expect(params[2].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_6300     
     * @tc.name testConstructorGetParameterTypes2P2Test063
     * @tc.desc Verify getParameterTypes returns u1, std.core.Object and i32 for boolean Object int parameters order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<Ctor_Bool_Object_Int>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("u1");
      expect(params[1].getName()).assertEqual("std.core.Object");
      expect(params[2].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_6400     
     * @tc.name testConstructorGetParameterTypes2P2Test064
     * @tc.desc Verify getParameterTypes returns std.core.String, std.core.Map and i32 for string Map<int> int parameters order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<Ctor_String_Map_Int>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("std.core.String");
      expect(params[1].getName()).assertEqual("std.core.Map");
      expect(params[2].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_6500     
     * @tc.name testConstructorGetParameterTypes2P2Test065
     * @tc.desc Verify getParameterTypes returns std.core.Object twice and i32 for two Object and int parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<Ctor_Object_Object_Int>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("std.core.Object");
      expect(params[1].getName()).assertEqual("std.core.Object");
      expect(params[2].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_6600     
     * @tc.name testConstructorGetParameterTypes2P2Test066
     * @tc.desc Verify getParameterTypes returns std.core.Class, std.core.reflect.Constructor and i32 for Class Constructor int parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<Ctor_Class_Constructor_Int>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("std.core.Class");
      expect(params[1].getName()).assertEqual("std.core.reflect.Constructor");
      expect(params[2].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_6700     
     * @tc.name testConstructorGetParameterTypes2P2Test067
     * @tc.desc Verify getParameterTypes returns i32, std.core.Int[], std.core.Map and custom type for int FixedArray Map custom four parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<Ctor_Int_FixedArray_Map_Ref>().getConstructors()[0].getParameterTypes();
      let customName: string = Class.from<EmptyCls>().getName();
      expect(params.length).assertEqual(4);
      expect(params[0].getName()).assertEqual("i32");
      expect(params[1].getName()).assertEqual("std.core.Int[]");
      expect(params[2].getName()).assertEqual("std.core.Map");
      expect(params[3].getName()).assertEqual(customName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_6800     
     * @tc.name testConstructorGetParameterTypes2P2Test068
     * @tc.desc Verify getParameterTypes returns std.core.Int[] and i32 for FixedArray<int> and int parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<Ctor_FixedArray_Int>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(2);
      expect(params[0].getName()).assertEqual("std.core.Int[]");
      expect(params[1].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_6900     
     * @tc.name testConstructorGetParameterTypes2P2Test069
     * @tc.desc Verify getParameterTypes preserves 7 types order: int, double, boolean, string, EmptyCls, EmptyCls, Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<SevenTypesOrder>().getConstructors()[0].getParameterTypes();
      let nameA: string = Class.from<EmptyCls>().getName();
      let nameB: string = Class.from<EmptyCls>().getName();
      expect(params.length).assertEqual(7);
      expect(params[0].getName()).assertEqual("i32");
      expect(params[1].getName()).assertEqual("f64");
      expect(params[2].getName()).assertEqual("u1");
      expect(params[3].getName()).assertEqual("std.core.String");
      expect(params[4].getName()).assertEqual(nameA);
      expect(params[5].getName()).assertEqual(nameB);
      expect(params[6].getName()).assertEqual("std.core.Object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_7000     
     * @tc.name testConstructorGetParameterTypes2P2Test070
     * @tc.desc Verify getParameterTypes returns correct types for int, std.core.String[], Map<int,boolean>, string, double mixed parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<Int_FAStr_MIntBool_Str_Double>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(5);
      expect(params[0].getName()).assertEqual("i32");
      expect(params[1].getName()).assertEqual("std.core.String[]");
      expect(params[2].getName()).assertEqual("std.core.Map");
      expect(params[3].getName()).assertEqual("std.core.String");
      expect(params[4].getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_7100     
     * @tc.name testConstructorGetParameterTypes2P2Test071
     * @tc.desc Verify getParameterTypes returns std.core.Map for nested generic Map<int,FixedArray<string>> alongside int and string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<NestedMapParam>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("std.core.Map");
      expect(params[1].getName()).assertEqual("i32");
      expect(params[2].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_7200     
     * @tc.name testConstructorGetParameterTypes2P2Test072
     * @tc.desc Verify getParameterTypes returns correct types for repeated boolean followed by int and string: boolean, boolean, int, string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<Bool_Bool_Int_String>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(4);
      expect(params[0].getName()).assertEqual("u1");
      expect(params[1].getName()).assertEqual("u1");
      expect(params[2].getName()).assertEqual("i32");
      expect(params[3].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_7300     
     * @tc.name testConstructorGetParameterTypes2P2Test073
     * @tc.desc Verify getParameterTypes returns same custom class name for two repeated custom class parameters followed by int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<SameCustomTwice_Int>().getConstructors()[0].getParameterTypes();
      let customName: string = Class.from<EmptyCls>().getName();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual(customName);
      expect(params[1].getName()).assertEqual(customName);
      expect(params[2].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_7400     
     * @tc.name testConstructorGetParameterTypes2P2Test074
     * @tc.desc Verify getParameterTypes returns string then two ints for string, int, int parameter order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let params = Class.from<String_Int_Int_Order>().getConstructors()[0].getParameterTypes();
      expect(params.length).assertEqual(3);
      expect(params[0].getName()).assertEqual("std.core.String");
      expect(params[1].getName()).assertEqual("i32");
      expect(params[2].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_ExtP2_7500     
     * @tc.name testConstructorGetParameterTypes2P2Test075
     * @tc.desc Verify getParameterTypes returns correct type for final class implementing interface with constructor parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetParameterTypes2P2Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let types = Class.from<FinalWithInterfaceExt>().getConstructors()[0].getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual("std.core.String");
    });

  });
}