'use static';
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils, { sleep } from '../Utils.test';
import util from '@ohos.util';
import {
  default as defaultExportedAsyncFunc,
  exportedAsyncArrowFunc,
  exportedAsyncFunc,
  ExportedTestClass
} from './callbackWrapperExportModule';
import { genericAsyncFunc, GenericTestClass } from './callbackWrapperGenericModule';
import {
  AbstractDerivedClass,
  DualInterfaceClass,
  InterfaceImplementClass
} from './callbackWrapperInterfaceAbstractModule';
import { NestedNamespace, TestNamespace } from './callbackWrapperNamespaceModule';
import { reexportedAsyncFunc, renamedAsyncFunc } from './callbackWrapperReexportModule';
import { jsAsyncArrowFunc, jsAsyncFunc, JsTestClass } from './callbackWrapperJS';
import { tsAsyncArrowFunc, tsAsyncFunc, TsTestClass } from './callbackWrapperTS';

const SLEEP_INTERVAL_MS: int = 100;

async function asyncFuncString(): Promise<string> {
  return 'success';
}

async function asyncFuncNumber(): Promise<number> {
  return 42;
}

interface TestObject {
  name: string;
  value: number;
}

interface NestedObjectLevel3 {
  value?: string;
}

interface NestedObjectLevel2 {
  level3?: NestedObjectLevel3;
}

interface NestedObjectLevel1 {
  level2?: NestedObjectLevel2;
}

interface NestedObject {
  level1?: NestedObjectLevel1;
}

interface ObjectKey {
  key: string;
}

async function asyncFuncObject(): Promise<TestObject> {
  const obj: TestObject = { name: 'test', value: 100 };
  return obj;
}

async function asyncFuncArray(): Promise<number[]> {
  return [1, 2, 3, 4, 5];
}

async function asyncFuncBoolean(): Promise<boolean> {
  return true;
}

async function asyncFuncNull(): Promise<null> {
  return null;
}

async function asyncFuncUndefined(): Promise<void> {
  return;
}

async function asyncFuncThrowError(): Promise<string> {
  throw new Error('test error');
}

async function asyncFuncPromiseResolve(): Promise<string> {
  return Promise.resolve('resolved');
}

async function asyncFuncPromiseReject(): Promise<string> {
  return Promise.reject(new Error('rejected'));
}

async function asyncFuncMultiParams(): Promise<string> {
  return `123`;
}

class TestClassWithGetterSetter {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  async asyncMethodAfterGetter(): Promise<number> {
    return this._value + 10;
  }
}

class TestClassGetterOnly {
  private _data: string = 'data';

  get data(): string {
    return this._data;
  }

  async asyncMethodAfterGetterOnly(): Promise<string> {
    return this._data + '-modified';
  }
}

class TestClassSetterOnly {
  private _count: number = 0;

  set count(val: number) {
    this._count = val;
  }

  async asyncMethodAfterSetterOnly(): Promise<number> {
    return this._count * 2;
  }
}

class TestClassGetterSetterMixed {
  private _x: number = 0;
  private _y: number = 0;

  get x(): number {
    return this._x;
  }

  set x(val: number) {
    this._x = val;
  }

  async asyncMethodBetween(): Promise<number> {
    return this._x + this._y;
  }

  get y(): number {
    return this._y;
  }

  set y(val: number) {
    this._y = val;
  }

  async asyncMethodAfterAll(): Promise<string> {
    return `${this._x}-${this._y}`;
  }
}

class TestClassBeforeGetterSetter {
  async asyncMethodBeforeGetter(): Promise<string> {
    return 'before-getter';
  }

  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }
}

class TestClassMultipleGetterSetter {
  private _a: number = 0;
  private _b: string = '';
  private _c: boolean = false;

  get a(): number {
    return this._a;
  }

  set a(val: number) {
    this._a = val;
  }

  async asyncMethodA(): Promise<number> {
    return this._a;
  }

  get b(): string {
    return this._b;
  }

  set b(val: string) {
    this._b = val;
  }

  async asyncMethodB(): Promise<string> {
    return this._b;
  }

  get c(): boolean {
    return this._c;
  }

  set c(val: boolean) {
    this._c = val;
  }

  async asyncMethodC(): Promise<boolean> {
    return this._c;
  }
}

interface ObjectLiteralWithAsync {
  getValue: () => Promise<number>;
}

const objectLiteralWithAsyncMethod: ObjectLiteralWithAsync = {
  getValue: async (): Promise<number> => {
    return 123;
  }
};

interface ObjectLiteralGetterSetter {
  data: string;
  getValue: () => Promise<string>;
}

const objectLiteralGetterSetter: ObjectLiteralGetterSetter = {
  data: 'test',
  getValue: async (): Promise<string> => {
    return 'value';
  }
};

class TestClassStaticMethod {
  static async staticAsyncMethod(): Promise<string> {
    return 'static-async';
  }

  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(val: number) {
    this._value = val;
  }

