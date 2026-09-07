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

import {TcPub19,TcStr2D,EmptyCls,GN_4Ctor,GN_6Ctor,GenChild,TcBool2D,GN_Long2D,GN_SetDbl,GN_SetStr,GenParent,PubDouble,TcTwoPubA,ComboChild,GN_ByteArr,GN_CharArr,GenericOne,GenericTwo,GN_FloatArr,GN_ShortArr,SingleField,GN_MapIntDbl,GN_MapIntSet,GenericBound,PubByteParam,ParamCountCls,PubShortParam,Ctor_MapStrInt,TripleOverload,AbstractGeneric,GN_MapStrDblArr,ImplIfaceMethod,Ext3_HasSetParam,IP3_193_PubFloat,Ext4_CharOptParam,GenericArrayField,CtorDoubleArrParam,IP2_110_PubDefBool,IP3_201_PubBoolArr,CtorMultiDimArrParam,Ext2_MapStrBoolParam,StringFieldWithMethod,DefaultAndRequired_Ext,GenericsMultiResolved_Ext,EqOverloadCls,GN_ExtCombBI,GN_ExtCombIF,GN_ExtCombStrArr,GN_ExtOv5,GN_P15,GN_P20,GN_P30,GN_P50,MultiParamCtor,} from "../Util.test";
export default function ConstructorGetNameTest2Part1(): void {
  describe("ConstructorGetNameTest2Part1", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_0100     
     * @tc.name testConstructorGetName2P1Test001
     * @tc.desc Verify multi-type-parameter generic class ctor getName returns constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericsMultiResolved_Ext<int, string>>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_0200     
     * @tc.name testConstructorGetName2P1Test002
     * @tc.desc Verify getName indexOf 'constructor' equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<SingleField>().getConstructors()[0].getName();
      expect(name.indexOf("constructor")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_0300     
     * @tc.name testConstructorGetName2P1Test003
     * @tc.desc Verify getName indexOf 'x' equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<ImplIfaceMethod>().getConstructors()[0].getName();
      expect(name.indexOf('x')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_0400     
     * @tc.name testConstructorGetName2P1Test004
     * @tc.desc Verify getName endsWith 'x' is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<DefaultAndRequired_Ext>().getConstructors()[0].getName();
      expect(name.endsWith('x')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_0500     
     * @tc.name testConstructorGetName2P1Test005
     * @tc.desc Verify getName substring(0,0) returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<EmptyCls>().getConstructors()[0].getName();
      expect(name.substring(0, 0)).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_0600     
     * @tc.name testConstructorGetName2P1Test006
     * @tc.desc Verify ConstructorGetName_2 case 068: Different classes constructor getName results are identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameA = Class.from<EmptyCls>().getConstructors()[0].getName();
      let nameB = Class.from<StringFieldWithMethod>().getConstructors()[0].getName();
      expect(nameA).assertEqual(nameB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_0700     
     * @tc.name testConstructorGetName2P1Test007
     * @tc.desc Verify getName returns constructor for TcTwoPubA ctors[0] (optional int param)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcTwoPubA>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_0800     
     * @tc.name testConstructorGetName2P1Test008
     * @tc.desc Verify getName returns constructor for ParamCountCls ctors[0] (int+string params)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParamCountCls>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      expect(ctors[0].getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_0900     
     * @tc.name testConstructorGetName2P1Test009
     * @tc.desc Verify getName concat('') equals itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<PubByteParam>().getConstructors()[0].getName();
      expect(name.concat('')).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_1000     
     * @tc.name testConstructorGetName2P1Test010
     * @tc.desc Verify '' concat getName equals constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<PubShortParam>().getConstructors()[0].getName();
      expect(''.concat(name)).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_1100     
     * @tc.name testConstructorGetName2P1Test011
     * @tc.desc Verify getName repeat(0) returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<TcPub19>().getConstructors()[0].getName();
      expect(name.repeat(0)).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_1200     
     * @tc.name testConstructorGetName2P1Test012
     * @tc.desc Verify getName split '' returns array of length 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<CtorDoubleArrParam>().getConstructors()[0].getName();
      let parts = name.split('');
      expect(parts.length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_1300     
     * @tc.name testConstructorGetName2P1Test013
     * @tc.desc Verify getName equals constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<GN_MapIntDbl>().getConstructors()[0].getName();
      expect(name).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_1400     
     * @tc.name testConstructorGetName2P1Test014
     * @tc.desc Verify getName length * 1 equals 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<GN_SetDbl>().getConstructors()[0].getName();
      expect(name.length * 1).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_1500     
     * @tc.name testConstructorGetName2P1Test015
     * @tc.desc Verify getName length + 0 equals 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<GN_MapStrDblArr>().getConstructors()[0].getName();
      expect(name.length + 0).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_1600     
     * @tc.name testConstructorGetName2P1Test016
     * @tc.desc Verify getName returns constructor for TripleOverload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<TripleOverload>().getConstructors();
      expect(ctors[0].getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_1700     
     * @tc.name testConstructorGetName2P1Test017
     * @tc.desc Verify getName returns constructor for GN_4Ctor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<GN_4Ctor>().getConstructors();
      expect(ctors[0].getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_1800
     * @tc.name testConstructorGetName2P1Test018
     * @tc.desc Verify every GN_6Ctor constructor getName equals constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<GN_6Ctor>().getConstructors();
      for (let i = 0; i < ctors.length; i++) {
        expect(ctors[i].getName()).assertEqual("constructor");
      }
      expect(ctors[0].getName()).assertEqual(ctors[ctors.length - 1].getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_1900
     * @tc.name testConstructorGetName2P1Test019
     * @tc.desc Verify getName returns constructor for GN_P15 (15 parameters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN_P15>();
      let name = cls.getConstructors()[0].getName();
      expect(name).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_2000
     * @tc.name testConstructorGetName2P1Test020
     * @tc.desc Verify getName returns constructor for GN_P50 (50 parameters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN_P50>();
      let name = cls.getConstructors()[0].getName();
      expect(name).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_2100
     * @tc.name testConstructorGetName2P1Test021
     * @tc.desc Verify getName as Map key storing length retrievable as 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<MultiParamCtor>().getConstructors()[0].getName();
      let map = new Map<string, int>();
      map.set(name, name.length);
      expect(map.get("constructor")).assertEqual(11);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_2200
     * @tc.name testConstructorGetName2P1Test022
     * @tc.desc Verify GN_ExtCombBI getName charAt index 4 returns t
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<GN_ExtCombBI>().getConstructors()[0].getName();
      expect(name.charAt(4).toString()).assertEqual('t');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_2300
     * @tc.name testConstructorGetName2P1Test023
     * @tc.desc Verify getName unchanged after isPublic call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      let pub = ctor.isPublic();
      expect(pub).assertTrue();
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_2400
     * @tc.name testConstructorGetName2P1Test024
     * @tc.desc Verify getName for 5-overload constructor at index 0 no-arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<GN_ExtOv5>().getConstructors();
      expect(ctors[0].getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_2500
     * @tc.name testConstructorGetName2P1Test025
     * @tc.desc Verify GN_P20 getName slice from 2 to minus 4 returns nstru
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<GN_P20>().getConstructors()[0].getName();
      expect(name.slice(2, -4)).assertEqual("nstru");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_2600
     * @tc.name testConstructorGetName2P1Test026
     * @tc.desc Verify GN_P30 getName slice negative full length equals constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = Class.from<GN_P30>().getConstructors()[0].getName();
      expect(name.slice(-11)).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_2700
     * @tc.name testConstructorGetName2P1Test027
     * @tc.desc Verify getName returns constructor for 2-overload constructor at index 0 no-arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<EqOverloadCls>().getConstructors();
      expect(ctors.length).assertEqual(2);
      expect(ctors[0].getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_2800
     * @tc.name testConstructorGetName2P1Test028
     * @tc.desc Verify getName returns constructor for constructor with int and float parameter type combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN_ExtCombIF>();
      let name = cls.getConstructors()[0].getName();
      expect(name).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETNAME_ExtP1_2900
     * @tc.name testConstructorGetName2P1Test029
     * @tc.desc Verify getName returns constructor for constructor with string array int boolean parameter combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetName2P1Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN_ExtCombStrArr>();
      let name = cls.getConstructors()[0].getName();
      expect(name).assertEqual("constructor");
    });

  });
}
