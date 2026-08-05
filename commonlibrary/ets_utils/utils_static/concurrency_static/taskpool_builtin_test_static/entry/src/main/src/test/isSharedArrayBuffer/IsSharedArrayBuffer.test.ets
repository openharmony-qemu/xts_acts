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
import { reExportedArrayBuffer } from './arrayBufferReexportModule';
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
     * @tc.desc 静态等价：null/undefined 不应识别为缓冲（与 isPromise 静态范式一致的 try/catch 处理）
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testIsSharedArrayBufferNullUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (): void => {
        const caseName = 'testIsSharedArrayBufferNullUndefined';
        console.info(`${caseName} test start`);

        const type: util.types = new util.types();
        let nullResult: boolean = false;
        let nullCastFailed: boolean = false;
        try {
          nullResult = type.isAnyArrayBuffer(null as Object);
        } catch (error) {
          nullCastFailed = true;
        }
        if (!nullCastFailed) {
          expect(nullResult).assertFalse();
        }

        let undefinedResult: boolean = false;
        let undefinedCastFailed: boolean = false;
        try {
          undefinedResult = type.isAnyArrayBuffer(undefined as Object);
        } catch (error) {
          undefinedCastFailed = true;
        }
        if (!undefinedCastFailed) {
          expect(undefinedResult).assertFalse();
        }

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
