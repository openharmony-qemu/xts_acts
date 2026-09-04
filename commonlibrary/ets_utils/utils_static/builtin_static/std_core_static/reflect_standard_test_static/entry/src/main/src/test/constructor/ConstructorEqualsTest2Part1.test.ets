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

import {StringFieldWithMethod,TcTwoPubA,IP2_110_PubDefBool,DefaultAndRequired_Ext,GetParamTypeABC,GN_P5,IsPrivateWithFactory,DoubleFieldClass,Eq02_C,Eq02_D,EmptyCls,TwoCtorsSameArity,GenCls,Eq02_F,DerivedC,Eq02_E,ExtImplCls,GN2_LvlB,GN2_LvlC,Eq02_B,Eq03_FixedStrCls,Eq03_FourOverload,Eq03_ImmC,Eq03_ImmG,Eq03_ImmI,Eq03_ImmL,Eq03_SigShortFloatA,Eq03_StrCharCls,Eq04_TripleOL,EqExt_CustomAndInt,EqExt_CustomAndStr,EqExt_CustomParamCtor,EqExt_ImplBool,EqExt_ImplEmpty,EqExt_ImplInt,EqExt_ImplStr,EqExt_ImplTwoParams,EqOverloadCls,IP3_193_PubFloat,ObjectParamCtor_Ext,PGN_ThreeLevelC,ParamCountCls,PubByteParam,PubDouble,PubShortParam,CtorFixedArrStrParam,} from "../Util.test";

function asCtorList(cls: Class): Array<reflect.Constructor> {
  return Utils.fixedArrayToArray(cls.getConstructors());
}

class EqInlineStrInt {
  public constructor(s: string, i: int) {}
}

class EqInlineShortFloat {
  public constructor(a: short, b: float) {}
}

class EqExt_CustomParamCtorB {
  public constructor(d: EmptyCls) {}
}

