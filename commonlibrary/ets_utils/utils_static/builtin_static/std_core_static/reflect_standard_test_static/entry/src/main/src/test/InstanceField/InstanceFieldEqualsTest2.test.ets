'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

class MyClass001 {
  public name: string = 'test';
}

class MyClass004 {
  public name: string = 'test';
  public age: int = 25;
}

class OtherClass006 {
  public name: string = 'other';
}

class GrandParent024 {
  public rootField: string = 'root';
}

class MidParent024 extends GrandParent024 {
  public midField: string = 'mid';
}

class LeafChild024 extends MidParent024 {
  public leafField: string = 'leaf';
}

class MultiFieldClass025 {
  public a: string = 'a';
  public b: string = 'b';
  public c: string = 'c';
}

interface ITest026 {
  ifield: string;
}

class ImplTest026 implements ITest026 {
  public ifield: string = 'iface';
}

class SetValueEqualsTest027 {
  public value: int = 0;
}

class DiffTypeFields028 {
  public intField: int = 0;
  public strField: string = '';
}

class ParentEquals029 {
  public sharedName: string = 'parent';
}

class ChildEquals029 extends ParentEquals029 {
  public childField: string = 'child';
}

class PrimitiveFieldsClass030 {
  public byteField: byte = 0;
  public shortField: short = 0;
  public intField: int = 0;
  public longField: long = 0;
  public floatField: float = 0.0f;
  public doubleField: double = 0.0;
  public charField: char = c'A';
  public boolField: boolean = false;
}

class StringFieldClass031 {
  public strField: string = 'hello';
}

class ArrayFieldClass032 {
  public arrField: Array<int> = [];
}

class SiblingA033 {
  public siblingField: string = 'siblingA';
}

class SiblingB033 {
  public siblingField: string = 'siblingB';
}

class GrandParent034 {
  public rootName: string = 'root';
}

class MidParent034 extends GrandParent034 {
  public midName: string = 'mid';
}

class LeafChild034 extends MidParent034 {
  public leafName: string = 'leaf';
}

class ReadonlyField035 {
  public readonly data: string = 'readonly';
}

final class FinalField036 {
  public finalVal: string = 'final';
}

class AbstractField037 {
  public abstractData: string = 'abstract';
}

class SetValueEq038 {
  public value: int = 0;
}

class TenFieldClass039 {
  public f0: int = 0;
  public f1: int = 1;
  public f2: int = 2;
  public f3: int = 3;
  public f4: int = 4;
  public f5: int = 5;
  public f6: int = 6;
  public f7: int = 7;
  public f8: int = 8;
  public f9: int = 9;
}

class EqDeepA_060 {
  public a: string = "a"
}

class EqDeepB_060 extends EqDeepA_060 {
  public b: string = "b"
}

class EqDeepC_060 extends EqDeepB_060 {
  public c: string = "c"
}

class EqDeepD_060 extends EqDeepC_060 {
  public d: string = "d"
}

class EqDeepE_060 extends EqDeepD_060 {
  public e: string = "e"
}

class EqShadowBase_061 {
  public shared: string = "base";
  public baseTag: string = "btag"
}

class EqShadowDerived_061 extends EqShadowBase_061 {
  public shared: string = "derived";
  public childTag: string = "ctag"
}

class EqOfVsFrom_062 {
  public val: int = 0
}

class EqOfAny_063 {
  public key: string = "k"
}

class EqFixedArr_064 {
  public fa: FixedArray<int> = new FixedArray<int>(3)
}

interface EqIfaceX_065 { xfield: string }

interface EqIfaceY_065 { yfield: string }

class EqMultiIface_065 implements EqIfaceX_065, EqIfaceY_065 {
  public xfield: string = "x";
  public yfield: string = "y"
}

class CurrentEquals_070 {
  public val: int = 0;

  public getClass(): Class {
    return Class.current();
  }
}

class DoubleInitEq_070 {
  public val: int = 0
}

class EqChainBase_071 {
  public bv: string = 'b'
}

class EqChainMid_071 extends EqChainBase_071 {
  public mv: string = 'm'
}

class EqChainLeaf_071 extends EqChainMid_071 {
  public lv: string = 'l'
}

interface EqAbsIface_072 { ifv: string }

abstract class EqAbsBase_072 implements EqAbsIface_072 {
  public baseVal: int = 0;
  public ifv: string = 'eqAbs'
}

class EqAbsConcrete_072 extends EqAbsBase_072 {
  public concVal: int = 0
}

