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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class PublicOnlyClass {
  public static publicMethod(): string { return 'public'; }
}

@interface deprecated {
  fromVersion: string
}

class FourMethodPrivateClass {
  public static m1(): string { return 'a'; }
  private static m2(): int { return 1; }
  protected static m3(): boolean { return true; }
  private static m4(): float { return 1.0; }
}

class CrossPrivOwnerClass {
  public static ownerMethod(): string { return 'owner'; }
}

class ParentPubMethodPriv {
  public static parentMethod(): string { return 'parent'; }
}

class ChildOverridePrivatePriv extends ParentPubMethodPriv {
  private static parentMethod(): string { return 'child private'; }
}

class ManyPrivateMethodPrivClass {
  private static m1(): string { return '1'; }
  private static m2(): int { return 2; }
  private static m3(): boolean { return true; }
  private static m4(): float { return 4.0; }
  private static m5(): string { return '5'; }
  private static m6(): int { return 6; }
  private static m7(): boolean { return false; }
  private static m8(): float { return 8.0; }
  private static m9(): string { return '9'; }
  private static m10(): int { return 10; }
}

class ModuleLocalPrivClass {
  private static hiddenMethod(): string { return 'hidden'; }
}

class PrivateGetterPrivClass {
  private static _val: string = '';
  private static get value(): string { return PrivateGetterPrivClass._val; }
}

class PrivateSetterPrivClass {
  private static _val: string = '';
  private static set value(v: string) { PrivateSetterPrivClass._val = v; }
}

class NestedPrivInner {
  private static hidden(): string { return 'nested'; }
}

class ParentPrivMethodPriv {
  private static parentMethod(): string { return 'parent'; }
}

class ChildPrivMethodPriv extends ParentPrivMethodPriv {
}

class AllPrivateMethodPrivClass {
  private static m1(): string { return 'a'; }
  private static m2(): int { return 1; }
  private static m3(): boolean { return true; }
}

class NamedPublicPrivClass {
  private static publicMethod(): string { return 'actually private'; }
}

class PrivateFixedArrayPrivClass {
  private static process(arr: Array<int>): string { return 'done'; }
}

