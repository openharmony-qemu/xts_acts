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

abstract class AbstractClass012 {
  public static abstractMethod(): string { return 'abs'; }
}

final class FinalClass013 {
  public static finalMethod(): int { return 0; }
}

class ExplicitAClass {
  public static explicitA(): string { return 'x'; }
}

@interface deprecated {
  fromVersion: string
}

class FourMethodPubClass {
  public static m1(): string { return 'a'; }
  private static m2(): int { return 1; }
  protected static m3(): boolean { return true; }
  public static m4(): float { return 1.0; }
}

class CrossPubOwnerClass {
  public static ownerMethod(): string { return 'owner'; }
}

class CrossPubParamClass {
  public static withParam(a: int, b: string): string { return 'p'; }
}

class ParentPubMethodPublic {
  public static parentMethod(): string { return 'parent'; }
}

class ChildPubMethodPublic extends ParentPubMethodPublic {
}

class NestedPublicInner {
  public static nestedMethod(): string { return 'nested'; }
}

class FixedArrayReturnPublicClass {
  public static getArr(): Array<int> { return [1, 2, 3]; }
}

class ManyParamPublicClass {
  public static manyParams(a: int, b: int, c: int, d: int, e: int): string { return 'done'; }
}

class PublicGetterSetterPublicClass {
  private static _val: string = '';
  public static get val(): string { return PublicGetterSetterPublicClass._val; }
  public static set val(v: string) { PublicGetterSetterPublicClass._val = v; }
}

class PublicAsyncPubClass2 {
  public static async asyncMethod(): Promise<string> { return 'async'; }
}

class AllPublicMethodPublicClass {
  public static m1(): string { return 'a'; }
  public static m2(): int { return 1; }
  public static m3(): boolean { return true; }
}

class MixedModifierPublicClass {
  public static pub1(): string { return 'pub1'; }
  private static priv1(): string { return 'priv1'; }
  protected static prot1(): string { return 'prot1'; }
  public static pub2(): int { return 2; }
}