interface EqIFA_073 { sharedField: string }

interface EqIFB_073 { sharedField: string }

class EqMultiShared_073 implements EqIFA_073, EqIFB_073 {
  public sharedField: string = 's';
  public uniqueField: string = 'u'
}

class EqFixedArr2_074 {
  public fa2: FixedArray<string> = new FixedArray<string>(2)
}

interface EIFBase_075 { baseField: string }

interface EIFDerived_075 extends EIFBase_075 { derivedField: string }

class EImplChain_075 implements EIFDerived_075 {
  public baseField: string = 'b';
  public derivedField: string = 'd'
}

abstract class EAbsBase_076 {
  public abVal: int = 0
}

abstract class EAbsDerived_076 extends EAbsBase_076 {
  public adVal: int = 0
}

class EConcAbs_076 extends EAbsDerived_076 {
  public cVal: int = 0
}

class EBigint_077 {
  public bv: bigint = 0n
}

interface EIX_078 { x: string }

interface EIY_078 { y: string }

interface EIZ_078 { z: string }

class ETriple_078 implements EIX_078, EIY_078, EIZ_078 {
  public x: string = 'x';
  public y: string = 'y';
  public z: string = 'z'
}

class ECrossSrc_079 {
  public val: int = 0
}

class EUnrelA_080 {
  public name: string = 'a'
}

class EUnrelB_080 {
  public name: string = 'b'
}

class EqReadonly_081 {
  public readonly roVal: int = 100
}

class EqCustomType_083 {
  public v: int = 0
}

class EqHasCustom_083 {
  public obj: EqCustomType_083 = new EqCustomType_083()
}

class EqMapIS_084 {
  public mis: Map<int, string> = new Map<int, string>()
}

class EqIntStr_085 {
  public intField: int = 0;
  public strField: string = ''
}

class EqStaticField_086 {
  public static sVal: int = 0;
  public iVal: int = 0
}

class EqTransitive_087 {
  public val: int = 0
}

class EqBoolField_088 {
  public flag: boolean = true
}

class EqPairwise_089 {
  public a: int = 0;
  public b: int = 0;
  public c: int = 0
}

class EParentStatic_090 {
  public static psVal: int = 0
}

class EChildStatic_090 extends EParentStatic_090 {
  public cVal: int = 0
}

enum EqEnum_091 { ONE, TWO }

class EEnumField_091 {
  public kind: EqEnum_091 = EqEnum_091.ONE;
  public val: int = 0
}
class EMultiStatic_092 {
  public static a: int = 0;
  public static b: int = 0;
  public static c: int = 0
}

class EHop1_093 {
  public f1: int = 0
}

class EHop2_093 extends EHop1_093 {
  public f2: int = 0
}

class EHop3_093 extends EHop2_093 {
  public f3: int = 0
}

