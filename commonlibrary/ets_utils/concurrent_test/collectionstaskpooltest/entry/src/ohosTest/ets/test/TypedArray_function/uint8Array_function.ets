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
export function testUint8ArrayTaskPool0001(): string {
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(10);
  let expectedValues: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  uint8Array.set(expectedValues);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0002(): string {
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(10);
  const expectedValues = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  uint8Array.set(expectedValues);
  const normalArray: number[] = [...uint8Array];
  return normalArray.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0003(): boolean {
  let uint8Array: collections.Uint8Array = new collections.Uint8Array();
  return uint8Array instanceof collections.Uint8Array;
}

@Concurrent
export function testUint8ArrayTaskPool0004(): string {
  let errorMessage = "";
  try {
    new collections.Uint8Array(-1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ArrayTaskPool0005(): number {
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(0);
  return uint8Array.length;
}

@Concurrent
export function testUint8ArrayTaskPool0006(): number {
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(10);
  return uint8Array.length;
}

@Concurrent
export function testUint8ArrayTaskPool0007(): number {
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(100000);
  return uint8Array.length;
}

@Concurrent
export function testUint8ArrayTaskPool0008(): boolean {
  let arrayLike = [1, 3, 5];
  let array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
  return array instanceof collections.Uint8Array;
}

@Concurrent
export function testUint8ArrayTaskPool0009(): boolean {
  let arrayBuffer: collections.ArrayBuffer = new collections.ArrayBuffer(12);
  let array: collections.Uint8Array = new collections.Uint8Array(arrayBuffer);
  return array instanceof collections.Uint8Array;
}

@Concurrent
export function testUint8ArrayTaskPool0010(): boolean {
  let arrayLike = [1, 3, 5];
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
  let array: collections.Uint8Array = new collections.Uint8Array(uint8Array);
  return array instanceof collections.Uint8Array;
}

@Concurrent
export function testUint8ArrayTaskPool0011(): string {
  let uint8Array: collections.Uint8Array = collections.Uint8Array.from([]);
  let array: collections.Uint8Array = new collections.Uint8Array(uint8Array.buffer, 0, 0);
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0012(): string {
  let errorMessage = "";
  try {
    let uint8Array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint8Array(uint8Array.buffer, -1, 0);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ArrayTaskPool0013(): string {
  let errorMessage = "";
  try {
    let uint8Array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint8Array(uint8Array.buffer, -1, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ArrayTaskPool0014(): string {
  let errorMessage = "";
  try {
    let uint8Array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint8Array(uint8Array.buffer, -1, 2);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ArrayTaskPool0015(): string {
  let uint8Array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Uint8Array = new collections.Uint8Array(uint8Array.buffer, 0, 0);
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0016(): string {
  let errorMessage = "";
  try {
    let uint8Array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint8Array(uint8Array.buffer, 0, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ArrayTaskPool0017(): string {
  let uint8Array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Uint8Array = new collections.Uint8Array(uint8Array.buffer, 0, 2);
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0018(): string {
  let uint8Array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Uint8Array = new collections.Uint8Array(uint8Array.buffer, 2, 0);
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0019(): string {
  let errorMessage = "";
  try {
    let uint8Array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6]);
    new collections.Uint8Array(uint8Array.buffer, 2, -1);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ArrayTaskPool0020(): string {
  let uint8Array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6]);
  let array: collections.Uint8Array = new collections.Uint8Array(uint8Array.buffer, 2, 2);
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0021(): string {
  let arrayLike = [1, 3, 5];
  let array: collections.Uint8Array = collections.Uint8Array.from(arrayLike);
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0022(): string {
  let arrayLike = [];
  let array: collections.Uint8Array = collections.Uint8Array.from(arrayLike);
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0023(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from<number>(
    { length: 5 },
    (v: Object, k: number) => k
  );
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0024(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from<string>(
    ["1", "3", "5"],
    (v: string, k: number) => parseInt(v)
  );
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0025(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from<string>(
    "12345",
    (v: string, k: number) => parseInt(v)
  );
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0026(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from<number>(
    [1, 3, 5],
    (v: number, k: number) => v
  );
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0027(): string {
  let nestedArray: number[][] = [[1, 2], [3, 4], [5, 6]];
  let array: collections.Uint8Array = collections.Uint8Array.from<number>(
    ([] as number[]).concat(...nestedArray),
    (v: number) => v
  );
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0028(): string {
  let set: Set<number> = new Set<number>([1, 2, 3]);
  let array: collections.Uint8Array = collections.Uint8Array.from(set);
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0029(): string {
  let set: Set<number> = new Set<number>([1, 2, 3]);
  let array: collections.Uint8Array = collections.Uint8Array.from(
    set,
    (v: number, k: number) => v + k
  );
  return array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0030(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(3, 1, 3);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0031(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(-1, -1, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0032(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(-1, 0, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0033(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(-1, 0, 0);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0034(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(-1, 0, 2);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0035(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(-1, 0, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0036(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(-1, 2, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0037(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(-1, 2, 0);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0038(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(-1, 2, 2);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0039(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(-1, 2, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0040(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(-1, 10, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0041(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(0, -1, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0042(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(0, 0, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0043(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(0, 0, 0);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0044(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(0, 0, 2);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0045(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(0, 0, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0046(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(0, 2, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0047(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(0, 2, 0);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0048(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(0, 2, 2);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0049(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(0, 2, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0050(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(0, 10, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0051(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(2, -1, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0052(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(2, 0, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0053(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(2, 0, 0);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0054(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(2, 0, 2);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0055(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(2, 0, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0056(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(2, 2, -1);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0057(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(2, 2, 0);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0058(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(2, 2, 2);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0059(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(2, 2, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0060(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(2, 10, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0061(): string {
  let array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
  let copied: collections.Uint8Array = array.copyWithin(10, 10, 10);
  return copied.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0062(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
  return uint8Array.some((element: number) => element == 246);
}

@Concurrent
export function testUint8ArrayTaskPool0063(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
  return uint8Array.some((element: number) => element < 0);
}

@Concurrent
export function testUint8ArrayTaskPool0064(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
  return uint8Array.some((element: number) => element >= 0);
}

@Concurrent
export function testUint8ArrayTaskPool0065(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
  return uint8Array.every((element: number) => element >= 0);
}

@Concurrent
export function testUint8ArrayTaskPool0066(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
  return uint8Array.every((element: number) => element <= 40);
}

@Concurrent
export function testUint8ArrayTaskPool0067(): boolean {
  let arrayLike = [-10, 20, -30, 40, -50];
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike);
  return uint8Array.every((element: number) => element < 20);
}

@Concurrent
export function testUint8ArrayTaskPool0068(): string {
  let arrayLike = [1, 2, 3];
  let uint8Array1: collections.Uint8Array = new collections.Uint8Array(arrayLike).fill(4);
  let uint8Array2: collections.Uint8Array = new collections.Uint8Array(arrayLike).fill(4, 1);
  let uint8Array3: collections.Uint8Array = new collections.Uint8Array(arrayLike).fill(4, 1, 2);
  return uint8Array1.toString()+","+uint8Array2.toString()+","+uint8Array3.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0069(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike).fill(4, -1, -1);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0070(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array: collections.Uint8Array = new collections.Uint8Array(arrayLike).fill(4, -1, 0);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0071(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, -1, 2);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0072(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, -1, 10);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0073(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, 0, -1);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0074(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, 0, 0);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0075(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, 0, 2);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0076(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, 0, 10);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0077(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, 2, -1);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0078(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, 2, 0);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0079(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, 2, 2);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0080(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, 2, 10);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0081(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, 10, -1);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0082(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, 10, 0);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0083(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, 10, 2);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0084(): string {
  let arrayLike = [1, 2, 3, 4, 5, 6];
  let uint8Array = new collections.Uint8Array(arrayLike).fill(4, 10, 10);
  return uint8Array.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0085(): string {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8Array.from(arrayLike);
  let filtered = array.filter((element: number) => element % 2 == 0);
  return filtered.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0086(): number {
  let arrayLike: number[] = [];
  let array = collections.Uint8Array.from(arrayLike);
  let filtered = array.filter((element: number) => element % 2 == 0);
  return filtered.length;
}

@Concurrent
export function testUint8ArrayTaskPool0087(): string {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8Array.from(arrayLike);
  let filtered1 = array.filter((element: number) => element > 4);
  array.set([5, 6], 2);
  let filtered2 = array.filter((element: number) => element > 4);
  return filtered1.toString()+' after set is '+filtered2.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0088(): number | undefined {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8Array.from(arrayLike);
  return array.find((element: number) => element > 2);
}

@Concurrent
export function testUint8ArrayTaskPool0089(): number | undefined {
  let arrayLike: number[] = [];
  let array = collections.Uint8Array.from(arrayLike);
  return array.find((element: number) => element > 2);
}

@Concurrent
export function testUint8ArrayTaskPool0090(): string {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8Array.from(arrayLike);
  let res1 = array.find((element: number) => element > 4);
  array.set([5, 6], 2);
  let res2 = array.find((element: number) => element > 4);
  let arrayResult = [typeof res1,res2];
  return  arrayResult.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0091(): undefined | number {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8Array.from(arrayLike);
  return array.find((index: number) => index == -1);
}

@Concurrent
export function testUint8ArrayTaskPool0092(): undefined | number {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8Array.from(arrayLike);
  return array.find((index: number) => index == 0);
}

@Concurrent
export function testUint8ArrayTaskPool0093(): undefined | number {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8Array.from(arrayLike);
  return array.find((index: number) => index == 10);
}

@Concurrent
export function testUint8ArrayTaskPool0094(): boolean {
  let arrayLike = [0, 1, 2, 3, 4];
  let array = collections.Uint8Array.from(arrayLike);
  let condition = (element: number) => element > 0;
  let filtered = array.filter(condition);
  let found = array.find(condition);
  return found == filtered[0];
}

@Concurrent
export function testUint8ArrayTaskPool0095(): number {
  let array: collections.Uint8Array = collections.Uint8Array.from([]);
  return array.findIndex((element: number) => element % 2 === 0);
}

@Concurrent
export function testUint8ArrayTaskPool0096(): number {
  const array: collections.Uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  return array.findIndex((element: number) => element % 2 === 0);
}

@Concurrent
export function testUint8ArrayTaskPool0097(): number {
  const array: collections.Uint8Array = collections.Uint8Array.from([1, 3, 5]);
  return array.findIndex((element: number) => element % 2 === 0);
}

@Concurrent
export function testUint8ArrayTaskPool0098(): boolean {
  let uint8Array = collections.Uint8Array.from([]);
  let res = false;
  uint8Array.forEach(() => {
    res = true;
  });
  let res1 = uint8Array.length === 0;
  let res2 = res === false;
  return res1 && res2;
}

@Concurrent
export function testUint8ArrayTaskPool0099(): boolean {
  let uint8Array = collections.Uint8Array.from([1, 2, 3]);
  let res = false;
  uint8Array.forEach((value, index, array) => {
    res = true;
  });
  console.error(`${uint8Array.length} failed, error: ${uint8Array.toString()},${res}`);
  let res1 = uint8Array.length === 3;
  let  res2 = uint8Array.toString() === '1,2,3';
  return res1 && res2 && res;
}

@Concurrent
export function testUint8ArrayTaskPool0100(): boolean {
  let uint8Array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  uint8Array.set([5, 6], 2);
  let res = false;
  uint8Array.forEach((value, index, array) => {
    res = true;
  });
  let res1 = uint8Array.length === 5;
  let  res2 = uint8Array.toString() === '1,2,5,6,5';
  return res1 && res2 && res;
}

@Concurrent
export function testUint8ArrayTaskPool0101(): number {
  let array = collections.Uint8Array.from([]);
  return array.indexOf(3);
}

@Concurrent
export function testUint8ArrayTaskPool0102(): number {
  let array = collections.Uint8Array.from([1, 2, 3]);
  return array.indexOf(4);
}

@Concurrent
export function testUint8ArrayTaskPool0103(): number {
  let array = collections.Uint8Array.from([1, 2, 3]);
  array.set([4, 5], 1);
  return array.indexOf(4);
}

@Concurrent
export function testUint8ArrayTaskPool0104(): number {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, -1);
}

@Concurrent
export function testUint8ArrayTaskPool0105(): number {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, 5);
}

@Concurrent
export function testUint8ArrayTaskPool0106(): number {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3);
}

@Concurrent
export function testUint8ArrayTaskPool0107(): number {
  let array = collections.Uint8Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, 3);
}

@Concurrent
export function testUint8ArrayTaskPool0108(): number {
  let array = collections.Uint8Array.from([1, 2, 4, 3, 5, 3, 6, 3, 3]);
  return array.indexOf(3, 9);
}

@Concurrent
export function testUint8ArrayTaskPool0109(): string {
  let array = collections.Uint8Array.from([]);
  return array.join('');
}

@Concurrent
export function testUint8ArrayTaskPool0110(): string {
  let array = collections.Uint8Array.from([]);
  return array.join('-');
}

@Concurrent
export function testUint8ArrayTaskPool0111(): string {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  return array.join();
}

@Concurrent
export function testUint8ArrayTaskPool0112(): string {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  return array.join('');
}

@Concurrent
export function testUint8ArrayTaskPool0113(): string {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  return array.join(undefined);
}

@Concurrent
export function testUint8ArrayTaskPool0114(): string {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  return array.join('/');
}

@Concurrent
export function testUint8ArrayTaskPool0115(): string {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  return array.join(',。￥·');
}

@Concurrent
export function testUint8ArrayTaskPool0116(): string {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  return array.join('녕하こんйте');
}

@Concurrent
export function testUint8ArrayTaskPool0117(): string {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  return array.join('，');
}

@Concurrent
export function testUint8ArrayTaskPool0118(): string {
  let array = new collections.Uint8Array([]);
  const mapped = array.map(Math.sqrt);
  return mapped.toString();
}

@Concurrent
export function testUint8ArrayTaskPool0119(): boolean {
  let array = new collections.Uint8Array([25, 36, 49]);
  const mapped = array.map(Math.sqrt);
  let res1 = mapped.toString() === "5,6,7";
  let res2 = mapped.length === 3;
  return res1 && res2;
}

@Concurrent
export function testUint8ArrayTaskPool0120(): boolean {
  let array = new collections.Uint8Array([25, 36, 49, 100, 256]);
  array.set([81, 64], 2);
  const mapped = array.map(Math.sqrt);
  let res1 = mapped.toString() === "5,6,9,8,0";
  let res2 = mapped.length === 5;
  return res1 && res2;
}

@Concurrent
export function testUint8ArrayTaskPool0121(): string {
  let errorMessage = "";
  try {
    let array = collections.Uint8Array.from([]);
    array.reduce((accumulator: number, value: number) => accumulator + value);
  } catch (err) {
    errorMessage = err.message;
  }
  return "error";
}

@Concurrent
export function testUint8ArrayTaskPool0122(): number {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  return array.reduce((accumulator: number, value: number, index: number) => {
    let newAccumulator = accumulator + value;
    return newAccumulator;
  });
}

@Concurrent
export function testUint8ArrayTaskPool0123(): number {
  const array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  const initialAccumulator = 8;
  return array.reduce((accumulator: number, value: number, index: number) => {
    const newAccumulator = accumulator + value;
    return newAccumulator;
  }, initialAccumulator);
}

@Concurrent
export function testUint8ArrayTaskPool0124(): string {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  let initialValue = "initialValue";
  return array.reduce((accumulator: string, value: number) => accumulator + value, initialValue);
}

@Concurrent
export function testUint8ArrayTaskPool0125(): string {
  let array = collections.Uint8Array.from([]);
  return array.reverse().toString();
}

@Concurrent
export function testUint8ArrayTaskPool0126(): string {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  return array.reverse().toString();
}

@Concurrent
export function testUint8ArrayTaskPool0127(): boolean {
  let array = collections.Uint8Array.from([1, 2, 3, 4, 5]);
  let reversed = array.reverse();
  const expectedValues = [5, 4, 3, 2, 1];
  let res = false;
