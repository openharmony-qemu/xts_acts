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

// ArkTS 1.2 静态迁移说明（对应动态 builtins_async_test/.../test/isSharedArrayBuffer/）：
// 1) 静态模型无 SharedArrayBuffer / util.types.isSharedArrayBuffer，等价替换为
//    ArrayBuffer + util.types.isAnyArrayBuffer（语义即“ArrayBuffer 或 SharedArrayBuffer 的缓冲识别”），
//    并在区分性断言处配合 util.types.isArrayBuffer。
// 2) 动态 @Sendable/@Concurrent 装饰器移除：类退化为普通顶层类，
//    TaskPool 使用普通顶层函数（与 isPromise/isAsyncFunction 静态范式一致）。
// 3) 动态专属 Worker/EAWorker/装饰器/Symbol/JS-TS 互操作用例不伪装原 API 覆盖：
//    可表达测试点改写为静态等价（跨 TaskPool 共享 ArrayBuffer、typed view、
//    跨文件 export/reexport），不适用的（JS 互操作、ArkUI 装饰器、自定义装饰器、namespace）
//    不迁移，见交付清单。

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index';
import util from '@ohos.util';
import defaultArrayBuffer, {
  exportedArrayBuffer,
  exportedArrayBufferFunc,
  ExportedArrayBufferClass
} from './arrayBufferExportModule';
import * as arrayBufferNamespace from './arrayBufferExportModule';
import * as reExportNamespace from './arrayBufferReexportModule';
import {
  createArrayBufferTS,
  getArrayBufferMethodTS,
  ArrayBufferClassTS,
  ArrayBufferStaticTS
} from './arrayBufferTS';

class ArrayBufferClassGetMethodBefore {
  private _data: ArrayBuffer | null = null;

  getMethodBeforeGet(): ArrayBuffer {
    let data: ArrayBuffer | null = this._data;
    if (data === null) {
      data = new ArrayBuffer(16);
      this._data = data;
    }
    return data;
  }

  get data(): int {
    const data: ArrayBuffer | null = this._data;
    return data !== null ? data.byteLength : 0;
  }
}

class ArrayBufferClassGetMethodAfter {
  private _data: ArrayBuffer | null = null;

  get data(): int {
    const data: ArrayBuffer | null = this._data;
    return data !== null ? data.byteLength : 0;
  }

  getMethodAfterGet(): ArrayBuffer {
    let data: ArrayBuffer | null = this._data;
    if (data === null) {
      data = new ArrayBuffer(16);
      this._data = data;
    }
    return data;
  }
}

class ArrayBufferClassSetMethod {
  private _data: ArrayBuffer | null = null;

  set data(value: int) {
    if (this._data === null) {
      this._data = new ArrayBuffer(value);
    }
  }

  getMethodAfterSet(): ArrayBuffer {
    let data: ArrayBuffer | null = this._data;
    if (data === null) {
      data = new ArrayBuffer(16);
      this._data = data;
    }
    return data;
  }
}

class ArrayBufferClassGetSetMethod {
  private _data: ArrayBuffer | null = null;

  get data(): int {
    const data: ArrayBuffer | null = this._data;
    return data !== null ? data.byteLength : 0;
  }

  set data(value: int) {
    this._data = new ArrayBuffer(value);
  }

  getMethodAfterGetSet(): ArrayBuffer {
    let data: ArrayBuffer | null = this._data;
    if (data === null) {
      data = new ArrayBuffer(16);
      this._data = data;
    }
    return data;
  }
}

class ArrayBufferClassMultiGetSet {
  private _data: ArrayBuffer | null = null;

  get size(): int {
    const data: ArrayBuffer | null = this._data;
    return data !== null ? data.byteLength : 0;
  }

  get length(): int {
    const data: ArrayBuffer | null = this._data;
    return data !== null ? data.byteLength : 0;
  }

  set size(value: int) {
    this._data = new ArrayBuffer(value);
  }

  set length(value: int) {
    this._data = new ArrayBuffer(value);
  }

  getMethodBetweenGetSet(): ArrayBuffer {
    let data: ArrayBuffer | null = this._data;
    if (data === null) {
      data = new ArrayBuffer(16);
      this._data = data;
    }
    return data;
  }
}

class ArrayBufferClassOnlyGet {
  private _data: ArrayBuffer | null = null;

  get data(): int {
    let data: ArrayBuffer | null = this._data;
    if (data === null) {
      data = new ArrayBuffer(16);
      this._data = data;
    }
    return data.byteLength;
  }

  getMethodAfterOnlyGet(): ArrayBuffer {
    let data: ArrayBuffer | null = this._data;
    if (data === null) {
      data = new ArrayBuffer(16);
      this._data = data;
    }
    return data;
  }
}

class ArrayBufferClassOnlySet {
  private _data: ArrayBuffer | null = null;

  set data(value: int) {
    this._data = new ArrayBuffer(value);
  }

  getMethodAfterOnlySet(): ArrayBuffer {
    let data: ArrayBuffer | null = this._data;
    if (data === null) {
      data = new ArrayBuffer(16);
      this._data = data;
    }
    return data;
  }
}

class ArrayBufferStatic {
  private static _instance: ArrayBuffer | null = null;

  static getSharedArrayBuffer(): ArrayBuffer {
    let instance: ArrayBuffer | null = ArrayBufferStatic._instance;
    if (instance === null) {
      instance = new ArrayBuffer(16);
      ArrayBufferStatic._instance = instance;
    }
    return instance;
  }

  static get staticData(): int {
    const instance: ArrayBuffer | null = ArrayBufferStatic._instance;
    return instance !== null ? instance.byteLength : 0;
  }

  static set staticData(value: int) {
    ArrayBufferStatic._instance = new ArrayBuffer(value);
  }

  static getMethodAfterStaticGetter(): ArrayBuffer {
    let instance: ArrayBuffer | null = ArrayBufferStatic._instance;
    if (instance === null) {
      instance = new ArrayBuffer(16);
      ArrayBufferStatic._instance = instance;
    }
    return instance;
  }
}

class ArrayBufferBase {
  private _data: ArrayBuffer | null = null;

  getBuffer(): ArrayBuffer {
    let data: ArrayBuffer | null = this._data;
    if (data === null) {
      data = new ArrayBuffer(16);
      this._data = data;
    }
    return data;
  }
}

class ArrayBufferDerived extends ArrayBufferBase {
  getDerivedBuffer(): ArrayBuffer {
    return this.getBuffer();
  }
}

class ArrayBufferOverride extends ArrayBufferBase {
  private _derivedData: ArrayBuffer | null = null;

  getBuffer(): ArrayBuffer {
    let data: ArrayBuffer | null = this._derivedData;
    if (data === null) {
      data = new ArrayBuffer(32);
      this._derivedData = data;
    }
    return data;
  }
}

interface PlainBufferObject {
  length: int;
}

interface NestedBufferValue {
  value: int;
}

interface NestedBufferObject {
  buffer: ArrayBuffer;
  nested: NestedBufferValue;
}

// 静态等价：动态 DynamicObjectTS 依赖索引签名（静态禁用），改为显式类型化持有类
class DynamicBufferHolder {
  public buffer: ArrayBuffer;
  public value: int;

  constructor(buffer: ArrayBuffer, value: int) {
    this.buffer = buffer;
    this.value = value;
  }
}

function createDynamicBufferHolder(buffer: ArrayBuffer): DynamicBufferHolder {
  return new DynamicBufferHolder(buffer, 42);
}

function checkAnyArrayBuffer(buffer: ArrayBuffer): boolean {
  const type: util.types = new util.types();
  return type.isAnyArrayBuffer(buffer);
}

function createArrayBuffer(): ArrayBuffer {
  return new ArrayBuffer(16);
}

