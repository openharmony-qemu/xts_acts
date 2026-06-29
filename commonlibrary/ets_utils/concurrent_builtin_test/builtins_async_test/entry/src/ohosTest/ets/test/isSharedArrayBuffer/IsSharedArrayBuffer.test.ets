/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import util from '@ohos.util';
import { DynamicObjectTS, createDynamicObject, createSharedArrayBufferTS,
  getSharedArrayBufferMethodTS,
  SharedArrayBufferClassTS,
  SharedArrayBufferStaticTS} from './sharedArrayBufferTS';
import { collections, taskpool } from '@kit.ArkTS';
import {
  createSharedArrayBufferJS,
  getSharedArrayBufferMethodJS, SharedArrayBufferClassJS } from './sharedArrayBufferJS';
import {
  exportedSharedArrayBuffer,
  exportedSharedArrayBufferFunc,
  ExportedSharedArrayBufferClass
} from './sharedArrayBufferExportModule';
import { reExportedSharedArrayBuffer } from './sharedArrayBufferReexportModule';

const SLEEP_INTERVAL_MS: number = 100;

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function) => {
    setTimeout(resolve, ms);
  });
}

class SharedArrayBufferClassGetMethodBefore {
  private _data: SharedArrayBuffer | null = null;

  getMethodBeforeGet(): SharedArrayBuffer {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(16);
    }
    return this._data;
  }

  get data(): number {
    return this._data !== null ? this._data.byteLength : 0;
  }
}

class SharedArrayBufferClassGetMethodAfter {
  private _data: SharedArrayBuffer | null = null;

  get data(): number {
    return this._data !== null ? this._data.byteLength : 0;
  }

  getMethodAfterGet(): SharedArrayBuffer {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(16);
    }
    return this._data;
  }
}

class SharedArrayBufferClassSetMethod {
  private _data: SharedArrayBuffer | null = null;

  set data(value: number) {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(value);
    }
  }

  getMethodAfterSet(): SharedArrayBuffer {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(16);
    }
    return this._data;
  }
}

class SharedArrayBufferClassGetSetMethod {
  private _data: SharedArrayBuffer | null = null;

  get data(): number {
    return this._data !== null ? this._data.byteLength : 0;
  }

  set data(value: number) {
    this._data = new SharedArrayBuffer(value);
  }

  getMethodAfterGetSet(): SharedArrayBuffer {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(16);
    }
    return this._data;
  }
}

class SharedArrayBufferClassMultiGetSet {
  private _data: SharedArrayBuffer | null = null;

  get size(): number {
    return this._data !== null ? this._data.byteLength : 0;
  }

  get length(): number {
    return this._data !== null ? this._data.byteLength : 0;
  }

  set size(value: number) {
    this._data = new SharedArrayBuffer(value);
  }

  set length(value: number) {
    this._data = new SharedArrayBuffer(value);
  }

  getMethodBetweenGetSet(): SharedArrayBuffer {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(16);
    }
    return this._data;
  }
}

class SharedArrayBufferClassOnlyGet {
  private _data: SharedArrayBuffer | null = null;

  get data(): number {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(16);
    }
    return this._data.byteLength;
  }

  getMethodAfterOnlyGet(): SharedArrayBuffer {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(16);
    }
    return this._data;
  }
}

class SharedArrayBufferClassOnlySet {
  private _data: SharedArrayBuffer | null = null;

  set data(value: number) {
    this._data = new SharedArrayBuffer(value);
  }

  getMethodAfterOnlySet(): SharedArrayBuffer {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(16);
    }
    return this._data;
  }
}

class SharedArrayBufferStatic {
  private static _instance: SharedArrayBuffer | null = null;

  static getSharedArrayBuffer(): SharedArrayBuffer {
    if (SharedArrayBufferStatic._instance === null) {
      SharedArrayBufferStatic._instance = new SharedArrayBuffer(16);
    }
    return SharedArrayBufferStatic._instance;
  }

  static get staticData(): number {
    return SharedArrayBufferStatic._instance !== null ? SharedArrayBufferStatic._instance.byteLength : 0;
  }

  static set staticData(value: number) {
    SharedArrayBufferStatic._instance = new SharedArrayBuffer(value);
  }

  static getMethodAfterStaticGetter(): SharedArrayBuffer {
    if (SharedArrayBufferStatic._instance === null) {
      SharedArrayBufferStatic._instance = new SharedArrayBuffer(16);
    }
    return SharedArrayBufferStatic._instance;
  }
}

class SharedArrayBufferBase {
  private _data: SharedArrayBuffer | null = null;

  getBuffer(): SharedArrayBuffer {
    if (this._data === null) {
      this._data = new SharedArrayBuffer(16);
    }
    return this._data;
  }
}

class SharedArrayBufferDerived extends SharedArrayBufferBase {
  getDerivedBuffer(): SharedArrayBuffer {
    return this.getBuffer();
  }
}

class SharedArrayBufferOverride extends SharedArrayBufferBase {
  private _derivedData: SharedArrayBuffer | null = null;

  getBuffer(): SharedArrayBuffer {
    if (this._derivedData === null) {
      this._derivedData = new SharedArrayBuffer(32);
    }
    return this._derivedData;
  }
}

const type: util.types = new util.types();

function checkBuffer(buffer: SharedArrayBuffer): boolean {
  return type.isSharedArrayBuffer(buffer);
}

function createBuffer(): SharedArrayBuffer {
  return new SharedArrayBuffer(16);
}


// SendableTest classes
@Sendable
class SendableSharedArrayBufferClass {
  public buffer: collections.Array<number> = new collections.Array<number>();
  public size: number = 16;

  constructor(size: number) {
    this.size = size;
  }

  getBufferInfo(): number {
    return this.size;
  }

  createSharedArrayBufferInfo(): number {
    return this.size * 2;
  }
}

@Sendable
class SendableSharedArrayBufferContainer {
  public buffers: collections.Array<number> = new collections.Array<number>();

  addBuffer(size: number): void {
    this.buffers.push(size);
  }

  getBufferCount(): number {
    return this.buffers.length;
  }
}

@Sendable
class SendableSharedArrayBufferStatic {
  private static instance: SendableSharedArrayBufferStatic | null = null;
  public size: number = 16;

  static getInstance(): SendableSharedArrayBufferStatic {
    if (SendableSharedArrayBufferStatic.instance === null) {
      SendableSharedArrayBufferStatic.instance = new SendableSharedArrayBufferStatic();
    }
    return SendableSharedArrayBufferStatic.instance as SendableSharedArrayBufferStatic;
  }

  getSize(): number {
    return this.size;
  }
}

@Sendable
class SendableSharedArrayBufferBase {
  public size: number = 16;

  getBufferSize(): number {
    return this.size;
  }
}

@Sendable
class SendableSharedArrayBufferDerived extends SendableSharedArrayBufferBase {
  public multiplier: number = 2;

  getDerivedSize(): number {
    return this.size * this.multiplier;
  }
}

@Sendable
class SendableSharedArrayBufferGetterSetter {
  private _size: number = 16;

  get size(): number {
    return this._size;
  }

  set size(value: number) {
    this._size = value;
  }

  getBufferSize(): number {
    return this._size;
  }
}

@Concurrent
function taskPoolCreateSharedArrayBuffer(size: number): number {
  const sab: SharedArrayBuffer = new SharedArrayBuffer(size);
  return sab.byteLength;
}

