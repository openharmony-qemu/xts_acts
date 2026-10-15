'use static';

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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

class GetOwnerArityA001 {
  public static name: string = 'test';
}

class GetOwnerArityB002 {
  public static count: int = 0;
}

class GetOwnerArityC003 {
  public static count: int = 42;
}


class OwnerDirectF009 {
  public static value: int = 99;
}

class OwnerParentB011 {
  public static title: string = 'parentTitle';
}




class OwnerParentK020 {
  public static fieldA: int = 1;
  public static fieldB: string = 'b';
}




class OwnerGrandG027 {
  public static g: int = 1;
}



class OwnerModD036 {
  public static pub: int = 1;
  public static priv: int = 2;
}





class OwnerSelfRef045 {
  public static instance: OwnerSelfRef045 = new OwnerSelfRef045();
  public value: int = 0;
}

class OwnerNameC048 {
  public static $special: int = 0;
}


class OwnerCrossA051 {
  public static name: string = 'classA';
}

class OwnerCrossB052 {
  public static name: string = 'classB';
}

class OwnerCrossC053 {
  public static value: int = 1;
}

class OwnerCrossD054 {
  public static value: int = 2;
}

class OwnerInvariantB061 {
  public static data: int = 0;
}

class OwnerInvariantC062 {
  public static label: string = 'before';
}

class OwnerVsTypeB065 {
  public static num: int = 42;
}

class OwnerVsTypeC066 {
  public static text: string = 'hello';
}



class OwnerVsNameA070 {
  public static myField: int = 0;
}

class OwnerVsNameB071 {
  public static OwnerVsNameB071: int = 0;
}


class OwnerErrA075 {
  public static exists: int = 0;
}






class OwnerEdgeB092 {
  public static nanVal: double = Double.NaN;
}

class OwnerEdgeC093 {
  public static infVal: double = Double.POSITIVE_INFINITY;
}

class OwnerEdgeD094 {
  public static negZero: double = -0.0;
}



class OwnerChildB extends OwnerParentB011 {
  public static title: string = 'childTitle';
}







class OwnerChildK extends OwnerParentK020 {
  public static fieldA: int = 999;
}







class OwnerParentG016G extends OwnerGrandG027 {
  public static p: int = 2;
}

class OwnerChildGG extends OwnerParentG016G {
  public static c: int = 3;
}











class OwnerGenericA<T> {
  public static count: int = 0;
}



