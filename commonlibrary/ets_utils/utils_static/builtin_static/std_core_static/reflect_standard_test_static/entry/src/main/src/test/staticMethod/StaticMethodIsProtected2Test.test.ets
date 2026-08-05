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

class ParentClass014 {
  protected static parentProtected(): string { return 'parent'; }
}

@interface deprecated {
  fromVersion: string
}

class CrossProtOwnerClass {
  public static ownerMethod(): string { return 'owner'; }
}

class ParentPubMethodProt {
  public static parentMethod(): string { return 'parent'; }
}

class ChildOverrideProtectedProt extends ParentPubMethodProt {
  protected static parentMethod(): string { return 'child protected'; }
}

class ManyProtectedMethodProtClass {
  protected static m1(): string { return '1'; }
  protected static m2(): int { return 2; }
  protected static m3(): boolean { return true; }
  protected static m4(): float { return 4.0; }
  protected static m5(): string { return '5'; }
  protected static m6(): int { return 6; }
  protected static m7(): boolean { return false; }
  protected static m8(): float { return 8.0; }
  protected static m9(): string { return '9'; }
  protected static m10(): int { return 10; }
}

class ProtectedGetterProtClass {
  private static _val: string = '';
  protected static get value(): string { return ProtectedGetterProtClass._val; }
}

class ProtectedSetterProtClass {
  private static _val: string = '';
  protected static set value(v: string) { ProtectedSetterProtClass._val = v; }
}

class NestedProtInner {
  protected static hidden(): string { return 'nested'; }
}

class AllProtectedMethodProtClass {
  protected static m1(): string { return 'a'; }
  protected static m2(): int { return 1; }
  protected static m3(): boolean { return true; }
}

class ProtectedWithFinalProtClass {
  protected static protectedFinal(): string { return 'final'; }
}

class ProtectedWithAsyncProtClass {
  protected static async protectedAsync(): Promise<string> { return 'async'; }
}

class ParentProtChildPubProtClass {
  protected static parentMethod(): string { return 'parent'; }
}

class ChildPubFromParentProt extends ParentProtChildPubProtClass {
  public static childMethod(): string { return 'child'; }
}

class ProtectedFixedArrayProtClass {
  protected static process(arr: Array<string>): string { return 'done'; }
}

