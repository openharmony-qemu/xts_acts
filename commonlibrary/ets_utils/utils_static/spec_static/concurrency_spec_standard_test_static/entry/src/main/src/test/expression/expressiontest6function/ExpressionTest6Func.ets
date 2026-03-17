'use static'

/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/


export function ExpressionTest0906() {
  const TAG = 'ExpressionTest0906';
  let numArray: int[] = [1, 2, 3, 4, 5];
  let numVar: int = 1;
  let result: int = 0;
  while (numVar <= numArray.length * 0.6) {
    result += numArray[numVar];
    numVar++;
  }
  if (result !== 9) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 9');
  }
}

export function ExpressionTest0907() {
  const TAG = 'ExpressionTest0907';
  let numArray: int[] = [14, 6, 22, 8, 28];
  let numVar: int = 0;
  for (let i: int = 0; i < numArray.length; i++) {
    if (numArray[i] > 10 && numArray[i] % 7 === 0) {
      numVar += numArray[i];
    }
  }
  if (numVar !== 14 + 28) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 14 + 28');
  }
}

export function ExpressionTest0908() {
  const TAG = 'ExpressionTest0908';
  let numArray: int[] = [4, 15, 7, 21, 3];
  let boolVar: boolean = false;
  for (let i: int = 0; i < numArray.length; i++) {
    boolVar = boolVar || numArray[i] < 5 || numArray[i] === 21;
  }
  if (!boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not true');
  }
}

export function ExpressionTest0909() {
  const TAG = 'ExpressionTest0909';
  let numVar: number = 50;
  numVar %= 13;
  numVar += 7;
  numVar %= 5;
  numVar *= 4;
  if (numVar !== 12) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 12');
  }
}

export function ExpressionTest0910() {
  const TAG = 'ExpressionTest0910';
  let numArray: int[] = [0, 1, 2, 3, 4, 5, 6, 7];
  let i: int = 5;
  let j: int = 2;
  let strVar: string = `${i} & ${j} = ${i & j}, arr[${i & j}] = ${numArray[i & j]}`;
  if (strVar !== "5 & 2 = 0, arr[0] = 0") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected 5 & 2 = 0, arr[0] = 0');
  }
}

export function ExpressionTest0911() {
  const TAG = 'ExpressionTest0911';
  let numArray: int[] = [100, 200, 300, 400, 500];
  let numVar: int = 4;
  let result: int = numArray[--numVar] - --numVar;
  if (result !== 398) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 398');
  }
}

export function ExpressionTest0912() {
  const TAG = 'ExpressionTest0912';
  let numArray: int[] = [5, 10, 15, 20, 25];
  let numVar: int = 1;
  let result: int = numArray[numVar++] + numArray[numVar++];
  if (result !== 25) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 25');
  }

  if (numVar !== 3) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 3');
  }
}

export function ExpressionTest0913() {
  const TAG = 'ExpressionTest0913';
  let numArray: int[] = [2, 4, 6, 8, 10];
  let otherArray: int[] = [1, 3, 5, 7, 9];
  let numVar: int = 0;
  let i: int, j: int;
  for (i = 0, j = otherArray.length - 1; i < numArray.length; i++, j--) {
    numVar += numArray[i] * otherArray[j];
  }
  if (numVar !== 2 * 9 + 4 * 7 + 6 * 5 + 8 * 3 + 10 * 1) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 2 * 9 + 4 * 7 + 6 * 5 + 8 * 3 + 10 * 1');
  }
}

export function ExpressionTest0914() {
  const TAG = 'ExpressionTest0914';
  let strArray: string[] = ["Hello", "WORLD", "hello", "world"];
  let strVar: string = "hello";
  let numVar: int = 0;
  for (let i: int = 0; i < strArray.length; i++) {
    if (strArray[i].toLowerCase() === strVar) {
      numVar++;
    }
  }
  if (numVar !== 2) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 2');
  }
}

export function ExpressionTest0915() {
  const TAG = 'ExpressionTest0915';
  let numArray: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  let results: number[] = [];
  for (let i: number = 0; i < numArray.length; i++) {
    results.push(i % 3);
  }
  const target: number[] = [0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2];
  if (JSON.stringify(results) !== JSON.stringify(target)) {
    console.info(`${TAG} Task execution failed: results: ${results}`);
    throw new Error('results does not deeply equal target');
  }
}

export function ExpressionTest0917() {
  const TAG = 'ExpressionTest0917';
  let numArray: int[] = [18, -7, 12, -5];
  let results: int[] = [];
  for (let i: int = 0; i < numArray.length; i += 2) {
    results.push(numArray[i] | numArray[i + 1]);
  }
  if (JSON.stringify(results) !== JSON.stringify([18 | -7, 12 | -5])) {
    console.info(`${TAG} Task execution failed: results: ${results}`);
    throw new Error('results does not deeply equal [18 | -7, 12 | -5]');
  }
}

export function ExpressionTest0918() {
  const TAG = 'ExpressionTest0918';
  let strArray: string[] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"];
  let numVar: int = 5;
  let index: int = (numVar * 2) - (numVar / 2);
  let strVar: string = strArray[index];
  if (strVar !== "i") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected i');
  }
}

export function ExpressionTest0920() {
  const TAG = 'ExpressionTest0920';
  let numArray: int[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
  let numVar: int = 3;
  let result: int = numArray[numVar << 1];
  if (result !== 70) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 70');
  }
}

export function ExpressionTest0921() {
  const TAG = 'ExpressionTest0921';
  let numArray: number[] = [37, 10, 5, 3];
  let strVar: string = numArray[0] + " mod " + numArray[1] + " = " + (numArray[0] % numArray[1]) +
    ", then mod " + numArray[2] + " = " + ((numArray[0] % numArray[1]) % numArray[2]) +
    ", then mod " + numArray[3] + " = " + (((numArray[0] % numArray[1]) % numArray[2]) % numArray[3]);
  if (strVar !== "37 mod 10 = 7, then mod 5 = 2, then mod 3 = 2") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected 37 mod 10 = 7, then mod 5 = 2, then mod 3 = 2');
  }
}

export function ExpressionTest0922() {
  const TAG = 'ExpressionTest0922';
  let numArray: number[] = [20, 5, 3];
  let result1: number = numArray[0] / numArray[1] + numArray[2];
  let result2: number = numArray[0] / (numArray[1] + numArray[2]);
  if (result1 !== 4 + 3) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 4 + 3');
  }

  if (result2 !== 20.0 / 8) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 20.0 / 8');
  }
}

export function ExpressionTest0923() {
  const TAG = 'ExpressionTest0923';
  let numArray: int[] = [12, 4, 6, 2];
  let i: int = 0;
  let j: int = 2;
  let strVar: string = `${numArray[i]} / ${numArray[1]} = ${numArray[i] /
  numArray[1]}, (${numArray[i]} + ${numArray[j]}) / ${numArray[3]} = ${(numArray[i] + numArray[j]) / numArray[3]}`;
  if (strVar !== "12 / 4 = 3, (12 + 6) / 2 = 9") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected 12 / 4 = 3, (12 + 6) / 2 = 9');
  }
}

