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

class ConsistentNameClass {
  public static getValue(): int {
    return 42;
  }
}

class SameNameClass {
  public static process(name: string): string {
    return name.toUpperCase();
  }
}

class GenericGetNameClass<T> {
  public static identify(): string {
    return 'generic';
  }
}

class MultiMethodGetNameClass {
  public static alpha(): int { return 100; }
  public static beta(): string { return 'beta'; }
  public static gamma(): boolean { return false; }
}

class GrandParentGetNameClass {
  public static greet(msg: string): string {
    return 'Hello ' + msg;
  }
}

class ParentGetNameClass extends GrandParentGetNameClass {
  public static parentOnly(): int {
    return 1;
  }
}

class ChildGetNameClass extends ParentGetNameClass {
  public static greet(msg: string): string {
    return 'Hi ' + msg;
  }
}

class SpecialCharNameClass {
  public static method_with_underscore(): int {
    return 1;
  }
  public static methodWithCamelCase(): int {
    return 2;
  }
}

class MethodOverloadClass {
  public static processInt(value: int): int {
    return value;
  }
  public static processString(value: string): string {
    return value;
  }
}

class CrossGetNameOwnerClass {
  public static getValue(): int {
    return 42;
  }
  public static process(): string {
    return 'done';
  }
}

class CrossGetNameReturnClass {
  public static compute(x: int): string {
    return x.toString();
  }
  public static merge(a: string, b: int): boolean {
    return a.length > b;
  }
}

class CrossGetNameParamClass {
  public static handle(value: int): string {
    return value.toString();
  }
  public static process(a: string, b: boolean): int {
    return a.length;
  }
}

class L4GrandParentNameClass {
  public static greet(msg: string): string {
    return 'L4 Hello ' + msg;
  }
}

class L4ParentNameClass extends L4GrandParentNameClass {
  public static greet(msg: string): string {
    return 'L4 Hi ' + msg;
  }
}

class L4ChildNameClass extends L4ParentNameClass {
  public static greet(msg: string): string {
    return 'L4 Hey ' + msg;
  }
}

class L4GrandChildNameClass extends L4ChildNameClass {
  public static greet(msg: string): string {
    return 'L4 Yo ' + msg;
  }
}

class L5BaseNameClass {
  public static baseMethod(): int {
    return 0;
  }
}

class L5D1NameClass extends L5BaseNameClass {
  public static d1Method(): string {
    return 'd1';
  }
}

class L5D2NameClass extends L5D1NameClass {
  public static d2Method(): boolean {
    return true;
  }
}

class L5D3NameClass extends L5D2NameClass {
  public static d3Method(): int {
    return 3;
  }
}

class L5D4NameClass extends L5D3NameClass {
  public static d4Method(): string {
    return 'd4';
  }
}

class HeavyOverloadNameClass {
  public static processVoid(): void {}
  public static processInt(x: int): int {
    return x;
  }
  public static processIntString(x: int, y: string): string {
    return y;
  }
  public static processIntStringBool(x: int, y: string, z: boolean): boolean {
    return z;
  }
  public static processString(x: string): string {
    return x;
  }
  public static processStringInt(x: string, y: int): boolean {
    return x.length > y;
  }
}

class AllReturnTypeNameClass {
  public static getInt(): int {
    return 1;
  }
  public static getStr(): string {
    return 's';
  }
  public static getBool(): boolean {
    return true;
  }
  public static getVoid(): void {}
}

class SpecialNamingNameClass {
  public static method123(): int {
    return 123;
  }
  public static ALL_CAPS(): string {
    return 'CAPS';
  }
  public static camelCase123(): boolean {
    return true;
  }
}

class NoStaticMethodNameClass {
  public instanceMethod(): int {
    return 1;
  }
}

class TripleCrossNameClass {
  public static execute(cmd: string, flag: boolean): int {
    return cmd.length;
  }
}

enum IntEnum: int { A = 0, B = 1, C = 2 }
enum StringEnum: string { SA = "hello", SB = "world" }

class NumericParamNameClass {
  public static methodByte(x: byte): void {}
  public static methodShort(x: short): void {}
  public static methodInt(x: int): void {}
  public static methodLong(x: long): void {}
  public static methodFloat(x: float): void {}
  public static methodDouble(x: double): void {}
}

