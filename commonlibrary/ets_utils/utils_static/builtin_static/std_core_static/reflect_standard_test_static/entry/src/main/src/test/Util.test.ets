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

export default class Utils {
  /** Module prefix for ClassOfCallerTest user types (full FQN = prefix + "." + simpleName). */
  static classOfCallerModulePrefix(): string {
    return "entry.src.main.src.test.class.ClassOfCallerTest.test";
  }

  /**
  * Copy FixedArray into std.core.Array. Runtime cannot cast FixedArray<T> to Array<T>.
  */
  static fixedArrayToArray<T>(raw: FixedArray<T>): Array<T> {
    const out: Array<T> = [];
    for (let i = 0; i < raw.length; i++) {
      out.push(raw[i]);
    }
    return out;
  }

  static findStaticMethodByName(
    methods: FixedArray<reflect.StaticMethod>,
    name: string
  ): reflect.StaticMethod | undefined {
    for (let i = 0; i < methods.length; i++) {
      if (methods[i].getName() === name) {
        return methods[i];
      }
    }
    return undefined;
  }

  /** Reflection lookups may return undefined; some APIs use null (spec/types.md: void ≡ undefined). */
  static isAbsentOptional<T>(v: T | undefined | null): boolean {
    return v === undefined || v === null;
  }

  /** Class-typed reflection optional (getSuper, getFixedArrayComponentType, ofCaller, etc.). */
  static isAbsentReflectOptional(v: Class | undefined | null): boolean {
    return Utils.isAbsentOptional(v);
  }

  /** Class.from<T>() scalar getName() FQN (boxed class names). */
  static scalarClassFromBooleanFqn(): string { return "std.core.Boolean"; }
  static scalarClassFromByteFqn(): string { return "std.core.Byte"; }
  static scalarClassFromCharFqn(): string { return "std.core.Char"; }
  static scalarClassFromShortFqn(): string { return "std.core.Short"; }
  static scalarClassFromIntFqn(): string { return "std.core.Int"; }
  static scalarClassFromLongFqn(): string { return "std.core.Long"; }
  static scalarClassFromFloatFqn(): string { return "std.core.Float"; }
  static scalarClassFromDoubleFqn(): string { return "std.core.Double"; }
  static scalarClassFromNumberFqn(): string { return "std.core.Double"; }
  static scalarClassFromVoidFqn(): string { return "N"; }

  /** getParameterType / getParameterTypes primitive spellings. */
  static scalarParameterI8Fqn(): string { return "i8"; }
  static scalarParameterI16Fqn(): string { return "i16"; }
  static scalarParameterI32Fqn(): string { return "i32"; }
  static scalarParameterI64Fqn(): string { return "i64"; }
  static scalarParameterF32Fqn(): string { return "f32"; }
  static scalarParameterF64Fqn(): string { return "f64"; }

  /** getFixedArrayComponentType / Class.from<FixedArray<T>> component Class.getName(). */
  static scalarReflectI8Fqn(): string { return "std.core.Byte"; }
  static scalarReflectI16Fqn(): string { return "std.core.Short"; }
  static scalarReflectI32Fqn(): string { return "std.core.Int"; }
  static scalarReflectI64Fqn(): string { return "std.core.Long"; }
  static scalarReflectF32Fqn(): string { return "std.core.Float"; }
  static scalarReflectF64Fqn(): string { return "std.core.Double"; }
  static scalarFixedArrayBooleanFqn(): string { return "std.core.Boolean"; }

  /** Class.of(FixedArray<T> instance).getName() for scalar T (e.g. std.core.Int[]). */
  static scalarReflectI32FixedArrayInstanceFqn(): string {
    return `${Utils.scalarReflectI32Fqn()}[]`;
  }

  /** ReflectionUtils057-style FixedArray<T> type info string. */
  static fixedArrayTypeInfoFqn(componentFqn: string): string {
    return `FixedArray<${componentFqn}>`;
  }

  /** Class.PRIMITIVE_* getName() spellings. */
  static scalarPrimitiveBooleanFqn(): string { return "u1"; }
  static scalarPrimitiveVoidFqn(): string { return "void"; }

  static mindMapItSuffix(seq: int): string {
    if (seq < 10) {
      return `00${seq}`;
    }
    if (seq < 100) {
      return `0${seq}`;
    }
    return `${seq}`;
  }

  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve: (value: int | PromiseLike<int>) => void, reject: (value: Error) => void) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }
}