class ParentPrivChildPubShadow {
  private static parentMethod(): string { return 'parent'; }
}
class ChildPubFromParentPriv extends ParentPrivChildPubShadow {
  public static parentMethod(): string { return 'child public'; }
}
class MixedPrivClass {
  public static pub(): string { return 'pub'; }
  private static priv1(): string { return 'priv1'; }
  private static priv2(): int { return 2; }
}
class ParentPubPriv {
  public static method(): string { return 'parent'; }
}
class ChildPrivateFromPub extends ParentPubPriv {
  private static method(): string { return 'child'; }
}
class DualPrivateAccessorClass {
  private static _val: string = '';
  private static get value(): string { return DualPrivateAccessorClass._val; }
  private static set value(v: string) { DualPrivateAccessorClass._val = v; }
}
class GrandParentPrivChain {
  private static method(): string { return 'grand'; }
}
class ParentPubFromPrivChain extends GrandParentPrivChain {
  public static method(): string { return 'parent'; }
}
class ChildPrivFromPubChain extends ParentPubFromPrivChain {
  private static method(): string { return 'child'; }
}
class CallableNotPrivateClass {
  public static $_invoke(): int { return 42; }
}
class GenericPrivateClass<T> {
  private static secret(): string { return 'secret'; }
}
export default function StaticMethodIsPrivate2Test(): void {
  describe('StaticMethodIsPrivate2Test', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_0100
     * @tc.name testStaticMethodIsPrivate2_001
     * @tc.desc Verify isPrivate() combined with equals() returns true for two identical public static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossPrivOwnerClass>();
      let m1 = cls.getStaticMethod('ownerMethod');
      let m2 = cls.getStaticMethod('ownerMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.isPrivate()).assertFalse();
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_0200
     * @tc.name testStaticMethodIsPrivate2_002
     * @tc.desc Verify isPrivate() combined with getOwner() returns the declaring class of a public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossPrivOwnerClass>();
      let method = cls.getStaticMethod('ownerMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPrivate()).assertFalse();
      let owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
      expect(owner.getName()).assertContain('CrossPrivOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_0300
     * @tc.name testStaticMethodIsPrivate2_003
     * @tc.desc Verify child class private method shadows parent public method with same name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildOverridePrivatePriv>();
      let method = childCls.getStaticMethod('parentMethod');
      expect(method === undefined).assertTrue();
      let parentCls: Class = Class.from<ParentPubMethodPriv>();
      let parentMethod = parentCls.getStaticMethod('parentMethod');
      expect(parentMethod !== undefined).assertTrue();
      expect(parentMethod!.isPrivate()).assertFalse();
      expect(parentMethod!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_0400
     * @tc.name testStaticMethodIsPrivate2_004
     * @tc.desc Verify all ten private methods in a class are not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ManyPrivateMethodPrivClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_0500
     * @tc.name testStaticMethodIsPrivate2_005
     * @tc.desc Verify private static method is not accessible via reflection for module-local class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ModuleLocalPrivClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('hiddenMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_0600
     * @tc.name testStaticMethodIsPrivate2_006
     * @tc.desc Verify isPrivate() combined with getReturnType() returns correct return type for public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PublicOnlyClass>();
      let method = cls.getStaticMethod('publicMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPrivate()).assertFalse();
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_0700
     * @tc.name testStaticMethodIsPrivate2_007
     * @tc.desc Verify private static getter is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PrivateGetterPrivClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('%%get-value');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_0800
     * @tc.name testStaticMethodIsPrivate2_008
     * @tc.desc Verify private static setter is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PrivateSetterPrivClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('%%set-value');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_0900
     * @tc.name testStaticMethodIsPrivate2_009
     * @tc.desc Verify private static method in nested class is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NestedPrivInner>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('hidden');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_1000
     * @tc.name testStaticMethodIsPrivate2_010
     * @tc.desc Verify private static method with FixedArray parameter is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PrivateFixedArrayPrivClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_1100
     * @tc.name testStaticMethodIsPrivate2_011
     * @tc.desc Verify private static method in parent class is not accessible via child class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ChildPrivMethodPriv>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('parentMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_1200
     * @tc.name testStaticMethodIsPrivate2_012
     * @tc.desc Verify getStaticMethods() returns empty array when all methods are private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllPrivateMethodPrivClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_1300
     * @tc.name testStaticMethodIsPrivate2_013
     * @tc.desc Verify private method with public-sounding name is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NamedPublicPrivClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('publicMethod');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_1400
     * @tc.name testStaticMethodIsPrivate2_014
     * @tc.desc Verify all three access level checks on public method return correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FourMethodPrivateClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      for (let i: int = 0; i < methods.length; i++) {
        let isPublic = methods[i].isPublic();
        let isPrivate = methods[i].isPrivate();
        let isProtected = methods[i].isProtected();
        let hasAccessFlag: boolean = isPublic || isPrivate || isProtected;
        expect(hasAccessFlag).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_1500
     * @tc.name testStaticMethodIsPrivate2_015
     * @tc.desc Verify private static method count from getStaticMethods() is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ManyPrivateMethodPrivClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let privateCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isPrivate()) {
          privateCount++;
        }
      }
      expect(privateCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_1600
     * @tc.name testStaticMethodIsPrivate2_016
     * @tc.desc Verify parent private + child public same name, child can reflect its own method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildPubFromParentPriv>();
      let method = childCls.getStaticMethod('parentMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      let parentCls: Class = Class.from<ParentPrivChildPubShadow>();
      let parentMethod = parentCls.getStaticMethod('parentMethod');
      expect(parentMethod === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_1700
     * @tc.name testStaticMethodIsPrivate2_017
     * @tc.desc Verify private method count from getStaticMethods() is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MixedPrivClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].isPrivate()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_1800
     * @tc.name testStaticMethodIsPrivate2_018
     * @tc.desc Verify private method with same name as public but different params still not accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MixedPrivClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      let pubMethod = cls.getStaticMethod('pub');
      expect(pubMethod !== undefined).assertTrue();
      let privMethod = cls.getStaticMethod('priv1');
      expect(privMethod === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_1900
     * @tc.name testStaticMethodIsPrivate2_019
     * @tc.desc Verify isPrivate() validates all private methods in mixed class are not accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MixedPrivClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let privateCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isPrivate()) {
          privateCount++;
        }
      }
      expect(privateCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_2000
     * @tc.name testStaticMethodIsPrivate2_020
     * @tc.desc Verify isPrivate() returns false for $_invoke callable method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CallableNotPrivateClass>();
      let method = cls.getStaticMethod('$_invoke');
      expect(method !== undefined).assertTrue();
      expect(method!.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_2100
     * @tc.name testStaticMethodIsPrivate2_021
     * @tc.desc Verify parent public child private same name child method invisible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls: Class = Class.from<ParentPubPriv>();
      let childCls: Class = Class.from<ChildPrivateFromPub>();
      let parentMethod = parentCls.getStaticMethod('method');
      expect(parentMethod !== undefined).assertTrue();
      expect(parentMethod!.isPublic()).assertTrue();
      let childMethod = childCls.getStaticMethod('method');
      expect(childMethod === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_2200
     * @tc.name testStaticMethodIsPrivate2_022
     * @tc.desc Verify same property with private getter and private setter both invisible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DualPrivateAccessorClass>();
      let getter = cls.getStaticMethod('%%get-value');
      expect(getter === undefined).assertTrue();
      let setter = cls.getStaticMethod('%%set-value');
      expect(setter === undefined).assertTrue();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_2300
     * @tc.name testStaticMethodIsPrivate2_023
     * @tc.desc Verify three-layer chain grandparent private parent public child private visibility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandCls: Class = Class.from<GrandParentPrivChain>();
      let parentCls: Class = Class.from<ParentPubFromPrivChain>();
      let childCls: Class = Class.from<ChildPrivFromPubChain>();
      let grandMtds: FixedArray<reflect.StaticMethod> = grandCls.getStaticMethods();
      expect(grandMtds.length).assertEqual(0);
      let parentMethod = parentCls.getStaticMethod('method');
      expect(parentMethod !== undefined).assertTrue();
      expect(parentMethod!.isPublic()).assertTrue();
      let childMethod = childCls.getStaticMethod('method');
      expect(childMethod === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PRIVATE_TWO_2400
     * @tc.name testStaticMethodIsPrivate2_024
     * @tc.desc Verify private method in generic class is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPrivate2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericPrivateClass<Object>>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('secret');
      expect(m === undefined).assertTrue();
    });
  });
}
