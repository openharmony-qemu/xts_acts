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

// ============================================================================
// Group A: Simple types (001-012)
// Types 003-012 are built-in ArkTS types: Date, RegExp, Map<string,int>, Set<int>,
// int[], Promise<int>, Error, bigint — no custom definitions needed.
// ============================================================================

export class EmptyClass001 {}

export interface Person002 {
  name: string;
  age: int;
}

// ============================================================================
// Group B: Custom types (013-028)
// ============================================================================

export class Holder013<U> {
  val: U | null = null;
  constructor(v: U) {
    this.val = v;
  }
}

export class SelfRefNode014 {
  next: SelfRefNode014 | null = null;
  value: int = 0;
  constructor() {}
}

export enum Color015 {
  RED = 0,
  GREEN = 1,
  BLUE = 2,
  YELLOW = 3
}

export class SignedData016 {}

export class Success016 extends SignedData016 {
  value: int = 0;
  constructor(v: int) {
    this.value = v;
  }
}

export class Failure016 extends SignedData016 {
  message: string = "";
  constructor(m: string) {
    this.message = m;
  }
}

export type IntSupplier017 = () => int;
export type BiFunction018 = (a: int, b: string) => boolean;
export type VoidFunction019 = () => void;
export type IntPredicate020 = (x: int) => boolean;
export type StringComparator021 = (a: string, b: string) => int;
export type BoxFactory022 = () => Box<int>;
export type BoxProcessor023 = (box: Box<string>) => int;

export class BigData024 {
  f1: int = 0;
  f2: int = 0;
  f3: int = 0;
  f4: int = 0;
  f5: int = 0;
}

export class Teacher025 {
  name: string = "";
  age: int = 0;
  subject: string = "";
  constructor(n: string, a: int, s: string) {
    this.name = n;
    this.age = a;
    this.subject = s;
  }
}

export class Singleton026 {
  private static instance: Singleton026 | null = null;
  private constructor() {}
  public static getInstance(): Singleton026 {
    let inst: Singleton026 | null = Singleton026.instance;
    if (inst === null) {
      inst = new Singleton026();
      Singleton026.instance = inst;
    }
    return inst;
  }
}

export class Logger027 {
  tag: string = "";
  constructor(t: string) {
    this.tag = t;
  }
}

export interface Config028 {
  host: string;
  port: int;
}

// ============================================================================
// Group C: Union and nested types (029-039)
// ============================================================================

export type NullableInt029 = int | null;
export type NullableString030 = string | null;
export type IntOrString031 = int | string;
export type MultiUnion032 = int | string | boolean;
export type BoxIntArray034 = Box<int>[];
export type StringBoxIntMap035 = Map<string, Box<int>>;
export type BoxStringSet036 = Set<Box<string>>;
export type BoxIntArray037 = Array<Box<int>>;
export type NestedBox038 = Box<Box<int>>;
export interface MarkerInterface039 {}

// ============================================================================
// Group D: Readonly, utility, tuple types (040-046)
// ============================================================================

export type ReadonlyIntArray040 = readonly int[];
export type IntStringTuple041 = [int, string];
export interface Person042 {
  name: string;
  age: int;
}
