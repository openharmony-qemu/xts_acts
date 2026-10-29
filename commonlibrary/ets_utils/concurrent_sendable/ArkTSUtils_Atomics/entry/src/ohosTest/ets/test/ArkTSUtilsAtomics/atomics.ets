/*
 * Copyright (C) 2025 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ArkTSUtils, collections } from '@kit.ArkTS';

export interface typeOld {
  old: number;
  new: number;
}

export interface type56 {
  time: number;
  old: number;
  new: number;
  val: number;
}

export interface type63 {
  old: number;
  success: boolean;
}

export interface type71 {
  old: number;
  success: boolean;
}

export interface type90 {
  oldVal: number;
  newVal: number;
}

export interface type69 {
  idx: number;
  res: number;
}

export interface type73 {
  oldVal: number;
  newVal: number;
  mask: number;
}

export interface type96 {
  time: number;
  oldValue: number;
  success: boolean;
}

export interface typeCom90 {
  success: boolean;
  oldValue: number;
}

export interface type97 {
  old: number;
  new: number;
  success: boolean;
}

export interface type86 {
  old: number;
  new: number;
  time: number;
}

export interface type94 {
  success: boolean;
  reason?: string;
}

export interface type41 {
  size: number;
  isFree: boolean;
  isValidSize: boolean;
}

export interface type55 {
  type: string;
  result: boolean | number;
}

export interface type88 {
  hasError: boolean;
  isFree: boolean;
}

export interface type51 {
  size: number;
  isFree: boolean;
}

export interface type67 {
  resultIsValid: boolean;
  isFree: boolean;
  isValidSize: boolean;
}

export interface type77 {
  size: number;
  result: boolean;
}

export interface typeLock71 {
  valid: boolean;
  result?: boolean;
}

export interface typeLock100 {
  size: number;
  isFree: boolean;
  isValid: boolean;
}

export interface typeLock91 {
  delay: number;
  result: boolean;
}

export interface typeLock74 {
  result: boolean;
  callCount: number;
  size: number;
}

export type typeLoad85 = collections.Map<number, number>;
export type typeStore85 = collections.Map<number, number>;

export interface typeLoad80 {
  loaded: boolean;
  value: number;
}

export interface typeLoad95 {
  id1: number;
  id2: number;
}

export interface typeLoad88 {
  value: number;
  inRange: boolean;
}

export interface typeNotify96 {
  valid0: boolean;
  valid1: boolean;
}

export interface typeNotify78 {
  time: number;
  count: number;
}

export interface typeOr75 {
  old: number;
  success: boolean;
}

export interface typeOr87 {
  oldValues: number[];
  newValues: number[];
}

export interface typeOr80 {
  old: number;
  success: boolean;
}

export interface typeOr60 {
  time: number;
  old: number;
  new: number;
}

export interface typeOr52 {
  old: number;
  new: number;
}

export interface typeOr97 {
  mask: number;
  timestamp: number;
}

export interface typeOr26 {
  idx: number;
  val: number;
}

export interface typeStore95 {
  id1: number;
  id2: number;
}

export interface typeStore88 {
  storedVal: number;
  inRange: boolean;
}

export interface typeStore80 {
  stored: boolean;
  value: number;
}

export interface typeSub76 {
  old: number;
  success: boolean;
}

export interface typeSub83 {
  oldValues: number[];
  newValues: number[];
}

export interface typeSub71 {
  old: number;
  success: boolean;
}

export interface typeSub63 {
  old: number;
  success: boolean;
}

export interface typeSub98 {
  before: number;
  after: number;
  val: number;
}

export interface typeSub93 {
  val: number;
  timestamp: number;
}

export interface typeSub56 {
  time: number;
  old: number;
  new: number;
}

export interface typeSub46 {
  oldValue: number;
  newValue: number;
}

export interface typeSub25 {
  idx: number;
  val: number;
}

export interface typeXor93 {
  val: number;
  timestamp: number;
}

export interface typeXor98 {
  before: number;
  after: number;
  val: number;
}

export interface typeWait01 {
  ta: collections.Int32Array;
  index: number;
  value: number;
}

export interface typeWait04 {
  ta: collections.Int32Array;
  index: number;
  value: number;
}

export interface typeWait02 {
  ta: collections.Int32Array;
  index: number;
}

export interface typeWait05 {
  ta: collections.Int32Array;
  index: number;
}

export interface typeWait03 {
  ta: collections.Int32Array;
  index: number;
  value: number;
  timeout: number;
}

export interface typeWait06 {
  ta: collections.Int32Array;
  index: number;
  value: number;
  timeout: number;
}

export interface typeWait07 {
  ta: collections.Int32Array;
}

export interface typeWait11 {
  sab: collections.ArrayBuffer;
}

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, ms);
  });
}

export async function atomicAddGenerator(values: number[], i32a: collections.Int32Array): Promise<number[]> {
  const oldValues: number[] = [];
  for (let i = 0; i < values.length; i++) {
    await delay(10);
    oldValues.push(ArkTSUtils.Atomics.add(i32a, 0, values[i]));
  }
  return oldValues;
}

export async function atomicsAndTest090(): Promise<type90[]> {
  const sab = new collections.ArrayBuffer(4);
  const ia = new collections.Int32Array(sab);
  ia[0] = 40;
  const masks: number[] = [0b101111, 0b100000];
  const results: type90[] = [];
  for (let i = 0; i < masks.length; i++) {
    await delay(2);
    const oldVal = ArkTSUtils.Atomics.and(ia, 0, masks[i]);
    const item: type90 = { oldVal, newVal: ia[0] };
    results.push(item);
  }
  return results;
}

export async function atomicsCompareExchangeTest067(): Promise<number[]> {
  const sab = new collections.ArrayBuffer(4);
  const ia = new collections.Int32Array(sab);
  ia[0] = 100;
  const expectedValues: number[] = [100, 110, 120];
  const newValues: number[] = [110, 120, 130];
  const oldValues: number[] = [];
  for (let i = 0; i < expectedValues.length; i++) {
    await delay(3);
    oldValues.push(ArkTSUtils.Atomics.compareExchange(ia, 0, expectedValues[i], newValues[i]));
  }
  return oldValues;
}

export async function atomicsCompareExchangeTest082(): Promise<number[]> {
  const sab = new collections.ArrayBuffer(4);
  const ia = new collections.Int32Array(sab);
  ia[0] = 10;
  let lastExpected = ia[0];
  const updates: number[] = [15, 20, 25];
  const oldValues: number[] = [];
  for (let i = 0; i < updates.length; i++) {
    await delay(4);
    const oldValue = ArkTSUtils.Atomics.compareExchange(ia, 0, lastExpected, updates[i]);
    if (oldValue === lastExpected) {
      lastExpected = updates[i];
    }
    oldValues.push(oldValue);
  }
  return oldValues;
}

export async function atomicsExchangeTest096(): Promise<number[]> {
  const sab = new collections.ArrayBuffer(4);
  const ia = new collections.Int32Array(sab);
  ia[0] = 0;
  const stopValue = 25;
  const step = 10;
  const oldValues: number[] = [];
  let current = ia[0];
  while (current < stopValue) {
    await delay(3);
    oldValues.push(ArkTSUtils.Atomics.exchange(ia, 0, current + step));
    current += step;
  }
  return oldValues;
}

export async function atomicsExchangeTest078(): Promise<number[]> {
  const sab = new collections.ArrayBuffer(4);
  const ia = new collections.Int32Array(sab);
  ia[0] = 10;
  const values: number[] = [15, 20, 25, 30, 35];
  const oldValues: number[] = [];
  for (let i = 0; i < values.length; i++) {
    await delay(3);
    if (values[i] === 20 || values[i] === 30) {
      continue;
    }
    oldValues.push(ArkTSUtils.Atomics.exchange(ia, 0, values[i]));
  }
  return oldValues;
}

export async function atomicsExchangeTest063(): Promise<number[]> {
  const sab = new collections.ArrayBuffer(4);
  const ia = new collections.Int32Array(sab);
  ia[0] = 0;
  const oldValues: number[] = [];
  let current = ia[0];
  for (let i = 0; i < 3; i++) {
    current *= 2;
    await delay(3);
    oldValues.push(ArkTSUtils.Atomics.exchange(ia, 0, current));
  }
  return oldValues;
}

export async function atomicsExchangeTest054(): Promise<number[]> {
  const sab = new collections.ArrayBuffer(4);
  const ia = new collections.Int32Array(sab);
  ia[0] = 10;
  const newValues: number[] = [20, 30, 40];
  const oldValues: number[] = [];
  for (let i = 0; i < newValues.length; i++) {
    await delay(3);
    oldValues.push(ArkTSUtils.Atomics.exchange(ia, 0, newValues[i]));
  }
  return oldValues;
}

export async function atomicsIsLockFreeTest088(): Promise<type88[]> {
  const sizes: (number | string)[] = [1, 'invalid', 1];
  const results: type88[] = [];
  for (let i = 0; i < sizes.length; i++) {
    await delay(2);
    try {
      const isFree = ArkTSUtils.Atomics.isLockFree(sizes[i] as number);
      const item: type88 = { hasError: false, isFree };
      results.push(item);
    } catch (err) {
      const item: type88 = { hasError: true, isFree: false };
      results.push(item);
    }
  }
  return results;
}

export async function atomicsIsLockFreeTest051(): Promise<type51[]> {
  const sizes: number[] = [1, 1, 1];
  const results: type51[] = [];
  for (let i = 0; i < sizes.length; i++) {
    await delay(2);
    const item: type51 = { size: sizes[i], isFree: ArkTSUtils.Atomics.isLockFree(sizes[i]) };
    results.push(item);
  }
  return results;
}

export async function atomicsIsLockFreeTest077(): Promise<type77[]> {
  const sizes: number[] = [2, 2, 2, 2];
  const results: type77[] = [];
  let callCount = 0;
  for (let i = 0; i < sizes.length; i++) {
    if (callCount >= 2) {
      break;
    }
    callCount++;
    await delay(2);
    const item: type77 = { size: sizes[i], result: ArkTSUtils.Atomics.isLockFree(sizes[i]) };
    results.push(item);
  }
  return results;
}

export async function atomicsIsLockFreeTest067(): Promise<type67[]> {
  const sizes: number[] = [4, 4, 5];
  const results: type67[] = [];
  for (let i = 0; i < sizes.length; i++) {
    await delay(2);
    const isFree = ArkTSUtils.Atomics.isLockFree(sizes[i]);
    const item: type67 = {
      isFree,
      isValidSize: [1, 2, 4, 8].includes(sizes[i]),
      resultIsValid: typeof isFree === 'boolean'
    };
    results.push(item);
  }
  return results;
}

export async function atomicsIsLockFreeTest099(): Promise<type51[]> {
  const sizes: number[] = [4, 5, 4, 6, 4];
  const filteredResults: type51[] = [];
  for (let i = 0; i < sizes.length; i++) {
    await delay(2);
    if (sizes[i] === 4) {
      const item: type51 = { size: sizes[i], isFree: ArkTSUtils.Atomics.isLockFree(sizes[i]) };
      filteredResults.push(item);
    }
  }
  return filteredResults;
}
