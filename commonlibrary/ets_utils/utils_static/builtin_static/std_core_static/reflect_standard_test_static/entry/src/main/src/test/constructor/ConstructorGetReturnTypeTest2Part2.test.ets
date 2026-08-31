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

import {EmptyCls,TcTwoPubA,LongInheritBase,StringFieldWithMethod,IP2_110_PubDefBool,PubByteParam,PubShortParam,ExtCmpE,ThreeCtorCls2,ExtImplCls,ExtSimpleF,ExtParamH,ExtParamI,ExtNameG,ExtCmpI,Ext4_CharStringMix,ExtChainD,ExtChainE,SevenParams,EightParams,TenParams,ExtPcD,ExtPcE,ExtPcF,DelegateCtorCls,FuncParamCtorCls,GenExtGenCls,MultiArrCtorCls,SetMapMixedCtorCls,BoolIntArrCtorCls,AbsDblParamCtor,MultiImplParamCtor,LongInheritMid,NestedDeepGenericCtor,CollectionPairCtor,TripleGenCls,GenericIntfCls,GenericCharCtor,GenericByteArrCtor,ExtFinB,ExtFinC,ExtCmpH,ExtCmpB,ExtSimpleC,ExtSimpleD,ExtParamE,ExtLenC,ExtParamD,ExtParamF,ExtCmpG,ExtCmpC,ExtNameD,ExtArrB,ExtOwnJ,ExtCmpD,ExtChainF,ExtPcA,ExtPcB,ExtPcC,TryCatchCtorCls,SwitchCtorCls,WhileCtorCls,DoWhileCtorCls,TernaryCtorCls,NoExplicitCtorCls,MultiIfaceCtorCls,UnionCtorCls,ObjectParamCtorCls,ReadonlyFieldCls,StaticAccessCtorCls,HelperFnCtorCls,LongStrCtorCls,CharEscapeCtorCls,DefaultParamCtorCls,StaticRefOtherCtorCls,NestedInitCtorCls,} from "../Util.test";

final class FinBoolParamCtor {
  public flag: boolean;
  public constructor(f: boolean) {
    this.flag = f;
  }
}

final class FinalGenericBox<T> {
  public item: T;
  public constructor(v: T) {
    this.item = v;
  }
}

