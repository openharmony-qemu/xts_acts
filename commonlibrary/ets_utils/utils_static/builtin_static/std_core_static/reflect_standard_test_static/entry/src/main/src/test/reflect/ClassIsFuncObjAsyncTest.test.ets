'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

type AsyncVoidTaskFn = () => Promise<void>;
type SyncVoidTaskFn = () => void;
type TaskFn = AsyncVoidTaskFn | SyncVoidTaskFn;
type AsyncIntTaskFn = () => Promise<int>;
type SyncIntTaskFn = () => int;
type MixedIntTaskFn = AsyncIntTaskFn | SyncIntTaskFn;

async function asyncDecl001(): Promise<void> {
  console.info('asyncDecl001');
}

async function asyncDecl002Dedicated(): Promise<void> {
  console.info('asyncDecl002Dedicated');
}

let asyncArrow002 = async (): Promise<void> => {
  console.info('asyncArrow002');
};

let asyncExpr003 = async (): Promise<void> => {
  console.info('asyncExpr003');
};

async function asyncWithReturn004(): Promise<string> {
  return 'result';
}

async function asyncWithParams005(name: string, age: int): Promise<string> {
  return name + ':' + age;
}

async function asyncNoParams006(): Promise<void> {
}

function syncDecl007(): void {
  console.info('syncDecl007');
}

let syncArrow008 = (): void => {
  console.info('syncArrow008');
};

let syncExpr009 = (): void => {
  console.info('syncExpr009');
};

function syncWithReturn010(): string {
  return 'result';
}

function syncNoParams011(): void {
}

function syncReturnsPromise012(): Promise<string> {
  return new Promise<string>((resolve) => {
    resolve('result');
  });
}

function syncResolve013(): Promise<string> {
  return new Promise<string>((resolve) => {
    resolve('result');
  });
}

class AsyncMethodClass014 {
  public async asyncMethod(): Promise<void> {
    console.info('asyncMethod');
  }
}

class SyncMethodClass015 {
  public syncMethod(): void {
    console.info('syncMethod');
  }
}

class StaticMethodClass016 {
  public static async staticAsyncMethod(): Promise<void> {
    console.info('staticAsyncMethod');
  }

  public static staticSyncMethod(): void {
    console.info('staticSyncMethod');
  }
}

class ConstructorClass017 {
  public constructor() {
  }
}

class AccessorClass018 {
  private _name: string = '';

  public get name(): string {
    return this._name;
  }

  public set name(value: string) {
    this._name = value;
  }

  public readName(): string {
    return this.name;
  }

  public writeName(value: string): void {
    this.name = value;
  }
}

class BaseClass019 {
  public async asyncMethod(): Promise<void> {
    console.info('base asyncMethod');
  }
}

class ChildClass019 extends BaseClass019 {
}

class BaseClass020 {
  public process(): string {
    return 'parent';
  }
}

class ChildClass020 extends BaseClass020 {
  public override process(): string {
    return 'child';
  }
}

interface AsyncInterface021 {
  asyncProcess(): Promise<string>;
}

class AsyncImplClass021 implements AsyncInterface021 {
  public async asyncProcess(): Promise<string> {
    return 'implemented';
  }
}

class OverloadClass022 {
  public process(value?: string): void {
    if (value) {
      console.info(value);
    } else {
      console.info('no param');
    }
  }
}

class AsyncOverloadClass023 {
  public async process(value?: string): Promise<void | string> {
    if (value) {
      return value;
    }
  }
}

class FinalSyncClass024 {
  public final syncFinal(): void {
  }
}

class FinalAsyncClass025 {
  public async final asyncFinal(): Promise<void> {
  }
}

class AsyncFunctionInspector026 {
  public static isAsync(func: Function): boolean {
    return reflect.isFuncObjAsync(func);
  }
}

class TaskQueue027 {
  private asyncTasks: Array<AsyncVoidTaskFn> = [];
  private syncTasks: Array<SyncVoidTaskFn> = [];

  public addTask(task: TaskFn): void {
    if (reflect.isFuncObjAsync(task as Function)) {
      this.asyncTasks.push(task as AsyncVoidTaskFn);
    } else {
      this.syncTasks.push(task as SyncVoidTaskFn);
    }
  }

