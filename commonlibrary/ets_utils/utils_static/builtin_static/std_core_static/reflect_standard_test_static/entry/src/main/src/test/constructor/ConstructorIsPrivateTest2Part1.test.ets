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

import {EmptyCls,IsPrivateWithFactory,IsProtectedWithStatic,TcTwoPubA,PrivateCtorWithDefault,ParamCountCls,PrivateCtorTwoParams,PublicCtorThreeParams,PrivateCtorThreeParams,GetParamTypeABC,StringFieldWithMethod,PrivSpecialStrDefault,IP2_110_PubDefBool,IP5_278_PrivDefBool,TcPub19,ChildPublicCtor,ChildPrivateCtor,ChildProtectedCtor,TwoSameInt,ThreeOverloadPrivateCtor,PubDouble,PubIfcImpl,IP3_193_PubFloat,PubShortParam,PubByteParam,Ext4_CharOptParam,TcPub12,GN_P5,Pub6IntExt,Pub7IntExt,MultiPrivPubExt,PubGen,PubGenTwo,DefGenNoCtor,NoModCtor,DefaultCtor,PublicCtorEmpty,ProtectedCtorEmpty,PublicCtorIntParam,PublicCtorTwoParams,PublicMixedParams,PublicCtorWithDefault,PublicStrCtor,PublicBoolCtor,PublicArrCtor,ParentBase,PublicOverloadedCtor,ThreeOverloadPublicCtor,PrivateCtorEmpty,PrivateCtorIntParam,PrivateMixedParams,PrivateStrCtor,PrivateBoolCtor,PrivateArrCtor,UtilityClass,PrivateOverloadedCtor,} from "../Util.test";
export default function ConstructorIsPrivateTest2Part1(): void {
  describe("ConstructorIsPrivateTest2Part1", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_0100     
     * @tc.name testConstructorIsPrivate2P1Test001
     * @tc.desc Verify public constructor (NoModCtor) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<NoModCtor>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_0200     
     * @tc.name testConstructorIsPrivate2P1Test002
     * @tc.desc Verify public constructor with field (DefaultCtor) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<DefaultCtor>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_0300     
     * @tc.name testConstructorIsPrivate2P1Test003
     * @tc.desc Verify public empty constructor (PublicCtorEmpty) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PublicCtorEmpty>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_0400     
     * @tc.name testConstructorIsPrivate2P1Test004
     * @tc.desc Verify protected-only class (ProtectedCtorEmpty) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<ProtectedCtorEmpty>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertFalse();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_0500     
     * @tc.name testConstructorIsPrivate2P1Test005
     * @tc.desc Verify public int-param constructor (PublicCtorIntParam) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PublicCtorIntParam>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_0600     
     * @tc.name testConstructorIsPrivate2P1Test006
     * @tc.desc Verify public two-param constructor (PublicCtorTwoParams) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PublicCtorTwoParams>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_0700     
     * @tc.name testConstructorIsPrivate2P1Test007
     * @tc.desc Verify public three-param constructor (PublicCtorThreeParams) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PublicCtorThreeParams>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_0800     
     * @tc.name testConstructorIsPrivate2P1Test008
     * @tc.desc Verify public mixed-param constructor (PublicMixedParams) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PublicMixedParams>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_0900     
     * @tc.name testConstructorIsPrivate2P1Test009
     * @tc.desc Verify public default-param constructor (PublicCtorWithDefault) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PublicCtorWithDefault>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_1000     
     * @tc.name testConstructorIsPrivate2P1Test010
     * @tc.desc Verify public string-param constructor (PublicStrCtor) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PublicStrCtor>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_1100     
     * @tc.name testConstructorIsPrivate2P1Test011
     * @tc.desc Verify public bool-param constructor (PublicBoolCtor) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PublicBoolCtor>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_1200     
     * @tc.name testConstructorIsPrivate2P1Test012
     * @tc.desc Verify public array-param constructor (PublicArrCtor) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PublicArrCtor>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_1300     
     * @tc.name testConstructorIsPrivate2P1Test013
     * @tc.desc Verify base class public constructor (ParentBase) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<ParentBase>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_1400     
     * @tc.name testConstructorIsPrivate2P1Test014
     * @tc.desc Verify child class public constructor (ChildPublicCtor) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<ChildPublicCtor>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_1500     
     * @tc.name testConstructorIsPrivate2P1Test015
     * @tc.desc Verify protected-only class (ChildProtectedCtor) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<ChildProtectedCtor>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertFalse();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_1600     
     * @tc.name testConstructorIsPrivate2P1Test016
     * @tc.desc Verify public overloaded constructor index 0 (PublicOverloadedCtor) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PublicOverloadedCtor>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_1700     
     * @tc.name testConstructorIsPrivate2P1Test017
     * @tc.desc Verify triple overload public constructor index 0 (ThreeOverloadPublicCtor) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<ThreeOverloadPublicCtor>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_1800     
     * @tc.name testConstructorIsPrivate2P1Test018
     * @tc.desc Verify private-only class (PrivateCtorEmpty) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateCtorEmpty>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_1900     
     * @tc.name testConstructorIsPrivate2P1Test019
     * @tc.desc Verify private-only class (PrivateCtorIntParam) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateCtorIntParam>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_2000     
     * @tc.name testConstructorIsPrivate2P1Test020
     * @tc.desc Verify private-only class (PrivateCtorTwoParams) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateCtorTwoParams>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_2100     
     * @tc.name testConstructorIsPrivate2P1Test021
     * @tc.desc Verify private-only class (PrivateCtorThreeParams) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateCtorThreeParams>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_2200     
     * @tc.name testConstructorIsPrivate2P1Test022
     * @tc.desc Verify private-only class (PrivateMixedParams) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateMixedParams>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_2300     
     * @tc.name testConstructorIsPrivate2P1Test023
     * @tc.desc Verify private-only class (PrivateCtorWithDefault) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateCtorWithDefault>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_2400     
     * @tc.name testConstructorIsPrivate2P1Test024
     * @tc.desc Verify private-only class (PrivateStrCtor) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateStrCtor>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_2500     
     * @tc.name testConstructorIsPrivate2P1Test025
     * @tc.desc Verify private-only class (PrivateBoolCtor) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateBoolCtor>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_2600     
     * @tc.name testConstructorIsPrivate2P1Test026
     * @tc.desc Verify private-only class (PrivateArrCtor) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateArrCtor>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_2700     
     * @tc.name testConstructorIsPrivate2P1Test027
     * @tc.desc Verify private-only class (ChildPrivateCtor) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<ChildPrivateCtor>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_2800     
     * @tc.name testConstructorIsPrivate2P1Test028
     * @tc.desc Verify private-only class (UtilityClass) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<UtilityClass>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_2900     
     * @tc.name testConstructorIsPrivate2P1Test029
     * @tc.desc Verify private-only class (PrivateOverloadedCtor) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateOverloadedCtor>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_3000     
     * @tc.name testConstructorIsPrivate2P1Test030
     * @tc.desc Verify private-only class (ThreeOverloadPrivateCtor) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<ThreeOverloadPrivateCtor>().getConstructors();
      try {
        let ctor = ctors[0];
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_3100     
     * @tc.name testConstructorIsPrivate2P1Test031
     * @tc.desc Verify private-only class (IsPrivateWithFactory) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IsPrivateWithFactory>().getConstructors();
      try {
        let ctor = ctors[0];
        let r1 = ctor.isPrivate();
        let r2 = ctor.isPrivate();
        expect(r1).assertEqual(r2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_3200     
     * @tc.name testConstructorIsPrivate2P1Test032
     * @tc.desc Verify protected-only class (IsProtectedWithStatic) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IsProtectedWithStatic>().getConstructors();
      try {
        let ctor = ctors[0];
        let r1 = ctor.isPrivate();
        let r2 = ctor.isPrivate();
        expect(r1).assertEqual(r2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_3300     
     * @tc.name testConstructorIsPrivate2P1Test033
     * @tc.desc Verify private-only class (PrivateCtorTwoParams) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateCtorTwoParams>().getConstructors();
      try {
        let ctor = ctors[0];
        let r1 = ctor.isPrivate();
        let r2 = ctor.isPrivate();
        expect(r1).assertEqual(r2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_3400     
     * @tc.name testConstructorIsPrivate2P1Test034
     * @tc.desc Verify private-only class (PrivateCtorWithDefault) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateCtorWithDefault>().getConstructors();
      try {
        let ctor = ctors[0];
        let r1 = ctor.isPrivate();
        let r2 = ctor.isPrivate();
        expect(r1).assertEqual(r2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_3500     
     * @tc.name testConstructorIsPrivate2P1Test035
     * @tc.desc Verify public string-param constructor three isPrivate calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<StringFieldWithMethod>().getConstructors();
      let ctor = ctors[0];
      let r1 = ctor.isPrivate();
      let r2 = ctor.isPrivate();
      let r3 = ctor.isPrivate();
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_3600     
     * @tc.name testConstructorIsPrivate2P1Test036
     * @tc.desc Verify private-only class (PrivSpecialStrDefault) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivSpecialStrDefault>().getConstructors();
      try {
        let ctor = ctors[0];
        let r1 = ctor.isPrivate();
        let r2 = ctor.isPrivate();
        let r3 = ctor.isPrivate();
        expect(r1).assertEqual(r2);
        expect(r2).assertEqual(r3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_3700     
     * @tc.name testConstructorIsPrivate2P1Test037
     * @tc.desc Verify private-only class (IsPrivateWithFactory) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IsPrivateWithFactory>().getConstructors();
      try {
        let ctor = ctors[0];
        let name = ctor.getName();
        expect(name).assertEqual("constructor");
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_3800     
     * @tc.name testConstructorIsPrivate2P1Test038
     * @tc.desc Verify public bool-param constructor isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP2_110_PubDefBool>().getConstructors();
      let ctor = ctors[0];
      let name = ctor.getName();
      expect(name).assertEqual("constructor");
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_3900     
     * @tc.name testConstructorIsPrivate2P1Test039
     * @tc.desc Verify private-only class (IP5_278_PrivDefBool) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP5_278_PrivDefBool>().getConstructors();
      try {
        let ctor = ctors[0];
        let name = ctor.getName();
        expect(name).assertEqual("constructor");
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_4000     
     * @tc.name testConstructorIsPrivate2P1Test040
     * @tc.desc Verify public two-param constructor isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<ParamCountCls>().getConstructors();
      let ctor = ctors[0];
      let name = ctor.getName();
      expect(name).assertEqual("constructor");
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_4100     
     * @tc.name testConstructorIsPrivate2P1Test041
     * @tc.desc Verify private-only class (PrivateCtorTwoParams) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateCtorTwoParams>().getConstructors();
      try {
        let ctor = ctors[0];
        let name = ctor.getName();
        expect(name).assertEqual("constructor");
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_4200     
     * @tc.name testConstructorIsPrivate2P1Test042
     * @tc.desc Verify public three-param constructor isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PublicCtorThreeParams>().getConstructors();
      let ctor = ctors[0];
      let name = ctor.getName();
      expect(name).assertEqual("constructor");
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_4300     
     * @tc.name testConstructorIsPrivate2P1Test043
     * @tc.desc Verify private-only class (PrivateCtorThreeParams) getConstructors empty, index access throws ArrayIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PrivateCtorThreeParams>().getConstructors();
      try {
        let ctor = ctors[0];
        let name = ctor.getName();
        expect(name).assertEqual("constructor");
        expect(ctor.isPrivate()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ArrayIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_4400     
     * @tc.name testConstructorIsPrivate2P1Test044
     * @tc.desc Verify public mixed-param constructor isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<GetParamTypeABC>().getConstructors();
      expect(ctors.length).assertEqual(1);
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_4500     
     * @tc.name testConstructorIsPrivate2P1Test045
     * @tc.desc Verify public default-param constructor isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcTwoPubA>().getConstructors();
      let ctor = ctors[0];
      expect(ctors.length).assertEqual(1);
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_4600     
     * @tc.name testConstructorIsPrivate2P1Test046
     * @tc.desc Verify single public constructor with optional int param (TcTwoPubA) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcTwoPubA>().getConstructors();
      let ctor = ctors[0];
      let name = ctor.getName();
      expect(name).assertEqual("constructor");
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_4700     
     * @tc.name testConstructorIsPrivate2P1Test047
     * @tc.desc Verify single public two-int-param constructor (TwoSameInt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TwoSameInt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isNative()).assertFalse();
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_4800     
     * @tc.name testConstructorIsPrivate2P1Test048
     * @tc.desc Verify chained inline call for public two-param constructor (PublicCtorTwoParams) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<PublicCtorTwoParams>().getConstructors()[0].getName()).assertEqual("constructor");
      expect(Class.from<ParamCountCls>().getConstructors()[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_4900     
     * @tc.name testConstructorIsPrivate2P1Test049
     * @tc.desc Verify chained inline call for child public constructor (ChildPublicCtor) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<ChildPublicCtor>().getConstructors()[0].getName()).assertEqual("constructor");
      expect(Class.from<ChildPublicCtor>().getConstructors()[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_5000     
     * @tc.name testConstructorIsPrivate2P1Test050
     * @tc.desc Verify chained inline call for public bool-param constructor (IP2_110_PubDefBool) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<PublicBoolCtor>().getConstructors()[0].getName()).assertEqual("constructor");
      expect(Class.from<IP2_110_PubDefBool>().getConstructors()[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_5100     
     * @tc.name testConstructorIsPrivate2P1Test051
     * @tc.desc Verify public constructor of MultiPrivPubExt isPrivate false and isPublic true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<MultiPrivPubExt>().getConstructors();
      expect(ctors[0].isPrivate()).assertFalse();
      expect(ctors[0].isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_5200     
     * @tc.name testConstructorIsPrivate2P1Test052
     * @tc.desc Verify protected-only class (IsProtectedWithStatic) getConstructors returns empty, public ctor isPrivate unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcTwoPubA>().getConstructors();
      let ctor = ctors[0];
      let otherCtors = Class.from<IsProtectedWithStatic>().getConstructors();
      expect(otherCtors.length).assertEqual(0);
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_5300     
     * @tc.name testConstructorIsPrivate2P1Test053
     * @tc.desc Verify public constructor with double param isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cl = Class.from<PubDouble>();
      let ctors = cl.getConstructors();
      let r = ctors[0].isPrivate();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_5400     
     * @tc.name testConstructorIsPrivate2P1Test054
     * @tc.desc Verify public constructor with int array param (TcPub19) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cl = Class.from<TcPub19>();
      let ctors = cl.getConstructors();
      let r = ctors[0].isPrivate();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_5500     
     * @tc.name testConstructorIsPrivate2P1Test055
     * @tc.desc Verify interface implementing class public constructor isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cl = Class.from<PubIfcImpl>();
      let ctors = cl.getConstructors();
      let r = ctors[0].isPrivate();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_5600     
     * @tc.name testConstructorIsPrivate2P1Test056
     * @tc.desc Verify public constructor with float param isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<IP3_193_PubFloat>().getConstructors();
      expect(ctors[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_5700     
     * @tc.name testConstructorIsPrivate2P1Test057
     * @tc.desc Verify public constructor with short param isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PubShortParam>().getConstructors();
      expect(ctors[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_5800     
     * @tc.name testConstructorIsPrivate2P1Test058
     * @tc.desc Verify public constructor with byte param isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<PubByteParam>().getConstructors();
      expect(ctors[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_5900     
     * @tc.name testConstructorIsPrivate2P1Test059
     * @tc.desc Verify public constructor with char param isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Ext4_CharOptParam>().getConstructors();
      expect(ctors[0].isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_6000     
     * @tc.name testConstructorIsPrivate2P1Test060
     * @tc.desc Verify public 4-int-param constructor (TcPub12) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TcPub12>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_6100     
     * @tc.name testConstructorIsPrivate2P1Test061
     * @tc.desc Verify public 5-int-param constructor (GN_P5) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<GN_P5>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_6200     
     * @tc.name testConstructorIsPrivate2P1Test062
     * @tc.desc Verify public 6-int-param constructor (Pub6IntExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub6IntExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_ISPRIVATE_ExtP1_6300     
     * @tc.name testConstructorIsPrivate2P1Test063
     * @tc.desc Verify public 7-int-param constructor (Pub7IntExt) isPrivate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorIsPrivate2P1Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Pub7IntExt>().getConstructors();
      let ctor = ctors[0];
      expect(ctor.isPrivate()).assertFalse();
    });
  });
}