final class FinTriParamCtor {
  public a: int;
  public b: string;
  public c: boolean;
  public constructor(x: int, y: string, z: boolean) {
    this.a = x;
    this.b = y;
    this.c = z;
  }
}
export default function ConstructorGetReturnTypeTest2Part2(): void {
  describe("ConstructorGetReturnTypeTest2Part2", (): void => {
    beforeAll(() => {
    });
    beforeEach((): void=> {});
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 150)
      })
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0010
     * @tc.name testConstructorGetReturnType2P2Test001
     * @tc.desc Verify isFinal returns true for void return type from boolean-param constructor (ExtFinB)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtFinB>().getConstructors()[0].getReturnType();
      expect(rt.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0020
     * @tc.name testConstructorGetReturnType2P2Test002
     * @tc.desc Verify isFinal returns true for void return type from tri-param constructor (ExtFinC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtFinC>().getConstructors()[0].getReturnType();
      expect(rt.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0030
     * @tc.name testConstructorGetReturnType2P2Test003
     * @tc.desc Verify every overloaded constructor returns void return type (ThreeCtorCls2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<ThreeCtorCls2>().getConstructors();
      expect(ctors.length).assertEqual(3);
      for (let i = 0; i < ctors.length; i++) {
        expect(ctors[i].getReturnType().getName()).assertEqual("void");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0040
     * @tc.name testConstructorGetReturnType2P2Test004
     * @tc.desc Verify getName returns void for dual-string-param constructor (ExtSimpleC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtSimpleC>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0050
     * @tc.name testConstructorGetReturnType2P2Test005
     * @tc.desc Verify getName returns void for tri-param int-string-boolean constructor (ExtSimpleD)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtSimpleD>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0060
     * @tc.name testConstructorGetReturnType2P2Test006
     * @tc.desc Verify getName returns void for quad-int-param constructor (ExtParamE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtParamE>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0070
     * @tc.name testConstructorGetReturnType2P2Test007
     * @tc.desc Verify getName returns void for float-long-short-param constructor (ExtSimpleF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtSimpleF>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0080
     * @tc.name testConstructorGetReturnType2P2Test008
     * @tc.desc Verify getReturnType returns void while getOwner returns different class name for EmptyCls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      let retName = ctor.getReturnType().getName();
      let ownerName = ctor.getOwner().getName();
      expect(retName).assertEqual("void");
      expect(retName).not().assertEqual(ownerName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0090
     * @tc.name testConstructorGetReturnType2P2Test009
     * @tc.desc Verify getReturnType returns void while getOwner returns different class name for ExtCmpB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtCmpB>().getConstructors()[0];
      let retName = ctor.getReturnType().getName();
      let ownerName = ctor.getOwner().getName();
      expect(retName).assertEqual("void");
      expect(retName).not().assertEqual(ownerName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0100
     * @tc.name testConstructorGetReturnType2P2Test010
     * @tc.desc Verify getReturnType returns void while getOwner returns different class name for ExtCmpC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtCmpC>().getConstructors()[0];
      let retName = ctor.getReturnType().getName();
      let ownerName = ctor.getOwner().getName();
      expect(retName).assertEqual("void");
      expect(retName).not().assertEqual(ownerName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0110
     * @tc.name testConstructorGetReturnType2P2Test011
     * @tc.desc Verify getReturnType returns void while getOwner returns different class name for ExtCmpD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtCmpD>().getConstructors()[0];
      let retName = ctor.getReturnType().getName();
      let ownerName = ctor.getOwner().getName();
      expect(retName).assertEqual("void");
      expect(retName).not().assertEqual(ownerName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0120
     * @tc.name testConstructorGetReturnType2P2Test012
     * @tc.desc Verify getReturnType returns void while getOwner returns different class name for ExtArrB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtArrB>().getConstructors()[0];
      let retName = ctor.getReturnType().getName();
      let ownerName = ctor.getOwner().getName();
      expect(retName).assertEqual("void");
      expect(retName).not().assertEqual(ownerName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0130
     * @tc.name testConstructorGetReturnType2P2Test013
     * @tc.desc Verify getReturnType returns void while getOwner returns ExtSimpleF class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtSimpleF>().getConstructors()[0];
      let retName = ctor.getReturnType().getName();
      let ownerName = ctor.getOwner().getName();
      expect(retName).assertEqual("void");
      expect(retName).not().assertEqual(ownerName);
      expect(ownerName.includes("ExtSimpleF")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0140
     * @tc.name testConstructorGetReturnType2P2Test014
     * @tc.desc Verify getReturnType returns void while getOwner returns different class name for ExtCmpG
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtCmpG>().getConstructors()[0];
      let retName = ctor.getReturnType().getName();
      let ownerName = ctor.getOwner().getName();
      expect(retName).assertEqual("void");
      expect(retName).not().assertEqual(ownerName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0150
     * @tc.name testConstructorGetReturnType2P2Test015
     * @tc.desc Verify getReturnType returns void while getOwner returns different class name for ExtCmpH
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtCmpH>().getConstructors()[0];
      let retName = ctor.getReturnType().getName();
      let ownerName = ctor.getOwner().getName();
      expect(retName).assertEqual("void");
      expect(retName).not().assertEqual(ownerName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0160
     * @tc.name testConstructorGetReturnType2P2Test016
     * @tc.desc Verify final class constructors ExtFinB and ExtFinC return same void type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameB = Class.from<ExtFinB>().getConstructors()[0].getReturnType().getName();
      let nameC = Class.from<ExtFinC>().getConstructors()[0].getReturnType().getName();
      expect(nameB).assertEqual("void");
      expect(nameC).assertEqual("void");
      expect(nameB).assertEqual(nameC);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0170
     * @tc.name testConstructorGetReturnType2P2Test017
     * @tc.desc Verify getReturnType returns void while getOwner returns different class name for ExtOwnJ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtOwnJ>().getConstructors()[0];
      let retName = ctor.getReturnType().getName();
      let ownerName = ctor.getOwner().getName();
      expect(retName).assertEqual("void");
      expect(retName).not().assertEqual(ownerName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0180
     * @tc.name testConstructorGetReturnType2P2Test018
     * @tc.desc Verify getParametersNum unchanged after getReturnType on no-arg constructor (EmptyCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0190
     * @tc.name testConstructorGetReturnType2P2Test019
     * @tc.desc Verify getParametersNum unchanged after getReturnType on int-param constructor (ExtCmpB)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtCmpB>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0200
     * @tc.name testConstructorGetReturnType2P2Test020
     * @tc.desc Verify getParametersNum unchanged after getReturnType on string-boolean constructor (ExtLenC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtLenC>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0210
     * @tc.name testConstructorGetReturnType2P2Test021
     * @tc.desc Verify getParametersNum unchanged after getReturnType on int-string-double constructor (ExtParamD)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtParamD>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0220
     * @tc.name testConstructorGetReturnType2P2Test022
     * @tc.desc Verify getParametersNum unchanged after getReturnType on quad-int constructor (ExtParamE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtParamE>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0230
     * @tc.name testConstructorGetReturnType2P2Test023
     * @tc.desc Verify getParametersNum unchanged after getReturnType on 5-param constructor (ExtParamF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtParamF>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0240
     * @tc.name testConstructorGetReturnType2P2Test024
     * @tc.desc Verify getParametersNum unchanged after getReturnType on float-param constructor (ExtCmpH)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtCmpH>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0250
     * @tc.name testConstructorGetReturnType2P2Test025
     * @tc.desc Verify getParametersNum unchanged after getReturnType on string-long constructor (ExtParamH)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtParamH>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0260
     * @tc.name testConstructorGetReturnType2P2Test026
     * @tc.desc Verify getParametersNum unchanged after getReturnType on float-double-int constructor (ExtParamI)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtParamI>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0270
     * @tc.name testConstructorGetReturnType2P2Test027
     * @tc.desc Verify getParametersNum unchanged after getReturnType on short-param constructor (ExtCmpG)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtCmpG>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0280
     * @tc.name testConstructorGetReturnType2P2Test028
     * @tc.desc Verify getName unchanged after getReturnType on string-param constructor (ExtCmpC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtCmpC>().getConstructors()[0];
      let nameBefore = ctor.getName();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let nameAfter = ctor.getName();
      expect(nameBefore).assertEqual(nameAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0290
     * @tc.name testConstructorGetReturnType2P2Test029
     * @tc.desc Verify getName unchanged after getReturnType on boolean-int constructor (ExtNameD)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtNameD>().getConstructors()[0];
      let nameBefore = ctor.getName();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let nameAfter = ctor.getName();
      expect(nameBefore).assertEqual(nameAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0300
     * @tc.name testConstructorGetReturnType2P2Test030
     * @tc.desc Verify getName unchanged after getReturnType on string-int-boolean constructor (ExtFinC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtFinC>().getConstructors()[0];
      let nameBefore = ctor.getName();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let nameAfter = ctor.getName();
      expect(nameBefore).assertEqual(nameAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0310
     * @tc.name testConstructorGetReturnType2P2Test031
     * @tc.desc Verify getName unchanged after getReturnType on double-param constructor (ExtArrB)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtArrB>().getConstructors()[0];
      let nameBefore = ctor.getName();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let nameAfter = ctor.getName();
      expect(nameBefore).assertEqual(nameAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0320
     * @tc.name testConstructorGetReturnType2P2Test032
     * @tc.desc Verify getName unchanged after getReturnType on long-short constructor (ExtNameG)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtNameG>().getConstructors()[0];
      let nameBefore = ctor.getName();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let nameAfter = ctor.getName();
      expect(nameBefore).assertEqual(nameAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0330
     * @tc.name testConstructorGetReturnType2P2Test033
     * @tc.desc Verify getName unchanged after getReturnType on float-param constructor (ExtCmpH)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtCmpH>().getConstructors()[0];
      let nameBefore = ctor.getName();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let nameAfter = ctor.getName();
      expect(nameBefore).assertEqual(nameAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0340
     * @tc.name testConstructorGetReturnType2P2Test034
     * @tc.desc Verify isPublic unchanged after getReturnType on short-param constructor (ExtCmpG)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtCmpG>().getConstructors()[0];
      let visBefore = ctor.isPublic();
      let ret = ctor.getReturnType();
      let visAfter = ctor.isPublic();
      expect(visBefore).assertEqual(visAfter);
      expect(ret.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0350
     * @tc.name testConstructorGetReturnType2P2Test035
     * @tc.desc Verify getName unchanged after getReturnType on char-param constructor (ExtOwnJ)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtOwnJ>().getConstructors()[0];
      let nameBefore = ctor.getName();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let nameAfter = ctor.getName();
      expect(nameBefore).assertEqual(nameAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0360
     * @tc.name testConstructorGetReturnType2P2Test036
     * @tc.desc Verify constructors from no-arg (EmptyCls) and int-param (TcTwoPubA) return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameA = Class.from<EmptyCls>().getConstructors()[0].getReturnType().getName();
      let nameB = Class.from<TcTwoPubA>().getConstructors()[0].getReturnType().getName();
      expect(nameA).assertEqual(nameB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0370
     * @tc.name testConstructorGetReturnType2P2Test037
     * @tc.desc Verify constructors from string-param (StringFieldWithMethod) and boolean-param (IP2_110_PubDefBool) return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameC = Class.from<StringFieldWithMethod>().getConstructors()[0].getReturnType().getName();
      let nameD = Class.from<IP2_110_PubDefBool>().getConstructors()[0].getReturnType().getName();
      expect(nameC).assertEqual(nameD);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0380
     * @tc.name testConstructorGetReturnType2P2Test038
     * @tc.desc Verify constructors from double-float-param (ExtCmpE) and no-arg (EmptyCls) return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameE = Class.from<ExtCmpE>().getConstructors()[0].getReturnType().getName();
      let nameA = Class.from<EmptyCls>().getConstructors()[0].getReturnType().getName();
      expect(nameE).assertEqual(nameA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0390
     * @tc.name testConstructorGetReturnType2P2Test039
     * @tc.desc Verify constructors from no-arg (EmptyCls) and short-param (PubShortParam) return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameF = Class.from<EmptyCls>().getConstructors()[0].getReturnType().getName();
      let nameG = Class.from<PubShortParam>().getConstructors()[0].getReturnType().getName();
      expect(nameF).assertEqual(nameG);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0400
     * @tc.name testConstructorGetReturnType2P2Test040
     * @tc.desc Verify constructors from byte-param (PubByteParam) and float-int-param (ExtCmpI) return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameH = Class.from<PubByteParam>().getConstructors()[0].getReturnType().getName();
      let nameI = Class.from<ExtCmpI>().getConstructors()[0].getReturnType().getName();
      expect(nameH).assertEqual(nameI);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0410
     * @tc.name testConstructorGetReturnType2P2Test041
     * @tc.desc Verify constructors from char-string-param (Ext4_CharStringMix) and no-arg (EmptyCls) return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameJ = Class.from<Ext4_CharStringMix>().getConstructors()[0].getReturnType().getName();
      let nameA = Class.from<EmptyCls>().getConstructors()[0].getReturnType().getName();
      expect(nameJ).assertEqual(nameA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0420
     * @tc.name testConstructorGetReturnType2P2Test042
     * @tc.desc Verify three constructors from int (TcTwoPubA), boolean (IP2_110_PubDefBool), no-arg (EmptyCls) return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameB = Class.from<TcTwoPubA>().getConstructors()[0].getReturnType().getName();
      let nameD = Class.from<IP2_110_PubDefBool>().getConstructors()[0].getReturnType().getName();
      let nameF = Class.from<EmptyCls>().getConstructors()[0].getReturnType().getName();
      expect(nameB).assertEqual(nameD);
      expect(nameD).assertEqual(nameF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0430
     * @tc.name testConstructorGetReturnType2P2Test043
     * @tc.desc Verify three constructors from string (StringFieldWithMethod), double-float (ExtCmpE), byte (PubByteParam) return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameC = Class.from<StringFieldWithMethod>().getConstructors()[0].getReturnType().getName();
      let nameE = Class.from<ExtCmpE>().getConstructors()[0].getReturnType().getName();
      let nameH = Class.from<PubByteParam>().getConstructors()[0].getReturnType().getName();
      expect(nameC).assertEqual(nameE);
      expect(nameE).assertEqual(nameH);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0440
     * @tc.name testConstructorGetReturnType2P2Test044
     * @tc.desc Verify three constructors from no-arg (EmptyCls), float-int (ExtCmpI), char-string (Ext4_CharStringMix) return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameA = Class.from<EmptyCls>().getConstructors()[0].getReturnType().getName();
      let nameI = Class.from<ExtCmpI>().getConstructors()[0].getReturnType().getName();
      let nameJ = Class.from<Ext4_CharStringMix>().getConstructors()[0].getReturnType().getName();
      expect(nameA).assertEqual(nameI);
      expect(nameI).assertEqual(nameJ);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0450
     * @tc.name testConstructorGetReturnType2P2Test045
     * @tc.desc Verify constructors from boolean (IP2_110_PubDefBool) and short (PubShortParam) return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameD = Class.from<IP2_110_PubDefBool>().getConstructors()[0].getReturnType().getName();
      let nameG = Class.from<PubShortParam>().getConstructors()[0].getReturnType().getName();
      expect(nameD).assertEqual(nameG);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0460
     * @tc.name testConstructorGetReturnType2P2Test046
     * @tc.desc Verify combined properties: getName void, isPrimitive true, isFinal true, isInterface false on tri-param constructor (ExtFinC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtFinC>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.isPrimitive()).assertTrue();
      expect(rt.isFinal()).assertTrue();
      expect(rt.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0470
     * @tc.name testConstructorGetReturnType2P2Test047
     * @tc.desc Verify combined properties: getName void, isPrimitive true, getName does not include 'Array' on int-param constructor (ExtCmpB)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtCmpB>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.isPrimitive()).assertTrue();
      expect(rt.getName().includes("Array")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0480
     * @tc.name testConstructorGetReturnType2P2Test048
     * @tc.desc Verify combined properties: getName void, isFinal true, isAbstract true on string-boolean constructor (ExtLenC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtLenC>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.isFinal()).assertTrue();
      expect(rt.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0490
     * @tc.name testConstructorGetReturnType2P2Test049
     * @tc.desc Verify combined properties: getName void, isInterface false, getName does not include 'Array' on quad-param constructor (ExtChainD)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtChainD>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.isInterface()).assertFalse();
      expect(rt.getName().includes("Array")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0500
     * @tc.name testConstructorGetReturnType2P2Test050
     * @tc.desc Verify combined properties: getName void, isPrimitive true, isFinal true on float-long constructor (ExtChainE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtChainE>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.isPrimitive()).assertTrue();
      expect(rt.isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0510
     * @tc.name testConstructorGetReturnType2P2Test051
     * @tc.desc Verify combined properties: getName void, getName does not include 'Array', isAbstract true on char-param constructor (ExtChainF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtChainF>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.getName().includes("Array")).assertFalse();
      expect(rt.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0520
     * @tc.name testConstructorGetReturnType2P2Test052
     * @tc.desc Verify constructors from 7-param (SevenParams) and 8-param (EightParams) classes return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameA = Class.from<SevenParams>().getConstructors()[0].getReturnType().getName();
      let nameB = Class.from<EightParams>().getConstructors()[0].getReturnType().getName();
      expect(nameA).assertEqual("void");
      expect(nameB).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0530
     * @tc.name testConstructorGetReturnType2P2Test053
     * @tc.desc Verify constructors from 10-param (TenParams) and 12-param (ExtPcD) classes return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameC = Class.from<TenParams>().getConstructors()[0].getReturnType().getName();
      let nameD = Class.from<ExtPcD>().getConstructors()[0].getReturnType().getName();
      expect(nameC).assertEqual("void");
      expect(nameD).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0540
     * @tc.name testConstructorGetReturnType2P2Test054
     * @tc.desc Verify constructors from 15-param (ExtPcE) and 20-param (ExtPcF) classes return same type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameE = Class.from<ExtPcE>().getConstructors()[0].getReturnType().getName();
      let nameF = Class.from<ExtPcF>().getConstructors()[0].getReturnType().getName();
      expect(nameE).assertEqual("void");
      expect(nameF).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0550
     * @tc.name testConstructorGetReturnType2P2Test055
     * @tc.desc Verify isPrimitive true and getName void on void return from 7-param constructor (ExtPcA)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtPcA>().getConstructors()[0].getReturnType();
      expect(rt.isPrimitive()).assertTrue();
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0560
     * @tc.name testConstructorGetReturnType2P2Test056
     * @tc.desc Verify isPrimitive true and getName void on void return from 8-param constructor (ExtPcB)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtPcB>().getConstructors()[0].getReturnType();
      expect(rt.isPrimitive()).assertTrue();
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0570
     * @tc.name testConstructorGetReturnType2P2Test057
     * @tc.desc Verify isPrimitive true and getName void on void return from 10-param constructor (ExtPcC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtPcC>().getConstructors()[0].getReturnType();
      expect(rt.isPrimitive()).assertTrue();
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0580
     * @tc.name testConstructorGetReturnType2P2Test058
     * @tc.desc Verify isFinal true and name does not contain Array on void return from 12-param constructor (ExtPcD)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtPcD>().getConstructors()[0].getReturnType();
      expect(rt.isFinal()).assertTrue();
      expect(rt.getName().includes("Array")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0590
     * @tc.name testConstructorGetReturnType2P2Test059
     * @tc.desc Verify isFinal true and name does not contain Array on void return from 15-param constructor (ExtPcE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtPcE>().getConstructors()[0].getReturnType();
      expect(rt.isFinal()).assertTrue();
      expect(rt.getName().includes("Array")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0600
     * @tc.name testConstructorGetReturnType2P2Test060
     * @tc.desc Verify isFinal true and name does not contain Array on void return from 20-param constructor (ExtPcF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtPcF>().getConstructors()[0].getReturnType();
      expect(rt.isFinal()).assertTrue();
      expect(rt.getName().includes("Array")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0610
     * @tc.name testConstructorGetReturnType2P2Test061
     * @tc.desc Verify isAbstract true and isInterface false on void return from 7-param constructor (ExtPcA)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtPcA>().getConstructors()[0].getReturnType();
      expect(rt.isAbstract()).assertTrue();
      expect(rt.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0620
     * @tc.name testConstructorGetReturnType2P2Test062
     * @tc.desc Verify isAbstract true and isInterface false on void return from 8-param constructor (ExtPcB)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtPcB>().getConstructors()[0].getReturnType();
      expect(rt.isAbstract()).assertTrue();
      expect(rt.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0630
     * @tc.name testConstructorGetReturnType2P2Test063
     * @tc.desc Verify isAbstract true and isInterface false on void return from 10-param constructor (ExtPcC)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<ExtPcC>().getConstructors()[0].getReturnType();
      expect(rt.isAbstract()).assertTrue();
      expect(rt.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0640
     * @tc.name testConstructorGetReturnType2P2Test064
     * @tc.desc Verify getParametersNum unchanged after getReturnType on 12-param constructor (ExtPcD)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtPcD>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0650
     * @tc.name testConstructorGetReturnType2P2Test065
     * @tc.desc Verify getParametersNum unchanged after getReturnType on 15-param constructor (ExtPcE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtPcE>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0660
     * @tc.name testConstructorGetReturnType2P2Test066
     * @tc.desc Verify getParametersNum unchanged after getReturnType on 20-param constructor (ExtPcF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtPcF>().getConstructors()[0];
      let numBefore = ctor.getParametersNum();
      let ret = ctor.getReturnType();
      expect(ret.getName()).assertEqual("void");
      let numAfter = ctor.getParametersNum();
      expect(numBefore).assertEqual(numAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0670
     * @tc.name testConstructorGetReturnType2P2Test067
     * @tc.desc Verify getReturnType returns void for constructor with try-catch block (TryCatchCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TryCatchCtorCls>();
      let ctors = cls.getConstructors();
      let rtName = ctors[0].getReturnType().getName();
      expect(rtName).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0680
     * @tc.name testConstructorGetReturnType2P2Test068
     * @tc.desc Verify getReturnType returns void for constructor with switch-case block (SwitchCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SwitchCtorCls>();
      expect(cls.getConstructors()[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0690
     * @tc.name testConstructorGetReturnType2P2Test069
     * @tc.desc Verify getReturnType returns void for constructor with while-loop body (WhileCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<WhileCtorCls>().getConstructors();
      let rt = ctors[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0700
     * @tc.name testConstructorGetReturnType2P2Test070
     * @tc.desc Verify getReturnType returns void for constructor with do-while loop body (DoWhileCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<DoWhileCtorCls>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0710
     * @tc.name testConstructorGetReturnType2P2Test071
     * @tc.desc Verify getReturnType returns void for constructor with ternary conditional (TernaryCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt: Class = Class.from<TernaryCtorCls>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0720
     * @tc.name testConstructorGetReturnType2P2Test072
     * @tc.desc Verify getReturnType returns void for class with implicit default constructor and fields (NoExplicitCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<NoExplicitCtorCls>().getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0730
     * @tc.name testConstructorGetReturnType2P2Test073
     * @tc.desc Verify getReturnType returns void for constructor delegating via this() in two-arg ctor (DelegateCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<DelegateCtorCls>().getConstructors();
      let name0 = ctors[0].getReturnType().getName();
      let name1 = ctors[1].getReturnType().getName();
      expect(name0).assertEqual("void");
      expect(name1).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0740
     * @tc.name testConstructorGetReturnType2P2Test074
     * @tc.desc Verify getReturnType returns void for class implementing multiple interfaces (MultiIfaceCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MultiIfaceCtorCls>().getConstructors()[0];
      let rt = ctor.getReturnType();
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0750
     * @tc.name testConstructorGetReturnType2P2Test075
     * @tc.desc Verify getReturnType returns void for constructor with union type int|string parameter (UnionCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<UnionCtorCls>().getConstructors()[0];
      let rtName = ctor.getReturnType().getName();
      expect(rtName).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0760
     * @tc.name testConstructorGetReturnType2P2Test076
     * @tc.desc Verify getReturnType returns void for constructor with Function callback parameter (FuncParamCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FuncParamCtorCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0770
     * @tc.name testConstructorGetReturnType2P2Test077
     * @tc.desc Verify getReturnType returns void for constructor with Object parameter (ObjectParamCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ObjectParamCtorCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0780
     * @tc.name testConstructorGetReturnType2P2Test078
     * @tc.desc Verify getReturnType returns void for constructor with readonly field assignment (ReadonlyFieldCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ReadonlyFieldCls>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0790
     * @tc.name testConstructorGetReturnType2P2Test079
     * @tc.desc Verify getReturnType returns void for constructor that calls static method (StaticAccessCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticAccessCtorCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0800
     * @tc.name testConstructorGetReturnType2P2Test080
     * @tc.desc Verify getReturnType returns void for constructor calling helper function (HelperFnCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = Class.from<HelperFnCtorCls>().getConstructors()[0].getReturnType().getName();
      expect(n).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0810
     * @tc.name testConstructorGetReturnType2P2Test081
     * @tc.desc Verify getReturnType returns void for constructor with long string literal in body (LongStrCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<LongStrCtorCls>().getConstructors()[0];
      let rt = ctor.getReturnType();
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0820
     * @tc.name testConstructorGetReturnType2P2Test082
     * @tc.desc Verify getReturnType returns void for constructor with char escape sequences (CharEscapeCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<CharEscapeCtorCls>().getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0830
     * @tc.name testConstructorGetReturnType2P2Test083
     * @tc.desc Verify getReturnType returns void for constructor with multiple array parameters (MultiArrCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiArrCtorCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0840
     * @tc.name testConstructorGetReturnType2P2Test084
     * @tc.desc Verify getReturnType returns void for constructor with Set<byte> and Map<int, boolean> params (SetMapMixedCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetMapMixedCtorCls>();
      let ctors = cls.getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0850
     * @tc.name testConstructorGetReturnType2P2Test085
     * @tc.desc Verify getReturnType returns void for constructor with default parameter values (DefaultParamCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<DefaultParamCtorCls>().getConstructors();
      expect(ctors[0].getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0860
     * @tc.name testConstructorGetReturnType2P2Test086
     * @tc.desc Verify getReturnType returns void for class referencing static field from another class (StaticRefOtherCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StaticRefOtherCtorCls>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0870
     * @tc.name testConstructorGetReturnType2P2Test087
     * @tc.desc Verify getReturnType returns void for constructor with nested object initialization (NestedInitCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<NestedInitCtorCls>().getConstructors()[0];
      let rtName = ctor.getReturnType().getName();
      expect(rtName).assertEqual("void");
      let ownerName = ctor.getOwner().getName();
      expect(ownerName.includes("NestedInitCtorCls")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0880
     * @tc.name testConstructorGetReturnType2P2Test088
     * @tc.desc Verify getReturnType returns void for constructor with boolean[] and int[][] parameters (BoolIntArrCtorCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<BoolIntArrCtorCls>().getConstructors();
      let rt = ctors[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0890
     * @tc.name testConstructorGetReturnType2P2Test089
     * @tc.desc Verify cross-class getReturnType comparison across three unrelated classes (TcTwoPubA, StringFieldWithMethod, IP2_110_PubDefBool)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nA = Class.from<TcTwoPubA>().getConstructors()[0].getReturnType().getName();
      let nB = Class.from<StringFieldWithMethod>().getConstructors()[0].getReturnType().getName();
      let nC = Class.from<IP2_110_PubDefBool>().getConstructors()[0].getReturnType().getName();
      expect(nA).assertEqual("void");
      expect(nB).assertEqual("void");
      expect(nC).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0900
     * @tc.name testConstructorGetReturnType2P2Test090
     * @tc.desc Verify getReturnType returns void for final class with boolean parameter constructor (FinBoolParamCtor)  A4xB3xE2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<FinBoolParamCtor>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0910
     * @tc.name testConstructorGetReturnType2P2Test091
     * @tc.desc Verify getReturnType returns void for class extending EmptyCls with interface method (ExtImplCls)  A9xA10xE1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ExtImplCls>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0920
     * @tc.name testConstructorGetReturnType2P2Test092
     * @tc.desc Verify getReturnType returns void for abstract class with double parameter constructor (AbsDblParamCtor)  A3xB4xE2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<AbsDblParamCtor>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0930
     * @tc.name testConstructorGetReturnType2P2Test093
     * @tc.desc Verify getReturnType returns void for final class with 3 mixed params int+string+boolean (FinTriParamCtor)  A4xB1xB2xB3xE4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<FinTriParamCtor>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0940
     * @tc.name testConstructorGetReturnType2P2Test094
     * @tc.desc Verify getReturnType returns void for class implementing MultiOne+MultiTwo with float+byte params (MultiImplParamCtor)  A10xB5xB6xE3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MultiImplParamCtor>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0950
     * @tc.name testConstructorGetReturnType2P2Test095
     * @tc.desc Verify cross-class comparison: abstract (ExtCmpB) and final (FinBoolParamCtor) both return void  A3 vs A4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameAbs = Class.from<ExtCmpB>().getConstructors()[0].getReturnType().getName();
      let nameFin = Class.from<FinBoolParamCtor>().getConstructors()[0].getReturnType().getName();
      expect(nameAbs).assertEqual("void");
      expect(nameFin).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0960
     * @tc.name testConstructorGetReturnType2P2Test096
     * @tc.desc Verify getReturnType returns void for 2-level inheritance chain with long params (LongInheritBase/LongInheritMid)  A9xB8xE2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nBase = Class.from<LongInheritBase>().getConstructors()[0].getReturnType().getName();
      let nMId = Class.from<LongInheritMid>().getConstructors()[0].getReturnType().getName();
      expect(nBase).assertEqual("void");
      expect(nMId).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0970
     * @tc.name testConstructorGetReturnType2P2Test097
     * @tc.desc Verify getReturnType returns void for constructor with deep nested generic param Map<string, Array<FixedArray<int>>> (NestedDeepGenericCtor)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<NestedDeepGenericCtor>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0980
     * @tc.name testConstructorGetReturnType2P2Test098
     * @tc.desc Verify getReturnType returns void for constructor with Array<string> and Array<int> dual-collection params (CollectionPairCtor)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CollectionPairCtor>().getConstructors()[0];
      expect(ctor.getReturnType().getName()).assertEqual("void");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_0990
     * @tc.name testConstructorGetReturnType2P2Test099
     * @tc.desc Verify isFinal+isAbstract return type properties on abstract class constructor return type (AbsDblParamCtor)  A3 props
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<AbsDblParamCtor>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.isFinal()).assertTrue();
      expect(rt.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_1000
     * @tc.name testConstructorGetReturnType2P2Test100
     * @tc.desc Verify isFinal+isPrimitive true, isInterface false and name does not contain Array on final generic class constructor return type (FinalGenericBox<double>)  A4xA5 props
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rt = Class.from<FinalGenericBox<double>>().getConstructors()[0].getReturnType();
      expect(rt.getName()).assertEqual("void");
      expect(rt.isFinal()).assertTrue();
      expect(rt.isPrimitive()).assertTrue();
      expect(rt.getName().includes("Array")).assertFalse();
      expect(rt.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETRETURNTYPE_ExtP2_1010
     * @tc.name testConstructorGetReturnType2P2Test101
     * @tc.desc Verify isAbstract true and isInterface false on constructor return types and match across classes (ExtCmpB vs EmptyCls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetReturnType2P2Test101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtA = Class.from<ExtCmpB>().getConstructors()[0].getReturnType();
      let rtB = Class.from<EmptyCls>().getConstructors()[0].getReturnType();
      expect(rtA.getName()).assertEqual("void");
      expect(rtB.getName()).assertEqual("void");
      expect(rtA.isAbstract()).assertTrue();
      expect(rtB.isAbstract()).assertTrue();
      expect(rtA.isInterface()).assertFalse();
      expect(rtB.isInterface()).assertFalse();
    });

  });
}