export function ExpressionTest0924() {
  const TAG = 'ExpressionTest0924';
  let numArray: int[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
  let numVar: int = 2;
  let start: int = numVar;
  let end: int = numArray.length - numVar;
  let subArray: int[] = numArray.slice(start, end);
  numVar = 0;
  for (let i: int = 0; i < subArray.length; i++) {
    numVar += subArray[i];
  }
  if (numVar !== 30 + 40 + 50 + 60 + 70 + 80) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 30 + 40 + 50 + 60 + 70 + 80');
  }
}

export function ExpressionTest0925() {
  const TAG = 'ExpressionTest0925';
  let strArray: string[] = ["18", "7"];
  let strVar: string = `-${strArray[0]} + ${strArray[1]} = ${-+Number(strArray[0]) + +Number(strArray[1])}`;
  if (strVar !== "-18 + 7 = -11") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected -18 + 7 = -11');
  }
}

export function ExpressionTest0926() {
  const TAG = 'ExpressionTest0926';
  let numArray: number[] = [6, 3];
  let boolVar: boolean = ~numArray[0] < ~numArray[1];
  if (!boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not true');
  }
}

export function ExpressionTest0927() {
  const TAG = 'ExpressionTest0927';
  let numVar: number = 180;
  numVar /= 3; // 60
  numVar -= 15; // 45
  numVar /= 5; // 9
  numVar *= 2; // 18
  if (numVar !== 18) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 18');
  }
}

export function ExpressionTest0928() {
  const TAG = 'ExpressionTest0928';
  let numArray: int[] = [3, 6, 9, 12, 15, 18, 21, 24, 27, 30];
  let filtered: int[] = [];
  for (let i: int = 0; i < numArray.length; i++) {
    if (numArray[i] > 10 && (numArray[i] % 4 === 0 || numArray[i] % 7 === 0)) {
      filtered.push(numArray[i]);
    }
  }
  if (JSON.stringify(filtered) !== JSON.stringify([12, 21, 24])) {
    console.info(`${TAG} Task execution failed: filtered: ${filtered}`);
    throw new Error('filtered does not deeply equal [12, 21, 24]');
  }
}

export function ExpressionTest0929() {
  const TAG = 'ExpressionTest0929';
  let numArray: int[] = [41, 53, 67, 79];
  let numVar: int = 0;
  for (let i: int = 0; i < numArray.length; i++) {
    if (numArray[i] % 6 === 5 && numArray[i] % 5 === 4) {
      numVar = numArray[i];
      break;
    }
  }
  if (numVar !== 0) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 0');
  }
}

export function ExpressionTest0930() {
  const TAG = 'ExpressionTest0930';
  let strArray: string[] = ["Monday", "Tuesday", "Wednesday", "Thursday"];
  let numVar: int = 2;
  let strVar: string = strArray[numVar] + " has " + strArray[numVar].length + " letters, " +
    "next day: " + strArray[numVar + 1] + " (" + strArray[numVar + 1].length + " letters)";
  if (strVar !== "Wednesday has 9 letters, next day: Thursday (8 letters)") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected Wednesday has 9 letters, next day: Thursday (8 letters)');
  }
}

export function ExpressionTest0931() {
  const TAG = 'ExpressionTest0931';
  let numArray: number[] = [4, 3, 64];
  let boolVar: boolean = numArray[0]**numArray[1] === numArray[2];
  // 4^3 = 64
  if (!boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not true');
  }
}

export function ExpressionTest0932() {
  const TAG = 'ExpressionTest0932';
  let numArray: number[] = [2.5, 3.5, 4.5, 5.5];
  let strVar: string = `Sum: ${numArray[0] + numArray[1] + numArray[2] + numArray[3]}, ` +
    `Average: ${(numArray[0] + numArray[1] + numArray[2] + numArray[3]) / numArray.length}`;
  if (strVar !== "Sum: 16, Average: 4") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected Sum: 16, Average: 4');
  }
}

export function ExpressionTest0933() {
  const TAG = 'ExpressionTest0933';
  let numArray: number[] = [1, 2, 3, 4];
  let numVar: number = numArray.length << 2;
  // 4 << 2 = 16
  if (numVar !== 16) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 16');
  }
}

export function ExpressionTest0934() {
  const TAG = 'ExpressionTest0934';
  let strArray: string[] = ["zero", "one", "two", "three", "four", "five", "six", "seven"];
  let numVar: int = 7 & 3;
  let strVar: string = strArray[numVar];
  if (strVar !== "three") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected three');
  }
}

export function ExpressionTest0935() {
  const TAG = 'ExpressionTest0935';
  let numArray: number[] = [6, 12, 18, 24, 30];
  let numVar: int = 3;
  let strVar: string =
    `arr[${numVar}] = ${numArray[numVar]}, arr[${numVar}] / ${numVar} = ${numArray[numVar] / numVar}`;
  if (strVar !== "arr[3] = 24, arr[3] / 3 = 8") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected arr[3] = 24, arr[3] / 3 = 8');
  }
}

export function ExpressionTest0936() {
  const TAG = 'ExpressionTest0936';
  let numArray: number[] = [5, 10, 15, 20, 25];
  let numVar: number = 3;
  let boolVar: boolean = numArray.length === numVar + 2;
  // 5 === 3 + 2 → true
  if (!boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not true');
  }
}

export function ExpressionTest0937() {
  const TAG = 'ExpressionTest0937';
  let numArray: int[] = [8, 16, 24, 32, 40, 48];
  let numVar: int = 20;
  let strVar: string = "Numbers >= " + numVar + " and even: ";
  let first: boolean = true;
  for (let i: int = 0; i < numArray.length; i++) {
    if (numArray[i] >= numVar && numArray[i] % 2 === 0) {
      strVar += (first ? "" : ", ") + numArray[i];
      first = false;
    }
  }
  if (strVar !== "Numbers >= 20 and even: 24, 32, 40, 48") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected Numbers >= 20 and even: 24, 32, 40, 48');
  }
}

export function ExpressionTest0938() {
  const TAG = 'ExpressionTest0938';
  let numArray: int[] = [15, 25, 35, 45, 55];
  let numVar: int = 0;
  let min: int = 20;
  let max: int = 50;
  for (let i: int = 0; i < numArray.length; i++) {
    if (numArray[i] > min && numArray[i] < max) {
      numVar += numArray[i];
    }
  }
  if (numVar !== 25 + 35 + 45) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 25 + 35 + 45');
  }
}

export function ExpressionTest0939() {
  const TAG = 'ExpressionTest0939';
  let numArray: number[] = [1, 2, 3, 4, 5];
  let numVar: number = (numArray.length * 2) ^ 0x0F;
  if (numVar !== 5) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 5');
  }
}

export function ExpressionTest0940() {
  const TAG = 'ExpressionTest0940';
  let numArray: int[] = [45, 55, 65, 75, 85, 95];
  let strVar: string = "";
  for (let i: int = 0; i < numArray.length; i++) {
    strVar += numArray[i] >= 90 ? "Excellent " :
      numArray[i] >= 70 ? "Good " :
        numArray[i] >= 50 ? "Average " : "Poor ";
  }
  if (strVar !== "Poor Average Average Good Good Excellent ") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected Poor Average Average Good Good Excellent ');
  }
}