// 静态等价：动态 @Sendable 类退化为普通顶层类，@Concurrent 函数退化为普通顶层函数
class BufferSizeClass {
  public size: int = 16;

  constructor(size: int) {
    this.size = size;
  }

  getBufferInfo(): int {
    return this.size;
  }

  createBufferInfo(): int {
    return this.size * 2;
  }
}

class BufferSizeContainer {
  public buffers: number[] = [];

  addBuffer(size: int): void {
    this.buffers.push(size);
  }

  getBufferCount(): int {
    return this.buffers.length;
  }
}

class BufferSingleton {
  private static instance: BufferSingleton | null = null;
  public size: int = 16;

  static getInstance(): BufferSingleton {
    if (BufferSingleton.instance === null) {
      BufferSingleton.instance = new BufferSingleton();
    }
    return BufferSingleton.instance as BufferSingleton;
  }

  getSize(): int {
    return this.size;
  }
}

class BufferSizeBase {
  public size: int = 16;

  getBufferSize(): int {
    return this.size;
  }
}

class BufferSizeDerived extends BufferSizeBase {
  public multiplier: int = 2;

  getDerivedSize(): int {
    return this.size * this.multiplier;
  }
}

class BufferGetterSetter {
  private _size: int = 16;

  get size(): int {
    return this._size;
  }

  set size(value: int) {
    this._size = value;
  }

  getBufferSize(): int {
    return this._size;
  }
}

function taskPoolCreateArrayBuffer(size: int): int {
  const ab: ArrayBuffer = new ArrayBuffer(size);
  return ab.byteLength;
}

function taskPoolSumBufferSizes(sizes: number[]): int {
  let total: int = 0;
  for (let i: int = 0; i < sizes.length; i++) {
    total = total + sizes[i].toInt();
  }
  return total;
}

class DecoratorBufferSizeClass {
  public size: int = 16;

  getBufferSize(): int {
    return this.size;
  }
}

class DecoratorBufferGetterSetter {
  private _size: int = 16;

  get size(): int {
    return this._size;
  }

  set size(value: int) {
    this._size = value;
  }

  getBufferSize(): int {
    return this._size;
  }
}

function concurrentCreateArrayBuffer(size: int): int {
  const ab: ArrayBuffer = new ArrayBuffer(size);
  return ab.byteLength;
}

function concurrentSumBufferSizes(sizes: number[]): int {
  let total: int = 0;
  for (let i: int = 0; i < sizes.length; i++) {
    total = total + sizes[i].toInt();
  }
  return total;
}

// 静态等价：模拟 ArkUI/custom 装饰器用例（来源本身为 simulated 普通逻辑），
// 装饰器均退化为普通 interface/类/顶层函数；SharedArrayBuffer→ArrayBuffer，number 尺寸→int
interface ComponentBuffer {
  size: int;
}

interface StateBuffer {
  buffer: ArrayBuffer;
}

let watchedSize: int = 32;

function onSizeChange(newSize: int): void {
  watchedSize = newSize;
}

function buildBuffer(size: int): ArrayBuffer {
  return new ArrayBuffer(size);
}

function logMethod(target: () => ArrayBuffer): void {
  console.info('Method decorated');
}

function createBufferForDecorator(): ArrayBuffer {
  return new ArrayBuffer(128);
}

class CustomDecoratedClass {
  public bufferSize: int = 128;

  getBuffer(): ArrayBuffer {
    return new ArrayBuffer(this.bufferSize);
  }
}

class AccessorDecoratedClass {
  private _size: int = 16;

  get size(): int {
    return this._size;
  }

  set size(value: int) {
    this._size = value;
  }
}

let stateSize: int = 32;

function watchCallback(newSize: int): void {
  stateSize = newSize;
}

