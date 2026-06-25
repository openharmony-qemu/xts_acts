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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, taskpool } from '@kit.ArkTS';
import {
  gc,
  longRunningTask,
  SendableClass,
  SendableSharedArray,
  SendableSharedCounter,
  SendableSharedMap,
  testErrorHandling
} from './model/SendableModel';

function asyncSleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve()
    }, time)
  })
}

@Concurrent
function testConcurrentCounterRW(counter: SendableSharedCounter): void {
  for (let i = 0; i < 10; i++) {
    try {
      counter.counter = counter.counter + 1;
      counter.operationCount = counter.operationCount + 1;
      counter.lastValue = counter.counter;
      let value = counter.counter;
      counter.counter = counter.counter - 1;
      counter.counter = counter.counter + value;
    } catch (e) {
      console.info('testConcurrentCounterRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentArrayRW(arr: SendableSharedArray): void {
  for (let i = 0; i < 10; i++) {
    try {
      arr.array.push(new SendableSharedCounter());
      arr.addCount = arr.addCount + 1;
      if (arr.array.length > 0) {
        let element = arr.array[arr.array.length - 1];
        if (element) {
          element.counter = i;
        }
      }
      arr.array.pop();
      arr.array.find(item => item.counter > 10);
      arr.removeCount = arr.removeCount + 1;
      let length = arr.array.length;
      for (let j = 0; j < length; j++) {
        let item = arr.array[j];
        if (item) {
          item.counter = item.counter + 1;
        }
      }
    } catch (e) {
      console.info('testConcurrentArrayRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentMapRW(mapObj: SendableSharedMap): void {
  for (let i = 0; i < 10; i++) {
    try {
      mapObj.map.set(i, new SendableClass(i));
      mapObj.setCount = mapObj.setCount + 1;
      let element = mapObj.map.get(i);
      if (element) {
        element.value = element.value + 100;
      }
      mapObj.map.has(i);
      mapObj.map.delete(i);
      mapObj.deleteCount = mapObj.deleteCount + 1;
      mapObj.map.forEach((value: SendableClass, key: number) => {
        value.value = value.value + 1;
      });
      for (let entry of mapObj.map.entries()) {
        entry[1].value = entry[1].value + 1;
      }
      for (let key of mapObj.map.keys()) {
        mapObj.map.has(key);
      }
      for (let value of mapObj.map.values()) {
        value.value = value.value + 1;
      }
      mapObj.map.clear();
    } catch (e) {
      console.info('testConcurrentMapRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentComplexRW(counter: SendableSharedCounter, arr: SendableSharedArray,
  mapObj: SendableSharedMap): void {
  for (let i = 0; i < 10; i++) {
    try {
      counter.counter = counter.counter + 1;
      arr.array.push(new SendableSharedCounter());
      mapObj.map.set(i, new SendableClass(i));
      if (arr.array.length > 5) {
        arr.array.pop();
      }
      if (mapObj.map.size > 5) {
        mapObj.map.delete(i - 5);
      }
    } catch (e) {
      console.info('testConcurrentComplexRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentInt8ArrayRW(typedArr: collections.Int8Array): void {
  for (let i = 0; i < 10; i++) {
    try {
      for (let j = 0; j < typedArr.length; j++) {
        typedArr[j] = typedArr[j] + 1;
      }
      let len = typedArr.length;
      let sliced = typedArr.slice(0, Math.floor(len / 2));
      typedArr.set(sliced, 0);
      let sub = typedArr.subarray(0, Math.floor(len / 2));
      for (let k = 0; k < sub.length; k++) {
        sub[k] = sub[k] + 1;
      }
      typedArr.fill(0, 0, Math.floor(len / 4));
      typedArr.fill(100, Math.floor(len / 4), Math.floor(len / 2));
      typedArr.copyWithin(0, Math.floor(len / 2), len);
      let everyResult = typedArr.every(val => val >= 0);
      let someResult = typedArr.some(val => val > 50);
      let findResult = typedArr.find(val => val > 10);
      let findIdxResult = typedArr.findIndex(val => val > 10);
      let filterArr = typedArr.filter(val => val > 0);
      let mapArr = typedArr.map(val => val * 2);
      typedArr.forEach(val => {
        let v = val;
      });
      let idxOfResult = typedArr.indexOf(0, 0);
      let lastIdxOfResult = typedArr.lastIndexOf(0, len - 1);
      let includesResult = typedArr.includes(0, 0);
      let joined = typedArr.join(',');
      let reduced = typedArr.reduce((prev, cur) => prev + cur, 0);
      typedArr.sort((a, b) => a - b);
      typedArr.reverse();
      let atResult = typedArr.at(0);
      let atResult2 = typedArr.at(-1);
      for (let entry of typedArr.entries()) {
        let k = entry[0];
        let v = entry[1];
      }
      for (let key of typedArr.keys()) {
        let k = key;
      }
      for (let val of typedArr.values()) {
        let v = val;
      }
      for (let val of typedArr) {
        let v = val;
      }
    } catch (e) {
      console.info('testConcurrentInt8ArrayRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentInt32ArrayRW(typedArr: collections.Int32Array): void {
  for (let i = 0; i < 10; i++) {
    try {
      for (let j = 0; j < typedArr.length; j++) {
        typedArr[j] = typedArr[j] + 1;
      }
      let len = typedArr.length;
      let buffer = typedArr.buffer;
      let byteLen = typedArr.byteLength;
      let byteOff = typedArr.byteOffset;
      let bytesPerElem = collections.Int32Array.BYTES_PER_ELEMENT;
      let sliced = typedArr.slice(0, Math.floor(len / 2));
      typedArr.set(sliced, 0);
      let sub = typedArr.subarray(0, Math.floor(len / 2));
      for (let k = 0; k < sub.length; k++) {
        sub[k] = sub[k] + 1;
      }
      typedArr.fill(0, 0, Math.floor(len / 4));
      typedArr.fill(100, Math.floor(len / 4), Math.floor(len / 2));
      typedArr.copyWithin(0, Math.floor(len / 2), len);
      let everyResult = typedArr.every(val => val >= 0);
      let someResult = typedArr.some(val => val > 50);
      let findResult = typedArr.find(val => val > 10);
      let findIdxResult = typedArr.findIndex(val => val > 10);
      let filterArr = typedArr.filter(val => val > 0);
      let mapArr = typedArr.map(val => val * 2);
      typedArr.forEach(val => {
        let v = val;
      });
      let idxOfResult = typedArr.indexOf(0, 0);
      let lastIdxOfResult = typedArr.lastIndexOf(0, len - 1);
      let includesResult = typedArr.includes(0, 0);
      let joined = typedArr.join(',');
      let reduced = typedArr.reduce((prev, cur) => prev + cur, 0);
      typedArr.sort((a, b) => a - b);
      typedArr.reverse();
      let atResult = typedArr.at(0);
      let atResult2 = typedArr.at(-1);
      for (let entry of typedArr.entries()) {
        let k = entry[0];
        let v = entry[1];
      }
      for (let key of typedArr.keys()) {
        let k = key;
      }
      for (let val of typedArr.values()) {
        let v = val;
      }
      for (let val of typedArr) {
        let v = val;
      }
    } catch (e) {
      console.info('testConcurrentInt32ArrayRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentFloat32ArrayRW(typedArr: collections.Float32Array): void {
  for (let i = 0; i < 10; i++) {
    try {
      for (let j = 0; j < typedArr.length; j++) {
        typedArr[j] = typedArr[j] + 1.0;
      }
      let len = typedArr.length;
      let sliced = typedArr.slice(0, Math.floor(len / 2));
      typedArr.set(sliced, 0);
      let sub = typedArr.subarray(0, Math.floor(len / 2));
      for (let k = 0; k < sub.length; k++) {
        sub[k] = sub[k] + 1;
      }
      typedArr.fill(0, 0, Math.floor(len / 4));
      typedArr.fill(100, Math.floor(len / 4), Math.floor(len / 2));
      typedArr.copyWithin(0, Math.floor(len / 2), len);
      let everyResult = typedArr.every(val => val >= 0);
      let someResult = typedArr.some(val => val > 50);
      let findResult = typedArr.find(val => val > 10);
      let findIdxResult = typedArr.findIndex(val => val > 10);
      let filterArr = typedArr.filter(val => val > 0);
      let mapArr = typedArr.map(val => val * 2);
      typedArr.forEach(val => {
        let v = val;
      });
      let idxOfResult = typedArr.indexOf(0, 0);
      let lastIdxOfResult = typedArr.lastIndexOf(0, len - 1);
      let includesResult = typedArr.includes(0, 0);
      let joined = typedArr.join(',');
      let reduced = typedArr.reduce((prev, cur) => prev + cur, 0);
      typedArr.sort((a, b) => a - b);
      typedArr.reverse();
      let atResult = typedArr.at(0);
      let atResult2 = typedArr.at(-1);
      for (let entry of typedArr.entries()) {
        let k = entry[0];
        let v = entry[1];
      }
      for (let key of typedArr.keys()) {
        let k = key;
      }
      for (let val of typedArr.values()) {
        let v = val;
      }
      for (let val of typedArr) {
        let v = val;
      }
    } catch (e) {
      console.info('testConcurrentFloat32ArrayRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentArrayBufferRW(buffer: collections.ArrayBuffer): void {
  for (let i = 0; i < 10; i++) {
    try {
      let view = new collections.Int32Array(buffer);
      for (let j = 0; j < view.length; j++) {
        view[j] = view[j] + 1;
      }
      let len = view.length;
      let sliced = view.slice(0, len / 2);
      view.set(sliced, 0);
    } catch (e) {
      console.info('testConcurrentArrayBufferRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentUint8ArrayRW(typedArr: collections.Uint8Array): void {
  for (let i = 0; i < 10; i++) {
    try {
      for (let j = 0; j < typedArr.length; j++) {
        typedArr[j] = typedArr[j] + 1;
      }
      let len = typedArr.length;
      let sliced = typedArr.slice(0, Math.floor(len / 2));
      typedArr.set(sliced, 0);
      let sub = typedArr.subarray(0, Math.floor(len / 2));
      for (let k = 0; k < sub.length; k++) {
        sub[k] = sub[k] + 1;
      }
      typedArr.fill(0, 0, Math.floor(len / 4));
      typedArr.fill(100, Math.floor(len / 4), Math.floor(len / 2));
      typedArr.copyWithin(0, Math.floor(len / 2), len);
      let everyResult = typedArr.every(val => val >= 0);
      let someResult = typedArr.some(val => val > 50);
      let findResult = typedArr.find(val => val > 10);
      let findIdxResult = typedArr.findIndex(val => val > 10);
      let filterArr = typedArr.filter(val => val > 0);
      let mapArr = typedArr.map(val => val * 2);
      typedArr.forEach(val => {
        let v = val;
      });
      let idxOfResult = typedArr.indexOf(0, 0);
      let lastIdxOfResult = typedArr.lastIndexOf(0, len - 1);
      let includesResult = typedArr.includes(0, 0);
      let joined = typedArr.join(',');
      let reduced = typedArr.reduce((prev, cur) => prev + cur, 0);
      typedArr.sort((a, b) => a - b);
      typedArr.reverse();
      let atResult = typedArr.at(0);
      let atResult2 = typedArr.at(-1);
      for (let entry of typedArr.entries()) {
        let k = entry[0];
        let v = entry[1];
      }
      for (let key of typedArr.keys()) {
        let k = key;
      }
      for (let val of typedArr.values()) {
        let v = val;
      }
      for (let val of typedArr) {
        let v = val;
      }
    } catch (e) {
      console.info('testConcurrentUint8ArrayRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentUint32ArrayRW(typedArr: collections.Uint32Array): void {
  for (let i = 0; i < 10; i++) {
    try {
      for (let j = 0; j < typedArr.length; j++) {
        typedArr[j] = typedArr[j] + 1;
      }
      let len = typedArr.length;
      let sliced = typedArr.slice(0, Math.floor(len / 2));
      typedArr.set(sliced, 0);
      let sub = typedArr.subarray(0, Math.floor(len / 2));
      for (let k = 0; k < sub.length; k++) {
        sub[k] = sub[k] + 1;
      }
      typedArr.fill(0, 0, Math.floor(len / 4));
      typedArr.fill(100, Math.floor(len / 4), Math.floor(len / 2));
      typedArr.copyWithin(0, Math.floor(len / 2), len);
      let everyResult = typedArr.every(val => val >= 0);
      let someResult = typedArr.some(val => val > 50);
      let findResult = typedArr.find(val => val > 10);
      let findIdxResult = typedArr.findIndex(val => val > 10);
      let filterArr = typedArr.filter(val => val > 0);
      let mapArr = typedArr.map(val => val * 2);
      typedArr.forEach(val => {
        let v = val;
      });
      let idxOfResult = typedArr.indexOf(0, 0);
      let lastIdxOfResult = typedArr.lastIndexOf(0, len - 1);
      let includesResult = typedArr.includes(0, 0);
      let joined = typedArr.join(',');
      let reduced = typedArr.reduce((prev, cur) => prev + cur, 0);
      typedArr.sort((a, b) => a - b);
      typedArr.reverse();
      let atResult = typedArr.at(0);
      let atResult2 = typedArr.at(-1);
      for (let entry of typedArr.entries()) {
        let k = entry[0];
        let v = entry[1];
      }
      for (let key of typedArr.keys()) {
        let k = key;
      }
      for (let val of typedArr.values()) {
        let v = val;
      }
      for (let val of typedArr) {
        let v = val;
      }
    } catch (e) {
      console.info('testConcurrentUint32ArrayRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentInt16ArrayRW(typedArr: collections.Int16Array): void {
  for (let i = 0; i < 10; i++) {
    try {
      for (let j = 0; j < typedArr.length; j++) {
        typedArr[j] = typedArr[j] + 1;
      }
      let len = typedArr.length;
      let sliced = typedArr.slice(0, Math.floor(len / 2));
      typedArr.set(sliced, 0);
      let sub = typedArr.subarray(0, Math.floor(len / 2));
      for (let k = 0; k < sub.length; k++) {
        sub[k] = sub[k] + 1;
      }
      typedArr.fill(0, 0, Math.floor(len / 4));
      typedArr.fill(100, Math.floor(len / 4), Math.floor(len / 2));
      typedArr.copyWithin(0, Math.floor(len / 2), len);
      let everyResult = typedArr.every(val => val >= 0);
      let someResult = typedArr.some(val => val > 50);
      let findResult = typedArr.find(val => val > 10);
      let findIdxResult = typedArr.findIndex(val => val > 10);
      let filterArr = typedArr.filter(val => val > 0);
      let mapArr = typedArr.map(val => val * 2);
      typedArr.forEach(val => {
        let v = val;
      });
      let idxOfResult = typedArr.indexOf(0, 0);
      let lastIdxOfResult = typedArr.lastIndexOf(0, len - 1);
      let includesResult = typedArr.includes(0, 0);
      let joined = typedArr.join(',');
      let reduced = typedArr.reduce((prev, cur) => prev + cur, 0);
      typedArr.sort((a, b) => a - b);
      typedArr.reverse();
      let atResult = typedArr.at(0);
      let atResult2 = typedArr.at(-1);
      for (let entry of typedArr.entries()) {
        let k = entry[0];
        let v = entry[1];
      }
      for (let key of typedArr.keys()) {
        let k = key;
      }
      for (let val of typedArr.values()) {
        let v = val;
      }
      for (let val of typedArr) {
        let v = val;
      }
    } catch (e) {
      console.info('testConcurrentInt16ArrayRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentUint16ArrayRW(typedArr: collections.Uint16Array): void {
  for (let i = 0; i < 10; i++) {
    try {
      for (let j = 0; j < typedArr.length; j++) {
        typedArr[j] = typedArr[j] + 1;
      }
      let len = typedArr.length;
      let sliced = typedArr.slice(0, Math.floor(len / 2));
      typedArr.set(sliced, 0);
      let sub = typedArr.subarray(0, Math.floor(len / 2));
      for (let k = 0; k < sub.length; k++) {
        sub[k] = sub[k] + 1;
      }
      typedArr.fill(0, 0, Math.floor(len / 4));
      typedArr.fill(100, Math.floor(len / 4), Math.floor(len / 2));
      typedArr.copyWithin(0, Math.floor(len / 2), len);
      let everyResult = typedArr.every(val => val >= 0);
      let someResult = typedArr.some(val => val > 50);
      let findResult = typedArr.find(val => val > 10);
      let findIdxResult = typedArr.findIndex(val => val > 10);
      let filterArr = typedArr.filter(val => val > 0);
      let mapArr = typedArr.map(val => val * 2);
      typedArr.forEach(val => {
        let v = val;
      });
      let idxOfResult = typedArr.indexOf(0, 0);
      let lastIdxOfResult = typedArr.lastIndexOf(0, len - 1);
      let includesResult = typedArr.includes(0, 0);
      let joined = typedArr.join(',');
      let reduced = typedArr.reduce((prev, cur) => prev + cur, 0);
      typedArr.sort((a, b) => a - b);
      typedArr.reverse();
      let atResult = typedArr.at(0);
      let atResult2 = typedArr.at(-1);
      for (let entry of typedArr.entries()) {
        let k = entry[0];
        let v = entry[1];
      }
      for (let key of typedArr.keys()) {
        let k = key;
      }
      for (let val of typedArr.values()) {
        let v = val;
      }
      for (let val of typedArr) {
        let v = val;
      }
    } catch (e) {
      console.info('testConcurrentUint16ArrayRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentUint8ClampedArrayRW(typedArr: collections.Uint8ClampedArray): void {
  for (let i = 0; i < 10; i++) {
    try {
      for (let j = 0; j < typedArr.length; j++) {
        if (typedArr[j] < 255) {
          typedArr[j] = typedArr[j] + 1;
        }
      }
      let len = typedArr.length;
      let sliced = typedArr.slice(0, Math.floor(len / 2));
      typedArr.set(sliced, 0);
      let sub = typedArr.subarray(0, Math.floor(len / 2));
      for (let k = 0; k < sub.length; k++) {
        sub[k] = sub[k] + 1;
      }
      typedArr.fill(0, 0, Math.floor(len / 4));
      typedArr.fill(100, Math.floor(len / 4), Math.floor(len / 2));
      typedArr.copyWithin(0, Math.floor(len / 2), len);
      let everyResult = typedArr.every(val => val >= 0);
      let someResult = typedArr.some(val => val > 50);
      let findResult = typedArr.find(val => val > 10);
      let findIdxResult = typedArr.findIndex(val => val > 10);
      let filterArr = typedArr.filter(val => val > 0);
      let mapArr = typedArr.map(val => val * 2);
      typedArr.forEach(val => {
        let v = val;
      });
      let idxOfResult = typedArr.indexOf(0, 0);
      let lastIdxOfResult = typedArr.lastIndexOf(0, len - 1);
      let includesResult = typedArr.includes(0, 0);
      let joined = typedArr.join(',');
      let reduced = typedArr.reduce((prev, cur) => prev + cur, 0);
      typedArr.sort((a, b) => a - b);
      typedArr.reverse();
      let atResult = typedArr.at(0);
      let atResult2 = typedArr.at(-1);
      for (let entry of typedArr.entries()) {
        let k = entry[0];
        let v = entry[1];
      }
      for (let key of typedArr.keys()) {
        let k = key;
      }
      for (let val of typedArr.values()) {
        let v = val;
      }
      for (let val of typedArr) {
        let v = val;
      }
    } catch (e) {
      console.info('testConcurrentUint8ClampedArrayRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentBitVectorRW(bitVector: collections.BitVector): void {
  for (let i = 0; i < 10; i++) {
    try {
      let len = bitVector.length;
      for (let j = 0; j < len; j++) {
        let val = bitVector[j];
      }
      bitVector.push(1);
      bitVector.push(0);
      bitVector.pop();
      let hasResult = bitVector.has(1, 0, Math.floor(len / 2));
      let hasResult2 = bitVector.has(0, Math.floor(len / 2), len);
      bitVector.setBitsByRange(1, 0, Math.floor(len / 4));
      bitVector.setBitsByRange(0, Math.floor(len / 4), Math.floor(len / 2));
      bitVector.setAllBits(0);
      bitVector.setAllBits(1);
      let subVector = bitVector.getBitsByRange(0, Math.floor(len / 2));
      let subLen = subVector.length;
      bitVector.resize(len + 10);
      bitVector.resize(len);
      let count0 = bitVector.getBitCountByRange(0, 0, len);
      let count1 = bitVector.getBitCountByRange(1, 0, len);
      let index1 = bitVector.getIndexOf(1, 0, len);
      let lastIndex1 = bitVector.getLastIndexOf(1, 0, len);
      bitVector.flipBitByIndex(0);
      bitVector.flipBitByIndex(Math.floor(len / 2));
      bitVector.flipBitsByRange(0, Math.floor(len / 4));
      for (let val of bitVector.values()) {
        let v = val;
      }
      for (let val of bitVector) {
        let v = val;
      }
    } catch (e) {
      console.info('testConcurrentBitVectorRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentConcatArrayRW(concatArr: collections.ConcatArray<number>): void {
  try {
    let len = concatArr.length;
    for (let i = 0; i < len; i++) {
      let val = concatArr[i];
    }
    let sliced = concatArr.slice(0, len);
    let sliced2 = concatArr.slice(0, Math.floor(len / 2));
    let sliced3 = concatArr.slice(-1);
    let joined = concatArr.join(',');
    let joined2 = concatArr.join('|');
    let joined3 = concatArr.join('');
  } catch (e) {
    console.info('testConcurrentConcatArrayRW error: ' + e);
  }
}

@Concurrent
function testConcurrentConcatArrayStringRW(concatArr: collections.ConcatArray<string>): void {
  try {
    let len = concatArr.length;
    for (let i = 0; i < len; i++) {
      let val = concatArr[i];
    }
    let sliced = concatArr.slice(0, len);
    let sliced2 = concatArr.slice(0, Math.floor(len / 2));
    let joined = concatArr.join(',');
    let joined2 = concatArr.join('|');
    let joined3 = concatArr.join('');
  } catch (e) {
    console.info('testConcurrentConcatArrayStringRW error: ' + e);
  }
}


@Concurrent
function testConcurrentCollectionsMapRW(map: collections.Map<number, SendableClass>): void {
  for (let i = 0; i < 10; i++) {
    try {
      map.set(i, new SendableClass(i));
      let element = map.get(i);
      if (element) {
        element.value = element.value + 1;
      }
      map.has(i);
      let size = map.size;
      map.forEach((value: SendableClass, key: number) => {
        if (value) {
          value.value = value.value + 1;
        }
      });
      for (let entry of map.entries()) {
        if (entry[1]) {
          entry[1].value = entry[1].value + 1;
        }
      }
      for (let key of map.keys()) {
        map.has(key);
      }
      for (let value of map.values()) {
        if (value) {
          value.value = value.value + 1;
        }
      }
      map.delete(i);
      map.clear();
    } catch (e) {
      console.info('testConcurrentCollectionsMapRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentLRUCacheSendableRW(lruCache: ArkTSUtils.SendableLruCache<number, SendableClass>): void {
  for (let i = 0; i < 10; i++) {
    try {
      lruCache.put(i, new SendableClass(i));
      lruCache.put(i + 50, new SendableClass(i + 50));
      let val = lruCache.get(i);
      let val2 = lruCache.get(i + 50);
      if (val) {
        val.value = val.value + 1;
      }
      if (val2) {
        val2.value = val2.value + 1;
      }
      let hasKey = lruCache.contains(i);
      let hasKey2 = lruCache.contains(i + 50);
      let len = lruCache.length;
      let cap = lruCache.getCapacity();
      if (i % 3 === 0) {
        lruCache.remove(i);
      }
      if (i % 4 === 0) {
        lruCache.clear();
      }
      lruCache.updateCapacity(50 + i * 5);
      for (let key of lruCache.keys()) {
        let val = lruCache.get(key);
        if (val) {
          val.value = val.value + 1;
        }
      }
      for (let value of lruCache.values()) {
        if (value) {
          value.value = value.value + 1;
        }
      }
      for (let entry of lruCache.entries()) {
        if (entry[1]) {
          entry[1].value = entry[1].value + 1;
        }
      }
    } catch (e) {
      console.info('testConcurrentLRUCacheSendableRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentCollectionsArrayRW(arr: collections.Array<SendableClass>): void {
  for (let i = 0; i < 10; i++) {
    try {
      arr.push(new SendableClass(i));
      arr.unshift(new SendableClass(i * 10));
      let length = arr.length;
      if (length > 0) {
        let element = arr[0];
        if (element) {
          element.value = element.value + 100;
        }
        let lastElement = arr[arr.length - 1];
        if (lastElement) {
          lastElement.value = lastElement.value + 50;
        }
        let atResult = arr.at(0);
        let atResult2 = arr.at(-1);
        if (atResult) {
          atResult.value = atResult.value + 1;
        }
      }
      arr.forEach((value: SendableClass, index: number) => {
        if (value) {
          value.value = value.value + 1;
        }
      });
      for (let item of arr) {
        if (item) {
          item.value = item.value + 1;
        }
      }
      let filtered = arr.filter((item: SendableClass) => item.value > 0);
      let mapped = arr.map((item: SendableClass) => new SendableClass(item.value * 2));
      let found = arr.find((item: SendableClass) => item.value > 50);
      let foundIndex = arr.findIndex((item: SendableClass) => item.value > 50);
      let includesResult = arr.includes(arr[0]);
      let indexOfResult = arr.indexOf(arr[0]);
      let lastIndexOfResult = arr.lastIndexOf(arr[arr.length - 1]);
      let someResult = arr.some((item: SendableClass) => item.value > 0);
      let everyResult = arr.every((item: SendableClass) => item.value >= 0);
      let reduced = arr.reduce((sum: number, item: SendableClass) => sum + item.value, 0);
      let reduceRightResult = arr.reduceRight((sum: number, item: SendableClass) => sum + item.value, 0);
      let sliced = arr.slice(0, 5);
      arr.sort((a: SendableClass, b: SendableClass) => a.value - b.value);
      arr.reverse();
      arr.splice(0, 1);
      let joined = arr.join(',');
      let strResult = arr.toString();
      let localeStrResult = arr.toLocaleString();
      let fillVal = new SendableClass(999);
      arr.fill(fillVal, 0, 2);
      arr.copyWithin(0, Math.floor(length / 2), length);
      arr.shrinkTo(Math.floor(length / 2));
      arr.extendTo(length, new SendableClass(0));
      let concatArr = arr.concat(sliced);
      for (let entry of arr.entries()) {
        let idx = entry[0];
        let val = entry[1];
      }
      for (let key of arr.keys()) {
        let k = key;
      }
      for (let val of arr.values()) {
        if (val) {
          val.value = val.value + 1;
        }
      }
      arr.shift();
      arr.pop();
    } catch (e) {
      console.info('testConcurrentCollectionsArrayRW error: ' + e);
    }
  }
}

@Concurrent
function testConcurrentCollectionsSetRW(set: collections.Set<SendableClass>): void {
  for (let i = 0; i < 10; i++) {
    try {
      let obj = new SendableClass(i);
      set.add(obj);
      set.has(obj);
      let size = set.size;
      set.forEach((value: SendableClass) => {
        if (value) {
          value.value = value.value + 1;
        }
      });
      for (let entry of set.entries()) {
        if (entry[1]) {
          entry[1].value = entry[1].value + 1;
        }
      }
      for (let value of set.values()) {
        if (value) {
          value.value = value.value + 1;
        }
      }
      for (let key of set.keys()) {
        if (key) {
          key.value = key.value + 1;
        }
      }
      set.delete(obj);
      set.clear();
    } catch (e) {
      console.info('testConcurrentCollectionsSetRW error: ' + e);
    }
  }
}


export default function concurrentSharedObjectRWTest() {
  let id = setInterval(() => {
    gc();
  }, 5000)

  describe('concurrentSharedObjectRWTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await asyncSleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
      clearInterval(id);
    })

    /**
     * @tc.name   concurrentCounterReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COUNTER_RW_0100
     * @tc.desc   Concurrent counter read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentCounterReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentCounterReadWrite0100';
      console.info(`${tag} start.`);
      let counter = new SendableSharedCounter();
      let count = 0;
      let totalTasks = 20;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentCounterRW, counter).then(() => {
          count++;
        });
        testConcurrentCounterRW(counter);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ARRAY_RW_0100
     * @tc.desc   Concurrent array read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentArrayReadWrite0100';
      console.info(`${tag} start.`);
      let arr = new SendableSharedArray();
      let count = 0;
      let totalTasks = 20;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentArrayRW, arr).then(() => {
          count++;
        });
        testConcurrentArrayRW(arr);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentMapReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_MAP_RW_0100
     * @tc.desc   Concurrent map read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentMapReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentMapReadWrite0100';
      console.info(`${tag} start.`);
      let mapObj = new SendableSharedMap();
      let count = 0;
      let totalTasks = 20;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentMapRW, mapObj).then(() => {
          count++;
        });
        testConcurrentMapRW(mapObj);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentComplexReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COMPLEX_RW_0100
     * @tc.desc   Concurrent complex data read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentComplexReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentComplexReadWrite0100';
      console.info(`${tag} start.`);
      let counter = new SendableSharedCounter();
      let arr = new SendableSharedArray();
      let mapObj = new SendableSharedMap();
      let count = 0;
      let totalTasks = 20;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentComplexRW, counter, arr, mapObj).then(() => {
          count++;
        });
        testConcurrentComplexRW(counter, arr, mapObj);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentCollectionsMapReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COLLECTIONS_MAP_RW_0100
     * @tc.desc   Concurrent collections.Map read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentCollectionsMapReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentCollectionsMapReadWrite0100';
        console.info(`${tag} start.`);
        let map = new collections.Map<number, SendableClass>();
        for (let i = 0; i < 100; i++) {
          map.set(i, new SendableClass(i));
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCollectionsMapRW, map).then(() => {
            count++;
          });
          testConcurrentCollectionsMapRW(map);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentCollectionsArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COLLECTIONS_ARRAY_RW_0100
     * @tc.desc   Concurrent collections.Array read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentCollectionsArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentCollectionsArrayReadWrite0100';
        console.info(`${tag} start.`);
        let arr = new collections.Array<SendableClass>();
        for (let i = 0; i < 100; i++) {
          arr.push(new SendableClass(i));
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCollectionsArrayRW, arr).then(() => {
            count++;
          });
          testConcurrentCollectionsArrayRW(arr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentCollectionsSetReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COLLECTIONS_SET_RW_0100
     * @tc.desc   Concurrent collections.Set read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentCollectionsSetReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentCollectionsSetReadWrite0100';
        console.info(`${tag} start.`);
        let set = new collections.Set<SendableClass>();
        for (let i = 0; i < 100; i++) {
          set.add(new SendableClass(i));
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCollectionsSetRW, set).then(() => {
            count++;
          });
          testConcurrentCollectionsSetRW(set);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentCounterStress20_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COUNTER_STRESS_0100
     * @tc.desc   Concurrent counter stress 500 tasks test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentCounterStress20_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentCounterStress20_0100';
        console.info(`${tag} start.`);
        let counter = new SendableSharedCounter();
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCounterRW, counter).then(() => {
            count++;
          });
          testConcurrentCounterRW(counter);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentArrayStress20_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ARRAY_STRESS_0100
     * @tc.desc   Concurrent array stress 500 tasks test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentArrayStress20_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentArrayStress20_0100';
      console.info(`${tag} start.`);
      let arr = new SendableSharedArray();
      let count = 0;
      let totalTasks = 20;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentArrayRW, arr).then(() => {
          count++;
        });
        testConcurrentArrayRW(arr);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentMapStress20_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_MAP_STRESS_0100
     * @tc.desc   Concurrent map stress 500 tasks test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentMapStress20_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentMapStress20_0100';
      console.info(`${tag} start.`);
      let mapObj = new SendableSharedMap();
      let count = 0;
      let totalTasks = 20;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentMapRW, mapObj).then(() => {
          count++;
        });
        testConcurrentMapRW(mapObj);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentComplexStress20_0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_COMPLEX_STRESS_0100
     * @tc.desc   Concurrent complex data stress 500 tasks test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentComplexStress20_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentComplexStress20_0100';
        console.info(`${tag} start.`);
        let counter = new SendableSharedCounter();
        let arr = new SendableSharedArray();
        let mapObj = new SendableSharedMap();
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentComplexRW, counter, arr, mapObj).then(() => {
            count++;
          });
          testConcurrentComplexRW(counter, arr, mapObj);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentMultipleSharedObjects0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_MULTIPLE_OBJECTS_0100
     * @tc.desc   Concurrent multiple shared objects test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentMultipleSharedObjects0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentMultipleSharedObjects0100';
        console.info(`${tag} start.`);
        let counter1 = new SendableSharedCounter();
        let counter2 = new SendableSharedCounter();
        let counter3 = new SendableSharedCounter();
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCounterRW, counter1).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentCounterRW, counter2).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentCounterRW, counter3).then(() => {
            count++;
          });
          testConcurrentCounterRW(counter1);
          testConcurrentCounterRW(counter2);
          testConcurrentCounterRW(counter3);
        }
        while (count < totalTasks * 3) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks * 3);
        console.info(`${tag} counter1: ${counter1.counter}, counter2: ${counter2.counter}, counter3: ${counter3.counter}.`);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentBoundaryZeroTasks0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_BOUNDARY_ZERO_0100
     * @tc.desc   Concurrent boundary zero tasks test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentBoundaryZeroTasks0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentBoundaryZeroTasks0100';
        console.info(`${tag} start.`);
        let counter = new SendableSharedCounter();
        let count = 0;
        let totalTasks = 0;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCounterRW, counter).then(() => {
            count++;
          });
          testConcurrentCounterRW(counter);
        }
        await asyncSleep(500);
        expect(count).assertEqual(0);
        expect(counter.counter).assertEqual(0);
        expect(counter.operationCount).assertEqual(0);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentErrorHandling0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ERROR_HANDLING_0100
     * @tc.desc   Concurrent error handling test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentErrorHandling0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentErrorHandling0100';
      console.info(`${tag} start.`);
      let counter = new SendableSharedCounter();
      let count = 0;
      let totalTasks = 20;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testErrorHandling, counter).then(() => {
          count++;
        });
        testErrorHandling(counter);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentAllContainersParallel0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ALL_PARALLEL_0100
     * @tc.desc   Concurrent all containers parallel test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentAllContainersParallel0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentAllContainersParallel0100';
        console.info(`${tag} start.`);
        let counter = new SendableSharedCounter();
        let arr = new SendableSharedArray();
        let mapObj = new SendableSharedMap();
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCounterRW, counter).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentArrayRW, arr).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentMapRW, mapObj).then(() => {
            count++;
          });
          testConcurrentCounterRW(counter);
          testConcurrentArrayRW(arr);
          testConcurrentMapRW(mapObj);
        }
        while (count < totalTasks * 3) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks * 3);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentIterateDuringModify0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ITERATE_MODIFY_0100
     * @tc.desc   Concurrent iterate during modify test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentIterateDuringModify0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentIterateDuringModify0100';
        console.info(`${tag} start.`);
        let map = new collections.Map<number, SendableClass>();
        for (let i = 0; i < 50; i++) {
          map.set(i, new SendableClass(i));
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCollectionsMapRW, map).then(() => {
            count++;
          });
          testConcurrentCollectionsMapRW(map);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentLongRunning0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_LONG_RUNNING_0100
     * @tc.desc   Concurrent long running test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentLongRunning0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentLongRunning0100';
      console.info(`${tag} start.`);
      let counter = new SendableSharedCounter();
      let count = 0;
      let totalTasks = 20;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(longRunningTask, counter).then(() => {
          count++;
        });
        longRunningTask(counter);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentResetAndReuse0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_RESET_REUSE_0100
     * @tc.desc   Concurrent reset and reuse test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentResetAndReuse0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentResetAndReuse0100';
      console.info(`${tag} start.`);
      let counter = new SendableSharedCounter();
      let count = 0;
      let totalTasks = 20;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentCounterRW, counter).then(() => {
          count++;
        });
        testConcurrentCounterRW(counter);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} first round count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      let firstRoundCount = counter.counter;
      console.info(`${tag} first round counter: ${firstRoundCount}.`);
      counter.counter = 0;
      counter.operationCount = 0;
      count = 0;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentCounterRW, counter).then(() => {
          count++;
        });
        testConcurrentCounterRW(counter);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} second round count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentAllContainersFullReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ALL_FULL_RW_0100
     * @tc.desc   Concurrent all containers full read write methods test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentAllContainersFullReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentAllContainersFullReadWrite0100';
        console.info(`${tag} start.`);
        let map = new collections.Map<number, SendableClass>();
        let arr = new collections.Array<SendableClass>();
        let set = new collections.Set<SendableClass>();
        for (let i = 0; i < 50; i++) {
          map.set(i, new SendableClass(i));
          arr.push(new SendableClass(i));
          set.add(new SendableClass(i));
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentCollectionsMapRW, map).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentCollectionsArrayRW, arr).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentCollectionsSetRW, set).then(() => {
            count++;
          });
          testConcurrentCollectionsMapRW(map);
          testConcurrentCollectionsArrayRW(arr);
          testConcurrentCollectionsSetRW(set);
        }
        while (count < totalTasks * 3) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks * 3);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentInt8ArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_INT8ARRAY_RW_0100
     * @tc.desc   Concurrent Int8Array read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentInt8ArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentInt8ArrayReadWrite0100';
        console.info(`${tag} start.`);
        let typedArr = new collections.Int8Array(100);
        for (let i = 0; i < typedArr.length; i++) {
          typedArr[i] = i;
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentInt8ArrayRW, typedArr).then(() => {
            count++;
          });
          testConcurrentInt8ArrayRW(typedArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentInt32ArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_INT32ARRAY_RW_0100
     * @tc.desc   Concurrent Int32Array read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentInt32ArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentInt32ArrayReadWrite0100';
        console.info(`${tag} start.`);
        let typedArr = new collections.Int32Array(100);
        for (let i = 0; i < typedArr.length; i++) {
          typedArr[i] = i;
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentInt32ArrayRW, typedArr).then(() => {
            count++;
          });
          testConcurrentInt32ArrayRW(typedArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentFloat32ArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_FLOAT32ARRAY_RW_0100
     * @tc.desc   Concurrent Float32Array read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentFloat32ArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentFloat32ArrayReadWrite0100';
        console.info(`${tag} start.`);
        let typedArr = new collections.Float32Array(100);
        for (let i = 0; i < typedArr.length; i++) {
          typedArr[i] = i * 1.0;
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentFloat32ArrayRW, typedArr).then(() => {
            count++;
          });
          testConcurrentFloat32ArrayRW(typedArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentArrayBufferReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ARRAYBUFFER_RW_0100
     * @tc.desc   Concurrent ArrayBuffer read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentArrayBufferReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentArrayBufferReadWrite0100';
        console.info(`${tag} start.`);
        let buffer = new collections.ArrayBuffer(400);
        let view = new collections.Int32Array(buffer);
        for (let i = 0; i < view.length; i++) {
          view[i] = i;
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentArrayBufferRW, buffer).then(() => {
            count++;
          });
          testConcurrentArrayBufferRW(buffer);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentUint8ArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_UINT8ARRAY_RW_0100
     * @tc.desc   Concurrent Uint8Array read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentUint8ArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentUint8ArrayReadWrite0100';
        console.info(`${tag} start.`);
        let typedArr = new collections.Uint8Array(100);
        for (let i = 0; i < typedArr.length; i++) {
          typedArr[i] = i % 256;
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentUint8ArrayRW, typedArr).then(() => {
            count++;
          });
          testConcurrentUint8ArrayRW(typedArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentUint32ArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_UINT32ARRAY_RW_0100
     * @tc.desc   Concurrent Uint32Array read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentUint32ArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentUint32ArrayReadWrite0100';
        console.info(`${tag} start.`);
        let typedArr = new collections.Uint32Array(100);
        for (let i = 0; i < typedArr.length; i++) {
          typedArr[i] = i;
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentUint32ArrayRW, typedArr).then(() => {
            count++;
          });
          testConcurrentUint32ArrayRW(typedArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentInt16ArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_INT16ARRAY_RW_0100
     * @tc.desc   Concurrent Int16Array read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentInt16ArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentInt16ArrayReadWrite0100';
        console.info(`${tag} start.`);
        let typedArr = new collections.Int16Array(100);
        for (let i = 0; i < typedArr.length; i++) {
          typedArr[i] = i;
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentInt16ArrayRW, typedArr).then(() => {
            count++;
          });
          testConcurrentInt16ArrayRW(typedArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentUint16ArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_UINT16ARRAY_RW_0100
     * @tc.desc   Concurrent Uint16Array read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentUint16ArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentUint16ArrayReadWrite0100';
        console.info(`${tag} start.`);
        let typedArr = new collections.Uint16Array(100);
        for (let i = 0; i < typedArr.length; i++) {
          typedArr[i] = i;
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentUint16ArrayRW, typedArr).then(() => {
            count++;
          });
          testConcurrentUint16ArrayRW(typedArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentUint8ClampedArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_UINT8CLAMPEDARRAY_RW_0100
     * @tc.desc   Concurrent Uint8ClampedArray read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentUint8ClampedArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentUint8ClampedArrayReadWrite0100';
        console.info(`${tag} start.`);
        let typedArr = new collections.Uint8ClampedArray(100);
        for (let i = 0; i < typedArr.length; i++) {
          typedArr[i] = i % 256;
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentUint8ClampedArrayRW, typedArr).then(() => {
            count++;
          });
          testConcurrentUint8ClampedArrayRW(typedArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentAllTypedArraysParallel0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_ALL_TYPEDARRAYS_PARALLEL_0100
     * @tc.desc   Concurrent all TypedArrays parallel test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentAllTypedArraysParallel0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentAllTypedArraysParallel0100';
        console.info(`${tag} start.`);
        let int8Arr = new collections.Int8Array(50);
        let int32Arr = new collections.Int32Array(50);
        let float32Arr = new collections.Float32Array(50);
        let uint8Arr = new collections.Uint8Array(50);
        let uint32Arr = new collections.Uint32Array(50);
        for (let i = 0; i < 50; i++) {
          int8Arr[i] = i;
          int32Arr[i] = i;
          float32Arr[i] = i * 1.0;
          uint8Arr[i] = i % 256;
          uint32Arr[i] = i;
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentInt8ArrayRW, int8Arr).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentInt32ArrayRW, int32Arr).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentFloat32ArrayRW, float32Arr).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentUint8ArrayRW, uint8Arr).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentUint32ArrayRW, uint32Arr).then(() => {
            count++;
          });
          testConcurrentInt8ArrayRW(int8Arr);
          testConcurrentInt32ArrayRW(int32Arr);
          testConcurrentFloat32ArrayRW(float32Arr);
          testConcurrentUint8ArrayRW(uint8Arr);
          testConcurrentUint32ArrayRW(uint32Arr);
        }
        while (count < totalTasks * 5) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks * 5);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentTypedArrayStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_TYPEDARRAY_STRESS_0100
     * @tc.desc   Concurrent TypedArray stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentTypedArrayStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentTypedArrayStress0100';
      console.info(`${tag} start.`);
      let typedArr = new collections.Int32Array(10);
      for (let i = 0; i < typedArr.length; i++) {
        typedArr[i] = i;
      }
      let count = 0;
      let totalTasks = 20;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentInt32ArrayRW, typedArr).then(() => {
          count++;
        });
        testConcurrentInt32ArrayRW(typedArr);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentConcatArrayReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_CONCATARRAY_RW_0100
     * @tc.desc   Concurrent ConcatArray read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentConcatArrayReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentConcatArrayReadWrite0100';
        console.info(`${tag} start.`);
        let arr1 = new collections.Array<number>(1, 2, 3, 4, 5);
        let arr2 = new collections.Array<number>(6, 7, 8);
        let concatArr: collections.ConcatArray<number> = arr1.concat(arr2);
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentConcatArrayRW, concatArr).then(() => {
            count++;
          });
          testConcurrentConcatArrayRW(concatArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentConcatArrayStringReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_CONCATARRAY_STRING_RW_0100
     * @tc.desc   Concurrent ConcatArray string read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentConcatArrayStringReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentConcatArrayStringReadWrite0100';
        console.info(`${tag} start.`);
        let arr1 = new collections.Array<string>('a', 'b', 'c');
        let arr2 = new collections.Array<string>('d', 'e', 'f');
        let concatArr: collections.ConcatArray<string> = arr1.concat(arr2);
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentConcatArrayStringRW, concatArr).then(() => {
            count++;
          });
          testConcurrentConcatArrayStringRW(concatArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentConcatArrayIndexAccess0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_CONCATARRAY_INDEX_RW_0100
     * @tc.desc   Concurrent ConcatArray index access test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentConcatArrayIndexAccess0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentConcatArrayIndexAccess0100';
        console.info(`${tag} start.`);
        let arr1 = new collections.Array<number>(1, 2, 3, 4, 5);
        let arr2 = new collections.Array<number>(6, 7, 8, 9, 10);
        let concatArr: collections.ConcatArray<number> = arr1.concat(arr2);
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentConcatArrayRW, concatArr).then(() => {
            count++;
          });
          testConcurrentConcatArrayRW(concatArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentConcatArraySlice0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_CONCATARRAY_SLICE_RW_0100
     * @tc.desc   Concurrent ConcatArray slice test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentConcatArraySlice0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentConcatArraySlice0100';
      console.info(`${tag} start.`);
      let arr1 = new collections.Array<number>(1, 2, 3, 4, 5);
      let arr2 = new collections.Array<number>(6, 7, 8, 9, 10);
      let concatArr: collections.ConcatArray<number> = arr1.concat(arr2);
      let count = 0;
      let totalTasks = 20;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentConcatArrayRW, concatArr).then(() => {
          count++;
        });
        testConcurrentConcatArrayRW(concatArr);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });

    /**
     * @tc.name   concurrentConcatArrayStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_CONCATARRAY_STRESS_0100
     * @tc.desc   Concurrent ConcatArray stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentConcatArrayStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentConcatArrayStress0100';
        console.info(`${tag} start.`);
        let arr1 = new collections.Array<number>();
        let arr2 = new collections.Array<number>();
        for (let i = 0; i < 100; i++) {
          arr1.push(i);
          arr2.push(i + 100);
        }
        let concatArr: collections.ConcatArray<number> = arr1.concat(arr2);
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentConcatArrayRW, concatArr).then(() => {
            count++;
          });
          testConcurrentConcatArrayRW(concatArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });


    /**
     * @tc.name   concurrentTypedArraySliceSubarray0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_TYPEDARRAY_SLICE_SUBARRAY_0100
     * @tc.desc   Concurrent TypedArray slice and subarray test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentTypedArraySliceSubarray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentTypedArraySliceSubarray0100';
        console.info(`${tag} start.`);
        let typedArr = new collections.Int32Array(20);
        for (let i = 0; i < typedArr.length; i++) {
          typedArr[i] = i;
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentInt32ArrayRW, typedArr).then(() => {
            count++;
          });
          testConcurrentInt32ArrayRW(typedArr);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentConcatArrayAllInterfaces0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_CONCATARRAY_ALL_INTERFACE_0100
     * @tc.desc   Concurrent ConcatArray all interfaces test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentConcatArrayAllInterfaces0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentConcatArrayAllInterfaces0100';
        console.info(`${tag} start.`);
        let arr1 = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        let arr2 = new collections.Array<number>(11, 12, 13, 14, 15);
        let concatArr: collections.ConcatArray<number> = arr1.concat(arr2);
        let arrStr1 = new collections.Array<string>('a', 'b', 'c', 'd', 'e');
        let arrStr2 = new collections.Array<string>('f', 'g', 'h');
        let concatStrArr: collections.ConcatArray<string> = arrStr1.concat(arrStr2);
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentConcatArrayRW, concatArr).then(() => {
            count++;
          });
          taskpool.execute(testConcurrentConcatArrayStringRW, concatStrArr).then(() => {
            count++;
          });
          testConcurrentConcatArrayRW(concatArr);
          testConcurrentConcatArrayStringRW(concatStrArr);
        }
        while (count < totalTasks * 2) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks * 2);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentSendableLRUCacheReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_SENDABLELRUCACHE_RW_0100
     * @tc.desc   Concurrent SendableLRUCache read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentSendableLRUCacheReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentSendableLRUCacheReadWrite0100';
        console.info(`${tag} start.`);
        let lruCache = new ArkTSUtils.SendableLruCache<number, SendableClass>(100);
        for (let i = 0; i < 20; i++) {
          lruCache.put(i, new SendableClass(i));
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentLRUCacheSendableRW, lruCache).then(() => {
            count++;
          });
          testConcurrentLRUCacheSendableRW(lruCache);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentSendableLRUCacheStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_SENDABLELRUCACHE_STRESS_0100
     * @tc.desc   Concurrent SendableLRUCache stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentSendableLRUCacheStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentSendableLRUCacheStress0100';
        console.info(`${tag} start.`);
        let lruCache = new ArkTSUtils.SendableLruCache<number, SendableClass>(200);
        for (let i = 0; i < 50; i++) {
          lruCache.put(i, new SendableClass(i));
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentLRUCacheSendableRW, lruCache).then(() => {
            count++;
          });
          testConcurrentLRUCacheSendableRW(lruCache);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentBitVectorReadWrite0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_BITVECTOR_RW_0100
     * @tc.desc   Concurrent BitVector read write test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentBitVectorReadWrite0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let tag = 'concurrentBitVectorReadWrite0100';
        console.info(`${tag} start.`);
        let bitVector = new collections.BitVector(100);
        bitVector.setAllBits(0);
        for (let i = 0; i < 50; i++) {
          bitVector.setBitsByRange(1, i * 2, i * 2 + 1);
        }
        let count = 0;
        let totalTasks = 20;
        for (let i = 0; i < totalTasks; i++) {
          taskpool.execute(testConcurrentBitVectorRW, bitVector).then(() => {
            count++;
          });
          testConcurrentBitVectorRW(bitVector);
        }
        while (count < totalTasks) {
          await asyncSleep(100);
          console.info(`${tag} count: ${count}.`);
        }
        expect(count).assertEqual(totalTasks);
        console.info(`${tag} end.`);
        done();
      });

    /**
     * @tc.name   concurrentBitVectorStress0100
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENT_BITVECTOR_STRESS_0100
     * @tc.desc   Concurrent BitVector stress test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('concurrentBitVectorStress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let tag = 'concurrentBitVectorStress0100';
      console.info(`${tag} start.`);
      let bitVector = new collections.BitVector(200);
      bitVector.setAllBits(1);
      for (let i = 0; i < 100; i++) {
        bitVector.flipBitByIndex(i);
      }
      let count = 0;
      let totalTasks = 20;
      for (let i = 0; i < totalTasks; i++) {
        taskpool.execute(testConcurrentBitVectorRW, bitVector).then(() => {
          count++;
        });
        testConcurrentBitVectorRW(bitVector);
      }
      while (count < totalTasks) {
        await asyncSleep(100);
        console.info(`${tag} count: ${count}.`);
      }
      expect(count).assertEqual(totalTasks);
      console.info(`${tag} end.`);
      done();
    });
  })
}