export function ExpressionTest0941() {
  const TAG = 'ExpressionTest0941';
  let numArray: int[] = [2, 4, 6, 8, 10];
  let transformed: int[] = [];
  let i: int, factor: int;
  for (i = 0, factor = 3; i < numArray.length; i++, factor -= 1) {
    transformed.push(numArray[i] * factor);
  }
  if (JSON.stringify(transformed) !== JSON.stringify([2 * 3, 4 * 2, 6 * 1, 8 * 0, 10 * (-1)])) {
    console.info(`${TAG} Task execution failed: transformed: ${transformed}`);
    throw new Error('transformed does not deeply equal [2 * 3, 4 * 2, 6 * 1, 8 * 0, 10 * (-1)]');
  }
}

export function ExpressionTest0942() {
  const TAG = 'ExpressionTest0942';
  let strArray: string[] = ["apple", "apples", "apricot", "application"];
  let strVar: string = "apple";
  let numVar: int = 0;
  for (let i: int = 0; i < strArray.length; i++) {
    if (strArray[i].startsWith(strVar) && strArray[i].length > strVar.length) {
      numVar++;
    }
  }
  if (numVar !== 1) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 1');
  }
}

export function ExpressionTest0943() {
  const TAG = 'ExpressionTest0943';
  let numArray: number[] = [8, 3, 5, 2];
  let numVar: number = ~numArray[0] + (-numArray[1]) * numArray[2] + ~numArray[3];
  // -9 + (-3)*5 + (-3) = -9 - 15 - 3 = -27
  if (numVar !== -27) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected -27');
  }
}

export function ExpressionTest0944() {
  const TAG = 'ExpressionTest0944';
  let numArray: int[] = [0b1101, 0b1011, 0b0111, 0b1110];
  let mask: int = 0b1001;
  let numVar: int = 0;
  for (let i: int = 0; i < numArray.length; i++) {
    if ((numArray[i] & mask) === mask) {
      numVar++;
    }
  }
  // Only 0b1101 & 0b1001 = 0b1001
  if (numVar !== 2) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}`);
    throw new Error('numVar check failed, expected 2');
  }
}

export function ExpressionTest0945() {
  const TAG = 'ExpressionTest0945';
  let numArray: number[] = [];
  let numVar: number = 2;
  for (let i: number = 0; i < 5; i++) {
    numArray.push(numVar);
    numVar *= 2;
  }
  const target: number[] = [2, 4, 8, 16, 32];
  if (JSON.stringify(numArray) !== JSON.stringify(target)) {
    console.info(`${TAG} Task execution failed: numArray: ${numArray}`);
    throw new Error('numArray does not deeply equal target');
  }
}

export function ExpressionTest0946() {
  const TAG = 'ExpressionTest0946';
  let numArray: number[] = [24, 4, 8, 12];
  let boolVar: boolean = (numArray[0] / numArray[1]) >= (numArray[2] + numArray[3]);
  // 6 >= 20 is false
  if (boolVar) {
    console.info(`${TAG} Task execution failed: boolVar: ${boolVar}`);
    throw new Error('boolVar is not false');
  }
}

export function ExpressionTest0947() {
  const TAG = 'ExpressionTest0947';
  let numArray: int[] = [5, 10, 15, 20, 25, 30, 35, 40];
  let filtered: int[] = [];
  let i: int, threshold: int;
  for (i = 0, threshold = 10; i < numArray.length; i++, threshold += 5) {
    if (numArray[i] > 10 && i !== 1 && i !== 3 && i !== 5) {
      filtered.push(numArray[i]);
    }
  }
  if (JSON.stringify(filtered) !== JSON.stringify([15, 25, 35, 40])) {
    console.info(`${TAG} Task execution failed: filtered: ${filtered}`);
    throw new Error('filtered does not deeply equal [15, 25, 35, 40]');
  }
}

export function ExpressionTest0948() {
  const TAG = 'ExpressionTest0948';
  let strArray: string[] = ["Q1", "Q2", "Q3", "Q4", "Q1", "Q2"];
  let numVar: int = 3;
  let strVar: string = strArray[numVar] + " + 2 quarters = " + strArray[(numVar + 2) % strArray.length];
  if (strVar !== "Q4 + 2 quarters = Q2") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected Q4 + 2 quarters = Q2');
  }
}

export function ExpressionTest0949() {
  const TAG = 'ExpressionTest0949';
  let strArray: string[] = ["9.5", "2.5", "3"];
  let numVar: number = +Number(strArray[0]) / +Number(strArray[1]) - +Number(strArray[2]);
  if (Math.abs(numVar - (9.5 / 2.5 - 3)) > 0.001) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}, expected: 9.5 / 2.5 - 3, delta: 0.001`);
    throw new Error('numVar is not close to 9.5 / 2.5 - 3 (within 0.001)');
  }
}

export function ExpressionTest0950() {
  const TAG = 'ExpressionTest0950';
  let numArray: int[] = [5, 10, 15, 20, 25];
  let numVar: number = 0;
  let i: int;
  let multiplier: number;
  for (i = 0, multiplier = 1; i < numArray.length; i++, multiplier += 0.5) {
    numVar += numArray[i] * multiplier;
  }
  if (Math.abs(numVar - (5 * 1 + 10 * 1.5 + 15 * 2 + 20 * 2.5 + 25 * 3)) > 0.001) {
    console.info(`${TAG} Task execution failed: numVar: ${numVar}, expected: 5 * 1 + 10 * 1.5 + 15 * 2 + 20 * 2.5 + 25 * 3, delta: 0.001`);
    throw new Error('numVar is not close to 5 * 1 + 10 * 1.5 + 15 * 2 + 20 * 2.5 + 25 * 3 (within 0.001)');
  }
}

export function ExpressionTest0951() {
  const TAG = 'ExpressionTest0951';
  let base: number = -3;
  let exponent: number = 4;
  let result: number = base**exponent;
  if (result !== 81) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 81');
  }
}

export function ExpressionTest0952() {
  const TAG = 'ExpressionTest0952';
  let num1: number = 5; // 101
  let num2: number = 2;
  let result: number = (num1 << num2) + 3; // 10100 + 11 = 10111 (23)
  if (result !== 23) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 23');
  }
}

export function ExpressionTest0954() {
  const TAG = 'ExpressionTest0954';
  let dividend: number = -17;
  let divisor: number = 5;
  let result: number = dividend % divisor;
  if (result !== -2) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -2');
  }
}

export function ExpressionTest0955() {
  const TAG = 'ExpressionTest0955';
  let str: string = "TypeScript";
  let len: number = str.length;
  let strVar: string = `${str.substring(4)} has ${len - 4} letters (original: ${len})`;
  if (strVar !== "Script has 6 letters (original: 10)") {
    console.info(`${TAG} Task execution failed: strVar: ${strVar}`);
    throw new Error('strVar check failed, expected Script has 6 letters (original: 10)');
  }
}

