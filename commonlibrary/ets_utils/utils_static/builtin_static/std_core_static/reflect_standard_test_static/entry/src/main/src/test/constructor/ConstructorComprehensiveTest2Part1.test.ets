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
import {EmptyCls,MultiCtorTarget,DualParamCons,MixedParamCons,ZeroParamCons,SingleParamCons,DoubleFieldClass,Eq02_C,Eq04_StrP,EqOneParam,EqTwoParam,GetParamTypeABC,ParamCountCls,RecovOne,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,TcTwoPubA,} from "../Util.test";

export default function ConstructorComprehensiveTest2Part1(): void {
  describe("ConstructorComprehensiveTest2Part1", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0010
     * @tc.name testConstructorComprehensive2P1Test001
     * @tc.desc Verify ZeroParamCons getOwner returns non-null and getName matches class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ZeroParamCons>().getConstructors()[0];
      expect(ctor.getOwner().getName().includes("ZeroParamCons")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0020
     * @tc.name testConstructorComprehensive2P1Test002
     * @tc.desc Verify ZeroParamCons getReturnType is void and getParameterTypes is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ZeroParamCons>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
      expect(ctor.getParameterTypes().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0030
     * @tc.name testConstructorComprehensive2P1Test003
     * @tc.desc Verify ZeroParamCons getParametersNum is 0 matching getParameterTypes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ZeroParamCons>().getConstructors()[0];
      expect(ctor.getParametersNum()).assertEqual(0);
      expect(ctor.getParameterTypes().length).assertEqual(ctor.getParametersNum());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0040
     * @tc.name testConstructorComprehensive2P1Test004
     * @tc.desc Verify ZeroParamCons isNative false and isPublic true are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ZeroParamCons>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0050
     * @tc.name testConstructorComprehensive2P1Test005
     * @tc.desc Verify ZeroParamCons isPrivate false and isProtected false for public ctor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ZeroParamCons>().getConstructors()[0];
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0060
     * @tc.name testConstructorComprehensive2P1Test006
     * @tc.desc Verify ZeroParamCons getName and getReturnType and getParametersNum cross-check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ZeroParamCons>().getConstructors()[0];
      expect(ctor.getName()).assertEqual("constructor");
      expect(ctor.getReturnType().getName()).assertEqual("void");
      expect(ctor.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0070
     * @tc.name testConstructorComprehensive2P1Test007
     * @tc.desc Verify ZeroParamCons full modifier matrix and getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ZeroParamCons>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0080
     * @tc.name testConstructorComprehensive2P1Test008
     * @tc.desc Verify SingleParamCons getName constructor and getParametersNum 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      expect(ctor.getName()).assertEqual("constructor");
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0090
     * @tc.name testConstructorComprehensive2P1Test009
     * @tc.desc Verify SingleParamCons getParameterTypes length matches getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      expect(ctor.getParameterTypes().length).assertEqual(1);
      expect(ctor.getParametersNum()).assertEqual(ctor.getParameterTypes().length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0100
     * @tc.name testConstructorComprehensive2P1Test010
     * @tc.desc Verify SingleParamCons getReturnType void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0110
     * @tc.name testConstructorComprehensive2P1Test011
     * @tc.desc Verify SingleParamCons isNative false and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0120
     * @tc.name testConstructorComprehensive2P1Test012
     * @tc.desc Verify SingleParamCons isPrivate false and isProtected false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0130
     * @tc.name testConstructorComprehensive2P1Test013
     * @tc.desc Verify SingleParamCons getParameterType 0 returns number type f64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      expect(ctor.getParameterType(0)).not().assertNull();
      expect(ctor.getParameterType(0)!.getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0140
     * @tc.name testConstructorComprehensive2P1Test014
     * @tc.desc Verify SingleParamCons getName length and ParameterTypes getName consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      expect(ctor.getName().length).assertEqual(11);
      expect(ctor.getParameterTypes()[0].getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0150
     * @tc.name testConstructorComprehensive2P1Test015
     * @tc.desc Verify SingleParamCons full modifier matrix and getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0160
     * @tc.name testConstructorComprehensive2P1Test016
     * @tc.desc Verify DualParamCons getName constructor and getParametersNum 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      expect(ctor.getName()).assertEqual("constructor");
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0170
     * @tc.name testConstructorComprehensive2P1Test017
     * @tc.desc Verify DualParamCons getParameterType 0 string and 1 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      expect(ctor.getParameterType(0)!.getName()).assertEqual("std.core.String");
      expect(ctor.getParameterType(1)!.getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0180
     * @tc.name testConstructorComprehensive2P1Test018
     * @tc.desc Verify DualParamCons getParameterTypes length matches getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      expect(ctor.getParameterTypes().length).assertEqual(2);
      expect(ctor.getParametersNum()).assertEqual(ctor.getParameterTypes().length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0190
     * @tc.name testConstructorComprehensive2P1Test019
     * @tc.desc Verify DualParamCons getReturnType void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0200
     * @tc.name testConstructorComprehensive2P1Test020
     * @tc.desc Verify DualParamCons isNative false and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0210
     * @tc.name testConstructorComprehensive2P1Test021
     * @tc.desc Verify DualParamCons isPrivate false and isProtected false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0220
     * @tc.name testConstructorComprehensive2P1Test022
     * @tc.desc Verify DualParamCons getOwner class name is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      expect(ctor.getOwner().getName().includes("DualParamCons")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0230
     * @tc.name testConstructorComprehensive2P1Test023
     * @tc.desc Verify DualParamCons getName length and ParameterTypes getName consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      expect(ctor.getName().length).assertEqual(11);
      expect(ctor.getParameterTypes()[0].getName()).assertEqual("std.core.String");
      expect(ctor.getParameterTypes()[1].getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0240
     * @tc.name testConstructorComprehensive2P1Test024
     * @tc.desc Verify DualParamCons full modifier matrix and getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0250
     * @tc.name testConstructorComprehensive2P1Test025
     * @tc.desc Verify MixedParamCons getName constructor and getParametersNum 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      expect(ctor.getName()).assertEqual("constructor");
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0260
     * @tc.name testConstructorComprehensive2P1Test026
     * @tc.desc Verify MixedParamCons getParameterType 0 boolean and 1 string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      expect(ctor.getParameterType(0)!.getName()).assertEqual("u1");
      expect(ctor.getParameterType(1)!.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0270
     * @tc.name testConstructorComprehensive2P1Test027
     * @tc.desc Verify MixedParamCons getReturnType void and getParameterTypes length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
      expect(ctor.getParameterTypes().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0280
     * @tc.name testConstructorComprehensive2P1Test028
     * @tc.desc Verify MixedParamCons isPublic true and isPrivate isProtected false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0290
     * @tc.name testConstructorComprehensive2P1Test029
     * @tc.desc Verify MixedParamCons getParametersNum consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      expect(ctor.getParametersNum()).assertEqual(ctor.getParameterTypes().length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0300
     * @tc.name testConstructorComprehensive2P1Test030
     * @tc.desc Verify MixedParamCons getReturnType getName and getOwner name consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
      expect(ctor.getOwner().getName().includes("MixedParamCons")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0310
     * @tc.name testConstructorComprehensive2P1Test031
     * @tc.desc Verify MixedParamCons full modifier matrix and parameter count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0320
     * @tc.name testConstructorComprehensive2P1Test032
     * @tc.desc Verify MixedParamCons createInstance wrong args throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0330
     * @tc.name testConstructorComprehensive2P1Test033
     * @tc.desc Verify DualParamCons getParameterType all valid indices non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      for (let i = 0; i < ctor.getParametersNum(); i++) {
        expect(ctor.getParameterType(i)).not().assertNull();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0340
     * @tc.name testConstructorComprehensive2P1Test034
     * @tc.desc Verify DualParamCons getParameterType out of bounds TypeError for multiple indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      let invalidIndices = [2, 100, -1, Int.MIN_VALUE, Int.MAX_VALUE];
      for (let i = 0; i < invalidIndices.length; i++) {
        try {
          ctor.getParameterType(invalidIndices[i]);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("TypeError");
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0350
     * @tc.name testConstructorComprehensive2P1Test035
     * @tc.desc Verify SingleParamCons getParameterType valid index non-null and OOB TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      expect(ctor.getParameterType(0)).not().assertNull();
      try {
        ctor.getParameterType(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0360
     * @tc.name testConstructorComprehensive2P1Test036
     * @tc.desc Verify ZeroParamCons getParameterType always throws TypeError for any index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ZeroParamCons>().getConstructors()[0];
      let indices = [0, -1, Int.MAX_VALUE, Int.MIN_VALUE];
      for (let i = 0; i < indices.length; i++) {
        try {
          ctor.getParameterType(indices[i]);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("TypeError");
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0370
     * @tc.name testConstructorComprehensive2P1Test037
     * @tc.desc Verify MixedParamCons getParameterType 0 and 1 non-null, 2 OOB TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      expect(ctor.getParameterType(0)).not().assertNull();
      expect(ctor.getParameterType(1)).not().assertNull();
      try {
        ctor.getParameterType(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0380
     * @tc.name testConstructorComprehensive2P1Test038
     * @tc.desc Verify SingleParamCons not equal DualParamCons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = Class.from<SingleParamCons>().getConstructors()[0];
      let ctorB = Class.from<DualParamCons>().getConstructors()[0];
      expect(ctorA.equals(ctorB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0390
     * @tc.name testConstructorComprehensive2P1Test039
     * @tc.desc Verify MixedParamCons not equal ZeroParamCons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = Class.from<MixedParamCons>().getConstructors()[0];
      let ctorB = Class.from<ZeroParamCons>().getConstructors()[0];
      expect(ctorA.equals(ctorB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0400
     * @tc.name testConstructorComprehensive2P1Test040
     * @tc.desc Verify DualParamCons not equal MixedParamCons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = Class.from<DualParamCons>().getConstructors()[0];
      let ctorB = Class.from<MixedParamCons>().getConstructors()[0];
      expect(ctorA.equals(ctorB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0410
     * @tc.name testConstructorComprehensive2P1Test041
     * @tc.desc Verify SingleParamCons createInstance with boundary values succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      let boundaries = [0, -1, 255];
      for (let i = 0; i < boundaries.length; i++) {
        let inst = ctor.createInstance([Int.toDouble(boundaries[i])]) as SingleParamCons;
        expect(inst.val_).assertEqual(boundaries[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0420
     * @tc.name testConstructorComprehensive2P1Test042
     * @tc.desc Verify DualParamCons createInstance TypeError with insufficient args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      try {
        ctor.createInstance(['a']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0430
     * @tc.name testConstructorComprehensive2P1Test043
     * @tc.desc Verify SingleParamCons wrong type string for number throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      try {
        ctor.createInstance(['x']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0440
     * @tc.name testConstructorComprehensive2P1Test044
     * @tc.desc Verify SingleParamCons too many args TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([1, 2]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0450
     * @tc.name testConstructorComprehensive2P1Test045
     * @tc.desc Verify DualParamCons too many args TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      try {
        ctor.createInstance(['a', 1, 2]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0460
     * @tc.name testConstructorComprehensive2P1Test046
     * @tc.desc Verify MixedParamCons insufficient args TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0470
     * @tc.name testConstructorComprehensive2P1Test047
     * @tc.desc Verify SingleParamCons wrong type boolean for number throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0480
     * @tc.name testConstructorComprehensive2P1Test048
     * @tc.desc Verify DualParamCons reversed arg order TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([1, 'a']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0490
     * @tc.name testConstructorComprehensive2P1Test049
     * @tc.desc Verify MixedParamCons reversed arg order TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      try {
        ctor.createInstance(['x', true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0500
     * @tc.name testConstructorComprehensive2P1Test050
     * @tc.desc Verify DualParamCons wrong first arg type TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([Int.toDouble(0), 1]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0510
     * @tc.name testConstructorComprehensive2P1Test051
     * @tc.desc Verify ZeroParamCons passing args still TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ZeroParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([Int.toDouble(1)]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0520
     * @tc.name testConstructorComprehensive2P1Test052
     * @tc.desc Verify MixedParamCons both params wrong type TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([1, 2]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0530
     * @tc.name testConstructorComprehensive2P1Test053
     * @tc.desc Verify MixedParamCons createInstance far too many args TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([true, 'x', false, "extra"]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0540
     * @tc.name testConstructorComprehensive2P1Test054
     * @tc.desc Verify DualParamCons both params null TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([null, null]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0550
     * @tc.name testConstructorComprehensive2P1Test055
     * @tc.desc Verify MixedParamCons null first param TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([null, 'x']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0560
     * @tc.name testConstructorComprehensive2P1Test056
     * @tc.desc Verify MixedParamCons null second param TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([true, null]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0570
     * @tc.name testConstructorComprehensive2P1Test057
     * @tc.desc Verify ZeroParamCons two createInstance calls return different objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ZeroParamCons>().getConstructors()[0];
      let inst1 = ctor.createInstance([]) as ZeroParamCons;
      let inst2 = ctor.createInstance([]) as ZeroParamCons;
      expect(inst1).not().assertNull();
      expect(inst2).not().assertNull();
      expect(inst1).not().assertEqual(inst2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0580
     * @tc.name testConstructorComprehensive2P1Test058
     * @tc.desc Verify MixedParamCons createInstance result getOwner consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      let inst = ctor.createInstance([false, "verify"]) as MixedParamCons;
      expect(inst.flag_).assertFalse();
      expect(inst.label_).assertEqual("verify");
      expect(ctor.getOwner().getName().includes("MixedParamCons")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0590
     * @tc.name testConstructorComprehensive2P1Test059
     * @tc.desc Verify SingleParamCons empty args TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      try {
        ctor.createInstance([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0600
     * @tc.name testConstructorComprehensive2P1Test060
     * @tc.desc Verify MixedParamCons createInstance [false, ''] validates default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      let inst = ctor.createInstance([false, '']) as MixedParamCons;
      expect(inst.flag_).assertFalse();
      expect(inst.label_).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0610
     * @tc.name testConstructorComprehensive2P1Test061
     * @tc.desc Verify createInstance does not mutate getName on success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      let nameBefore = ctor.getName();
      ctor.createInstance([true, 'x']);
      let nameAfter = ctor.getName();
      expect(nameAfter).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0620
     * @tc.name testConstructorComprehensive2P1Test062
     * @tc.desc Verify createInstance does not mutate getParametersNum on success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      ctor.createInstance([false, "test"]);
      let numAfter = ctor.getParametersNum();
      expect(numAfter).assertEqual(numBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0630
     * @tc.name testConstructorComprehensive2P1Test063
     * @tc.desc Verify createInstance does not mutate isPublic on success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      ctor.createInstance([]);
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0640
     * @tc.name testConstructorComprehensive2P1Test064
     * @tc.desc Verify createInstance does not mutate getReturnType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      let retBefore = ctor.getReturnType().getName();
      ctor.createInstance([true, 'x']);
      let retAfter = ctor.getReturnType().getName();
      expect(retAfter).assertEqual(retBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0650
     * @tc.name testConstructorComprehensive2P1Test065
     * @tc.desc Verify ZeroParamCons getOwner consistency after createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ZeroParamCons>().getConstructors()[0];
      let ownerBefore = ctor.getOwner().getName();
      ctor.createInstance([]);
      let ownerAfter = ctor.getOwner().getName();
      expect(ownerAfter).assertEqual(ownerBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0660
     * @tc.name testConstructorComprehensive2P1Test066
     * @tc.desc Verify DualParamCons empty string key and zero number succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      let inst = ctor.createInstance(['', Int.toDouble(0)]) as DualParamCons;
      expect(inst.key_).assertEqual('');
      expect(inst.count_).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0670
     * @tc.name testConstructorComprehensive2P1Test067
     * @tc.desc Verify DualParamCons isNative false remains after createInstance error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      try {
        ctor.createInstance([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0680
     * @tc.name testConstructorComprehensive2P1Test068
     * @tc.desc Verify MixedParamCons isPublic true after createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MixedParamCons>().getConstructors()[0];
      ctor.createInstance([false, "test"]);
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0690
     * @tc.name testConstructorComprehensive2P1Test069
     * @tc.desc Verify SingleParamCons getParameterTypes unchanged after createInstance error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SingleParamCons>().getConstructors()[0];
      let typesBefore = ctor.getParameterTypes().length;
      try {
        ctor.createInstance([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      expect(ctor.getParameterTypes().length).assertEqual(typesBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0700
     * @tc.name testConstructorComprehensive2P1Test070
     * @tc.desc Verify DualParamCons getReturnType unchanged after createInstance error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DualParamCons>().getConstructors()[0];
      let retBefore = ctor.getReturnType().getName();
      try {
        ctor.createInstance(['a']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      expect(ctor.getReturnType().getName()).assertEqual(retBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0710
     * @tc.name testConstructorComprehensive2P1Test071
     * @tc.desc Verify MultiCtorTarget getReturnType returns non-null Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MultiCtorTarget>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0720
     * @tc.name testConstructorComprehensive2P1Test072
     * @tc.desc Verify MultiCtorTarget isPublic true and isNative false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MultiCtorTarget>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0730
     * @tc.name testConstructorComprehensive2P1Test073
     * @tc.desc Verify MultiCtorTarget getName and getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MultiCtorTarget>().getConstructors()[0];
      expect(ctor.getName()).assertEqual("constructor");
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0740
     * @tc.name testConstructorComprehensive2P1Test074
     * @tc.desc Verify MultiCtorTarget getParameterTypes returns array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MultiCtorTarget>().getConstructors()[0];
      let params = ctor.getParameterTypes();
      expect(params.length).assertEqual(2);
      expect(params[0].getName()).assertEqual("std.core.Int");
      expect(params[1].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0750
     * @tc.name testConstructorComprehensive2P1Test075
     * @tc.desc Verify getParameterType negative 1 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      try {
        ctor.getParameterType(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0760
     * @tc.name testConstructorComprehensive2P1Test076
     * @tc.desc Verify getParameterType at getParametersNum position throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      try {
        ctor.getParameterType(ctor.getParametersNum());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0770
     * @tc.name testConstructorComprehensive2P1Test077
     * @tc.desc Verify getOwner getName returns Eq04_StrP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Eq04_StrP>().getConstructors()[0];
      expect(ctor.getOwner().getName().includes("Eq04_StrP")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0780
     * @tc.name testConstructorComprehensive2P1Test078
     * @tc.desc Verify getReturnType returns non-null Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      let retType = ctor.getReturnType();
      expect(retType).not().assertNull();
      let name = retType.getName();
      expect(name).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0790
     * @tc.name testConstructorComprehensive2P1Test079
     * @tc.desc Verify getParametersNum for MultiCtorTarget's first constructor (2 optional params) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MultiCtorTarget>().getConstructors()[0];
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0800
     * @tc.name testConstructorComprehensive2P1Test080
     * @tc.desc Verify getParametersNum for 2-param constructor returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      expect(ctor.getParametersNum()).assertEqual(2);
      expect(ctor.getParameterTypes().length).assertEqual(ctor.getParametersNum());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0810
     * @tc.name testConstructorComprehensive2P1Test081
     * @tc.desc Verify isNative for 2-param constructor returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0820
     * @tc.name testConstructorComprehensive2P1Test082
     * @tc.desc Verify isNative for 2-param constructor returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0830
     * @tc.name testConstructorComprehensive2P1Test083
     * @tc.desc Verify isPublic for 2-param constructor returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0840
     * @tc.name testConstructorComprehensive2P1Test084
     * @tc.desc Verify isPrivate for public constructor returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0850
     * @tc.name testConstructorComprehensive2P1Test085
     * @tc.desc Verify equals self invoked twice returns consistent true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      let first: boolean = ctor.equals(ctor);
      let second: boolean = ctor.equals(ctor);
      expect(first).assertTrue();
      expect(second).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0860
     * @tc.name testConstructorComprehensive2P1Test086
     * @tc.desc Verify getParameterType at getParametersNum boundary throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      try {
        let oobIdx: int = ctor.getParametersNum();
        ctor.getParameterType(oobIdx);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0870
     * @tc.name testConstructorComprehensive2P1Test087
     * @tc.desc Verify getParameterType int max boundary throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      try {
        ctor.getParameterType(Int.MAX_VALUE);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0880
     * @tc.name testConstructorComprehensive2P1Test088
     * @tc.desc Verify getParameterType int min boundary throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      try {
        ctor.getParameterType(Int.MIN_VALUE);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0890
     * @tc.name testConstructorComprehensive2P1Test089
     * @tc.desc Verify getOwner getName length equals 47 for ParamCountCls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      expect(ctor.getOwner().getName().length).assertEqual(47);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0900
     * @tc.name testConstructorComprehensive2P1Test090
     * @tc.desc Verify createInstance does not change getParameterTypes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      let beforeLen: int = ctor.getParameterTypes().length;
      ctor.createInstance([42, "test"]);
      let afterLen: int = ctor.getParameterTypes().length;
      expect(afterLen).assertEqual(beforeLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0910
     * @tc.name testConstructorComprehensive2P1Test091
     * @tc.desc Verify createInstance does not change getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      let beforeNum: int = ctor.getParametersNum();
      ctor.createInstance([42, "test"]);
      let afterNum: int = ctor.getParametersNum();
      expect(afterNum).assertEqual(beforeNum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0920
     * @tc.name testConstructorComprehensive2P1Test092
     * @tc.desc Verify createInstance does not change getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      let beforeName: string = ctor.getName();
      ctor.createInstance([42, "test"]);
      let afterName: string = ctor.getName();
      expect(afterName).assertEqual(beforeName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0930
     * @tc.name testConstructorComprehensive2P1Test093
     * @tc.desc Verify equals does not change isNative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      let beforeNative: boolean = ctor.isNative();
      ctor.equals(ctor);
      let afterNative: boolean = ctor.isNative();
      expect(afterNative).assertEqual(beforeNative);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0940
     * @tc.name testConstructorComprehensive2P1Test094
     * @tc.desc Verify getOwner getName includes class name and getConstructors returns one ctor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MultiCtorTarget>().getConstructors()[0];
      let owner1: Class = ctor.getOwner();
      let ownerList = ctor.getOwner().getConstructors();
      expect(owner1.getName().includes("MultiCtorTarget")).assertTrue();
      expect(ownerList.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0950
     * @tc.name testConstructorComprehensive2P1Test095
     * @tc.desc Verify createInstance with 42 and undefined for 2-param returns valid instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MultiCtorTarget>().getConstructors()[0];
      let inst = ctor.createInstance([42, undefined]) as MultiCtorTarget;
      expect(inst).not().assertNull();
      expect(inst.numVal).assertEqual(42);
      expect(inst.strVal).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0960
     * @tc.name testConstructorComprehensive2P1Test096
     * @tc.desc Verify Eq04_StrP optional string param createInstance empty array throws TypeError and getParametersNum still 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Eq04_StrP>().getConstructors()[0];
      try {
        ctor.createInstance([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      expect(ctor.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0970
     * @tc.name testConstructorComprehensive2P1Test097
     * @tc.desc Verify createInstance excess params for 2-param ctor throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      try {
        ctor.createInstance([1, 2, 3]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0980
     * @tc.name testConstructorComprehensive2P1Test098
     * @tc.desc Verify createInstance insufficient params for 2-param ctor throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      try {
        ctor.createInstance([1]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_0990
     * @tc.name testConstructorComprehensive2P1Test099
     * @tc.desc Verify createInstance wrong param type string instead of number throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      try {
        ctor.createInstance(["string", 'x']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1000
     * @tc.name testConstructorComprehensive2P1Test100
     * @tc.desc Verify createInstance second param wrong type number instead of string throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      try {
        ctor.createInstance([1, 2]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1010
     * @tc.name testConstructorComprehensive2P1Test101
     * @tc.desc Verify createInstance float instead of int throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      try {
        ctor.createInstance([1.5, 'x']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1020
     * @tc.name testConstructorComprehensive2P1Test102
     * @tc.desc Verify createInstance null as parameter throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      try {
        ctor.createInstance([null, 'x']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1030
     * @tc.name testConstructorComprehensive2P1Test103
     * @tc.desc Verify createInstance wrong type for Eq04_StrP throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Eq04_StrP>().getConstructors()[0];
      try {
        ctor.createInstance([42]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1040
     * @tc.name testConstructorComprehensive2P1Test104
     * @tc.desc Verify createInstance boolean instead of int throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      try {
        ctor.createInstance([true, 'x']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1050
     * @tc.name testConstructorComprehensive2P1Test105
     * @tc.desc Verify public constructor 4-way access modifier combo: isPublic=true, isPrivate=false, isProtected=false, isNative=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
      expect(ctor.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1060
     * @tc.name testConstructorComprehensive2P1Test106
     * @tc.desc Verify optional-param constructor isPublic=true, isPrivate=false, isProtected=false, isNative=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcTwoPubA>().getConstructors()[0];
      expect(ctor.isPublic()).assertTrue();
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1070
     * @tc.name testConstructorComprehensive2P1Test107
     * @tc.desc Verify createInstance TypeError after getName still returns constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DoubleFieldClass>().getConstructors()[0];
      try {
        ctor.createInstance([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1080
     * @tc.name testConstructorComprehensive2P1Test108
     * @tc.desc Verify createInstance TypeError after getOwner still returns correct owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<RecovOne>().getConstructors()[0];
      try {
        ctor.createInstance([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      expect(ctor.getOwner().getName().includes("RecovOne")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1090
     * @tc.name testConstructorComprehensive2P1Test109
     * @tc.desc Verify createInstance TypeError after getParametersNum still returns correct count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Eq02_C>().getConstructors()[0];
      try {
        ctor.createInstance([1]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1100
     * @tc.name testConstructorComprehensive2P1Test110
     * @tc.desc Verify createInstance TypeError after isPublic still returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DoubleFieldClass>().getConstructors()[0];
      try {
        ctor.createInstance([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1110
     * @tc.name testConstructorComprehensive2P1Test111
     * @tc.desc Verify createInstance TypeError after equals(self) still returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<DoubleFieldClass>().getConstructors()[0];
      try {
        ctor.createInstance([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      expect(ctor.equals(ctor)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1120
     * @tc.name testConstructorComprehensive2P1Test112
     * @tc.desc Verify createInstance with correct argument type number succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<RecovOne>().getConstructors()[0];
      let inst = ctor.createInstance([42.0]) as RecovOne;
      expect(inst.val).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1130
     * @tc.name testConstructorComprehensive2P1Test113
     * @tc.desc Verify Eq04_StrP optional string param createInstance with one arg creates distinct instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Eq04_StrP>().getConstructors()[0];
      let i1 = ctor.createInstance(['a']) as Eq04_StrP;
      let i2 = ctor.createInstance(['b']) as Eq04_StrP;
      expect(i1.val).assertEqual(0);
      expect(i2.val).assertEqual(0);
      expect(i1).not().assertEqual(i2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1140
     * @tc.name testConstructorComprehensive2P1Test114
     * @tc.desc Verify equals false constructors create different type instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor1 = Class.from<EqOneParam>().getConstructors()[0];
      let ctor2 = Class.from<EqTwoParam>().getConstructors()[0];
      expect(ctor1.equals(ctor2)).assertFalse();
      let i1 = ctor1.createInstance([1]) as EqOneParam;
      let i2 = ctor2.createInstance([1, 'a']) as EqTwoParam;
      expect(i1.val).assertEqual(1);
      expect(i2.a).assertEqual(1);
      expect(i2.b).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1150
     * @tc.name testConstructorComprehensive2P1Test115
     * @tc.desc Verify equals symmetry: A.equals(B) = B.equals(A)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor1 = Class.from<TcTwoPubA>().getConstructors()[0];
      let ctor2 = Class.from<ParamCountCls>().getConstructors()[0];
      let r1: boolean = ctor1.equals(ctor2);
      let r2: boolean = ctor2.equals(ctor1);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1160
     * @tc.name testConstructorComprehensive2P1Test116
     * @tc.desc Verify equals consistency: same-class constructors equal, different-class constructors not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = Class.from<EmptyCls>().getConstructors()[0];
      let ctorB = Class.from<EmptyCls>().getConstructors()[0];
      let ctorC = Class.from<ParamCountCls>().getConstructors()[0];
      expect(ctorA.equals(ctorB)).assertTrue();
      expect(ctorB.equals(ctorC)).assertFalse();
      expect(ctorA.equals(ctorC)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1170
     * @tc.name testConstructorComprehensive2P1Test117
     * @tc.desc Verify getParametersNum equals getParameterTypes.length for 0/1/2/3 parameter constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c0 = Class.from<EmptyCls>().getConstructors()[0];
      expect(c0.getParametersNum()).assertEqual(c0.getParameterTypes().length);
      let c1 = Class.from<TcTwoPubA>().getConstructors()[0];
      expect(c1.getParametersNum()).assertEqual(c1.getParameterTypes().length);
      let c2 = Class.from<ParamCountCls>().getConstructors()[0];
      expect(c2.getParametersNum()).assertEqual(c2.getParameterTypes().length);
      let c3 = Class.from<GetParamTypeABC>().getConstructors()[0];
      expect(c3.getParametersNum()).assertEqual(c3.getParameterTypes().length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1180
     * @tc.name testConstructorComprehensive2P1Test118
     * @tc.desc Verify getReturnType for constructors returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
      let ctor2 = Class.from<ParamCountCls>().getConstructors()[0];
      expect(ctor2.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_COMPREHENSIVE_ExtP1_1190
     * @tc.name testConstructorComprehensive2P1Test119
     * @tc.desc Verify getName across 0/1/2/3 parameter constructors all returns constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorComprehensive2P1Test119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c0 = Class.from<EmptyCls>().getConstructors()[0];
      expect(c0.getName()).assertEqual("constructor");
      let c1 = Class.from<TcTwoPubA>().getConstructors()[0];
      expect(c1.getName()).assertEqual("constructor");
      let c2 = Class.from<ParamCountCls>().getConstructors()[0];
      expect(c2.getName()).assertEqual("constructor");
      let c3 = Class.from<GetParamTypeABC>().getConstructors()[0];
      expect(c3.getName()).assertEqual("constructor");
    });
  });
}