class NumericReturnNameClass {
  public static methodByte(): byte { return 0; }
  public static methodShort(): short { return 0; }
  public static methodIntX(): int { return 0; }
  public static methodLong(): long { return 0; }
  public static methodFloat(): float { return 0; }
  public static methodDouble(): double { return 0.0; }
}

class FixedArrayNameClass {
  public static faIntParam(x: FixedArray<int>): void {}
  public static faStringParam(x: FixedArray<string>): void {}
  public static faReturnInt(): FixedArray<int> { return new FixedArray<int>(0, 0); }
}

class EnumMethodNameClass {
  public static paramIntEnum(e: IntEnum): void {}
  public static paramStringEnum(e: StringEnum): void {}
  public static returnIntEnum(): IntEnum { return IntEnum.A; }
}

class ModifierNameClass {
  public static overrideMethod(): void {}
  public static protectedMethod(): void {}
}

class FinalMethodNameClass {
  public static methodA(): void {}
  public static methodB(x: int): int { return x; }
}

class SpecialNameClass {
  public static specialGet(index: int): int { return index; }
  public static specialSet(index: int, value: int): void {}
  public static specialInvoke(a: int, b: int): int { return a + b; }
}

class InterfaceImplNameClass {
  public static interfaceMethod(): string { return "class"; }
  public static classOnlyMethod(x: int): boolean { return true; }
}

class GenericClassNameClass<T> {
  public static methodString(x: string): string { return x; }
  public static methodIntBool(x: int, y: boolean): string { return ""; }
}

class LongNameClass {
  public static a_very_long_method_name_that_exceeds_typical_length_limits_to_test_that_getName_handles_long_identifiers_properly_in_the_runtime_system(x: int): int { return x; }
}

class UnicodeNameClass {
  public static 中文方法名(x: string): string { return x; }
}

