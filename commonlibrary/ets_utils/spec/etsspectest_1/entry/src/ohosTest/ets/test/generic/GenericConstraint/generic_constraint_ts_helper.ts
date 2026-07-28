/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Constructor signature (ArkTS does not support constructor signatures in interfaces)
export interface Constructor<T> {
  new(...args: any[]): T;
}

// F-bounded recursive constraint
export interface Comparable<T> {
  compare(other: T): number;
}

export class NumberValue implements Comparable<NumberValue> {
  value: number;

  constructor(value: number) {
    this.value = value;
  }

  compare(other: NumberValue): number {
    return this.value - other.value;
  }
}

// keyof + indexed access type
export function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

export function createInstance<T>(ctor: Constructor<T>, ...args: any[]): T {
  return new ctor(...args);
}

export function compareValues<T extends Comparable<T>>(a: T, b: T): number {
  return a.compare(b);
}

export class DefaultHolder<T extends HasId = DefaultIdObj> {
  item: T;

  constructor(item: T) {
    this.item = item;
  }

  getId(): number {
    return this.item.id;
  }
}

interface HasId {
  id: number;
}

interface DefaultIdObj extends HasId {
  id: number;
}