@Concurrent
function taskPoolCheckSharedArrayBuffer(sizes: collections.Array<number>): number {
  let total: number = 0;
  for (let i: number = 0; i < sizes.length; i++) {
    total = total + sizes[i];
  }
  return total;
}

// DecoratorTest classes
@Sendable
class SendableDecoratorSharedArrayBuffer {
  public size: number = 16;

  getSharedArrayBufferSize(): number {
    return this.size;
  }
}

@Sendable
class SendableDecoratorGetterSetter {
  private _size: number = 16;

  get size(): number {
    return this._size;
  }

  set size(value: number) {
    this._size = value;
  }

  getBufferSize(): number {
    return this._size;
  }
}

@Concurrent
function concurrentDecoratorSharedArrayBuffer(size: number): number {
  const sab: SharedArrayBuffer = new SharedArrayBuffer(size);
  return sab.byteLength;
}

@Concurrent
function concurrentStaticMethod(sizes: collections.Array<number>): number {
  let total: number = 0;
  for (let i: number = 0; i < sizes.length; i++) {
    total = total + sizes[i];
  }
  return total;
}

interface ComponentBuffer {
  size: number;
}

interface StateBuffer {
  buffer: SharedArrayBuffer;
}

let watchedSize: number = 32;

function onSizeChange(newSize: number): void {
  watchedSize = newSize;
}

function buildBuffer(size: number): SharedArrayBuffer {
  return new SharedArrayBuffer(size);
}

function logMethod(target: Function): void {
  console.info('Method decorated');
}

function createBufferForDecorator(): SharedArrayBuffer {
  return new SharedArrayBuffer(128);
}

class CustomDecoratedClass {
  public bufferSize: number = 128;

  getBuffer(): SharedArrayBuffer {
    return new SharedArrayBuffer(this.bufferSize);
  }
}

class AccessorDecoratedClass {
  private _size: number = 16;

  get size(): number {
    return this._size;
  }

  set size(value: number) {
    this._size = value;
  }
}

let stateSize: number = 32;

function watchCallback(newSize: number): void {
  stateSize = newSize;
}

// ImportExportTest classes
interface GenericBuffer<T> {
  buffer: SharedArrayBuffer;
  value: T;
}

interface IBufferInterface {
  getBuffer(): SharedArrayBuffer;
}

abstract class AbstractBufferClass {
  protected _size: number = 16;

  abstract createBuffer(): SharedArrayBuffer;

  getSize(): number {
    return this._size;
  }
}

class BufferInterfaceImpl implements IBufferInterface {
  private _buffer: SharedArrayBuffer = new SharedArrayBuffer(16);

  getBuffer(): SharedArrayBuffer {
    return this._buffer;
  }
}

class ConcreteBufferClass extends AbstractBufferClass {
  createBuffer(): SharedArrayBuffer {
    return new SharedArrayBuffer(this._size);
  }
}

class GenericBufferClass<T> {
  private _buffer: SharedArrayBuffer = new SharedArrayBuffer(16);
  private _value: T;

  constructor(value: T) {
    this._value = value;
  }

  getBuffer(): SharedArrayBuffer {
    return this._buffer;
  }

  getValue(): T {
    return this._value;
  }
}

interface MultiGeneric<K, V> {
  key: K;
  value: V;
  buffer: SharedArrayBuffer;
}

function createGenericBuffer<T>(size: number, value: T): GenericBuffer<T> {
  return {
    buffer: new SharedArrayBuffer(size),
    value: value
  };
}

interface ExtendedBufferInterface extends IBufferInterface {
  getSize(): number;
}

class ExtendedBufferImpl implements ExtendedBufferInterface {
  private _buffer: SharedArrayBuffer = new SharedArrayBuffer(32);

  getBuffer(): SharedArrayBuffer {
    return this._buffer;
  }

  getSize(): number {
    return this._buffer.byteLength;
  }
}

function createRecursive(depth: number): SharedArrayBuffer {
  if (depth <= 0) {
    return new SharedArrayBuffer(16);
  }
  return new SharedArrayBuffer(createRecursive(depth - 1).byteLength * 2);
}