export default function ConstructorEqualsTest2Part1(): void {
  describe("ConstructorEqualsTest2Part1", (): void => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_0100     
     * @tc.name testConstructorEquals2P1Test001
     * @tc.desc Verify 0-param and 1-param(string) constructors of different classes not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<EmptyCls>();
      let clsB = Class.from<StringFieldWithMethod>();
      let ctorsA = asCtorList(clsA);
      let ctorsB = asCtorList(clsB);
      expect(ctorsA.length).assertEqual(1);
      expect(ctorsB.length).assertEqual(1);
      expect(ctorsA[0].equals(ctorsB[0])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_0200     
     * @tc.name testConstructorEquals2P1Test002
     * @tc.desc Verify 1-param(string) and 1-param(int) constructors of different classes not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<StringFieldWithMethod>();
      let clsB = Class.from<TcTwoPubA>();
      let ctorsA = asCtorList(clsA);
      let ctorsB = asCtorList(clsB);
      expect(ctorsA.length).assertEqual(1);
      expect(ctorsB.length).assertEqual(1);
      expect(ctorsA[0].equals(ctorsB[0])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_0300     
     * @tc.name testConstructorEquals2P1Test003
     * @tc.desc Verify 1-param(int) and 2-param constructors not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor1 = asCtorList(Class.from<TcTwoPubA>())[0];
      let ctor2 = asCtorList(Class.from<DefaultAndRequired_Ext>())[0];
      expect(ctor1.equals(ctor2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_0400     
     * @tc.name testConstructorEquals2P1Test004
     * @tc.desc Verify 2-param and 3-param constructors not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor2 = asCtorList(Class.from<DefaultAndRequired_Ext>())[0];
      let ctor3 = asCtorList(Class.from<GetParamTypeABC>())[0];
      expect(ctor2.equals(ctor3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_0500     
     * @tc.name testConstructorEquals2P1Test005
     * @tc.desc Verify private ctor not exposed (length 0), public ctor equals self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorsPriv = asCtorList(Class.from<IsPrivateWithFactory>());
      let ctorPub1 = asCtorList(Class.from<EmptyCls>())[0];
      let ctorPub2 = asCtorList(Class.from<EmptyCls>())[0];
      expect(ctorsPriv.length).assertEqual(0);
      expect(ctorPub1.equals(ctorPub2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_0600     
     * @tc.name testConstructorEquals2P1Test006
     * @tc.desc Verify string and (string, int) param constructors of different classes not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = asCtorList(Class.from<StringFieldWithMethod>())[0];
      let ctorB = asCtorList(Class.from<DefaultAndRequired_Ext>())[0];
      expect(ctorA.equals(ctorB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_0700     
     * @tc.name testConstructorEquals2P1Test007
     * @tc.desc Verify derived class and sibling class constructors not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorDerived = asCtorList(Class.from<DerivedC>())[0];
      let ctorOther = asCtorList(Class.from<ExtImplCls>())[0];
      expect(ctorDerived.equals(ctorOther)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_0800     
     * @tc.name testConstructorEquals2P1Test008
     * @tc.desc Verify different arity independent class constructors not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorX = asCtorList(Class.from<DerivedC>())[0];
      let ctorY = asCtorList(Class.from<GN2_LvlB>())[0];
      expect(ctorX.equals(ctorY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_0900     
     * @tc.name testConstructorEquals2P1Test009
     * @tc.desc Verify transitive parent-child-grandchild all not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorBase = asCtorList(Class.from<EmptyCls>())[0];
      let ctorMid = asCtorList(Class.from<DerivedC>())[0];
      let ctorGrand = asCtorList(Class.from<GN2_LvlC>())[0];
      expect(ctorBase.equals(ctorMid)).assertFalse();
      expect(ctorMid.equals(ctorGrand)).assertFalse();
      expect(ctorBase.equals(ctorGrand)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_1000     
     * @tc.name testConstructorEquals2P1Test010
     * @tc.desc Verify no-arg constructor equals(null) throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_1100     
     * @tc.name testConstructorEquals2P1Test011
     * @tc.desc Verify single-param constructor equals(null) throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<StringFieldWithMethod>())[0];
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_1200     
     * @tc.name testConstructorEquals2P1Test012
     * @tc.desc Verify multi-param constructor equals(null) throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<GetParamTypeABC>())[0];
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_1300     
     * @tc.name testConstructorEquals2P1Test013
     * @tc.desc Verify generic class constructor equals(null) throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<GenCls<string>>())[0];
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_1400     
     * @tc.name testConstructorEquals2P1Test014
     * @tc.desc Verify derived class constructor equals(null) throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<DerivedC>())[0];
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_1500     
     * @tc.name testConstructorEquals2P1Test015
     * @tc.desc Verify null variable as argument to equals throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<DefaultAndRequired_Ext>())[0];
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_1600     
     * @tc.name testConstructorEquals2P1Test016
     * @tc.desc Verify equals with Object instance cast as Constructor throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let obj: Object = {};
      try {
        ctor.equals(obj as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_1700     
     * @tc.name testConstructorEquals2P1Test017
     * @tc.desc Verify equals with Class object cast as Constructor throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let clsObj: Object = Class.from<EmptyCls>() as Object;
      try {
        ctor.equals(clsObj as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_1800     
     * @tc.name testConstructorEquals2P1Test018
     * @tc.desc Verify equals with empty object literal cast as Constructor throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let literal: Object = {} as Object;
      try {
        ctor.equals(literal as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_1900     
     * @tc.name testConstructorEquals2P1Test019
     * @tc.desc Verify equals with String wrapper cast as Constructor throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let strObj: Object = "test" as Object;
      try {
        ctor.equals(strObj as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_2000     
     * @tc.name testConstructorEquals2P1Test020
     * @tc.desc Verify equals with Boolean wrapper cast as Constructor throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let boolObj: Object = true as Object;
      try {
        ctor.equals(boolObj as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_2100     
     * @tc.name testConstructorEquals2P1Test021
     * @tc.desc Verify equals with Array cast as Constructor throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let arr: Object = [1, 2, 3] as Object;
      try {
        ctor.equals(arr as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_2200     
     * @tc.name testConstructorEquals2P1Test022
     * @tc.desc Verify equals with Function cast as Constructor throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let fn: Object = (() => {}) as Object;
      try {
        ctor.equals(fn as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_2300     
     * @tc.name testConstructorEquals2P1Test023
     * @tc.desc Verify equals throws ClassCastError when passed parameter Type Class as Constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<StringFieldWithMethod>())[0];
      let paramTypes = ctor.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
      let paramTypeObj: Object = paramTypes[0] as Object;
      try {
        ctor.equals(paramTypeObj as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_2400     
     * @tc.name testConstructorEquals2P1Test024
     * @tc.desc Verify three times acquisition of EmptyCls constructors all equal pairwise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = asCtorList(Class.from<EmptyCls>());
      let a = ctors[0];
      let b = asCtorList(Class.from<EmptyCls>())[0];
      let c = asCtorList(Class.from<EmptyCls>())[0];
      expect(a.equals(b)).assertTrue();
      expect(b.equals(c)).assertTrue();
      expect(a.equals(c)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_2500     
     * @tc.name testConstructorEquals2P1Test025
     * @tc.desc Verify constructor after other API calls still equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      ctor.getName();
      ctor.getOwner();
      ctor.isPublic();
      let same = asCtorList(Class.from<EmptyCls>())[0];
      expect(ctor.equals(same)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_2600     
     * @tc.name testConstructorEquals2P1Test026
     * @tc.desc Verify constructor after getParameterType traversal still equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<GetParamTypeABC>())[0];
      for (let i = 0; i < ctor.getParametersNum(); i++) {
        ctor.getParameterType(i);
      }
      let same = asCtorList(Class.from<GetParamTypeABC>())[0];
      expect(ctor.equals(same)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_2700     
     * @tc.name testConstructorEquals2P1Test027
     * @tc.desc Verify base class constructor equals itself after derived class fetch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = asCtorList(Class.from<EmptyCls>())[0];
      let derived = asCtorList(Class.from<DerivedC>())[0];
      let baseAgain = asCtorList(Class.from<EmptyCls>())[0];
      expect(base.equals(baseAgain)).assertTrue();
      expect(base.equals(derived)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_2800     
     * @tc.name testConstructorEquals2P1Test028
     * @tc.desc Verify same-arity string and int overloaded constructors are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = asCtorList(Class.from<TwoCtorsSameArity>());
      expect(ctors.length).assertEqual(2);
      expect(ctors[0].equals(ctors[1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_2900     
     * @tc.name testConstructorEquals2P1Test029
     * @tc.desc Verify default-param constructor from two separate Class.from calls are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor1 = asCtorList(Class.from<Eq02_E>())[0];
      let ctor2 = asCtorList(Class.from<Eq02_E>())[0];
      expect(ctor1.equals(ctor2)).assertTrue();
      expect(ctor1.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_3000
     * @tc.name testConstructorEquals2P1Test030
     * @tc.desc Verify default param and explicit single-param constructors not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorE = asCtorList(Class.from<Eq02_E>())[0];
      let ctorB = asCtorList(Class.from<DoubleFieldClass>())[0];
      expect(ctorE.equals(ctorB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_3100
     * @tc.name testConstructorEquals2P1Test031
     * @tc.desc Verify EmptyCls isPrivate unchanged after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let before = ctor.isPrivate();
      expect(ctor.isPrivate()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_3200
     * @tc.name testConstructorEquals2P1Test032
     * @tc.desc Verify Eq02_F string isPrivate unchanged after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_F<string>>())[0];
      let before = ctor.isPrivate();
      expect(ctor.isPrivate()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_3300
     * @tc.name testConstructorEquals2P1Test033
     * @tc.desc Verify DoubleFieldClass getName and getParametersNum unchanged after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<DoubleFieldClass>())[0];
      let nameBefore = ctor.getName();
      let numBefore = ctor.getParametersNum();
      expect(ctor.getName()).assertEqual(nameBefore);
      expect(ctor.getParametersNum()).assertEqual(numBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_3400
     * @tc.name testConstructorEquals2P1Test034
     * @tc.desc Verify EmptyCls getName unchanged after equals(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let before = ctor.getName();
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(ctor.getName()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_3500
     * @tc.name testConstructorEquals2P1Test035
     * @tc.desc Verify EmptyCls isPublic unchanged after equals(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let before = ctor.isPublic();
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(ctor.isPublic()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_3600
     * @tc.name testConstructorEquals2P1Test036
     * @tc.desc Verify Eq02_B isNative unchanged after equals(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_B>())[0];
      let before = ctor.isNative();
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(ctor.isNative()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_3700
     * @tc.name testConstructorEquals2P1Test037
     * @tc.desc Verify Eq02_B getOwner unchanged after equals(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_B>())[0];
      let before = ctor.getOwner();
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(ctor.getOwner()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_3800
     * @tc.name testConstructorEquals2P1Test038
     * @tc.desc Verify Eq02_C getParameterTypes length unchanged after equals(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_C>())[0];
      let before = ctor.getParameterTypes().length;
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(ctor.getParameterTypes().length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_3900
     * @tc.name testConstructorEquals2P1Test039
     * @tc.desc Verify Eq02_D isProtected unchanged after equals(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_D>())[0];
      let before = ctor.isProtected();
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(ctor.isProtected()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_4000
     * @tc.name testConstructorEquals2P1Test040
     * @tc.desc Verify Eq02_E getReturnType unchanged after equals(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_E>())[0];
      let before = ctor.getReturnType();
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(ctor.getReturnType()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_4100
     * @tc.name testConstructorEquals2P1Test041
     * @tc.desc Verify Eq02_F number isPrivate unchanged after equals(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_F<number>>())[0];
      let before = ctor.isPrivate();
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(ctor.isPrivate()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_4200
     * @tc.name testConstructorEquals2P1Test042
     * @tc.desc Verify EmptyCls isNative unchanged after equals(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let before = ctor.isNative();
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(ctor.isNative()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_4300
     * @tc.name testConstructorEquals2P1Test043
     * @tc.desc Verify EmptyCls getOwner unchanged after equals(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let before = ctor.getOwner();
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(ctor.getOwner()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_4400
     * @tc.name testConstructorEquals2P1Test044
     * @tc.desc Verify EmptyCls getName unchanged after cross-class comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let before = ctor.getName();
      let other = asCtorList(Class.from<DoubleFieldClass>())[0];
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.getName()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_4500
     * @tc.name testConstructorEquals2P1Test045
     * @tc.desc Verify EmptyCls isPublic unchanged after cross-class comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let before = ctor.isPublic();
      let other = asCtorList(Class.from<DoubleFieldClass>())[0];
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.isPublic()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_4600
     * @tc.name testConstructorEquals2P1Test046
     * @tc.desc Verify Eq02_C getParameterTypes length unchanged after cross-class comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_C>())[0];
      let before = ctor.getParameterTypes().length;
      let other = asCtorList(Class.from<Eq02_D>())[0];
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.getParameterTypes().length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_4700
     * @tc.name testConstructorEquals2P1Test047
     * @tc.desc Verify Eq02_E getOwner unchanged after cross-class comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_E>())[0];
      let before = ctor.getOwner();
      let other = asCtorList(Class.from<DoubleFieldClass>())[0];
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.getOwner()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_4800
     * @tc.name testConstructorEquals2P1Test048
     * @tc.desc Verify Eq02_F number isNative unchanged after comparing two instances of same class (erased generics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_F<number>>())[0];
      let before = ctor.isNative();
      let other = asCtorList(Class.from<Eq02_F<number>>())[0];
      expect(ctor.equals(other)).assertTrue();
      expect(ctor.isNative()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_4900
     * @tc.name testConstructorEquals2P1Test049
     * @tc.desc Verify Eq02_D isProtected unchanged after cross-class comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_D>())[0];
      let before = ctor.isProtected();
      let other = asCtorList(Class.from<Eq02_C>())[0];
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.isProtected()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_5000
     * @tc.name testConstructorEquals2P1Test050
     * @tc.desc Verify Eq02_B getReturnType unchanged after cross-class comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_B>())[0];
      let before = ctor.getReturnType();
      let other = asCtorList(Class.from<DoubleFieldClass>())[0];
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.getReturnType()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_5100
     * @tc.name testConstructorEquals2P1Test051
     * @tc.desc Verify EmptyCls isPrivate unchanged after cross-class comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let before = ctor.isPrivate();
      let other = asCtorList(Class.from<DerivedC>())[0];
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.isPrivate()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_5200
     * @tc.name testConstructorEquals2P1Test052
     * @tc.desc Verify Eq02_D getParametersNum unchanged after cross-class comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_D>())[0];
      let before = ctor.getParametersNum();
      let other = asCtorList(Class.from<EmptyCls>())[0];
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_5300
     * @tc.name testConstructorEquals2P1Test053
     * @tc.desc Verify Eq02_C getParameterType(0) unchanged after cross-class comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_C>())[0];
      let before = ctor.getParameterType(0);
      let other = asCtorList(Class.from<EmptyCls>())[0];
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.getParameterType(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_5400
     * @tc.name testConstructorEquals2P1Test054
     * @tc.desc Verify equals true result reused alongside other API calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let eq = ctor.equals(ctor);
      let name = ctor.getName();
      expect(eq).assertTrue();
      expect(name).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_5500
     * @tc.name testConstructorEquals2P1Test055
     * @tc.desc Verify equals false result reused alongside other API calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = asCtorList(Class.from<EmptyCls>())[0];
      let ctorB = asCtorList(Class.from<DoubleFieldClass>())[0];
      let eq = ctorA.equals(ctorB);
      let num = ctorB.getParametersNum();
      expect(eq).assertFalse();
      expect(num).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_5600
     * @tc.name testConstructorEquals2P1Test056
     * @tc.desc Verify different class equals false results are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = asCtorList(Class.from<EmptyCls>())[0];
      let ctorB = asCtorList(Class.from<DoubleFieldClass>())[0];
      let ctorC = asCtorList(Class.from<Eq02_C>())[0];
      let r1 = ctorA.equals(ctorB);
      let r2 = ctorA.equals(ctorC);
      let r3 = ctorB.equals(ctorC);
      expect(r1).assertFalse();
      expect(r2).assertFalse();
      expect(r3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_5700
     * @tc.name testConstructorEquals2P1Test057
     * @tc.desc Verify intra-class overloaded constructors (same class, different overloads) are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<EqOverloadCls>().getConstructors();
      expect(ctors.length).assertEqual(2);
      expect(ctors[0].equals(ctors[1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_5800
     * @tc.name testConstructorEquals2P1Test058
     * @tc.desc Verify equals returns false for different classes (Eq02_E vs Eq02_D) with symmetry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorE = asCtorList(Class.from<Eq02_E>())[0];
      let ctorD = asCtorList(Class.from<Eq02_D>())[0];
      let result = ctorE.equals(ctorD);
      expect(result).assertFalse();
      expect(ctorD.equals(ctorE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_5900
     * @tc.name testConstructorEquals2P1Test059
     * @tc.desc Verify byte param and int param constructors are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorByte = asCtorList(Class.from<PubByteParam>())[0];
      let ctorInt = asCtorList(Class.from<TcTwoPubA>())[0];
      expect(ctorByte.equals(ctorInt)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_6000
     * @tc.name testConstructorEquals2P1Test060
     * @tc.desc Verify double param and int param constructors are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorDbl = asCtorList(Class.from<PubDouble>())[0];
      let ctorInt = asCtorList(Class.from<TcTwoPubA>())[0];
      expect(ctorDbl.equals(ctorInt)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_6100
     * @tc.name testConstructorEquals2P1Test061
     * @tc.desc Verify triple-overload class ctor[0] and ctor[1] are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<Eq04_TripleOL>().getConstructors();
      expect(ctors.length).assertEqual(3);
      expect(ctors[0].equals(ctors[1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_6200
     * @tc.name testConstructorEquals2P1Test062
     * @tc.desc Verify byte, no-arg (EmptyCls) and double param constructors pairwise are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorByte = asCtorList(Class.from<PubByteParam>())[0];
      let ctorLong = asCtorList(Class.from<EmptyCls>())[0];
      let ctorDbl = asCtorList(Class.from<PubDouble>())[0];
      expect(ctorByte.equals(ctorLong)).assertFalse();
      expect(ctorByte.equals(ctorDbl)).assertFalse();
      expect(ctorLong.equals(ctorDbl)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_6300
     * @tc.name testConstructorEquals2P1Test063
     * @tc.desc Verify byte class getName and isPublic unchanged after self-equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<PubByteParam>())[0];
      let nameBefore = ctor.getName();
      let pubBefore = ctor.isPublic();
      expect(ctor.getName()).assertEqual(nameBefore);
      expect(ctor.isPublic()).assertEqual(pubBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_6400
     * @tc.name testConstructorEquals2P1Test064
     * @tc.desc Verify no-arg (EmptyCls) class equals result unchanged after interleaved getParametersNum calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EmptyCls>())[0];
      let r1 = ctor.equals(ctor);
      let num1 = ctor.getParametersNum();
      let r2 = ctor.equals(ctor);
      let num2 = ctor.getParametersNum();
      expect(r1).assertEqual(r2);
      expect(num1).assertEqual(num2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_6500
     * @tc.name testConstructorEquals2P1Test065
     * @tc.desc Verify short param and float param constructors are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorShort = asCtorList(Class.from<PubShortParam>())[0];
      let ctorFloat = asCtorList(Class.from<IP3_193_PubFloat>())[0];
      expect(ctorShort.equals(ctorFloat)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_6600
     * @tc.name testConstructorEquals2P1Test066
     * @tc.desc Verify equals with valid argument count: pass 1 Constructor parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Eq03_StrCharCls>();
      let ctor1 = asCtorList(cls)[0];
      let ctor2 = asCtorList(cls)[0];
      expect(ctor1.equals(ctor2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_6700
     * @tc.name testConstructorEquals2P1Test067
     * @tc.desc Verify same signature (string,int) constructors of different classes are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = asCtorList(Class.from<DefaultAndRequired_Ext>())[0];
      let ctorB = asCtorList(Class.from<EqInlineStrInt>())[0];
      expect(ctorA.equals(ctorB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_6800
     * @tc.name testConstructorEquals2P1Test068
     * @tc.desc Verify same signature (short,float) different class constructors are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = asCtorList(Class.from<Eq03_SigShortFloatA>())[0];
      let ctorB = asCtorList(Class.from<EqInlineShortFloat>())[0];
      expect(ctorA.equals(ctorB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_6900
     * @tc.name testConstructorEquals2P1Test069
     * @tc.desc Verify same signature (FixedArray<string>) different class constructors are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = asCtorList(Class.from<CtorFixedArrStrParam>())[0];
      let ctorB = asCtorList(Class.from<Eq03_FixedStrCls>())[0];
      expect(ctorA.equals(ctorB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_7000
     * @tc.name testConstructorEquals2P1Test070
     * @tc.desc Verify four-overload class ctor[0] empty and ctor[1] int are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = asCtorList(Class.from<Eq03_FourOverload>());
      expect(ctors[0].equals(ctors[1])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_7100
     * @tc.name testConstructorEquals2P1Test071
     * @tc.desc Verify two sibling class constructors from different branches are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = asCtorList(Class.from<DerivedC>())[0];
      let other = asCtorList(Class.from<PGN_ThreeLevelC>())[0];
      expect(parent.equals(other)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_7200
     * @tc.name testConstructorEquals2P1Test072
     * @tc.desc Verify (string,int) and (int,string) parameter order constructors are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorSI = asCtorList(Class.from<DefaultAndRequired_Ext>())[0];
      let ctorIS = asCtorList(Class.from<ParamCountCls>())[0];
      expect(ctorSI.equals(ctorIS)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_7300
     * @tc.name testConstructorEquals2P1Test073
     * @tc.desc Verify Eq03_ImmC getOwner unchanged after cross-class comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq03_ImmC>())[0];
      let other = asCtorList(Class.from<DoubleFieldClass>())[0];
      let before = ctor.getOwner();
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.getOwner()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_7400
     * @tc.name testConstructorEquals2P1Test074
     * @tc.desc Verify Eq03_ImmG isProtected unchanged after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq03_ImmG>())[0];
      let before = ctor.isProtected();
      expect(ctor.isProtected()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_7500
     * @tc.name testConstructorEquals2P1Test075
     * @tc.desc Verify Eq03_ImmI getParametersNum unchanged after cross-class equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq03_ImmI>())[0];
      let other = asCtorList(Class.from<DoubleFieldClass>())[0];
      let before = ctor.getParametersNum();
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.getParametersNum()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_7600
     * @tc.name testConstructorEquals2P1Test076
     * @tc.desc Verify Eq02_B isPrivate unchanged after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_B>())[0];
      let before = ctor.isPrivate();
      expect(ctor.isPrivate()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_7700
     * @tc.name testConstructorEquals2P1Test077
     * @tc.desc Verify Eq03_ImmL isPublic unchanged after cross-class equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq03_ImmL>())[0];
      let other = asCtorList(Class.from<EmptyCls>())[0];
      let before = ctor.isPublic();
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.isPublic()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_7800
     * @tc.name testConstructorEquals2P1Test078
     * @tc.desc Verify equals true and equals false results do not interfere when combined in expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = asCtorList(Class.from<EmptyCls>())[0];
      let ctorB = asCtorList(Class.from<DoubleFieldClass>())[0];
      let r1 = ctorA.equals(ctorA);
      let r2 = ctorA.equals(ctorB);
      expect(r1).assertTrue();
      expect(r2).assertFalse();
      expect(r1 && !r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_7900
     * @tc.name testConstructorEquals2P1Test079
     * @tc.desc Verify equals false results from different cross-class comparisons are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorEmpty = asCtorList(Class.from<EmptyCls>())[0];
      let ctorInt = asCtorList(Class.from<TcTwoPubA>())[0];
      let ctorStr = asCtorList(Class.from<StringFieldWithMethod>())[0];
      let r1 = ctorEmpty.equals(ctorInt);
      let r2 = ctorEmpty.equals(ctorStr);
      expect(r1).assertFalse();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_8000
     * @tc.name testConstructorEquals2P1Test080
     * @tc.desc Verify string param impl class and boolean default class constructors not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorStr = asCtorList(Class.from<EqExt_ImplStr>())[0];
      let ctorBool = asCtorList(Class.from<IP2_110_PubDefBool>())[0];
      expect(ctorStr.equals(ctorBool)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_8100
     * @tc.name testConstructorEquals2P1Test081
     * @tc.desc Verify getParameterType unchanged after self-equals followed by cross-class equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<Eq02_C>())[0];
      let before = ctor.getParameterType(0);
      let other = asCtorList(Class.from<DoubleFieldClass>())[0];
      expect(ctor.equals(other)).assertFalse();
      expect(ctor.getParameterType(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_8200
     * @tc.name testConstructorEquals2P1Test082
     * @tc.desc Verify twice-fetched constructor equals true result is not implicitly converted to number 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor1 = asCtorList(Class.from<DoubleFieldClass>())[0];
      let ctor2 = asCtorList(Class.from<DoubleFieldClass>())[0];
      let r = ctor1.equals(ctor2);
      expect(r).assertTrue();
      expect(r !== (1 as Object)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_8300
     * @tc.name testConstructorEquals2P1Test083
     * @tc.desc Verify cross-class equals false result is not implicitly converted to number 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = asCtorList(Class.from<EmptyCls>())[0];
      let ctorC = asCtorList(Class.from<Eq02_C>())[0];
      let r = ctorA.equals(ctorC);
      expect(r).assertFalse();
      expect(r !== (0 as Object)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_8400
     * @tc.name testConstructorEquals2P1Test084
     * @tc.desc Verify byte class getOwner unchanged after cross-class equals with int param class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorByte = asCtorList(Class.from<PubByteParam>())[0];
      let before = ctorByte.getOwner();
      let ctorInt = asCtorList(Class.from<TcTwoPubA>())[0];
      expect(ctorByte.equals(ctorInt)).assertFalse();
      expect(ctorByte.getOwner()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_8500
     * @tc.name testConstructorEquals2P1Test085
     * @tc.desc Verify EmptyCls getName unchanged after cross-class equals with int class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorLong = asCtorList(Class.from<EmptyCls>())[0];
      let before = ctorLong.getName();
      let ctorInt = asCtorList(Class.from<TcTwoPubA>())[0];
      expect(ctorLong.equals(ctorInt)).assertFalse();
      expect(ctorLong.getName()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_8600
     * @tc.name testConstructorEquals2P1Test086
     * @tc.desc Verify Object param class getName unchanged after cross-class equals with int class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorObj = asCtorList(Class.from<ObjectParamCtor_Ext>())[0];
      let before = ctorObj.getName();
      let ctorInt = asCtorList(Class.from<TcTwoPubA>())[0];
      expect(ctorObj.equals(ctorInt)).assertFalse();
      expect(ctorObj.getName()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_8700
     * @tc.name testConstructorEquals2P1Test087
     * @tc.desc Verify equals false negated using NOT operator yields true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = asCtorList(Class.from<EmptyCls>())[0];
      let ctorB = asCtorList(Class.from<TcTwoPubA>())[0];
      let r = ctorA.equals(ctorB);
      expect(r).assertFalse();
      let negated = !r;
      expect(negated).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_8800
     * @tc.name testConstructorEquals2P1Test088
     * @tc.desc Verify two different interface-implementing class constructors are not equal (A10 cross-class)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = asCtorList(Class.from<EqExt_ImplEmpty>())[0];
      let ctorB = asCtorList(Class.from<EqExt_ImplInt>())[0];
      expect(ctorA.equals(ctorB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_8900
     * @tc.name testConstructorEquals2P1Test089
     * @tc.desc Verify interface-implementing class vs non-implementing class with same signature not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorImpl = asCtorList(Class.from<EqExt_ImplEmpty>())[0];
      let ctorNon = asCtorList(Class.from<EmptyCls>())[0];
      expect(ctorImpl.equals(ctorNon)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_9000
     * @tc.name testConstructorEquals2P1Test090
     * @tc.desc Verify interface impl bool param vs int param constructors not equal (A10+B3 vs B1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorBool = asCtorList(Class.from<EqExt_ImplBool>())[0];
      let ctorInt = asCtorList(Class.from<EqExt_ImplInt>())[0];
      expect(ctorBool.equals(ctorInt)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_9100
     * @tc.name testConstructorEquals2P1Test091
     * @tc.desc Verify two constructors with same custom class param signature but different class not equal (B11 cross)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorA = asCtorList(Class.from<EqExt_CustomParamCtor>())[0];
      let ctorB = asCtorList(Class.from<EqExt_CustomParamCtorB>())[0];
      expect(ctorA.equals(ctorB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_9200
     * @tc.name testConstructorEquals2P1Test092
     * @tc.desc Verify custom class param vs int param constructors not equal (B11 vs B1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorCustom = asCtorList(Class.from<EqExt_CustomParamCtor>())[0];
      let ctorInt = asCtorList(Class.from<TcTwoPubA>())[0];
      expect(ctorCustom.equals(ctorInt)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_9300
     * @tc.name testConstructorEquals2P1Test093
     * @tc.desc Verify custom+int vs custom+string constructors not equal (B11+E3 different secondary types)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorCI = asCtorList(Class.from<EqExt_CustomAndInt>())[0];
      let ctorCS = asCtorList(Class.from<EqExt_CustomAndStr>())[0];
      expect(ctorCI.equals(ctorCS)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_9400
     * @tc.name testConstructorEquals2P1Test094
     * @tc.desc Verify interface impl constructor via getOwner chain returns true (A10_ref)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EqExt_ImplEmpty>())[0];
      let owner = ctor.getOwner();
      let ownerCtor = asCtorList(owner)[0];
      expect(ctor.equals(ownerCtor)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_9500
     * @tc.name testConstructorEquals2P1Test095
     * @tc.desc Verify custom class param vs string param constructors not equal (B11 vs B2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorCustom = asCtorList(Class.from<EqExt_CustomParamCtor>())[0];
      let ctorStr = asCtorList(Class.from<EqExt_ImplStr>())[0];
      expect(ctorCustom.equals(ctorStr)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_9600
     * @tc.name testConstructorEquals2P1Test096
     * @tc.desc Verify interface impl and no-arg concrete class constructors not equal (A10 vs A3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorImpl = asCtorList(Class.from<EqExt_ImplTwoParams>())[0];
      let ctorAbstract = asCtorList(Class.from<EmptyCls>())[0];
      expect(ctorImpl.equals(ctorAbstract)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_EQUALS_ExtP1_9700
     * @tc.name testConstructorEquals2P1Test097
     * @tc.desc Verify interface-implementing class constructor equals(null) throws (A10+null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorEquals2P1Test097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = asCtorList(Class.from<EqExt_ImplEmpty>())[0];
      try {
        ctor.equals(null as reflect.Constructor);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });
  });
}