export function ExpressionTest0956() {
  const TAG = 'ExpressionTest0956';
  let arr: int[] = [10, 20, 30, 40, 50];
  let index: int = 2;
  let result: int = arr[++index] - arr[index--];
  if (result !== 0) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 0');
  }

  if (index !== 2) {
    console.info(`${TAG} Task execution failed: index: ${index}`);
    throw new Error('index check failed, expected 2');
  }
}

export function ExpressionTest0957() {
  const TAG = 'ExpressionTest0957';
  let arr: string[] = ["a", "b", "c", "d", "e", "f", "g", "h"];
  let num: int = 14;
  let result: string = arr[num >> 2];
  if (result !== "d") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected d');
  }
}

export function ExpressionTest0958() {
  const TAG = 'ExpressionTest0958';
  let x: number = 12; // 1100
  let y: number = 5; // 0101
  let result: number = x ^ y; // 1001 (9)
  y++; // 6 (0110)
  result += x ^ y; // 1100 ^ 0110 = 1010 (10) → total 19
  if (result !== 19) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 19');
  }
}

export function ExpressionTest0959() {
  const TAG = 'ExpressionTest0959';
  let num: number = 25; // 11001
  num &= 15; // 11001 & 01111 = 01001 (9)
  num &= 10; // 01001 & 01010 = 01000 (8)
  if (num !== 8) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 8');
  }
}

export function ExpressionTest0960() {
  const TAG = 'ExpressionTest0960';
  let a: number = 18;
  let b: number = 7;
  let str: string = a + " divided by " + b + " is " + Math.floor(a / b) +
    " with remainder " + (a % b);
  if (str !== "18 divided by 7 is 2 with remainder 4") {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected 18 divided by 7 is 2 with remainder 4');
  }
}

export function ExpressionTest0961() {
  const TAG = 'ExpressionTest0961';
  let val1: number | null = 0;
  let val2: number | null = null;
  let val3: number | undefined = undefined;
  let val4: number | null = 10;

  let result: number = (val1 ?? 5) + (val2 ?? 5) + (val3 ?? 5) + (val4 ?? 5);
  if (result !== 0 + 5 + 5 + 10) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 0 + 5 + 5 + 10');
  }
}

export function ExpressionTest0962() {
  const TAG = 'ExpressionTest0962';
  let words: string[] = ["apple", "Banana", "cherry", "Date", "elderberry"];
  let count: int = 0;
  for (let i: int = 0; i < words.length; i++) {
    if (words[i].length > 6 || words[i][0] === words[i][0].toUpperCase()) {
      count++;
    }
  }
  if (count !== 3) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 3');
  }
}

export function ExpressionTest0963() {
  const TAG = 'ExpressionTest0963';
  let num: number = 2;
  num **= 3; // 8
  num **= 2; // 64
  if (num !== 64) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 64');
  }
}

export function ExpressionTest0964() {
  const TAG = 'ExpressionTest0964';
  let x: number = 10;
  let y: number = 5;
  let result: number = x-- + --y;
  // Uses x=10, then x becomes 9; uses y=4 (after decrement)
  if (result !== 14) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 14');
  }

  if (x !== 9) {
    console.info(`${TAG} Task execution failed: x: ${x}`);
    throw new Error('x check failed, expected 9');
  }

  if (y !== 4) {
    console.info(`${TAG} Task execution failed: y: ${y}`);
    throw new Error('y check failed, expected 4');
  }
}

export function ExpressionTest0965() {
  const TAG = 'ExpressionTest0965';
  let a: number = 15;
  let b: number = 25;
  let str: string = `${a} > ${b}: ${a > b}, ${a} * 2 <= ${b}: ${a * 2 <= b}`;
  if (str !== "15 > 25: false, 15 * 2 <= 25: false") {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected 15 > 25: false, 15 * 2 <= 25: false');
  }
}

export function ExpressionTest0966() {
  const TAG = 'ExpressionTest0966';
  let x: number = 5;
  let y: number = 10;
  let result: number;
  if (x > 3) {
    x++;
    y *= 2;
    result = x + y;
  } else {
    result = 0;
  }
  // x becomes 6, y becomes 20, result is 6 + 20 = 26
  if (result !== 26) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 26');
  }
}

export function ExpressionTest0967() {
  const TAG = 'ExpressionTest0967';
  let num: number = 8;
  let result: number = ~num + 16 / 2;
  // -9 + 8 = -1
  if (result !== -1) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -1');
  }
}

export function ExpressionTest0968() {
  const TAG = 'ExpressionTest0968';
  let str: string = "Programming";
  let len: int = str.length;
  let mid: number = len / 2.0;
  let result: string = str[Math.floor(mid).toInt()] + str[Math.ceil(mid).toInt()];
  if (result !== "am") {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected am');
  }
}

export function ExpressionTest0969() {
  const TAG = 'ExpressionTest0969';
  let num: number = 40;
  num -= 15; // 25
  num *= 3; // 75
  num -= 25; // 50
  if (num !== 50) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 50');
  }
}

export function ExpressionTest0970() {
  const TAG = 'ExpressionTest0970';
  let arr: number[] = [];
  let i: number = 1;
  while (i % 17 !== 0) {
    arr.push(i * 2);
    i++;
  }
  if (arr.length !== 16) {
    console.info(`${TAG} Task execution failed: arr.length: ${arr.length}`);
    throw new Error('arr.length check failed, expected 16');
  }

  if (arr[arr.length - 1] !== 32) {
    console.info(`${TAG} Task execution failed: arr[arr.length - 1]: ${arr[arr.length - 1]}`);
    throw new Error('arr[arr.length - 1] check failed, expected 32');
  }
}

export function ExpressionTest0971() {
  const TAG = 'ExpressionTest0971';
  let a: number = 7;
  let b: number = 12;
  let c: number = 7;

  let result1: boolean = !(a > b);
  let result2: boolean = !(a === c);

  if (!result1) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 is not true');
  }

  if (result2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 is not false');
  }
}

export function ExpressionTest0972() {
  const TAG = 'ExpressionTest0972';
  let num: number = 0b1010; // 10
  num |= 0b0111; // 10 | 7 = 15 (1111)
  num |= 0b1100; // 15 | 12 = 15 (1111)
  if (num !== 15) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 15');
  }
}

export function ExpressionTest0973() {
  const TAG = 'ExpressionTest0973';
  let temp: number = 28;
  let str: string = "The temperature is " + temp + "°C, which is " +
    (temp > 30 ? "hot" : temp > 20 ? "warm" : "cool");
  if (str !== "The temperature is 28°C, which is warm") {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected The temperature is 28°C, which is warm');
  }
}

export function ExpressionTest0974() {
  const TAG = 'ExpressionTest0974';
  let a: number = 5;
  let b: number = 3;
  let c: number = 2;

  let result1: number = a + b * c;
  let result2: number = (a + b) * c;
  let result3: number = a / b + c;

  if (result1 !== 11) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 11');
  }

  if (result2 !== 16) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 16');
  }

  if (Math.abs(result3 - (5.0 / 3 + 2)) > 0.001) {
    console.info(`${TAG} Task execution failed: result3: ${result3}, expected: 5.0 / 3 + 2, delta: 0.001`);
    throw new Error('result3 is not close to 5.0 / 3 + 2 (within 0.001)');
  }
}