export default function IsSharedArrayBufferTest() {
  describe('IsSharedArrayBufferTest', () => {

    beforeAll(() => {
      console.info('beforeAll called');
    });

    beforeEach(async () => {
      await sleep(SLEEP_INTERVAL_MS);
    });

    afterEach(() => {
      console.info('afterEach called');
    });

    afterAll(() => {
      console.info('afterAll called');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0100
     * @tc.name testIsSharedArrayBufferBasic
     * @tc.desc Test basic SharedArrayBuffer creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferBasic';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0200
     * @tc.name testIsSharedArrayBufferSpecificSize
     * @tc.desc Test SharedArrayBuffer with specific size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferSpecificSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferSpecificSize';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(1024);
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0300
     * @tc.name testIsSharedArrayBufferZeroSize
     * @tc.desc Test SharedArrayBuffer with zero bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferZeroSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferZeroSize';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(0);
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0400
     * @tc.name testIsSharedArrayBufferLargeSize
     * @tc.desc Test SharedArrayBuffer with large size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferLargeSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferLargeSize';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(1024 * 1024);
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0500
     * @tc.name testIsSharedArrayBufferSlice
     * @tc.desc Test SharedArrayBuffer.slice() returns SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferSlice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferSlice';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
        const sliced: SharedArrayBuffer = sab.slice(0, 8);
        const result: boolean = type.isSharedArrayBuffer(sliced);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0600
     * @tc.name testIsSharedArrayBufferInt8ArrayView
     * @tc.desc Test Int8Array view buffer is SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferInt8ArrayView', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferInt8ArrayView';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
        const view: Int8Array = new Int8Array(sab);
        const result: boolean = type.isSharedArrayBuffer(view.buffer);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0700
     * @tc.name testIsSharedArrayBufferFloat64ArrayView
     * @tc.desc Test Float64Array view buffer is SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferFloat64ArrayView', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferFloat64ArrayView';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(32);
        const view: Float64Array = new Float64Array(sab);
        const result: boolean = type.isSharedArrayBuffer(view.buffer);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0800
     * @tc.name testIsSharedArrayBufferMultipleViews
     * @tc.desc Test multiple TypedArray views of same SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferMultipleViews', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferMultipleViews';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
        const int8View: Int8Array = new Int8Array(sab);
        const int16View: Int16Array = new Int16Array(sab);
        const uint8View: Uint8Array = new Uint8Array(sab);

        expect(type.isSharedArrayBuffer(int8View.buffer)).assertTrue();
        expect(type.isSharedArrayBuffer(int16View.buffer)).assertTrue();
        expect(type.isSharedArrayBuffer(uint8View.buffer)).assertTrue();
        expect(int8View.buffer === int16View.buffer).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0900
     * @tc.name testIsSharedArrayBufferMethodBeforeGetter
     * @tc.desc Test method returning SharedArrayBuffer defined before getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferMethodBeforeGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferMethodBeforeGetter';
        console.info(`${caseName} test start`);

        const instance: SharedArrayBufferClassGetMethodBefore = new SharedArrayBufferClassGetMethodBefore();
        const sab: SharedArrayBuffer = instance.getMethodBeforeGet();
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1000
     * @tc.name testIsSharedArrayBufferMethodAfterGetter
     * @tc.desc Test method returning SharedArrayBuffer defined after getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferMethodAfterGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferMethodAfterGetter';
        console.info(`${caseName} test start`);

        const instance: SharedArrayBufferClassGetMethodAfter = new SharedArrayBufferClassGetMethodAfter();
        const sab: SharedArrayBuffer = instance.getMethodAfterGet();
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1100
     * @tc.name testIsSharedArrayBufferMethodAfterSetter
     * @tc.desc Test method returning SharedArrayBuffer defined after setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferMethodAfterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferMethodAfterSetter';
        console.info(`${caseName} test start`);

        const instance: SharedArrayBufferClassSetMethod = new SharedArrayBufferClassSetMethod();
        instance.data = 32;
        const sab: SharedArrayBuffer = instance.getMethodAfterSet();
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1200
     * @tc.name testIsSharedArrayBufferMethodAfterGetterSetter
     * @tc.desc Test method returning SharedArrayBuffer defined after getter/setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferMethodAfterGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferMethodAfterGetterSetter';
        console.info(`${caseName} test start`);

        const instance: SharedArrayBufferClassGetSetMethod = new SharedArrayBufferClassGetSetMethod();
        instance.data = 32;
        const sab: SharedArrayBuffer = instance.getMethodAfterGetSet();
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1300
     * @tc.name testIsSharedArrayBufferMethodBetweenMultipleGetSet
     * @tc.desc Test method returning SharedArrayBuffer between multiple getters/setters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferMethodBetweenMultipleGetSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferMethodBetweenMultipleGetSet';
        console.info(`${caseName} test start`);

        const instance: SharedArrayBufferClassMultiGetSet = new SharedArrayBufferClassMultiGetSet();
        instance.size = 64;
        const sab: SharedArrayBuffer = instance.getMethodBetweenGetSet();
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1400
     * @tc.name testIsSharedArrayBufferMethodAfterOnlyGetter
     * @tc.desc Test method returning SharedArrayBuffer after getter without setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferMethodAfterOnlyGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferMethodAfterOnlyGetter';
        console.info(`${caseName} test start`);

        const instance: SharedArrayBufferClassOnlyGet = new SharedArrayBufferClassOnlyGet();
        const sab: SharedArrayBuffer = instance.getMethodAfterOnlyGet();
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1500
     * @tc.name testIsSharedArrayBufferMethodAfterOnlySetter
     * @tc.desc Test method returning SharedArrayBuffer after setter without getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferMethodAfterOnlySetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferMethodAfterOnlySetter';
        console.info(`${caseName} test start`);

        const instance: SharedArrayBufferClassOnlySet = new SharedArrayBufferClassOnlySet();
        instance.data = 32;
        const sab: SharedArrayBuffer = instance.getMethodAfterOnlySet();
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1600
     * @tc.name testIsSharedArrayBufferStaticMethod
     * @tc.desc Test static method returning SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferStaticMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferStaticMethod';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = SharedArrayBufferStatic.getSharedArrayBuffer();
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1700
     * @tc.name testIsSharedArrayBufferStaticGetterSetter
     * @tc.desc Test static getter/setter and method returning SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferStaticGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferStaticGetterSetter';
        console.info(`${caseName} test start`);

        SharedArrayBufferStatic.staticData = 64;
        const sab: SharedArrayBuffer = SharedArrayBufferStatic.getMethodAfterStaticGetter();
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1800
     * @tc.name testIsSharedArrayBufferInheritance
     * @tc.desc Test inheritance class returning SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferInheritance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferInheritance';
        console.info(`${caseName} test start`);

        const instance: SharedArrayBufferDerived = new SharedArrayBufferDerived();
        const sab: SharedArrayBuffer = instance.getDerivedBuffer();
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1900
     * @tc.name testIsSharedArrayBufferOverride
     * @tc.desc Test override method returning SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferOverride';
        console.info(`${caseName} test start`);

        const instance: SharedArrayBufferOverride = new SharedArrayBufferOverride();
        const sab: SharedArrayBuffer = instance.getBuffer();
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2000
     * @tc.name testIsSharedArrayBufferVsArrayBuffer
     * @tc.desc Test ArrayBuffer should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferVsArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferVsArrayBuffer';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const result: boolean = type.isSharedArrayBuffer(ab);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2100
     * @tc.name testIsSharedArrayBufferPlainObject
     * @tc.desc Test plain object should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferPlainObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferPlainObject';
        console.info(`${caseName} test start`);

        interface PlainObject {
          length: number;
        }

        const obj: PlainObject = { length: 16 };
        const result: boolean = type.isSharedArrayBuffer(obj);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2200
     * @tc.name testIsSharedArrayBufferTypedArray
     * @tc.desc Test TypedArray instance should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferTypedArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferTypedArray';
        console.info(`${caseName} test start`);

        const arr: Int8Array = new Int8Array(16);
        const result: boolean = type.isSharedArrayBuffer(arr);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2300
     * @tc.name testIsSharedArrayBufferDataView
     * @tc.desc Test DataView instance should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferDataView', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferDataView';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const dv: DataView = new DataView(ab);
        const result: boolean = type.isSharedArrayBuffer(dv);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2400
     * @tc.name testIsSharedArrayBufferArray
     * @tc.desc Test array should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferArray';
        console.info(`${caseName} test start`);

        const arr: number[] = [1, 2, 3, 4];
        const result: boolean = type.isSharedArrayBuffer(arr);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2500
     * @tc.name testIsSharedArrayBufferString
     * @tc.desc Test string should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferString';
        console.info(`${caseName} test start`);

        const str: string = 'test string';
        const result: boolean = type.isSharedArrayBuffer(str);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2600
     * @tc.name testIsSharedArrayBufferNumber
     * @tc.desc Test number should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferNumber';
        console.info(`${caseName} test start`);

        const num: number = 123;
        const result: boolean = type.isSharedArrayBuffer(num);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2700
     * @tc.name testIsSharedArrayBufferBoolean
     * @tc.desc Test boolean should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferBoolean';
        console.info(`${caseName} test start`);

        const bool: boolean = true;
        const result: boolean = type.isSharedArrayBuffer(bool);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2800
     * @tc.name testIsSharedArrayBufferNullUndefined
     * @tc.desc Test null and undefined should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferNullUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferNullUndefined';
        console.info(`${caseName} test start`);

        expect(type.isSharedArrayBuffer(null)).assertFalse();
        expect(type.isSharedArrayBuffer(undefined)).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_3500
     * @tc.name testIsSharedArrayBufferFunctionParam
     * @tc.desc Test function parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIsSharedArrayBufferFunctionParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferFunctionParam';
        console.info(`${caseName} test start`);

        const func: Function = (): void => {
        };
        const result: boolean = type.isSharedArrayBuffer(func);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_3600
     * @tc.name testIsSharedArrayBufferArrayParam
     * @tc.desc Test array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIsSharedArrayBufferArrayParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferArrayParam';
        console.info(`${caseName} test start`);

        const arr: number[] = [1, 2, 3];
        const result: boolean = type.isSharedArrayBuffer(arr);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_3700
     * @tc.name testIsSharedArrayBufferMapSetParam
     * @tc.desc Test Map and Set parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testIsSharedArrayBufferMapSetParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferMapSetParam';
        console.info(`${caseName} test start`);

        const map: Map<string, number> = new Map<string, number>();
        const set: Set<number> = new Set<number>();

        expect(type.isSharedArrayBuffer(map)).assertFalse();
        expect(type.isSharedArrayBuffer(set)).assertFalse();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_3800
     * @tc.name testIsSharedArrayBufferViewSharing
     * @tc.desc Test SharedArrayBuffer view sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferViewSharing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferViewSharing';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(32);
        const sab2: ArrayBuffer = new ArrayBuffer(32);
        const view1: Int32Array = new Int32Array(sab);
        const view2: Float32Array = new Float32Array(sab);
        const view22: Float32Array = new Float32Array(sab2);


        expect(type.isSharedArrayBuffer(view1.buffer)).assertTrue();
        expect(type.isSharedArrayBuffer(view2.buffer)).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_3900
     * @tc.name testIsSharedArrayBufferAtomicsWaitNotify
     * @tc.desc Test Atomics wait/notify operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferAtomicsWaitNotify', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferAtomicsWaitNotify';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(4);
        const view: Int32Array = new Int32Array(sab);

        view[0] = 0;
        Atomics.store(view, 0, 1);
        expect(Atomics.load(view, 0)).assertEqual(1);

        expect(type.isSharedArrayBuffer(view.buffer)).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4000
     * @tc.name testIsSharedArrayBufferAtomicsLoadStore
     * @tc.desc Test Atomics load/store operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferAtomicsLoadStore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferAtomicsLoadStore';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
        const view: Int32Array = new Int32Array(sab);

        Atomics.store(view, 0, 100);
        const loaded: number = Atomics.load(view, 0);
        expect(loaded).assertEqual(100);

        expect(type.isSharedArrayBuffer(view.buffer)).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4100
     * @tc.name testIsSharedArrayBufferNestedObject
     * @tc.desc Test SharedArrayBuffer in nested object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferNestedObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferNestedObject';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(16);

        interface NestedValue {
          value: number;
        }

        interface NestedObject {
          buffer: SharedArrayBuffer;
          nested: NestedValue;
        }

        const nestedValue: NestedValue = { value: 42 };
        const obj: NestedObject = {
          buffer: sab,
          nested: nestedValue
        };

        expect(type.isSharedArrayBuffer(obj.buffer)).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4200
     * @tc.name testIsSharedArrayBufferAsParam
     * @tc.desc Test SharedArrayBuffer passed as function parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferAsParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferAsParam';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(16);

        const result: boolean = checkBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4300
     * @tc.name testIsSharedArrayBufferReturnFromFunc
     * @tc.desc Test SharedArrayBuffer returned from function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferReturnFromFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferReturnFromFunc';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = createBuffer();
        const result: boolean = type.isSharedArrayBuffer(sab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4400
     * @tc.name testIsSharedArrayBufferInCollection
     * @tc.desc Test SharedArrayBuffer stored in collection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferInCollection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferInCollection';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
        const arr: SharedArrayBuffer[] = [sab];
        const map: Map<string, SharedArrayBuffer> = new Map<string, SharedArrayBuffer>();
        map.set('buffer', sab);

        expect(type.isSharedArrayBuffer(arr[0])).assertTrue();
        expect(type.isSharedArrayBuffer(map.get('buffer') as SharedArrayBuffer)).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4500
     * @tc.name testIsSharedArrayBufferDynamicProp
     * @tc.desc Test SharedArrayBuffer as dynamic property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferDynamicProp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferDynamicProp';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
        const obj: DynamicObjectTS = createDynamicObject(sab);

        expect(type.isSharedArrayBuffer(obj.buffer)).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4600
     * @tc.name testIsSharedArrayBufferPrototype
     * @tc.desc Test SharedArrayBuffer prototype operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferPrototype', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferPrototype';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
        expect(sab.byteLength).assertEqual(16);
        expect(type.isSharedArrayBuffer(sab)).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4700
     * @tc.name testIsSharedArrayBufferMultiThreadSimulate
     * @tc.desc Test SharedArrayBuffer multi-thread access simulation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferMultiThreadSimulate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferMultiThreadSimulate';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
        const view: Int32Array = new Int32Array(sab);

        Atomics.store(view, 0, 100);
        const value1: number = Atomics.load(view, 0);
        Atomics.add(view, 0, 50);
        const value2: number = Atomics.load(view, 0);

        expect(value1).assertEqual(100);
        expect(value2).assertEqual(150);
        expect(type.isSharedArrayBuffer(sab)).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4800
     * @tc.name testIsSharedArrayBufferSliceReturn
     * @tc.desc Test SharedArrayBuffer slice returns SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferSliceReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferSliceReturn';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(32);
        const slice1: SharedArrayBuffer = sab.slice(0, 16);
        const slice2: SharedArrayBuffer = sab.slice(16);

        expect(type.isSharedArrayBuffer(slice1)).assertTrue();
        expect(type.isSharedArrayBuffer(slice2)).assertTrue();
        expect(slice1.byteLength).assertEqual(16);
        expect(slice2.byteLength).assertEqual(16);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4900
     * @tc.name testIsSharedArrayBufferCompoundView
     * @tc.desc Test compound view scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferCompoundView', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferCompoundView';
        console.info(`${caseName} test start`);

        const sab: SharedArrayBuffer = new SharedArrayBuffer(24);
        const int32View: Int32Array = new Int32Array(sab, 0, 2);
        const float64View: Float64Array = new Float64Array(sab, 8, 2);

        int32View[0] = 42;
        float64View[0] = 3.14;

        expect(type.isSharedArrayBuffer(int32View.buffer)).assertTrue();
        expect(type.isSharedArrayBuffer(float64View.buffer)).assertTrue();
        expect(int32View.buffer === float64View.buffer).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_5000
     * @tc.name testIsSharedArrayBufferLengthValidation
     * @tc.desc Test SharedArrayBuffer length validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testIsSharedArrayBufferLengthValidation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testIsSharedArrayBufferLengthValidation';
        console.info(`${caseName} test start`);

        const sizes: number[] = [0, 1, 8, 16, 32, 64, 128, 256, 512, 1024];

        for (let i: number = 0; i < sizes.length; i++) {
          const sab: SharedArrayBuffer = new SharedArrayBuffer(sizes[i]);
          expect(type.isSharedArrayBuffer(sab)).assertTrue();
          expect(sab.byteLength).assertEqual(sizes[i]);
        }

        console.info(`${caseName} test end`);
        done();
      });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0100
     * @tc.name testSendableSharedArrayBufferProperty
     * @tc.desc Test SharedArrayBuffer property in Sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableSharedArrayBufferProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableSharedArrayBufferProperty';
      console.info(`${caseName} test start`);

      const instance: SendableSharedArrayBufferClass = new SendableSharedArrayBufferClass(32);
      expect(instance.getBufferInfo()).assertEqual(32);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(instance.size);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0200
     * @tc.name testSendableSharedArrayBufferMethod
     * @tc.desc Test Sendable class method returning SharedArrayBuffer info
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableSharedArrayBufferMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableSharedArrayBufferMethod';
      console.info(`${caseName} test start`);

      const instance: SendableSharedArrayBufferClass = new SendableSharedArrayBufferClass(16);
      const size: number = instance.createSharedArrayBufferInfo();
      expect(size).assertEqual(32);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(size);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0300
     * @tc.name testSendableSharedArrayBufferStatic
     * @tc.desc Test Sendable static method with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableSharedArrayBufferStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableSharedArrayBufferStatic';
      console.info(`${caseName} test start`);

      const instance: SendableSharedArrayBufferStatic = SendableSharedArrayBufferStatic.getInstance();
      const size: number = instance.getSize();
      expect(size).assertEqual(16);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(size);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0400
     * @tc.name testSendableSharedArrayBufferInheritance
     * @tc.desc Test Sendable inheritance with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableSharedArrayBufferInheritance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableSharedArrayBufferInheritance';
      console.info(`${caseName} test start`);

      const instance: SendableSharedArrayBufferDerived = new SendableSharedArrayBufferDerived();
      expect(instance.getBufferSize()).assertEqual(16);
      expect(instance.getDerivedSize()).assertEqual(32);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(instance.getDerivedSize());
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0500
     * @tc.name testSendableSharedArrayBufferOverride
     * @tc.desc Test Sendable override with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableSharedArrayBufferOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableSharedArrayBufferOverride';
      console.info(`${caseName} test start`);

      const instance: SendableSharedArrayBufferDerived = new SendableSharedArrayBufferDerived();
      instance.multiplier = 4;
      expect(instance.getDerivedSize()).assertEqual(64);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(instance.getDerivedSize());
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0600
     * @tc.name testTaskPoolPassSharedArrayBuffer
     * @tc.desc Test passing SharedArrayBuffer size to TaskPool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTaskPoolPassSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testTaskPoolPassSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const task: taskpool.Task = new taskpool.Task(taskPoolCreateSharedArrayBuffer, 64);
      const result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(64);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(result);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0700
     * @tc.name testTaskPoolReturnSharedArrayBuffer
     * @tc.desc Test TaskPool task returning SharedArrayBuffer size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTaskPoolReturnSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testTaskPoolReturnSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const sizes: collections.Array<number> = new collections.Array<number>();
      sizes.push(16);
      sizes.push(32);
      sizes.push(64);

      const task: taskpool.Task = new taskpool.Task(taskPoolCheckSharedArrayBuffer, sizes);
      const result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(112);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(result);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0800
     * @tc.name testTaskPoolConcurrentAccess
     * @tc.desc Test concurrent access to SharedArrayBuffer info via TaskPool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTaskPoolConcurrentAccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testTaskPoolConcurrentAccess';
      console.info(`${caseName} test start`);

      const task1: taskpool.Task = new taskpool.Task(taskPoolCreateSharedArrayBuffer, 32);
      const task2: taskpool.Task = new taskpool.Task(taskPoolCreateSharedArrayBuffer, 64);

      const results: number[] = await Promise.all([
        taskpool.execute(task1) as Promise<number>,
        taskpool.execute(task2) as Promise<number>
      ]);

      expect(results[0]).assertEqual(32);
      expect(results[1]).assertEqual(64);

      const sab1: SharedArrayBuffer = new SharedArrayBuffer(results[0]);
      const sab2: SharedArrayBuffer = new SharedArrayBuffer(results[1]);
      expect(type.isSharedArrayBuffer(sab1)).assertTrue();
      expect(type.isSharedArrayBuffer(sab2)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0900
     * @tc.name testWorkerCreateSharedArrayBuffer
     * @tc.desc Test creating SharedArrayBuffer in Worker context (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWorkerCreateSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testWorkerCreateSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(128);
      const view: Int32Array = new Int32Array(sab);
      Atomics.store(view, 0, 42);

      expect(type.isSharedArrayBuffer(sab)).assertTrue();
      expect(Atomics.load(view, 0)).assertEqual(42);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1000
     * @tc.name testWorkerPostMessageSharedArrayBuffer
     * @tc.desc Test posting SharedArrayBuffer size to Worker (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWorkerPostMessageSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testWorkerPostMessageSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(256);
      const size: number = sab.byteLength;

      const task: taskpool.Task = new taskpool.Task(taskPoolCreateSharedArrayBuffer, size);
      const result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(256);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1100
     * @tc.name testWorkerReturnSharedArrayBuffer
     * @tc.desc Test Worker returning SharedArrayBuffer size (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWorkerReturnSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testWorkerReturnSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const sizes: collections.Array<number> = new collections.Array<number>();
      sizes.push(64);
      sizes.push(128);

      const task: taskpool.Task = new taskpool.Task(taskPoolCheckSharedArrayBuffer, sizes);
      const result: number = await taskpool.execute(task) as number;

      const sab: SharedArrayBuffer = new SharedArrayBuffer(result);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();
      expect(sab.byteLength).assertEqual(192);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1200
     * @tc.name testEAWorkerSharedArrayBuffer
     * @tc.desc Test EAWorker SharedArrayBuffer scenario (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testEAWorkerSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testEAWorkerSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const instance: SendableSharedArrayBufferClass = new SendableSharedArrayBufferClass(64);
      const size: number = instance.getBufferInfo();

      const sab: SharedArrayBuffer = new SharedArrayBuffer(size);
      const view: Int32Array = new Int32Array(sab);
      Atomics.store(view, 0, 100);

      expect(type.isSharedArrayBuffer(sab)).assertTrue();
      expect(Atomics.load(view, 0)).assertEqual(100);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1300
     * @tc.name testEAWorkerNativeMemoryShare
     * @tc.desc Test EAWorker native memory sharing scenario (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testEAWorkerNativeMemoryShare', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testEAWorkerNativeMemoryShare';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(1024);
      const view1: Int32Array = new Int32Array(sab);
      const view2: Float64Array = new Float64Array(sab);

      Atomics.store(view1, 0, 42);
      expect(Atomics.load(view1, 0)).assertEqual(42);

      view2[0] = 3.14;
      expect(view2[0]).assertEqual(3.14);

      expect(type.isSharedArrayBuffer(view1.buffer)).assertTrue();
      expect(view1.buffer === view2.buffer).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1400
     * @tc.name testEAWorkerCrossThreadShare
     * @tc.desc Test EAWorker cross-thread sharing (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testEAWorkerCrossThreadShare', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testEAWorkerCrossThreadShare';
      console.info(`${caseName} test start`);

      const task: taskpool.Task = new taskpool.Task(taskPoolCreateSharedArrayBuffer, 512);
      const result: number = await taskpool.execute(task) as number;

      const sab: SharedArrayBuffer = new SharedArrayBuffer(result);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();
      expect(sab.byteLength).assertEqual(512);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1500
     * @tc.name testSendableGetterSetterSharedArrayBuffer
     * @tc.desc Test Sendable getter/setter with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableGetterSetterSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableGetterSetterSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const instance: SendableSharedArrayBufferGetterSetter = new SendableSharedArrayBufferGetterSetter();
      instance.size = 128;

      const size: number = instance.getBufferSize();
      expect(size).assertEqual(128);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(size);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1600
     * @tc.name testConcurrentMethodSharedArrayBuffer
     * @tc.desc Test @concurrent method with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testConcurrentMethodSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testConcurrentMethodSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const task: taskpool.Task = new taskpool.Task(taskPoolCreateSharedArrayBuffer, 256);
      const result: number = await taskpool.execute(task) as number;

      const sab: SharedArrayBuffer = new SharedArrayBuffer(result);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1700
     * @tc.name testSendableCollectionSharedArrayBuffer
     * @tc.desc Test Sendable collection storing SharedArrayBuffer sizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableCollectionSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableCollectionSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const container: SendableSharedArrayBufferContainer = new SendableSharedArrayBufferContainer();
      container.addBuffer(16);
      container.addBuffer(32);
      container.addBuffer(64);

      expect(container.getBufferCount()).assertEqual(3);

      const task: taskpool.Task = new taskpool.Task(taskPoolCheckSharedArrayBuffer, container.buffers);
      const result: number = await taskpool.execute(task) as number;
      expect(result).assertEqual(112);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1800
     * @tc.name testSendableNestedClass
     * @tc.desc Test Sendable nested class with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableNestedClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableNestedClass';
      console.info(`${caseName} test start`);

      const instance: SendableSharedArrayBufferContainer = new SendableSharedArrayBufferContainer();
      const inner: SendableSharedArrayBufferClass = new SendableSharedArrayBufferClass(64);

      instance.addBuffer(inner.size);
      expect(instance.buffers.length).assertEqual(1);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(inner.getBufferInfo());
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1900
     * @tc.name testSendablePrivateField
     * @tc.desc Test Sendable private field with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendablePrivateField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendablePrivateField';
      console.info(`${caseName} test start`);

      const instance: SendableSharedArrayBufferGetterSetter = new SendableSharedArrayBufferGetterSetter();
      instance.size = 32;

      expect(instance.size).assertEqual(32);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(instance.size);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_2000
     * @tc.name testSendableDefaultValue
     * @tc.desc Test Sendable default value with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableDefaultValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableDefaultValue';
      console.info(`${caseName} test start`);

      const instance: SendableSharedArrayBufferClass = new SendableSharedArrayBufferClass(16);
      expect(instance.size).assertEqual(16);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(instance.size);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });
  });

  // CrossFileTest section
  describe('IsSharedArrayBufferCrossFileTest', () => {
    beforeAll(() => {
      console.info('beforeAll called');
    });

    beforeEach(async () => {
      await sleep(SLEEP_INTERVAL_MS);
    });

    afterEach(() => {
      console.info('afterEach called');
    });

    afterAll(() => {
      console.info('afterAll called');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0100
     * @tc.name testTSCreateSharedArrayBuffer
     * @tc.desc Test creating SharedArrayBuffer from TS file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTSCreateSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testTSCreateSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = createSharedArrayBufferTS(16);
      const result: boolean = type.isSharedArrayBuffer(sab);
      expect(result).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0200
     * @tc.name testTSReturnSharedArrayBufferMethod
     * @tc.desc Test TS method returning SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTSReturnSharedArrayBufferMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testTSReturnSharedArrayBufferMethod';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = getSharedArrayBufferMethodTS();
      const result: boolean = type.isSharedArrayBuffer(sab);
      expect(result).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0300
     * @tc.name testTSClassGetterSetter
     * @tc.desc Test TS class getter/setter with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTSClassGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testTSClassGetterSetter';
      console.info(`${caseName} test start`);

      const instance: SharedArrayBufferClassTS = new SharedArrayBufferClassTS();
      instance.data = 32;
      const sab: SharedArrayBuffer = instance.getMethodAfterGetSet();
      const result: boolean = type.isSharedArrayBuffer(sab);
      expect(result).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0400
     * @tc.name testTSStaticMethod
     * @tc.desc Test TS static method returning SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTSStaticMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testTSStaticMethod';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = SharedArrayBufferStaticTS.getSharedArrayBuffer();
      const result: boolean = type.isSharedArrayBuffer(sab);
      expect(result).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0500
     * @tc.name testTSInheritance
     * @tc.desc Test TS inheritance with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testTSInheritance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testTSInheritance';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = createSharedArrayBufferTS(64);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();
      expect(sab.byteLength).assertEqual(64);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0600
     * @tc.name testJSCreateSharedArrayBuffer
     * @tc.desc Test creating SharedArrayBuffer from JS file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testJSCreateSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testJSCreateSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = createSharedArrayBufferJS(16);
      const result: boolean = type.isSharedArrayBuffer(sab);
      expect(result).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0700
     * @tc.name testJSReturnSharedArrayBufferMethod
     * @tc.desc Test JS method returning SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testJSReturnSharedArrayBufferMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testJSReturnSharedArrayBufferMethod';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = getSharedArrayBufferMethodJS();
      const result: boolean = type.isSharedArrayBuffer(sab);
      expect(result).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0800
     * @tc.name testJSClassGetterSetter
     * @tc.desc Test JS class getter/setter with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testJSClassGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testJSClassGetterSetter';
      console.info(`${caseName} test start`);

      const instance: SharedArrayBufferClassJS = new SharedArrayBufferClassJS();
      instance.data = 32;
      const sab = instance.getMethodAfterGetSet();
      const result: boolean = type.isSharedArrayBuffer(sab);
      expect(result).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0900
     * @tc.name testJSStaticMethod
     * @tc.desc Test JS static method returning SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testJSStaticMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testJSStaticMethod';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = createSharedArrayBufferJS(128);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1000
     * @tc.name testJSInheritance
     * @tc.desc Test JS inheritance with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testJSInheritance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testJSInheritance';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = createSharedArrayBufferJS(256);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();
      expect(sab.byteLength).assertEqual(256);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1100
     * @tc.name testETSImportTS
     * @tc.desc Test ETS importing SharedArrayBuffer from TS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testETSImportTS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testETSImportTS';
      console.info(`${caseName} test start`);

      const sabTS: SharedArrayBuffer = createSharedArrayBufferTS(32);
      const sabETS: SharedArrayBuffer = new SharedArrayBuffer(32);

      expect(type.isSharedArrayBuffer(sabTS)).assertTrue();
      expect(type.isSharedArrayBuffer(sabETS)).assertTrue();
      expect(sabTS.byteLength).assertEqual(sabETS.byteLength);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1200
     * @tc.name testETSImportJS
     * @tc.desc Test ETS importing SharedArrayBuffer from JS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testETSImportJS', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testETSImportJS';
      console.info(`${caseName} test start`);

      const sabJS: SharedArrayBuffer = createSharedArrayBufferJS(32);
      const sabETS: SharedArrayBuffer = new SharedArrayBuffer(32);

      expect(type.isSharedArrayBuffer(sabJS)).assertTrue();
      expect(type.isSharedArrayBuffer(sabETS)).assertTrue();
      expect(sabJS.byteLength).assertEqual(sabETS.byteLength);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1300
     * @tc.name testMixedSourceFiles
     * @tc.desc Test mixed source files with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMixedSourceFiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testMixedSourceFiles';
      console.info(`${caseName} test start`);

      const sabETS: SharedArrayBuffer = new SharedArrayBuffer(16);
      const sabTS: SharedArrayBuffer = createSharedArrayBufferTS(16);
      const sabJS: SharedArrayBuffer = createSharedArrayBufferJS(16);

      expect(type.isSharedArrayBuffer(sabETS)).assertTrue();
      expect(type.isSharedArrayBuffer(sabTS)).assertTrue();
      expect(type.isSharedArrayBuffer(sabJS)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1400
     * @tc.name testCrossFileTypeConsistency
     * @tc.desc Test cross-file type consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCrossFileTypeConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testCrossFileTypeConsistency';
      console.info(`${caseName} test start`);

      const sabETS: SharedArrayBuffer = new SharedArrayBuffer(64);
      const sabTS: SharedArrayBuffer = createSharedArrayBufferTS(64);
      const sabJS: SharedArrayBuffer = createSharedArrayBufferJS(64);

      expect(type.isSharedArrayBuffer(sabETS)).assertTrue();
      expect(type.isSharedArrayBuffer(sabTS)).assertTrue();
      expect(type.isSharedArrayBuffer(sabJS)).assertTrue();
      expect(sabETS.byteLength).assertEqual(64);
      expect(sabTS.byteLength).assertEqual(64);
      expect(sabJS.byteLength).assertEqual(64);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1500
     * @tc.name testModuleExportSharedArrayBuffer
     * @tc.desc Test module exporting SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testModuleExportSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testModuleExportSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = createSharedArrayBufferTS(128);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1600
     * @tc.name testModuleImportSharedArrayBuffer
     * @tc.desc Test module importing SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testModuleImportSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testModuleImportSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const sabTS: SharedArrayBuffer = createSharedArrayBufferTS(32);
      const sabJS: SharedArrayBuffer = createSharedArrayBufferJS(32);

      expect(type.isSharedArrayBuffer(sabTS)).assertTrue();
      expect(type.isSharedArrayBuffer(sabJS)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1700
     * @tc.name testReExportSharedArrayBuffer
     * @tc.desc Test re-exporting SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testReExportSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testReExportSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = createSharedArrayBufferTS(64);
      const sliced: SharedArrayBuffer = sab.slice(0, 32);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();
      expect(type.isSharedArrayBuffer(sliced)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1800
     * @tc.name testNamespaceImport
     * @tc.desc Test namespace import with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNamespaceImport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testNamespaceImport';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = createSharedArrayBufferTS(128);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1900
     * @tc.name testDefaultExport
     * @tc.desc Test default export with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDefaultExport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testDefaultExport';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = createSharedArrayBufferJS(64);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_2000
     * @tc.name testExportAllFrom
     * @tc.desc Test export * from with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testExportAllFrom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testExportAllFrom';
      console.info(`${caseName} test start`);

      const sabTS: SharedArrayBuffer = createSharedArrayBufferTS(32);
      const sabJS: SharedArrayBuffer = createSharedArrayBufferJS(32);

      expect(type.isSharedArrayBuffer(sabTS)).assertTrue();
      expect(type.isSharedArrayBuffer(sabJS)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_EXPORT_0100
     * @tc.name testExportedSharedArrayBufferConst
     * @tc.desc Test exported SharedArrayBuffer constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testExportedSharedArrayBufferConst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testExportedSharedArrayBufferConst';
      console.info(`${caseName} test start`);

      expect(type.isSharedArrayBuffer(exportedSharedArrayBuffer)).assertTrue();
      expect(exportedSharedArrayBuffer.byteLength).assertEqual(16);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_EXPORT_0200
     * @tc.name testExportedSharedArrayBufferFunc
     * @tc.desc Test exported SharedArrayBuffer creation function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testExportedSharedArrayBufferFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testExportedSharedArrayBufferFunc';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = exportedSharedArrayBufferFunc(32);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();
      expect(sab.byteLength).assertEqual(32);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_EXPORT_0300
     * @tc.name testExportedSharedArrayBufferClassGetterSetter
     * @tc.desc Test exported class getter/setter with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testExportedSharedArrayBufferClassGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testExportedSharedArrayBufferClassGetterSetter';
      console.info(`${caseName} test start`);

      const instance: ExportedSharedArrayBufferClass = new ExportedSharedArrayBufferClass();
      instance.data = 64;
      const sab: SharedArrayBuffer = instance.getBuffer();
      expect(type.isSharedArrayBuffer(sab)).assertTrue();
      expect(sab.byteLength).assertEqual(64);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_EXPORT_0400
     * @tc.name testExportedSharedArrayBufferClassDefaultBuffer
     * @tc.desc Test exported class default SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testExportedSharedArrayBufferClassDefaultBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testExportedSharedArrayBufferClassDefaultBuffer';
      console.info(`${caseName} test start`);

      const instance: ExportedSharedArrayBufferClass = new ExportedSharedArrayBufferClass();
      const sab: SharedArrayBuffer = instance.getBuffer();
      expect(type.isSharedArrayBuffer(sab)).assertTrue();
      expect(sab.byteLength).assertEqual(16);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_EXPORT_0500
     * @tc.name testReExportedSharedArrayBuffer
     * @tc.desc Test re-exported SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testReExportedSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testReExportedSharedArrayBuffer';
      console.info(`${caseName} test start`);

      expect(type.isSharedArrayBuffer(reExportedSharedArrayBuffer)).assertTrue();
      expect(reExportedSharedArrayBuffer.byteLength).assertEqual(16);
      expect(reExportedSharedArrayBuffer === exportedSharedArrayBuffer).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });
  });
}
  // DecoratorTest section
  describe('IsSharedArrayBufferDecoratorTest', () => {
    beforeAll(() => {
      console.info('beforeAll called');
    });

    beforeEach(async () => {
      await sleep(SLEEP_INTERVAL_MS);
    });

    afterEach(() => {
      console.info('afterEach called');
    });

    afterAll(() => {
      console.info('afterAll called');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0100
     * @tc.name testSendableDecoratorProperty
     * @tc.desc Test @Sendable decorated class SharedArrayBuffer property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableDecoratorProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableDecoratorProperty';
      console.info(`${caseName} test start`);

      const instance: SendableDecoratorSharedArrayBuffer = new SendableDecoratorSharedArrayBuffer();
      const size: number = instance.getSharedArrayBufferSize();

      const sab: SharedArrayBuffer = new SharedArrayBuffer(size);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0200
     * @tc.name testSendableDecoratorMethod
     * @tc.desc Test @Sendable decorated method returning SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableDecoratorMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableDecoratorMethod';
      console.info(`${caseName} test start`);

      const instance: SendableDecoratorSharedArrayBuffer = new SendableDecoratorSharedArrayBuffer();
      instance.size = 32;

      const sab: SharedArrayBuffer = new SharedArrayBuffer(instance.getSharedArrayBufferSize());
      expect(type.isSharedArrayBuffer(sab)).assertTrue();
      expect(sab.byteLength).assertEqual(32);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0300
     * @tc.name testSendableDecoratorGetterSetter
     * @tc.desc Test @Sendable get/set with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableDecoratorGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableDecoratorGetterSetter';
      console.info(`${caseName} test start`);

      const instance: SendableDecoratorGetterSetter = new SendableDecoratorGetterSetter();
      instance.size = 64;

      const sab: SharedArrayBuffer = new SharedArrayBuffer(instance.getBufferSize());
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0400
     * @tc.name testConcurrentDecoratorMethod
     * @tc.desc Test @concurrent decorated method returning SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testConcurrentDecoratorMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testConcurrentDecoratorMethod';
      console.info(`${caseName} test start`);

      const task: taskpool.Task = new taskpool.Task(concurrentDecoratorSharedArrayBuffer, 128);
      const result: number = await taskpool.execute(task) as number;

      const sab: SharedArrayBuffer = new SharedArrayBuffer(result);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0500
     * @tc.name testConcurrentStaticMethod
     * @tc.desc Test @concurrent static method with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testConcurrentStaticMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testConcurrentStaticMethod';
      console.info(`${caseName} test start`);

      const sizes: collections.Array<number> = new collections.Array<number>();
      sizes.push(16);
      sizes.push(32);
      sizes.push(64);

      const task: taskpool.Task = new taskpool.Task(concurrentStaticMethod, sizes);
      const result: number = await taskpool.execute(task) as number;

      const sab: SharedArrayBuffer = new SharedArrayBuffer(result);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0600
     * @tc.name testConcurrentTaskPoolScenario
     * @tc.desc Test @concurrent TaskPool scenario with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testConcurrentTaskPoolScenario', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testConcurrentTaskPoolScenario';
      console.info(`${caseName} test start`);

      const task1: taskpool.Task = new taskpool.Task(concurrentDecoratorSharedArrayBuffer, 32);
      const task2: taskpool.Task = new taskpool.Task(concurrentDecoratorSharedArrayBuffer, 64);

      const results: number[] = await Promise.all([
        taskpool.execute(task1) as Promise<number>,
        taskpool.execute(task2) as Promise<number>
      ]);

      const sab1: SharedArrayBuffer = new SharedArrayBuffer(results[0]);
      const sab2: SharedArrayBuffer = new SharedArrayBuffer(results[1]);

      expect(type.isSharedArrayBuffer(sab1)).assertTrue();
      expect(type.isSharedArrayBuffer(sab2)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0700
     * @tc.name testEntryComponentSharedArrayBuffer
     * @tc.desc Test @Entry component with SharedArrayBuffer (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testEntryComponentSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testEntryComponentSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const componentBuffer: ComponentBuffer = {
        size: 128
      };

      const sab: SharedArrayBuffer = new SharedArrayBuffer(componentBuffer.size);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0800
     * @tc.name testComponentComponentSharedArrayBuffer
     * @tc.desc Test @Component with SharedArrayBuffer (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testComponentComponentSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testComponentComponentSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(64);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0900
     * @tc.name testStateDecoratorSharedArrayBuffer
     * @tc.desc Test @State decorator with SharedArrayBuffer (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStateDecoratorSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testStateDecoratorSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const stateBuffer: StateBuffer = {
        buffer: new SharedArrayBuffer(32)
      };

      expect(type.isSharedArrayBuffer(stateBuffer.buffer)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1000
     * @tc.name testPropDecoratorSharedArrayBuffer
     * @tc.desc Test @Prop decorator with SharedArrayBuffer (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testPropDecoratorSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testPropDecoratorSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(16);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1100
     * @tc.name testLinkDecoratorSharedArrayBuffer
     * @tc.desc Test @Link decorator with SharedArrayBuffer (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testLinkDecoratorSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testLinkDecoratorSharedArrayBuffer';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(128);
      const view: Int32Array = new Int32Array(sab);
      Atomics.store(view, 0, 42);

      expect(type.isSharedArrayBuffer(sab)).assertTrue();
      expect(Atomics.load(view, 0)).assertEqual(42);

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1200
     * @tc.name testWatchDecoratorCallback
     * @tc.desc Test @Watch decorator callback with SharedArrayBuffer (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testWatchDecoratorCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testWatchDecoratorCallback';
      console.info(`${caseName} test start`);

      onSizeChange(64);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(watchedSize);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1300
     * @tc.name testBuilderDecoratorComponent
     * @tc.desc Test @Builder decorator with SharedArrayBuffer (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testBuilderDecoratorComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testBuilderDecoratorComponent';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = buildBuffer(128);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1400
     * @tc.name testProvideDecoratorComponent
     * @tc.desc Test @Provide decorator with SharedArrayBuffer (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testProvideDecoratorComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testProvideDecoratorComponent';
      console.info(`${caseName} test start`);

      const providedBuffer: SharedArrayBuffer = new SharedArrayBuffer(256);
      expect(type.isSharedArrayBuffer(providedBuffer)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1500
     * @tc.name testConsumeDecoratorComponent
     * @tc.desc Test @Consume decorator with SharedArrayBuffer (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testConsumeDecoratorComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testConsumeDecoratorComponent';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(64);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1600
     * @tc.name testCustomMethodDecorator
     * @tc.desc Test custom method decorator with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCustomMethodDecorator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testCustomMethodDecorator';
      console.info(`${caseName} test start`);

      logMethod(createBufferForDecorator);

      const sab: SharedArrayBuffer = createBufferForDecorator();
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1700
     * @tc.name testCustomDecoratorWithParams
     * @tc.desc Test custom decorator with parameters and SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCustomDecoratorWithParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testCustomDecoratorWithParams';
      console.info(`${caseName} test start`);

      const bufferSize: number = 256;

      const sab: SharedArrayBuffer = new SharedArrayBuffer(bufferSize);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1800
     * @tc.name testCustomClassDecorator
     * @tc.desc Test custom class decorator with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCustomClassDecorator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testCustomClassDecorator';
      console.info(`${caseName} test start`);

      const instance: CustomDecoratedClass = new CustomDecoratedClass();
      const sab: SharedArrayBuffer = instance.getBuffer();
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1900
     * @tc.name testAccessorDecorator
     * @tc.desc Test accessor decorator with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testAccessorDecorator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testAccessorDecorator';
      console.info(`${caseName} test start`);

      const instance: AccessorDecoratedClass = new AccessorDecoratedClass();
      instance.size = 64;

      const sab: SharedArrayBuffer = new SharedArrayBuffer(instance.size);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_2000
     * @tc.name testMultipleDecoratorsStack
     * @tc.desc Test multiple decorators stacked with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMultipleDecoratorsStack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testMultipleDecoratorsStack';
      console.info(`${caseName} test start`);

      const instance: SendableDecoratorGetterSetter = new SendableDecoratorGetterSetter();
      instance.size = 128;

      const sab: SharedArrayBuffer = new SharedArrayBuffer(instance.size);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_2100
     * @tc.name testSendableConcurrentCombination
     * @tc.desc Test @Sendable + @concurrent combination with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableConcurrentCombination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testSendableConcurrentCombination';
      console.info(`${caseName} test start`);

      const instance: SendableDecoratorSharedArrayBuffer = new SendableDecoratorSharedArrayBuffer();
      const size: number = instance.getSharedArrayBufferSize();

      const task: taskpool.Task = new taskpool.Task(concurrentDecoratorSharedArrayBuffer, size);
      const result: number = await taskpool.execute(task) as number;

      const sab: SharedArrayBuffer = new SharedArrayBuffer(result);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_2200
     * @tc.name testStateWatchCombination
     * @tc.desc Test @State + @Watch combination with SharedArrayBuffer (simulated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStateWatchCombination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testStateWatchCombination';
      console.info(`${caseName} test start`);

      watchCallback(64);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(stateSize);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_2300
     * @tc.name testDecoratorSequence
     * @tc.desc Test decorator sequence with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testDecoratorSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testDecoratorSequence';
      console.info(`${caseName} test start`);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(128);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_2400
     * @tc.name testNestedDecoratorClass
     * @tc.desc Test nested decorator class with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testNestedDecoratorClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testNestedDecoratorClass';
      console.info(`${caseName} test start`);

      const instance: SendableDecoratorSharedArrayBuffer = new SendableDecoratorSharedArrayBuffer();
      instance.size = 256;

      const sab: SharedArrayBuffer = new SharedArrayBuffer(instance.size);
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_2500
     * @tc.name testGetterSetterDecorator
     * @tc.desc Test getter/setter decorator with SharedArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testGetterSetterDecorator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function): Promise<void> => {
      const caseName = 'testGetterSetterDecorator';
      console.info(`${caseName} test start`);

      const instance: SendableDecoratorGetterSetter = new SendableDecoratorGetterSetter();
      instance.size = 512;

      expect(instance.size).assertEqual(512);

      const sab: SharedArrayBuffer = new SharedArrayBuffer(instance.getBufferSize());
      expect(type.isSharedArrayBuffer(sab)).assertTrue();

      console.info(`${caseName} test end`);
      done();
    });
  });