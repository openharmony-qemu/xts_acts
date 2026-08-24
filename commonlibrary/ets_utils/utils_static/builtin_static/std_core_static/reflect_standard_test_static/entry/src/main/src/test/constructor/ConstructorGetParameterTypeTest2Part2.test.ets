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

import {C5,CtorBox,TcPub10,TcPub12,TcPub19,C1Object,FiveCtor,PubDouble,TcTwoPubA,CtorMixedA,CtorMixedC,CtorMixedE,CtorMixedF,CtorMixedH,CtorMultiI,FiftyParam,FourParams,GN_ByteArr,GN_CharArr,CtorAllPrim,CtorArrPrim,CtorGeneric,GN_FloatArr,GN_ShortArr,CtorOverload,CtorInterface,CtorOverload3,PubShortParam,CtorFixArrLong,Ctor6MixedParam,PGN_ObjectParam,BoolDoubleString,DoubleFieldClass,CtorDoubleArrParam,IP2_110_PubDefBool,IP3_201_PubBoolArr,CtorMultiDimArrParam,StringFieldWithMethod,DefaultAndRequired_Ext,CtorDoubleExtremesParam,C2Byte,C4,C6Last,CtorDataWrap,CtorFixedArrStrParam,CtorTestColor,CtorTestFlag,Ctor_int_String_double,EmptyCls,Eq03_FixedBoolCls,Ext2_MapStrBoolParam,Ext4_FixedArrOptParam,ExtGenChild,ExtInheritChild,GN3_Mix4ISBD,GN_Long2D,GetParamTypeABC,GetParamTypeAC,GetParamTypeBC,IP3_193_PubFloat,ParamCountCls,PubByteParam,TenCtor,} from "../Util.test";