export function ExpressionTest0975() {
  const TAG = 'ExpressionTest0975';
  let x: number = 10;
  let y: number = 4;

  let result: number = (x + y) * (x - y) / (y * 2);
  // (14) * (6) / 8 = 84 / 8 = 10.5
  if (result !== 10.5) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 10.5');
  }
}

export function ExpressionTest0976() {
  const TAG = 'ExpressionTest0976';
  let arr: string[] = ["a", "b", "c", "d", "e", "f", "g"];
  let start: int = 2;
  let count: int = 3;
  let subArr: string[] = arr.slice(start, start + count);
  if (JSON.stringify(subArr) !== JSON.stringify(["c", "d", "e"])) {
    console.info(`${TAG} Task execution failed: subArr: ${subArr}`);
    throw new Error('subArr does not deeply equal ["c", "d", "e"]');
  }
}

export function ExpressionTest0977() {
  const TAG = 'ExpressionTest0977';
  let a: number = 12;
  let b: number = 5;
  let str: string = `-${a} + ${b} = ${-a + b}, ${a} - ${b} * 2 = ${a - b * 2}`;
  if (str !== "-12 + 5 = -7, 12 - 5 * 2 = 2") {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected -12 + 5 = -7, 12 - 5 * 2 = 2');
  }
}

export function ExpressionTest0978() {
  const TAG = 'ExpressionTest0978';
  let x: number = 10;
  let y: number = 3;
  let result: boolean = ~x > ~y;
  // -11 > -4 is false
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0979() {
  const TAG = 'ExpressionTest0979';
  let num: number = 100;
  num /= 4; // 25
  num += 15; // 40
  num /= 8; // 5
  num *= 3; // 15
  if (num !== 15) {
    console.info(`${TAG} Task execution failed: num: ${num}`);
    throw new Error('num check failed, expected 15');
  }
}

export function ExpressionTest0980() {
  const TAG = 'ExpressionTest0980';
  let arr: int[] = [14, 22, 28, 35, 42, 50, 63, 70];
  let filtered: int[] = [];
  for (let i: int = 0; i < arr.length; i++) {
    if ((arr[i] % 7 === 0 || arr[i] % 5 === 0) && arr[i] > 30) {
      filtered.push(arr[i]);
    }
  }
  if (JSON.stringify(filtered) !== JSON.stringify([35, 42, 50, 63, 70])) {
    console.info(`${TAG} Task execution failed: filtered: ${filtered}`);
    throw new Error('filtered does not deeply equal [35, 42, 50, 63, 70]');
  }
}

export function ExpressionTest0981() {
  const TAG = 'ExpressionTest0981';
  let numbers: int[] = [31, 43, 59, 71, 83];
  let result: int = 0;
  for (let i: int = 0; i < numbers.length; i++) {
    if (numbers[i] % 4 === 3 && numbers[i] % 6 === 5) {
      result = numbers[i];
      break;
    }
  }
  if (result !== 59) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 59');
  }
}

export function ExpressionTest0982() {
  const TAG = 'ExpressionTest0982';
  let words: string[] = ["Elephant", "Giraffe", "Hippopotamus", "Zebra"];
  let longest: string = "";
  for (let i: int = 0; i < words.length; i++) {
    if (words[i].length > longest.length) {
      longest = words[i];
    }
  }
  let str: string = "Longest word: " + longest + " (" + longest.length + " letters)";
  if (str !== "Longest word: Hippopotamus (12 letters)") {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected Longest word: Hippopotamus (12 letters)');
  }
}

export function ExpressionTest0983() {
  const TAG = 'ExpressionTest0983';
  let base: number = 5;
  let exp1: number = 3;
  let exp2: number = 2;
  let result: boolean = base**exp1 > base**exp2 * base;
  // 125 > 25 * 5 → 125 > 125 → false
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0984() {
  const TAG = 'ExpressionTest0984';
  let radius: number = 5;
  let pi: number = Math.PI;
  let area: number = pi * radius**2;
  let str: string = `Circle with radius ${radius} has area ~${Math.round(area)} (exact: ${area.toFixed(2)})`;
  if (str !== `Circle with radius 5 has area ~79 (exact: 78.54)`) {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected `Circle with radius 5 has area ~79 (exact: 78.54)`');
  }
}

export function ExpressionTest0985() {
  const TAG = 'ExpressionTest0985';
  let arr: number[] = [1, 2, 3, 4, 5, 6, 7];
  let len: number = arr.length; // 7
  let result: number = len << 1 | 3; // 14 | 3 = 15
  if (result !== 15) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 15');
  }
}

export function ExpressionTest0986() {
  const TAG = 'ExpressionTest0986';
  let colors: string[] = ["red", "green", "blue", "yellow", "purple", "orange", "pink"];
  let index: int = 10 & 5;
  if (colors[index] !== "red") {
    console.info(`${TAG} Task execution failed: colors[index]: ${colors[index]}`);
    throw new Error('colors[index] check failed, expected red');
  }
}

export function ExpressionTest0987() {
  const TAG = 'ExpressionTest0987';
  let arr: int[] = [10, 20, 30, 40, 50, 60];
  let x: int = 3;
  let y: int = 2;
  let str: string = `arr[${x}] * ${y} = ${arr[x] * y}, arr[${x - y}] = ${arr[x - y]}`;
  if (str !== "arr[3] * 2 = 80, arr[1] = 20") {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected arr[3] * 2 = 80, arr[1] = 20');
  }
}

export function ExpressionTest0988() {
  const TAG = 'ExpressionTest0988';
  let arr: string[] = ["a", "b", "c", "d", "e"];
  let threshold: number = 3;
  let result: boolean = arr.length - 1 > threshold;
  // 4 > 3 → true
  if (!result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not true');
  }
}

export function ExpressionTest0989() {
  const TAG = 'ExpressionTest0989';
  let scores: number[] = [85, 92, 78, 95, 88];
  let minPass: int = 80;
  let report: string = "Passed: ";
  let first: boolean = true;
  for (let i: int = 0; i < scores.length; i++) {
    if (scores[i] >= minPass) {
      report += (first ? "" : ", ") + scores[i];
      first = false;
    }
  }
  if (report !== "Passed: 85, 92, 95, 88") {
    console.info(`${TAG} Task execution failed: report: ${report}`);
    throw new Error('report check failed, expected Passed: 85, 92, 95, 88');
  }
}

export function ExpressionTest0990() {
  const TAG = 'ExpressionTest0990';
  let values: int[] = [12, 24, 36, 48, 60, 72];
  let total: int = 0;
  let lower: int = 20;
  let upper: int = 60;
  for (let i: int = 0; i < values.length; i++) {
    if (values[i] > lower && values[i] < upper) {
      total += values[i] / 12;
    }
  }
  // 24/12 + 36/12 + 48/12 = 2 + 3 + 4 = 9
  if (total !== 9) {
    console.info(`${TAG} Task execution failed: total: ${total}`);
    throw new Error('total check failed, expected 9');
  }
}

export function ExpressionTest0991() {
  const TAG = 'ExpressionTest0991';
  let arr: number[] = [10, 20, 30, 40];
  let len: number = arr.length; // 4
  let result: number = (len * 3) ^ 5; // 12 ^ 5 = 9
  if (result !== 9) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 9');
  }
}