class ParentProtChildPubProt extends ParentProtChildPubProtClass {
  public static parentMethod(): string { return 'child'; }
}
class ParentProtectedPrivChild {
  protected static parentMethod(): string { return 'parent'; }
}
class ChildPrivateFromParentProtected extends ParentProtectedPrivChild {
  private static parentMethod(): string { return 'child private'; }
}
class ParentProtProt {
  protected static method(): string { return 'parent'; }
}
class ChildProtProt extends ParentProtProt {
  protected static method(): string { return 'child'; }
}
class GrandParentProt2 {
  protected static method(): string { return 'grand'; }
}
class ParentProtProt2 extends GrandParentProt2 {
  protected static method(): string { return 'parent'; }
}
class ChildPubFromProtChain extends ParentProtProt2 {
  public static method(): string { return 'child'; }
}
class SixPropCheckClass {
  public static syncMethod(): string { return 'check'; }
}
class CallableNotProtectedClass {
  public static $_invoke(): int { return 42; }
}
class GenericProtectedClass<T> {
  protected static hidden(): string { return 'hidden'; }
}
export default function StaticMethodIsProtected2Test(): void {
  describe('StaticMethodIsProtected2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_0100
     * @tc.name testStaticMethodIsProtected2_001
     * @tc.desc Verify isProtected() combined with equals() returns true for two identical public static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossProtOwnerClass>();
      let m1 = cls.getStaticMethod('ownerMethod');
      let m2 = cls.getStaticMethod('ownerMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.isProtected()).assertFalse();
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_0200
     * @tc.name testStaticMethodIsProtected2_002
     * @tc.desc Verify isProtected() combined with getOwner() returns the declaring class of a public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossProtOwnerClass>();
      let method = cls.getStaticMethod('ownerMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isProtected()).assertFalse();
      let owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
      expect(owner.getName()).assertContain('CrossProtOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_0300
     * @tc.name testStaticMethodIsProtected2_003
     * @tc.desc Verify child class protected method shadows parent public method with same name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildOverrideProtectedProt>();
      let method = childCls.getStaticMethod('parentMethod');
      expect(method === undefined).assertTrue();
      let parentCls: Class = Class.from<ParentPubMethodProt>();
      let parentMethod = parentCls.getStaticMethod('parentMethod');
      expect(parentMethod !== undefined).assertTrue();
      expect(parentMethod!.isProtected()).assertFalse();
      expect(parentMethod!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_0400
     * @tc.name testStaticMethodIsProtected2_004
     * @tc.desc Verify protected static getter is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ProtectedGetterProtClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('%%get-value');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_0500
     * @tc.name testStaticMethodIsProtected2_005
     * @tc.desc Verify protected static setter is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ProtectedSetterProtClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('%%set-value');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_0600
     * @tc.name testStaticMethodIsProtected2_006
     * @tc.desc Verify protected static method in nested class is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NestedProtInner>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('hidden');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_0700
     * @tc.name testStaticMethodIsProtected2_007
     * @tc.desc Verify protected static method with FixedArray parameter is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ProtectedFixedArrayProtClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_0800
     * @tc.name testStaticMethodIsProtected2_008
     * @tc.desc Verify getStaticMethods() returns empty array when all methods are protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllProtectedMethodProtClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_0900
     * @tc.name testStaticMethodIsProtected2_009
     * @tc.desc Verify protected + final method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ProtectedWithFinalProtClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('protectedFinal');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_1000
     * @tc.name testStaticMethodIsProtected2_010
     * @tc.desc Verify protected + async method is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ProtectedWithAsyncProtClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('protectedAsync');
      expect(m === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_1100
     * @tc.name testStaticMethodIsProtected2_011
     * @tc.desc Verify child class public method does not expose parent protected method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildPubFromParentProt>();
      let method = childCls.getStaticMethod('parentMethod');
      expect(method === undefined).assertTrue();
      let parentCls: Class = Class.from<ParentProtChildPubProtClass>();
      let parentMethod = parentCls.getStaticMethod('parentMethod');
      expect(parentMethod === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_1200
     * @tc.name testStaticMethodIsProtected2_012
     * @tc.desc Verify isProtected() count from getStaticMethods() is zero for protected-only class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ManyProtectedMethodProtClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let protectedCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isProtected()) {
          protectedCount++;
        }
      }
      expect(protectedCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_1300
     * @tc.name testStaticMethodIsProtected2_013
     * @tc.desc Verify parent protected + child public same name, child can reflect its own method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ParentProtChildPubProt>();
      let method = childCls.getStaticMethod('parentMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isProtected()).assertFalse();
      let parentCls: Class = Class.from<ParentProtChildPubProtClass>();
      let parentMethod = parentCls.getStaticMethod('parentMethod');
      expect(parentMethod === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_1400
     * @tc.name testStaticMethodIsProtected2_014
     * @tc.desc Verify parent protected + child private same name, child cannot reflect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildPrivateFromParentProtected>();
      let method = childCls.getStaticMethod('parentMethod');
      expect(method === undefined).assertTrue();
      let parentCls: Class = Class.from<ParentProtectedPrivChild>();
      let parentMethod = parentCls.getStaticMethod('parentMethod');
      expect(parentMethod === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_1500
     * @tc.name testStaticMethodIsProtected2_015
     * @tc.desc Verify isProtected() returns false for protected getter (not accessible via reflection)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ProtectedGetterProtClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_1600
     * @tc.name testStaticMethodIsProtected2_016
     * @tc.desc Verify isProtected() returns false for $_invoke callable method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CallableNotProtectedClass>();
      let method = cls.getStaticMethod('$_invoke');
      expect(method !== undefined).assertTrue();
      expect(method!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_1700
     * @tc.name testStaticMethodIsProtected2_017
     * @tc.desc Verify parent protected child protected same name both invisible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls: Class = Class.from<ParentProtProt>();
      let childCls: Class = Class.from<ChildProtProt>();
      let parentMethod = parentCls.getStaticMethod('method');
      expect(parentMethod === undefined).assertTrue();
      let childMethod = childCls.getStaticMethod('method');
      expect(childMethod === undefined).assertTrue();
      let parentMtds: FixedArray<reflect.StaticMethod> = parentCls.getStaticMethods();
      expect(parentMtds.length).assertEqual(0);
      let childMtds: FixedArray<reflect.StaticMethod> = childCls.getStaticMethods();
      expect(childMtds.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_1800
     * @tc.name testStaticMethodIsProtected2_018
     * @tc.desc Verify three-layer chain grandparent protected parent protected child public child can reflect own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandCls: Class = Class.from<GrandParentProt2>();
      let parentCls: Class = Class.from<ParentProtProt2>();
      let childCls: Class = Class.from<ChildPubFromProtChain>();
      let grandMethod = grandCls.getStaticMethod('method');
      expect(grandMethod === undefined).assertTrue();
      let parentMethod = parentCls.getStaticMethod('method');
      expect(parentMethod === undefined).assertTrue();
      let childMethod = childCls.getStaticMethod('method');
      expect(childMethod !== undefined).assertTrue();
      expect(childMethod!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_1900
     * @tc.name testStaticMethodIsProtected2_019
     * @tc.desc Verify six properties on one public method isProtected false isPublic true isPrivate false isNative false isAsync false isGetter false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SixPropCheckClass>();
      let method = cls.getStaticMethod('syncMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isProtected()).assertFalse();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isPrivate()).assertFalse();
      expect(method!.isNative()).assertFalse();
      expect(method!.isAsync()).assertFalse();
      expect(method!.isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PROTECTED_TWO_2000
     * @tc.name testStaticMethodIsProtected2_020
     * @tc.desc Verify protected method in generic class is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsProtected2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericProtectedClass<Object>>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
      let m = cls.getStaticMethod('hidden');
      expect(m === undefined).assertTrue();
    });
  });
}
