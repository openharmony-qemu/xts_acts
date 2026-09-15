/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { collections } from "@kit.ArkTS";

export const sleep = (ms: number | undefined) => {
  return new Promise <void>(resolve => setTimeout(resolve, ms));
}

@Concurrent
export function testUint16ArrayTaskPool0001(): string {
  let uint16Array: collections.Uint16Array = new collections.Uint16Array(10);
  let expectedValues: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  uint16Array.set(expectedValues);
  return uint16Array.toString();
}

@Concurrent
export function testUint16ArrayTaskPool0002(): string {
  let uint16Array: collections.Uint16Array = new collections.Uint16Array(10);
  const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  uint16Array.set(expectedValues);
  const normalArray: number[] = [...uint16Array];
  return normalArray.toString();
}

@Concurrent
export function testUint16ArrayTaskPool0003(): boolean {
  let uint16Array: collections.Uint16Array = new collections.Uint16Array();
  return uint16Array instanceof collections.Uint16Array;
}

@Concurrent
export function testUint16ArrayTaskPool0004(): string {
  let errorMessage = "";
  try {
    new collections.Uint16Array(-1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint16ArrayTaskPool0005(): number {
  let uint16Array: collections.Uint16Array = new collections.Uint16Array(0);
  return uint16Array.length;
}

@Concurrent
export function testUint16ArrayTaskPool0006(): number {
  let uint16Array: collections.Uint16Array = new collections.Uint16Array(10);
  return uint16Array.length;
}

@Concurrent
export function testUint16ArrayTaskPool0007(): number {
  let uint16Array: collections.Uint16Array = new collections.Uint16Array(100000);
  return uint16Array.length;
}

@Concurrent
export function testUint16ArrayTaskPool0008(): boolean {
  let arrayLike = [1, 3, 5];
  let array: collections.Uint16Array = new collections.Uint16Array(arrayLike);
  return array instanceof collections.Uint16Array;
}

@Concurrent
export function testUint16ArrayTaskPool0009(): boolean {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
  let array: collections.Uint16Array = new collections.Uint16Array(arrayBuffer);
  return array instanceof collections.Uint16Array;
}

@Concurrent
export function testUint16ArrayTaskPool0010(): boolean {
  let arrayLike = [1, 3, 5];
  let uint16Array: collections.Uint16Array = new collections.Uint16Array(arrayLike);
  let array: collections.Uint16Array = new collections.Uint16Array(uint16Array);
  return array instanceof collections.Uint16Array;
}

@Concurrent
export function testUint16ArrayTaskPool0011(): string {
  let uint16Array: collections.Uint16Array = collections.Uint16Array.from([]);
  let array: collections.Uint16Array = new collections.Uint16Array(uint16Array.buffer, 0, 0);
  return array.toString();
}

@Concurrent
export function testUint16ArrayTaskPool0012(): string {
  let errorMessage = "";
  try {
    let uint16Array: collections.Uint16Array = collections.Uint16Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint16Array(uint16Array.buffer, -1, 0);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint16ArrayTaskPool0013(): string {
  let errorMessage = "";
  try {
    let uint16Array: collections.Uint16Array = collections.Uint16Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint16Array(uint16Array.buffer, -1, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint16ArrayTaskPool0014(): string {
  let errorMessage = "";
  try {
    let uint16Array: collections.Uint16Array = collections.Uint16Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint16Array(uint16Array.buffer, -1, 2);
  } catch (err) {
    errorMessage = err.message;
  }
