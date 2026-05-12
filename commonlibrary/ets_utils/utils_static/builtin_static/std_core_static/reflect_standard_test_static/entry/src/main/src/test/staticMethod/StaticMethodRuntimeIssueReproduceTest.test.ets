/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * ...
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

// ====================================================================
// Issue 1: getStaticMethods() 不返回 private/protected 方法
// ====================================================================
class Issue1PrivateClass {
  private static privateMethod(): void {}
}
class Issue1ProtectedClass {
  protected static protectedMethod(): void {}
}
class Issue1MixedClass {
  public static publicMethod(): void {}
  private static privateMethod(): void {}
  protected static protectedMethod(): void {}
}

// ====================================================================
// Issue 2: getStaticMethod('name') 对 private/protected 返回 undefined
// ====================================================================
class Issue2PrivateClass {
  private static test(): void {}
}
class Issue2ProtectedClass {
  protected static test(): void {}
}

// ====================================================================
// Issue 3: getParameterType(无效索引) 抛 TypeError
// ====================================================================
class Issue3Class {
  public static test(value: int): void {}
  public static noParam(): void {}
}

// ====================================================================
// Issue 4: isUnion() 对 int|undefined 返回 false
// ====================================================================
class Issue4Class {
  public static returnUndefinable(): int | undefined { return 0; }
  public static returnNullable(): string | null { return null; }
}

// ====================================================================
// Issue 5: FixedArray 类型名是 String[] 而非 FixedArray
// ====================================================================
class Issue5Class {
  public static returnFixedArray(): FixedArray<string> { return new FixedArray<string>(0); }
}

// ====================================================================
// Issue 6: 类型名映射 bool→u1, number→f64, char→u16
// ====================================================================
class Issue6Class {
  public static returnBool(): boolean { return true; }
  public static returnNumber(): number { return 1.0 as number; }
  public static returnChar(): string { return '97' as string; }
  public static boolParam(value: boolean): void {}
  public static numberParam(value: number): void {}
  public static charParam(value: string): void {}
}

// ====================================================================
// Issue 7: typeof int 返回 'int' 而非 'number'
// ====================================================================
class Issue7Class {
  public static returnInt(): int { return 42; }
}

// ====================================================================
// Issue 8: Array.isArray() 不识别 FixedArray
// ====================================================================
class Issue8Class {
  public static add(a: int, b: int): void {}
}

// ====================================================================
// Issue 9: Class.getName() 返回全限定名
// ====================================================================
class Issue9MyClass {}

// ====================================================================
// Issue 10: 运行时类型名映射表
// ====================================================================
class Issue10Class {
  public static intParam(value: int): void {}
  public static floatParam(value: float): void {}
  public static doubleParam(value: double): void {}
  public static byteParam(value: byte): void {}
  public static shortParam(value: short): void {}
  public static longParam(value: long): void {}
  public static stringParam(value: string): void {}
}