export default function IsSharedArrayBufferTest(): void {
  describe('IsSharedArrayBufferTest', (): void => {
    beforeAll((): void => {
      console.info('beforeAll called');
    });

    beforeEach((): void => {
    });

    afterEach((): void => {
      console.info('afterEach called');
    });

    afterAll((): void => {
      console.info('afterAll called');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0100
     * @tc.name testIsSharedArrayBufferBasic
     * @tc.desc 静态等价：ArrayBuffer 创建后 isAnyArrayBuffer 识别为缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferBasic';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0200
     * @tc.name testIsSharedArrayBufferSpecificSize
     * @tc.desc 静态等价：指定大小 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferSpecificSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferSpecificSize';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(1024);
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0300
     * @tc.name testIsSharedArrayBufferZeroSize
     * @tc.desc 静态等价：零字节 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferZeroSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferZeroSize';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(0);
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0400
     * @tc.name testIsSharedArrayBufferLargeSize
     * @tc.desc 静态等价：大尺寸 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferLargeSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferLargeSize';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(1024 * 1024);
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0500
     * @tc.name testIsSharedArrayBufferSlice
     * @tc.desc 静态等价：ArrayBuffer.slice() 产物仍识别为缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferSlice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferSlice';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const sliced: ArrayBuffer = ab.slice(0, 8);
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(sliced);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0600
     * @tc.name testIsSharedArrayBufferInt8ArrayView
     * @tc.desc 静态等价：Int8Array 视图底层 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferInt8ArrayView', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferInt8ArrayView';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const view: Int8Array = new Int8Array(ab);
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(view.buffer);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0700
     * @tc.name testIsSharedArrayBufferFloat64ArrayView
     * @tc.desc 静态等价：Float64Array 视图底层 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferFloat64ArrayView', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferFloat64ArrayView';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(32);
        const view: Float64Array = new Float64Array(ab);
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(view.buffer);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0800
     * @tc.name testIsSharedArrayBufferMultipleViews
     * @tc.desc 静态等价：同一 ArrayBuffer 的多 TypedArray 视图共享底层缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferMultipleViews', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferMultipleViews';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const int8View: Int8Array = new Int8Array(ab);
        const int16View: Int16Array = new Int16Array(ab);
        const uint8View: Uint8Array = new Uint8Array(ab);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(int8View.buffer)).assertTrue();
        expect(type.isAnyArrayBuffer(int16View.buffer)).assertTrue();
        expect(type.isAnyArrayBuffer(uint8View.buffer)).assertTrue();
        expect(int8View.buffer === int16View.buffer).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_0900
     * @tc.name testIsSharedArrayBufferMethodBeforeGetter
     * @tc.desc 静态等价：getter 前定义的方法返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferMethodBeforeGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferMethodBeforeGetter';
        console.info(`${caseName} test start`);

        const instance: ArrayBufferClassGetMethodBefore = new ArrayBufferClassGetMethodBefore();
        const ab: ArrayBuffer = instance.getMethodBeforeGet();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1000
     * @tc.name testIsSharedArrayBufferMethodAfterGetter
     * @tc.desc 静态等价：getter 后定义的方法返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferMethodAfterGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferMethodAfterGetter';
        console.info(`${caseName} test start`);

        const instance: ArrayBufferClassGetMethodAfter = new ArrayBufferClassGetMethodAfter();
        const ab: ArrayBuffer = instance.getMethodAfterGet();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1100
     * @tc.name testIsSharedArrayBufferMethodAfterSetter
     * @tc.desc 静态等价：setter 后定义的方法返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferMethodAfterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferMethodAfterSetter';
        console.info(`${caseName} test start`);

        const instance: ArrayBufferClassSetMethod = new ArrayBufferClassSetMethod();
        instance.data = 32;
        const ab: ArrayBuffer = instance.getMethodAfterSet();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1200
     * @tc.name testIsSharedArrayBufferMethodAfterGetterSetter
     * @tc.desc 静态等价：getter/setter 后定义的方法返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferMethodAfterGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferMethodAfterGetterSetter';
        console.info(`${caseName} test start`);

        const instance: ArrayBufferClassGetSetMethod = new ArrayBufferClassGetSetMethod();
        instance.data = 32;
        const ab: ArrayBuffer = instance.getMethodAfterGetSet();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1300
     * @tc.name testIsSharedArrayBufferMethodBetweenMultipleGetSet
     * @tc.desc 静态等价：多组 getter/setter 之间定义的方法返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferMethodBetweenMultipleGetSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferMethodBetweenMultipleGetSet';
        console.info(`${caseName} test start`);

        const instance: ArrayBufferClassMultiGetSet = new ArrayBufferClassMultiGetSet();
        instance.size = 64;
        const ab: ArrayBuffer = instance.getMethodBetweenGetSet();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1400
     * @tc.name testIsSharedArrayBufferMethodAfterOnlyGetter
     * @tc.desc 静态等价：仅有 getter 时方法返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferMethodAfterOnlyGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferMethodAfterOnlyGetter';
        console.info(`${caseName} test start`);

        const instance: ArrayBufferClassOnlyGet = new ArrayBufferClassOnlyGet();
        const ab: ArrayBuffer = instance.getMethodAfterOnlyGet();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1500
     * @tc.name testIsSharedArrayBufferMethodAfterOnlySetter
     * @tc.desc 静态等价：仅有 setter 时方法返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferMethodAfterOnlySetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferMethodAfterOnlySetter';
        console.info(`${caseName} test start`);

        const instance: ArrayBufferClassOnlySet = new ArrayBufferClassOnlySet();
        instance.data = 32;
        const ab: ArrayBuffer = instance.getMethodAfterOnlySet();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1600
     * @tc.name testIsSharedArrayBufferStaticMethod
     * @tc.desc 静态等价：静态方法返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferStaticMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferStaticMethod';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = ArrayBufferStatic.getSharedArrayBuffer();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1700
     * @tc.name testIsSharedArrayBufferStaticGetterSetter
     * @tc.desc 静态等价：静态 getter/setter 与静态方法返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferStaticGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferStaticGetterSetter';
        console.info(`${caseName} test start`);

        ArrayBufferStatic.staticData = 64;
        const ab: ArrayBuffer = ArrayBufferStatic.getMethodAfterStaticGetter();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1800
     * @tc.name testIsSharedArrayBufferInheritance
     * @tc.desc 静态等价：继承类返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferInheritance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferInheritance';
        console.info(`${caseName} test start`);

        const instance: ArrayBufferDerived = new ArrayBufferDerived();
        const ab: ArrayBuffer = instance.getDerivedBuffer();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_1900
     * @tc.name testIsSharedArrayBufferOverride
     * @tc.desc 静态等价：覆写方法返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferOverride';
        console.info(`${caseName} test start`);

        const instance: ArrayBufferOverride = new ArrayBufferOverride();
        const ab: ArrayBuffer = instance.getBuffer();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2000
     * @tc.name testIsSharedArrayBufferVsArrayBuffer
     * @tc.desc 静态等价：ArrayBuffer 在静态模型即共享缓冲等价物，isAnyArrayBuffer/isArrayBuffer 均识别为缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferVsArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferVsArrayBuffer';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const type: util.types = new util.types();
        const anyResult: boolean = type.isAnyArrayBuffer(ab);
        const bufferResult: boolean = type.isArrayBuffer(ab);
        expect(anyResult).assertTrue();
        expect(bufferResult).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2100
     * @tc.name testIsSharedArrayBufferPlainObject
     * @tc.desc 静态等价：普通对象不应识别为缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferPlainObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferPlainObject';
        console.info(`${caseName} test start`);

        const obj: PlainBufferObject = { length: 16 };
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(obj);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2200
     * @tc.name testIsSharedArrayBufferTypedArray
     * @tc.desc 静态等价：TypedArray 实例本身不应识别为缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferTypedArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferTypedArray';
        console.info(`${caseName} test start`);

        const arr: Int8Array = new Int8Array(16);
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(arr);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2300
     * @tc.name testIsSharedArrayBufferDataView
     * @tc.desc 静态等价：DataView 实例不应识别为缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferDataView', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferDataView';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const dv: DataView = new DataView(ab);
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(dv);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2400
     * @tc.name testIsSharedArrayBufferArray
     * @tc.desc 静态等价：数组不应识别为缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferArray';
        console.info(`${caseName} test start`);

        const arr: number[] = [1, 2, 3, 4];
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(arr);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2500
     * @tc.name testIsSharedArrayBufferString
     * @tc.desc 静态等价：字符串不应识别为缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferString';
        console.info(`${caseName} test start`);

        const str: string = 'test string';
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(str);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2600
     * @tc.name testIsSharedArrayBufferNumber
     * @tc.desc 静态等价：数字不应识别为缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferNumber';
        console.info(`${caseName} test start`);

        const num: int = 123;
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(num);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2700
     * @tc.name testIsSharedArrayBufferBoolean
     * @tc.desc 静态等价：布尔值不应识别为缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferBoolean';
        console.info(`${caseName} test start`);

        const bool: boolean = true;
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(bool);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_2800
     * @tc.name testIsSharedArrayBufferNullUndefined
     * @tc.desc 静态等价：Object 转换拒绝 null/undefined，缓冲检测不会执行
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferNullUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferNullUndefined';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        let nullCastRejected: boolean = false;
        try {
          type.isAnyArrayBuffer(null as Object);
        } catch (error) {
          nullCastRejected = true;
        }
        expect(nullCastRejected).assertTrue();

        let undefinedCastRejected: boolean = false;
        try {
          type.isAnyArrayBuffer(undefined as Object);
        } catch (error) {
          undefinedCastRejected = true;
        }
        expect(undefinedCastRejected).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_3500
     * @tc.name testIsSharedArrayBufferFunctionParam
     * @tc.desc 静态等价：函数不应识别为缓冲（Function 类型静态禁用，改用具名函数类型）
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSharedArrayBufferFunctionParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const caseName = 'testIsSharedArrayBufferFunctionParam';
        console.info(`${caseName} test start`);

        const func: () => void = (): void => {
        };
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(func);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_3600
     * @tc.name testIsSharedArrayBufferArrayParam
     * @tc.desc 静态等价：数组参数不应识别为缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSharedArrayBufferArrayParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const caseName = 'testIsSharedArrayBufferArrayParam';
        console.info(`${caseName} test start`);

        const arr: number[] = [1, 2, 3];
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(arr);
        expect(result).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_3700
     * @tc.name testIsSharedArrayBufferMapSetParam
     * @tc.desc 静态等价：Map/Set 参数不应识别为缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testIsSharedArrayBufferMapSetParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const caseName = 'testIsSharedArrayBufferMapSetParam';
        console.info(`${caseName} test start`);

        const map: Map<string, number> = new Map<string, number>();
        const set: Set<number> = new Set<number>();
        const type: util.types = new util.types();

        expect(type.isAnyArrayBuffer(map)).assertFalse();
        expect(type.isAnyArrayBuffer(set)).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_3800
     * @tc.name testIsSharedArrayBufferViewSharing
     * @tc.desc 静态等价：ArrayBuffer 多视图共享底层缓冲的识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferViewSharing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferViewSharing';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(32);
        const ab2: ArrayBuffer = new ArrayBuffer(32);
        const view1: Int32Array = new Int32Array(ab);
        const view2: Float32Array = new Float32Array(ab);
        const view22: Float32Array = new Float32Array(ab2);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(view1.buffer)).assertTrue();
        expect(type.isAnyArrayBuffer(view2.buffer)).assertTrue();
        expect(view1.buffer === view2.buffer).assertTrue();
        expect(view2.buffer === view22.buffer).assertFalse();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_3900
     * @tc.name testIsSharedArrayBufferAtomicsWaitNotify
     * @tc.desc 静态等价：ArrayBuffer + Int32Array 上的 Atomics store/load（wait/notify 原动态未实际调用）
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferAtomicsWaitNotify', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferAtomicsWaitNotify';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(4);
        const view: Int32Array = new Int32Array(ab);

        view[0] = 0;
        Atomics.store(view, 0, 1);
        expect(Atomics.load(view, 0)).assertEqual(1);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(view.buffer)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4000
     * @tc.name testIsSharedArrayBufferAtomicsLoadStore
     * @tc.desc 静态等价：ArrayBuffer + Int32Array 上的 Atomics load/store
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferAtomicsLoadStore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferAtomicsLoadStore';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const view: Int32Array = new Int32Array(ab);

        Atomics.store(view, 0, 100);
        const loaded: number = Atomics.load(view, 0);
        expect(loaded).assertEqual(100);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(view.buffer)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4100
     * @tc.name testIsSharedArrayBufferNestedObject
     * @tc.desc 静态等价：嵌套对象中 ArrayBuffer 字段的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferNestedObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferNestedObject';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);

        const nestedValue: NestedBufferValue = { value: 42 };
        const obj: NestedBufferObject = {
          buffer: ab,
          nested: nestedValue
        };

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(obj.buffer)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4200
     * @tc.name testIsSharedArrayBufferAsParam
     * @tc.desc 静态等价：ArrayBuffer 作为函数参数的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferAsParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferAsParam';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);

        const result: boolean = checkAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4300
     * @tc.name testIsSharedArrayBufferReturnFromFunc
     * @tc.desc 静态等价：函数返回的 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferReturnFromFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferReturnFromFunc';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = createArrayBuffer();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4400
     * @tc.name testIsSharedArrayBufferInCollection
     * @tc.desc 静态等价：存储于数组与 Map 中的 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferInCollection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferInCollection';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const arr: ArrayBuffer[] = [ab];
        const map: Map<string, ArrayBuffer> = new Map<string, ArrayBuffer>();
        map.set('buffer', ab);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(arr[0])).assertTrue();
        const mapBuffer: ArrayBuffer | undefined = map.get('buffer');
        if (mapBuffer !== undefined) {
          expect(type.isAnyArrayBuffer(mapBuffer)).assertTrue();
        } else {
          expect().assertFail();
        }

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4500
     * @tc.name testIsSharedArrayBufferDynamicProp
     * @tc.desc 静态等价：对象字段持有 ArrayBuffer 的缓冲识别（索引签名禁用，改为显式类型化持有类）
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferDynamicProp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferDynamicProp';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const obj: DynamicBufferHolder = createDynamicBufferHolder(ab);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(obj.buffer)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4600
     * @tc.name testIsSharedArrayBufferPrototype
     * @tc.desc 静态等价：ArrayBuffer 实例属性 byteLength 与缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferPrototype', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferPrototype';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        expect(ab.byteLength).assertEqual(16);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4700
     * @tc.name testIsSharedArrayBufferMultiThreadSimulate
     * @tc.desc 静态等价：ArrayBuffer 上 Atomics 多操作模拟（store/add/load）
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferMultiThreadSimulate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferMultiThreadSimulate';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const view: Int32Array = new Int32Array(ab);

        Atomics.store(view, 0, 100);
        const value1: number = Atomics.load(view, 0);
        Atomics.add(view, 0, 50);
        const value2: number = Atomics.load(view, 0);

        expect(value1).assertEqual(100);
        expect(value2).assertEqual(150);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4800
     * @tc.name testIsSharedArrayBufferSliceReturn
     * @tc.desc 静态等价：ArrayBuffer slice 产物字节数与缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferSliceReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferSliceReturn';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(32);
        const slice1: ArrayBuffer = ab.slice(0, 16);
        const slice2: ArrayBuffer = ab.slice(16);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(slice1)).assertTrue();
        expect(type.isAnyArrayBuffer(slice2)).assertTrue();
        expect(slice1.byteLength).assertEqual(16);
        expect(slice2.byteLength).assertEqual(16);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_4900
     * @tc.name testIsSharedArrayBufferCompoundView
     * @tc.desc 静态等价：同一 ArrayBuffer 的复合 TypedArray 视图（偏移/长度）共享底层缓冲
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferCompoundView', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferCompoundView';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(24);
        const int32View: Int32Array = new Int32Array(ab, 0, 2);
        const float64View: Float64Array = new Float64Array(ab, 8, 2);

        int32View[0] = 42;
        float64View[0] = 3.14;

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(int32View.buffer)).assertTrue();
        expect(type.isAnyArrayBuffer(float64View.buffer)).assertTrue();
        expect(int32View.buffer === float64View.buffer).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_5000
     * @tc.name testIsSharedArrayBufferLengthValidation
     * @tc.desc 静态等价：多尺寸 ArrayBuffer 的字节数校验与缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferLengthValidation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferLengthValidation';
        console.info(`${caseName} test start`);

        const sizes: number[] = [0, 1, 8, 16, 32, 64, 128, 256, 512, 1024];
        const type: util.types = new util.types();

        for (let i: int = 0; i < sizes.length; i++) {
          const ab: ArrayBuffer = new ArrayBuffer(sizes[i]);
          expect(type.isAnyArrayBuffer(ab)).assertTrue();
          expect(ab.byteLength).assertEqual(sizes[i]);
        }

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0100
     * @tc.name testClassBufferProperty
     * @tc.desc 静态等价（原 Sendable 类属性）：普通类 size 属性与 ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testClassBufferProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testClassBufferProperty';
        console.info(`${caseName} test start`);

        const instance: BufferSizeClass = new BufferSizeClass(32);
        expect(instance.getBufferInfo()).assertEqual(32);

        const ab: ArrayBuffer = new ArrayBuffer(instance.size);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0200
     * @tc.name testClassBufferMethod
     * @tc.desc 静态等价（原 Sendable 类方法）：普通类方法计算结果驱动的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testClassBufferMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testClassBufferMethod';
        console.info(`${caseName} test start`);

        const instance: BufferSizeClass = new BufferSizeClass(16);
        const size: int = instance.createBufferInfo();
        expect(size).assertEqual(32);

        const ab: ArrayBuffer = new ArrayBuffer(size);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0300
     * @tc.name testClassBufferSingleton
     * @tc.desc 静态等价（原 Sendable 静态单例）：普通类静态单例驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testClassBufferSingleton', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testClassBufferSingleton';
        console.info(`${caseName} test start`);

        const instance: BufferSingleton = BufferSingleton.getInstance();
        const size: int = instance.getSize();
        expect(size).assertEqual(16);

        const ab: ArrayBuffer = new ArrayBuffer(size);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0400
     * @tc.name testClassBufferInheritance
     * @tc.desc 静态等价（原 Sendable 继承）：普通类继承方法驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testClassBufferInheritance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testClassBufferInheritance';
        console.info(`${caseName} test start`);

        const instance: BufferSizeDerived = new BufferSizeDerived();
        expect(instance.getBufferSize()).assertEqual(16);
        expect(instance.getDerivedSize()).assertEqual(32);

        const ab: ArrayBuffer = new ArrayBuffer(instance.getDerivedSize());
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0500
     * @tc.name testClassBufferOverride
     * @tc.desc 静态等价（原 Sendable 覆写）：普通类覆写字段后计算结果驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testClassBufferOverride', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testClassBufferOverride';
        console.info(`${caseName} test start`);

        const instance: BufferSizeDerived = new BufferSizeDerived();
        instance.multiplier = 4;
        expect(instance.getDerivedSize()).assertEqual(64);

        const ab: ArrayBuffer = new ArrayBuffer(instance.getDerivedSize());
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0600
     * @tc.name testTaskPoolPassArrayBufferSize
     * @tc.desc 静态等价（原 TaskPool 传参）：普通顶层函数经 TaskPool 创建 ArrayBuffer 返回字节数
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testTaskPoolPassArrayBufferSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testTaskPoolPassArrayBufferSize';
        console.info(`${caseName} test start`);

        const task: taskpool.Task = new taskpool.Task(taskPoolCreateArrayBuffer, 64);
        const result: int = await taskpool.execute(task) as int;
        expect(result).assertEqual(64);

        const ab: ArrayBuffer = new ArrayBuffer(result);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0700
     * @tc.name testTaskPoolSumArrayBufferSizes
     * @tc.desc 静态等价（原 TaskPool 返回）：普通顶层函数经 TaskPool 累加尺寸并驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testTaskPoolSumArrayBufferSizes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testTaskPoolSumArrayBufferSizes';
        console.info(`${caseName} test start`);

        const sizes: number[] = [];
        sizes.push(16);
        sizes.push(32);
        sizes.push(64);

        const task: taskpool.Task = new taskpool.Task(taskPoolSumBufferSizes, sizes);
        const result: int = await taskpool.execute(task) as int;
        expect(result).assertEqual(112);

        const ab: ArrayBuffer = new ArrayBuffer(result);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0800
     * @tc.name testTaskPoolParallelBufferTasks
     * @tc.desc 静态等价（原 TaskPool 并发访问）：两个并行任务分别创建 ArrayBuffer 返回字节数
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testTaskPoolParallelBufferTasks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testTaskPoolParallelBufferTasks';
        console.info(`${caseName} test start`);

        const task1: taskpool.Task = new taskpool.Task(taskPoolCreateArrayBuffer, 32);
        const task2: taskpool.Task = new taskpool.Task(taskPoolCreateArrayBuffer, 64);

        const results: int[] = await Promise.all([
          taskpool.execute(task1) as Promise<int>,
          taskpool.execute(task2) as Promise<int>
        ]);

        expect(results[0]).assertEqual(32);
        expect(results[1]).assertEqual(64);

        const ab1: ArrayBuffer = new ArrayBuffer(results[0]);
        const ab2: ArrayBuffer = new ArrayBuffer(results[1]);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab1)).assertTrue();
        expect(type.isAnyArrayBuffer(ab2)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_0900
     * @tc.name testTaskPoolSharedArrayBufferAtomicWrite
     * @tc.desc 静态等价（原 Worker 模拟）：ArrayBuffer 上 Atomics 原子写，并经 TaskPool 往返尺寸
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testTaskPoolSharedArrayBufferAtomicWrite', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testTaskPoolSharedArrayBufferAtomicWrite';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(128);
        const view: Int32Array = new Int32Array(ab);
        Atomics.store(view, 0, 42);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(Atomics.load(view, 0)).assertEqual(42);

        const task: taskpool.Task = new taskpool.Task(taskPoolCreateArrayBuffer, ab.byteLength);
        const result: int = await taskpool.execute(task) as int;
        expect(result).assertEqual(128);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1000
     * @tc.name testTaskPoolShareArrayBufferSize
     * @tc.desc 静态等价（原 Worker postMessage 模拟）：ArrayBuffer 字节长度作为 TaskPool 任务入参并校验任务返回
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testTaskPoolShareArrayBufferSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testTaskPoolShareArrayBufferSize';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(256);
        const size: int = ab.byteLength;

        const task: taskpool.Task = new taskpool.Task(taskPoolCreateArrayBuffer, size);
        const result: int = await taskpool.execute(task) as int;
        expect(result).assertEqual(256);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1100
     * @tc.name testTaskPoolReturnArrayBufferSize
     * @tc.desc 静态等价（原 Worker 返回模拟）：TaskPool 累加尺寸结果驱动 ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testTaskPoolReturnArrayBufferSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testTaskPoolReturnArrayBufferSize';
        console.info(`${caseName} test start`);

        const sizes: number[] = [];
        sizes.push(64);
        sizes.push(128);

        const task: taskpool.Task = new taskpool.Task(taskPoolSumBufferSizes, sizes);
        const result: int = await taskpool.execute(task) as int;

        const ab: ArrayBuffer = new ArrayBuffer(result);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(192);

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1200
     * @tc.name testClassSharedArrayBufferAtomics
     * @tc.desc 静态等价（原 EAWorker 类模拟）：普通类尺寸驱动的 ArrayBuffer Atomics 读写与缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testClassSharedArrayBufferAtomics', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testClassSharedArrayBufferAtomics';
        console.info(`${caseName} test start`);

        const instance: BufferSizeClass = new BufferSizeClass(64);
        const size: int = instance.getBufferInfo();

        const ab: ArrayBuffer = new ArrayBuffer(size);
        const view: Int32Array = new Int32Array(ab);
        Atomics.store(view, 0, 100);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(Atomics.load(view, 0)).assertEqual(100);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1300
     * @tc.name testSharedArrayBufferDualViews
     * @tc.desc 静态等价（原 EAWorker 内存共享模拟）：同一 ArrayBuffer 双视图（Atomics + 直接写）共享
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testSharedArrayBufferDualViews', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testSharedArrayBufferDualViews';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(1024);
        const view1: Int32Array = new Int32Array(ab);
        const view2: Float64Array = new Float64Array(ab);

        Atomics.store(view1, 0, 42);
        expect(Atomics.load(view1, 0)).assertEqual(42);

        view2[0] = 3.14;
        expect(view2[0]).assertEqual(3.14);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(view1.buffer)).assertTrue();
        expect(view1.buffer === view2.buffer).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1400
     * @tc.name testTaskPoolCrossThreadShare
     * @tc.desc 静态等价（原 EAWorker 跨线程模拟）：TaskPool 任务内创建 ArrayBuffer 并回传字节数，主线程重建缓冲并识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testTaskPoolCrossThreadShare', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testTaskPoolCrossThreadShare';
        console.info(`${caseName} test start`);

        const task: taskpool.Task = new taskpool.Task(taskPoolCreateArrayBuffer, 512);
        const result: int = await taskpool.execute(task) as int;

        const ab: ArrayBuffer = new ArrayBuffer(result);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(512);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1500
     * @tc.name testClassBufferGetterSetter
     * @tc.desc 静态等价（原 Sendable getter/setter）：普通类 getter/setter 驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testClassBufferGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testClassBufferGetterSetter';
        console.info(`${caseName} test start`);

        const instance: BufferGetterSetter = new BufferGetterSetter();
        instance.size = 128;

        const size: int = instance.getBufferSize();
        expect(size).assertEqual(128);

        const ab: ArrayBuffer = new ArrayBuffer(size);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1600
     * @tc.name testTaskPoolMethodArrayBufferSize
     * @tc.desc 静态等价（原 @Concurrent 方法）：普通顶层函数经 TaskPool 创建 ArrayBuffer 返回字节数
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testTaskPoolMethodArrayBufferSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testTaskPoolMethodArrayBufferSize';
        console.info(`${caseName} test start`);

        const task: taskpool.Task = new taskpool.Task(taskPoolCreateArrayBuffer, 256);
        const result: int = await taskpool.execute(task) as int;

        const ab: ArrayBuffer = new ArrayBuffer(result);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1700
     * @tc.name testClassBufferCollectionTask
     * @tc.desc 静态等价（原 Sendable 集合）：普通容器类尺寸集合经 TaskPool 累加
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testClassBufferCollectionTask', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testClassBufferCollectionTask';
        console.info(`${caseName} test start`);

        const container: BufferSizeContainer = new BufferSizeContainer();
        container.addBuffer(16);
        container.addBuffer(32);
        container.addBuffer(64);

        expect(container.getBufferCount()).assertEqual(3);

        const task: taskpool.Task = new taskpool.Task(taskPoolSumBufferSizes, container.buffers);
        const result: int = await taskpool.execute(task) as int;
        expect(result).assertEqual(112);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1800
     * @tc.name testClassBufferNested
     * @tc.desc 静态等价（原 Sendable 嵌套类）：普通容器类与内部类组合驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testClassBufferNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testClassBufferNested';
        console.info(`${caseName} test start`);

        const instance: BufferSizeContainer = new BufferSizeContainer();
        const inner: BufferSizeClass = new BufferSizeClass(64);

        instance.addBuffer(inner.size);
        expect(instance.buffers.length).assertEqual(1);

        const ab: ArrayBuffer = new ArrayBuffer(inner.getBufferInfo());
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_1900
     * @tc.name testClassBufferPrivateField
     * @tc.desc 静态等价（原 Sendable 私有字段）：普通类私有字段经 getter/setter 驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testClassBufferPrivateField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testClassBufferPrivateField';
        console.info(`${caseName} test start`);

        const instance: BufferGetterSetter = new BufferGetterSetter();
        instance.size = 32;

        expect(instance.size).assertEqual(32);

        const ab: ArrayBuffer = new ArrayBuffer(instance.size);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_SENDABLE_2000
     * @tc.name testClassBufferDefaultValue
     * @tc.desc 静态等价（原 Sendable 默认值）：普通类默认 size 驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testClassBufferDefaultValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testClassBufferDefaultValue';
        console.info(`${caseName} test start`);

        const instance: BufferSizeClass = new BufferSizeClass(16);
        expect(instance.size).assertEqual(16);

        const ab: ArrayBuffer = new ArrayBuffer(instance.size);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });
  });

  // 跨文件 export/reexport 静态等价段（原 TS 模块测试改为 .ets 模块；JS 互操作不迁移）
  describe('IsSharedArrayBufferCrossFileTest', (): void => {
    beforeAll((): void => {
      console.info('beforeAll called');
    });

    beforeEach((): void => {
    });

    afterEach((): void => {
      console.info('afterEach called');
    });

    afterAll((): void => {
      console.info('afterAll called');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0100
     * @tc.name testCreateArrayBufferFromModule
     * @tc.desc 静态等价（原 TS 模块函数）：跨文件模块函数创建 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCreateArrayBufferFromModule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testCreateArrayBufferFromModule';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = createArrayBufferTS(16);
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0200
     * @tc.name testModuleReturnArrayBufferMethod
     * @tc.desc 静态等价（原 TS 方法）：跨文件模块方法返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testModuleReturnArrayBufferMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testModuleReturnArrayBufferMethod';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = getArrayBufferMethodTS();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0300
     * @tc.name testModuleClassGetterSetter
     * @tc.desc 静态等价（原 TS 类 getter/setter）：跨文件模块类 getter/setter 返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testModuleClassGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testModuleClassGetterSetter';
        console.info(`${caseName} test start`);

        const instance: ArrayBufferClassTS = new ArrayBufferClassTS();
        instance.data = 32;
        const ab: ArrayBuffer = instance.getMethodAfterGetSet();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0400
     * @tc.name testModuleStaticMethod
     * @tc.desc 静态等价（原 TS 静态方法）：跨文件模块静态方法返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testModuleStaticMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testModuleStaticMethod';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = ArrayBufferStaticTS.getArrayBuffer();
        const type: util.types = new util.types();
        const result: boolean = type.isAnyArrayBuffer(ab);
        expect(result).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_0500
     * @tc.name testModuleInheritance
     * @tc.desc 静态等价（原 TS 继承）：跨文件模块函数创建 ArrayBuffer 的字节数与缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testModuleInheritance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testModuleInheritance';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = createArrayBufferTS(64);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(64);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1100
     * @tc.name testEtsImportModule
     * @tc.desc 静态等价（原 ETS 导入 TS）：ETS 文件导入跨文件 .ets 模块，字节数一致性校验
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testEtsImportModule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testEtsImportModule';
        console.info(`${caseName} test start`);

        const abModule: ArrayBuffer = createArrayBufferTS(32);
        const abLocal: ArrayBuffer = new ArrayBuffer(32);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(abModule)).assertTrue();
        expect(type.isAnyArrayBuffer(abLocal)).assertTrue();
        expect(abModule.byteLength).assertEqual(abLocal.byteLength);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1300
     * @tc.name testMixedSourceFiles
     * @tc.desc 静态等价（原 ETS+TS+JS 混合）：本地与两个跨文件模块来源的 ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMixedSourceFiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testMixedSourceFiles';
        console.info(`${caseName} test start`);

        const abLocal: ArrayBuffer = new ArrayBuffer(16);
        const abModule1: ArrayBuffer = createArrayBufferTS(16);
        const abModule2: ArrayBuffer = exportedArrayBufferFunc(16);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(abLocal)).assertTrue();
        expect(type.isAnyArrayBuffer(abModule1)).assertTrue();
        expect(type.isAnyArrayBuffer(abModule2)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1400
     * @tc.name testCrossFileTypeConsistency
     * @tc.desc 静态等价（原跨文件类型一致性）：多来源 ArrayBuffer 字节数与缓冲识别一致性
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCrossFileTypeConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testCrossFileTypeConsistency';
        console.info(`${caseName} test start`);

        const abLocal: ArrayBuffer = new ArrayBuffer(64);
        const abModule1: ArrayBuffer = createArrayBufferTS(64);
        const abModule2: ArrayBuffer = exportedArrayBufferFunc(64);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(abLocal)).assertTrue();
        expect(type.isAnyArrayBuffer(abModule1)).assertTrue();
        expect(type.isAnyArrayBuffer(abModule2)).assertTrue();
        expect(abLocal.byteLength).assertEqual(64);
        expect(abModule1.byteLength).assertEqual(64);
        expect(abModule2.byteLength).assertEqual(64);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1500
     * @tc.name testModuleExportArrayBuffer
     * @tc.desc 静态等价（原模块导出）：跨文件模块函数导出创建 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testModuleExportArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testModuleExportArrayBuffer';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = createArrayBufferTS(128);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1600
     * @tc.name testModuleImportArrayBuffer
     * @tc.desc 静态等价（原模块导入）：两个跨文件模块来源的 ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testModuleImportArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testModuleImportArrayBuffer';
        console.info(`${caseName} test start`);

        const abModule1: ArrayBuffer = createArrayBufferTS(32);
        const abModule2: ArrayBuffer = exportedArrayBufferFunc(32);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(abModule1)).assertTrue();
        expect(type.isAnyArrayBuffer(abModule2)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1700
     * @tc.name testReExportArrayBuffer
     * @tc.desc 静态等价（原 re-export）：跨文件 reexport 模块与源导出模块的 ArrayBuffer 同一性
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testReExportArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testReExportArrayBuffer';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = createArrayBufferTS(64);
        const sliced: ArrayBuffer = ab.slice(0, 32);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(type.isAnyArrayBuffer(sliced)).assertTrue();
        expect(type.isAnyArrayBuffer(reExportNamespace.exportedArrayBuffer)).assertTrue();
        expect(reExportNamespace.exportedArrayBuffer === exportedArrayBuffer).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1800
     * @tc.name testNamespaceImport
     * @tc.desc 静态等价：通过 namespace import 创建并识别跨文件 ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testNamespaceImport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const buffer: ArrayBuffer = arrayBufferNamespace.exportedArrayBufferFunc(128);
      const type: util.types = new util.types();
      expect(type.isAnyArrayBuffer(buffer)).assertTrue();
      expect(buffer.byteLength).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_1900
     * @tc.name testDefaultExport
     * @tc.desc 静态等价（原 default export）：跨文件模块默认导出 ArrayBuffer 的字节数与缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testDefaultExport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testDefaultExport';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(defaultArrayBuffer)).assertTrue();
        expect(defaultArrayBuffer.byteLength).assertEqual(32);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_CROSSFILE_2000
     * @tc.name testExportAllFrom
     * @tc.desc 静态等价：通过 export all re-export 模块创建并识别 ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testExportAllFrom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const buffer: ArrayBuffer = reExportNamespace.exportedArrayBufferFunc(32);
      const type: util.types = new util.types();
      expect(type.isAnyArrayBuffer(buffer)).assertTrue();
      expect(buffer.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_EXPORT_0100
     * @tc.name testExportedArrayBufferConst
     * @tc.desc 静态等价（原导出常量）：跨文件模块导出常量 ArrayBuffer 的字节数与缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testExportedArrayBufferConst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testExportedArrayBufferConst';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(exportedArrayBuffer)).assertTrue();
        expect(exportedArrayBuffer.byteLength).assertEqual(16);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_EXPORT_0200
     * @tc.name testExportedArrayBufferFunc
     * @tc.desc 静态等价（原导出函数）：跨文件模块导出函数创建 ArrayBuffer 的字节数与缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testExportedArrayBufferFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testExportedArrayBufferFunc';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = exportedArrayBufferFunc(32);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(32);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_EXPORT_0300
     * @tc.name testExportedArrayBufferClassGetterSetter
     * @tc.desc 静态等价（原导出类 getter/setter）：跨文件模块导出类 getter/setter 返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testExportedArrayBufferClassGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testExportedArrayBufferClassGetterSetter';
        console.info(`${caseName} test start`);

        const instance: ExportedArrayBufferClass = new ExportedArrayBufferClass();
        instance.data = 64;
        const ab: ArrayBuffer = instance.getBuffer();
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(64);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_EXPORT_0400
     * @tc.name testExportedArrayBufferClassDefaultBuffer
     * @tc.desc 静态等价（原导出类默认缓冲）：跨文件模块导出类默认 ArrayBuffer 的字节数与缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testExportedArrayBufferClassDefaultBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testExportedArrayBufferClassDefaultBuffer';
        console.info(`${caseName} test start`);

        const instance: ExportedArrayBufferClass = new ExportedArrayBufferClass();
        const ab: ArrayBuffer = instance.getBuffer();
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(16);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_EXPORT_0500
     * @tc.name testReExportedArrayBuffer
     * @tc.desc 静态等价（原 re-exported 常量）：跨文件 reexport 常量与源导出常量的同一性
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testReExportedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testReExportedArrayBuffer';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(reExportNamespace.exportedArrayBuffer)).assertTrue();
        expect(reExportNamespace.exportedArrayBuffer.byteLength).assertEqual(16);
        expect(reExportNamespace.exportedArrayBuffer === exportedArrayBuffer).assertTrue();

        console.info(`${caseName} test end`);
      });
  });

  // 静态等价段（原 @Sendable/@Concurrent 装饰器用例，装饰器为动态专属，
  // 可表达测试点改写为普通类 + TaskPool 普通顶层函数）
  describe('IsSharedArrayBufferDecoratorStaticTest', (): void => {
    beforeAll((): void => {
      console.info('beforeAll called');
    });

    beforeEach((): void => {
    });

    afterEach((): void => {
      console.info('afterEach called');
    });

    afterAll((): void => {
      console.info('afterAll called');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0100
     * @tc.name testDecoratorBufferClassProperty
     * @tc.desc 静态等价（原 @Sendable 类属性）：普通类 size 属性驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testDecoratorBufferClassProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testDecoratorBufferClassProperty';
        console.info(`${caseName} test start`);

        const instance: DecoratorBufferSizeClass = new DecoratorBufferSizeClass();
        const size: int = instance.getBufferSize();

        const ab: ArrayBuffer = new ArrayBuffer(size);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0200
     * @tc.name testDecoratorBufferClassMethod
     * @tc.desc 静态等价（原 @Sendable 类方法）：普通类方法结果驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testDecoratorBufferClassMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testDecoratorBufferClassMethod';
        console.info(`${caseName} test start`);

        const instance: DecoratorBufferSizeClass = new DecoratorBufferSizeClass();
        instance.size = 32;

        const ab: ArrayBuffer = new ArrayBuffer(instance.getBufferSize());
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(32);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0300
     * @tc.name testDecoratorBufferClassGetterSetter
     * @tc.desc 静态等价（原 @Sendable get/set）：普通类 getter/setter 驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testDecoratorBufferClassGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testDecoratorBufferClassGetterSetter';
        console.info(`${caseName} test start`);

        const instance: DecoratorBufferGetterSetter = new DecoratorBufferGetterSetter();
        instance.size = 64;

        const ab: ArrayBuffer = new ArrayBuffer(instance.getBufferSize());
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0400
     * @tc.name testConcurrentTaskPoolBufferFunc
     * @tc.desc 静态等价（原 @Concurrent 方法）：普通顶层函数经 TaskPool 创建 ArrayBuffer 返回字节数
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testConcurrentTaskPoolBufferFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testConcurrentTaskPoolBufferFunc';
        console.info(`${caseName} test start`);

        const task: taskpool.Task = new taskpool.Task(concurrentCreateArrayBuffer, 128);
        const result: int = await taskpool.execute(task) as int;

        const ab: ArrayBuffer = new ArrayBuffer(result);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0500
     * @tc.name testConcurrentTaskPoolSumFunc
     * @tc.desc 静态等价（原 @Concurrent 静态方法）：普通顶层函数经 TaskPool 累加尺寸并驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testConcurrentTaskPoolSumFunc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testConcurrentTaskPoolSumFunc';
        console.info(`${caseName} test start`);

        const sizes: number[] = [];
        sizes.push(16);
        sizes.push(32);
        sizes.push(64);

        const task: taskpool.Task = new taskpool.Task(concurrentSumBufferSizes, sizes);
        const result: int = await taskpool.execute(task) as int;

        const ab: ArrayBuffer = new ArrayBuffer(result);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0600
     * @tc.name testConcurrentTaskPoolParallel
     * @tc.desc 静态等价（原 @Concurrent TaskPool 场景）：两个并行任务创建 ArrayBuffer 返回字节数
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testConcurrentTaskPoolParallel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName = 'testConcurrentTaskPoolParallel';
        console.info(`${caseName} test start`);

        const task1: taskpool.Task = new taskpool.Task(concurrentCreateArrayBuffer, 32);
        const task2: taskpool.Task = new taskpool.Task(concurrentCreateArrayBuffer, 64);

        const results: int[] = await Promise.all([
          taskpool.execute(task1) as Promise<int>,
          taskpool.execute(task2) as Promise<int>
        ]);

        const ab1: ArrayBuffer = new ArrayBuffer(results[0]);
        const ab2: ArrayBuffer = new ArrayBuffer(results[1]);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab1)).assertTrue();
        expect(type.isAnyArrayBuffer(ab2)).assertTrue();

        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_2100
     * @tc.name testClassAndTaskPoolCombination
     * @tc.desc 静态等价（原 @Sendable + @Concurrent 组合）：普通类结果驱动 TaskPool 创建 ArrayBuffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testClassAndTaskPoolCombination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const caseName = 'testClassAndTaskPoolCombination';
        console.info(`${caseName} test start`);

        const instance: DecoratorBufferSizeClass = new DecoratorBufferSizeClass();
        const size: int = instance.getBufferSize();

        const task: taskpool.Task = new taskpool.Task(concurrentCreateArrayBuffer, size);
        try {
          const result: int = await taskpool.execute(task) as int;

          const ab: ArrayBuffer = new ArrayBuffer(result);
          const type: util.types = new util.types();
          expect(type.isAnyArrayBuffer(ab)).assertTrue();
        } catch (err) {
          expect(err).assertFail();
        }

        console.info(`${caseName} test end`);
      });
  });

  // 静态等价 simulated 段（原 @Entry/@Component/@State/@Prop/@Link/@Watch/@Builder/@Provide/@Consume
  // 及自定义装饰器用例，来源本身为 simulated 普通逻辑，装饰器均退化为普通 interface/类/顶层函数）
  describe('IsSharedArrayBufferDecoratorTest', (): void => {
    beforeAll((): void => {
      console.info('beforeAll called');
    });

    beforeEach((): void => {
    });

    afterEach((): void => {
      console.info('afterEach called');
    });

    afterAll((): void => {
      console.info('afterAll called');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0700
     * @tc.name testEntryComponentSharedArrayBuffer
     * @tc.desc 静态等价 simulated（原 @Entry 组件）：ComponentBuffer.size 驱动 ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testEntryComponentSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testEntryComponentSharedArrayBuffer';
        console.info(`${caseName} test start`);

        const componentBuffer: ComponentBuffer = {
          size: 128
        };

        const ab: ArrayBuffer = new ArrayBuffer(componentBuffer.size);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(128);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0800
     * @tc.name testComponentComponentSharedArrayBuffer
     * @tc.desc 静态等价 simulated（原 @Component 组件）：ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testComponentComponentSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testComponentComponentSharedArrayBuffer';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(64);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(64);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_0900
     * @tc.name testStateDecoratorSharedArrayBuffer
     * @tc.desc 静态等价 simulated（原 @State 装饰器）：StateBuffer 持有 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testStateDecoratorSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testStateDecoratorSharedArrayBuffer';
        console.info(`${caseName} test start`);

        const stateBuffer: StateBuffer = {
          buffer: new ArrayBuffer(32)
        };

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(stateBuffer.buffer)).assertTrue();
        expect(stateBuffer.buffer.byteLength).assertEqual(32);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1000
     * @tc.name testPropDecoratorSharedArrayBuffer
     * @tc.desc 静态等价 simulated（原 @Prop 装饰器）：ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testPropDecoratorSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testPropDecoratorSharedArrayBuffer';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(16);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(16);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1100
     * @tc.name testLinkDecoratorSharedArrayBuffer
     * @tc.desc 静态等价 simulated（原 @Link 装饰器）：ArrayBuffer 上 Atomics store/load 与缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testLinkDecoratorSharedArrayBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testLinkDecoratorSharedArrayBuffer';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(128);
        const view: Int32Array = new Int32Array(ab);
        Atomics.store(view, 0, 42);

        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(Atomics.load(view, 0)).assertEqual(42);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1200
     * @tc.name testWatchDecoratorCallback
     * @tc.desc 静态等价 simulated（原 @Watch 回调）：onSizeChange 更新 watchedSize 驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testWatchDecoratorCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testWatchDecoratorCallback';
        console.info(`${caseName} test start`);

        onSizeChange(64);

        const ab: ArrayBuffer = new ArrayBuffer(watchedSize);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(64);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1300
     * @tc.name testBuilderDecoratorComponent
     * @tc.desc 静态等价 simulated（原 @Builder 装饰器）：buildBuffer 创建 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testBuilderDecoratorComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testBuilderDecoratorComponent';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = buildBuffer(128);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(128);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1400
     * @tc.name testProvideDecoratorComponent
     * @tc.desc 静态等价 simulated（原 @Provide 装饰器）：ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testProvideDecoratorComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testProvideDecoratorComponent';
        console.info(`${caseName} test start`);

        const providedBuffer: ArrayBuffer = new ArrayBuffer(256);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(providedBuffer)).assertTrue();
        expect(providedBuffer.byteLength).assertEqual(256);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1500
     * @tc.name testConsumeDecoratorComponent
     * @tc.desc 静态等价 simulated（原 @Consume 装饰器）：ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testConsumeDecoratorComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testConsumeDecoratorComponent';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(64);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(64);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1600
     * @tc.name testCustomMethodDecorator
     * @tc.desc 静态等价 simulated（原自定义方法装饰器）：logMethod + createBufferForDecorator 创建 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCustomMethodDecorator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testCustomMethodDecorator';
        console.info(`${caseName} test start`);

        logMethod(createBufferForDecorator);

        const ab: ArrayBuffer = createBufferForDecorator();
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(128);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1700
     * @tc.name testCustomDecoratorWithParams
     * @tc.desc 静态等价 simulated（原带参自定义装饰器）：bufferSize 驱动 ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCustomDecoratorWithParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testCustomDecoratorWithParams';
        console.info(`${caseName} test start`);

        const bufferSize: int = 256;

        const ab: ArrayBuffer = new ArrayBuffer(bufferSize);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(256);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1800
     * @tc.name testCustomClassDecorator
     * @tc.desc 静态等价 simulated（原自定义类装饰器）：CustomDecoratedClass 返回 ArrayBuffer 的缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCustomClassDecorator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testCustomClassDecorator';
        console.info(`${caseName} test start`);

        const instance: CustomDecoratedClass = new CustomDecoratedClass();
        const ab: ArrayBuffer = instance.getBuffer();
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(128);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_1900
     * @tc.name testAccessorDecorator
     * @tc.desc 静态等价 simulated（原访问器装饰器）：AccessorDecoratedClass.size 驱动 ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testAccessorDecorator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testAccessorDecorator';
        console.info(`${caseName} test start`);

        const instance: AccessorDecoratedClass = new AccessorDecoratedClass();
        instance.size = 64;

        const ab: ArrayBuffer = new ArrayBuffer(instance.size);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(64);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_2000
     * @tc.name testMultipleDecoratorsStack
     * @tc.desc 静态等价 simulated（原多装饰器叠加）：DecoratorBufferGetterSetter.size 驱动 ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testMultipleDecoratorsStack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testMultipleDecoratorsStack';
        console.info(`${caseName} test start`);

        const instance: DecoratorBufferGetterSetter = new DecoratorBufferGetterSetter();
        instance.size = 128;

        const ab: ArrayBuffer = new ArrayBuffer(instance.size);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(128);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_2200
     * @tc.name testStateWatchCombination
     * @tc.desc 静态等价 simulated（原 @State + @Watch 组合）：watchCallback 更新 stateSize 驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testStateWatchCombination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testStateWatchCombination';
        console.info(`${caseName} test start`);

        watchCallback(64);

        const ab: ArrayBuffer = new ArrayBuffer(stateSize);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(64);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_2300
     * @tc.name testDecoratorSequence
     * @tc.desc 静态等价 simulated（原装饰器顺序）：ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testDecoratorSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testDecoratorSequence';
        console.info(`${caseName} test start`);

        const ab: ArrayBuffer = new ArrayBuffer(128);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(128);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_2400
     * @tc.name testNestedDecoratorClass
     * @tc.desc 静态等价 simulated（原嵌套装饰器类）：DecoratorBufferSizeClass.size 驱动 ArrayBuffer 缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testNestedDecoratorClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testNestedDecoratorClass';
        console.info(`${caseName} test start`);

        const instance: DecoratorBufferSizeClass = new DecoratorBufferSizeClass();
        instance.size = 256;

        const ab: ArrayBuffer = new ArrayBuffer(instance.size);
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(256);

        console.info(`${caseName} test end`);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ISSHAREDARRAYBUFFER_DECORATOR_2500
     * @tc.name testGetterSetterDecorator
     * @tc.desc 静态等价 simulated（原 getter/setter 装饰器）：DecoratorBufferGetterSetter.getBufferSize 驱动缓冲识别
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testGetterSetterDecorator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testGetterSetterDecorator';
        console.info(`${caseName} test start`);

        const instance: DecoratorBufferGetterSetter = new DecoratorBufferGetterSetter();
        instance.size = 512;

        expect(instance.size).assertEqual(512);

        const ab: ArrayBuffer = new ArrayBuffer(instance.getBufferSize());
        const type: util.types = new util.types();
        expect(type.isAnyArrayBuffer(ab)).assertTrue();
        expect(ab.byteLength).assertEqual(512);

        console.info(`${caseName} test end`);
      });
  });
}