export default function StaticMethodGetName2Test(): void {
  describe('StaticMethodGetName2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_0100
     * @tc.name testStaticMethodGetName2_001
     * @tc.desc Verify getName() returns same method name from different Class.from() instances of same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<SameNameClass>();
      let cls2 = Class.from<SameNameClass>();
      let method1 = cls1.getStaticMethod('process');
      let method2 = cls2.getStaticMethod('process');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getName()).assertEqual('process');
      expect(method2!.getName()).assertEqual('process');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_0200
     * @tc.name testStaticMethodGetName2_002
     * @tc.desc Verify getName() returns same method name from different generic type parameter instantiations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsInt = Class.from<GenericGetNameClass<int>>();
      let clsStr = Class.from<GenericGetNameClass<string>>();
      let methodInt = clsInt.getStaticMethod('identify');
      let methodStr = clsStr.getStaticMethod('identify');
      expect(methodInt !== undefined).assertTrue();
      expect(methodStr !== undefined).assertTrue();
      expect(methodInt!.getName()).assertEqual('identify');
      expect(methodStr!.getName()).assertEqual('identify');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_0300
     * @tc.name testStaticMethodGetName2_003
     * @tc.desc Verify getStaticMethod result's getName() matches corresponding entry in getStaticMethods array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiMethodGetNameClass>();
      let method = cls.getStaticMethod('beta');
      expect(method !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      let found: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'beta') {
          expect(method!.getName()).assertEqual(methods[i].getName());
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_0400
     * @tc.name testStaticMethodGetName2_004
     * @tc.desc Verify getName() in inheritance where child class hides parent static method with same name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandParentCls = Class.from<GrandParentGetNameClass>();
      let childCls = Class.from<ChildGetNameClass>();
      let grandParentGreet = grandParentCls.getStaticMethod('greet');
      let childGreet = childCls.getStaticMethod('greet');
      expect(grandParentGreet !== undefined).assertTrue();
      expect(childGreet !== undefined).assertTrue();
      expect(grandParentGreet!.getName()).assertEqual('greet');
      expect(childGreet!.getName()).assertEqual('greet');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_0500
     * @tc.name testStaticMethodGetName2_005
     * @tc.desc Verify getStaticMethod with non-existent method name returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentNameClass>();
      let method = cls.getStaticMethod('nonExistentMethod');
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_0600
     * @tc.name testStaticMethodGetName2_006
     * @tc.desc Verify getName() for method with underscore in name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialCharNameClass>();
      let method1 = cls.getStaticMethod('method_with_underscore');
      let method2 = cls.getStaticMethod('methodWithCamelCase');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getName()).assertEqual('method_with_underscore');
      expect(method2!.getName()).assertEqual('methodWithCamelCase');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_0700
     * @tc.name testStaticMethodGetName2_007
     * @tc.desc Verify getName() for overloaded methods returns correct method names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MethodOverloadClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      expect(methods[0].getName()).assertEqual('processInt');
      expect(methods[1].getName()).assertEqual('processString');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_0800
     * @tc.name testStaticMethodGetName2_008
     * @tc.desc Verify getName() for method with different return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiMethodGetNameClass>();
      let alpha = cls.getStaticMethod('alpha');
      let beta = cls.getStaticMethod('beta');
      let gamma = cls.getStaticMethod('gamma');
      expect(alpha !== undefined).assertTrue();
      expect(beta !== undefined).assertTrue();
      expect(gamma !== undefined).assertTrue();
      expect(alpha!.getName()).assertEqual('alpha');
      expect(beta!.getName()).assertEqual('beta');
      expect(gamma!.getName()).assertEqual('gamma');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_0900
     * @tc.name testStaticMethodGetName2_009
     * @tc.desc Verify getName() and getOwner() cross-consistency for single method: getName returns 'getValue' and owner class name contains CrossGetNameOwnerClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossGetNameOwnerClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      let name: string = method!.getName();
      let owner: Class = method!.getOwner();
      expect(name).assertEqual('getValue');
      expect(owner.getName().indexOf('CrossGetNameOwnerClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_1000
     * @tc.name testStaticMethodGetName2_010
     * @tc.desc Verify getName() and getOwner() cross-consistency: two classes both have 'process' method, getName same 'process', getOwner differs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<CrossGetNameOwnerClass>();
      let clsB = Class.from<SameNameClass>();
      let methodA = clsA.getStaticMethod('process');
      let methodB = clsB.getStaticMethod('process');
      expect(methodA !== undefined).assertTrue();
      expect(methodB !== undefined).assertTrue();
      expect(methodA!.getName()).assertEqual('process');
      expect(methodB!.getName()).assertEqual('process');
      let ownerA: string = methodA!.getOwner().getName();
      let ownerB: string = methodB!.getOwner().getName();
      expect(ownerA === ownerB).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_1100
     * @tc.name testStaticMethodGetName2_011
     * @tc.desc Verify getName() and getReturnType() cross-consistency: compute method has name 'compute' and return type 'std.core.String'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossGetNameReturnClass>();
      let method = cls.getStaticMethod('compute');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('compute');
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_1200
     * @tc.name testStaticMethodGetName2_012
     * @tc.desc Verify getName() and getReturnType() cross-consistency: merge method has name 'merge' and different param count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossGetNameReturnClass>();
      let method = cls.getStaticMethod('merge');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('merge');
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_1300
     * @tc.name testStaticMethodGetName2_013
     * @tc.desc Verify getName() and getParametersNum() cross-consistency: handle method has 1 param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossGetNameParamClass>();
      let method = cls.getStaticMethod('handle');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('handle');
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_1400
     * @tc.name testStaticMethodGetName2_014
     * @tc.desc Verify getName() and getParameterType() cross-consistency: handle method first param type is 'i32' (int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossGetNameParamClass>();
      let method = cls.getStaticMethod('handle');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('handle');
      expect(method!.getParameterType(0)!.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_1500
     * @tc.name testStaticMethodGetName2_015
     * @tc.desc Verify getName() and getParameterTypes() cross-consistency: process method has 2 params with correct types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossGetNameParamClass>();
      let method = cls.getStaticMethod('process');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('process');
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('std.core.String');
      expect(types[1].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_1600
     * @tc.name testStaticMethodGetName2_016
     * @tc.desc Verify getName() and equals() cross-consistency: same method from different Class.from() instances equals true and getName same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<CrossGetNameReturnClass>();
      let cls2 = Class.from<CrossGetNameReturnClass>();
      let method1 = cls1.getStaticMethod('compute');
      let method2 = cls2.getStaticMethod('compute');
      expect(method1 !== undefined).assertTrue();
      expect(method2 !== undefined).assertTrue();
      expect(method1!.getName()).assertEqual('compute');
      expect(method2!.getName()).assertEqual('compute');
      expect(method1!.equals(method2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_1700
     * @tc.name testStaticMethodGetName2_017
     * @tc.desc Verify getName() and equals() cross-consistency: different methods from same class have different names and equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossGetNameOwnerClass>();
      let methodGet = cls.getStaticMethod('getValue');
      let methodProc = cls.getStaticMethod('process');
      expect(methodGet !== undefined).assertTrue();
      expect(methodProc !== undefined).assertTrue();
      expect(methodGet!.getName()).assertEqual('getValue');
      expect(methodProc!.getName()).assertEqual('process');
      expect(methodGet!.equals(methodProc!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_1800
     * @tc.name testStaticMethodGetName2_018
     * @tc.desc Verify getName() with getParametersNum() and getParameterTypes() triple cross: execute method name 'execute', 2 params, types string and boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleCrossNameClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('execute');
      expect(method!.getParametersNum()).assertEqual(2);
      let types: FixedArray<Class> = method!.getParameterTypes();
      expect(types.length).assertEqual(2);
      expect(types[0].getName()).assertEqual('std.core.String');
      expect(types[1].getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_1900
     * @tc.name testStaticMethodGetName2_019
     * @tc.desc Verify getName() with getOwner() and getReturnType() triple cross: execute method has name 'execute', owner contains TripleCrossNameClass, return type 'i32'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TripleCrossNameClass>();
      let method = cls.getStaticMethod('execute');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('execute');
      expect(method!.getOwner().getName().indexOf('TripleCrossNameClass') >= 0).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_2000
     * @tc.name testStaticMethodGetName2_020
     * @tc.desc Verify getName() for method returning int: getInt name is 'getInt'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllReturnTypeNameClass>();
      let method = cls.getStaticMethod('getInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('getInt');
      expect(method!.getReturnType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_2100
     * @tc.name testStaticMethodGetName2_021
     * @tc.desc Verify getName() for method returning string: getStr name is 'getStr'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllReturnTypeNameClass>();
      let method = cls.getStaticMethod('getStr');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('getStr');
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_2200
     * @tc.name testStaticMethodGetName2_022
     * @tc.desc Verify getName() for method returning boolean: getBool name is 'getBool'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllReturnTypeNameClass>();
      let method = cls.getStaticMethod('getBool');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('getBool');
      expect(method!.getReturnType().getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_2300
     * @tc.name testStaticMethodGetName2_023
     * @tc.desc Verify getName() for method returning void: getVoid name is 'getVoid'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllReturnTypeNameClass>();
      let method = cls.getStaticMethod('getVoid');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('getVoid');
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_2400
     * @tc.name testStaticMethodGetName2_024
     * @tc.desc Verify getName() for 4-layer hiding chain: L4GrandParent greet returns 'greet'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L4GrandParentNameClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('greet');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_2500
     * @tc.name testStaticMethodGetName2_025
     * @tc.desc Verify getName() for 4-layer hiding chain: L4Parent greet returns 'greet'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L4ParentNameClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('greet');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_2600
     * @tc.name testStaticMethodGetName2_026
     * @tc.desc Verify getName() for 4-layer hiding chain: L4Child greet returns 'greet'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L4ChildNameClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('greet');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_2700
     * @tc.name testStaticMethodGetName2_027
     * @tc.desc Verify getName() for 4-layer hiding chain: L4GrandChild greet returns 'greet'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L4GrandChildNameClass>();
      let method = cls.getStaticMethod('greet');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('greet');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_2800
     * @tc.name testStaticMethodGetName2_028
     * @tc.desc Verify getName() for 5-layer non-hiding chain: L5Base baseMethod returns 'baseMethod'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5BaseNameClass>();
      let method = cls.getStaticMethod('baseMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('baseMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_2900
     * @tc.name testStaticMethodGetName2_029
     * @tc.desc Verify getName() for 5-layer non-hiding chain: L5D1 d1Method returns 'd1Method'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D1NameClass>();
      let method = cls.getStaticMethod('d1Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('d1Method');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_3000
     * @tc.name testStaticMethodGetName2_030
     * @tc.desc Verify getName() for 5-layer non-hiding chain: L5D2 d2Method returns 'd2Method'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D2NameClass>();
      let method = cls.getStaticMethod('d2Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('d2Method');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_3100
     * @tc.name testStaticMethodGetName2_031
     * @tc.desc Verify getName() for 5-layer non-hiding chain: L5D3 d3Method returns 'd3Method'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D3NameClass>();
      let method = cls.getStaticMethod('d3Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('d3Method');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_3200
     * @tc.name testStaticMethodGetName2_032
     * @tc.desc Verify getName() for 5-layer non-hiding chain: L5D4 d4Method returns 'd4Method'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<L5D4NameClass>();
      let method = cls.getStaticMethod('d4Method');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('d4Method');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_3300
     * @tc.name testStaticMethodGetName2_033
     * @tc.desc Verify getName() for 6-overload class: all overloads of process return name 'process'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadNameClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(6);
      let names: string[] = [];
      for (let i: int = 0; i < methods.length; i++) {
        names.push(methods[i].getName());
      }
      expect(names.indexOf('processVoid') >= 0).assertTrue();
      expect(names.indexOf('processInt') >= 0).assertTrue();
      expect(names.indexOf('processIntString') >= 0).assertTrue();
      expect(names.indexOf('processIntStringBool') >= 0).assertTrue();
      expect(names.indexOf('processString') >= 0).assertTrue();
      expect(names.indexOf('processStringInt') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_3400
     * @tc.name testStaticMethodGetName2_034
     * @tc.desc Verify getName() for overload via getStaticMethod with specific signature matches getStaticMethods result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HeavyOverloadNameClass>();
      let methods = cls.getStaticMethods();
      let foundInt: boolean = false;
      let foundStr: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'processInt' && methods[i].getParametersNum() === 1) {
          if (methods[i].getReturnType().getName() === 'i32') {
            foundInt = true;
          }
        }
        if (methods[i].getName() === 'processString' && methods[i].getParametersNum() === 1) {
          if (methods[i].getReturnType().getName() === 'std.core.String') {
            foundStr = true;
          }
        }
      }
      expect(foundInt).assertTrue();
      expect(foundStr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_3500
     * @tc.name testStaticMethodGetName2_035
     * @tc.desc Verify getName() for method with numeric suffix: method123 name is 'method123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialNamingNameClass>();
      let method = cls.getStaticMethod('method123');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('method123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_3600
     * @tc.name testStaticMethodGetName2_036
     * @tc.desc Verify getName() for ALL_CAPS method name: ALL_CAPS name is 'ALL_CAPS'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialNamingNameClass>();
      let method = cls.getStaticMethod('ALL_CAPS');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('ALL_CAPS');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_3700
     * @tc.name testStaticMethodGetName2_037
     * @tc.desc Verify getName() for mixed camelCase with numbers: camelCase123 name is 'camelCase123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialNamingNameClass>();
      let method = cls.getStaticMethod('camelCase123');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('camelCase123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_3800
     * @tc.name testStaticMethodGetName2_038
     * @tc.desc Verify getStaticMethod on class with no static methods returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoStaticMethodNameClass>();
      let method = cls.getStaticMethod('instanceMethod');
      expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_3900
     * @tc.name testStaticMethodGetName2_039
     * @tc.desc Verify getStaticMethods includes all method names for MultiMethodGetNameClass: alpha, beta, gamma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiMethodGetNameClass>();
      let methods = cls.getStaticMethods();
      let foundAlpha: boolean = false;
      let foundBeta: boolean = false;
      let foundGamma: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        let name: string = methods[i].getName();
        if (name === 'alpha')
        {
          foundAlpha = true;
        }
        if (name === 'beta')
        {
          foundBeta = true;
        }
        if (name === 'gamma')
        {
          foundGamma = true;
        }
      }
      expect(foundAlpha).assertTrue();
      expect(foundBeta).assertTrue();
      expect(foundGamma).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_4000
     * @tc.name testStaticMethodGetName2_040
     * @tc.desc Verify getName() for generic instantiation with boolean type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsBool = Class.from<GenericGetNameClass<boolean>>();
      let method = clsBool.getStaticMethod('identify');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('identify');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_4100
     * @tc.name testStaticMethodGetName2_041
     * @tc.desc Verify getStaticMethod with explicit empty param types gives same getName as without params
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentNameClass>();
      let methodSimple = cls.getStaticMethod('getValue');
      let methodExplicit = cls.getStaticMethod('getValue', []);
      expect(methodSimple !== undefined).assertTrue();
      expect(methodExplicit !== undefined).assertTrue();
      expect(methodSimple!.getName()).assertEqual(methodExplicit!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_4200
     * @tc.name testStaticMethodGetName2_042
     * @tc.desc Verify getName() for ConsistentNameClass getValue via getStaticMethods array first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConsistentNameClass>();
      let method = cls.getStaticMethod('getValue');
      expect(method !== undefined).assertTrue();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(method!.getName()).assertEqual(methods[0].getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_4300
     * @tc.name testStaticMethodGetName2_043
     * @tc.desc Verify getName() cross-consistency across all CrossGetNameOwnerClass methods via getStaticMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossGetNameOwnerClass>();
      let methods = cls.getStaticMethods();
      let names: string[] = [];
      for (let i: int = 0; i < methods.length; i++) {
        names.push(methods[i].getName());
      }
      let foundGetValue: boolean = false;
      let foundProcess: boolean = false;
      for (let i: int = 0; i < names.length; i++) {
        if (names[i] === 'getValue')
        {
          foundGetValue = true;
        }
        if (names[i] === 'process')
        {
          foundProcess = true;
        }
      }
      expect(foundGetValue).assertTrue();
      expect(foundProcess).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_4400
     * @tc.name testStaticMethodGetName2_044
     * @tc.desc Verify getName() returns same result across different Class.from instances for GrandParentGetNameClass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<GrandParentGetNameClass>();
      let clsB = Class.from<GrandParentGetNameClass>();
      let methodA = clsA.getStaticMethod('greet');
      let methodB = clsB.getStaticMethod('greet');
      expect(methodA !== undefined).assertTrue();
      expect(methodB !== undefined).assertTrue();
      expect(methodA!.getName()).assertEqual('greet');
      expect(methodB!.getName()).assertEqual(methodA!.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_4500
     * @tc.name testStaticMethodGetName2_045
     * @tc.desc Verify getStaticMethod+getName for byte param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamNameClass>();
      let method = cls.getStaticMethod('methodByte');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodByte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_4600
     * @tc.name testStaticMethodGetName2_046
     * @tc.desc Verify getStaticMethod+getName for short param
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamNameClass>();
      let method = cls.getStaticMethod('methodShort');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodShort');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_4700
     * @tc.name testStaticMethodGetName2_047
     * @tc.desc Verify getStaticMethod+getName for float return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericReturnNameClass>();
      let method = cls.getStaticMethod('methodFloat');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodFloat');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_4800
     * @tc.name testStaticMethodGetName2_048
     * @tc.desc Verify NumericReturnNameClass method names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericReturnNameClass>();
      let method = cls.getStaticMethod('methodIntX');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodIntX');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_4900
     * @tc.name testStaticMethodGetName2_049
     * @tc.desc Verify FixedArray<int> param method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayNameClass>();
      let method = cls.getStaticMethod('faIntParam');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('faIntParam');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_5000
     * @tc.name testStaticMethodGetName2_050
     * @tc.desc Verify FixedArray<string> param method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayNameClass>();
      let method = cls.getStaticMethod('faStringParam');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('faStringParam');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_5100
     * @tc.name testStaticMethodGetName2_051
     * @tc.desc Verify StringEnum param method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodNameClass>();
      let method = cls.getStaticMethod('paramStringEnum');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('paramStringEnum');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_5200
     * @tc.name testStaticMethodGetName2_052
     * @tc.desc Verify IntEnum return method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodNameClass>();
      let method = cls.getStaticMethod('returnIntEnum');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('returnIntEnum');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_5300
     * @tc.name testStaticMethodGetName2_053
     * @tc.desc Verify override method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierNameClass>();
      let method = cls.getStaticMethod('overrideMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('overrideMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_5400
     * @tc.name testStaticMethodGetName2_054
     * @tc.desc Verify protected method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ModifierNameClass>();
      let method = cls.getStaticMethod('protectedMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('protectedMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_5500
     * @tc.name testStaticMethodGetName2_055
     * @tc.desc Verify final methodA name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalMethodNameClass>();
      let method = cls.getStaticMethod('methodA');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodA');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_5600
     * @tc.name testStaticMethodGetName2_056
     * @tc.desc Verify specialGet method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialNameClass>();
      let method = cls.getStaticMethod('specialGet');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('specialGet');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_5700
     * @tc.name testStaticMethodGetName2_057
     * @tc.desc Verify specialInvoke method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SpecialNameClass>();
      let method = cls.getStaticMethod('specialInvoke');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('specialInvoke');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_5800
     * @tc.name testStaticMethodGetName2_058
     * @tc.desc Verify InterfaceImplClass interfaceMethod name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterfaceImplNameClass>();
      let method = cls.getStaticMethod('interfaceMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('interfaceMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_5900
     * @tc.name testStaticMethodGetName2_059
     * @tc.desc Verify InterfaceImplClass classOnlyMethod name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterfaceImplNameClass>();
      let method = cls.getStaticMethod('classOnlyMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('classOnlyMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_6000
     * @tc.name testStaticMethodGetName2_060
     * @tc.desc Verify GenericClassNameClass methodString name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassNameClass<string>>();
      let method = cls.getStaticMethod('methodString');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodString');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_6100
     * @tc.name testStaticMethodGetName2_061
     * @tc.desc Verify GenericClassNameClass methodIntBool name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClassNameClass<int>>();
      let method = cls.getStaticMethod('methodIntBool');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodIntBool');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_6200
     * @tc.name testStaticMethodGetName2_062
     * @tc.desc Verify getStaticMethods includes all new method names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterfaceImplNameClass>();
      let methods = cls.getStaticMethods();
      let foundInterface: boolean = false;
      let foundClassOnly: boolean = false;
      for (let i: int = 0; i < methods.length; i++) {
        let name: string = methods[i].getName();
        if (name === 'interfaceMethod') { foundInterface = true; }
        if (name === 'classOnlyMethod') { foundClassOnly = true; }
      }
      expect(foundInterface).assertTrue();
      expect(foundClassOnly).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_6300
     * @tc.name testStaticMethodGetName2_063
     * @tc.desc Verify getName+getOwner cross for numeric types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumericParamNameClass>();
      let method = cls.getStaticMethod('methodInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('methodInt');
      expect(method!.getOwner().getName().indexOf('NumericParamNameClass') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_6400
     * @tc.name testStaticMethodGetName2_064
     * @tc.desc Verify getName+getReturnType cross for FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArrayNameClass>();
      let method = cls.getStaticMethod('faReturnInt');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('faReturnInt');
      expect(method!.getReturnType().getName()).assertEqual('std.core.Int[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_6500
     * @tc.name testStaticMethodGetName2_065
     * @tc.desc Verify getName+getParametersNum cross for enum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EnumMethodNameClass>();
      let method = cls.getStaticMethod('paramIntEnum');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('paramIntEnum');
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_6600
     * @tc.name testStaticMethodGetName2_066
     * @tc.desc Verify getName() for very long method name returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongNameClass>();
      let method = cls.getStaticMethod('a_very_long_method_name_that_exceeds_typical_length_limits_to_test_that_getName_handles_long_identifiers_properly_in_the_runtime_system');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('a_very_long_method_name_that_exceeds_typical_length_limits_to_test_that_getName_handles_long_identifiers_properly_in_the_runtime_system');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_TWO_6700
     * @tc.name testStaticMethodGetName2_067
     * @tc.desc Verify getName() for Unicode method name returns correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnicodeNameClass>();
      let method = cls.getStaticMethod('中文方法名');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('中文方法名');
    });
  });
}
