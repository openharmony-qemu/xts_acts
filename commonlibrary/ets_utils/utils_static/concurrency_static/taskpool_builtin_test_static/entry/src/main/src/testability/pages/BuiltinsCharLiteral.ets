'use static';
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


export function testCharSingle(): void {
  const caseName = 'testCharSingle';
  try {
    console.log(`${caseName} test start`);
    let char1 = 'a';
    if (char1 !== 'a') { throw new Error(`${caseName} single char mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testCharArray(): void {
  const caseName = 'testCharArray';
  try {
    console.log(`${caseName} test start`);
    let charArray = ['b', 'c', 'd'];
    if (charArray[0] !== 'b') { throw new Error(`${caseName} array[0] mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}


interface CharObj { charProp: string }
export function testCharInObj(): void {
  const caseName = 'testCharInObj';
  try {
    console.log(`${caseName} test start`);
    let charObj: CharObj = { charProp: 'e' };
    if (charObj.charProp !== 'e') { throw new Error(`${caseName} obj.prop mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testCharNestedArray(): void {
  const caseName = 'testCharNestedArray';
  try {
    console.log(`${caseName} test start`);
    let nestedCharArray = [['g'], ['h']];
    if (nestedCharArray[0][0] !== 'g') { throw new Error(`${caseName} nested array mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testCharTernary(): void {
  const caseName = 'testCharTernary';
  try {
    console.log(`${caseName} test start`);
    let charTernary = true ? 'i' : 'j';
    if (charTernary !== 'i') { throw new Error(`${caseName} ternary mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testCharLogicAnd(): void {
  const caseName = 'testCharLogicAnd';
  try {
    console.log(`${caseName} test start`);
    let charAnd = 'm' && 'n';
    if (charAnd !== 'n') { throw new Error(`${caseName} logicAnd mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testCharSet(): void {
  const caseName = 'testCharSet';
  try {
    console.log(`${caseName} test start`);
    let charSet = new Set<string>(['t']);
    if (charSet.has('t') !== true) { throw new Error(`${caseName} set.has mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testCharMap(): void {
  const caseName = 'testCharMap';
  try {
    console.log(`${caseName} test start`);
    let charMap = new Map<string,string>([['u', 'value']]);
    if (charMap.get('u') !== 'value') { throw new Error(`${caseName} map.get mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testCharConcat(): void {
  const caseName = 'testCharConcat';
  try {
    console.log(`${caseName} test start`);
    let charA: 'a' = 'a';
    let charB: 'b' = 'b';
    let concatResult = charA + charB;
    if (concatResult !== 'ab') { throw new Error(`${caseName} concat mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}


export function testCharToUpper(): void {
  const caseName = 'testCharToUpper';
  try {
    console.log(`${caseName} test start`);
    let charLower: 'x' = 'x';
    let charUpper = charLower.toUpperCase();
    if (charUpper !== 'X') { throw new Error(`${caseName} toUpper mismatch`); }
    console.log(`${caseName} test end`);
  } catch (err) {
    console.error(`${caseName} catch error: ${err.message}`);
    throw new Error(`${caseName} failed.`);
  }
}