  public getAsyncTaskCount(): int {
    return this.asyncTasks.length;
  }

  public getSyncTaskCount(): int {
    return this.syncTasks.length;
  }
}

function genericSync028<T>(value: T): T {
  return value;
}

async function genericAsync029<T>(value: T): Promise<T> {
  return value;
}

abstract class AbstractClass030 {
  public abstract abstractSync(): void;
}

class ConcreteClass030 extends AbstractClass030 {
  public override abstractSync(): void {
    console.info('abstractSync');
  }
}

class AbstractAsyncClass031 {
  public async abstractAsync(): Promise<void> {
    console.info('abstractAsync');
  }
}

function closureFactory032(): (x: int) => int {
  return (x: int): int => x + 1;
}

function asyncClosureFactory033(): (x: int) => Promise<int> {
  return async (x: int): Promise<int> => x + 1;
}

function syncAdd036(a: int, b: int): int {
  return a + b;
}

async function asyncAdd036(a: int, b: int): Promise<int> {
  return a + b;
}

async function localAsync037(): Promise<void> {
}

function checkMixedAsync037(): boolean {
  return reflect.isFuncObjAsync(localAsync037);
}

class PrivateSyncClass026 {
  private privateMethod(): void {
  }

  public publicSync(): void {
    this.privateMethod();
  }
}

async function innerAsync058(): Promise<string> {
  return 'inner';
}

async function outerAsync058(): Promise<string> {
  let result = await innerAsync058();
  return 'outer:' + result;
}

async function asyncWithError059(): Promise<string> {
  try {
    throw new Error('test error');
  } catch (error) {
    return 'caught';
  }
}

async function emptyAsync060(): Promise<void> {
}

async function voidAsync061(): Promise<void> {
  console.info('void async');
}