export default function ConstructorGetParameterTypeTest2Part2(): void {
  describe("ConstructorGetParameterTypeTest2Part2", (): void => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 50);
      });
    });
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_0100     
     * @tc.name testConstructorGetParameterType2P2Test001
     * @tc.desc Verify ConstructorGetParameterType Ext142: StringFieldWithMethod isPublic unchanged before and after getParameterType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      let before = ctor.isPublic();
      let t = ctor.getParameterType(0);
      expect(t!.getName()).assertEqual("std.core.String");
      let after = ctor.isPublic();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_0200     
     * @tc.name testConstructorGetParameterType2P2Test002
     * @tc.desc Verify ConstructorGetParameterType Ext145: StringFieldWithMethod isNative unchanged before and after getParameterType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      let before = ctor.isNative();
      let t = ctor.getParameterType(0);
      expect(t!.getName()).assertEqual("std.core.String");
      let after = ctor.isNative();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_0300     
     * @tc.name testConstructorGetParameterType2P2Test003
     * @tc.desc Verify ConstructorGetParameterType Ext146: StringFieldWithMethod getOwner unchanged before and after getParameterType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      let before = ctor.getOwner();
      let after = ctor.getOwner();
      expect(before.getName()).assertEqual(after.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_0400     
     * @tc.name testConstructorGetParameterType2P2Test004
     * @tc.desc Verify ConstructorGetParameterType Ext147: StringFieldWithMethod getReturnType unchanged before and after getParameterType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      let before = ctor.getReturnType();
      let after = ctor.getReturnType();
      expect(before.getName()).assertEqual(after.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_0500     
     * @tc.name testConstructorGetParameterType2P2Test005
     * @tc.desc Verify ConstructorGetParameterType Ext149: StringFieldWithMethod equals still works after multiple getParameterType calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      let ctorAgain = cls.getConstructors()[0];
      let t = ctor.getParameterType(0);
      expect(t!.getName()).assertEqual("std.core.String");
      expect(ctor.equals(ctorAgain)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_0600     
     * @tc.name testConstructorGetParameterType2P2Test006
     * @tc.desc Verify CtorOverload single param overload idx=0 returns Class object not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorOverload>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].getParametersNum()).assertEqual(1);
      let t = ctors[0].getParameterType(0);
      expect(t!.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_0700     
     * @tc.name testConstructorGetParameterType2P2Test007
     * @tc.desc Verify ConstructorGetParameterType Ext152: CtorOverload3 single param overload idx=1 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorOverload3>();
      let ctors = cls.getConstructors();
      let foundCtor: reflect.Constructor | undefined = undefined;
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParametersNum() == 1) {
          foundCtor = ctors[i];
        }
      }
      try {
        foundCtor!.getParameterType(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_0800     
     * @tc.name testConstructorGetParameterType2P2Test008
     * @tc.desc Verify ConstructorGetParameterType Ext153: StringFieldWithMethod single 1-param constructor getParameterType getName length equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctors = cls.getConstructors();
      let r0: Class | undefined = undefined;
      let r1: Class | undefined = undefined;
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParametersNum() == 0) {
          r0 = ctors[i].getParameterType(0);
        } else if (ctors[i].getParametersNum() == 1) {
          r1 = ctors[i].getParameterType(0);
        }
      }
      expect(r0).assertUndefined();
      expect(r1!.getName().length).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_0900     
     * @tc.name testConstructorGetParameterType2P2Test009
     * @tc.desc Verify PubShortParam short param getParameterType(0) getName length equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PubShortParam>();
      let ctor = cls.getConstructors()[0];
      let len = ctor.getParameterType(0)!.getName().length;
      expect(len).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_1000     
     * @tc.name testConstructorGetParameterType2P2Test010
     * @tc.desc Verify ConstructorGetParameterType Ext158: CtorInterface interface type param getName returns ITestable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorInterface>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName().includes("ITestable")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_1100     
     * @tc.name testConstructorGetParameterType2P2Test011
     * @tc.desc Verify ConstructorGetParameterType Ext160: CtorDoubleExtremesParam 3 double params all getName return f64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorDoubleExtremesParam>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0)!;
      let r1 = ctor.getParameterType(1)!;
      let r2 = ctor.getParameterType(2)!;
      expect(r0.getName()).assertEqual("f64");
      expect(r1.getName()).assertEqual("f64");
      expect(r2.getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_1200     
     * @tc.name testConstructorGetParameterType2P2Test012
     * @tc.desc Verify ConstructorGetParameterType Ext161: CtorMultiI 5 params getName values std.core.String/i32/u1/f64/i64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMultiI>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getParameterType(0)!.getName()).assertEqual("std.core.String");
      expect(ctor.getParameterType(1)!.getName()).assertEqual("i32");
      expect(ctor.getParameterType(2)!.getName()).assertEqual("u1");
      expect(ctor.getParameterType(3)!.getName()).assertEqual("f64");
      expect(ctor.getParameterType(4)!.getName()).assertEqual("i64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_1300     
     * @tc.name testConstructorGetParameterType2P2Test013
     * @tc.desc Verify ConstructorGetParameterType Ext164: StringFieldWithMethod and FourParams string params equal and length 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<StringFieldWithMethod>();
      let cls2 = Class.from<FourParams>();
      let ctor1 = cls1.getConstructors()[0];
      let ctor2 = cls2.getConstructors()[0];
      let name1 = ctor1.getParameterType(0)!.getName();
      let name2 = ctor2.getParameterType(0)!.getName();
      expect(name1).assertEqual(name2);
      expect(name1.length).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_1400     
     * @tc.name testConstructorGetParameterType2P2Test014
     * @tc.desc Verify ConstructorGetParameterType Ext172: TcTwoPubA optional int param idx=0 isPrimitive false and getName std.core.Int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcTwoPubA>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.isPrimitive()).assertFalse();
      expect(result!.getName()).assertEqual("std.core.Int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_1500     
     * @tc.name testConstructorGetParameterType2P2Test015
     * @tc.desc Verify ConstructorGetParameterType Ext174: FourParams 4 param idx=2*2 expression 4 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FourParams>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(2 * 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_1600     
     * @tc.name testConstructorGetParameterType2P2Test016
     * @tc.desc Verify ConstructorGetParameterType Ext175: FourParams idx=1+2-3 expression 0 equals literal getParameterType(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FourParams>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(1 + 2 - 3);
      expect(result).assertEqual(ctor.getParameterType(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_1700     
     * @tc.name testConstructorGetParameterType2P2Test017
     * @tc.desc Verify ConstructorGetParameterType Ext176: DefaultAndRequired_Ext 2 param dynamic idx using getParametersNum()-1 returns last param std.core.Int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      let num = ctor.getParametersNum();
      let result = ctor.getParameterType(num - 1);
      expect(result!.getName()).assertEqual("std.core.Int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_1800     
     * @tc.name testConstructorGetParameterType2P2Test018
     * @tc.desc Verify ConstructorGetParameterType Ext177: FourParams 4 param idx=getParametersNum()-1 equals 3 returns last param double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FourParams>();
      let ctor = cls.getConstructors()[0];
      let idx = ctor.getParametersNum() - 1;
      let result = ctor.getParameterType(idx);
      expect(result!.getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_1900     
     * @tc.name testConstructorGetParameterType2P2Test019
     * @tc.desc Verify ConstructorGetParameterType Ext178: CtorMultiI 5 param idx=getParametersNum() out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMultiI>();
      let ctor = cls.getConstructors()[0];
      let idx = ctor.getParametersNum();
      try {
        ctor.getParameterType(idx);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_2000     
     * @tc.name testConstructorGetParameterType2P2Test020
     * @tc.desc Verify ConstructorGetParameterType Ext179: Ctor6MixedParam 6 param idx=getParametersNum()*2 far out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor6MixedParam>();
      let ctor = cls.getConstructors()[0];
      let idx = ctor.getParametersNum() * 2;
      try {
        ctor.getParameterType(idx);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_2100     
     * @tc.name testConstructorGetParameterType2P2Test021
     * @tc.desc Verify ConstructorGetParameterType Ext180: TcTwoPubA 1 param idx=65536 far out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcTwoPubA>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(65536);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_2200     
     * @tc.name testConstructorGetParameterType2P2Test022
     * @tc.desc Verify ConstructorGetParameterType Ext185: IP2_110_PubDefBool default boolean param isPrimitive false and getName includes Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP2_110_PubDefBool>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.isPrimitive()).assertFalse();
      expect(result!.getName().includes("Boolean")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_2300     
     * @tc.name testConstructorGetParameterType2P2Test023
     * @tc.desc Verify ConstructorGetParameterType Ext186: PubDouble double param isPrimitive true and getName f64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PubDouble>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.isPrimitive()).assertTrue();
      expect(result!.getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_2400     
     * @tc.name testConstructorGetParameterType2P2Test024
     * @tc.desc Verify ConstructorGetParameterType Ext202: DefaultAndRequired_Ext repeated getParameterType(0) calls return equal result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      let pt0Before = ctor.getParameterType(0);
      let pt0After = ctor.getParameterType(0);
      expect(pt0Before).assertEqual(pt0After);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_2500     
     * @tc.name testConstructorGetParameterType2P2Test025
     * @tc.desc Verify ConstructorGetParameterType Ext204: CtorMixedH getParameterType(1) interleaved keeps getParameterType(0) object and idx1 differs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMixedH>();
      let ctor = cls.getConstructors()[0];
      let pt0Before = ctor.getParameterType(0);
      let mid = ctor.getParameterType(1);
      let pt0After = ctor.getParameterType(0);
      expect(pt0Before).assertEqual(pt0After);
      expect(mid).not().assertEqual(pt0After);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_2600     
     * @tc.name testConstructorGetParameterType2P2Test026
     * @tc.desc Verify ConstructorGetParameterType Ext205: CtorMultiI repeated getParameterType(0) calls return equal result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMultiI>();
      let ctor = cls.getConstructors()[0];
      let pt0Before = ctor.getParameterType(0);
      let pt0After = ctor.getParameterType(0);
      expect(pt0Before).assertEqual(pt0After);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_2700     
     * @tc.name testConstructorGetParameterType2P2Test027
     * @tc.desc Verify ConstructorGetParameterType Ext206: CtorMixedC getParameterType(3) interleaved keeps getParameterType(0) object and name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMixedC>();
      let ctor = cls.getConstructors()[0];
      let pt0Before = ctor.getParameterType(0);
      let pt3 = ctor.getParameterType(3);
      let pt0After = ctor.getParameterType(0);
      expect(pt0Before).assertEqual(pt0After);
      expect(pt0Before!.getName()).assertEqual(pt0After!.getName());
      expect(pt3).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_2800     
     * @tc.name testConstructorGetParameterType2P2Test028
     * @tc.desc Verify ConstructorGetParameterType Ext225: GN_ByteArr byte[] param getName includes 'Array' returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN_ByteArr>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName().includes("Array")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_2900     
     * @tc.name testConstructorGetParameterType2P2Test029
     * @tc.desc Verify ConstructorGetParameterType Ext227: GN_ShortArr short[] param getName includes 'Array' returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN_ShortArr>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName().includes("Array")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_3000     
     * @tc.name testConstructorGetParameterType2P2Test030
     * @tc.desc Verify ConstructorGetParameterType Ext228: GN_FloatArr float[] param getName includes 'Array' returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN_FloatArr>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName().includes("Array")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_3100     
     * @tc.name testConstructorGetParameterType2P2Test031
     * @tc.desc Verify ConstructorGetParameterType Ext229: CtorDoubleArrParam double[] param getName includes 'Array' returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorDoubleArrParam>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName().includes("Array")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_3200     
     * @tc.name testConstructorGetParameterType2P2Test032
     * @tc.desc Verify ConstructorGetParameterType Ext230: GN_CharArr char[] param getName includes 'Array' returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN_CharArr>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName().includes("Array")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_3300     
     * @tc.name testConstructorGetParameterType2P2Test033
     * @tc.desc Verify ConstructorGetParameterType Ext233: C1Object MyData param isPrimitive false and getName includes MyData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C1Object>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.isPrimitive()).assertFalse();
      expect(result!.getName().includes("MyData")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_3400     
     * @tc.name testConstructorGetParameterType2P2Test034
     * @tc.desc Verify ConstructorGetParameterType Ext235: C5 string param idx0 getName std.core.String and isPrimitive/isInterface false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C5>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName()).assertEqual("std.core.String");
      expect(result!.isPrimitive()).assertFalse();
      expect(result!.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_3500     
     * @tc.name testConstructorGetParameterType2P2Test035
     * @tc.desc Verify ConstructorGetParameterType Ext236: PGN_ObjectParam object param getName std.core.Object and isPrimitive/isInterface false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PGN_ObjectParam>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName()).assertEqual("std.core.Object");
      expect(result!.isPrimitive()).assertFalse();
      expect(result!.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_3600     
     * @tc.name testConstructorGetParameterType2P2Test036
     * @tc.desc Verify ConstructorGetParameterType Ext237: CtorBox generic GenBox param getName includes GenBox
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorBox>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName().includes("GenBox")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_3700     
     * @tc.name testConstructorGetParameterType2P2Test037
     * @tc.desc Verify ConstructorGetParameterType Ext238: GN_ByteArr byte[] param isPrimitive returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN_ByteArr>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_3800     
     * @tc.name testConstructorGetParameterType2P2Test038
     * @tc.desc Verify ConstructorGetParameterType Ext242: TcPub19 int[] param getName includes 'Array' returns true and isPrimitive returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcPub19>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName().includes("Array")).assertTrue();
      expect(result!.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_3900     
     * @tc.name testConstructorGetParameterType2P2Test039
     * @tc.desc Verify ConstructorGetParameterType Ext244: TcPub10 string param idx=0 getName std.core.String and double idx=1 getName f64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcPub10>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0)!;
      let r1 = ctor.getParameterType(1)!;
      expect(r0.getName()).assertEqual("std.core.String");
      expect(r1.getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_4000     
     * @tc.name testConstructorGetParameterType2P2Test040
     * @tc.desc Verify ConstructorGetParameterType Ext247: CtorAllPrim float idx=6 getName f32 and double idx=7 getName f64 both isPrimitive true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorAllPrim>();
      let ctor = cls.getConstructors()[0];
      let r6 = ctor.getParameterType(6)!;
      let r7 = ctor.getParameterType(7)!;
      expect(r6.getName()).assertEqual("f32");
      expect(r6.isPrimitive()).assertTrue();
      expect(r7.getName()).assertEqual("f64");
      expect(r7.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_4100     
     * @tc.name testConstructorGetParameterType2P2Test041
     * @tc.desc Verify ConstructorGetParameterType Ext252: CtorMixedA double idx0 and boolean idx1 both isPrimitive true and distinct objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMixedA>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0)!;
      let r1 = ctor.getParameterType(1)!;
      expect(r0.isPrimitive()).assertTrue();
      expect(r1.isPrimitive()).assertTrue();
      expect(r0).not().assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_4200     
     * @tc.name testConstructorGetParameterType2P2Test042
     * @tc.desc Verify ConstructorGetParameterType Ext254: CtorMixedH short idx=0 getName i16 and long idx=1 getName i64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMixedH>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0)!;
      let r1 = ctor.getParameterType(1)!;
      expect(r0.getName()).assertEqual("i16");
      expect(r1.getName()).assertEqual("i64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_4300     
     * @tc.name testConstructorGetParameterType2P2Test043
     * @tc.desc Verify ConstructorGetParameterType Ext259: DefaultAndRequired_Ext param idx=~0 bitwise NOT evaluates to negative throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(~0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_4400     
     * @tc.name testConstructorGetParameterType2P2Test044
     * @tc.desc Verify ConstructorGetParameterType Ext264: DefaultAndRequired_Ext param idx=4/2 division two out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(4 / 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_4500     
     * @tc.name testConstructorGetParameterType2P2Test045
     * @tc.desc Verify ConstructorGetParameterType Ext267: Ctor6MixedParam param idx=-(-1) evaluates to 1 returns int param getName i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor6MixedParam>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(-(-1));
      expect(result).not().assertNull();
      expect(result!.getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_4600
     * @tc.name testConstructorGetParameterType2P2Test046
     * @tc.desc Verify ConstructorGetParameterType Ext268: EmptyCls param idx=0+3 addition three out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(0 + 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_4700
     * @tc.name testConstructorGetParameterType2P2Test047
     * @tc.desc Verify ConstructorGetParameterType Ext269: C6Last param idx=2*1 multiplication two returns boolean param getName u1 and isPrimitive true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C6Last>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(2 * 1)!;
      expect(result.getName()).assertEqual("u1");
      expect(result.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_4800
     * @tc.name testConstructorGetParameterType2P2Test048
     * @tc.desc Verify ConstructorGetParameterType Ext270: FiftyParam param idx=6-4 subtraction two returns string param getName std.core.String and isPrimitive false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FiftyParam>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(6 - 4)!;
      expect(result.getName()).assertEqual("std.core.String");
      expect(result.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_4900
     * @tc.name testConstructorGetParameterType2P2Test049
     * @tc.desc Verify ConstructorGetParameterType Ext275: CtorMixedC int isPrimitive true and long isPrimitive true mixed param verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMixedC>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0)!;
      let r1 = ctor.getParameterType(1)!;
      expect(r0.isPrimitive()).assertTrue();
      expect(r1.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_5000
     * @tc.name testConstructorGetParameterType2P2Test050
     * @tc.desc Verify ConstructorGetParameterType Ext277: IP3_193_PubFloat float param getName f32 isPrimitive true and CtorDoubleExtremesParam double param isPrimitive true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsF = Class.from<IP3_193_PubFloat>();
      let ctorF = clsF.getConstructors()[0];
      let rf = ctorF.getParameterType(0)!;
      expect(rf.getName()).assertEqual("f32");
      expect(rf.isPrimitive()).assertTrue();
      let clsD = Class.from<CtorDoubleExtremesParam>();
      let ctorD = clsD.getConstructors()[0];
      let rd = ctorD.getParameterType(0)!;
      expect(rd.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_5100
     * @tc.name testConstructorGetParameterType2P2Test051
     * @tc.desc Verify ConstructorGetParameterType Ext278: CtorMixedE char isPrimitive true and byte isPrimitive true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMixedE>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0)!;
      let r1 = ctor.getParameterType(1)!;
      expect(r0.isPrimitive()).assertTrue();
      expect(r1.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_5200
     * @tc.name testConstructorGetParameterType2P2Test052
     * @tc.desc Verify ConstructorGetParameterType Ext285: CtorArrPrim int[] idx=0 and long[] idx=1 both getName std.core.Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorArrPrim>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0)!;
      let r1 = ctor.getParameterType(1)!;
      expect(r0.getName()).assertEqual("std.core.Array");
      expect(r1.getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_5300
     * @tc.name testConstructorGetParameterType2P2Test053
     * @tc.desc Verify ConstructorGetParameterType Ext286: CtorMixedE idx=0 getName u16 and idx=2 getName u1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMixedE>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0)!;
      let r2 = ctor.getParameterType(2)!;
      expect(r0.getName()).assertEqual("u16");
      expect(r2.getName()).assertEqual("u1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_5400
     * @tc.name testConstructorGetParameterType2P2Test054
     * @tc.desc Verify ConstructorGetParameterType Ext287: CtorMixedF idx=0 int[] getName std.core.Array and isPrimitive returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMixedF>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0)!;
      expect(r0.getName()).assertEqual("std.core.Array");
      expect(r0.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_5500
     * @tc.name testConstructorGetParameterType2P2Test055
     * @tc.desc Verify ConstructorGetParameterType Ext288: CtorMixedF idx=1 string isPrimitive false and idx=2 boolean isPrimitive true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMixedF>();
      let ctor = cls.getConstructors()[0];
      let r1 = ctor.getParameterType(1)!;
      let r2 = ctor.getParameterType(2)!;
      expect(r1.isPrimitive()).assertFalse();
      expect(r2.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_5600
     * @tc.name testConstructorGetParameterType2P2Test056
     * @tc.desc Verify ConstructorGetParameterType Ext289: PubByteParam byte param getName i8 isPrimitive true and PubShortParam short param getName i16 isPrimitive true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsB = Class.from<PubByteParam>();
      let ctorB = clsB.getConstructors()[0];
      let rb = ctorB.getParameterType(0)!;
      expect(rb.getName()).assertEqual("i8");
      expect(rb.isPrimitive()).assertTrue();
      let clsS = Class.from<PubShortParam>();
      let ctorS = clsS.getConstructors()[0];
      let rs = ctorS.getParameterType(0)!;
      expect(rs.getName()).assertEqual("i16");
      expect(rs.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_5700
     * @tc.name testConstructorGetParameterType2P2Test057
     * @tc.desc Verify ConstructorGetParameterType Ext290: FourParams idx=0 string param getName std.core.String and isPrimitive false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FourParams>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0)!;
      expect(r0.getName()).assertEqual("std.core.String");
      expect(r0.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_5800
     * @tc.name testConstructorGetParameterType2P2Test058
     * @tc.desc Verify ConstructorGetParameterType Ext295: DefaultAndRequired_Ext param idx=6/3 division two out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(6 / 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_5900
     * @tc.name testConstructorGetParameterType2P2Test059
     * @tc.desc Verify ConstructorGetParameterType Ext297: EmptyCls 0 param idx=0xFF hex 255 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(0xff);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_6000
     * @tc.name testConstructorGetParameterType2P2Test060
     * @tc.desc Verify ConstructorGetParameterType Ext304: StringFieldWithMethod single string idx=0xFF hex 255 OOB throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(0xff);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_6100
     * @tc.name testConstructorGetParameterType2P2Test061
     * @tc.desc Verify ConstructorGetParameterType Ext306: TcTwoPubA single int idx=100 large OOB throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcTwoPubA>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_6200
     * @tc.name testConstructorGetParameterType2P2Test062
     * @tc.desc Verify ConstructorGetParameterType Ext307: TcTwoPubA single int idx=-100 negative large OOB throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcTwoPubA>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_6300
     * @tc.name testConstructorGetParameterType2P2Test063
     * @tc.desc Verify ConstructorGetParameterType Ext308: DefaultAndRequired_Ext 2 param idx=0x2 hex two OOB throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(0x2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_6400
     * @tc.name testConstructorGetParameterType2P2Test064
     * @tc.desc Verify ConstructorGetParameterType Ext310: C4 4 param idx=0x4 hex four OOB throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C4>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(0x4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_6500
     * @tc.name testConstructorGetParameterType2P2Test065
     * @tc.desc Verify ConstructorGetParameterType Ext311: C5 5 param idx=0x5 hex five OOB throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C5>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(0x5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_6600
     * @tc.name testConstructorGetParameterType2P2Test066
     * @tc.desc Verify ConstructorGetParameterType Ext327: IP2_110_PubDefBool single bool param idx=0x1 hex one OOB throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP2_110_PubDefBool>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(0x1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_6700
     * @tc.name testConstructorGetParameterType2P2Test067
     * @tc.desc Verify ConstructorGetParameterType Ext328: CtorMultiI 5 param idx=0x5 hex five OOB throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMultiI>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(0x5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_6800
     * @tc.name testConstructorGetParameterType2P2Test068
     * @tc.desc Verify ConstructorGetParameterType Ext331: Ctor6MixedParam 6 param idx=6 decimal six OOB throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor6MixedParam>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_6900
     * @tc.name testConstructorGetParameterType2P2Test069
     * @tc.desc Verify ConstructorGetParameterType Ext336: C2Byte dual byte params idx=0 and idx=1 both getName i8 and equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C2Byte>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0)!;
      let r1 = ctor.getParameterType(1)!;
      expect(r0.getName()).assertEqual("i8");
      expect(r1.getName()).assertEqual("i8");
      expect(r0.getName()).assertEqual(r1.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_7000
     * @tc.name testConstructorGetParameterType2P2Test070
     * @tc.desc Verify ConstructorGetParameterType Ext337: GN_Long2D long[][] 2D array param idx=0 getName std.core.Array and isPrimitive false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN_Long2D>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0)!;
      expect(result.getName()).assertEqual("std.core.Array");
      expect(result.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_7100
     * @tc.name testConstructorGetParameterType2P2Test071
     * @tc.desc Verify ConstructorGetParameterType Ext340: CtorMultiI 5 param idx=-1 negative boundary throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMultiI>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_7200
     * @tc.name testConstructorGetParameterType2P2Test072
     * @tc.desc Verify ConstructorGetParameterType Ext341: StringFieldWithMethod string param idx=0 getName std.core.String and getParameterTypes length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.isPrimitive()).assertFalse();
      expect(result!.getName()).assertEqual("std.core.String");
      expect(ctor.getParameterTypes().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_7300
     * @tc.name testConstructorGetParameterType2P2Test073
     * @tc.desc Verify ConstructorGetParameterType Ext352: FiftyParam 50 string params last param idx=getParametersNum()-1 getName std.core.String and notNull
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FiftyParam>();
      let ctor = cls.getConstructors()[0];
      let last = ctor.getParametersNum() - 1;
      expect(ctor.getParameterType(last)!.getName()).assertEqual("std.core.String");
      expect(ctor.getParameterType(last)).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_7400
     * @tc.name testConstructorGetParameterType2P2Test074
     * @tc.desc Verify ConstructorGetParameterType Ext357: TenCtor 10 param idx=0 string getName std.core.String and idx=1 int getName i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TenCtor>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getParameterType(0)!.getName()).assertEqual("std.core.String");
      expect(ctor.getParameterType(1)!.getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_7500
     * @tc.name testConstructorGetParameterType2P2Test075
     * @tc.desc Verify ConstructorGetParameterType Ext362: TenCtor 10 param all indices idx=0 to 9 notNull via loop using getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TenCtor>();
      let ctor = cls.getConstructors()[0];
      let count = ctor.getParametersNum();
      expect(count).assertEqual(10);
      for (let i = 0; i < count; i++) {
        expect(ctor.getParameterType(i)).not().assertNull();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_7600
     * @tc.name testConstructorGetParameterType2P2Test076
     * @tc.desc Verify ConstructorGetParameterType Ext366: DoubleFieldClass double param getName f64 isPrimitive true and isInterface false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleFieldClass>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0)!;
      expect(result.getName()).assertEqual("f64");
      expect(result.isPrimitive()).assertTrue();
      expect(result.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_7700
     * @tc.name testConstructorGetParameterType2P2Test077
     * @tc.desc Verify ConstructorGetParameterType Ext367: ParamCountCls dual int+string idx=0 getName i32 and idx=1 getName std.core.String not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParamCountCls>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getParameterType(0)!.getName()).assertEqual("i32");
      expect(ctor.getParameterType(1)!.getName()).assertEqual("std.core.String");
      expect(ctor.getParameterType(0)!.getName()).not().assertEqual(ctor.getParameterType(1)!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_7800
     * @tc.name testConstructorGetParameterType2P2Test078
     * @tc.desc Verify ConstructorGetParameterType Ext368: GetParamTypeAC dual int+boolean idx=0 getName i32 and idx=1 getName u1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetParamTypeAC>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getParameterType(0)!.getName()).assertEqual("i32");
      expect(ctor.getParameterType(1)!.getName()).assertEqual("u1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_7900
     * @tc.name testConstructorGetParameterType2P2Test079
     * @tc.desc Verify ConstructorGetParameterType Ext369: GetParamTypeABC triple int+string+boolean idx=0 getName i32 idx=1 getName String idx=2 getName u1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetParamTypeABC>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getParameterType(0)!.getName()).assertEqual("i32");
      expect(ctor.getParameterType(1)!.getName()).assertEqual("std.core.String");
      expect(ctor.getParameterType(2)!.getName()).assertEqual("u1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_8000
     * @tc.name testConstructorGetParameterType2P2Test080
     * @tc.desc Verify ConstructorGetParameterType Ext370: TcPub12 4 int params all idx getName i32 and pairwise equal via loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcPub12>();
      let ctor = cls.getConstructors()[0];
      let first = ctor.getParameterType(0)!.getName();
      expect(first).assertEqual("i32");
      for (let i = 1; i < 4; i++) {
        expect(ctor.getParameterType(i)!.getName()).assertEqual(first);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_8100
     * @tc.name testConstructorGetParameterType2P2Test081
     * @tc.desc Verify ConstructorGetParameterType Ext371: GN3_Mix4ISBD 4 mixed params idx=0 i32 idx=1 String idx=2 u1 idx=3 f64 all notNull
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN3_Mix4ISBD>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getParameterType(0)!.getName()).assertEqual("i32");
      expect(ctor.getParameterType(1)!.getName()).assertEqual("std.core.String");
      expect(ctor.getParameterType(2)!.getName()).assertEqual("u1");
      expect(ctor.getParameterType(3)!.getName()).assertEqual("f64");
      expect(ctor.getParameterType(0)).not().assertNull();
      expect(ctor.getParameterType(1)).not().assertNull();
      expect(ctor.getParameterType(2)).not().assertNull();
      expect(ctor.getParameterType(3)).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_8200
     * @tc.name testConstructorGetParameterType2P2Test082
     * @tc.desc Verify ConstructorGetParameterType Ext372: CtorAllPrim 8 prim params getParametersNum equals 8 and all indices isPrimitive true via loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorAllPrim>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getParametersNum()).assertEqual(8);
      for (let i = 0; i < 8; i++) {
        expect(ctor.getParameterType(i)!.isPrimitive()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_8300
     * @tc.name testConstructorGetParameterType2P2Test083
     * @tc.desc Verify ConstructorGetParameterType Ext374: Ctor_int_String_double triple params i32, std.core.String, f64 with matching isPrimitive flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor_int_String_double>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0)!;
      let r1 = ctor.getParameterType(1)!;
      let r2 = ctor.getParameterType(2)!;
      expect(r0.getName()).assertEqual("i32");
      expect(r0.isPrimitive()).assertTrue();
      expect(r1.getName()).assertEqual("std.core.String");
      expect(r1.isPrimitive()).assertFalse();
      expect(r2.getName()).assertEqual("f64");
      expect(r2.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_8400
     * @tc.name testConstructorGetParameterType2P2Test084
     * @tc.desc Verify ConstructorGetParameterType Ext376: BoolDoubleString triple boolean+double+string idx=0 u1 idx=1 f64 idx=2 String all notNull
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolDoubleString>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getParameterType(0)!.getName()).assertEqual("u1");
      expect(ctor.getParameterType(1)!.getName()).assertEqual("f64");
      expect(ctor.getParameterType(2)!.getName()).assertEqual("std.core.String");
      expect(ctor.getParameterType(0)).not().assertNull();
      expect(ctor.getParameterType(1)).not().assertNull();
      expect(ctor.getParameterType(2)).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_8500
     * @tc.name testConstructorGetParameterType2P2Test085
     * @tc.desc Verify ConstructorGetParameterType Ext377: GetParamTypeBC dual string+boolean idx=0 String and idx=1 u1 getName values not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetParamTypeBC>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getParameterType(0)!.getName()).assertEqual("std.core.String");
      expect(ctor.getParameterType(1)!.getName()).assertEqual("u1");
      expect(ctor.getParameterType(0)!.getName()).not().assertEqual(ctor.getParameterType(1)!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_8600
     * @tc.name testConstructorGetParameterType2P2Test086
     * @tc.desc Verify ConstructorGetParameterType Ext378: ExtInheritChild idx=0 int param getName i32 (inheritance A9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExtInheritChild>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getParameterType(0)!.getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_8700
     * @tc.name testConstructorGetParameterType2P2Test087
     * @tc.desc Verify ConstructorGetParameterType Ext380: ExtInheritChild idx=-1 negative index throws TypeError (inheritance A9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExtInheritChild>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_8800
     * @tc.name testConstructorGetParameterType2P2Test088
     * @tc.desc Verify ConstructorGetParameterType Ext382: CtorTestColor enum param idx=0 result is not null (enum A11)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorTestColor>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_8900
     * @tc.name testConstructorGetParameterType2P2Test089
     * @tc.desc Verify ConstructorGetParameterType Ext383: CtorTestFlag enum param idx=0 not null (enum A11)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorTestFlag>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getParameterType(0)).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_9000
     * @tc.name testConstructorGetParameterType2P2Test090
     * @tc.desc Verify ConstructorGetParameterType Ext385: CtorFixedArrStrParam FixedArray<string> idx=0 getName std.core.String[] (FixedArray B13)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorFixedArrStrParam>();
      let ctor = cls.getConstructors()[0];
      let pt = ctor.getParameterType(0)!;
      expect(pt.getName()).assertEqual("std.core.String[]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_9100
     * @tc.name testConstructorGetParameterType2P2Test091
     * @tc.desc Verify ConstructorGetParameterType Ext386: Eq03_FixedBoolCls FixedArray<boolean> idx=0 isPrimitive false (FixedArray B13)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Eq03_FixedBoolCls>();
      let ctor = cls.getConstructors()[0];
      let pt = ctor.getParameterType(0)!;
      expect(pt.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_9200
     * @tc.name testConstructorGetParameterType2P2Test092
     * @tc.desc Verify ConstructorGetParameterType Ext387: CtorFixArrLong FixedArray<long> idx=0 getName std.core.Long[] (FixedArray B13)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorFixArrLong>();
      let ctor = cls.getConstructors()[0];
      let pt = ctor.getParameterType(0)!;
      expect(pt.getName()).assertEqual("std.core.Long[]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_9300
     * @tc.name testConstructorGetParameterType2P2Test093
     * @tc.desc Verify ConstructorGetParameterType Ext388: Ext4_FixedArrOptParam FixedArray<int> idx=0 result is not null (FixedArray B13)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ext4_FixedArrOptParam>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_9400
     * @tc.name testConstructorGetParameterType2P2Test094
     * @tc.desc Verify ConstructorGetParameterType Ext390: Ext4_FixedArrOptParam FixedArray<int> idx=0 getName std.core.Int[] (FixedArray B13)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ext4_FixedArrOptParam>();
      let ctor = cls.getConstructors()[0];
      let pt = ctor.getParameterType(0)!;
      expect(pt.getName()).assertEqual("std.core.Int[]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_9500
     * @tc.name testConstructorGetParameterType2P2Test095
     * @tc.desc Verify ConstructorGetParameterType Ext392: CtorDataWrap DataWrap class param idx=0 result is not null (nested class A6-like)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorDataWrap>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_9600
     * @tc.name testConstructorGetParameterType2P2Test096
     * @tc.desc Verify ConstructorGetParameterType Ext393: ExtGenChild generic+inheritance idx=0 int param getName i32 (A5 x A9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExtGenChild>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getParameterType(0)!.getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_9700
     * @tc.name testConstructorGetParameterType2P2Test097
     * @tc.desc Verify ConstructorGetParameterType Ext395: ExtGenChild 1 param idx=1 TypeError then getParametersNum 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExtGenChild>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP2_9800
     * @tc.name testConstructorGetParameterType2P2Test098
     * @tc.desc Verify ConstructorGetParameterType Ext396: Ext2_MapStrBoolParam Map<string,boolean> idx=0 getName std.core.Map (complex generic)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P2Test098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ext2_MapStrBoolParam>();
      let ctor = cls.getConstructors()[0];
      let pt = ctor.getParameterType(0)!;
      expect(pt.getName()).assertEqual("std.core.Map");
    });
  });
}
