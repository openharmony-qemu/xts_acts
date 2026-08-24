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

import {TcTwoPubA,StringFieldWithMethod,DoubleFieldClass,MultiFieldClass,ChildClass,ComputedClass,CtorOverload3,Ctor2DblDbl,InterfaceImplClass,ConcreteFromAbstract_Ext,ArrayCtor,NoArgClass,IntFieldClass,StringFieldClass,BoolFieldClass,ParentClass,ManyFieldsClass,ArrayWrapClass,IntCtor,BoolCtor,EmptyCls,CI02_Inner,CI02_Multi,NumberCtor,StringCtor,CI02_OneInt,CI_20Params,CI_Default1,CI02_Default,CI_ThreeLeaf,SixMixed_Ext,TwoParamCtor,CI02_Overload,CI_DefaultMix,CI_SuperChild,CI_ThisChain0,CI_ThisChain1,ParamCountCls,CI02_Container,CI02_TwoIntStr,CI_DefaultFlag,CI_DefaultZero,EightMixed_Ext,ThreeParamCtor,CI02_TwoStrBool,CI02_WithMethod,MultiInterface_Ext,OverloadMiddleCtor,PubByteParam,PubShortParam,FiveParamCls,Ext4_CharOptParam,CtorDoubleArrParam,CtorMultiDimArrParam,CtorFixedArrStrParam,Ext4_FixedArrOptParam,Ctor_MapStrInt,Ext2_MapStrBoolParam,EqExt_CustomParamCtor,EqExt_CustomAndStr,ObjectParamCtor_Ext,GN_ExtCombStrArr,Ctor_int_String_double,IP3_193_PubFloat,} from "../Util.test";
export default function ConstructorCreateInstanceTest2Part2(): void {
  describe("ConstructorCreateInstanceTest2Part2", (): void => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 100);
      });
    });
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_0100    
     * @tc.name testConstructorCreateInstance2P2Test001
     * @tc.desc Verify ArrayCtor createInstance with array arg succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayCtor>();
      let ctor = cls.getConstructors()[0];
      let obj = ctor.createInstance([[1, 2, 3]]) as ArrayCtor;
      expect(obj.v[0]).assertEqual(1);
      expect(obj.v[1]).assertEqual(2);
      expect(obj.v[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_0200    
     * @tc.name testConstructorCreateInstance2P2Test002
     * @tc.desc Verify ArrayCtor integer throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([42]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_0300    
     * @tc.name testConstructorCreateInstance2P2Test003
     * @tc.desc Verify ConcreteFromAbstract_Ext int parameter throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConcreteFromAbstract_Ext>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([42]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_0400    
     * @tc.name testConstructorCreateInstance2P2Test004
     * @tc.desc Verify NoArgClass createInstance() instance not null and name is 'default'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoArgClass>();
      let ctor = cls.getConstructors()[0];
      let inst = ctor.createInstance() as NoArgClass;
      expect(inst).not().assertNull();
      expect(inst.name).assertEqual("default");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_0500    
     * @tc.name testConstructorCreateInstance2P2Test005
     * @tc.desc Verify ParentClass createInstance returns instance with parentField=parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentClass>();
      let ctor = cls.getConstructors()[0];
      let inst = ctor.createInstance() as ParentClass;
      expect(inst.parentField).assertEqual("parent");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_0600    
     * @tc.name testConstructorCreateInstance2P2Test006
     * @tc.desc Verify ManyFieldsClass createInstance returns instance with f0=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ManyFieldsClass>();
      let ctor = cls.getConstructors()[0];
      let inst = ctor.createInstance() as ManyFieldsClass;
      expect(inst.f0).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_0700    
     * @tc.name testConstructorCreateInstance2P2Test007
     * @tc.desc Verify ChildClass createInstance() instance not null and childInt is Int.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass>();
      let ctor = cls.getConstructors()[0];
      let inst = ctor.createInstance() as ChildClass;
      expect(inst).not().assertNull();
      expect(inst.childInt).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_0800    
     * @tc.name testConstructorCreateInstance2P2Test008
     * @tc.desc Verify IntFieldClass createInstance([-1]) value is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntFieldClass>();
      let ctor = cls.getConstructors()[0];
      let inst = ctor.createInstance([-1]) as IntFieldClass;
      expect(inst.value).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_0900    
     * @tc.name testConstructorCreateInstance2P2Test009
     * @tc.desc Verify StringFieldClass createInstance(['']) value is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldClass>();
      let ctor = cls.getConstructors()[0];
      let inst = ctor.createInstance(['']) as StringFieldClass;
      expect(inst.value).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_1000    
     * @tc.name testConstructorCreateInstance2P2Test010
     * @tc.desc Verify BoolFieldClass int parameter throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolFieldClass>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([42]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_1100    
     * @tc.name testConstructorCreateInstance2P2Test011
     * @tc.desc Verify DoubleFieldClass createInstance([-3.14]) value is -3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleFieldClass>();
      let ctor = cls.getConstructors()[0];
      let inst = ctor.createInstance([-3.14]) as DoubleFieldClass;
      expect(inst.value).assertEqual(-3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_1200    
     * @tc.name testConstructorCreateInstance2P2Test012
     * @tc.desc Verify ComputedClass (0, 0, empty) sum is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ComputedClass>();
      let ctor = cls.getConstructors()[0];
      let inst = ctor.createInstance([0, 0, '']) as ComputedClass;
      expect(inst.sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_1300    
     * @tc.name testConstructorCreateInstance2P2Test013
     * @tc.desc Verify ComputedClass (10000000000, 20000000000, large) throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ComputedClass>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([10000000000, 20000000000, "large"]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_1400    
     * @tc.name testConstructorCreateInstance2P2Test014
     * @tc.desc Verify ArrayWrapClass negative array items length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayWrapClass>();
      let ctor = cls.getConstructors()[0];
      let inst = ctor.createInstance([[-1, -2, -3]]) as ArrayWrapClass;
      expect(inst.items.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_1500    
     * @tc.name testConstructorCreateInstance2P2Test015
     * @tc.desc Verify NoArgClass createInstance returns instance with name=default and does not change getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoArgClass>();
      let ctor = cls.getConstructors()[0];
      let beforeNum: int = ctor.getParametersNum();
      let inst = ctor.createInstance() as NoArgClass;
      expect(inst.name).assertEqual("default");
      expect(ctor.getParametersNum()).assertEqual(beforeNum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_1600    
     * @tc.name testConstructorCreateInstance2P2Test016
     * @tc.desc Verify IntFieldClass createInstance returns instance with value=5 and does not change getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntFieldClass>();
      let ctor = cls.getConstructors()[0];
      let inst = ctor.createInstance([5]) as IntFieldClass;
      expect(inst.value).assertEqual(5);
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_1700    
     * @tc.name testConstructorCreateInstance2P2Test017
     * @tc.desc Verify NoArgClass createInstance returns instance with name=default and does not change isNative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoArgClass>();
      let ctor = cls.getConstructors()[0];
      let beforeNative: boolean = ctor.isNative();
      let inst = ctor.createInstance() as NoArgClass;
      expect(inst.name).assertEqual("default");
      expect(ctor.isNative()).assertEqual(beforeNative);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_1800    
     * @tc.name testConstructorCreateInstance2P2Test018
     * @tc.desc Verify IntFieldClass createInstance returns instance with value=5 and does not change getParameterType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntFieldClass>();
      let ctor = cls.getConstructors()[0];
      let beforeType = ctor.getParameterType(0);
      let inst = ctor.createInstance([5]) as IntFieldClass;
      expect(inst.value).assertEqual(5);
      expect(ctor.getParameterType(0)).assertEqual(beforeType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_1900    
     * @tc.name testConstructorCreateInstance2P2Test019
     * @tc.desc Verify MultiFieldClass createInstance returns instance with intVal=0 and does not change getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFieldClass>();
      let ctor = cls.getConstructors()[0];
      let beforeNum: int = ctor.getParametersNum();
      let inst = ctor.createInstance([0, '', false, 0.0]) as MultiFieldClass;
      expect(inst.intVal).assertEqual(0);
      expect(ctor.getParametersNum()).assertEqual(beforeNum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_2000    
     * @tc.name testConstructorCreateInstance2P2Test020
     * @tc.desc Verify IntFieldClass createInstance returns instance with value=5 and does not change getOwner name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntFieldClass>();
      let ctor = cls.getConstructors()[0];
      let beforeOwner: string = ctor.getOwner().getName();
      let inst = ctor.createInstance([5]) as IntFieldClass;
      expect(inst.value).assertEqual(5);
      expect(ctor.getOwner().getName()).assertEqual(beforeOwner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_2100    
     * @tc.name testConstructorCreateInstance2P2Test021
     * @tc.desc Verify NoArgClass createInstance returns instance with name=default and does not change isPublic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoArgClass>();
      let ctor = cls.getConstructors()[0];
      let beforePub: boolean = ctor.isPublic();
      let inst = ctor.createInstance() as NoArgClass;
      expect(inst.name).assertEqual("default");
      expect(ctor.isPublic()).assertEqual(beforePub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_2200    
     * @tc.name testConstructorCreateInstance2P2Test022
     * @tc.desc Verify two createInstance calls return different references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcTwoPubA>();
      let ctor = cls.getConstructors()[0];
      let inst1 = ctor.createInstance([5]) as TcTwoPubA;
      let inst2 = ctor.createInstance([10]) as TcTwoPubA;
      expect(inst1).not().assertEqual(inst2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_2300    
     * @tc.name testConstructorCreateInstance2P2Test023
     * @tc.desc Verify CtorOverload3 no-arg overload createInstance returns default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<CtorOverload3>().getConstructors();
      let ctor = ctors[0];
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParameterTypes().length == 0) {
          ctor = ctors[i];
        }
      }
      let obj = ctor.createInstance() as CtorOverload3;
      expect(obj.value).assertEqual("default");
      expect(obj.count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_2400    
     * @tc.name testConstructorCreateInstance2P2Test024
     * @tc.desc Verify CtorOverload3 three params throws TypeError (all overloads take at most 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<CtorOverload3>().getConstructors();
      let ctor = ctors[0];
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParameterTypes().length == 2) {
          ctor = ctors[i];
        }
      }
      try {
        ctor.createInstance(['x', 1, true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_2500    
     * @tc.name testConstructorCreateInstance2P2Test025
     * @tc.desc Verify MultiFieldClass (-1, neg, true, 0.0) intVal -1 and doubleVal 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFieldClass>();
      let ctor = cls.getConstructors()[0];
      let inst = ctor.createInstance([-1, "neg", true, 0.0]) as MultiFieldClass;
      expect(inst.intVal).assertEqual(-1);
      expect(inst.doubleVal).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_2600    
     * @tc.name testConstructorCreateInstance2P2Test026
     * @tc.desc Verify IntFieldClass createInstance([0x80000000]) throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntFieldClass>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([0x80000000]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_2700    
     * @tc.name testConstructorCreateInstance2P2Test027
     * @tc.desc Verify IntFieldClass createInstance([parseInt 200]) throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntFieldClass>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([parseInt("200")]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_2800    
     * @tc.name testConstructorCreateInstance2P2Test028
     * @tc.desc Verify IntFieldClass createInstance([parseInt hex 0x123 radix 16]) throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntFieldClass>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([parseInt("0x123", 16)]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_2900    
     * @tc.name testConstructorCreateInstance2P2Test029
     * @tc.desc Verify IntFieldClass createInstance([null]) throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntFieldClass>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([null]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_3000    
     * @tc.name testConstructorCreateInstance2P2Test030
     * @tc.desc Verify IntFieldClass createInstance([parseInt abc NaN]) throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntFieldClass>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([parseInt("abc")]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_3100    
     * @tc.name testConstructorCreateInstance2P2Test031
     * @tc.desc Verify Ctor2DblDbl createInstance with double args succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Ctor2DblDbl>();
      let ctor = cls.getConstructors()[0];
      let obj = ctor.createInstance([-3.14, -0.5]) as Ctor2DblDbl;
      expect(obj.a).assertEqual(-3.14);
      expect(obj.b).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_3200    
     * @tc.name testConstructorCreateInstance2P2Test032
     * @tc.desc Verify CI_ThisChain0 no-arg constructor createInstance sets default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CI_ThisChain0>();
      let ctor = cls.getConstructors()[0];
      let obj = ctor.createInstance() as CI_ThisChain0;
      expect(obj.value).assertEqual("default");
      expect(obj.count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_3300    
     * @tc.name testConstructorCreateInstance2P2Test033
     * @tc.desc Verify CI_ThisChain1 no-arg overload createInstance sets initialized values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<CI_ThisChain1>().getConstructors();
      let ctor = ctors[0];
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParameterTypes().length == 0) {
          ctor = ctors[i];
        }
      }
      let obj = ctor.createInstance() as CI_ThisChain1;
      expect(obj.a).assertEqual("auto");
      expect(obj.b).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_3400    
     * @tc.name testConstructorCreateInstance2P2Test034
     * @tc.desc Verify CI_SuperChild super() call createInstance sets inherited and own fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CI_SuperChild>();
      let ctor = cls.getConstructors()[0];
      let obj = ctor.createInstance(["val", 42]) as CI_SuperChild;
      expect(obj.baseVal).assertEqual("val");
      expect(obj.childVal).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_3500    
     * @tc.name testConstructorCreateInstance2P2Test035
     * @tc.desc Verify three-level inheritance chain super() call createInstance sets all fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CI_ThreeLeaf>();
      let ctor = cls.getConstructors()[0];
      let obj = ctor.createInstance(["top"]) as CI_ThreeLeaf;
      expect(obj.l1).assertEqual("top");
      expect(obj.l2).assertEqual("top");
      expect(obj.l3).assertEqual("top");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_3600    
     * @tc.name testConstructorCreateInstance2P2Test036
     * @tc.desc Verify CI_Default1 no-arg createInstance uses default value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<CI_Default1>().getConstructors();
      let ctor = ctors[0];
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParameterTypes().length == 0) {
          ctor = ctors[i];
        }
      }
      let obj = ctor.createInstance() as CI_Default1;
      expect(obj.x).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_3700    
     * @tc.name testConstructorCreateInstance2P2Test037
     * @tc.desc Verify CI_DefaultMix required param only createInstance uses default for second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<CI_DefaultMix>().getConstructors();
      let ctor = ctors[0];
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParameterTypes().length == 1) {
          ctor = ctors[i];
        }
      }
      let obj = ctor.createInstance(["req"]) as CI_DefaultMix;
      expect(obj.a).assertEqual("req");
      expect(obj.b).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_3800    
     * @tc.name testConstructorCreateInstance2P2Test038
     * @tc.desc Verify CI_DefaultFlag no-arg createInstance uses default true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<CI_DefaultFlag>().getConstructors();
      let ctor = ctors[0];
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParameterTypes().length == 0) {
          ctor = ctors[i];
        }
      }
      let obj = ctor.createInstance() as CI_DefaultFlag;
      expect(obj.flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_3900    
     * @tc.name testConstructorCreateInstance2P2Test039
     * @tc.desc Verify CI_DefaultZero no-arg createInstance uses default 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<CI_DefaultZero>().getConstructors();
      let ctor = ctors[0];
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParameterTypes().length == 0) {
          ctor = ctors[i];
        }
      }
      let obj = ctor.createInstance() as CI_DefaultZero;
      expect(obj.n).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_4000    
     * @tc.name testConstructorCreateInstance2P2Test040
     * @tc.desc Verify TypeError does not corrupt constructor, createInstance recovers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringFieldWithMethod>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([42]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
      let obj = ctor.createInstance(["ok"]) as StringFieldWithMethod;
      expect(obj.value).assertEqual("ok");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_4100    
     * @tc.name testConstructorCreateInstance2P2Test041
     * @tc.desc Verify CI_20Params 20 int parameters createInstance all fields correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CI_20Params>();
      let ctor = cls.getConstructors()[0];
      let obj = ctor.createInstance([
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
      ]) as CI_20Params;
      expect(obj.items.length).assertEqual(20);
      expect(obj.items[0]).assertEqual(1);
      expect(obj.items[10]).assertEqual(11);
      expect(obj.items[19]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_4200    
     * @tc.name testConstructorCreateInstance2P2Test042
     * @tc.desc Verify EmptyCls createInstance returns non-null instance and isPrivate unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      let before: boolean = ctor.isPrivate();
      let inst = ctor.createInstance([]);
      expect(inst).not().assertNull();
      let after: boolean = ctor.isPrivate();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_4300    
     * @tc.name testConstructorCreateInstance2P2Test043
     * @tc.desc Verify EmptyCls createInstance returns non-null instance and equals(self) unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      let before: boolean = ctor.equals(ctor);
      let inst = ctor.createInstance([]);
      expect(inst).not().assertNull();
      let after: boolean = ctor.equals(ctor);
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_4400    
     * @tc.name testConstructorCreateInstance2P2Test044
     * @tc.desc Verify CI02_OneInt createInstance returns instance with val=42 and getReturnType unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CI02_OneInt>().getConstructors()[0];
      let before: string = ctor.getReturnType().getName();
      let inst = ctor.createInstance([42]) as CI02_OneInt;
      expect(inst.val).assertEqual(42);
      let after: string = ctor.getReturnType().getName();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_4500    
     * @tc.name testConstructorCreateInstance2P2Test045
     * @tc.desc Verify CI02_OneInt createInstance returns instance with val=42 and getParameterTypes length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CI02_OneInt>().getConstructors()[0];
      let before: int = ctor.getParameterTypes().length;
      let inst = ctor.createInstance([42]) as CI02_OneInt;
      expect(inst.val).assertEqual(42);
      let after: int = ctor.getParameterTypes().length;
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_4600    
     * @tc.name testConstructorCreateInstance2P2Test046
     * @tc.desc Verify CI02_TwoIntStr createInstance returns correct instance and getParameterType(0) unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CI02_TwoIntStr>().getConstructors()[0];
      let before: string = ctor.getParameterType(0)!.getName();
      let inst = ctor.createInstance([0, '']) as CI02_TwoIntStr;
      expect(inst.a).assertEqual(0);
      expect(inst.b).assertEqual('');
      let after: string = ctor.getParameterType(0)!.getName();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_4700    
     * @tc.name testConstructorCreateInstance2P2Test047
     * @tc.desc Verify CI02_Container createInstance([new CI02_Inner(-1)]) inner.data is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CI02_Container>().getConstructors()[0];
      let inst = ctor.createInstance([new CI02_Inner(-1)]) as CI02_Container;
      expect(inst.inner.data).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_4800    
     * @tc.name testConstructorCreateInstance2P2Test048
     * @tc.desc Verify CI02_Overload no-arg createInstance returns default val 0 tag ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<CI02_Overload>().getConstructors();
      let ctor = ctors[0];
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParameterTypes().length == 0) {
          ctor = ctors[i];
        }
      }
      let inst = ctor.createInstance() as CI02_Overload;
      expect(inst.val).assertEqual(0);
      expect(inst.tag).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_4900    
     * @tc.name testConstructorCreateInstance2P2Test049
     * @tc.desc Verify CI02_WithMethod [-3] createInstance as conversion getDouble returns -6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CI02_WithMethod>().getConstructors()[0];
      let inst = ctor.createInstance([-3]) as CI02_WithMethod;
      expect(inst.getDouble()).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_5000    
     * @tc.name testConstructorCreateInstance2P2Test050
     * @tc.desc Verify CI02_Default no-arg and single-int createInstance return different x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<CI02_Default>().getConstructors();
      let ctor0 = ctors[0];
      let ctor1 = ctors[0];
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParameterTypes().length == 0) {
          ctor0 = ctors[i];
        }
        if (ctors[i].getParameterTypes().length == 1) {
          ctor1 = ctors[i];
        }
      }
      let i0 = ctor0.createInstance() as CI02_Default;
      let i1 = ctor1.createInstance([50]) as CI02_Default;
      expect(i0.x).assertEqual(100);
      expect(i1.x).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_5100    
     * @tc.name testConstructorCreateInstance2P2Test051
     * @tc.desc Verify StringFieldWithMethod createInstance is not CI02_TwoIntStr instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringFieldWithMethod>().getConstructors()[0];
      let inst = ctor.createInstance(['']);
      expect(inst instanceof CI02_TwoIntStr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_5200    
     * @tc.name testConstructorCreateInstance2P2Test052
     * @tc.desc Verify EmptyCls 3x createInstance returns non-null instances and getName unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EmptyCls>().getConstructors()[0];
      let before: string = ctor.getName();
      for (let i: int = 0; i < 3; i++) {
        let inst = ctor.createInstance([]);
        expect(inst).not().assertNull();
      }
      let after: string = ctor.getName();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_5300    
     * @tc.name testConstructorCreateInstance2P2Test053
     * @tc.desc Verify CI02_Multi createInstance([1, 'a', true, 3.14]) instanceof CI02_Multi is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CI02_Multi>().getConstructors()[0];
      let inst = ctor.createInstance([1, 'a', true, 3.14]);
      expect(inst instanceof CI02_Multi).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_5400    
     * @tc.name testConstructorCreateInstance2P2Test054
     * @tc.desc Verify OverloadMiddleCtor no-arg createInstance() is not CI02_Overload instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctors = Class.from<OverloadMiddleCtor>().getConstructors();
      let target = ctors[0];
      for (let i = 0; i < ctors.length; i++) {
        if (ctors[i].getParameterTypes().length == 0) {
          target = ctors[i];
        }
      }
      let inst = target.createInstance();
      expect(inst instanceof CI02_Overload).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_5500    
     * @tc.name testConstructorCreateInstance2P2Test055
     * @tc.desc Verify ParamCountCls createInstance([0, '']) is not CI02_TwoStrBool instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ParamCountCls>().getConstructors()[0];
      let inst = ctor.createInstance([0, '']);
      expect(inst instanceof CI02_TwoStrBool).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_5600    
     * @tc.name testConstructorCreateInstance2P2Test056
     * @tc.desc Verify StringCtor pass hex int 0xFF throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringCtor>().getConstructors()[0];
      try {
        ctor.createInstance([0xff]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_5700    
     * @tc.name testConstructorCreateInstance2P2Test057
     * @tc.desc Verify StringCtor pass binary int 0b1010 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringCtor>().getConstructors()[0];
      try {
        ctor.createInstance([0b1010]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_5800    
     * @tc.name testConstructorCreateInstance2P2Test058
     * @tc.desc Verify StringCtor pass NaN throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringCtor>().getConstructors()[0];
      try {
        ctor.createInstance([Double.NaN]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_5900    
     * @tc.name testConstructorCreateInstance2P2Test059
     * @tc.desc Verify BoolCtor pass hex int 0xFF throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<BoolCtor>().getConstructors()[0];
      try {
        ctor.createInstance([0xff]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_6000    
     * @tc.name testConstructorCreateInstance2P2Test060
     * @tc.desc Verify BoolCtor pass binary int 0b1010 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<BoolCtor>().getConstructors()[0];
      try {
        ctor.createInstance([0b1010]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_6100    
     * @tc.name testConstructorCreateInstance2P2Test061
     * @tc.desc Verify BoolCtor pass int -1 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<BoolCtor>().getConstructors()[0];
      try {
        ctor.createInstance([-1]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_6200    
     * @tc.name testConstructorCreateInstance2P2Test062
     * @tc.desc Verify IntCtor octal literal family createInstance values correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<IntCtor>().getConstructors()[0];
      let obj = ctor.createInstance([0o77]) as IntCtor;
      expect(obj.v).assertEqual(63);
      let obj1 = ctor.createInstance([0o100]) as IntCtor;
      expect(obj1.v).assertEqual(64);
      let obj2 = ctor.createInstance([0o377]) as IntCtor;
      expect(obj2.v).assertEqual(255);
      let obj3 = ctor.createInstance([0o777]) as IntCtor;
      expect(obj3.v).assertEqual(511);
      let obj4 = ctor.createInstance([0o10]) as IntCtor;
      expect(obj4.v).assertEqual(8);
      let obj5 = ctor.createInstance([0o7]) as IntCtor;
      expect(obj5.v).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_6300    
     * @tc.name testConstructorCreateInstance2P2Test063
     * @tc.desc Verify NumberCtor NaN string argument throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<NumberCtor>().getConstructors()[0];
      try {
        ctor.createInstance(["NaN"]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_6400    
     * @tc.name testConstructorCreateInstance2P2Test064
     * @tc.desc Verify ConcreteFromAbstract_Ext extends abstract class createInstance(['hello']) works with super()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ConcreteFromAbstract_Ext>().getConstructors()[0];
      let inst = ctor.createInstance(["hello"]) as ConcreteFromAbstract_Ext;
      expect(inst.val).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_6500    
     * @tc.name testConstructorCreateInstance2P2Test065
     * @tc.desc Verify MultiInterface_Ext implements two interfaces createInstance returns instance with both methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MultiInterface_Ext>().getConstructors()[0];
      let inst = ctor.createInstance(["test", 7]) as MultiInterface_Ext;
      expect(inst.alpha()).assertEqual("prefix_test");
      expect(inst.beta()).assertEqual(107);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_6600    
     * @tc.name testConstructorCreateInstance2P2Test066
     * @tc.desc Verify InterfaceImplClass createInstance([0xFF]) hex value compute returns 510
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<InterfaceImplClass>().getConstructors()[0];
      let inst = ctor.createInstance([0xff]) as InterfaceImplClass;
      expect(inst.base).assertEqual(255);
      expect(inst.compute()).assertEqual(510);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_6700    
     * @tc.name testConstructorCreateInstance2P2Test067
     * @tc.desc Verify SixMixed_Ext createInstance([0,'',false,0.0,-1,'n']) boundary values all 6 fields correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<SixMixed_Ext>().getConstructors()[0];
      let inst = ctor.createInstance([0, '', false, 0.0, -1, 'n']) as SixMixed_Ext;
      expect(inst.a).assertEqual(0);
      expect(inst.b).assertEqual('');
      expect(inst.c).assertFalse();
      expect(inst.d).assertEqual(0.0);
      expect(inst.e).assertEqual(-1);
      expect(inst.f).assertEqual('n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_6800    
     * @tc.name testConstructorCreateInstance2P2Test068
     * @tc.desc Verify EightMixed_Ext createInstance([127,'h',true,1e10,0xFF,'w',false,-3.14]) all 8 mixed fields correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EightMixed_Ext>().getConstructors()[0];
      let inst = ctor.createInstance([127, 'h', true, 1e10, 0xff, 'w', false, -3.14]) as EightMixed_Ext;
      expect(inst.p1).assertEqual(127);
      expect(inst.p2).assertEqual('h');
      expect(inst.p3).assertTrue();
      expect(inst.p4).assertEqual(1e10);
      expect(inst.p5).assertEqual(255);
      expect(inst.p6).assertEqual('w');
      expect(inst.p7).assertFalse();
      expect(inst.p8).assertEqual(-3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_6900    
     * @tc.name testConstructorCreateInstance2P2Test069
     * @tc.desc Verify StringCtor with empty string '' createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringCtor>().getConstructors()[0];
      let inst = ctor.createInstance(['']) as StringCtor;
      expect(inst.v).assertEqual('');
      expect(inst.v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_7000    
     * @tc.name testConstructorCreateInstance2P2Test070
     * @tc.desc Verify StringCtor with null arg throws TypeError (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringCtor>().getConstructors()[0];
      try {
        ctor.createInstance([null]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_7100    
     * @tc.name testConstructorCreateInstance2P2Test071
     * @tc.desc Verify StringCtor with boolean arg true throws TypeError (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringCtor>().getConstructors()[0];
      try {
        ctor.createInstance([true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_7200    
     * @tc.name testConstructorCreateInstance2P2Test072
     * @tc.desc Verify StringCtor with Infinity (number) arg throws TypeError (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<StringCtor>().getConstructors()[0];
      try {
        ctor.createInstance([1.0 / 0.0]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_7300    
     * @tc.name testConstructorCreateInstance2P2Test073
     * @tc.desc Verify PubByteParam createInstance with int 300 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<PubByteParam>().getConstructors()[0];
      try {
        ctor.createInstance([300]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_7400    
     * @tc.name testConstructorCreateInstance2P2Test074
     * @tc.desc Verify PubShortParam createInstance with string throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<PubShortParam>().getConstructors()[0];
      try {
        ctor.createInstance(['x']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_7500    
     * @tc.name testConstructorCreateInstance2P2Test075
     * @tc.desc Verify IP3_193_PubFloat createInstance with double 3.14 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<IP3_193_PubFloat>().getConstructors()[0];
      try {
        ctor.createInstance([3.14]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_7600    
     * @tc.name testConstructorCreateInstance2P2Test076
     * @tc.desc Verify Ext4_CharOptParam createInstance with single-char string succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_CharOptParam>().getConstructors()[0];
      let inst = ctor.createInstance(['a'.charAt(0)]) as Ext4_CharOptParam;
      expect(inst).not().assertNull();
      expect(inst.val).assertEqual('a'.charAt(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_7700    
     * @tc.name testConstructorCreateInstance2P2Test077
     * @tc.desc Verify Ext4_CharOptParam createInstance with int 42 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_CharOptParam>().getConstructors()[0];
      try {
        ctor.createInstance([42]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_7800    
     * @tc.name testConstructorCreateInstance2P2Test078
     * @tc.desc Verify FiveParamCls createInstance with string for byte param throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<FiveParamCls>().getConstructors()[0];
      try {
        ctor.createInstance([1, 'x', true, 1.5, 'b']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_7900    
     * @tc.name testConstructorCreateInstance2P2Test079
     * @tc.desc Verify CtorDoubleArrParam createInstance with double array data[0] is 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CtorDoubleArrParam>().getConstructors()[0];
      let inst = ctor.createInstance([[1.5, -2.5, 0.0]]) as CtorDoubleArrParam;
      expect(inst.data[0]).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_8000    
     * @tc.name testConstructorCreateInstance2P2Test080
     * @tc.desc Verify CtorFixedArrStrParam createInstance with FixedArray string succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<CtorFixedArrStrParam>().getConstructors()[0];
      let arr: FixedArray<string> = ['a', 'b'];
      let inst = ctor.createInstance([arr]) as CtorFixedArrStrParam;
      expect(inst).not().assertNull();
      expect(inst.data[0]).assertEqual('a');
      expect(inst.data[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_8100    
     * @tc.name testConstructorCreateInstance2P2Test081
     * @tc.desc Verify Ext4_FixedArrOptParam createInstance with FixedArray int succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ext4_FixedArrOptParam>().getConstructors()[0];
      let arr: FixedArray<int> = [1, 2, 3];
      let inst = ctor.createInstance([arr]) as Ext4_FixedArrOptParam;
      expect(inst).not().assertNull();
      expect(inst.val[0]).assertEqual(1);
      expect(inst.val[1]).assertEqual(2);
      expect(inst.val[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_8200    
     * @tc.name testConstructorCreateInstance2P2Test082
     * @tc.desc Verify Ctor_MapStrInt createInstance with int for Map param throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ctor_MapStrInt>().getConstructors()[0];
      try {
        ctor.createInstance([42]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_8300    
     * @tc.name testConstructorCreateInstance2P2Test083
     * @tc.desc Verify Ctor_MapStrInt createInstance without args throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ctor_MapStrInt>().getConstructors()[0];
      try {
        ctor.createInstance();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_8400    
     * @tc.name testConstructorCreateInstance2P2Test084
     * @tc.desc Verify EqExt_CustomParamCtor createInstance with null object throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EqExt_CustomParamCtor>().getConstructors()[0];
      try {
        ctor.createInstance([null]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_8500    
     * @tc.name testConstructorCreateInstance2P2Test085
     * @tc.desc Verify EqExt_CustomAndStr createInstance with int for string param throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<EqExt_CustomAndStr>().getConstructors()[0];
      try {
        ctor.createInstance([new EmptyCls(), 99]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_8600    
     * @tc.name testConstructorCreateInstance2P2Test086
     * @tc.desc Verify ObjectParamCtor_Ext createInstance with EmptyCls object instance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<ObjectParamCtor_Ext>().getConstructors()[0];
      let obj = new EmptyCls();
      let inst = ctor.createInstance([obj]) as ObjectParamCtor_Ext;
      expect(inst).not().assertNull();
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_8700    
     * @tc.name testConstructorCreateInstance2P2Test087
     * @tc.desc Verify GN_ExtCombStrArr createInstance with string for int param throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<GN_ExtCombStrArr>().getConstructors()[0];
      try {
        ctor.createInstance([['a', 'b'], 'x', true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_8800    
     * @tc.name testConstructorCreateInstance2P2Test088
     * @tc.desc Verify Ctor_int_String_double createInstance fields a b c assigned correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ctor_int_String_double>().getConstructors()[0];
      let inst = ctor.createInstance([1, 'x', 1.5]) as Ctor_int_String_double;
      expect(inst.a).assertEqual(1);
      expect(inst.b).assertEqual('x');
      expect(inst.c).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP2_8900    
     * @tc.name testConstructorCreateInstance2P2Test089
     * @tc.desc Verify Ctor_int_String_double createInstance with missing arg throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P2Test089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<Ctor_int_String_double>().getConstructors()[0];
      try {
        ctor.createInstance([1, 'x']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

  });
}