export default function ClassIsFuncObjAsyncTest(): void {
  describe('ClassIsFuncObjAsyncTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_0100
     * @tc.name testClassIsFuncObjAsync001
     * @tc.desc Verify ClassIsFuncObjAsync case 001: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(asyncDecl001)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_0200
     * @tc.name testClassIsFuncObjAsync002
     * @tc.desc Verify ClassIsFuncObjAsync case 002: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(asyncWithParams005)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_0300
     * @tc.name testClassIsFuncObjAsync003
     * @tc.desc Verify ClassIsFuncObjAsync case 003: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(asyncArrow002)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_0400
     * @tc.name testClassIsFuncObjAsync004
     * @tc.desc Verify ClassIsFuncObjAsync case 004: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(asyncExpr003)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_0500
     * @tc.name testClassIsFuncObjAsync005
     * @tc.desc Verify ClassIsFuncObjAsync case 005: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(asyncWithReturn004)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_0600
     * @tc.name testClassIsFuncObjAsync006
     * @tc.desc Verify ClassIsFuncObjAsync case 006: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(asyncDecl002Dedicated)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_0700
     * @tc.name testClassIsFuncObjAsync007
     * @tc.desc Verify ClassIsFuncObjAsync case 007: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(asyncNoParams006)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_0800
     * @tc.name testClassIsFuncObjAsync008
     * @tc.desc Verify ClassIsFuncObjAsync case 008: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(syncDecl007)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_0900
     * @tc.name testClassIsFuncObjAsync009
     * @tc.desc Verify ClassIsFuncObjAsync case 009: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(syncArrow008)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_1000
     * @tc.name testClassIsFuncObjAsync010
     * @tc.desc Verify ClassIsFuncObjAsync case 010: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(syncExpr009)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_1100
     * @tc.name testClassIsFuncObjAsync011
     * @tc.desc Verify ClassIsFuncObjAsync case 011: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(syncWithReturn010)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_1200
     * @tc.name testClassIsFuncObjAsync012
     * @tc.desc Verify ClassIsFuncObjAsync case 012: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(syncNoParams011)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_1300
     * @tc.name testClassIsFuncObjAsync013
     * @tc.desc Verify ClassIsFuncObjAsync case 013: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(syncReturnsPromise012)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_1400
     * @tc.name testClassIsFuncObjAsync014
     * @tc.desc Verify ClassIsFuncObjAsync case 014: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(syncResolve013)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_1500
     * @tc.name testClassIsFuncObjAsync015
     * @tc.desc Verify ClassIsFuncObjAsync case 015: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new AsyncMethodClass014();
      expect(reflect.isFuncObjAsync(obj.asyncMethod)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_1600
     * @tc.name testClassIsFuncObjAsync016
     * @tc.desc Verify ClassIsFuncObjAsync case 016: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new SyncMethodClass015();
      expect(reflect.isFuncObjAsync(obj.syncMethod)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_1700
     * @tc.name testClassIsFuncObjAsync017
     * @tc.desc Verify ClassIsFuncObjAsync case 017: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(StaticMethodClass016.staticAsyncMethod)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_1800
     * @tc.name testClassIsFuncObjAsync018
     * @tc.desc Verify ClassIsFuncObjAsync case 018: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(StaticMethodClass016.staticSyncMethod)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_1900
     * @tc.name testClassIsFuncObjAsync019
     * @tc.desc Verify ClassIsFuncObjAsync case 019: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let createInstance = (): ConstructorClass017 => new ConstructorClass017();
      expect(reflect.isFuncObjAsync(createInstance)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_2000
     * @tc.name testClassIsFuncObjAsync020
     * @tc.desc Verify ClassIsFuncObjAsync case 020: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new AccessorClass018();
      obj.name = 'test';
      expect(reflect.isFuncObjAsync(obj.readName)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_2100
     * @tc.name testClassIsFuncObjAsync021
     * @tc.desc Verify ClassIsFuncObjAsync case 021: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new AccessorClass018();
      expect(reflect.isFuncObjAsync(obj.writeName)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_2200
     * @tc.name testClassIsFuncObjAsync022
     * @tc.desc Verify ClassIsFuncObjAsync case 022: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new PrivateSyncClass026();
      expect(reflect.isFuncObjAsync(obj.publicSync)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_2300
     * @tc.name testClassIsFuncObjAsync023
     * @tc.desc Verify ClassIsFuncObjAsync case 023: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new BaseClass019();
      expect(reflect.isFuncObjAsync(obj.asyncMethod)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_2400
     * @tc.name testClassIsFuncObjAsync024
     * @tc.desc Verify ClassIsFuncObjAsync case 024: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ChildClass019();
      expect(reflect.isFuncObjAsync(obj.asyncMethod)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_2500
     * @tc.name testClassIsFuncObjAsync025
     * @tc.desc Verify ClassIsFuncObjAsync case 025: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ChildClass020();
      expect(reflect.isFuncObjAsync(obj.process)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_2600
     * @tc.name testClassIsFuncObjAsync026
     * @tc.desc Verify ClassIsFuncObjAsync case 026: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new AsyncImplClass021();
      expect(reflect.isFuncObjAsync(obj.asyncProcess)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_2700
     * @tc.name testClassIsFuncObjAsync027
     * @tc.desc Verify ClassIsFuncObjAsync case 027: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new OverloadClass022();
      expect(reflect.isFuncObjAsync(obj.process)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_2800
     * @tc.name testClassIsFuncObjAsync028
     * @tc.desc Verify ClassIsFuncObjAsync case 028: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new AsyncOverloadClass023();
      expect(reflect.isFuncObjAsync(obj.process)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_2900
     * @tc.name testClassIsFuncObjAsync029
     * @tc.desc Verify ClassIsFuncObjAsync case 029: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new FinalSyncClass024();
      expect(reflect.isFuncObjAsync(obj.syncFinal)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_3000
     * @tc.name testClassIsFuncObjAsync030
     * @tc.desc Verify ClassIsFuncObjAsync case 030: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new FinalAsyncClass025();
      expect(reflect.isFuncObjAsync(obj.asyncFinal)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_3100
     * @tc.name testClassIsFuncObjAsync031
     * @tc.desc Verify ClassIsFuncObjAsync case 031: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(console.info)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_3200
     * @tc.name testClassIsFuncObjAsync032
     * @tc.desc Verify ClassIsFuncObjAsync case 032: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(asyncDecl001)).assertEqual(true);
      expect(reflect.isFuncObjAsync(asyncExpr003)).assertEqual(true);
      expect(reflect.isFuncObjAsync(asyncArrow002)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_3300
     * @tc.name testClassIsFuncObjAsync033
     * @tc.desc Verify ClassIsFuncObjAsync case 033: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(syncDecl007)).assertEqual(false);
      expect(reflect.isFuncObjAsync(syncExpr009)).assertEqual(false);
      expect(reflect.isFuncObjAsync(syncArrow008)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_3400
     * @tc.name testClassIsFuncObjAsync034
     * @tc.desc Verify ClassIsFuncObjAsync case 034: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof reflect.isFuncObjAsync(asyncDecl001)).assertEqual("boolean");
      expect(typeof reflect.isFuncObjAsync(syncDecl007)).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_3500
     * @tc.name testClassIsFuncObjAsync035
     * @tc.desc Verify ClassIsFuncObjAsync case 035: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = reflect.isFuncObjAsync(asyncDecl001);
      let r2 = reflect.isFuncObjAsync(syncDecl007);
      expect(r1).assertEqual(true);
      expect(r2).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_3600
     * @tc.name testClassIsFuncObjAsync036
     * @tc.desc Verify ClassIsFuncObjAsync case 036: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = reflect.isFuncObjAsync(asyncDecl001);
      let r2 = reflect.isFuncObjAsync(asyncDecl001);
      let r3 = reflect.isFuncObjAsync(asyncDecl001);
      expect(r1).assertEqual(r2);
      expect(r2).assertEqual(r3);
      expect(r1).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_3700
     * @tc.name testClassIsFuncObjAsync037
     * @tc.desc Verify ClassIsFuncObjAsync case 037: invalid input throws ClassCastError, isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：nullish cast 至非 nullish 类型，运行时抛 ClassCastError
      try {
        reflect.isFuncObjAsync(null as Function);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_3800
     * @tc.name testClassIsFuncObjAsync038
     * @tc.desc Verify ClassIsFuncObjAsync case 038: invalid input throws ClassCastError, isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：nullish cast 至非 nullish 类型，运行时抛 ClassCastError
      try {
        reflect.isFuncObjAsync(undefined as Function);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_3900
     * @tc.name testClassIsFuncObjAsync039
     * @tc.desc Verify ClassIsFuncObjAsync case 039: invalid input throws ClassCastError, isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：非 Function 类型 cast，运行时抛 ClassCastError
      try {
        let invalidArg: int = 123;
        reflect.isFuncObjAsync(invalidArg as Function);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_4000
     * @tc.name testClassIsFuncObjAsync040
     * @tc.desc Verify ClassIsFuncObjAsync case 040: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(innerAsync058)).assertEqual(true);
      expect(reflect.isFuncObjAsync(outerAsync058)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_4100
     * @tc.name testClassIsFuncObjAsync041
     * @tc.desc Verify ClassIsFuncObjAsync case 041: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(asyncWithError059)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_4200
     * @tc.name testClassIsFuncObjAsync042
     * @tc.desc Verify ClassIsFuncObjAsync case 042: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(emptyAsync060)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_4300
     * @tc.name testClassIsFuncObjAsync043
     * @tc.desc Verify ClassIsFuncObjAsync case 043: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(voidAsync061)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_4400
     * @tc.name testClassIsFuncObjAsync044
     * @tc.desc Verify ClassIsFuncObjAsync case 044: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(checkMixedAsync037)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_4500
     * @tc.name testClassIsFuncObjAsync045
     * @tc.desc Verify ClassIsFuncObjAsync case 045: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lambda = (x: int): int => x * 2;
      expect(reflect.isFuncObjAsync(lambda)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_4600
     * @tc.name testClassIsFuncObjAsync046
     * @tc.desc Verify ClassIsFuncObjAsync case 046: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let asyncLambda = async (x: int): Promise<int> => x * 2;
      expect(reflect.isFuncObjAsync(asyncLambda)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_4700
     * @tc.name testClassIsFuncObjAsync047
     * @tc.desc Verify ClassIsFuncObjAsync case 047: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let closure = closureFactory032();
      expect(reflect.isFuncObjAsync(closure)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_4800
     * @tc.name testClassIsFuncObjAsync048
     * @tc.desc Verify ClassIsFuncObjAsync case 048: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let asyncClosure = asyncClosureFactory033();
      expect(reflect.isFuncObjAsync(asyncClosure)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_4900
     * @tc.name testClassIsFuncObjAsync049
     * @tc.desc Verify ClassIsFuncObjAsync case 049: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new AbstractAsyncClass031();
      expect(reflect.isFuncObjAsync(obj.abstractAsync)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_5000
     * @tc.name testClassIsFuncObjAsync050
     * @tc.desc Verify ClassIsFuncObjAsync case 050: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ConcreteClass030();
      expect(reflect.isFuncObjAsync(obj.abstractSync)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_5100
     * @tc.name testClassIsFuncObjAsync051
     * @tc.desc Verify ClassIsFuncObjAsync case 051: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let syncFn = (value: int): int => genericSync028<int>(value);
      expect(reflect.isFuncObjAsync(syncFn)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_5200
     * @tc.name testClassIsFuncObjAsync052
     * @tc.desc Verify ClassIsFuncObjAsync case 052: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let asyncFn = async (value: int): Promise<int> => genericAsync029<int>(value);
      expect(reflect.isFuncObjAsync(asyncFn)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_5300
     * @tc.name testClassIsFuncObjAsync053
     * @tc.desc Verify ClassIsFuncObjAsync case 053: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(AsyncFunctionInspector026.isAsync(asyncDecl001)).assertEqual(true);
      expect(AsyncFunctionInspector026.isAsync(syncDecl007)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_5400
     * @tc.name testClassIsFuncObjAsync054
     * @tc.desc Verify ClassIsFuncObjAsync case 054: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let queue = new TaskQueue027();
      queue.addTask(asyncDecl001);
      queue.addTask(syncDecl007);
      queue.addTask(asyncArrow002);
      expect(queue.getAsyncTaskCount()).assertEqual(2);
      expect(queue.getSyncTaskCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_5500
     * @tc.name testClassIsFuncObjAsync055
     * @tc.desc Verify ClassIsFuncObjAsync case 055: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reflect.isFuncObjAsync(syncAdd036)).assertEqual(false);
      expect(reflect.isFuncObjAsync(asyncAdd036)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_5600
     * @tc.name testClassIsFuncObjAsync056
     * @tc.desc Verify ClassIsFuncObjAsync case 056: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let asyncFunctions: Array<AsyncIntTaskFn> = [];
      let syncFunctions: Array<SyncIntTaskFn> = [];
      for (let i = 0; i < 20; i++) {
        let idx = i;
        asyncFunctions.push(async (): Promise<int> => {
          return idx;
        });
        syncFunctions.push((): int => {
          return idx;
        });
      }
      for (let func of asyncFunctions) {
        expect(reflect.isFuncObjAsync(func as Function)).assertEqual(true);
      }
      for (let func of syncFunctions) {
        expect(reflect.isFuncObjAsync(func as Function)).assertEqual(false);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_IS_FUNC_OBJ_ASYNC_5700
     * @tc.name testClassIsFuncObjAsync057
     * @tc.desc Verify ClassIsFuncObjAsync case 057: isFuncObjAsync classification verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassIsFuncObjAsync057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allFunctions: Array<MixedIntTaskFn> = [];
      let expectedResults: Array<boolean> = [];
      for (let i = 0; i < 20; i++) {
        let idx = i;
        if (idx % 2 == 0) {
          allFunctions.push(async (): Promise<int> => {
            return idx;
          });
          expectedResults.push(true);
        } else {
          allFunctions.push((): int => {
            return idx;
          });
          expectedResults.push(false);
        }
      }
      for (let i = 0; i < allFunctions.length; i++) {
        expect(reflect.isFuncObjAsync(allFunctions[i] as Function)).assertEqual(expectedResults[i]);
      }
    });
  });
}