export function ExpressionTest0992() {
  const TAG = 'ExpressionTest0992';
  let value: number = 75;
  let category: string = value >= 90 ? "Expert" :
    value >= 70 ? "Advanced" :
      value >= 50 ? "Intermediate" : "Beginner";
  if (category !== "Advanced") {
    console.info(`${TAG} Task execution failed: category: ${category}`);
    throw new Error('category check failed, expected Advanced');
  }
}

export function ExpressionTest0993() {
  const TAG = 'ExpressionTest0993';
  let numbers: int[] = [3, 6, 9, 12, 15];
  let transformed: number[] = [];
  let i: int, factor: number;
  for (i = 0, factor = 1; i < numbers.length; i++, factor += 0.5) {
    transformed.push(numbers[i] * factor);
  }
  const target: number[] = [3 * 1, 6 * 1.5, 9 * 2, 12 * 2.5, 15 * 3];
  if (JSON.stringify(transformed) !== JSON.stringify(target)) {
    console.info(`${TAG} Task execution failed: transformed: ${transformed}`);
    throw new Error('transformed does not deeply equal target');
  }
}

export function ExpressionTest0994() {
  const TAG = 'ExpressionTest0994';
  let words: string[] = ["apple", "applet", "application", "applause", "apply"];
  let prefix: string = "app";
  let count: int = 0;
  for (let i: int = 0; i < words.length; i++) {
    if (words[i].startsWith(prefix) && words[i].length > prefix.length + 2) {
      count++;
    }
  }
  if (count !== 3) {
    console.info(`${TAG} Task execution failed: count: ${count}`);
    throw new Error('count check failed, expected 3');
  }
}

export function ExpressionTest0995() {
  const TAG = 'ExpressionTest0995';
  let a: number = 10;
  let b: number = 3;
  let c: number = 2;
  let result: number = ~a + (-b) * c + ~~(a / b);
  // -11 + (-3)*2 + 3 = -11 - 6 + 3 = -14
  if (result !== -14) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -14');
  }
}

export function ExpressionTest0996() {
  const TAG = 'ExpressionTest0996';
  let numbers: int[] = [0b1011, 0b1101, 0b1110, 0b0111];
  let mask: int = 0b1011;
  let result: int = 0;
  for (let i: int = 0; i < numbers.length; i++) {
    if ((numbers[i] & mask) === mask) {
      result += numbers[i];
    }
  }
  // Only 0b1011 & 0b1010 = 0b1010
  if (result !== 0b1011) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 0b1011');
  }
}

export function ExpressionTest0997() {
  const TAG = 'ExpressionTest0997';
  let arr: number[] = [];
  let num: number = 16;
  while (num >= 1) {
    arr.push(num);
    num /= 2;
  }
  const target: number[] = [16, 8, 4, 2, 1];
  if (JSON.stringify(arr) !== JSON.stringify(target)) {
    console.info(`${TAG} Task execution failed: arr: ${arr}`);
    throw new Error('arr does not deeply equal target');
  }
}

export function ExpressionTest0998() {
  const TAG = 'ExpressionTest0998';
  let a: number = 18;
  let b: number = 5;
  let c: number = 7;
  let result: boolean = (a % b) * 2 > c;
  // (3) * 2 > 7 → 6 > 7 → false
  if (result) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result is not false');
  }
}

export function ExpressionTest0999() {
  const TAG = 'ExpressionTest0999';
  let values: int[] = [12, 24, 36, 48, 60, 72, 84];
  let filtered: int[] = [];
  let i: int, divisor: int;
  for (i = 0, divisor = 5; i < values.length; i++, divisor++) {
    if (values[i] % divisor === 0) {
      filtered.push(values[i]);
    }
  }
  if (JSON.stringify(filtered) !== JSON.stringify([24, 48])) {
    console.info(`${TAG} Task execution failed: filtered: ${filtered}`);
    throw new Error('filtered does not deeply equal [24, 48]');
  }
}

export function ExpressionTest1000() {
  const TAG = 'ExpressionTest1000';
  let months: string[] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  let current: int = 10;
  let next: int = (current + 2) % 12;
  let str: string = months[current] + " + 2 months = " + months[next];
  if (str !== "Nov + 2 months = Jan") {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected Nov + 2 months = Jan');
  }
}

export function ExpressionTest1001() {
  const TAG = 'ExpressionTest1001';
  let maxVal: number = Number.MAX_VALUE;
  let result: number = maxVal + 1;
  // Adding 1 to MAX_VALUE still equals MAX_VALUE

  if (result !== maxVal) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected maxVal');
  }

  result = maxVal * 2;
  if (result !== Infinity) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected Infinity');
  }
}

export function ExpressionTest1002() {
  const TAG = 'ExpressionTest1002';
  let minVal: number = Number.MIN_VALUE;
  let result: number = minVal / 2;
  // Dividing MIN_VALUE by 2 underflows to 0

  result = minVal * 0.5;
  if (result !== 0) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 0');
  }

  if (result !== 0) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected 0');
  }
}

export function ExpressionTest1003() {
  const TAG = 'ExpressionTest1003';
  let a: number = -17;
  let b: number = 5;
  let result1: number = a % b; // -2
  let result2: number = a % -b; // -2
  let result3: number = -a % b; // 2

  if (result1 !== -2) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected -2');
  }

  if (result2 !== -2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected -2');
  }

  if (result3 !== 2) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected 2');
  }
}

export function ExpressionTest1004() {
  const TAG = 'ExpressionTest1004';
  let a: number = -5;
  let b: number = 0;

  let result1: number = a / b; // -Infinity
  let result2: number = b / a; // 0
  let result3: number = -a / b; // Infinity

  if (result1 !== -Infinity) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected -Infinity');
  }

  if (result2 !== 0) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 0');
  }

  if (result3 !== Infinity) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected Infinity');
  }
}

export function ExpressionTest1005() {
  const TAG = 'ExpressionTest1005';
  let nanVal: number = NaN;
  let num: number = 10;

  let result1: number = nanVal + num;
  let result2: number = num - nanVal;
  let result3: number = nanVal * num;
  let result4: number = num / nanVal;

  if (!isNaN(result1)) {
    console.info(`${TAG} Task execution failed: isNaN(result1): ${isNaN(result1)}`);
    throw new Error('isNaN(result1) is not true');
  }

  if (!isNaN(result2)) {
    console.info(`${TAG} Task execution failed: isNaN(result2): ${isNaN(result2)}`);
    throw new Error('isNaN(result2) is not true');
  }

  if (!isNaN(result3)) {
    console.info(`${TAG} Task execution failed: isNaN(result3): ${isNaN(result3)}`);
    throw new Error('isNaN(result3) is not true');
  }

  if (!isNaN(result4)) {
    console.info(`${TAG} Task execution failed: isNaN(result4): ${isNaN(result4)}`);
    throw new Error('isNaN(result4) is not true');
  }
}

