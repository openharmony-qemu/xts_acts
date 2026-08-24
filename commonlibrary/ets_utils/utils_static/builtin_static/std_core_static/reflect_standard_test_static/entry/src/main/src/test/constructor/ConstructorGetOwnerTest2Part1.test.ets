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

import {BoxCls,MultiIF,RealCls,EmptyCls,OT_Color,SingleIF,GetSetCls,MethodCls,TcTwoPubA,GO_MyIface,G01_AllTypes,GO_ImplIface,OT_DataPoint,OT_Overload6,OT_Overload8,EqOverloadCls,OT_DataPerson,OT_GenericOne,OT_GenericTwo,ParamCountCls,FieldsAndMethods,PGN_GenericThree,GO_ImplMultiIface,MultiIfaceCtorCls,OT_DerivedWithParam,GO2_Ext_AbstractGeneric,GO2_Ext_ConcreteGeneric,OT_Outer_OT_InnerGeneric,OT_OverloadSameParamCount,AbsCls,CI02_Default,GN2_LvlB,GN2_LvlC,DerivedC,EW_ByteParam,EW_CharParam,EW_FixedArrayParam,EW_FloatParam,EW_IntBoundary,EW_LongParam,EW_ObjectParam,EW_ShortParam,G01_AllFieldTypes,G01_FieldExtremes,G01_ManyFields,G01_OnlyMethods,G01_StaticMembers,G01_TenCtors,G01_TenParams,OT_OverloadDefaultValue,OT_ReflectTarget,OT_ReflectWithFields,OT_ReflectWithMethods,} from "../Util.test";
export default function ConstructorGetOwnerTest2Part1(): void {
  describe("ConstructorGetOwnerTest2Part1", (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 100)
      })
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_0100     
     * @tc.name testConstructorGetOwner2P1Test001
     * @tc.desc Verify abstract generic GO2_Ext_AbstractGeneric getOwner name includes class name and isAbstract true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO2_Ext_AbstractGeneric<int>>();
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner.getName().includes("GO2_Ext_AbstractGeneric")).assertTrue();
      expect(owner.isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_0200     
     * @tc.name testConstructorGetOwner2P1Test002
     * @tc.desc Verify GO2_Ext_ConcreteGeneric getOwner name includes class name and super class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO2_Ext_ConcreteGeneric>();
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner.getName().includes("GO2_Ext_ConcreteGeneric")).assertTrue();
      let parent = owner.getSuper();
      expect(parent!.getName().includes("GO2_Ext_AbstractGeneric")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_0300     
     * @tc.name testConstructorGetOwner2P1Test003
     * @tc.desc Verify ConstructorGetOwner_2 case 004: MethodCls getOwner getName returns MethodCls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MethodCls>();
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner.getName().includes("MethodCls")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_0400     
     * @tc.name testConstructorGetOwner2P1Test004
     * @tc.desc Verify every OT_Overload8 constructor getOwner name includes OT_Overload8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_Overload8>();
      let ctors = cls.getConstructors();
      for (let i = 0; i < ctors.length; i++) {
        expect(ctors[i].getOwner().getName().includes("OT_Overload8")).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_0500     
     * @tc.name testConstructorGetOwner2P1Test005
     * @tc.desc Verify G01_AllTypes getOwner name includes class name and constructor parameter count is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<G01_AllTypes>();
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner.getName().includes("G01_AllTypes")).assertTrue();
      expect(owner.getConstructors()[0].getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_0600     
     * @tc.name testConstructorGetOwner2P1Test006
     * @tc.desc Verify ConstructorGetOwner_2 case 008: SingleIF getOwner getName returns SingleIF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingleIF>();
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner.getName().includes("SingleIF")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_0700     
     * @tc.name testConstructorGetOwner2P1Test007
     * @tc.desc Verify ConstructorGetOwner_2 case 009: MultiIF getOwner getName returns MultiIF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiIF>();
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner.getName().includes("MultiIF")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_0800     
     * @tc.name testConstructorGetOwner2P1Test008
     * @tc.desc Verify AbsCls getOwner getName returns AbsCls for abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbsCls>();
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner.getName().includes("AbsCls")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_0900     
     * @tc.name testConstructorGetOwner2P1Test009
     * @tc.desc Verify ConstructorGetOwner_2 case 011: RealCls getOwner getName returns RealCls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RealCls>();
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner.getName().includes("RealCls")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_1000     
     * @tc.name testConstructorGetOwner2P1Test010
     * @tc.desc Verify ConstructorGetOwner_2 case 013: GetSetCls getOwner getName returns GetSetCls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetSetCls>();
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner.getName().includes("GetSetCls")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_1100     
     * @tc.name testConstructorGetOwner2P1Test011
     * @tc.desc Verify triple generic PGN_GenericThree getOwner name includes class name and parameter count is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PGN_GenericThree<string, int, boolean>>();
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner.getName().includes("PGN_GenericThree")).assertTrue();
      expect(owner.getConstructors()[0].getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_1200     
     * @tc.name testConstructorGetOwner2P1Test012
     * @tc.desc Verify GN2_LvlB getOwner getSuper name includes EmptyCls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN2_LvlB>();
      let owner = cls.getConstructors()[0].getOwner();
      let parent = owner.getSuper();
      expect(parent!.getName().includes("EmptyCls")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_1300     
     * @tc.name testConstructorGetOwner2P1Test013
     * @tc.desc Verify GN2_LvlC getOwner isSubtypeOf GN2_LvlB true and reverse false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN2_LvlC>();
      let owner = cls.getConstructors()[0].getOwner();
      let parentCls = Class.from<GN2_LvlB>();
      expect(owner.isSubtypeOf(parentCls)).assertTrue();
      let parentOwner = parentCls.getConstructors()[0].getOwner();
      expect(parentOwner.isSubtypeOf(owner)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_1400     
     * @tc.name testConstructorGetOwner2P1Test014
     * @tc.desc Verify ConstructorGetOwner_2 case 026: EmptyCls getOwner isSubtypeOf DerivedC returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let owner = cls.getConstructors()[0].getOwner();
      let childCls = Class.from<DerivedC>();
      expect(owner.isSubtypeOf(childCls)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_1500     
     * @tc.name testConstructorGetOwner2P1Test015
     * @tc.desc Verify RealCls owner isSubtypeOf AbsCls returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<RealCls>();
      let owner = cls.getConstructors()[0].getOwner();
      let absCls = Class.from<AbsCls>();
      expect(owner.isSubtypeOf(absCls)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_1600     
     * @tc.name testConstructorGetOwner2P1Test016
     * @tc.desc Verify ConstructorGetOwner_2 case 030: GN2_LvlC getOwner getSuper isSubtypeOf EmptyCls returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN2_LvlC>();
      let owner = cls.getConstructors()[0].getOwner();
      let parent = owner.getSuper();
      let baseCls = Class.from<EmptyCls>();
      expect(parent!.isSubtypeOf(baseCls)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_1700     
     * @tc.name testConstructorGetOwner2P1Test017
     * @tc.desc Verify FieldsAndMethods constructor getOwner name includes FieldsAndMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FieldsAndMethods>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("FieldsAndMethods")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_1800     
     * @tc.name testConstructorGetOwner2P1Test018
     * @tc.desc Verify ConstructorGetOwner_2 case 057: getOwner Class getConstructors createInstance verify field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FieldsAndMethods>();
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner.getName().includes("FieldsAndMethods")).assertTrue();
      let ctor = owner.getConstructors()[0];
      let instance = ctor.createInstance([]) as FieldsAndMethods;
      expect(instance.x).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_1900     
     * @tc.name testConstructorGetOwner2P1Test019
     * @tc.desc Verify CI02_Default ctors[0] getOwner returns CI02_Default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CI02_Default>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(3);
      let owner = ctors[0].getOwner();
      expect(owner.getName().includes("CI02_Default")).assertTrue();
      let owner1 = ctors[1].getOwner();
      expect(owner1.getName().includes("CI02_Default")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_2000     
     * @tc.name testConstructorGetOwner2P1Test020
     * @tc.desc Verify data-like class OT_DataPerson getOwner non-null name includes class name single constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_DataPerson>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().getName().includes("OT_DataPerson")).assertTrue();
      expect(ctor.getOwner().getConstructors().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_2100     
     * @tc.name testConstructorGetOwner2P1Test021
     * @tc.desc Verify interface implementing class constructor getOwner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO_ImplIface>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().getName().includes("GO_ImplIface")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_2200     
     * @tc.name testConstructorGetOwner2P1Test022
     * @tc.desc Verify each level in inheritance chain getOwner returns its own class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c2 = Class.from<GN2_LvlC>().getConstructors()[0];
      let ownerC = c2.getOwner();
      expect(ownerC.getName().includes("GN2_LvlC")).assertTrue();
      let parentB = ownerC.getSuper();
      expect(parentB!.getName().includes("GN2_LvlB")).assertTrue();
      let grandparentA = parentB!.getSuper();
      expect(grandparentA!.getName().includes("EmptyCls")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_2300     
     * @tc.name testConstructorGetOwner2P1Test023
     * @tc.desc Verify OT_DerivedWithParam getOwner name includes class name and super class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_DerivedWithParam>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("OT_DerivedWithParam")).assertTrue();
      let parent = owner.getSuper();
      expect(parent!.getName().includes("ParentWithParam")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_2400     
     * @tc.name testConstructorGetOwner2P1Test024
     * @tc.desc Verify optional parameter constructor does not expand to multiple constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TcTwoPubA>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(1);
      let owner = ctors[0].getOwner();
      expect(owner.getName().includes("TcTwoPubA")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_2500     
     * @tc.name testConstructorGetOwner2P1Test025
     * @tc.desc Verify EmptyCls/GN2_LvlB/GN2_LvlC constructors getOwner name includes own class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsOuter = Class.from<EmptyCls>();
      let clsMid = Class.from<GN2_LvlB>();
      let clsDeep = Class.from<GN2_LvlC>();
      expect(clsOuter.getConstructors()[0].getOwner().getName().includes("EmptyCls")).assertTrue();
      expect(clsMid.getConstructors()[0].getOwner().getName().includes("GN2_Lvl")).assertTrue();
      expect(clsDeep.getConstructors()[0].getOwner().getName().includes("GN2_Lvl")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_2600     
     * @tc.name testConstructorGetOwner2P1Test026
     * @tc.desc Verify GO_ImplMultiIface getOwner.getInterfaces length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO_ImplMultiIface>();
      let ctor = cls.getConstructors()[0];
      let ifaces = ctor.getOwner().getInterfaces();
      expect(ifaces.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_2700     
     * @tc.name testConstructorGetOwner2P1Test027
     * @tc.desc Verify MultiIfaceCtorCls constructor getOwner name correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiIfaceCtorCls>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().getName().includes("MultiIfaceCtorCls")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_2800     
     * @tc.name testConstructorGetOwner2P1Test028
     * @tc.desc Verify different interface implementation classes have different getOwner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<GO_ImplIface>();
      let cls2 = Class.from<GO_ImplMultiIface>();
      let owner1 = cls1.getConstructors()[0].getOwner();
      let owner2 = cls2.getConstructors()[0].getOwner();
      expect(owner1).not().assertEqual(owner2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_2900     
     * @tc.name testConstructorGetOwner2P1Test029
     * @tc.desc Verify interface implementation class getOwner.isInterface returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO_ImplIface>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_3000     
     * @tc.name testConstructorGetOwner2P1Test030
     * @tc.desc Verify interface impl class GO_ImplIface getOwner createInstance and cast to GO_MyIface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO_ImplIface>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().getName().includes("GO_ImplIface")).assertTrue();
      let instance = ctor.getOwner().getConstructors()[0].createInstance([]);
      let impl = instance as GO_MyIface;
      expect(Class.of(impl).getName().includes("GO_ImplIface")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_3100     
     * @tc.name testConstructorGetOwner2P1Test031
     * @tc.desc Verify OT_DataPoint getOwner equals Class.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_DataPoint>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner()).assertEqual(cls);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_3200     
     * @tc.name testConstructorGetOwner2P1Test032
     * @tc.desc Verify data class OT_DataPoint and normal class EmptyCls getOwner are different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsData = Class.from<OT_DataPoint>();
      let clsNormal = Class.from<EmptyCls>();
      let dataOwner = clsData.getConstructors()[0].getOwner();
      let normalOwner = clsNormal.getConstructors()[0].getOwner();
      expect(dataOwner).not().assertEqual(normalOwner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_3300     
     * @tc.name testConstructorGetOwner2P1Test033
     * @tc.desc Verify different data classes OT_DataPoint and CI02_Default have different getOwner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<OT_DataPoint>();
      let cls2 = Class.from<CI02_Default>();
      let owner1 = cls1.getConstructors()[0].getOwner();
      let owner2 = cls2.getConstructors()[0].getOwner();
      expect(owner1).not().assertEqual(owner2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_3400     
     * @tc.name testConstructorGetOwner2P1Test034
     * @tc.desc Verify enum OT_Color has no public constructors and EmptyCls getOwner name includes EmptyCls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsEnum = Class.from<OT_Color>();
      let clsData = Class.from<EmptyCls>();
      expect(clsEnum.getConstructors().length).assertEqual(0);
      let dataOwner = clsData.getConstructors()[0].getOwner();
      expect(dataOwner.getName().includes("EmptyCls")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_3500     
     * @tc.name testConstructorGetOwner2P1Test035
     * @tc.desc Verify getOwner Class getConstructors[0].createInstance creates non-null instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it("testConstructorGetOwner2P1Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("EmptyCls")).assertTrue();
      let instance = owner.getConstructors()[0].createInstance([]);
      expect(instance).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_3600
     * @tc.name testConstructorGetOwner2P1Test036
     * @tc.desc Verify different type params getOwner name all equal OT_GenericOne
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsStr = Class.from<OT_GenericOne<string>>();
      let clsBool = Class.from<OT_GenericOne<boolean>>();
      let clsDouble = Class.from<OT_GenericOne<double>>();
      expect(clsStr.getConstructors()[0].getOwner().getName().includes("OT_GenericOne")).assertTrue();
      expect(clsBool.getConstructors()[0].getOwner().getName().includes("OT_GenericOne")).assertTrue();
      expect(clsDouble.getConstructors()[0].getOwner().getName().includes("OT_GenericOne")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_3700
     * @tc.name testConstructorGetOwner2P1Test037
     * @tc.desc Verify generic class getConstructors length not affected by type params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<OT_GenericOne<string>>();
      let cls2 = Class.from<OT_GenericOne<int>>();
      expect(cls1.getConstructors()[0].getOwner().getConstructors().length).assertEqual(1);
      expect(cls2.getConstructors()[0].getOwner().getConstructors().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_3800
     * @tc.name testConstructorGetOwner2P1Test038
     * @tc.desc Verify generic class getOwner getConstructors[0] getParameterTypes not empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_GenericOne<string>>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().getName().includes("OT_GenericOne")).assertTrue();
      let ownerCtor = ctor.getOwner().getConstructors()[0];
      let paramTypes = ownerCtor.getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_3900
     * @tc.name testConstructorGetOwner2P1Test039
     * @tc.desc Verify concrete class constructor getOwner.isAbstract returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_4000
     * @tc.name testConstructorGetOwner2P1Test040
     * @tc.desc Verify parameter constructor getOwner.getConstructors[0].getParameterTypes not empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParamCountCls>();
      let outerCtor = cls.getConstructors()[0];
      expect(outerCtor.getOwner().getName().includes("ParamCountCls")).assertTrue();
      let innerCtor = outerCtor.getOwner().getConstructors()[0];
      expect(innerCtor.getParameterTypes().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_4100
     * @tc.name testConstructorGetOwner2P1Test041
     * @tc.desc Verify getOwner.getConstructors contains all 6 overloads (0-5 params)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_Overload6>();
      let owner = cls.getConstructors()[0].getOwner();
      let ctors = owner.getConstructors();
      expect(ctors.length).assertEqual(6);
      let found0: boolean = false;
      let found1: boolean = false;
      let found2: boolean = false;
      let found3: boolean = false;
      let found4: boolean = false;
      let found5: boolean = false;
      for (let i = 0; i < ctors.length; i++) {
        let len = ctors[i].getParameterTypes().length;
        if (len === 0) { found0 = true; }
        if (len === 1) { found1 = true; }
        if (len === 2) { found2 = true; }
        if (len === 3) { found3 = true; }
        if (len === 4) { found4 = true; }
        if (len === 5) { found5 = true; }
      }
      expect(found0).assertTrue();
      expect(found1).assertTrue();
      expect(found2).assertTrue();
      expect(found3).assertTrue();
      expect(found4).assertTrue();
      expect(found5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_4200
     * @tc.name testConstructorGetOwner2P1Test042
     * @tc.desc Verify abstract class getOwner has abstract property and constructors list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO2_Ext_AbstractGeneric<int>>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.isAbstract()).assertTrue();
      expect(owner.getConstructors().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_4300
     * @tc.name testConstructorGetOwner2P1Test043
     * @tc.desc Verify getOwner getConstructors[0].getName returns constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().getName().includes("EmptyCls")).assertTrue();
      let ownerCtor = ctor.getOwner().getConstructors()[0];
      expect(ownerCtor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_4400
     * @tc.name testConstructorGetOwner2P1Test044
     * @tc.desc Verify overload classes getOwner.getConstructors length matches expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls6 = Class.from<OT_Overload6>();
      let cls8 = Class.from<OT_Overload8>();
      let len6 = cls6.getConstructors()[0].getOwner().getConstructors().length;
      let len8 = cls8.getConstructors()[0].getOwner().getConstructors().length;
      expect(len6).assertEqual(6);
      expect(len8).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_4500
     * @tc.name testConstructorGetOwner2P1Test045
     * @tc.desc Verify multi-interface GO_ImplMultiIface constructor getOwner name contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO_ImplMultiIface>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("GO_ImplMultiIface")).assertTrue();
      expect(owner.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_4600
     * @tc.name testConstructorGetOwner2P1Test046
     * @tc.desc Verify parameterized classes TcTwoPubA and OT_DerivedWithParam constructors getOwner equals own Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls0 = Class.from<TcTwoPubA>();
      let cls1 = Class.from<OT_DerivedWithParam>();
      let cls2 = Class.from<OT_DerivedWithParam>();
      expect(cls0.getConstructors()[0].getOwner()).assertEqual(cls0);
      expect(cls1.getConstructors()[0].getOwner()).assertEqual(cls1);
      expect(cls2.getConstructors()[0].getOwner()).assertEqual(cls2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_4700
     * @tc.name testConstructorGetOwner2P1Test047
     * @tc.desc Verify OT_ReflectTarget getOwner create instance and access property via cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_ReflectTarget>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("OT_ReflectTarget")).assertTrue();
      let instance = owner.getConstructors()[0].createInstance([]) as OT_ReflectTarget;
      expect(instance.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_4800
     * @tc.name testConstructorGetOwner2P1Test048
     * @tc.desc Verify GO2_Ext_ConcreteGeneric getOwner chain createInstance process returns same int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO2_Ext_ConcreteGeneric>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().getName().includes("GO2_Ext_ConcreteGeneric")).assertTrue();
      let instance = ctor.getOwner().getConstructors()[0].createInstance([]) as GO2_Ext_ConcreteGeneric;
      expect(instance.process(7)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_4900
     * @tc.name testConstructorGetOwner2P1Test049
     * @tc.desc Verify getOwner().getName() returns fully qualified name containing simple class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_Overload6>();
      let ctor = cls.getConstructors()[0];
      let fullName: string = ctor.getOwner().getName();
      expect(fullName.includes("OT_Overload6")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_5000
     * @tc.name testConstructorGetOwner2P1Test050
     * @tc.desc Verify OT_ReflectWithFields constructor getOwner name contains OT_ReflectWithFields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_ReflectWithFields>();
      let ctor = cls.getConstructors()[0];
      let name: string = ctor.getOwner().getName();
      expect(name.includes("OT_ReflectWithFields")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_5100
     * @tc.name testConstructorGetOwner2P1Test051
     * @tc.desc Verify default value overload constructors getOwner name is OT_OverloadDefaultValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_OverloadDefaultValue>();
      let ctors = cls.getConstructors();
      for (let i = 0; i < ctors.length; i++) {
        expect(ctors[i].getOwner().getName().includes("OT_OverloadDefaultValue")).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_5200
     * @tc.name testConstructorGetOwner2P1Test052
     * @tc.desc Verify G01_TenParams 10-param constructor getOwner name contains G01_TenParams
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<G01_TenParams>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("G01_TenParams")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_5300
     * @tc.name testConstructorGetOwner2P1Test053
     * @tc.desc Verify G01_AllTypes all-types constructor getOwner getName does not return G01_AllTypes1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<G01_AllTypes>();
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner.getName().includes("G01_AllTypes1")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_5400
     * @tc.name testConstructorGetOwner2P1Test054
     * @tc.desc Verify G01_TenCtors has 10 constructors and each getOwner name includes G01_TenCtors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<G01_TenCtors>();
      let ctors = cls.getConstructors();
      expect(ctors.length).assertEqual(10);
      for (let i = 0; i < ctors.length; i++) {
        expect(ctors[i].getOwner().getName().includes("G01_TenCtors")).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_5500
     * @tc.name testConstructorGetOwner2P1Test055
     * @tc.desc Verify G01_FieldExtremes getOwner createInstance minInt equals -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<G01_FieldExtremes>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().getName().includes("G01_FieldExtremes")).assertTrue();
      let instance = ctor.getOwner().getConstructors()[0].createInstance([]) as G01_FieldExtremes;
      expect(instance.minInt).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_5600
     * @tc.name testConstructorGetOwner2P1Test056
     * @tc.desc Verify Class.of OT_DataPoint instance getOwner equals class and name contains OT_DataPoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new OT_DataPoint();
      let cls = Class.of(obj);
      let owner = cls.getConstructors()[0].getOwner();
      expect(owner).assertEqual(cls);
      expect(owner.getName().includes("OT_DataPoint")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_5700
     * @tc.name testConstructorGetOwner2P1Test057
     * @tc.desc Verify OT_ReflectWithMethods constructor getOwner name contains class name and is not interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_ReflectWithMethods>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("OT_ReflectWithMethods")).assertTrue();
      expect(owner.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_5800
     * @tc.name testConstructorGetOwner2P1Test058
     * @tc.desc Verify OT_ReflectTarget constructor getOwner name ends with OT_ReflectTarget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_ReflectTarget>();
      let ctor = cls.getConstructors()[0];
      let fullName = ctor.getOwner().getName();
      expect(fullName.endsWith("OT_ReflectTarget")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_5900
     * @tc.name testConstructorGetOwner2P1Test059
     * @tc.desc Verify EW_FixedArrayParam constructor getOwner name contains Array substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EW_FixedArrayParam>();
      let ctor = cls.getConstructors()[0];
      let name = ctor.getOwner().getName();
      expect(name.includes("Array")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_6000
     * @tc.name testConstructorGetOwner2P1Test060
     * @tc.desc Verify G01_OnlyMethods getOwner chain createInstance allows calling foo returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<G01_OnlyMethods>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().getName().includes("G01_OnlyMethods")).assertTrue();
      let instance: G01_OnlyMethods = ctor.getOwner().getConstructors()[0].createInstance([]) as G01_OnlyMethods;
      let val: int = instance.foo();
      expect(val).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_6100
     * @tc.name testConstructorGetOwner2P1Test061
     * @tc.desc Verify G01_ManyFields getOwner chain createInstance field f0 equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<G01_ManyFields>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().getName().includes("G01_ManyFields")).assertTrue();
      let instance: G01_ManyFields = ctor.getOwner().getConstructors()[0].createInstance([]) as G01_ManyFields;
      expect(instance.f0).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_6200
     * @tc.name testConstructorGetOwner2P1Test062
     * @tc.desc Verify G01_AllFieldTypes getOwner createInstance field defaults fi=0 fs=empty fb=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<G01_AllFieldTypes>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().getName().includes("G01_AllFieldTypes")).assertTrue();
      let instance: G01_AllFieldTypes = ctor.getOwner().getConstructors()[0].createInstance([]) as G01_AllFieldTypes;
      expect(instance.fi).assertEqual(0);
      expect(instance.fs).assertEqual('');
      expect(instance.fb).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_6300
     * @tc.name testConstructorGetOwner2P1Test063
     * @tc.desc Verify G01_StaticMembers getOwner chain createInstance returns instance of G01_StaticMembers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<G01_StaticMembers>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner()).assertEqual(cls);
      let instance: G01_StaticMembers = ctor.getOwner().getConstructors()[0].createInstance([]) as G01_StaticMembers;
      expect(Class.of(instance)).assertEqual(cls);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_6400
     * @tc.name testConstructorGetOwner2P1Test064
     * @tc.desc Verify EmptyCls root and GN2_LvlB child constructor getOwner return different Class objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsEmpty = Class.from<EmptyCls>();
      let clsLvlB = Class.from<GN2_LvlB>();
      let ownerEmpty = clsEmpty.getConstructors()[0].getOwner();
      let ownerLvlB = clsLvlB.getConstructors()[0].getOwner();
      expect(ownerEmpty).not().assertEqual(ownerLvlB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_6500
     * @tc.name testConstructorGetOwner2P1Test065
     * @tc.desc Verify EmptyCls root and GN2_LvlC deepest constructor owner names end with class names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsEmpty = Class.from<EmptyCls>();
      let clsLvlC = Class.from<GN2_LvlC>();
      let ownerEmpty = clsEmpty.getConstructors()[0].getOwner();
      let ownerLvlC = clsLvlC.getConstructors()[0].getOwner();
      expect(ownerEmpty.getName().endsWith("EmptyCls")).assertTrue();
      expect(ownerLvlC.getName().endsWith("GN2_LvlC")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_6600
     * @tc.name testConstructorGetOwner2P1Test066
     * @tc.desc Verify GO2_Ext_ConcreteGeneric constructor getOwner equals Class.from reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO2_Ext_ConcreteGeneric>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner()).assertEqual(cls);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_6700
     * @tc.name testConstructorGetOwner2P1Test067
     * @tc.desc Verify GN2_LvlB constructor getOwner equals Class.from reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GN2_LvlB>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner()).assertEqual(cls);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_6800
     * @tc.name testConstructorGetOwner2P1Test068
     * @tc.desc Verify G01_TenParams constructor 3 consecutive getOwner calls return same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<G01_TenParams>();
      let ctor = cls.getConstructors()[0];
      let first = ctor.getOwner();
      let second = ctor.getOwner();
      let third = ctor.getOwner();
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_6900
     * @tc.name testConstructorGetOwner2P1Test069
     * @tc.desc Verify EmptyCls constructor 3 consecutive getOwner calls return identical reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      let first = ctor.getOwner();
      let second = ctor.getOwner();
      let third = ctor.getOwner();
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_7000
     * @tc.name testConstructorGetOwner2P1Test070
     * @tc.desc Verify OT_ReflectWithFields constructor getOwner getInstanceFields length equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_ReflectWithFields>();
      let ctor = cls.getConstructors()[0];
      let fields = ctor.getOwner().getInstanceFields();
      expect(fields.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_7100
     * @tc.name testConstructorGetOwner2P1Test071
     * @tc.desc Verify OT_ReflectWithMethods constructor getOwner getInstanceMethods length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OT_ReflectWithMethods>();
      let ctor = cls.getConstructors()[0];
      let methods = ctor.getOwner().getInstanceMethods();
      expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_7200
     * @tc.name testConstructorGetOwner2P1Test072
     * @tc.desc Verify EmptyCls constructor getParametersNum value unchanged after getOwner invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      let numBefore: int = ctor.getParametersNum();
      let owner = ctor.getOwner();
      expect(owner.getName().includes("EmptyCls")).assertTrue();
      let numAfter: int = ctor.getParametersNum();
      expect(numAfter).assertEqual(numBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_7300
     * @tc.name testConstructorGetOwner2P1Test073
     * @tc.desc Verify GO2_Ext_ConcreteGeneric concrete constructor getOwner isAbstract returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GO2_Ext_ConcreteGeneric>();
      let ctor = cls.getConstructors()[0];
      expect(ctor.getOwner().isAbstract()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_7400
     * @tc.name testConstructorGetOwner2P1Test074
     * @tc.desc Verify float param class EW_FloatParam (A2xB5xD1xE2) constructor getOwner getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EW_FloatParam>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("EW_FloatParam")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_7500
     * @tc.name testConstructorGetOwner2P1Test075
     * @tc.desc Verify byte param class EW_ByteParam (A2xB6xD1xE2) constructor getOwner getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EW_ByteParam>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("EW_ByteParam")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_7600
     * @tc.name testConstructorGetOwner2P1Test076
     * @tc.desc Verify short param class EW_ShortParam (A2xB7xD1xE2) constructor getOwner getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EW_ShortParam>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("EW_ShortParam")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_7700
     * @tc.name testConstructorGetOwner2P1Test077
     * @tc.desc Verify long param class EW_LongParam (A2xB8xD1xE2) constructor getOwner getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EW_LongParam>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("EW_LongParam")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_7800
     * @tc.name testConstructorGetOwner2P1Test078
     * @tc.desc Verify char param class EW_CharParam (A2xB9xD1xE2) constructor getOwner getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EW_CharParam>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("EW_CharParam")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_7900
     * @tc.name testConstructorGetOwner2P1Test079
     * @tc.desc Verify Object param class EW_ObjectParam (A2xB10xD1xE2) constructor getOwner getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EW_ObjectParam>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("EW_ObjectParam")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETOWNER_ExtP1_8000
     * @tc.name testConstructorGetOwner2P1Test080
     * @tc.desc Verify int param class EW_IntBoundary (A2xB1xD1xE2xC1) createInstance with min int via getOwner chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorGetOwner2P1Test080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EW_IntBoundary>();
      let ctor = cls.getConstructors()[0];
      let owner = ctor.getOwner();
      expect(owner.getName().includes("EW_IntBoundary")).assertTrue();
      let instance = owner.getConstructors()[0].createInstance([Int.MIN_VALUE]) as EW_IntBoundary;
      expect(instance.val).assertEqual(Int.MIN_VALUE);
    });

  });
}