  static async staticAsyncMethodAfterGetterSetter(): Promise<number> {
    return 999;
  }
}

class TestClassMultipleStatic {
  static async staticMethod1(): Promise<number> {
    return 1;
  }

  static async staticMethod2(): Promise<string> {
    return 'two';
  }

  static async staticMethod3(): Promise<boolean> {
    return true;
  }
}

class TestClassParent {
  async asyncMethod(): Promise<string> {
    return 'parent';
  }
}

class TestClassChild extends TestClassParent {
  async childMethod(): Promise<string> {
    return 'child';
  }
}

class TestClassOverrideParent {
  async asyncMethod(): Promise<string> {
    return 'parent-override';
  }
}

class TestClassOverrideChild extends TestClassOverrideParent {
  async asyncMethod(): Promise<string> {
    return 'child-override';
  }
}

class TestClassGrandParent {
  async asyncMethod(): Promise<string> {
    return 'grandparent';
  }
}

class TestClassParent2 extends TestClassGrandParent {
  async parentMethod(): Promise<string> {
    return 'parent';
  }
}

class TestClassGrandChild extends TestClassParent2 {
  async grandChildMethod(): Promise<string> {
    return 'grandchild';
  }
}

const asyncArrowFunc = async (): Promise<number> => {
  return 456;
};

let asyncAssignedFunc: () => Promise<string>;
asyncAssignedFunc = async (): Promise<string> => {
  return 'assigned';
};

function returnAsyncFunc(): () => Promise<number> {
  return async (): Promise<number> => {
    return 789;
  };
}

async function asyncFuncWithDefaultParams(a: number = 10, b: string = 'default'): Promise<string> {
  return `${a}-${b}`;
}

async function asyncFuncWithRestParams(...args: number[]): Promise<number> {
  let sum: number = 0;
  for (const num of args) {
    sum += num;
  }
  return sum;
}

async function asyncFuncWithOneRestParam(value: number): Promise<number> {
  return asyncFuncWithRestParams(value);
}

async function asyncFuncWithEmptyRestParams(): Promise<number> {
  return asyncFuncWithRestParams();
}

async function asyncFuncWithOneDefaultParam(value: number): Promise<string> {
  return asyncFuncWithDefaultParams(value);
}

async function asyncFuncReturnComplex(): Promise<NestedObject> {
  const obj: NestedObject = {
    level1: {
      level2: {
        level3: {
          value: 'deep'
        }
      }
    }
  };
  return obj;
}

async function asyncFuncDelayResolve(): Promise<string> {
  await sleep(50);
  return 'delayed';
}

async function asyncFuncDelayReject(): Promise<string> {
  await sleep(50);
  throw new Error('delayed error');
}

interface ThenableObject {
  then: (resolve: (value: string) => void) => void;
}

async function asyncFuncReturnThenable(): Promise<ThenableObject> {
  const thenable: ThenableObject = {
    then: (resolve: (value: string) => void) => {
      resolve('thenable-value');
    }
  };
  return thenable;
}

async function asyncFuncReturnPromiseInstance(): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void) => {
    resolve('promise-instance');
  });
}

async function asyncNoReturnFunc(): Promise<void> {
  return;
}

async function asyncParamFunc(): Promise<string> {
  return 'param-func';
}

async function asyncIIFEFunc(): Promise<number> {
  return (await (async (): Promise<number> => {
    return 999;
  })());
}

async function asyncOuterFunc(): Promise<string> {
  return 'outer';
}

async function asyncInnerFunc(): Promise<string> {
  return 'inner';
}

async function originalAsyncFunc(): Promise<string> {
  return 'original';
}

async function asyncCounterFunc(): Promise<number> {
  return 1;
}

async function multiParamFuncTest(a: number, b: string, c: boolean): Promise<string> {
  return `${a}-${b}-${c}`;
}

function normalFuncTest(): string {
  return 'normal';
}

class CallCounter {
  private count: number = 0;

  async increment(): Promise<number> {
    this.count++;
    return this.count;
  }
}

function takeAsyncFunc(func: () => Promise<string>): Promise<string> {
  const callback = util.callbackWrapper(func);
  return new Promise<string>((resolve, reject): void => {
    callback.unsafeCall((err: Error | null, value: string): void => {
      if (err !== null) {
        reject(err);
        return;
      }
      resolve(value);
    });
  });
}

interface TestObjectKey {
  key: string;
}

interface BusinessError {
  code: number;
  message: string;
}

