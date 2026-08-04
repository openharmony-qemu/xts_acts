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


export default class Utils{
  static async msSleep(count: int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }
}

export class EmptyClass001 {}

export interface Person002 {
  name: string;
  age: int;
}

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

export type ReadonlyIntArray040 = readonly int[];
export type IntStringTuple041 = [int, string];
export interface Person042 {
  name: string;
  age: int;
}

export const CHAR_NUL: char = c'\0';
export const CHAR_BEL: char = c'\x07';
export const CHAR_BS: char = c'\b';
export const CHAR_TAB: char = c'\t';
export const CHAR_LF: char = c'\n';
export const CHAR_VT: char = c'\x0B';
export const CHAR_FF: char = c'\f';
export const CHAR_CR: char = c'\r';
export const CHAR_EXCLAMATION: char = c'!';
export const CHAR_DIGIT_0: char = c'0';
export const CHAR_DIGIT_9: char = c'9';
export const CHAR_UPPER_A: char = c'A';
export const CHAR_UPPER_Z: char = c'Z';
export const CHAR_LOWER_A: char = c'a';
export const CHAR_LOWER_B: char = c'b';
export const CHAR_LOWER_X: char = c'x';
export const CHAR_LOWER_Y: char = c'y';
export const CHAR_LOWER_Z: char = c'z';
export const CHAR_TILDE: char = c'~';
export const CHAR_DEL: char = c'\x7F';
export const CHAR_COPYRIGHT: char = c'©';
export const CHAR_REGISTERED: char = c'®';
export const CHAR_PLUS_MINUS: char = c'±';
export const CHAR_A_GRAVE: char = c'À';
export const CHAR_N_TILDE: char = c'ñ';
export const CHAR_CJK_ZHONG: char = c'中';
export const CHAR_CJK_GUO: char = c'国';
export const CHAR_CJK_HAN: char = c'汉';
export const CHAR_CJK_ZI: char = c'字';
export const CHAR_CJK_CE: char = c'测';
export const CHAR_CJK_SHI: char = c'试';
export const CHAR_HANGUL_GA: char = c'가';
export const CHAR_HANGUL_HAN: char = c'한';
export const CHAR_HANGUL_HIH: char = c'힣';
export const CHAR_BMP_MAX: char = c'￿';
