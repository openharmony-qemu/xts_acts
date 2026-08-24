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

import {IsPrivateWithFactory,PrivateCtorTwoParams,GetParamTypeABC,Priv3IntStrBoolExt2,StringFieldWithMethod,PrivSpecialStrDefault,IP2_136_PrivIntArr,Eq04_TripleOL,FiveCallPub_L4434,Pub9IntExt,Pub11IntExt,TcPriv5,Priv2StrBoolExt,Priv2IntDoubleExt,Priv2BoolIntExt,Priv2StrDoubleExt,Priv2IntBoolExt,Priv2DoubleStrExt,Priv2LongIntExt,Priv2ShortByteExt,Priv2FloatBoolExt,IP3_218_PubIntDbl,Pub2BoolIntExt,TcPub10,Pub2DoubleStrExt,Pub2LongIntExt,Pub2ShortByteExt,Pub2FloatBoolExt,MultiPrivPubExt,MultiPrivProtExt,MultiPubProtExt,Priv3IntStrDoubleExt2,Priv3StrDoubleIntExt2,Priv3BoolIntFloatExt2,Priv3ShortIntDoubleExt2,Priv3LongIntShortExt2,Priv3ByteFloatBoolExt2,Pub3StrDoubleIntExt2,Pub3BoolIntFloatExt2,Pub3ShortIntDoubleExt2,Pub3LongIntShortExt2,Pub3ByteFloatBoolExt2,TcGapPriv4Param,Priv5IntStrBoolDoubleFloatExt2,Pub5IntStrBoolDoubleFloatExt2,Priv6IntStrBoolDoubleFloatLongExt2,Pub6IntStrBoolDoubleFloatLongExt2,Priv4StrBoolDoubleFloatExt,Pub4StrBoolDoubleFloatExt,Priv5LongIntShortByteBoolExt,Pub5LongIntShortByteBoolExt,Priv7IntStrBoolDoubleFloatLongShortExt,Pub7IntStrBoolDoubleFloatLongShortExt,MultiAllExt,MultiPrivPrivExt,MultiPrivTripleExt,MultiPubTripleExt,PrivObjParam,ProtObjParam,PubCustomParam,PrivCustomParam,PrivFixedArrParam,ProtFixedArrParam,PubObjIntParam,PrivObjIntParam,PubCustomStrParam,PrivCustomStrParam,PubObjIntDoubleParam,PrivObjIntDoubleParam,GN_P10,Pub12IntExt,Pub15IntExt,TcPub3,TcPriv4,GN_P2,Eq03_ImmC,Pub2IntDoubleExt,Pub2IntBoolExt,Eq03_ImmE,GN_LoopUpper,TcGapObj,PubFixedArrParam,PubNullDefault,PrivNullDefault,PrivEmptyStrDefault,PrivUnicodeDefault,PrivMinIntDefault,PrivMaxIntDefault,PrivHexDefault,PrivBinDefault,} from "../Util.test";
export default function ConstructorIsPrivateTest2Part2(): void {
  describe("ConstructorIsPrivateTest2Part2", (): void => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 150);
      });
    });
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_0100     
     * @tc.name testConstructorIsPrivate2P2Test001
     * @tc.desc Verify public 9-int-param constructor (Pub9IntExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub9IntExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_0200     
     * @tc.name testConstructorIsPrivate2P2Test002
     * @tc.desc Verify public 10-int-param constructor (GN_P10) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<GN_P10>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_0300     
     * @tc.name testConstructorIsPrivate2P2Test003
     * @tc.desc Verify public 11-int-param constructor (Pub11IntExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub11IntExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_0400     
     * @tc.name testConstructorIsPrivate2P2Test004
     * @tc.desc Verify public 12-int-param constructor (Pub12IntExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub12IntExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_0500     
     * @tc.name testConstructorIsPrivate2P2Test005
     * @tc.desc Verify Class.of instance constructor isPrivate returns false and parameters num is 2 for GN_P2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new GN_P2(1, 's');
      let cls = Class.of(obj);
      let ctor = cls.getConstructors()[0];
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_0600     
     * @tc.name testConstructorIsPrivate2P2Test006
     * @tc.desc Verify public Object-param constructor isPrivate returns false and isPublic returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<TcGapObj>().getConstructors()[0];
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_0700     
     * @tc.name testConstructorIsPrivate2P2Test007
     * @tc.desc Verify public 15-int-param constructor (Pub15IntExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub15IntExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_0800     
     * @tc.name testConstructorIsPrivate2P2Test008
     * @tc.desc Verify private double-param constructor (TcPriv5) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcPriv5>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_0900     
     * @tc.name testConstructorIsPrivate2P2Test009
     * @tc.desc Verify public double-param constructor (TcPub3) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcPub3>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_1000     
     * @tc.name testConstructorIsPrivate2P2Test010
     * @tc.desc Verify private (int, string) constructor (TcPriv4) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcPriv4>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_1100     
     * @tc.name testConstructorIsPrivate2P2Test011
     * @tc.desc Verify private (string, boolean) constructor (Priv2StrBoolExt) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv2StrBoolExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_1200     
     * @tc.name testConstructorIsPrivate2P2Test012
     * @tc.desc Verify private (int, double) constructor (Priv2IntDoubleExt) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv2IntDoubleExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_1300     
     * @tc.name testConstructorIsPrivate2P2Test013
     * @tc.desc Verify private (boolean, int) constructor (Priv2BoolIntExt) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv2BoolIntExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_1400     
     * @tc.name testConstructorIsPrivate2P2Test014
     * @tc.desc Verify private (string, double) constructor (Priv2StrDoubleExt) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv2StrDoubleExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_1500     
     * @tc.name testConstructorIsPrivate2P2Test015
     * @tc.desc Verify private (int, boolean) constructor (Priv2IntBoolExt) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv2IntBoolExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_1600     
     * @tc.name testConstructorIsPrivate2P2Test016
     * @tc.desc Verify private (double, string) constructor (Priv2DoubleStrExt) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv2DoubleStrExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_1700     
     * @tc.name testConstructorIsPrivate2P2Test017
     * @tc.desc Verify private (long, int) constructor (Priv2LongIntExt) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv2LongIntExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_1800     
     * @tc.name testConstructorIsPrivate2P2Test018
     * @tc.desc Verify private (short, byte) constructor (Priv2ShortByteExt) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv2ShortByteExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_1900     
     * @tc.name testConstructorIsPrivate2P2Test019
     * @tc.desc Verify private (float, boolean) constructor (Priv2FloatBoolExt) getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv2FloatBoolExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_2000     
     * @tc.name testConstructorIsPrivate2P2Test020
     * @tc.desc Verify public (int, string) constructor (GN_P2) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<GN_P2>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_2100     
     * @tc.name testConstructorIsPrivate2P2Test021
     * @tc.desc Verify public (string, boolean) constructor (Eq03_ImmC) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Eq03_ImmC>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_2200     
     * @tc.name testConstructorIsPrivate2P2Test022
     * @tc.desc Verify public (int, double) constructor (Pub2IntDoubleExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub2IntDoubleExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_2300     
     * @tc.name testConstructorIsPrivate2P2Test023
     * @tc.desc Verify public (boolean, int) constructor (Pub2BoolIntExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub2BoolIntExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_2400     
     * @tc.name testConstructorIsPrivate2P2Test024
     * @tc.desc Verify public (string, double) constructor (TcPub10) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcPub10>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_2500     
     * @tc.name testConstructorIsPrivate2P2Test025
     * @tc.desc Verify public (int, boolean) constructor (Pub2IntBoolExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub2IntBoolExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_2600     
     * @tc.name testConstructorIsPrivate2P2Test026
     * @tc.desc Verify public (double, string) constructor (Pub2DoubleStrExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub2DoubleStrExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_2700     
     * @tc.name testConstructorIsPrivate2P2Test027
     * @tc.desc Verify public (long, int) constructor (Pub2LongIntExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub2LongIntExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_2800     
     * @tc.name testConstructorIsPrivate2P2Test028
     * @tc.desc Verify public (short, byte) constructor (Pub2ShortByteExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub2ShortByteExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_2900     
     * @tc.name testConstructorIsPrivate2P2Test029
     * @tc.desc Verify public (float, boolean) constructor (Pub2FloatBoolExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub2FloatBoolExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_3000     
     * @tc.name testConstructorIsPrivate2P2Test030
     * @tc.desc Verify mixed private+public overload (MultiPrivPubExt) getConstructors returns only public ctor (isPrivate false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<MultiPrivPubExt>().getConstructors();
      if (ctors.length > 1) {
        expect(ctors[1].isPrivate()).assertFalse();
      } else {
        expect(ctors.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_3100     
     * @tc.name testConstructorIsPrivate2P2Test031
     * @tc.desc Verify mixed private+protected overload (MultiPrivProtExt) private ctor index 0 getConstructors empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<MultiPrivProtExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_3200     
     * @tc.name testConstructorIsPrivate2P2Test032
     * @tc.desc Verify mixed private+protected overload (MultiPrivProtExt) getConstructors returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<MultiPrivProtExt>().getConstructors();
      if (ctors.length > 1) {
        expect(ctors[1].isPrivate()).assertFalse();
      } else {
        expect(ctors.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_3300     
     * @tc.name testConstructorIsPrivate2P2Test033
     * @tc.desc Verify mixed public+protected overload (MultiPubProtExt) public ctor index 0 isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<MultiPubProtExt>().getConstructors();
      expect(ctors[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_3400     
     * @tc.name testConstructorIsPrivate2P2Test034
     * @tc.desc Verify private 3-param (int, string, double) constructor (Priv3IntStrDoubleExt2) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv3IntStrDoubleExt2>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_3500     
     * @tc.name testConstructorIsPrivate2P2Test035
     * @tc.desc Verify private 3-param (string, double, int) constructor (Priv3StrDoubleIntExt2) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv3StrDoubleIntExt2>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_3600     
     * @tc.name testConstructorIsPrivate2P2Test036
     * @tc.desc Verify private 3-param (boolean, int, float) constructor (Priv3BoolIntFloatExt2) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv3BoolIntFloatExt2>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_3700     
     * @tc.name testConstructorIsPrivate2P2Test037
     * @tc.desc Verify private 3-param (short, int, double) constructor (Priv3ShortIntDoubleExt2) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv3ShortIntDoubleExt2>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_3800     
     * @tc.name testConstructorIsPrivate2P2Test038
     * @tc.desc Verify private 3-param (long, int, short) constructor (Priv3LongIntShortExt2) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv3LongIntShortExt2>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_3900     
     * @tc.name testConstructorIsPrivate2P2Test039
     * @tc.desc Verify private 3-param (byte, float, boolean) constructor (Priv3ByteFloatBoolExt2) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv3ByteFloatBoolExt2>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_4000     
     * @tc.name testConstructorIsPrivate2P2Test040
     * @tc.desc Verify public 3-param (int, string, double) constructor (Eq03_ImmE) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Eq03_ImmE>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_4100     
     * @tc.name testConstructorIsPrivate2P2Test041
     * @tc.desc Verify public 3-param (string, double, int) constructor (Pub3StrDoubleIntExt2) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub3StrDoubleIntExt2>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_4200     
     * @tc.name testConstructorIsPrivate2P2Test042
     * @tc.desc Verify public 3-param (boolean, int, float) constructor (Pub3BoolIntFloatExt2) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub3BoolIntFloatExt2>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_4300     
     * @tc.name testConstructorIsPrivate2P2Test043
     * @tc.desc Verify public 3-param (short, int, double) constructor (Pub3ShortIntDoubleExt2) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub3ShortIntDoubleExt2>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_4400     
     * @tc.name testConstructorIsPrivate2P2Test044
     * @tc.desc Verify public 3-param (long, int, short) constructor (Pub3LongIntShortExt2) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub3LongIntShortExt2>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_4500     
     * @tc.name testConstructorIsPrivate2P2Test045
     * @tc.desc Verify public 3-param (byte, float, boolean) constructor (Pub3ByteFloatBoolExt2) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub3ByteFloatBoolExt2>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_4600     
     * @tc.name testConstructorIsPrivate2P2Test046
     * @tc.desc Verify private 4-param (int, string, boolean, double) constructor (TcGapPriv4Param) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcGapPriv4Param>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_4700     
     * @tc.name testConstructorIsPrivate2P2Test047
     * @tc.desc Verify public 4-param (int, string, boolean, double) constructor (GN_LoopUpper) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<GN_LoopUpper>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_4800     
     * @tc.name testConstructorIsPrivate2P2Test048
     * @tc.desc Verify private 5-param (int, string, boolean, double, float) constructor (Priv5IntStrBoolDoubleFloatExt2) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv5IntStrBoolDoubleFloatExt2>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_4900     
     * @tc.name testConstructorIsPrivate2P2Test049
     * @tc.desc Verify public 5-param (int, string, boolean, double, float) constructor (Pub5IntStrBoolDoubleFloatExt2) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub5IntStrBoolDoubleFloatExt2>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_5000     
     * @tc.name testConstructorIsPrivate2P2Test050
     * @tc.desc Verify private 6-param (int, string, boolean, double, float, long) constructor (Priv6IntStrBoolDoubleFloatLongExt2) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv6IntStrBoolDoubleFloatLongExt2>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_5100     
     * @tc.name testConstructorIsPrivate2P2Test051
     * @tc.desc Verify public 6-param (int, string, boolean, double, float, long) constructor (Pub6IntStrBoolDoubleFloatLongExt2) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub6IntStrBoolDoubleFloatLongExt2>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_5200     
     * @tc.name testConstructorIsPrivate2P2Test052
     * @tc.desc Verify isPrivate returns false for implicit default constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<FiveCallPub_L4434>().getConstructors()[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_5300     
     * @tc.name testConstructorIsPrivate2P2Test053
     * @tc.desc Verify isPrivate equals !isPublic for implicit default constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<FiveCallPub_L4434>().getConstructors()[0];
      expect(ctor.isPrivate()).assertEqual(!ctor.isPublic());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_5400     
     * @tc.name testConstructorIsPrivate2P2Test054
     * @tc.desc Verify private 4-param (string,boolean,double,float) constructor getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv4StrBoolDoubleFloatExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_5500     
     * @tc.name testConstructorIsPrivate2P2Test055
     * @tc.desc Verify public 4-param (string,boolean,double,float) constructor isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub4StrBoolDoubleFloatExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_5600     
     * @tc.name testConstructorIsPrivate2P2Test056
     * @tc.desc Verify private 5-param (long,int,short,byte,boolean) constructor getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv5LongIntShortByteBoolExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_5700     
     * @tc.name testConstructorIsPrivate2P2Test057
     * @tc.desc Verify public 5-param (long,int,short,byte,boolean) constructor isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub5LongIntShortByteBoolExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_5800     
     * @tc.name testConstructorIsPrivate2P2Test058
     * @tc.desc Verify private 7-param (int,string,boolean,double,float,long,short) constructor getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv7IntStrBoolDoubleFloatLongShortExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_5900     
     * @tc.name testConstructorIsPrivate2P2Test059
     * @tc.desc Verify public 7-param (int,string,boolean,double,float,long,short) constructor isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub7IntStrBoolDoubleFloatLongShortExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_6000     
     * @tc.name testConstructorIsPrivate2P2Test060
     * @tc.desc Verify private 3-param (int,string,boolean) constructor getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Priv3IntStrBoolExt2>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_6100     
     * @tc.name testConstructorIsPrivate2P2Test061
     * @tc.desc Verify getConstructors returns only the public ctor for three-way overload class and isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<MultiAllExt>().getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_6200     
     * @tc.name testConstructorIsPrivate2P2Test062
     * @tc.desc Verify two private overloaded constructors both return isPrivate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<MultiPrivPrivExt>().getConstructors();
      try {
        expect(ctors[0].isPrivate()).assertTrue();
        expect(ctors[1].isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_6300     
     * @tc.name testConstructorIsPrivate2P2Test063
     * @tc.desc Verify three public overloads all return isPrivate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<MultiPubTripleExt>().getConstructors();
      expect(ctors.length).assertEqual(3);
      for (let i = 0; i < ctors.length; i++) {
        expect(ctors[i].isPrivate()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_6400     
     * @tc.name testConstructorIsPrivate2P2Test064
     * @tc.desc Verify three private overloads all return isPrivate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<MultiPrivTripleExt>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_6500     
     * @tc.name testConstructorIsPrivate2P2Test065
     * @tc.desc Verify private constructor in class with member method returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IsPrivateWithFactory>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_6600     
     * @tc.name testConstructorIsPrivate2P2Test066
     * @tc.desc Verify private two-param constructor isPrivate returns true and isNative false or throws on empty access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateCtorTwoParams>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect(ctor.isNative()).assertFalse();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_6700     
     * @tc.name testConstructorIsPrivate2P2Test067
     * @tc.desc Verify private int-array constructor returns isPrivate true or throws on empty ctors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP2_136_PrivIntArr>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_6800     
     * @tc.name testConstructorIsPrivate2P2Test068
     * @tc.desc Verify class with method public constructor isPrivate returns false and getName is constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringFieldWithMethod>().getConstructors()[0];
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_6900     
     * @tc.name testConstructorIsPrivate2P2Test069
     * @tc.desc Verify public (int, double) constructor isPrivate returns false and isProtected returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<IP3_218_PubIntDbl>().getConstructors()[0];
      expect(ctor.isPrivate()).assertFalse();
      expect(ctor.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_7000     
     * @tc.name testConstructorIsPrivate2P2Test070
     * @tc.desc Verify all overloaded public constructors of Eq04_TripleOL return isPrivate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Eq04_TripleOL>().getConstructors();
      expect(ctors.length).assertEqual(3);
      for (let i = 0; i < ctors.length; i++) {
        expect(ctors[i].isPrivate()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_7100     
     * @tc.name testConstructorIsPrivate2P2Test071
     * @tc.desc Verify public constructor with Object param (TcGapObj) isPrivate returns false (A1xB10xD1xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcGapObj>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_7200     
     * @tc.name testConstructorIsPrivate2P2Test072
     * @tc.desc Verify private constructor with Object param (PrivObjParam) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xB10xD2xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivObjParam>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_7300     
     * @tc.name testConstructorIsPrivate2P2Test073
     * @tc.desc Verify protected constructor with Object param (ProtObjParam) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xB10xD3xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<ProtObjParam>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertFalse();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_7400     
     * @tc.name testConstructorIsPrivate2P2Test074
     * @tc.desc Verify public constructor with custom class param (PubCustomParam) isPrivate returns false (A1xB11xD1xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PubCustomParam>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_7500     
     * @tc.name testConstructorIsPrivate2P2Test075
     * @tc.desc Verify private constructor with custom class param (PrivCustomParam) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xB11xD2xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivCustomParam>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_7600     
     * @tc.name testConstructorIsPrivate2P2Test076
     * @tc.desc Verify public constructor with FixedArray<int> param (PubFixedArrParam) isPrivate returns false (A1xB13xD1xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PubFixedArrParam>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_7700     
     * @tc.name testConstructorIsPrivate2P2Test077
     * @tc.desc Verify private constructor with FixedArray<int> param (PrivFixedArrParam) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xB13xD2xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivFixedArrParam>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_7800     
     * @tc.name testConstructorIsPrivate2P2Test078
     * @tc.desc Verify protected constructor with FixedArray<int> param (ProtFixedArrParam) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xB13xD3xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<ProtFixedArrParam>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertFalse();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_7900     
     * @tc.name testConstructorIsPrivate2P2Test079
     * @tc.desc Verify public 2-param (Object, int) constructor (PubObjIntParam) isPrivate returns false (A1xB10xD1xE2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PubObjIntParam>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_8000     
     * @tc.name testConstructorIsPrivate2P2Test080
     * @tc.desc Verify private 2-param (Object, int) constructor (PrivObjIntParam) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xB10xD2xE2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivObjIntParam>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_8100     
     * @tc.name testConstructorIsPrivate2P2Test081
     * @tc.desc Verify public 2-param (custom class, string) constructor (PubCustomStrParam) isPrivate returns false (A1xB11xD1xE2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PubCustomStrParam>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_8200     
     * @tc.name testConstructorIsPrivate2P2Test082
     * @tc.desc Verify private 2-param (custom class, string) constructor (PrivCustomStrParam) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xB11xD2xE2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivCustomStrParam>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_8300     
     * @tc.name testConstructorIsPrivate2P2Test083
     * @tc.desc Verify public 3-param (Object, int, double) constructor (PubObjIntDoubleParam) isPrivate returns false (A1xB10xD1xE3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PubObjIntDoubleParam>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_8400     
     * @tc.name testConstructorIsPrivate2P2Test084
     * @tc.desc Verify private 3-param (Object, int, double) constructor (PrivObjIntDoubleParam) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xB10xD2xE3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivObjIntDoubleParam>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_8500     
     * @tc.name testConstructorIsPrivate2P2Test085
     * @tc.desc Verify public optional null-default constructor (PubNullDefault) isPrivate returns false (A1xC5xD1xE5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PubNullDefault>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_8600     
     * @tc.name testConstructorIsPrivate2P2Test086
     * @tc.desc Verify private optional null-default constructor (PrivNullDefault) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xC5xD2xE5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivNullDefault>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_8700     
     * @tc.name testConstructorIsPrivate2P2Test087
     * @tc.desc Verify private constructor with empty string default (PrivEmptyStrDefault) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xC6xD2xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivEmptyStrDefault>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_8800     
     * @tc.name testConstructorIsPrivate2P2Test088
     * @tc.desc Verify private constructor with special char string default (PrivSpecialStrDefault) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xC7xD2xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivSpecialStrDefault>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_8900     
     * @tc.name testConstructorIsPrivate2P2Test089
     * @tc.desc Verify private constructor with Unicode string default (PrivUnicodeDefault) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xC8xD2xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivUnicodeDefault>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_9000     
     * @tc.name testConstructorIsPrivate2P2Test090
     * @tc.desc Verify private constructor with int MIN_VALUE default (PrivMinIntDefault) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xC1xD2xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivMinIntDefault>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_9100     
     * @tc.name testConstructorIsPrivate2P2Test091
     * @tc.desc Verify private constructor with int MAX_VALUE default (PrivMaxIntDefault) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xC2xD2xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivMaxIntDefault>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_9200     
     * @tc.name testConstructorIsPrivate2P2Test092
     * @tc.desc Verify private constructor with hex literal default (PrivHexDefault) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xC9xD2xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivHexDefault>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP2_9300     
     * @tc.name testConstructorIsPrivate2P2Test093
     * @tc.desc Verify private constructor with binary literal default (PrivBinDefault) getConstructors empty, index access throws ArrayIndexOutOfBoundsError (A1xC9xD2xE1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P2Test093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivBinDefault>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });
  });
}