export default function CallbackWrapperTest(): void {
  describe('CallbackWrapperTest', (): void => {
    beforeAll((): void => {
      console.info('CallbackWrapperTest beforeAll called');
    });

    beforeEach((): void => { });

    afterEach((): void => {
      console.info('CallbackWrapperTest afterEach called');
    });

    afterAll((): void => {
      console.info('CallbackWrapperTest afterAll called');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_0100
     * @tc.name testCallbackWrapperBasicSuccess
     * @tc.desc Test basic async function success conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperBasicSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperBasicSuccess test start');

        const callback = util.callbackWrapper(asyncFuncString);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('success');
          console.info('testCallbackWrapperBasicSuccess test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_0200
     * @tc.name testCallbackWrapperReturnNumber
     * @tc.desc Test async function returning number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperReturnNumber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperReturnNumber test start');

        const callback = util.callbackWrapper(asyncFuncNumber);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(42);
          console.info('testCallbackWrapperReturnNumber test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_0300
     * @tc.name testCallbackWrapperReturnObject
     * @tc.desc Test async function returning object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperReturnObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperReturnObject test start');

        const callback = util.callbackWrapper(asyncFuncObject);
        callback.unsafeCall((err: Error | null, value: TestObject) => {
          expect(err).assertNull();
          expect(value.name).assertEqual('test');
          expect(value.value).assertEqual(100);
          console.info('testCallbackWrapperReturnObject test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_0400
     * @tc.name testCallbackWrapperReturnArray
     * @tc.desc Test async function returning array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperReturnArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperReturnArray test start');

        const callback = util.callbackWrapper(asyncFuncArray);
        callback.unsafeCall((err: Error | null, value: number[]) => {
          expect(err).assertNull();
          expect(value.length).assertEqual(5);
          expect(value[0]).assertEqual(1);
          console.info('testCallbackWrapperReturnArray test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_0500
     * @tc.name testCallbackWrapperReturnBoolean
     * @tc.desc Test async function returning boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperReturnBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperReturnBoolean test start');

        const callback = util.callbackWrapper(asyncFuncBoolean);
        callback.unsafeCall((err: Error | null, value: boolean) => {
          expect(err).assertNull();
          expect(value).assertTrue();
          console.info('testCallbackWrapperReturnBoolean test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_0600
     * @tc.name testCallbackWrapperReturnNull
     * @tc.desc Test async function returning null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperReturnNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperReturnNull test start');

        const callback = util.callbackWrapper(asyncFuncNull);
        callback.unsafeCall((err: Error | null, value: null) => {
          expect(err).assertNull();
          expect(value).assertNull();
          console.info('testCallbackWrapperReturnNull test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_0700
     * @tc.name testCallbackWrapperReturnUndefined
     * @tc.desc Test async function returning undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperReturnUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperReturnUndefined test start');

        const callback = util.callbackWrapper(asyncFuncUndefined);
        callback.unsafeCall((err: Error | null, value: undefined) => {
          expect(err).assertNull();
          expect(value).assertUndefined();
          console.info('testCallbackWrapperReturnUndefined test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_0800
     * @tc.name testCallbackWrapperThrowError
     * @tc.desc Test async function throwing error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperThrowError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperThrowError test start');

        const callback = util.callbackWrapper(asyncFuncThrowError);
        callback.unsafeCall((err: Error | null) => {
          expect(err !== null).assertTrue();
          expect(err instanceof Error).assertTrue();
          console.info('testCallbackWrapperThrowError test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_0900
     * @tc.name testCallbackWrapperPromiseResolve
     * @tc.desc Test async function with Promise.resolve()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperPromiseResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperPromiseResolve test start');

        const callback = util.callbackWrapper(asyncFuncPromiseResolve);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('resolved');
          console.info('testCallbackWrapperPromiseResolve test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_1000
     * @tc.name testCallbackWrapperPromiseReject
     * @tc.desc Test async function with Promise.reject()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperPromiseReject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperPromiseReject test start');

        const callback = util.callbackWrapper(asyncFuncPromiseReject);
        callback.unsafeCall((err: Error | null) => {
          expect(err !== null).assertTrue();
          expect(err instanceof Error).assertTrue();
          console.info('testCallbackWrapperPromiseReject test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_1100
     * @tc.name testCallbackWrapperNoReturnValue
     * @tc.desc Test async function with no return value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperNoReturnValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperNoReturnValue test start');

        const callback = util.callbackWrapper(asyncNoReturnFunc);
        callback.unsafeCall((err: Error | null, value: undefined) => {
          expect(err).assertNull();
          expect(value).assertUndefined();
          console.info('testCallbackWrapperNoReturnValue test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_1200
     * @tc.name testCallbackWrapperMultiParams
     * @tc.desc Test async function with multiple parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperMultiParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperMultiParams test start');

        const callback = util.callbackWrapper(asyncFuncMultiParams);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('123');
          console.info('testCallbackWrapperMultiParams test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_1300
     * @tc.name testCallbackWrapperAfterGetter
     * @tc.desc Test async method after getter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperAfterGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperAfterGetter test start');

        const instance = new TestClassWithGetterSetter();
        instance.value = 5;
        const boundMethod = async (): Promise<number> => {
          return instance.asyncMethodAfterGetter();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(15);
          console.info('testCallbackWrapperAfterGetter test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_1400
     * @tc.name testCallbackWrapperAfterSetter
     * @tc.desc Test async method after setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperAfterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperAfterSetter test start');

        const instance = new TestClassSetterOnly();
        instance.count = 10;
        const boundMethod = async (): Promise<number> => {
          return instance.asyncMethodAfterSetterOnly();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(20);
          console.info('testCallbackWrapperAfterSetter test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_1500
     * @tc.name testCallbackWrapperAfterGetterSetter
     * @tc.desc Test async method after getter and setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperAfterGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperAfterGetterSetter test start');

        const instance = new TestClassWithGetterSetter();
        instance.value = 100;
        const boundMethod = async (): Promise<number> => {
          return instance.asyncMethodAfterGetter();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(110);
          console.info('testCallbackWrapperAfterGetterSetter test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_1600
     * @tc.name testCallbackWrapperBeforeGetter
     * @tc.desc Test async method before getter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperBeforeGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperBeforeGetter test start');

        const instance = new TestClassBeforeGetterSetter();
        const boundMethod = async (): Promise<string> => {
          return instance.asyncMethodBeforeGetter();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('before-getter');
          console.info('testCallbackWrapperBeforeGetter test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_1700
     * @tc.name testCallbackWrapperBetweenGetterSetter
     * @tc.desc Test async method between getter and setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperBetweenGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperBetweenGetterSetter test start');

        const instance = new TestClassGetterSetterMixed();
        instance.x = 10;
        instance.y = 20;
        const boundMethod = async (): Promise<number> => {
          return instance.asyncMethodBetween();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(30);
          console.info('testCallbackWrapperBetweenGetterSetter test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_1800
     * @tc.name testCallbackWrapperMultipleGetterSetter
     * @tc.desc Test async method with multiple getter and setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperMultipleGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperMultipleGetterSetter test start');

        const instance = new TestClassMultipleGetterSetter();
        instance.a = 100;
        instance.b = 'test';
        instance.c = true;
        let callbackACalled: boolean = false;
        let callbackBCalled: boolean = false;
        let callbackCCalled: boolean = false;
        let completedCallbacks: number = 0;
        const completeCallback = (): void => {
          completedCallbacks++;
          if (completedCallbacks === 3) {
            expect(callbackACalled).assertTrue();
            expect(callbackBCalled).assertTrue();
            expect(callbackCCalled).assertTrue();
            console.info('testCallbackWrapperMultipleGetterSetter test end');
            done();
          }
        };

        const boundMethodA = async (): Promise<number> => {
          return instance.asyncMethodA();
        };
        const callbackA = util.callbackWrapper(boundMethodA);
        callbackA.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(100);
          callbackACalled = true;
          completeCallback();
        });

        const boundMethodB = async (): Promise<string> => {
          return instance.asyncMethodB();
        };
        const callbackB = util.callbackWrapper(boundMethodB);
        callbackB.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('test');
          callbackBCalled = true;
          completeCallback();
        });

        const boundMethodC = async (): Promise<boolean> => {
          return instance.asyncMethodC();
        };
        const callbackC = util.callbackWrapper(boundMethodC);
        callbackC.unsafeCall((err: Error | null, value: boolean) => {
          expect(err).assertNull();
          expect(value).assertTrue();
          callbackCCalled = true;
          completeCallback();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_1900
     * @tc.name testCallbackWrapperGetterOnly
     * @tc.desc Test async method with getter only
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperGetterOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperGetterOnly test start');

        const instance = new TestClassGetterOnly();
        const boundMethod = async (): Promise<string> => {
          return instance.asyncMethodAfterGetterOnly();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('data-modified');
          console.info('testCallbackWrapperGetterOnly test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_2000
     * @tc.name testCallbackWrapperObjectLiteral
     * @tc.desc Test async method in object literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperObjectLiteral', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperObjectLiteral test start');

        const callback = util.callbackWrapper(objectLiteralWithAsyncMethod.getValue);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(123);
          console.info('testCallbackWrapperObjectLiteral test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_2100
     * @tc.name testCallbackWrapperObjectLiteralAfterGetter
     * @tc.desc Test async method after getter in object literal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperObjectLiteralAfterGetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperObjectLiteralAfterGetter test start');

        const callback = util.callbackWrapper(objectLiteralGetterSetter.getValue);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('value');
          console.info('testCallbackWrapperObjectLiteralAfterGetter test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_2200
     * @tc.name testCallbackWrapperRestParams
     * @tc.desc Test async function with rest parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperRestParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperRestParams test start');

        const callback = util.callbackWrapper(asyncFuncWithOneRestParam);
        callback.unsafeCall(15.0, (err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(15);
          console.info('testCallbackWrapperRestParams test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_2300
     * @tc.name testCallbackWrapperRestParamsEmpty
     * @tc.desc Test async function with empty rest parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperRestParamsEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperRestParamsEmpty test start');

        const callback = util.callbackWrapper(asyncFuncWithEmptyRestParams);
        callback.unsafeCall( (err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(0);
          console.info('testCallbackWrapperRestParamsEmpty test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_2400
     * @tc.name testCallbackWrapperStaticMethod
     * @tc.desc Test static async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperStaticMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperStaticMethod test start');

        const callback = util.callbackWrapper(TestClassStaticMethod.staticAsyncMethod);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('static-async');
          console.info('testCallbackWrapperStaticMethod test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_2500
     * @tc.name testCallbackWrapperStaticMethodAfterGetterSetter
     * @tc.desc Test static async method after getter and setter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperStaticMethodAfterGetterSetter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperStaticMethodAfterGetterSetter test start');

        const callback = util.callbackWrapper(TestClassStaticMethod.staticAsyncMethodAfterGetterSetter);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(999);
          console.info('testCallbackWrapperStaticMethodAfterGetterSetter test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_2600
     * @tc.name testCallbackWrapperMultipleStaticMethods
     * @tc.desc Test multiple static async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperMultipleStaticMethods', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperMultipleStaticMethods test start');
        let callback1Called: boolean = false;
        let callback2Called: boolean = false;
        let callback3Called: boolean = false;
        let completedCallbacks: number = 0;
        const completeCallback = (): void => {
          completedCallbacks++;
          if (completedCallbacks === 3) {
            expect(callback1Called).assertTrue();
            expect(callback2Called).assertTrue();
            expect(callback3Called).assertTrue();
            console.info('testCallbackWrapperMultipleStaticMethods test end');
            done();
          }
        };

        const callback1 = util.callbackWrapper(TestClassMultipleStatic.staticMethod1);
        callback1.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(1);
          callback1Called = true;
          completeCallback();
        });

        const callback2 = util.callbackWrapper(TestClassMultipleStatic.staticMethod2);
        callback2.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('two');
          callback2Called = true;
          completeCallback();
        });

        const callback3 = util.callbackWrapper(TestClassMultipleStatic.staticMethod3);
        callback3.unsafeCall((err: Error | null, value: boolean) => {
          expect(err).assertNull();
          expect(value).assertTrue();
          callback3Called = true;
          completeCallback();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_2700
     * @tc.name testCallbackWrapperInheritedMethod
     * @tc.desc Test inherited async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperInheritedMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperInheritedMethod test start');

        const instance = new TestClassChild();
        const boundMethod = async (): Promise<string> => {
          return instance.asyncMethod();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('parent');
          console.info('testCallbackWrapperInheritedMethod test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_2800
     * @tc.name testCallbackWrapperOverriddenMethod
     * @tc.desc Test overridden async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperOverriddenMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperOverriddenMethod test start');

        const instance = new TestClassOverrideChild();
        const boundMethod = async (): Promise<string> => {
          return instance.asyncMethod();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('child-override');
          console.info('testCallbackWrapperOverriddenMethod test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_2900
     * @tc.name testCallbackWrapperMultiLevelInheritance
     * @tc.desc Test multi-level inherited async method
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperMultiLevelInheritance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperMultiLevelInheritance test start');

        const instance = new TestClassGrandChild();
        const boundMethod = async (): Promise<string> => {
          return instance.asyncMethod();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('grandparent');
          console.info('testCallbackWrapperMultiLevelInheritance test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_3000
     * @tc.name testCallbackWrapperArrowFunction
     * @tc.desc Test async arrow function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperArrowFunction test start');

        const callback = util.callbackWrapper(asyncArrowFunc);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(456);
          console.info('testCallbackWrapperArrowFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_3100
     * @tc.name testCallbackWrapperAssignedFunction
     * @tc.desc Test assigned async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperAssignedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperAssignedFunction test start');

        const callback = util.callbackWrapper(asyncAssignedFunc);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('assigned');
          console.info('testCallbackWrapperAssignedFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_3200
     * @tc.name testCallbackWrapperAsParameter
     * @tc.desc Test async function passed as parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperAsParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperAsParameter test start');

        const value: string = await takeAsyncFunc(asyncParamFunc);
        expect(value).assertEqual('param-func');
        console.info('testCallbackWrapperAsParameter test end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_3300
     * @tc.name testCallbackWrapperReturnedFunction
     * @tc.desc Test async function returned from function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperReturnedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperReturnedFunction test start');

        const asyncFunc = returnAsyncFunc();
        const callback = util.callbackWrapper(asyncFunc);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(789);
          console.info('testCallbackWrapperReturnedFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_3400
     * @tc.name testCallbackWrapperIIFE
     * @tc.desc Test IIFE async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperIIFE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperIIFE test start');

        const iifeResult = await (async (): Promise<string> => {
          return 'iife-result';
        })();

        expect(iifeResult).assertEqual('iife-result');

        const callback = util.callbackWrapper(asyncIIFEFunc);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(999);
          console.info('testCallbackWrapperIIFE test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_3700
     * @tc.name testCallbackWrapperNumberParam
     * @tc.desc Test number parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCallbackWrapperNumberParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperNumberParam test start');

        try {
          util.callbackWrapper(123 as Object as Function);
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          console.error('callbackWrapper rejected invalid value: ' + err.message);
          expect(err instanceof Error).assertTrue();
        }

        console.info('testCallbackWrapperNumberParam test end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_3800
     * @tc.name testCallbackWrapperStringParam
     * @tc.desc Test string parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCallbackWrapperStringParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperStringParam test start');

        try {
          util.callbackWrapper('test' as Object as Function);
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          console.error('callbackWrapper rejected invalid value: ' + err.message);
          expect(err instanceof Error).assertTrue();
        }

        console.info('testCallbackWrapperStringParam test end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_3900
     * @tc.name testCallbackWrapperObjectParam
     * @tc.desc Test object parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCallbackWrapperObjectParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperObjectParam test start');

        try {
          const obj: TestObjectKey = { key: 'value' };
          util.callbackWrapper(obj as Object as Function);
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          console.error('callbackWrapper rejected invalid value: ' + err.message);
          expect(err instanceof Error).assertTrue();
        }

        console.info('testCallbackWrapperObjectParam test end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_4000
     * @tc.name testCallbackWrapperArrayParam
     * @tc.desc Test array parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCallbackWrapperArrayParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperArrayParam test start');

        try {
          util.callbackWrapper([1, 2, 3] as Object as Function);
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          console.error('callbackWrapper rejected invalid value: ' + err.message);
          expect(err instanceof Error).assertTrue();
        }

        console.info('testCallbackWrapperArrayParam test end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_4100
     * @tc.name testCallbackWrapperBooleanParam
     * @tc.desc Test boolean parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCallbackWrapperBooleanParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperBooleanParam test start');

        try {
          util.callbackWrapper(true as Object as Function);
          expect(false).assertFail();
        } catch (error) {
          const err: Error = error as Error;
          console.error('callbackWrapper rejected invalid value: ' + err.message);
          expect(err instanceof Error).assertTrue();
        }

        console.info('testCallbackWrapperBooleanParam test end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_4300
     * @tc.name testCallbackWrapperNormalFunction
     * @tc.desc Test normal function (non-async)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCallbackWrapperNormalFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperNormalFunction test start');
        let result = false
        try {
          const callback = util.callbackWrapper(normalFuncTest);
          callback.unsafeCall((err: Error | null, value: string) => {
            console.info('testCallbackWrapperNormalFunction test end');
          });
        } catch (e) {
          result = true
        }
        expect(result).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_4400
     * @tc.name testCallbackWrapperArrowFunctionNonAsync
     * @tc.desc Test arrow function (non-async)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testCallbackWrapperArrowFunctionNonAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperArrowFunctionNonAsync test start');

        const arrowFunc = (): number => {
          return 123;
        };
        let result = false
        try {
          const callback = util.callbackWrapper(arrowFunc);
          callback.unsafeCall((err: Error | null, value: number) => {

          });
        } catch (e) {
          result = true
        }
        expect(result).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_4700
     * @tc.name testCallbackWrapperDefaultParams
     * @tc.desc Test async function with default parameters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperDefaultParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperDefaultParams test start');

        const callback = util.callbackWrapper(asyncFuncWithOneDefaultParam);
        callback.unsafeCall(10.0, (err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('10-default');
          console.info('testCallbackWrapperDefaultParams test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_4900
     * @tc.name testCallbackWrapperNestedCallback
     * @tc.desc Test nested callback scenario
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperNestedCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperNestedCallback test start');

        const outerCallback = util.callbackWrapper(asyncOuterFunc);
        outerCallback.unsafeCall((err1: Error | null, value1: string) => {
          expect(err1).assertNull();
          expect(value1).assertEqual('outer');

          const innerCallback = util.callbackWrapper(asyncInnerFunc);
          innerCallback.unsafeCall((err2: Error | null, value2: string) => {
            expect(err2).assertNull();
            expect(value2).assertEqual('inner');
            console.info('testCallbackWrapperNestedCallback test end');
            done();
          });
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_5000
     * @tc.name testCallbackWrapperWithPromisify
     * @tc.desc Test callbackWrapper with promisify combination
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperWithPromisify', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperWithPromisify test start');

        const callbackified = util.callbackWrapper(asyncFuncString);
        callbackified.unsafeCall(async (err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('success');
          console.info('testCallbackWrapperWithPromisify test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_5100
     * @tc.name testCallbackWrapperThenable
     * @tc.desc Test async function returning thenable
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperThenable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperThenable test start');

        const callback = util.callbackWrapper(asyncFuncReturnThenable);
        callback.unsafeCall((err: Error | null, value: ThenableObject) => {
          expect(err).assertNull();
          expect(value !== null).assertTrue();
          console.info('testCallbackWrapperThenable test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_5200
     * @tc.name testCallbackWrapperPromiseInstance
     * @tc.desc Test async function returning Promise instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperPromiseInstance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperPromiseInstance test start');

        const callback = util.callbackWrapper(asyncFuncReturnPromiseInstance);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('promise-instance');
          console.info('testCallbackWrapperPromiseInstance test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_5300
     * @tc.name testCallbackWrapperDelayedResolve
     * @tc.desc Test async function with delayed resolve
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperDelayedResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperDelayedResolve test start');

        const callback = util.callbackWrapper(asyncFuncDelayResolve);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('delayed');
          console.info('testCallbackWrapperDelayedResolve test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_5400
     * @tc.name testCallbackWrapperDelayedReject
     * @tc.desc Test async function with delayed reject
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperDelayedReject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperDelayedReject test start');

        const callback = util.callbackWrapper(asyncFuncDelayReject);
        callback.unsafeCall((err: Error | null) => {
          expect(err !== null).assertTrue();
          expect(err instanceof Error).assertTrue();
          console.info('testCallbackWrapperDelayedReject test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_5500
     * @tc.name testCallbackWrapperComplexObject
     * @tc.desc Test async function returning complex nested object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperComplexObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperComplexObject test start');

        const callback = util.callbackWrapper(asyncFuncReturnComplex);
        callback.unsafeCall((err: Error | null, value: NestedObject) => {
          expect(err).assertNull();
          expect(value.level1?.level2?.level3?.value).assertEqual('deep');
          console.info('testCallbackWrapperComplexObject test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_5600
     * @tc.name testCallbackWrapperMultipleCalls
     * @tc.desc Test multiple calls to callbackified function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it('testCallbackWrapperMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperMultipleCalls test start');

        const counter = new CallCounter();
        const boundMethod = async (): Promise<number> => {
          return counter.increment();
        };
        const callback = util.callbackWrapper(boundMethod);

        callback.unsafeCall((err1: Error | null, value1: number) => {
          expect(err1).assertNull();
          expect(value1).assertEqual(1);

          callback.unsafeCall((err2: Error | null, value2: number) => {
            expect(err2).assertNull();
            expect(value2).assertEqual(2);

            callback.unsafeCall((err3: Error | null, value3: number) => {
              expect(err3).assertNull();
              expect(value3).assertEqual(3);
              console.info('testCallbackWrapperMultipleCalls test end');
              done();
            });
          });
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_5700
     * @tc.name testCallbackWrapperExportedFunction
     * @tc.desc Test exported async function from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperExportedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperExportedFunction test start');

        const callback = util.callbackWrapper(exportedAsyncFunc);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('exported-async');
          console.info('testCallbackWrapperExportedFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_5800
     * @tc.name testCallbackWrapperExportedArrowFunction
     * @tc.desc Test exported async arrow function from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperExportedArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperExportedArrowFunction test start');

        const callback = util.callbackWrapper(exportedAsyncArrowFunc);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(1000);
          console.info('testCallbackWrapperExportedArrowFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_5900
     * @tc.name testCallbackWrapperExportedClass
     * @tc.desc Test exported class with async methods from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperExportedClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperExportedClass test start');

        const instance = new ExportedTestClass();
        instance.value = 50;
        const boundMethod = async (): Promise<number> => {
          return instance.asyncMethodAfterGetterSetter();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(150);
          console.info('testCallbackWrapperExportedClass test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_6000
     * @tc.name testCallbackWrapperDefaultExportedFunction
     * @tc.desc Test default exported async function from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperDefaultExportedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperDefaultExportedFunction test start');

        const callback = util.callbackWrapper(defaultExportedAsyncFunc);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('default-exported');
          console.info('testCallbackWrapperDefaultExportedFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_6100
     * @tc.name testCallbackWrapperGenericFunction
     * @tc.desc Test generic async function from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperGenericFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperGenericFunction test start');

        const genericFunc = genericAsyncFunc<string>;
        const callback = util.callbackWrapper(genericFunc);
        callback.unsafeCall('test-value', (err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('test-value');
          console.info('testCallbackWrapperGenericFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_6200
     * @tc.name testCallbackWrapperGenericClass
     * @tc.desc Test generic class with async methods from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperGenericClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperGenericClass test start');

        const instance = new GenericTestClass<number>(100);
        const boundMethod = async (): Promise<number> => {
          return instance.asyncMethodAfterGetterSetter();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(100);
          console.info('testCallbackWrapperGenericClass test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_6300
     * @tc.name testCallbackWrapperInterfaceImplement
     * @tc.desc Test interface implemented async method from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperInterfaceImplement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperInterfaceImplement test start');

        const instance = new InterfaceImplementClass();
        const boundMethod = async (): Promise<string> => {
          return instance.asyncMethod();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('interface-implemented');
          console.info('testCallbackWrapperInterfaceImplement test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_6400
     * @tc.name testCallbackWrapperAbstractDerivedClass
     * @tc.desc Test abstract derived class async method from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperAbstractDerivedClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperAbstractDerivedClass test start');

        const instance = new AbstractDerivedClass();
        instance.value = 30;
        const boundMethod = async (): Promise<number> => {
          return instance.asyncMethodAfterGetterSetter();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(80);
          console.info('testCallbackWrapperAbstractDerivedClass test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_6500
     * @tc.name testCallbackWrapperNamespaceFunction
     * @tc.desc Test namespace exported async function from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperNamespaceFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperNamespaceFunction test start');

        const callback = util.callbackWrapper(TestNamespace.namespaceAsyncFunc);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('namespace-async');
          console.info('testCallbackWrapperNamespaceFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_6600
     * @tc.name testCallbackWrapperNamespaceClass
     * @tc.desc Test namespace exported class with async methods from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperNamespaceClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperNamespaceClass test start');

        const instance = new TestNamespace.NamespaceTestClass();
        instance.value = 100;
        const boundMethod = async (): Promise<number> => {
          return instance.asyncMethodAfterGetterSetter();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(400);
          console.info('testCallbackWrapperNamespaceClass test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_6700
     * @tc.name testCallbackWrapperNestedNamespaceFunction
     * @tc.desc Test nested namespace async function from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperNestedNamespaceFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperNestedNamespaceFunction test start');

        const callback = util.callbackWrapper(NestedNamespace.InnerNamespace.nestedAsyncFunc);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('nested-async');
          console.info('testCallbackWrapperNestedNamespaceFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_6800
     * @tc.name testCallbackWrapperReexportedFunction
     * @tc.desc Test reexported async function from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperReexportedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperReexportedFunction test start');

        const callback = util.callbackWrapper(reexportedAsyncFunc);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('reexported-async');
          console.info('testCallbackWrapperReexportedFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_6900
     * @tc.name testCallbackWrapperRenamedExportedFunction
     * @tc.desc Test renamed exported async function from module
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperRenamedExportedFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperRenamedExportedFunction test start');

        const callback = util.callbackWrapper(renamedAsyncFunc);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('exported-async');
          console.info('testCallbackWrapperRenamedExportedFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_7000
     * @tc.name testCallbackWrapperJSAsyncFunction
     * @tc.desc Test JS module async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperJSAsyncFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperJSAsyncFunction test start');

        const callback = util.callbackWrapper(jsAsyncFunc);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('js-async');
          console.info('testCallbackWrapperJSAsyncFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_7100
     * @tc.name testCallbackWrapperJSAsyncArrowFunction
     * @tc.desc Test JS module async arrow function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperJSAsyncArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperJSAsyncArrowFunction test start');

        const callback = util.callbackWrapper(jsAsyncArrowFunc);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(789);
          console.info('testCallbackWrapperJSAsyncArrowFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_7200
     * @tc.name testCallbackWrapperJSClass
     * @tc.desc Test JS module class with async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperJSClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperJSClass test start');

        const instance = new JsTestClass();
        instance.value = 10;
        const boundMethod = async (): Promise<number> => {
          return instance.asyncMethodAfterGetterSetter();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(50);
          console.info('testCallbackWrapperJSClass test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_7300
     * @tc.name testCallbackWrapperTSAsyncFunction
     * @tc.desc Test TS module async function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperTSAsyncFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperTSAsyncFunction test start');

        const callback = util.callbackWrapper(tsAsyncFunc);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('ts-async');
          console.info('testCallbackWrapperTSAsyncFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_7400
     * @tc.name testCallbackWrapperTSAsyncArrowFunction
     * @tc.desc Test TS module async arrow function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperTSAsyncArrowFunction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperTSAsyncArrowFunction test start');

        const callback = util.callbackWrapper(tsAsyncArrowFunc);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(456);
          console.info('testCallbackWrapperTSAsyncArrowFunction test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_7500
     * @tc.name testCallbackWrapperTSClass
     * @tc.desc Test TS module class with async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperTSClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperTSClass test start');

        const instance = new TsTestClass();
        instance.value = 20;
        const boundMethod = async (): Promise<number> => {
          return instance.asyncMethodAfterGetterSetter();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: number) => {
          expect(err).assertNull();
          expect(value).assertEqual(200);
          console.info('testCallbackWrapperTSClass test end');
          done();
        });
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CALLBACKWRAPPER_7600
     * @tc.name testCallbackWrapperDualInterfaceClass
     * @tc.desc Test class implementing dual interfaces with async methods
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL1
     */
    it('testCallbackWrapperDualInterfaceClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.info('testCallbackWrapperDualInterfaceClass test start');

        const instance = new DualInterfaceClass();
        const boundMethod = async (): Promise<string> => {
          return instance.asyncMethod();
        };
        const callback = util.callbackWrapper(boundMethod);
        callback.unsafeCall((err: Error | null, value: string) => {
          expect(err).assertNull();
          expect(value).assertEqual('dual-interface');
          console.info('testCallbackWrapperDualInterfaceClass test end');
          done();
        });
      });
  });
}