class ParentPublicChildPublicClass extends ParentPubMethodPublic {
  public static parentMethod(): string { return 'child'; }
}
class ParentPubMethodProt {
  public static parentMethod(): string { return 'parent'; }
}
class ProtectedToPublicClass extends ParentPubMethodProt {
  public static parentMethod(): string { return 'child public'; }
}
final class FinalPublicClass {
  public static finalPublic(): int { return 0; }
}
class TripleModifierClass {
  public static pub(): int { return 1; }
  public static asyncMethod(): Promise<string> { return Promise.resolve('async'); }
  public static getter(): string { return 'getter'; }
}
class SafeInvokeClass {
  public static greet(): string { return 'hello'; }
}
class FullAttrChainClass {
  public static calc(x: int): string { return x.toString(); }
}
class CallablePublicClass {
  public static $_invoke(): int { return 42; }
}
class GenericPublicClass<T> {
  public static genericMethod(): string { return 'generic'; }
}
export default function StaticMethodIsPublic2Test(): void {
  describe('StaticMethodIsPublic2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_0100
     * @tc.name testStaticMethodIsPublic2_001
     * @tc.desc Verify isPublic() combined with equals() returns true for two identical public static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossPubOwnerClass>();
      let m1 = cls.getStaticMethod('ownerMethod');
      let m2 = cls.getStaticMethod('ownerMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.isPublic()).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_0200
     * @tc.name testStaticMethodIsPublic2_002
     * @tc.desc Verify isPublic() combined with getOwner() returns the declaring class of a public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossPubOwnerClass>();
      let method = cls.getStaticMethod('ownerMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      let owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
      expect(owner.getName()).assertContain('CrossPubOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_0300
     * @tc.name testStaticMethodIsPublic2_003
     * @tc.desc Verify isPublic() combined with getParameterTypes() returns parameter type list for a public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossPubParamClass>();
      let method = cls.getStaticMethod('withParam');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('i32');
      expect(types[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_0400
     * @tc.name testStaticMethodIsPublic2_004
     * @tc.desc Verify isPublic() and equals() and getOwner() on a public static method of a final class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FinalClass013>();
      let m1 = cls.getStaticMethod('finalMethod');
      let m2 = cls.getStaticMethod('finalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m1!.isPublic()).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
      let owner = m1!.getOwner();
      expect(owner.getName()).assertContain('FinalClass013');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_0500
     * @tc.name testStaticMethodIsPublic2_005
     * @tc.desc Verify isPublic() and equals() and getOwner() on a public static method of an abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AbstractClass012>();
      let m1 = cls.getStaticMethod('abstractMethod');
      let m2 = cls.getStaticMethod('abstractMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m1!.isPublic()).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
      let owner = m1!.getOwner();
      expect(owner.getName()).assertContain('AbstractClass012');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_0600
     * @tc.name testStaticMethodIsPublic2_006
     * @tc.desc Verify isPublic() remains correct under extreme high-frequency polling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ExplicitAClass>();
      let method = cls.getStaticMethod('explicitA');
      expect(method !== undefined).assertTrue();
      for (let i: int = 0; i < 10000; i++) {
        expect(method!.isPublic()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_0700
     * @tc.name testStaticMethodIsPublic2_007
     * @tc.desc Verify inherited public static method is not exposed via child class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildPubMethodPublic>();
      let method = childCls.getStaticMethod('parentMethod');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_0800
     * @tc.name testStaticMethodIsPublic2_008
     * @tc.desc Verify isPublic() for public method in nested class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NestedPublicInner>();
      let method = cls.getStaticMethod('nestedMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_0900
     * @tc.name testStaticMethodIsPublic2_009
     * @tc.desc Verify isPublic() for public method returning FixedArray type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FixedArrayReturnPublicClass>();
      let method = cls.getStaticMethod('getArr');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_1000
     * @tc.name testStaticMethodIsPublic2_010
     * @tc.desc Verify isPublic() for public method with more than 5 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ManyParamPublicClass>();
      let method = cls.getStaticMethod('manyParams');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_1100
     * @tc.name testStaticMethodIsPublic2_011
     * @tc.desc Verify isPublic() combined with isGetter() on public getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PublicGetterSetterPublicClass>();
      let getter = cls.getStaticMethod('%%get-val');
      expect(getter !== undefined).assertTrue();
      expect(getter!.isPublic()).assertTrue();
      expect(getter!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_1200
     * @tc.name testStaticMethodIsPublic2_012
     * @tc.desc Verify isPublic() combined with isSetter() on public setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PublicGetterSetterPublicClass>();
      let setter = cls.getStaticMethod('%%set-val');
      expect(setter !== undefined).assertTrue();
      expect(setter!.isPublic()).assertTrue();
      expect(setter!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_1300
     * @tc.name testStaticMethodIsPublic2_013
     * @tc.desc Verify isPublic() combined with isAsync() on public async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PublicAsyncPubClass2>();
      let method = cls.getStaticMethod('asyncMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isAsync()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_1400
     * @tc.name testStaticMethodIsPublic2_014
     * @tc.desc Verify isPublic() counts public methods in getStaticMethods()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MixedModifierPublicClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let publicCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isPublic()) {
          publicCount++;
        }
      }
      expect(publicCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_1500
     * @tc.name testStaticMethodIsPublic2_015
     * @tc.desc Verify isPublic() count matches getStaticMethods length for all-public class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllPublicMethodPublicClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let publicCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isPublic()) {
          publicCount++;
        }
      }
      expect(publicCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_1600
     * @tc.name testStaticMethodIsPublic2_016
     * @tc.desc Verify all three access modifier checks on public method return correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FourMethodPubClass>();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_1700
     * @tc.name testStaticMethodIsPublic2_017
     * @tc.desc Verify parent public + child public same name, child reflects own method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ParentPublicChildPublicClass>();
      let method = childCls.getStaticMethod('parentMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_1800
     * @tc.name testStaticMethodIsPublic2_018
     * @tc.desc Verify parent protected + child public same name, child isPublic() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ProtectedToPublicClass>();
      let method = childCls.getStaticMethod('parentMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_1900
     * @tc.name testStaticMethodIsPublic2_019
     * @tc.desc Verify all public class getStaticMethods() all isPublic() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllPublicMethodPublicClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].isPublic()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_2000
     * @tc.name testStaticMethodIsPublic2_020
     * @tc.desc Verify isPublic() returns true for public method in final class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FinalPublicClass>();
      let method = cls.getStaticMethod('finalPublic');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_2100
     * @tc.name testStaticMethodIsPublic2_021
     * @tc.desc Verify isPublic() + isAsync() + isGetter() triple cross validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TripleModifierClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].isPublic()).assertTrue();
        expect(methods[i].isAsync()).assertFalse();
        expect(methods[i].isGetter()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_2200
     * @tc.name testStaticMethodIsPublic2_022
     * @tc.desc Verify isPublic() returns true for $_invoke callable method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CallablePublicClass>();
      let method = cls.getStaticMethod('$_invoke');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_2300
     * @tc.name testStaticMethodIsPublic2_023
     * @tc.desc Verify isPublic plus invoke cross API chain on public static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SafeInvokeClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      let result = method!.invoke([]);
      expect(result !== undefined).assertTrue();
      expect(result as string).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_2400
     * @tc.name testStaticMethodIsPublic2_024
     * @tc.desc Verify five property chain isPublic getName getOwner getReturnType getParametersNum on one public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FullAttrChainClass>();
      let method = cls.getStaticMethod('calc');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.getName()).assertEqual('calc');
      let owner = method!.getOwner();
      expect(owner.getName()).assertContain('FullAttrChainClass');
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('std.core.String');
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_PUBLIC_TWO_2500
     * @tc.name testStaticMethodIsPublic2_025
     * @tc.desc Verify isPublic returns true for public method in generic class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsPublic2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericPublicClass<Object>>();
      let method = cls.getStaticMethod('genericMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });
  });
}
