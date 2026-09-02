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
import {DefaultAndRequired_Ext,StringFieldWithMethod,C4,C5,C6Last,TcTwoPubA,IP2_110_PubDefBool,PubByteParam,PubShortParam,IP3_193_PubFloat,PubDouble,Ext4_CharOptParam,C1Object,FiftyParam,C2Byte,PGN_ObjectParam,TcPub19,CtorMultiDimArrParam,IP3_201_PubBoolArr,CtorMultiI,CtorInterface,CtorMixedA,EmptyCls,FiveCtor,GetParamTypeAC,BoolDoubleString,CtorDoubleExtremesParam,CtorTestColor,CtorTestFlag,CtorDataWrap,ExtGenChild,CtorBox,CtorAllPrim,} from "../Util.test";
export default function ConstructorGetParameterTypeTest2Part1(): void {
  describe("ConstructorGetParameterTypeTest2Part1", (): void => {
    beforeAll(() => {});
    beforeEach((): void=> {});
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 50);
      });
    });
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_0100     
     * @tc.name testConstructorGetParameterType2P1Test001
     * @tc.desc Verify ConstructorGetParameterType Ext003: CtorDoubleExtremesParam 3 double param idx=3 equals param count throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorDoubleExtremesParam>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_0200     
     * @tc.name testConstructorGetParameterType2P1Test002
     * @tc.desc Verify ConstructorGetParameterType Ext004: StringFieldWithMethod 1 param constructor string idx=0 returns first param type std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result).not().assertNull();
      expect(result!.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_0300     
     * @tc.name testConstructorGetParameterType2P1Test003
     * @tc.desc Verify ConstructorGetParameterType Ext005: CtorMixedA double boolean param idx=0/1 getName f64 and u1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMixedA>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0);
      let r1 = ctor.getParameterType(1);
      expect(r0!.getName()).assertEqual("f64");
      expect(r1!.getName()).assertEqual("u1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_0400     
     * @tc.name testConstructorGetParameterType2P1Test004
     * @tc.desc Verify ConstructorGetParameterType Ext007: C4 4 param constructor idx=0 returns first param type std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C4>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result).not().assertNull();
      expect(result!.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_0500     
     * @tc.name testConstructorGetParameterType2P1Test005
     * @tc.desc Verify ConstructorGetParameterType Ext014: StringFieldWithMethod 1 param idx=1 out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_0600     
     * @tc.name testConstructorGetParameterType2P1Test006
     * @tc.desc Verify ConstructorGetParameterType Ext018: C5 5 param idx=5 out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C5>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(5);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_0700     
     * @tc.name testConstructorGetParameterType2P1Test007
     * @tc.desc Verify ConstructorGetParameterType Ext019: StringFieldWithMethod 1 param idx=2 far out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(2);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_0800     
     * @tc.name testConstructorGetParameterType2P1Test008
     * @tc.desc Verify ConstructorGetParameterType Ext022: C4 4 param idx=5 far out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C4>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(5);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_0900     
     * @tc.name testConstructorGetParameterType2P1Test009
     * @tc.desc Verify ConstructorGetParameterType Ext023: EmptyCls 0 param idx=-1 negative index throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_1000     
     * @tc.name testConstructorGetParameterType2P1Test010
     * @tc.desc Verify ConstructorGetParameterType Ext024: StringFieldWithMethod 1 param idx=-1 negative index throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_1100     
     * @tc.name testConstructorGetParameterType2P1Test011
     * @tc.desc Verify ConstructorGetParameterType Ext025: DefaultAndRequired_Ext 2 param idx=-1 negative index throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_1200     
     * @tc.name testConstructorGetParameterType2P1Test012
     * @tc.desc Verify ConstructorGetParameterType Ext026: ExtGenChild int param idx=1 equals param count throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExtGenChild>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_1300     
     * @tc.name testConstructorGetParameterType2P1Test013
     * @tc.desc Verify ConstructorGetParameterType Ext027: C4 4 param idx=-1 negative index throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C4>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_1400     
     * @tc.name testConstructorGetParameterType2P1Test014
     * @tc.desc Verify ConstructorGetParameterType Ext028: C5 5 param idx=-1 negative index throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C5>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_1500     
     * @tc.name testConstructorGetParameterType2P1Test015
     * @tc.desc Verify ConstructorGetParameterType Ext031: C4 4 param idx=-4 equals -length throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C4>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-4);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_1600     
     * @tc.name testConstructorGetParameterType2P1Test016
     * @tc.desc Verify ConstructorGetParameterType Ext032: C5 5 param idx=-5 equals -length throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<C5>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-5);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_1700     
     * @tc.name testConstructorGetParameterType2P1Test017
     * @tc.desc Verify ConstructorGetParameterType Ext037: DefaultAndRequired_Ext 2 param idx=2147483647 int max throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(Int.MAX_VALUE);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_1800     
     * @tc.name testConstructorGetParameterType2P1Test018
     * @tc.desc Verify ConstructorGetParameterType Ext038: DefaultAndRequired_Ext 2 param idx=-2147483648 int min throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(Int.MIN_VALUE);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_1900     
     * @tc.name testConstructorGetParameterType2P1Test019
     * @tc.desc Verify ConstructorGetParameterType Ext039: EmptyCls 0 param idx=2147483647 int max throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(Int.MAX_VALUE);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_2000     
     * @tc.name testConstructorGetParameterType2P1Test020
     * @tc.desc Verify ConstructorGetParameterType Ext040: EmptyCls 0 param idx=-2147483648 int min throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(Int.MIN_VALUE);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_2100     
     * @tc.name testConstructorGetParameterType2P1Test021
     * @tc.desc Verify ConstructorGetParameterType Ext041: DefaultAndRequired_Ext 2 param idx=2147483646 int max-1 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(Int.MAX_VALUE - 1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_2200     
     * @tc.name testConstructorGetParameterType2P1Test022
     * @tc.desc Verify ConstructorGetParameterType Ext042: DefaultAndRequired_Ext 2 param idx=-2147483647 int min+1 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(Int.MIN_VALUE + 1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_2300     
     * @tc.name testConstructorGetParameterType2P1Test023
     * @tc.desc Verify ConstructorGetParameterType Ext060: PubByteParam 1 param byte idx=0 getName returns i8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PubByteParam>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName()).assertEqual("i8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_2400     
     * @tc.name testConstructorGetParameterType2P1Test024
     * @tc.desc Verify ConstructorGetParameterType Ext063: IP3_193_PubFloat 1 param float idx=0 getName returns f32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP3_193_PubFloat>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName()).assertEqual("f32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_2500     
     * @tc.name testConstructorGetParameterType2P1Test025
     * @tc.desc Verify ConstructorGetParameterType Ext069: FiftyParam 50 param idx=50 out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FiftyParam>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(50);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_2600     
     * @tc.name testConstructorGetParameterType2P1Test026
     * @tc.desc Verify ConstructorGetParameterType Ext070: FiftyParam 50 param idx=-1 negative index throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FiftyParam>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_2700     
     * @tc.name testConstructorGetParameterType2P1Test027
     * @tc.desc Verify ConstructorGetParameterType Ext071: FiftyParam 50 param idx=-50 equals -length throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FiftyParam>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-50);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_2800     
     * @tc.name testConstructorGetParameterType2P1Test028
     * @tc.desc Verify ConstructorGetParameterType Ext074: DefaultAndRequired_Ext 2 param idx=1-1 expression evaluates to 0 first param getName returns std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(1 - 1);
      expect(result!.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_2900     
     * @tc.name testConstructorGetParameterType2P1Test029
     * @tc.desc Verify ConstructorGetParameterType Ext086: EmptyCls 0 param idx=100 large out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_3000     
     * @tc.name testConstructorGetParameterType2P1Test030
     * @tc.desc Verify ConstructorGetParameterType Ext088: GetParamTypeAC 2 param idx=2 equals param count throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetParamTypeAC>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_3100     
     * @tc.name testConstructorGetParameterType2P1Test031
     * @tc.desc Verify ConstructorGetParameterType Ext089: CtorTestColor enum param idx=-1 negative throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorTestColor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_3200     
     * @tc.name testConstructorGetParameterType2P1Test032
     * @tc.desc Verify ConstructorGetParameterType Ext090: CtorBox GenBox param idx=1 equals param count throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorBox>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_3300     
     * @tc.name testConstructorGetParameterType2P1Test033
     * @tc.desc Verify ConstructorGetParameterType Ext091: StringFieldWithMethod 1 param idx=2147483647 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(Int.MAX_VALUE);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_3400     
     * @tc.name testConstructorGetParameterType2P1Test034
     * @tc.desc Verify ConstructorGetParameterType Ext092: TcTwoPubA 1 param idx=1 out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcTwoPubA>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_3500     
     * @tc.name testConstructorGetParameterType2P1Test035
     * @tc.desc Verify ConstructorGetParameterType Ext093: IP2_110_PubDefBool 1 param idx=-1 negative throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP2_110_PubDefBool>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_3600     
     * @tc.name testConstructorGetParameterType2P1Test036
     * @tc.desc Verify ConstructorGetParameterType Ext094: CtorTestFlag enum param idx=-2147483648 int min throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorTestFlag>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(Int.MIN_VALUE);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_3700     
     * @tc.name testConstructorGetParameterType2P1Test037
     * @tc.desc Verify ConstructorGetParameterType Ext095: CtorInterface ITestable param idx=-1 negative throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorInterface>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-1);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_3800     
     * @tc.name testConstructorGetParameterType2P1Test038
     * @tc.desc Verify ConstructorGetParameterType Ext096: CtorAllPrim 8 param idx=8 equals param count throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorAllPrim>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(8);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_3900     
     * @tc.name testConstructorGetParameterType2P1Test039
     * @tc.desc Verify ConstructorGetParameterType Ext097: DefaultAndRequired_Ext 2 param idx=10 far out of bounds throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DefaultAndRequired_Ext>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_4000     
     * @tc.name testConstructorGetParameterType2P1Test040
     * @tc.desc Verify ConstructorGetParameterType Ext098: PubByteParam 1 param idx=2147483647 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PubByteParam>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(Int.MAX_VALUE);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_4100     
     * @tc.name testConstructorGetParameterType2P1Test041
     * @tc.desc Verify ConstructorGetParameterType Ext099: CtorDataWrap param idx=-2 less than -length throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorDataWrap>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(-2);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_4200     
     * @tc.name testConstructorGetParameterType2P1Test042
     * @tc.desc Verify ConstructorGetParameterType Ext103: PubDouble double param idx=0 isPrimitive is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PubDouble>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_4300     
     * @tc.name testConstructorGetParameterType2P1Test043
     * @tc.desc Verify ConstructorGetParameterType Ext104: EmptyCls 0 param getParametersNum equals getParameterTypes length (both 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      let all = ctor.getParameterTypes();
      expect(ctor.getParametersNum()).assertEqual(all.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_4400     
     * @tc.name testConstructorGetParameterType2P1Test044
     * @tc.desc Verify ConstructorGetParameterType Ext107: IP3_193_PubFloat float param idx=0 isPrimitive is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP3_193_PubFloat>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_4500     
     * @tc.name testConstructorGetParameterType2P1Test045
     * @tc.desc Verify ConstructorGetParameterType Ext108: Ext4_CharOptParam char param idx=0 isPrimitive is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ext4_CharOptParam>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_4600     
     * @tc.name testConstructorGetParameterType2P1Test046
     * @tc.desc Verify ConstructorGetParameterType Ext112: FiveCtor string double byte param idx=0/3/4 getName std.core.String f64 i8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FiveCtor>();
      let ctor = cls.getConstructors()[0];
      let r0 = ctor.getParameterType(0);
      let r3 = ctor.getParameterType(3);
      let r4 = ctor.getParameterType(4);
      expect(r0!.getName()).assertEqual("std.core.String");
      expect(r3!.getName()).assertEqual("f64");
      expect(r4!.getName()).assertEqual("i8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_4700     
     * @tc.name testConstructorGetParameterType2P1Test047
     * @tc.desc Verify ConstructorGetParameterType Ext113: CtorMultiDimArrParam 2D int array param idx=0 getName returns std.core.Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMultiDimArrParam>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_4800     
     * @tc.name testConstructorGetParameterType2P1Test048
     * @tc.desc Verify ConstructorGetParameterType Ext114: IP3_201_PubBoolArr boolean array param idx=0 getName returns std.core.Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IP3_201_PubBoolArr>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_4900     
     * @tc.name testConstructorGetParameterType2P1Test049
     * @tc.desc Verify ConstructorGetParameterType Ext122: Ext4_CharOptParam char param idx=0 isPrimitive false and getName std.core.Char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ext4_CharOptParam>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.isPrimitive()).assertFalse();
      expect(result!.getName()).assertEqual("std.core.Char");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_5000     
     * @tc.name testConstructorGetParameterType2P1Test050
     * @tc.desc Verify ConstructorGetParameterType Ext125: PGN_ObjectParam object param idx=0 isPrimitive is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PGN_ObjectParam>();
      let ctor = cls.getConstructors()[0];
      let result = ctor.getParameterType(0);
      expect(result!.isPrimitive()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_5100     
     * @tc.name testConstructorGetParameterType2P1Test051
     * @tc.desc Verify ConstructorGetParameterType Ext129: EmptyCls no param getParameterType(0) throws TypeError and getParameterTypes length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      let all = ctor.getParameterTypes();
      expect(all.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_5200     
     * @tc.name testConstructorGetParameterType2P1Test052
     * @tc.desc Verify ConstructorGetParameterType Ext131: CtorMultiI 5 param all indices match getParameterTypes getName array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CtorMultiI>();
      let ctor = cls.getConstructors()[0];
      let all = ctor.getParameterTypes();
      let match = true;
      for (let i = 0; i < 5; i++) {
        if (ctor.getParameterType(i)!.getName() !== all[i].getName()) {
          match = false;
        }
      }
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_ExtP1_5300     
     * @tc.name testConstructorGetParameterType2P1Test053
     * @tc.desc Verify ConstructorGetParameterType Ext132: StringFieldWithMethod getParameterType(1) throws TypeError and getParametersNum 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetParameterType2P1Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.getParameterType(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      expect(ctor.getParametersNum()).assertEqual(1);
    });
  });
}