export default function staticFieldGetOwnerTest2(): void {
  describe('StaticFieldGetOwnerTest2', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_0100
     * @tc.name testStaticFieldGetOwnerAtTwo001
     * @tc.desc Verify getOwner returns non-null owner with full class name for GetOwnerArityA001.name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetOwnerArityA001>();
      let field = cls.getStaticField('name');
      let owner = field!.getOwner();
      expect(owner!.getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.GetOwnerArityA001',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_0200
     * @tc.name testStaticFieldGetOwnerAtTwo002
     * @tc.desc Verify getOwner called 3 times returns non-null for GetOwnerArityB002.count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetOwnerArityB002>();
      let field = cls.getStaticField('count');
      let owner1 = field!.getOwner();
      let owner2 = field!.getOwner();
      let owner3 = field!.getOwner();
      expect(owner1!.getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.GetOwnerArityB002',
      );
      expect(owner2!.getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.GetOwnerArityB002',
      );
      expect(owner3!.getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.GetOwnerArityB002',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_0300
     * @tc.name testStaticFieldGetOwnerAtTwo003
     * @tc.desc Verify getOwner does not change isReadonly state for GetOwnerArityC003.count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetOwnerArityC003>();
      let field = cls.getStaticField('count');
      let readonlyBefore = field!.isReadonly();
      field!.getOwner();
      let readonlyAfter = field!.isReadonly();
      expect(readonlyBefore).assertEqual(readonlyAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_0400
     * @tc.name testStaticFieldGetOwnerAtTwo004
     * @tc.desc Verify getOwner().getName() chained returns full class name for GetOwnerArityB002.count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetOwnerArityB002>();
      let field = cls.getStaticField('count');
      expect(field!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.GetOwnerArityB002',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_0500
     * @tc.name testStaticFieldGetOwnerAtTwo005
     * @tc.desc Verify two getOwner() calls on same field return same owner name for OwnerDirectF009.value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerDirectF009>();
      let field = cls.getStaticField('value');
      let owner1 = field!.getOwner();
      let owner2 = field!.getOwner();
      expect(owner1.getName()).assertEqual(owner2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_0600
     * @tc.name testStaticFieldGetOwnerAtTwo006
     * @tc.desc Verify getOwner().getName() returns full class name for OwnerChildB.title
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerChildB>();
      let field = cls.getStaticField('title');
      let ownerName = field!.getOwner().getName();
      expect(ownerName).assertEqual('entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerChildB');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_0700
     * @tc.name testStaticFieldGetOwnerAtTwo007
     * @tc.desc Verify getOwner for OwnerChildK.fieldA and OwnerParentK020.fieldB return different class names
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerChildK>();
      let fieldA = cls.getStaticField('fieldA');
      let parentCls = Class.from<OwnerParentK020>();
      let fieldB = parentCls.getStaticField('fieldB');
      expect(fieldA!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerChildK',
      );
      expect(fieldB!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerParentK020',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_0800
     * @tc.name testStaticFieldGetOwnerAtTwo008
     * @tc.desc Verify getOwner for fields g (OwnerGrandG027), p (OwnerParentG016G), c (OwnerChildGG) in inheritance chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsG = Class.from<OwnerGrandG027>();
      let clsP = Class.from<OwnerParentG016G>();
      let clsC = Class.from<OwnerChildGG>();
      expect(clsG.getStaticField('g')!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerGrandG027',
      );
      expect(clsP.getStaticField('p')!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerParentG016G',
      );
      expect(clsC.getStaticField('c')!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerChildGG',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_0900
     * @tc.name testStaticFieldGetOwnerAtTwo009
     * @tc.desc Verify getOwner().getName() returns same class name for OwnerModD036.pub and OwnerModD036.priv fields
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerModD036>();
      let pubField = cls.getStaticField('pub');
      let privField = cls.getStaticField('priv');
      expect(pubField!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerModD036',
      );
      expect(privField!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerModD036',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_1000
     * @tc.name testStaticFieldGetOwnerAtTwo010
     * @tc.desc Verify getOwner().getName() returns full class name for OwnerNameC048.$special (dollar-sign field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerNameC048>();
      let field = cls.getStaticField('$special');
      expect(field!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerNameC048',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_1100
     * @tc.name testStaticFieldGetOwnerAtTwo011
     * @tc.desc Verify getOwner for same field name 'name' in OwnerCrossA051 and OwnerCrossB052 returns different class names
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<OwnerCrossA051>();
      let clsB = Class.from<OwnerCrossB052>();
      let fieldA = clsA.getStaticField('name');
      let fieldB = clsB.getStaticField('name');
      expect(fieldA!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerCrossA051',
      );
      expect(fieldB!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerCrossB052',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_1200
     * @tc.name testStaticFieldGetOwnerAtTwo012
     * @tc.desc Verify getOwner names differ for same-named field value across OwnerCrossC053 and OwnerCrossD054
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsC = Class.from<OwnerCrossC053>();
      let clsD = Class.from<OwnerCrossD054>();
      let fieldC = clsC.getStaticField('value');
      let fieldD = clsD.getStaticField('value');
      let nameC: string = fieldC!.getOwner().getName();
      let nameD: string = fieldD!.getOwner().getName();
      expect(nameC).assertEqual('entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerCrossC053');
      expect(nameD).assertEqual('entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerCrossD054');
      expect(nameC).not().assertEqual(nameD);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_1300
     * @tc.name testStaticFieldGetOwnerAtTwo013
     * @tc.desc Verify getOwner result consistent after setValue for GetOwnerArityB002.count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetOwnerArityB002>();
      let field = cls.getStaticField('count');
      let ownerBefore = field!.getOwner();
      field!.setValue(999);
      let ownerAfter = field!.getOwner();
      expect(ownerBefore.getName()).assertEqual(ownerAfter.getName());
      expect(ownerAfter.getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.GetOwnerArityB002',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_1400
     * @tc.name testStaticFieldGetOwnerAtTwo014
     * @tc.desc Verify getOwner result consistent across multiple setValue calls for OwnerInvariantB061.data
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerInvariantB061>();
      let field = cls.getStaticField('data');
      let owner1 = field!.getOwner();
      field!.setValue(1);
      let owner2 = field!.getOwner();
      field!.setValue(2);
      let owner3 = field!.getOwner();
      field!.setValue(3);
      let owner4 = field!.getOwner();
      expect(owner1.getName()).assertEqual(owner2.getName());
      expect(owner2.getName()).assertEqual(owner3.getName());
      expect(owner3.getName()).assertEqual(owner4.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_1500
     * @tc.name testStaticFieldGetOwnerAtTwo015
     * @tc.desc Verify getOwner().getName() consistent before and after setValue('after') on OwnerInvariantC062.label
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerInvariantC062>();
      let field = cls.getStaticField('label');
      let nameBefore = field!.getOwner().getName();
      field!.setValue('after');
      let nameAfter = field!.getOwner().getName();
      expect(nameBefore).assertEqual(nameAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_1600
     * @tc.name testStaticFieldGetOwnerAtTwo016
     * @tc.desc Verify getOwner().getName() and getType().getName() return different values for GetOwnerArityB002.count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetOwnerArityB002>();
      let field = cls.getStaticField('count');
      let owner = field!.getOwner();
      let fieldType = field!.getType();
      expect(owner.getName()).not().assertEqual(fieldType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_1700
     * @tc.name testStaticFieldGetOwnerAtTwo017
     * @tc.desc Verify getOwner().getName() returns class name and getType().getName() returns 'i32' for OwnerVsTypeB065.num
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerVsTypeB065>();
      let field = cls.getStaticField('num');
      expect(field!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerVsTypeB065',
      );
      expect(field!.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_1800
     * @tc.name testStaticFieldGetOwnerAtTwo018
     * @tc.desc Verify getOwner().getName() returns class name and getType().getName() returns 'std.core.String' for OwnerVsTypeC066.text
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerVsTypeC066>();
      let field = cls.getStaticField('text');
      expect(field!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerVsTypeC066',
      );
      expect(field!.getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_1900
     * @tc.name testStaticFieldGetOwnerAtTwo019
     * @tc.desc Verify getName returns "myField" and getOwner returns full class name for OwnerVsNameA070.myField
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerVsNameA070>();
      let field = cls.getStaticField('myField');
      expect(field!.getName()).assertEqual('myField');
      expect(field!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerVsNameA070',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_2000
     * @tc.name testStaticFieldGetOwnerAtTwo020
     * @tc.desc Verify getName returns "OwnerVsNameB071" and getOwner returns full class name for self-named field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerVsNameB071>();
      let field = cls.getStaticField('OwnerVsNameB071');
      let fieldName = field!.getName();
      let ownerName = field!.getOwner().getName();
      expect(fieldName).assertEqual('OwnerVsNameB071');
      expect(ownerName).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerVsNameB071',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_2100
     * @tc.name testStaticFieldGetOwnerAtTwo021
     * @tc.desc Verify getStaticField on non-existent field "nonexistent" of OwnerErrA075 returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerErrA075>();
      let field = cls.getStaticField('nonexistent');
      expect(field).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_2200
     * @tc.name testStaticFieldGetOwnerAtTwo022
     * @tc.desc Verify getOwner().getName() returns OwnerGenericA for generic class OwnerGenericA<int>.count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerGenericA<int>>();
      let field = cls.getStaticField('count');
      expect(field!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerGenericA',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_2300
     * @tc.name testStaticFieldGetOwnerAtTwo023
     * @tc.desc Verify getOwner().getName() returns OwnerEdgeB092 for Double.NaN field (OwnerEdgeB092.nanVal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerEdgeB092>();
      let field = cls.getStaticField('nanVal');
      expect(field!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerEdgeB092',
      );
      let v: double = field!.getValue() as double;
      expect(isNaN(v)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_2400
     * @tc.name testStaticFieldGetOwnerAtTwo024
     * @tc.desc Verify getOwner().getName() returns OwnerEdgeC093 for Double.POSITIVE_INFINITY field (OwnerEdgeC093.infVal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerEdgeC093>();
      let field = cls.getStaticField('infVal');
      expect(field!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerEdgeC093',
      );
      let v: double = field!.getValue() as double;
      expect(v).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_TWO_2500
     * @tc.name testStaticFieldGetOwnerAtTwo025
     * @tc.desc Verify getOwner().getName() returns OwnerEdgeD094 for field 'negZero'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetOwnerAtTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerEdgeD094>();
      let field = cls.getStaticField('negZero');
      expect(field!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetOwnerTest2.test.OwnerEdgeD094',
      );
      let v: double = field!.getValue() as double;
      expect(1 / v).assertEqual(Double.NEGATIVE_INFINITY);
    });
  });
}