export function ExpressionTest1006() {
  const TAG = 'ExpressionTest1006';
  let minInt: int = -2147483648;
  let result1: int = minInt >> 1;
  let result2: int = minInt << 1;
  if (result1 !== -1073741824) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected -1073741824');
  }

  if (result2 !== 0) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 0');
  }
}

export function ExpressionTest1007() {
  const TAG = 'ExpressionTest1007';
  let inf: number = Infinity;
  let negInf: number = -Infinity;
  let num: number = -5;

  let result1: number = inf + negInf; // NaN
  let result2: number = inf * num; // -Infinity
  let result3: number = negInf / num; // Infinity

  if (!isNaN(result1)) {
    console.info(`${TAG} Task execution failed: isNaN(result1): ${isNaN(result1)}`);
    throw new Error('isNaN(result1) is not true');
  }

  if (result2 !== -Infinity) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected -Infinity');
  }

  if (result3 !== Infinity) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected Infinity');
  }
}

export function ExpressionTest1008() {
  const TAG = 'ExpressionTest1008';
  let nanVal: number = NaN;
  let num: number = 0;

  let result1: boolean = nanVal === nanVal; // false
  let result2: boolean = nanVal < num; // false
  let result3: boolean = nanVal > num; // false
  let result4: boolean = isNaN(nanVal); // true

  if (result1) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 is not false');
  }

  if (result2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 is not false');
  }

  if (result3) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 is not false');
  }

  if (!result4) {
    console.info(`${TAG} Task execution failed: result4: ${result4}`);
    throw new Error('result4 is not true');
  }
}

export function ExpressionTest1009() {
  const TAG = 'ExpressionTest1009';
  let baseNumber: number = -8.0;
  let exponent: number = 1.0 / 3; // Cube root

  let result: number = baseNumber**exponent;
  // In JavaScript, this results in NaN for negative bases with fractional exponents
  if (!isNaN(result)) {
    console.info(`${TAG} Task execution failed: isNaN(result): ${isNaN(result)}`);
    throw new Error('isNaN(result) is not true');
  }
}

export function ExpressionTest1010() {
  const TAG = 'ExpressionTest1010';
  let zero: number = 0.0;
  let negZero: number = -0.0;

  let result1: number = zero + negZero;
  let result2: number = zero * negZero;
  let result3: number = 1 / negZero;

  if (result1 !== 0) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 0');
  }

  if (1 / result2 !== -Infinity) {
    console.info(`${TAG} Task execution failed: 1 / result2: ${1 / result2}`);
    throw new Error('1 / result2 check failed, expected -Infinity');
  }

  if (result3 !== -Infinity) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected -Infinity');
  }
}

export function ExpressionTest1011() {
  const TAG = 'ExpressionTest1011';
  let maxVal: number = Number.MAX_VALUE;
  let minVal: number = Number.MIN_VALUE;
  let inf: number = Infinity;

  let result1: number = -maxVal; // Negative maximum value
  let result2: number = -minVal; // Negative minimum value
  let result3: number = -inf; // -Infinity

  if (result1 !== -maxVal) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected -maxVal');
  }

  if (result2 !== -minVal) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected -minVal');
  }

  if (result3 !== -Infinity) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected -Infinity');
  }
}

export function ExpressionTest1012() {
  const TAG = 'ExpressionTest1012';
  let maxInt: number = 2147483647; // Maximum 32-bit signed integer
  let minInt: number = -2147483648; // Minimum 32-bit signed integer

  let result1: number = ~maxInt; // -2147483648
  let result2: number = ~minInt; // 2147483647

  if (result1 !== minInt) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected minInt');
  }

  if (result2 !== maxInt) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected maxInt');
  }
}

export function ExpressionTest1013() {
  const TAG = 'ExpressionTest1013';
  let inf: number = Infinity;
  let negInf: number = -Infinity;
  let largeNeg: number = -1e308;

  let result1: boolean = negInf < largeNeg; // true
  let result2: boolean = inf > -largeNeg; // true
  let result3: boolean = negInf === -inf; // true

  if (!result1) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 is not true');
  }

  if (!result2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 is not true');
  }

  if (!result3) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 is not true');
  }
}

export function ExpressionTest1014() {
  const TAG = 'ExpressionTest1014';
  let nanVal: number = NaN;
  let num: number = 10;

  let result1: number = nanVal ? 1 : 0; // 0 (NaN is falsy)
  let result2: number = isNaN(nanVal) ? num : 0; // 10

  if (result1 !== 0) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 0');
  }

  if (result2 !== 10) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 10');
  }
}

export function ExpressionTest1015() {
  const TAG = 'ExpressionTest1015';
  let arr: int[] = [1, 2, 3, 4, 5];
  let len: int = arr.length;
  let result3: int | undefined = arr[len - 1];
  let e: Error | undefined;
  try {
    let result1: int | undefined = arr[len];
  } catch (err) {
    e = err;
  }
  if (result3 !== 5) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected 5');
  }

  if (e && e.name !== "RangeError") {
    console.info(`${TAG} Task execution failed: e.name: ${e.name}`);
    throw new Error('e.name check failed, expected RangeError');
  }
}

export function ExpressionTest1016() {
  const TAG = 'ExpressionTest1016';
  let tinyNeg: number = -Number.MIN_VALUE;
  let result1: number = 1 / tinyNeg;
  let result2: number = tinyNeg / 2;

  if (result1 !== -Infinity) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected -Infinity');
  }

  if (1 / result2 !== -Infinity) {
    console.info(`${TAG} Task execution failed: 1 / result2: ${1 / result2}`);
    throw new Error('1 / result2 check failed, expected -Infinity');
  }
}

export function ExpressionTest1017() {
  const TAG = 'ExpressionTest1017';
  let inf: number = Infinity;
  let num: number = 10;
  let negNum: number = -5;

  let result1: number = inf % num; // NaN
  let result2: number = num % inf; // 10
  let result3: number = negNum % inf; // -5

  if (!isNaN(result1)) {
    console.info(`${TAG} Task execution failed: isNaN(result1): ${isNaN(result1)}`);
    throw new Error('isNaN(result1) is not true');
  }

  if (result2 !== 10) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 10');
  }

  if (result3 !== -5) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected -5');
  }
}

export function ExpressionTest1018() {
  const TAG = 'ExpressionTest1018';
  let inf: number = Infinity;
  let negInf: number = -Infinity;
  let num: number = 2;

  let result1: number = inf**num; // Infinity
  let result2: number = inf**-num; // 0
  let result3: number = negInf**num; // Infinity

  if (result1 !== Infinity) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected Infinity');
  }

  if (result2 !== 0) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 0');
  }

  if (result3 !== Infinity) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected Infinity');
  }
}

export function ExpressionTest1019() {
  const TAG = 'ExpressionTest1019';
  let nanVal: number = NaN;
  let num: number = 0b1010;

  let result1: number = nanVal & num; // 0 (NaN treated as 0 in bitwise ops)
  let result2: number = nanVal | num; // 10 (0b1010)
  let result3: number = nanVal ^ num; // 10 (0b1010)

  if (result1 !== 0) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 0');
  }

  if (result2 !== 10) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 10');
  }

  if (result3 !== 10) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected 10');
  }
}

