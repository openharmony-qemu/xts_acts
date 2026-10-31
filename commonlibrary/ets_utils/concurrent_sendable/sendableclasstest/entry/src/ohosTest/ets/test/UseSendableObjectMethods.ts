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

/**
 * @file UseSendableObjectMethods.ts
 * @description All class, function, and interface definitions for sendable
 *              builtins/Object methods testing. In .ts files, Object.* methods
 *              can be called directly without arkts-limited-stdlib restrictions.
 * @since 2026
 */

// ---- @Sendable classes (must be in .ets, not .ts) ----
// @Sendable annotation is ArkTS-specific and only works in .ets files.
// These classes are defined in the .ets test file instead.

// ---- 'use sendable' directive classes (work in .ts) ----

export class UseSendablePoint {
  public x: number;
  public y: number;
  constructor(x: number, y: number) {
    'use sendable';
    this.x = x;
    this.y = y;
  }
}

export class UseSendableRich {
  public name: string;
  public age: number;
  public active: boolean;
  constructor(name: string, age: number, active: boolean) {
    'use sendable';
    this.name = name;
    this.age = age;
    this.active = active;
  }
}

export class UseSendableEmpty {
  constructor() {
    'use sendable';
  }
}

export class UseSendableWithMethod {
  public val: number;
  constructor(val: number) {
    'use sendable';
    this.val = val;
  }
  public double(): number {
    return this.val * 2;
  }
}

export class PlainPoint {
  public x: number;
  public y: number;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

// ---- Interfaces ----

export interface PropertyDescriptorOpts {
  value: string;
  enumerable: boolean;
  writable: boolean;
  configurable: boolean;
}

export interface AssignTarget {
  x: number;
  y: number;
}

export interface ZSource {
  z: number;
}

export interface ManyBag {
  a: number;
  b: number;
  c: number;
  d: number;
  e: number;
}

// ---- @Concurrent functions (must be in .ets, not .ts) ----
// @Concurrent annotation is ArkTS-specific and only works in .ets files.
// These functions are defined in the .ets test file instead.

// ---- Object method helpers (direct calls in .ts) ----

export function objectKeys(obj: Object): string[] {
  return Object.keys(obj);
}

export function objectValues(obj: Object): Object[] {
  return Object.values(obj);
}

export function objectEntries(obj: Object): [string, Object][] {
  return Object.entries(obj);
}

export function objectGetOwnPropertyNames(obj: Object): string[] {
  return Object.getOwnPropertyNames(obj);
}

export function objectGetOwnPropertyDescriptors(obj: Object): Record<string, Object> {
  return Object.getOwnPropertyDescriptors(obj);
}

export function objectGetOwnPropertySymbols(obj: Object): symbol[] {
  return Object.getOwnPropertySymbols(obj);
}

export function objectGetPrototypeOf(obj: Object): Object | null {
  return Object.getPrototypeOf(obj);
}

export function objectIs(a: Object, b: Object): boolean {
  return Object.is(a, b);
}

export function objectIsFrozen(obj: Object): boolean {
  return Object.isFrozen(obj);
}

export function objectIsSealed(obj: Object): boolean {
  return Object.isSealed(obj);
}

export function objectAssign(target: Object, source: Object): Object {
  return Object.assign(target, source);
}

export function objectFreeze<T>(obj: T): T {
  return Object.freeze(obj);
}

export function objectSetPrototypeOf(obj: Object, proto: Object | null): Object {
  return Object.setPrototypeOf(obj, proto);
}

export function objectCreate(proto: Object | null): Object {
  return Object.create(proto);
}

export function objectDefineProperty(obj: Object, prop: string | symbol, descriptor: PropertyDescriptor): void {
  Object.defineProperty(obj, prop, descriptor);
}

// ---- Prototype method helpers ----

export function hasOwnProp(obj: Object, prop: string): boolean {
  return obj.hasOwnProperty(prop);
}

export function toStringDirect(obj: Object): string {
  return obj.toString();
}

export function toLocaleStringDirect(obj: Object): string {
  return obj.toLocaleString();
}

export function valueOfDirect(obj: Object): Object {
  return obj.valueOf();
}

export function isPropEnumerable(obj: Object, prop: string): boolean {
  return obj.propertyIsEnumerable(prop);
}

export function getConstructorName(obj: Object): string {
  return obj.constructor.name;
}

export function getConstructorRef(obj: Object): Object {
  return obj.constructor;
}

// ---- Test helper (defined in .ets, needs expect from hypium) ----
// expectThrow is defined in the .ets test file.

// Symbol-keyed property test (Symbol is only available in .ts, not .ets)
export function testSymbolKeyAssign(): boolean {
  const sym: symbol = Symbol('symKey');
  const source: Object = {} as Object;
  Object.defineProperty(source, sym, { value: 'symValue', enumerable: true, writable: true, configurable: true });
  const target: Object = { normalKey: 'normal' } as Object;
  Object.assign(target, source);
  const targetSyms: symbol[] = Object.getOwnPropertySymbols(target);
  const targetKeys: string[] = Object.keys(target);
  return targetSyms.length === 1 && targetKeys.includes('normalKey');
}