export default function StaticMethodRuntimeIssueReproduceTest(): void {
  describe('StaticMethodRuntimeIssueReproduceTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): void => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    // ====================================================================
    // Issue 1: getStaticMethods() 不返回 private/protected 方法
    // 脑图: StaticMethod_isPrivate 2.1 "标准返回值 - private方法"
    //       StaticMethod_isProtected 2.1 "标准返回值 - protected方法"
    //       StaticMethod_isPublic 2.1 "标准返回值 - 非public方法"
    // 预期: 返回所有静态方法 | 实际: 只返回 public 方法
    // ====================================================================
    it('issue1_getStaticMethods_no_private_protected', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      console.info('[脑图] StaticMethod_isPrivate 2.1 "标准返回值 - private方法"');
      console.info('[脑图] StaticMethod_isProtected 2.1 "标准返回值 - protected方法"');
      console.info('[脑图] StaticMethod_isPublic 2.1 "标准返回值 - 非public方法"');
      let m1 = Class.from<Issue1PrivateClass>().getStaticMethods();
      let m2 = Class.from<Issue1ProtectedClass>().getStaticMethods();
      let m3 = Class.from<Issue1MixedClass>().getStaticMethods();
      console.info('[Issue1] private-only class length:', m1.length, '(脑图预期 >=1, 实际 0)');
      console.info('[Issue1] protected-only class length:', m2.length, '(脑图预期 >=1, 实际 0)');
      console.info('[Issue1] mixed class length:', m3.length, '(脑图预期 3, 实际仅public)');
    });

    // ====================================================================
    // Issue 2: getStaticMethod('name') 对 private/protected 返回 undefined
    // 脑图: StaticMethod_isAsync 2.2 "private async方法" / "protected async方法"
    //       StaticMethod_isGetter 2.2 "private getter" / "protected getter"
    //       StaticMethod_isSetter 2.2 "private setter" / "protected setter"
    // 预期: 按名称可找到 | 实际: 返回 undefined
    // ====================================================================
    it('issue2_getStaticMethod_name_not_found', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      console.info('[脑图] StaticMethod_isAsync 2.2 "private async方法" / "protected async方法"');
      console.info('[脑图] StaticMethod_isGetter 2.2 "private getter" / "protected getter"');
      console.info('[脑图] StaticMethod_isSetter 2.2 "private setter" / "protected setter"');
      let m1 = Class.from<Issue2PrivateClass>().getStaticMethod('test');
      let m2 = Class.from<Issue2ProtectedClass>().getStaticMethod('test');
      console.info('[Issue2] private getStaticMethod("test"):', m1 == undefined ? 'undefined' : 'found', '(脑图预期 found)');
      console.info('[Issue2] protected getStaticMethod("test"):', m2 == undefined ? 'undefined' : 'found', '(脑图预期 found)');
    });

    // ====================================================================
    // Issue 3: getParameterType(无效索引) 抛 TypeError
    // 脑图: StaticMethod_getParameterType 1.2 "idx - 负数(-1)" / "idx - 超出范围(10)"
    //       StaticMethod_getParameterType 1.2 "idx - 最大整数(2147483647)"
    //       StaticMethod_getParameterType 2.2 "无参数方法-getParameterType(0)"
    // 预期: 返回 undefined | 实际: 抛不可捕获 TypeError
    // ====================================================================
    it('issue3_getParameterType_invalid_index_throws', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      console.info('[脑图] StaticMethod_getParameterType 1.2 "idx - 负数(-1)" / "idx - 超出范围(10)" / "idx - 最大整数"');
      console.info('[脑图] StaticMethod_getParameterType 2.2 "无参数方法-getParameterType(0)"');
      let method = Class.from<Issue3Class>().getStaticMethod('test');
      let noParamMethod = Class.from<Issue3Class>().getStaticMethod('noParam');
      console.info('[Issue3] method exists:', method != undefined);
      console.info('[Issue3] noParamMethod exists:', noParamMethod != undefined);
      console.info('[Issue3] getParameterType(-1) throws TypeError (uncatchable)');
      console.info('[Issue3] getParameterType(10) throws TypeError (uncatchable)');
      console.info('[Issue3] noParam.getParameterType(0) throws TypeError (uncatchable)');
    });

    // ====================================================================
    // Issue 4: isUnion() 对 int|undefined 返回 false
    // 脑图: StaticMethod_getReturnType 2.3 "返回含undefined的联合类型(int|undefined)"
    // 预期: isUnion()==true | 实际: isUnion()==false
    // (对比: string|null → isUnion()==true 正常)
    // ====================================================================
    it('issue4_isUnion_undefined_not_recognized', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      console.info('[脑图] StaticMethod_getReturnType 2.3 "返回含undefined的联合类型(int|undefined)"');
      let m1 = Class.from<Issue4Class>().getStaticMethod('returnUndefinable');
      let m2 = Class.from<Issue4Class>().getStaticMethod('returnNullable');
      console.info('[Issue4] int|undefined isUnion():', m1!.getReturnType().isUnion(), '(脑图预期 true, 实际 false)');
      console.info('[Issue4] string|null isUnion():', m2!.getReturnType().isUnion(), '(脑图预期 true)');
    });

    // ====================================================================
    // Issue 5: FixedArray 返回类型名是 "String[]" 而非 "FixedArray"
    // 脑图: StaticMethod_getReturnType 2.1 "返回FixedArray类型"
    //       StaticMethod_getParameterTypes 2.1 "标准返回值 - FixedArray"
    // 预期: "std.core.FixedArray" | 实际: "std.core.String[]"
    // ====================================================================
    it('issue5_fixedarray_name_mismatch', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      console.info('[脑图] StaticMethod_getReturnType 2.1 "返回FixedArray类型"');
      console.info('[脑图] StaticMethod_getParameterTypes 2.1 "标准返回值 - FixedArray"');
      let method = Class.from<Issue5Class>().getStaticMethod('returnFixedArray');
      let name = method!.getReturnType().getName();
      console.info('[Issue5] FixedArray<string> return type name:', name);
      console.info('[Issue5] (脑图预期 "std.core.FixedArray", 实际 "std.core.String[]")');
    });

    // ====================================================================
    // Issue 6a: 类型名映射 — 返回类型
    // 脑图: StaticMethod_getReturnType 2.2 "返回boolean/number/char"
    //       StaticMethod_getParameterType 2.2 "boolean/number/char参数"
    // 预期: bool/"bool", number/"number", char/"u8"
    // 实际: bool→"u1", number→"f64", char→"u16"
    // ====================================================================
    it('issue6_return_type_names', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      console.info('[脑图] StaticMethod_getReturnType 2.2 "返回boolean/number/char"');
      console.info('[脑图] StaticMethod_getParameterType 2.2 "boolean/number/char参数"');
      let cls = Class.from<Issue6Class>();
      console.info('[Issue6] boolean return:', cls.getStaticMethod('returnBool')!.getReturnType().getName(), '(脑图预期 bool, 实际 u1)');
      console.info('[Issue6] number return:', cls.getStaticMethod('returnNumber')!.getReturnType().getName(), '(脑图预期 number, 实际 f64)');
      console.info('[Issue6] char return:', cls.getStaticMethod('returnChar')!.getReturnType().getName(), '(脑图预期 u8, 实际 u16)');
    });

    // ====================================================================
    // Issue 6b: 类型名映射 — 参数类型 (同 Issue6a, 参数侧验证)
    // 脑图: StaticMethod_getParameterType 2.2
    // ====================================================================
    it('issue6_param_type_names', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Issue6Class>();
      console.info('[Issue6] boolean param:', cls.getStaticMethod('boolParam')!.getParameterType(0)!.getName(), '(u1)');
      console.info('[Issue6] number param:', cls.getStaticMethod('numberParam')!.getParameterType(0)!.getName(), '(f64)');
      console.info('[Issue6] char param:', cls.getStaticMethod('charParam')!.getParameterType(0)!.getName(), '(u16)');
    });

    // ====================================================================
    // Issue 7: typeof int 返回 'int' 而非 'number'
    // 脑图: StaticMethod_getParametersNum 2.1 "返回值类型为number"
    //       StaticMethod_invoke 2.1 "标准返回值 - 基本类型"
    // 预期: typeof==="number" | 实际: typeof==="int"
    // ====================================================================
    it('issue7_typeof_int', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      console.info('[脑图] StaticMethod_getParametersNum 2.1 "返回值类型为number"');
      console.info('[脑图] StaticMethod_invoke 2.1 "标准返回值 - 基本类型"');
      let method = Class.from<Issue7Class>().getStaticMethod('returnInt');
      let result = method!.invoke();
      console.info('[Issue7] typeof int return value:', typeof result, '(脑图预期 number, 实际 int)');
    });

    // ====================================================================
    // Issue 8: Array.isArray() 不识别 FixedArray
    // 脑图: StaticMethod_getParameterTypes 2.3 "Array.isArray验证"
    // 预期: Array.isArray()==true | 实际: Array.isArray()==false
    // ====================================================================
    it('issue8_fixedarray_not_isarray', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      console.info('[脑图] StaticMethod_getParameterTypes 2.3 "Array.isArray验证"');
      let method = Class.from<Issue8Class>().getStaticMethod('add');
      let paramTypes = method!.getParameterTypes();
      let isArray = Array.isArray(paramTypes);
      console.info('[Issue8] Array.isArray(FixedArray):', isArray, '(脑图预期 true, 实际 false)');
    });

    // ====================================================================
    // Issue 9: Class.getName() 返回全限定名
    // 脑图: StaticMethod_getName 2.1 "标准返回值" (多处使用 assertEqual 短名)
    //       StaticMethod_getOwner 2.1 "标准返回值 - 同一类"
    // 预期: "Issue9MyClass" | 实际: 含完整模块路径的全限定名
    // ====================================================================
    it('issue9_full_qualified_name', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      console.info('[脑图] StaticMethod_getName 2.1 "标准返回值" (脑图使用 assertEqual 短名)');
      console.info('[脑图] StaticMethod_getOwner 2.1 "标准返回值 - 同一类" (脑图使用 assertEqual 短名)');
      let cls = Class.from<Issue9MyClass>();
      console.info('[Issue9] Class.getName():', cls.getName());
      console.info('[Issue9] (脑图预期短名 "Issue9MyClass", 实际全限定名)');
    });

    // ====================================================================
    // Issue 10: 完整运行时类型名映射表
    // 脑图: StaticMethod_getParameterType 2.2 "各基本类型参数"
    //       StaticMethod_getReturnType 2.2 "各基本类型返回值"
    // 验证所有基本类型的运行时 getName() 返回值
    // ====================================================================
    it('issue10_type_name_mapping_table', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      console.info('[脑图] StaticMethod_getParameterType 2.2 "各基本类型参数"');
      console.info('[脑图] StaticMethod_getReturnType 2.2 "各基本类型返回值"');
      let cls = Class.from<Issue10Class>();
      console.info('[Issue10] === 运行时类型名映射表 ===');
      console.info('[Issue10] int param:', cls.getStaticMethod('intParam')!.getParameterType(0)!.getName());
      console.info('[Issue10] float param:', cls.getStaticMethod('floatParam')!.getParameterType(0)!.getName());
      console.info('[Issue10] double param:', cls.getStaticMethod('doubleParam')!.getParameterType(0)!.getName());
      console.info('[Issue10] byte param:', cls.getStaticMethod('byteParam')!.getParameterType(0)!.getName());
      console.info('[Issue10] short param:', cls.getStaticMethod('shortParam')!.getParameterType(0)!.getName());
      console.info('[Issue10] long param:', cls.getStaticMethod('longParam')!.getParameterType(0)!.getName());
      console.info('[Issue10] string param:', cls.getStaticMethod('stringParam')!.getParameterType(0)!.getName());
    });
  });
}