export function ExpressionTest1020() {
  const TAG = 'ExpressionTest1020';
  let inf: number = Infinity;
  let negInf: number = -Infinity;
  let nanVal: number = NaN;

  let result1: string = inf + ""; // "Infinity"
  let result2: string = negInf + ""; // "-Infinity"
  let result3: string = nanVal + ""; // "NaN"

  if (result1 !== "Infinity") {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected Infinity');
  }

  if (result2 !== "-Infinity") {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected -Infinity');
  }

  if (result3 !== "NaN") {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected NaN');
  }
}

export function ExpressionTest1021() {
  const TAG = 'ExpressionTest1021';
  let maxSafe: number = Number.MAX_SAFE_INTEGER;

  let result1: number = maxSafe + 1; // Still accurate
  let result2: number = maxSafe + 2; // May lose precision
  let result3: number = maxSafe * 2; // Loses precision

  if (result1 !== 9007199254740992) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 9007199254740992');
  }

  if (result2 !== 9007199254740993) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 9007199254740993');
  }

  if (result3 !== 18014398509481982) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected 18014398509481982');
  }
}

export function ExpressionTest1022() {
  const TAG = 'ExpressionTest1022';
  let minSafe: number = Number.MIN_SAFE_INTEGER;

  let result1: number = minSafe - 1; // Still accurate
  let result2: number = minSafe - 2; // May lose precision

  if (result1 !== -9007199254740992) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected -9007199254740992');
  }

  if (result2 !== -9007199254740993) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected -9007199254740993');
  }
}

export function ExpressionTest1023() {
  const TAG = 'ExpressionTest1023';
  let maxVal: number = Number.MAX_VALUE;
  let minVal: number = Number.MIN_VALUE;
  let inf: number = Infinity;

  let result1: number = maxVal++;
  let result2: number = ++maxVal;
  let result3: number = --minVal;
  let result4: number = inf++;

  if (result1 !== Number.MAX_VALUE) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected Number.MAX_VALUE');
  }

  if (result2 !== Number.MAX_VALUE) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected Number.MAX_VALUE');
  }

  if (1 / result3 !== -1) {
    console.info(`${TAG} Task execution failed: 1 / result3: ${1 / result3}`);
    throw new Error('1 / result3 check failed, expected -1');
  }

  if (result4 !== Infinity) {
    console.info(`${TAG} Task execution failed: result4: ${result4}`);
    throw new Error('result4 check failed, expected Infinity');
  }
}

export function ExpressionTest1024() {
  const TAG = 'ExpressionTest1024';
  let nanVal: number = NaN;
  let inf: number = Infinity;
  let negInf: number = -Infinity;

  let result1: boolean = Boolean(nanVal) && true;
  let result2: boolean = Boolean(inf) || false;
  let result3: boolean = !Boolean(negInf);
  if (result1) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 is not false');
  }

  if (!result2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 is not true');
  }

  if (result3) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 is not false');
  }
}

export function ExpressionTest1025() {
  const TAG = 'ExpressionTest1025';
  let zero: number = 0.0;
  let negZero: number = -0.0;

  let result1: boolean = zero === negZero;
  let result2: boolean = 1 / zero === 1 / negZero;
  let result3: boolean = zero < negZero;

  if (!result1) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 is not true');
  }

  if (result2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 is not false');
  }

  if (result3) {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 is not false');
  }
}

export function ExpressionTest1026() {
  const TAG = 'ExpressionTest1026';
  let maxArrayLength: number = 2**32 - 1;
  let arr: number[] = [1, 2, 3];
  let result1: boolean = arr.length < maxArrayLength;
  let result2: number = maxArrayLength + 1;
  if (!result1) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 is not true');
  }

  if (result2 !== 4294967296) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 4294967296');
  }
}

export function ExpressionTest1027() {
  const TAG = 'ExpressionTest1027';
  let largeNeg: number = -1e300;
  let divisor: number = 1e299;
  let result: number = largeNeg % divisor;
  if (result !== -0) {
    console.info(`${TAG} Task execution failed: result: ${result}`);
    throw new Error('result check failed, expected -0');
  }
}

export function ExpressionTest1028() {
  const TAG = 'ExpressionTest1028';
  let nanVal: number = NaN;
  let inf: number = Infinity;
  let str: string = `Calculation result: ${nanVal}, Limit: ${inf}`;
  if (str !== "Calculation result: NaN, Limit: Infinity") {
    console.info(`${TAG} Task execution failed: str: ${str}`);
    throw new Error('str check failed, expected Calculation result: NaN, Limit: Infinity');
  }
}

export function ExpressionTest1029() {
  const TAG = 'ExpressionTest1029';
  let maxInt: int = 2147483647;
  let shift: int = 31;
  let result1: int = 1 << shift;
  let result2: int = maxInt << 1;
  if (result1 !== -2147483648) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected -2147483648');
  }

  if (result2 !== -2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected -2');
  }
}

export function ExpressionTest1030() {
  const TAG = 'ExpressionTest1030';
  let inf: number = Infinity;
  let negNum: number = -5;
  let negSmall: number = -0.0001;

  let result1: number = inf / negNum;
  let result2: number = inf / negSmall;
  let result3: number = negNum / inf;

  if (result1 !== -Infinity) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected -Infinity');
  }

  if (result2 !== -Infinity) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected -Infinity');
  }

  if (1 / result3 !== -Infinity) {
    console.info(`${TAG} Task execution failed: 1 / result3: ${1 / result3}`);
    throw new Error('1 / result3 check failed, expected -Infinity');
  }
}

export function ExpressionTest1031() {
  const TAG = 'ExpressionTest1031';
  let inf: number = Infinity;
  let negInf: number = -Infinity;
  let nanVal: number = NaN;

  let result1: string = inf > 1e308 ? "Large" : "Small";
  let result2: string = negInf < -1e308 ? "Small" : "Large";
  let result3: string = isNaN(nanVal) ? "Invalid" : "Valid";

  if (result1 !== "Large") {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected Large');
  }

  if (result2 !== "Small") {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected Small');
  }

  if (result3 !== "Invalid") {
    console.info(`${TAG} Task execution failed: result3: ${result3}`);
    throw new Error('result3 check failed, expected Invalid');
  }
}

export function ExpressionTest1032() {
  const TAG = 'ExpressionTest1032';
  let base: number = -2;
  let exp1: number = -3;
  let exp2: number = -4;

  let result1: number = base**exp1;
  let result2: number = base**exp2;

  if (result1 !== -0.125) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected -0.125');
  }

  if (result2 !== 0.0625) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected 0.0625');
  }
}

export function ExpressionTest1033() {
  const TAG = 'ExpressionTest1033';
  let num: number = 17;
  let negDiv: number = -5;

  let result1: number = num % negDiv;
  let result2: number = -num % negDiv;

  if (result1 !== 2) {
    console.info(`${TAG} Task execution failed: result1: ${result1}`);
    throw new Error('result1 check failed, expected 2');
  }

  if (result2 !== -2) {
    console.info(`${TAG} Task execution failed: result2: ${result2}`);
    throw new Error('result2 check failed, expected -2');
  }
}