export default function InstanceFieldEqualsTest2(): void {
  describe('InstanceFieldEqualsTest2', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0010
     * @tc.name testEquals0010
     * @tc.desc Verify equals between fields retrieved from getInstanceFields array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFieldClass025>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(3);
      for (let i = 0; i < fields.length; i++) {
        let byName = cls.getInstanceField(fields[i].getName())!;
        expect(byName.equals(fields[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0020
     * @tc.name testEquals0020
     * @tc.desc Verify equals on fields from deep inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leafCls = Class.from<LeafChild024>();
      let leafField = leafCls.getInstanceField('leafField')!;
      let midCls = leafCls.getSuper()!;
      let midField = midCls.getInstanceField('midField')!;
      let grandCls = midCls.getSuper()!;
      let grandField = grandCls.getInstanceField('rootField')!;
      expect(leafField.equals(midField)).assertFalse();
      expect(midField.equals(grandField)).assertFalse();
      expect(leafField.equals(grandField)).assertFalse();
      let leafField2 = leafCls.getInstanceField('leafField')!;
      let midField2 = midCls.getInstanceField('midField')!;
      let grandField2 = grandCls.getInstanceField('rootField')!;
      expect(leafField.equals(leafField2)).assertTrue();
      expect(midField.equals(midField2)).assertTrue();
      expect(grandField.equals(grandField2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0030
     * @tc.name testEquals0030
     * @tc.desc Verify equals consistency over 500 iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField("name")!;
      let field2 = cls.getInstanceField("name")!;
      for (let i = 0; i < 500; i++) {
        expect(field1.equals(field2)).assertTrue();
        expect(field2.equals(field1)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0040
     * @tc.name testEquals0040
     * @tc.desc Verify equals false between different name fields from same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        for (let j = 0; j < fields.length; j++) {
          if (i !== j) {
            expect(fields[i].equals(fields[j])).assertFalse();
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0050
     * @tc.name testEquals0050
     * @tc.desc Verify equals between getInstanceField and getInstanceFields array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFieldClass025>();
      let fieldByName = cls.getInstanceField('a')!;
      let fields = cls.getInstanceFields();
      let fieldFromArray = fields[0];
      expect(fieldByName.equals(fieldFromArray)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0060
     * @tc.name testEquals0060
     * @tc.desc Verify equals still works after class initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      cls.initialize();
      let field1 = cls.getInstanceField("name")!;
      let field2 = cls.getInstanceField("name")!;
      expect(field1.equals(field2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0070
     * @tc.name testEquals0070
     * @tc.desc Verify equals consistency before and after cls.initialize()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField("name")!;
      let field2 = cls.getInstanceField("name")!;
      let resultBefore: boolean = field1.equals(field2);
      cls.initialize();
      let resultAfter: boolean = field1.equals(field2);
      expect(resultBefore).assertEqual(resultAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0080
     * @tc.name testEquals0080
     * @tc.desc Verify nested loop cross-validation of all field pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFieldClass025>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        for (let j = 0; j < fields.length; j++) {
          let result: boolean = fields[i].equals(fields[j]);
          if (i === j) {
            expect(result).assertTrue();
          } else {
            expect(result).assertFalse();
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0090
     * @tc.name testEquals0090
     * @tc.desc Verify equals on fields from interface-implementing class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplTest026>();
      let field1 = cls.getInstanceField('ifield')!;
      let field2 = cls.getInstanceField('ifield')!;
      expect(field1.equals(field2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0100
     * @tc.name testEquals0100
     * @tc.desc Verify equals with getName getType getOwner cross-check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      expect(f1.equals(f2)).assertTrue();
      expect(f1.getName()).assertEqual(f2.getName());
      expect(f1.getType().getName()).assertEqual(f2.getType().getName());
      expect(f1.getOwner().getName()).assertEqual(f2.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0110
     * @tc.name testEquals0110
     * @tc.desc Verify equals between Class.from and Class.of obtained fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFrom = Class.from<MyClass001>();
      let fieldFrom = clsFrom.getInstanceField('name')!;
      let obj = new MyClass001();
      let clsOf = Class.of(obj);
      let fieldOf = clsOf.getInstanceField('name')!;
      expect(fieldFrom.equals(fieldOf)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0120
     * @tc.name testEquals0120
     * @tc.desc Verify equals between fields from same name in parent and child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentEquals029>();
      let childCls = Class.from<ChildEquals029>();
      let parentField = parentCls.getInstanceField('sharedName')!;
      let parentViaChild = childCls.getSuper()!.getInstanceField('sharedName')!;
      expect(parentField.equals(parentViaChild)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0130
     * @tc.name testEquals0130
     * @tc.desc Verify equals unchanged after setValue on instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetValueEqualsTest027>();
      let instance = cls.createInstance();
      let field1 = cls.getInstanceField('value')!;
      let field2 = cls.getInstanceField('value')!;
      let resultBefore: boolean = field1.equals(field2);
      field1.setValue(instance, 999);
      let resultAfter: boolean = field1.equals(field2);
      expect(resultAfter).assertEqual(resultBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0140
     * @tc.name testEquals0140
     * @tc.desc Verify equals reflexivity across multiple getInstanceField calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      for (let i = 0; i < 10; i++) {
        expect(f1.equals(f2)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0150
     * @tc.name testEquals0150
     * @tc.desc Verify equals between int and string type fields returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DiffTypeFields028>();
      let intField = cls.getInstanceField('intField')!;
      let strField = cls.getInstanceField('strField')!;
      expect(intField.equals(strField)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0160
     * @tc.name testEquals0160
     * @tc.desc Verify int fields from same class equal each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('intField')!;
      let f2 = cls.getInstanceField('intField')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0170
     * @tc.name testEquals0170
     * @tc.desc Verify boolean fields from same class equal each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('boolField')!;
      let f2 = cls.getInstanceField('boolField')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0180
     * @tc.name testEquals0180
     * @tc.desc Verify float fields from same class equal each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('floatField')!;
      let f2 = cls.getInstanceField('floatField')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0190
     * @tc.name testEquals0190
     * @tc.desc Verify double fields from same class equal each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('doubleField')!;
      let f2 = cls.getInstanceField('doubleField')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0200
     * @tc.name testEquals0200
     * @tc.desc Verify byte fields from same class equal each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('byteField')!;
      let f2 = cls.getInstanceField('byteField')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0210
     * @tc.name testEquals0210
     * @tc.desc Verify short fields from same class equal each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('shortField')!;
      let f2 = cls.getInstanceField('shortField')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0220
     * @tc.name testEquals0220
     * @tc.desc Verify long fields from same class equal each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('longField')!;
      let f2 = cls.getInstanceField('longField')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0230
     * @tc.name testEquals0230
     * @tc.desc Verify char fields from same class equal each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('charField')!;
      let f2 = cls.getInstanceField('charField')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0240
     * @tc.name testEquals0240
     * @tc.desc Verify cross-type equals int vs string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('intField')!;
      let strCls = Class.from<StringFieldClass031>();
      let f2 = strCls.getInstanceField('strField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0250
     * @tc.name testEquals0250
     * @tc.desc Verify cross-type equals byte vs short returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('byteField')!;
      let f2 = cls.getInstanceField('shortField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0260
     * @tc.name testEquals0260
     * @tc.desc Verify sibling classes with same name field equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<SiblingA033>();
      let clsB = Class.from<SiblingB033>();
      let fA = clsA.getInstanceField('siblingField')!;
      let fB = clsB.getInstanceField('siblingField')!;
      expect(fA.equals(fB)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0270
     * @tc.name testEquals0270
     * @tc.desc Verify 3-level inheritance chain fields cross-equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leafCls = Class.from<LeafChild034>();
      let fLeaf = leafCls.getInstanceField('leafName')!;
      let midCls = leafCls.getSuper()!;
      let fMid = midCls.getInstanceField('midName')!;
      let grandCls = midCls.getSuper()!;
      let fRoot = grandCls.getInstanceField('rootName')!;
      expect(fLeaf.equals(fMid)).assertFalse();
      expect(fMid.equals(fRoot)).assertFalse();
      expect(fLeaf.equals(fRoot)).assertFalse();
      let fLeaf2 = leafCls.getInstanceField('leafName')!;
      let fMid2 = midCls.getInstanceField('midName')!;
      let fRoot2 = grandCls.getInstanceField('rootName')!;
      expect(fLeaf.equals(fLeaf2)).assertTrue();
      expect(fMid.equals(fMid2)).assertTrue();
      expect(fRoot.equals(fRoot2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0280
     * @tc.name testEquals0280
     * @tc.desc Verify same instance field reflexive equality returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField('name')!;
      let field2 = cls.getInstanceField('name')!;
      expect(field1.equals(field2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0290
     * @tc.name testEquals0290
     * @tc.desc Verify equals on all primitive type fields in a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        let byName = cls.getInstanceField(fields[i].getName())!;
        expect(byName.equals(fields[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0300
     * @tc.name testEquals0300
     * @tc.desc Verify equals on array type fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayFieldClass032>();
      let f1 = cls.getInstanceField('arrField')!;
      let f2 = cls.getInstanceField('arrField')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0310
     * @tc.name testEquals0310
     * @tc.desc Verify equals consistency after setValue on instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SetValueEq038>();
      let instance = cls.createInstance();
      let f1 = cls.getInstanceField('value')!;
      let f2 = cls.getInstanceField('value')!;
      let before: boolean = f1.equals(f2);
      f1.setValue(instance, 999);
      let after: boolean = f1.equals(f2);
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0320
     * @tc.name testEquals0320
     * @tc.desc Verify equals consistency after getValue call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let instance = cls.createInstance();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      let before: boolean = f1.equals(f2);
      f1.getValue(instance);
      let after: boolean = f1.equals(f2);
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0330
     * @tc.name testEquals0330
     * @tc.desc Verify equals consistency after getName call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      let before: boolean = f1.equals(f2);
      f1.getName();
      let after: boolean = f1.equals(f2);
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0340
     * @tc.name testEquals0340
     * @tc.desc Verify equals consistency after getType call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      let before: boolean = f1.equals(f2);
      f1.getType().getName();
      let after: boolean = f1.equals(f2);
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0350
     * @tc.name testEquals0350
     * @tc.desc Verify equals consistency after getOwner call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      let before: boolean = f1.equals(f2);
      f1.getOwner().getName();
      let after: boolean = f1.equals(f2);
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0360
     * @tc.name testEquals0360
     * @tc.desc Verify equals on readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyField035>();
      let f1 = cls.getInstanceField('data')!;
      let f2 = cls.getInstanceField('data')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0370
     * @tc.name testEquals0370
     * @tc.desc Verify equals on final class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalField036>();
      let f1 = cls.getInstanceField('finalVal')!;
      let f2 = cls.getInstanceField('finalVal')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0380
     * @tc.name testEquals0380
     * @tc.desc Verify equals on abstract class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractField037>();
      let f1 = cls.getInstanceField('abstractData')!;
      let f2 = cls.getInstanceField('abstractData')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0390
     * @tc.name testEquals0390
     * @tc.desc Verify 10-field class all self-equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TenFieldClass039>();
      let fields = cls.getInstanceFields();
      expect(fields.length).assertEqual(10);
      for (let i = 0; i < fields.length; i++) {
        let byName = cls.getInstanceField(fields[i].getName())!;
        expect(byName.equals(fields[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0400
     * @tc.name testEquals0400
     * @tc.desc Verify equals consistency over 1000 repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      for (let i = 0; i < 1000; i++) {
        expect(f1.equals(f2)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0410
     * @tc.name testEquals0410
     * @tc.desc Verify equals between getInstanceField and getInstanceFields[i] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TenFieldClass039>();
      let f0 = cls.getInstanceField('f0')!;
      let fields = cls.getInstanceFields();
      expect(f0.equals(fields[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0420
     * @tc.name testEquals0420
     * @tc.desc Verify equals on self via getInstanceField and getInstanceFields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TenFieldClass039>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        let byName = cls.getInstanceField('f' + i)!;
        expect(byName.equals(fields[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0430
     * @tc.name testEquals0430
     * @tc.desc Verify equals on fields from getInstanceFields vs getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TenFieldClass039>();
      let fields = cls.getInstanceFields();
      let byName = cls.getInstanceField('f5')!;
      expect(byName.equals(fields[5])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0440
     * @tc.name testEquals0440
     * @tc.desc Verify equals on all fields self via iterate 3 ways
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TenFieldClass039>();
      for (let i = 0; i < 10; i++) {
        let f1 = cls.getInstanceField('f' + i)!;
        let f2 = cls.getInstanceField('f' + i)!;
        expect(f1.equals(f2)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0450
     * @tc.name testEquals0450
     * @tc.desc Verify equals on int vs boolean fields returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('intField')!;
      let f2 = cls.getInstanceField('boolField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0460
     * @tc.name testEquals0460
     * @tc.desc Verify equals on float vs double fields returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('floatField')!;
      let f2 = cls.getInstanceField('doubleField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0470
     * @tc.name testEquals0470
     * @tc.desc Verify equals on byte vs char fields returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('byteField')!;
      let f2 = cls.getInstanceField('charField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0480
     * @tc.name testEquals0480
     * @tc.desc Verify equals on long vs double fields returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('longField')!;
      let f2 = cls.getInstanceField('doubleField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0490
     * @tc.name testEquals0490
     * @tc.desc Verify equals self-reflexivity on multi-level inherited fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leaf = Class.from<LeafChild034>();
      let fLeaf = leaf.getInstanceField('leafName')!;
      let mid = leaf.getSuper()!;
      let fMid = mid.getInstanceField('midName')!;
      let grand = mid.getSuper()!;
      let fRoot = grand.getInstanceField('rootName')!;
      let fLeaf2 = leaf.getInstanceField('leafName')!;
      let fMid2 = mid.getInstanceField('midName')!;
      let fRoot2 = grand.getInstanceField('rootName')!;
      expect(fLeaf.equals(fLeaf2)).assertTrue();
      expect(fMid.equals(fMid2)).assertTrue();
      expect(fRoot.equals(fRoot2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0500
     * @tc.name testEquals0500
     * @tc.desc Verify equals result type is always boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let f1 = cls.getInstanceField('name')!;
      let f1b = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('age')!;
      expect(f1.equals(f1b)).assertTrue();
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0510
     * @tc.name testEquals0510
     * @tc.desc Verify equals cross-type on all 8 primitive fields all false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        for (let j = 0; j < fields.length; j++) {
          if (i !== j) {
            expect(fields[i].equals(fields[j])).assertFalse();
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0520
     * @tc.name testEquals0520
     * @tc.desc Verify equals on same field from different getInstanceField calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      let f3 = cls.getInstanceField('name')!;
      expect(f1.equals(f2)).assertTrue();
      expect(f2.equals(f3)).assertTrue();
      expect(f1.equals(f3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0530
     * @tc.name testEquals0530
     * @tc.desc Verify equals on field after createInstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      cls.createInstance();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0540
     * @tc.name testEquals0540
     * @tc.desc Verify equals symmetric property across 8 types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        for (let j = 0; j < fields.length; j++) {
          expect(fields[i].equals(fields[j])).assertEqual(fields[j].equals(fields[i]));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0550
     * @tc.name testEquals0550
     * @tc.desc Verify equals on same field returned from getInstanceField array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        let byName = cls.getInstanceField(fields[i].getName())!;
        expect(byName.equals(fields[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0560
     * @tc.name testEquals0560
     * @tc.desc Verify equals on fields from same class repeat getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      for (let i = 0; i < 20; i++) {
        let f1 = cls.getInstanceField('name')!;
        let f2 = cls.getInstanceField('name')!;
        expect(f1.equals(f2)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0570
     * @tc.name testEquals0570
     * @tc.desc Verify equals on byte vs long fields returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('byteField')!;
      let f2 = cls.getInstanceField('longField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0580
     * @tc.name testEquals0580
     * @tc.desc Verify equals on short vs int fields returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('shortField')!;
      let f2 = cls.getInstanceField('intField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0590
     * @tc.name testEquals0590
     * @tc.desc Verify equals on char vs int fields returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('charField')!;
      let f2 = cls.getInstanceField('intField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0600
     * @tc.name testEquals0600
     * @tc.desc Verify equals on bool vs char fields returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('boolField')!;
      let f2 = cls.getInstanceField('charField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0610
     * @tc.name testEquals0610
     * @tc.desc Verify equals on float vs int fields returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('floatField')!;
      let f2 = cls.getInstanceField('intField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0620
     * @tc.name testEquals0620
     * @tc.desc Verify equals on double vs long fields returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let f1 = cls.getInstanceField('doubleField')!;
      let f2 = cls.getInstanceField('longField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0630
     * @tc.name testEquals0630
     * @tc.desc Verify equals 8x8 matrix cross-type all combos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        for (let j = 0; j < fields.length; j++) {
          let result = fields[i].equals(fields[j]);
          if (i === j) {
            expect(result).assertTrue();
          } else {
            expect(result).assertFalse();
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0640
     * @tc.name testEquals0640
     * @tc.desc Verify equals on interface-implementing class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ImplTest026>();
      let f1 = cls.getInstanceField('ifield')!;
      let f2 = cls.getInstanceField('ifield')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0650
     * @tc.name testEquals0650
     * @tc.desc Verify equals on 10 fields class cross-different all false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TenFieldClass039>();
      let fields = cls.getInstanceFields();
      let diffCount: int = 0;
      for (let i = 0; i < fields.length; i++) {
        for (let j = 0; j < fields.length; j++) {
          if (i !== j && !fields[i].equals(fields[j])) {
            diffCount++;
          }
        }
      }
      expect(diffCount).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0660
     * @tc.name testEquals0660
     * @tc.desc Verify equals on same name field different class string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = Class.from<MyClass001>();
      let c2 = Class.from<OtherClass006>();
      let f1 = c1.getInstanceField('name')!;
      let f2 = c2.getInstanceField('name')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0670
     * @tc.name testEquals0670
     * @tc.desc Verify equals on field after multiple getType calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      let before: boolean = f1.equals(f2);
      for (let i = 0; i < 10; i++) {
        f1.getType().getName();
      }
      let after: boolean = f1.equals(f2);
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0680
     * @tc.name testEquals0680
     * @tc.desc Verify equals on field after multiple getOwner calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      let before: boolean = f1.equals(f2);
      for (let i = 0; i < 10; i++) {
        f1.getOwner().getName();
      }
      let after: boolean = f1.equals(f2);
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0690
     * @tc.name testEquals0690
     * @tc.desc Verify equals on field after multiple getName calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      let before: boolean = f1.equals(f2);
      for (let i = 0; i < 10; i++) {
        f1.getName();
      }
      let after: boolean = f1.equals(f2);
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0700
     * @tc.name testEquals0700
     * @tc.desc Verify equals on two different named fields same class false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('age')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0710
     * @tc.name testEquals0710
     * @tc.desc Verify equals on 3 fields class each self-equal and cross false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFieldClass025>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          if (i === j) {
            expect(fields[i].equals(fields[j])).assertTrue();
          } else {
            expect(fields[i].equals(fields[j])).assertFalse();
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0720
     * @tc.name testEquals0720
     * @tc.desc Verify equals from getInstanceField by name matches getInstanceFields[i]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFieldClass025>();
      let fields = cls.getInstanceFields();
      let a = cls.getInstanceField('a')!;
      let b = cls.getInstanceField('b')!;
      let c = cls.getInstanceField('c')!;
      expect(a.equals(fields[0])).assertTrue();
      expect(b.equals(fields[1])).assertTrue();
      expect(c.equals(fields[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0730
     * @tc.name testEquals0730
     * @tc.desc Verify equals on array vs primitive field returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = Class.from<ArrayFieldClass032>();
      let c2 = Class.from<PrimitiveFieldsClass030>();
      let f1 = c1.getInstanceField('arrField')!;
      let f2 = c2.getInstanceField('intField')!;
      expect(f1.equals(f2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0740
     * @tc.name testEquals0740
     * @tc.desc Verify equals transitivity on 5 field instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let f1 = cls.getInstanceField('name')!;
      let f2 = cls.getInstanceField('name')!;
      let f3 = cls.getInstanceField('name')!;
      let f4 = cls.getInstanceField('name')!;
      let f5 = cls.getInstanceField('name')!;
      expect(f1.equals(f2)).assertTrue();
      expect(f2.equals(f3)).assertTrue();
      expect(f3.equals(f4)).assertTrue();
      expect(f4.equals(f5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0750
     * @tc.name testEquals0750
     * @tc.desc Verify equals symmetry on same field via getInstanceField and getInstanceFields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrimitiveFieldsClass030>();
      let byName = cls.getInstanceField('intField')!;
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].getName() === 'intField') {
          expect(byName.equals(fields[i])).assertTrue();
          expect(fields[i].equals(byName)).assertTrue();
          break;
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0760
     * @tc.name testEquals0760
     * @tc.desc Verify equals on parent vs grandparent fields both different from child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leafCls = Class.from<LeafChild034>();
      let midCls = leafCls.getSuper()!;
      let grandCls = midCls.getSuper()!;
      let midField = midCls.getInstanceField('midName')!;
      let grandField = grandCls.getInstanceField('rootName')!;
      expect(midField.equals(grandField)).assertFalse();
      let midField2 = midCls.getInstanceField('midName')!;
      let grandField2 = grandCls.getInstanceField('rootName')!;
      expect(midField.equals(midField2)).assertTrue();
      expect(grandField.equals(grandField2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0770
     * @tc.name testEquals0770
     * @tc.desc Verify equals between Class.from and Class.of sourced fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFrom = Class.from<EqOfVsFrom_062>();
      let obj = new EqOfVsFrom_062();
      let clsOf = Class.of(obj);
      let fFrom = clsFrom.getInstanceField('val')!;
      let fOf = clsOf.getInstanceField('val')!;
      expect(fFrom.equals(fOf)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0780
     * @tc.name testEquals0780
     * @tc.desc Verify equals on 5-level deep inheritance chain fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = Class.from<EqDeepE_060>();
      let ef = e.getInstanceField('e')!;
      let ef2 = e.getInstanceField('e')!;
      expect(ef.equals(ef2)).assertTrue();
      let d = e.getSuper()!;
      let df = d.getInstanceField('d')!;
      let df2 = d.getInstanceField('d')!;
      expect(df.equals(df2)).assertTrue();
      expect(ef.equals(df)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0790
     * @tc.name testEquals0790
     * @tc.desc Verify equals on shadowed fields parent vs child are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = Class.from<EqShadowDerived_061>();
      let parent = child.getSuper()!;
      let cf = child.getInstanceField('childTag')!;
      let pf = parent.getInstanceField('baseTag')!;
      expect(cf.equals(pf)).assertFalse();
      let cf2 = child.getInstanceField('childTag')!;
      expect(cf.equals(cf2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0800
     * @tc.name testEquals0800
     * @tc.desc Verify equals consistency via Class.ofAny sourced field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFrom = Class.from<EqOfAny_063>();
      let obj = new EqOfAny_063();
      let clsOfAny = Class.ofAny(obj)!;
      let f1 = clsFrom.getInstanceField('key')!;
      let f2 = clsOfAny.getInstanceField('key')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0810
     * @tc.name testEquals0810
     * @tc.desc Verify equals on FixedArray typed fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EqFixedArr_064>();
      let f1 = cls.getInstanceField('fa')!;
      let f2 = cls.getInstanceField('fa')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0820
     * @tc.name testEquals0820
     * @tc.desc Verify equals on multi-interface class fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EqMultiIface_065>();
      let fx1 = cls.getInstanceField('xfield')!;
      let fx2 = cls.getInstanceField('xfield')!;
      let fy = cls.getInstanceField('yfield')!;
      expect(fx1.equals(fx2)).assertTrue();
      expect(fx1.equals(fy)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0830
     * @tc.name testEquals0830
     * @tc.desc Verify equals still true after Class.initialize on both sides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EqOfVsFrom_062>();
      let f1 = cls.getInstanceField('val')!;
      cls.initialize();
      let f2 = cls.getInstanceField('val')!;
      expect(f1.equals(f2)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0840
     * @tc.name testEquals0840
     * @tc.desc Verify equals between Class.current and Class.from sourced fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new CurrentEquals_070();
      let clsCur = obj.getClass();
      let clsFrom = Class.from<CurrentEquals_070>();
      let fCur = clsCur.getInstanceField('val')!;
      let fFrom = clsFrom.getInstanceField('val')!;
      expect(fCur.equals(fFrom)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0850
     * @tc.name testEquals0850
     * @tc.desc Verify equals consistency after double Class.initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleInitEq_070>();
      let f1 = cls.getInstanceField('val')!;
      cls.initialize();
      cls.initialize();
      let f2 = cls.getInstanceField('val')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0860
     * @tc.name testEquals0860
     * @tc.desc Verify equals between direct field and same field via getSuper chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leaf = Class.from<EqChainLeaf_071>();
      let mid = leaf.getSuper()!;
      let fDirect = mid.getInstanceField('mv')!;
      let fChain = leaf.getSuper()!.getInstanceField('mv')!;
      expect(fDirect.equals(fChain)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0870
     * @tc.name testEquals0870
     * @tc.desc Verify equals between abstract+interface class fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let concrete = Class.from<EqAbsConcrete_072>();
      let abs = concrete.getSuper()!;
      let f1 = abs.getInstanceField('baseVal')!;
      let f2 = abs.getInstanceField('baseVal')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0880
     * @tc.name testEquals0880
     * @tc.desc Verify equals self-true on interface-implemented field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let concrete = Class.from<EqAbsConcrete_072>();
      let abs = concrete.getSuper()!;
      let f1 = abs.getInstanceField('ifv')!;
      let f2 = abs.getInstanceField('ifv')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0890
     * @tc.name testEquals0890
     * @tc.desc Verify equals on multi-interface shared field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EqMultiShared_073>();
      let f1 = cls.getInstanceField('sharedField')!;
      let f2 = cls.getInstanceField('sharedField')!;
      expect(f1.equals(f2)).assertTrue();
      let f3 = cls.getInstanceField('uniqueField')!;
      expect(f1.equals(f3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0900
     * @tc.name testEquals0900
     * @tc.desc Verify equals self-true on FixedArray<string> typed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EqFixedArr2_074>();
      let f1 = cls.getInstanceField('fa2')!;
      let f2 = cls.getInstanceField('fa2')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0910
     * @tc.name testEquals0910
     * @tc.desc Verify equals on interface-extends-interface hierarchy fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EImplChain_075>();
      let f1 = cls.getInstanceField('baseField')!;
      let f2 = cls.getInstanceField('baseField')!;
      expect(f1.equals(f2)).assertTrue();
      let f3 = cls.getInstanceField('derivedField')!;
      expect(f1.equals(f3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0920
     * @tc.name testEquals0920
     * @tc.desc Verify equals on abstract-extends-abstract hierarchy fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let conc = Class.from<EConcAbs_076>();
      let ad = conc.getSuper()!;
      let ab = ad.getSuper()!;
      let f1 = ab.getInstanceField('abVal')!;
      let f2 = ab.getInstanceField('abVal')!;
      expect(f1.equals(f2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0930
     * @tc.name testEquals0930
     * @tc.desc Verify equals on bigint typed field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EBigint_077>();
      let f1 = cls.getInstanceField('bv')!;
      let f2 = cls.getInstanceField('bv')!;
      expect(f1.equals(f2)).assertTrue();
    });
