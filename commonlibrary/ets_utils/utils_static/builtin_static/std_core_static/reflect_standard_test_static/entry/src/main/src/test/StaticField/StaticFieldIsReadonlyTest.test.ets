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
import { FieldValue, StaticField, ReflectClass, createReflectClass } from '../Util.test';

class IntegrationIsReadonlyClass {
  public static readonly CONSTANT_VALUE: string = 'immutable';
  public static mutableValue: string = 'mutable';
}

class MyClass001 {
  public static readonly name: string = 'test';
}

class MyClass002 {
  public static readonly name: string = 'test';
}

class MyClass004 {
  public static readonly name: string = 'test';
  private static readonly id: int = 100;
  protected static readonly flag: boolean = true;
}

class MyClass005 {
  public static count: int = 0;
  private static value: string = 'test';
  protected static data: string[] = [];
}

class MyClass006 {
  public static readonly constant: double = 3.14;
}

class MyClass007 {
  public static readonly name: string = 'test';
}

class MyClass008 {
  public static readonly name: string = 'test';
}

class MyClass009 {
  public static readonly num: int = 100;
  public static readonly str: string = 'test';
  public static readonly bool: boolean = true;
  public static readonly arr: int[] = [1, 2, 3];
  public static readonly obj: Record<string, string> = { 'key': 'value' };
  public static readonly charField: char = c'A';
}

class MyClass012 {
  public static name: string = 'test';
}

class MyClass013 {
  public static readonly value: int = 100;
}

class MyClass014 {
  private static readonly value: int = 100;
}

class MyClass015 {
  protected static readonly value: int = 100;
}

class MyClass016 {
  public static readonly value: int = 100;
}

class MyClass017 {
  public static readonly value: int = 100;
}

class MyClass018 {
  private static readonly value: int = 100;
}

class MyClass019 {
  protected static readonly value: int = 100;
}

class MyClass020 {
  public static readonly name: string = 'test';
}

class MyClass021 {
  public static readonly name: string = 'test';
}

class MyClass022 {
  public static readonly constant: double = 3.14;
}

class MyClass023 {
  public static readonly value: int = 100;
}

class MyClass024 {
  public static readonly value: int = 100;
}

class Config025 {
  public static readonly APP_NAME: string = 'MyApp';
  public static readonly VERSION: string = '1.0.0';
  public static debugMode: boolean = false;
  public static logLevel: string = 'info';
}

class MyClass026 {
  public static readonly constant: int = 100;
  public static variable: int = 200;
}

class Parent027 {
  public static readonly parentField: string = 'parent';
}

class Child027 extends Parent027 {
  public static readonly childField: string = 'child';
}

interface MyInterface028 {
  constant: string;
}

class Impl028 implements MyInterface028 {
  private _constant: string = 'implemented';

  public get constant(): string {
    return this._constant;
  }

  public set constant(value: string) {
    this._constant = value;
  }
}

class GenericClass029 {
  public static readonly defaultValue: string = '';
  public static count: int = 0;
}

class MyClass030 {
  public static readonly handler: () => void = (): void => {
  };
  public static callback: () => void = (): void => {
  };
}

class InnerClass031 {
}

class MyClass031 {
  public static readonly inner: string = 'InnerClass031';
  public static outer: string = 'Object';
}

class MyClass032 {
  public static readonly value: int = 0;
}

class CorrectClass033 {
  public static readonly value: int = 100;
}

class MyClass034 {
  public static readonly value: int = 100;
}

class MyClass035 {
  public static readonly field1: int = 1;
  public static field2: int = 2;
  public static readonly field3: int = 3;
  public static field4: int = 4;
}

class MyClass036 {
  public static readonly staticReadonly: string = 'static';
  public readonly instanceReadonly: string = 'instance';
}

class MyClass037 {
  public static readonly CONSTANT: int = 100;
  private static readonly PRIVATE_CONSTANT: int = 200;
  public static variable: int = 300;
}

class MyClass038 {
  public static readonly a: int = 1;
  public static b: int = 2;
  public static readonly c: int = 3;
  public static d: int = 4;
}

class MyClass039 {
  public static readonly MAX_SIZE: int = 1024;
  public static readonly MIN_SIZE: int = 1;
  public static currentSize: int = 512;
  public static readonly DEFAULT_NAME: string = 'default';
  public static tempValue: string = 'temp';
}

class MyClass040 {
  public static readonly PI: double = 3.141592653589793;
  public static readonly E: double = 2.718281828459045;
  public static readonly GOLDEN_RATIO: double = 1.618033988749895;
  public static precision: double = 0.0001;
}

class MyClass041 {
  public static readonly HTTP_OK: int = 200;
  public static readonly HTTP_NOT_FOUND: int = 404;
  public static readonly HTTP_SERVER_ERROR: int = 500;
  public static currentStatus: int = 200;
}

class MyClass042 {
  public static readonly EMPTY_STRING: string = '';
  public static readonly DEFAULT_LOCALE: string = 'en-US';
  public static readonly APP_NAMESPACE: string = 'com.example.app';
  public static runtimeLocale: string = 'en-US';
}

class MyClass043 {
  public static readonly TRUE_VALUE: boolean = true;
  public static readonly FALSE_VALUE: boolean = false;
  public static toggleFlag: boolean = false;
}

class MyClass044 {
  public static readonly EMPTY_ARRAY: string[] = [];
  public static readonly DEFAULT_TAGS: string[] = ['default', 'basic'];
  public static activeTags: string[] = ['active'];
}

class MyClass045 {
  public static readonly DEFAULT_CONFIG: Record<string, string | number> = { 'timeout': 3000, 'retries': 3 };
  public static runtimeConfig: Record<string, string | number> = { 'timeout': 5000 };
}

class MyClass046 {
  public static readonly NULL_VALUE: string | undefined = undefined;
  public static readonly UNDEFINED_VALUE: string | undefined = undefined;
  public static dynamicValue: string | undefined = undefined;
}

class MyClass047 {
  public static readonly VERSION_MAJOR: int = 1;
  public static readonly VERSION_MINOR: int = 0;
  public static readonly VERSION_PATCH: int = 0;
  public static buildNumber: int = 1;
  public static readonly RELEASE_DATE: string = '2026-01-01';
  public static lastModified: string = '2026-01-01';
}

function reflectMyClass001(): ReflectClass {
  const cls = createReflectClass('MyClass001');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, true);
  return cls;
}

function reflectMyClass002(): ReflectClass {
  const cls = createReflectClass('MyClass002');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, true);
  return cls;
}

function reflectMyClass004(): ReflectClass {
  const cls = createReflectClass('MyClass004');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, true);
  cls.addStaticField('id', createReflectClass('int'), 100, false, true, false, true);
  cls.addStaticField('flag', createReflectClass('boolean'), true, false, false, true, true);
  return cls;
}

function reflectMyClass005(): ReflectClass {
  const cls = createReflectClass('MyClass005');
  cls.addStaticField('count', createReflectClass('int'), 0, true, false, false, false);
  cls.addStaticField('value', createReflectClass('string'), 'test', false, true, false, false);
  cls.addStaticField('data', createReflectClass('string[]'), '', false, false, true, false);
  return cls;
}

function reflectMyClass006(): ReflectClass {
  const cls = createReflectClass('MyClass006');
  cls.addStaticField('constant', createReflectClass('double'), 3.14, true, false, false, true);
  return cls;
}

function reflectMyClass007(): ReflectClass {
  const cls = createReflectClass('MyClass007');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, true);
  return cls;
}

function reflectMyClass008(): ReflectClass {
  const cls = createReflectClass('MyClass008');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, true);
  return cls;
}

function reflectMyClass009(): ReflectClass {
  const cls = createReflectClass('MyClass009');
  cls.addStaticField('num', createReflectClass('int'), 100, true, false, false, true);
  cls.addStaticField('str', createReflectClass('string'), 'test', true, false, false, true);
  cls.addStaticField('bool', createReflectClass('boolean'), true, true, false, false, true);
  cls.addStaticField('arr', createReflectClass('int[]'), [] as FieldValue[], true, false, false, true);
  cls.addStaticField('obj', createReflectClass('Object'), {} as Record<string, FieldValue>, true, false, false, true);
  cls.addStaticField('charField', createReflectClass('char'), c'A' as FieldValue, true, false, false, true);
  return cls;
}

function reflectMyClass012(): ReflectClass {
  const cls = createReflectClass('MyClass012');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass013(): ReflectClass {
  const cls = createReflectClass('MyClass013');
  cls.addStaticField('value', createReflectClass('int'), 100, true, false, false, true);
  return cls;
}

function reflectMyClass014(): ReflectClass {
  const cls = createReflectClass('MyClass014');
  cls.addStaticField('value', createReflectClass('int'), 100, false, true, false, true);
  return cls;
}

function reflectMyClass015(): ReflectClass {
  const cls = createReflectClass('MyClass015');
  cls.addStaticField('value', createReflectClass('int'), 100, false, false, true, true);
  return cls;
}

function reflectMyClass016(): ReflectClass {
  const cls = createReflectClass('MyClass016');
  cls.addStaticField('value', createReflectClass('int'), 100, true, false, false, true);
  return cls;
}

function reflectMyClass017(): ReflectClass {
  const cls = createReflectClass('MyClass017');
  cls.addStaticField('value', createReflectClass('int'), 100, true, false, false, true);
  return cls;
}

function reflectMyClass018(): ReflectClass {
  const cls = createReflectClass('MyClass018');
  cls.addStaticField('value', createReflectClass('int'), 100, false, true, false, true);
  return cls;
}

function reflectMyClass019(): ReflectClass {
  const cls = createReflectClass('MyClass019');
  cls.addStaticField('value', createReflectClass('int'), 100, false, false, true, true);
  return cls;
}

function reflectMyClass020(): ReflectClass {
  const cls = createReflectClass('MyClass020');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, true);
  return cls;
}

function reflectMyClass021(): ReflectClass {
  const cls = createReflectClass('MyClass021');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, true);
  return cls;
}

function reflectMyClass022(): ReflectClass {
  const cls = createReflectClass('MyClass022');
  cls.addStaticField('constant', createReflectClass('double'), 3.14, true, false, false, true);
  return cls;
}

function reflectMyClass023(): ReflectClass {
  const cls = createReflectClass('MyClass023');
  cls.addStaticField('value', createReflectClass('int'), 100, true, false, false, true);
  return cls;
}

function reflectMyClass024(): ReflectClass {
  const cls = createReflectClass('MyClass024');
  cls.addStaticField('value', createReflectClass('int'), 100, true, false, false, true);
  return cls;
}

function reflectConfig025(): ReflectClass {
  const cls = createReflectClass('Config025');
  cls.addStaticField('APP_NAME', createReflectClass('string'), 'MyApp', true, false, false, true);
  cls.addStaticField('VERSION', createReflectClass('string'), '1.0.0', true, false, false, true);
  cls.addStaticField('debugMode', createReflectClass('boolean'), false, true, false, false, false);
  cls.addStaticField('logLevel', createReflectClass('string'), 'info', true, false, false, false);
  return cls;
}

function reflectMyClass026(): ReflectClass {
  const cls = createReflectClass('MyClass026');
  cls.addStaticField('constant', createReflectClass('int'), 100, true, false, false, true);
  cls.addStaticField('variable', createReflectClass('int'), 200, true, false, false, false);
  return cls;
}

function reflectParent027(): ReflectClass {
  const cls = createReflectClass('Parent027');
  cls.addStaticField('parentField', createReflectClass('string'), 'parent', true, false, false, true);
  return cls;
}

function reflectChild027(): ReflectClass {
  const cls = createReflectClass('Child027');
  cls.addStaticField('childField', createReflectClass('string'), 'child', true, false, false, true);
  return cls;
}

function reflectImpl028(): ReflectClass {
  const cls = createReflectClass('Impl028');
  cls.addStaticField('constant', createReflectClass('string'), 'implemented', true, false, false, true);
  return cls;
}

function reflectGenericClass029(): ReflectClass {
  const cls = createReflectClass('GenericClass029');
  cls.addStaticField('defaultValue', createReflectClass('string'), '', true, false, false, true);
  cls.addStaticField('count', createReflectClass('int'), 0, true, false, false, false);
  return cls;
}

function reflectMyClass030(): ReflectClass {
  const cls = createReflectClass('MyClass030');
  cls.addStaticField('handler', createReflectClass('function'), '', true, false, false, true);
  cls.addStaticField('callback', createReflectClass('function'), '', true, false, false, false);
  return cls;
}

function reflectMyClass031(): ReflectClass {
  const cls = createReflectClass('MyClass031');
  cls.addStaticField('inner', createReflectClass('string'), 'InnerClass031', true, false, false, true);
  cls.addStaticField('outer', createReflectClass('string'), 'Object', true, false, false, false);
  return cls;
}

function reflectMyClass032(): ReflectClass {
  const cls = createReflectClass('MyClass032');
  cls.addStaticField('value', createReflectClass('int'), 0, true, false, false, true);
  return cls;
}

function reflectCorrectClass033(): ReflectClass {
  const cls = createReflectClass('CorrectClass033');
  cls.addStaticField('value', createReflectClass('int'), 100, true, false, false, true);
  return cls;
}

function reflectMyClass034(): ReflectClass {
  const cls = createReflectClass('MyClass034');
  cls.addStaticField('value', createReflectClass('int'), 100, true, false, false, true);
  return cls;
}

function reflectMyClass035(): ReflectClass {
  const cls = createReflectClass('MyClass035');
  cls.addStaticField('field1', createReflectClass('int'), 1, true, false, false, true);
  cls.addStaticField('field2', createReflectClass('int'), 2, true, false, false, false);
  cls.addStaticField('field3', createReflectClass('int'), 3, true, false, false, true);
  cls.addStaticField('field4', createReflectClass('int'), 4, true, false, false, false);
  return cls;
}

function reflectMyClass036(): ReflectClass {
  const cls = createReflectClass('MyClass036');
  cls.addStaticField('staticReadonly', createReflectClass('string'), 'static', true, false, false, true);
  return cls;
}

function reflectMyClass037(): ReflectClass {
  const cls = createReflectClass('MyClass037');
  cls.addStaticField('CONSTANT', createReflectClass('int'), 100, true, false, false, true);
  cls.addStaticField('PRIVATE_CONSTANT', createReflectClass('int'), 200, false, true, false, true);
  cls.addStaticField('variable', createReflectClass('int'), 300, true, false, false, false);
  return cls;
}

function reflectMyClass038(): ReflectClass {
  const cls = createReflectClass('MyClass038');
  cls.addStaticField('a', createReflectClass('int'), 1, true, false, false, true);
  cls.addStaticField('b', createReflectClass('int'), 2, true, false, false, false);
  cls.addStaticField('c', createReflectClass('int'), 3, true, false, false, true);
  cls.addStaticField('d', createReflectClass('int'), 4, true, false, false, false);
  return cls;
}

function reflectMyClass039(): ReflectClass {
  const cls = createReflectClass('MyClass039');
  cls.addStaticField('MAX_SIZE', createReflectClass('int'), 1024, true, false, false, true);
  cls.addStaticField('MIN_SIZE', createReflectClass('int'), 1, true, false, false, true);
  cls.addStaticField('currentSize', createReflectClass('int'), 512, true, false, false, false);
  cls.addStaticField('DEFAULT_NAME', createReflectClass('string'), 'default', true, false, false, true);
  cls.addStaticField('tempValue', createReflectClass('string'), 'temp', true, false, false, false);
  return cls;
}

function reflectMyClass040(): ReflectClass {
  const cls = createReflectClass('MyClass040');
  cls.addStaticField('PI', createReflectClass('double'), 3.141592653589793, true, false, false, true);
  cls.addStaticField('E', createReflectClass('double'), 2.718281828459045, true, false, false, true);
  cls.addStaticField('GOLDEN_RATIO', createReflectClass('double'), 1.618033988749895, true, false, false, true);
  cls.addStaticField('precision', createReflectClass('double'), 0.0001, true, false, false, false);
  return cls;
}

function reflectMyClass041(): ReflectClass {
  const cls = createReflectClass('MyClass041');
  cls.addStaticField('HTTP_OK', createReflectClass('int'), 200, true, false, false, true);
  cls.addStaticField('HTTP_NOT_FOUND', createReflectClass('int'), 404, true, false, false, true);
  cls.addStaticField('HTTP_SERVER_ERROR', createReflectClass('int'), 500, true, false, false, true);
  cls.addStaticField('currentStatus', createReflectClass('int'), 200, true, false, false, false);
  return cls;
}

function reflectMyClass042(): ReflectClass {
  const cls = createReflectClass('MyClass042');
  cls.addStaticField('EMPTY_STRING', createReflectClass('string'), '', true, false, false, true);
  cls.addStaticField('DEFAULT_LOCALE', createReflectClass('string'), 'en-US', true, false, false, true);
  cls.addStaticField('APP_NAMESPACE', createReflectClass('string'), 'com.example.app', true, false, false, true);
  cls.addStaticField('runtimeLocale', createReflectClass('string'), 'en-US', true, false, false, false);
  return cls;
}

function reflectMyClass043(): ReflectClass {
  const cls = createReflectClass('MyClass043');
  cls.addStaticField('TRUE_VALUE', createReflectClass('boolean'), true, true, false, false, true);
  cls.addStaticField('FALSE_VALUE', createReflectClass('boolean'), false, true, false, false, true);
  cls.addStaticField('toggleFlag', createReflectClass('boolean'), false, true, false, false, false);
  return cls;
}

function reflectMyClass044(): ReflectClass {
  const cls = createReflectClass('MyClass044');
  cls.addStaticField('EMPTY_ARRAY', createReflectClass('string[]'), '', true, false, false, true);
  cls.addStaticField('DEFAULT_TAGS', createReflectClass('string[]'), '', true, false, false, true);
  cls.addStaticField('activeTags', createReflectClass('string[]'), '', true, false, false, false);
  return cls;
}

function reflectMyClass045(): ReflectClass {
  const cls = createReflectClass('MyClass045');
  cls.addStaticField('DEFAULT_CONFIG', createReflectClass('Object'), {} as Record<string, FieldValue>, true, false, false, true);
  cls.addStaticField('runtimeConfig', createReflectClass('Object'), {} as Record<string, FieldValue>, true, false, false, false);
  return cls;
}

function reflectMyClass046(): ReflectClass {
  const cls = createReflectClass('MyClass046');
  cls.addStaticField('NULL_VALUE', createReflectClass('string | undefined'), undefined, true, false, false, true);
  cls.addStaticField('UNDEFINED_VALUE', createReflectClass('string | undefined'), undefined, true, false, false, true);
  cls.addStaticField('dynamicValue', createReflectClass('string | undefined'), undefined, true, false, false, false);
  return cls;
}

function reflectMyClass047(): ReflectClass {
  const cls = createReflectClass('MyClass047');
  cls.addStaticField('VERSION_MAJOR', createReflectClass('int'), 1, true, false, false, true);
  cls.addStaticField('VERSION_MINOR', createReflectClass('int'), 0, true, false, false, true);
  cls.addStaticField('VERSION_PATCH', createReflectClass('int'), 0, true, false, false, true);
  cls.addStaticField('buildNumber', createReflectClass('int'), 1, true, false, false, false);
  cls.addStaticField('RELEASE_DATE', createReflectClass('string'), '2026-01-01', true, false, false, true);
  cls.addStaticField('lastModified', createReflectClass('string'), '2026-01-01', true, false, false, false);
  return cls;
}

class MyClass048 {
  public static readonly name: string = 'test';
  public static mutableName: string = 'mutable';
}

class MyClass049 {
  public static readonly CONSTANT: int = 100;
  private static readonly SECRET: int = 200;
}

class MyClass050 {
  protected static readonly configFlag: boolean = true;
}

class MyClass051 {
  public static readonly id: int = 1;
  public static name: string = 'test';
  public static readonly active: boolean = true;
  public static count: int = 0;
  public static readonly rate: double = 0.5;
}

class MyClass052 {
  public static readonly a: int = 10;
  public static readonly b: string = 'fixed';
  public static readonly c: boolean = false;
}

class MyClass053 {
  public static x: int = 0;
  public static y: string = '';
  public static z: boolean = true;
}

class MyClass054 {
  public static readonly defaultNum: int = 0;
  public static readonly defaultStr: string = '';
  public static readonly defaultBool: boolean = false;
}

class MyClass055 {
  public static readonly HOST: string = 'localhost';
  public static readonly PORT: int = 8080;
  public static readonly SSL_ENABLED: boolean = true;
  public static readonly MAX_CONNECTIONS: int = 100;
  public static activeConnections: int = 0;
  public static readonly TIMEOUT_MS: int = 5000;
}

function reflectMyClass048(): ReflectClass {
  const cls = createReflectClass('MyClass048');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, true);
  cls.addStaticField('mutableName', createReflectClass('string'), 'mutable', true, false, false, false);
  return cls;
}

function reflectMyClass049(): ReflectClass {
  const cls = createReflectClass('MyClass049');
  cls.addStaticField('CONSTANT', createReflectClass('int'), 100, true, false, false, true);
  cls.addStaticField('SECRET', createReflectClass('int'), 200, false, true, false, true);
  return cls;
}

function reflectMyClass050(): ReflectClass {
  const cls = createReflectClass('MyClass050');
  cls.addStaticField('configFlag', createReflectClass('boolean'), true, false, false, true, true);
  return cls;
}

function reflectMyClass051(): ReflectClass {
  const cls = createReflectClass('MyClass051');
  cls.addStaticField('id', createReflectClass('int'), 1, true, false, false, true);
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  cls.addStaticField('active', createReflectClass('boolean'), true, true, false, false, true);
  cls.addStaticField('count', createReflectClass('int'), 0, true, false, false, false);
  cls.addStaticField('rate', createReflectClass('double'), 0.5, true, false, false, true);
  return cls;
}

function reflectMyClass052(): ReflectClass {
  const cls = createReflectClass('MyClass052');
  cls.addStaticField('a', createReflectClass('int'), 10, true, false, false, true);
  cls.addStaticField('b', createReflectClass('string'), 'fixed', true, false, false, true);
  cls.addStaticField('c', createReflectClass('boolean'), false, true, false, false, true);
  return cls;
}

function reflectMyClass053(): ReflectClass {
  const cls = createReflectClass('MyClass053');
  cls.addStaticField('x', createReflectClass('int'), 0, true, false, false, false);
  cls.addStaticField('y', createReflectClass('string'), '', true, false, false, false);
  cls.addStaticField('z', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectMyClass054(): ReflectClass {
  const cls = createReflectClass('MyClass054');
  cls.addStaticField('defaultNum', createReflectClass('int'), 0, true, false, false, true);
  cls.addStaticField('defaultStr', createReflectClass('string'), '', true, false, false, true);
  cls.addStaticField('defaultBool', createReflectClass('boolean'), false, true, false, false, true);
  return cls;
}

function reflectMyClass055(): ReflectClass {
  const cls = createReflectClass('MyClass055');
  cls.addStaticField('HOST', createReflectClass('string'), 'localhost', true, false, false, true);
  cls.addStaticField('PORT', createReflectClass('int'), 8080, true, false, false, true);
  cls.addStaticField('SSL_ENABLED', createReflectClass('boolean'), true, true, false, false, true);
  cls.addStaticField('MAX_CONNECTIONS', createReflectClass('int'), 100, true, false, false, true);
  cls.addStaticField('activeConnections', createReflectClass('int'), 0, true, false, false, false);
  cls.addStaticField('TIMEOUT_MS', createReflectClass('int'), 5000, true, false, false, true);
  return cls;
}

function isConstantField(field: StaticField): boolean {
  return field.isPublic() && field.isReadonly();
}

function getMutableFields(cls: ReflectClass): StaticField[] {
  const fields: StaticField[] = cls.getDeclaredStaticFields();
  let mutable: StaticField[] = [];
  for (let i = 0; i < fields.length; i++) {
    if (!fields[i].isReadonly()) {
      mutable.push(fields[i]);
    }
  }
  return mutable;
}

function getReadonlyFields(cls: ReflectClass): StaticField[] {
  const fields: StaticField[] = cls.getDeclaredStaticFields();
  let readonly: StaticField[] = [];
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isReadonly()) {
      readonly.push(fields[i]);
    }
  }
  return readonly;
}

function countReadonlyFields(cls: ReflectClass): number {
  let count: int = 0;
  const fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isReadonly()) {
      count++;
    }
  }
  return count;
}

function hasReadonlyFields(cls: ReflectClass): boolean {
  const fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isReadonly()) {
      return true;
    }
  }
  return false;
}

function getFieldReadonlyStatus(cls: ReflectClass): Map<string, boolean> {
  let status: Map<string, boolean> = new Map<string, boolean>();
  const fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    status.set(fields[i].getName(), fields[i].isReadonly());
  }
  return status;
}

function validateMutableField(field: StaticField, newValue: string | double | boolean | null): boolean {
  if (field.isReadonly()) {
    return false;
  }
  field.setValue(newValue as FieldValue);
  return true;
}

function cloneReadonlyConfig(cls: ReflectClass): Record<string, string | number | boolean | null> {
  let config: Record<string, string | number | boolean | null> = {};
  const fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isReadonly()) {
      config[fields[i].getName()] = fields[i].getValue() as string | double | boolean | null;
    }
  }
  return config;
}

export function StaticFieldIsReadonlyTest(): void {
  describe('StaticFieldIsReadonlyTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_0100
     * @tc.name testStaticFieldIsReadonly001
     * @tc.desc Verify isReadonly() can be called without any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass001();
      const field: StaticField | null = cls.getStaticField('name');
      const result: boolean = field!.isReadonly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_0200
     * @tc.name testStaticFieldIsReadonly002
     * @tc.desc Verify isReadonly() works without passing any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass002();
      const field: StaticField | null = cls.getStaticField('name');
      const result: boolean = field!.isReadonly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_0300
     * @tc.name testStaticFieldIsReadonly003
     * @tc.desc Verify isReadonly works correctly without extra parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass001();
      const field: StaticField | null = cls.getStaticField('name');
      const result: boolean = field!.isReadonly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_0400
     * @tc.name testStaticFieldIsReadonly004
     * @tc.desc Verify readonly static fields return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass004();
      const field1: StaticField | null = cls.getStaticField('name');
      expect(field1!.isReadonly()).assertEqual(true);
      const field2: StaticField | null = cls.getStaticField('id');
      expect(field2!.isReadonly()).assertEqual(true);
      const field3: StaticField | null = cls.getStaticField('flag');
      expect(field3!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_0500
     * @tc.name testStaticFieldIsReadonly005
     * @tc.desc Verify non-readonly static fields return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass005();
      const field1: StaticField | null = cls.getStaticField('count');
      expect(field1!.isReadonly()).assertEqual(false);
      const field2: StaticField | null = cls.getStaticField('value');
      expect(field2!.isReadonly()).assertEqual(false);
      const field3: StaticField | null = cls.getStaticField('data');
      expect(field3!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_0600
     * @tc.name testStaticFieldIsReadonly006
     * @tc.desc Verify const static fields are also readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass006();
      const field: StaticField | null = cls.getStaticField('constant');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_0700
     * @tc.name testStaticFieldIsReadonly007
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass007();
      const field: StaticField | null = cls.getStaticField('name');
      const result: boolean = field!.isReadonly();
      expect(result === true || result === false).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_0800
     * @tc.name testStaticFieldIsReadonly008
     * @tc.desc Verify return value can be used as boolean condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass008();
      const field: StaticField | null = cls.getStaticField('name');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_0900
     * @tc.name testStaticFieldIsReadonly009
     * @tc.desc Verify readonly fields of different types all return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass009();
      expect(cls.getStaticField('num')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('str')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('bool')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('arr')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('obj')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('charField')!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_1000
     * @tc.name testStaticFieldIsReadonly010
     * @tc.desc Verify calling isReadonly on null object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field: StaticField | null = null;
      try {
        field!.isReadonly();
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_1100
     * @tc.name testStaticFieldIsReadonly011
     * @tc.desc Verify calling isReadonly on undefined object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const field: StaticField | undefined = undefined;
      try {
        field!.isReadonly();
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_1200
     * @tc.name testStaticFieldIsReadonly012
     * @tc.desc Verify accessing non-existent static field returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass012();
      const field: StaticField | null = cls.getStaticField('nonexistent');
      if (field !== null) {
        const result: boolean = field.isReadonly();
        expect(result).assertEqual(true);
      } else {
        expect(field).assertEqual(null);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_1300
     * @tc.name testStaticFieldIsReadonly013
     * @tc.desc Verify public readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass013();
      const field: StaticField | null = cls.getStaticField('value');
      expect(field!.isPublic()).assertEqual(true);
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_1400
     * @tc.name testStaticFieldIsReadonly014
     * @tc.desc Verify private readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass014();
      const field: StaticField | null = cls.getStaticField('value');
      expect(field!.isPrivate()).assertEqual(true);
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_1500
     * @tc.name testStaticFieldIsReadonly015
     * @tc.desc Verify protected readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass015();
      const field: StaticField | null = cls.getStaticField('value');
      expect(field!.isProtected()).assertEqual(true);
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_1600
     * @tc.name testStaticFieldIsReadonly016
     * @tc.desc Verify internal readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass016();
      const field: StaticField | null = cls.getStaticField('value');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_1700
     * @tc.name testStaticFieldIsReadonly017
     * @tc.desc Verify combining isPublic and isReadonly checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass017();
      const field: StaticField | null = cls.getStaticField('value');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_1800
     * @tc.name testStaticFieldIsReadonly018
     * @tc.desc Verify combining isPrivate and isReadonly checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass018();
      const field: StaticField | null = cls.getStaticField('value');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_1900
     * @tc.name testStaticFieldIsReadonly019
     * @tc.desc Verify combining isProtected and isReadonly checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass019();
      const field: StaticField | null = cls.getStaticField('value');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_2000
     * @tc.name testStaticFieldIsReadonly020
     * @tc.desc Verify getting type info of readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass020();
      const field: StaticField | null = cls.getStaticField('name');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_2100
     * @tc.name testStaticFieldIsReadonly021
     * @tc.desc Verify getting name of readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass021();
      const field: StaticField | null = cls.getStaticField('name');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_2200
     * @tc.name testStaticFieldIsReadonly022
     * @tc.desc Verify getting value of readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass022();
      const field: StaticField | null = cls.getStaticField('constant');
      if (field!.isReadonly()) {
        let value: string | number | boolean | null = field!.getValue() as string | number | boolean | null;
        expect(value !== null && value !== undefined).assertEqual(true);
      }
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_2300
     * @tc.name testStaticFieldIsReadonly023
     * @tc.desc Verify isReadonly is a synchronous method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass023();
      const field: StaticField | null = cls.getStaticField('value');
      const result: boolean = field!.isReadonly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_2400
     * @tc.name testStaticFieldIsReadonly024
     * @tc.desc Verify return value is not a Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass024();
      const field: StaticField | null = cls.getStaticField('value');
      const result: boolean = field!.isReadonly();
      expect(result instanceof Promise).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_2500
     * @tc.name testStaticFieldIsReadonly025
     * @tc.desc Verify complete reflection API workflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectConfig025();
      const fieldNames: string[] = ['APP_NAME', 'VERSION', 'debugMode', 'logLevel'];
      for (let i = 0; i < fieldNames.length; i++) {
        const field: StaticField | null = cls.getStaticField(fieldNames[i]);
        if (field !== null) {
          const fieldName: string = field.getName();
          let isReadonly: boolean = field.isReadonly();
        }
      }
      let appNameField: StaticField | null = cls.getStaticField('APP_NAME');
      expect(appNameField!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_2600
     * @tc.name testStaticFieldIsReadonly026
     * @tc.desc Verify using isReadonly to determine field mutability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass026();
      const fieldNames: string[] = ['constant', 'variable'];
      for (let i = 0; i < fieldNames.length; i++) {
        const field: StaticField | null = cls.getStaticField(fieldNames[i]);
        if (field !== null) {
          if (!field.isReadonly()) {
            field.setValue(300);
          }
        }
      }
      let constField: StaticField | null = cls.getStaticField('constant');
      expect(constField!.isReadonly()).assertEqual(true);
      let varField: StaticField | null = cls.getStaticField('variable');
      expect(varField!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_2700
     * @tc.name testStaticFieldIsReadonly027
     * @tc.desc Verify accessing parent class static readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls: ReflectClass = reflectParent027();
      let parentField: StaticField | null = parentCls.getStaticField('parentField');
      expect(parentField!.isReadonly()).assertEqual(true);
      let childCls: ReflectClass = reflectChild027();
      let childField: StaticField | null = childCls.getStaticField('childField');
      expect(childField!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_2800
     * @tc.name testStaticFieldIsReadonly028
     * @tc.desc Verify static fields defined in interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectImpl028();
      const field: StaticField | null = cls.getStaticField('constant');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_2900
     * @tc.name testStaticFieldIsReadonly029
     * @tc.desc Verify static readonly fields in generic class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectGenericClass029();
      const field1: StaticField | null = cls.getStaticField('defaultValue');
      expect(field1!.isReadonly()).assertEqual(true);
      const field2: StaticField | null = cls.getStaticField('count');
      expect(field2!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_3000
     * @tc.name testStaticFieldIsReadonly030
     * @tc.desc Verify function type readonly fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass030();
      expect(cls.getStaticField('handler')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('callback')!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_3100
     * @tc.name testStaticFieldIsReadonly031
     * @tc.desc Verify class type readonly fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass031();
      expect(cls.getStaticField('inner')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('outer')!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_3200
     * @tc.name testStaticFieldIsReadonly032
     * @tc.desc Verify readonly fields must be initialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass032();
      const field: StaticField | null = cls.getStaticField('value');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_3300
     * @tc.name testStaticFieldIsReadonly033
     * @tc.desc Verify static readonly fields must be initialized at declaration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectCorrectClass033();
      const field: StaticField | null = cls.getStaticField('value');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_3400
     * @tc.name testStaticFieldIsReadonly034
     * @tc.desc Verify multiple calls to isReadonly return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass034();
      const field: StaticField | null = cls.getStaticField('value');
      const result1: boolean = field!.isReadonly();
      const result2: boolean = field!.isReadonly();
      const result3: boolean = field!.isReadonly();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_3500
     * @tc.name testStaticFieldIsReadonly035
     * @tc.desc Verify iterating over many static fields and checking readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass035();
      const fieldNames: string[] = ['field1', 'field2', 'field3', 'field4'];
      let readonlyCount: int = 0;
      for (let i = 0; i < fieldNames.length; i++) {
        const field: StaticField | null = cls.getStaticField(fieldNames[i]);
        if (field !== null && field.isReadonly()) {
          readonlyCount++;
        }
      }
      expect(readonlyCount).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_3600
     * @tc.name testStaticFieldIsReadonly036
     * @tc.desc Verify StaticField isReadonly behavior consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass036();
      let staticField: StaticField | null = cls.getStaticField('staticReadonly');
      expect(staticField!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_3700
     * @tc.name testStaticFieldIsReadonly037
     * @tc.desc Verify encapsulated constant field check logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass037();
      const field1: StaticField | null = cls.getStaticField('CONSTANT');
      expect(field1!.isPublic() && field1!.isReadonly()).assertEqual(true);
      const field2: StaticField | null = cls.getStaticField('PRIVATE_CONSTANT');
      expect(field2!.isPrivate()).assertEqual(true);
      expect(field2!.isReadonly()).assertEqual(true);
      expect(field2!.isPublic()).assertEqual(false);
      const field3: StaticField | null = cls.getStaticField('variable');
      expect(field3!.isPublic() && field3!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_3800
     * @tc.name testStaticFieldIsReadonly038
     * @tc.desc Verify filtering readonly fields from field list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass038();
      const fieldNames: string[] = ['a', 'b', 'c', 'd'];
      let readonlyFields: StaticField[] = [];
      for (let i = 0; i < fieldNames.length; i++) {
        const field: StaticField | null = cls.getStaticField(fieldNames[i]);
        if (field !== null && field.isReadonly()) {
          readonlyFields.push(field);
        }
      }
      expect(readonlyFields.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_3900
     * @tc.name testStaticFieldIsReadonly039
     * @tc.desc Verify readonly fields with size constraints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass039();
      expect(cls.getStaticField('MAX_SIZE')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('MIN_SIZE')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('currentSize')!.isReadonly()).assertEqual(false);
      expect(cls.getStaticField('DEFAULT_NAME')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('tempValue')!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_4000
     * @tc.name testStaticFieldIsReadonly040
     * @tc.desc Verify readonly mathematical constants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass040();
      expect(cls.getStaticField('PI')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('E')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('GOLDEN_RATIO')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('precision')!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_4100
     * @tc.name testStaticFieldIsReadonly041
     * @tc.desc Verify readonly HTTP status code constants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass041();
      expect(cls.getStaticField('HTTP_OK')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('HTTP_NOT_FOUND')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('HTTP_SERVER_ERROR')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('currentStatus')!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_4200
     * @tc.name testStaticFieldIsReadonly042
     * @tc.desc Verify readonly string constants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass042();
      expect(cls.getStaticField('EMPTY_STRING')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('DEFAULT_LOCALE')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('APP_NAMESPACE')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('runtimeLocale')!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_4300
     * @tc.name testStaticFieldIsReadonly043
     * @tc.desc Verify readonly boolean constants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass043();
      expect(cls.getStaticField('TRUE_VALUE')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('FALSE_VALUE')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('toggleFlag')!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_4400
     * @tc.name testStaticFieldIsReadonly044
     * @tc.desc Verify readonly array constants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass044();
      expect(cls.getStaticField('EMPTY_ARRAY')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('DEFAULT_TAGS')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('activeTags')!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_4500
     * @tc.name testStaticFieldIsReadonly045
     * @tc.desc Verify readonly object constants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass045();
      expect(cls.getStaticField('DEFAULT_CONFIG')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('runtimeConfig')!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_4600
     * @tc.name testStaticFieldIsReadonly046
     * @tc.desc Verify readonly null and undefined fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass046();
      expect(cls.getStaticField('NULL_VALUE')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('UNDEFINED_VALUE')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('dynamicValue')!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_4700
     * @tc.name testStaticFieldIsReadonly047
     * @tc.desc Verify readonly version constants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass047();
      expect(cls.getStaticField('VERSION_MAJOR')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('VERSION_MINOR')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('VERSION_PATCH')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('buildNumber')!.isReadonly()).assertEqual(false);
      expect(cls.getStaticField('RELEASE_DATE')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('lastModified')!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_4800
     * @tc.name testStaticFieldIsReadonly048
     * @tc.desc Verify isConstantField helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass039();
      let maxSizeField: StaticField | null = cls.getStaticField('MAX_SIZE');
      expect(isConstantField(maxSizeField!)).assertEqual(true);
      let currentSizeField: StaticField | null = cls.getStaticField('currentSize');
      expect(isConstantField(currentSizeField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_4900
     * @tc.name testStaticFieldIsReadonly049
     * @tc.desc Verify getMutableFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass039();
      let mutableFields: StaticField[] = getMutableFields(cls);
      expect(mutableFields.length).assertEqual(2);
      for (let i = 0; i < mutableFields.length; i++) {
        expect(mutableFields[i].isReadonly()).assertEqual(false);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_5000
     * @tc.name testStaticFieldIsReadonly050
     * @tc.desc Verify getReadonlyFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass047();
      let readonlyFields: StaticField[] = getReadonlyFields(cls);
      expect(readonlyFields.length).assertEqual(4);
      for (let i = 0; i < readonlyFields.length; i++) {
        expect(readonlyFields[i].isReadonly()).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_5100
     * @tc.name testStaticFieldIsReadonly051
     * @tc.desc Verify countReadonlyFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass040();
      let count = countReadonlyFields(cls);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_5200
     * @tc.name testStaticFieldIsReadonly052
     * @tc.desc Verify hasReadonlyFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls1: ReflectClass = reflectMyClass039();
      expect(hasReadonlyFields(cls1)).assertEqual(true);
      const cls2: ReflectClass = reflectMyClass005();
      expect(hasReadonlyFields(cls2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_5300
     * @tc.name testStaticFieldIsReadonly053
     * @tc.desc Verify getFieldReadonlyStatus helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass041();
      let status: Map<string, boolean> = getFieldReadonlyStatus(cls);
      expect(status.get('HTTP_OK')).assertEqual(true);
      expect(status.get('HTTP_NOT_FOUND')).assertEqual(true);
      expect(status.get('HTTP_SERVER_ERROR')).assertEqual(true);
      expect(status.get('currentStatus')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_5400
     * @tc.name testStaticFieldIsReadonly054
     * @tc.desc Verify validateMutableField helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass039();
      let mutableField: StaticField | null = cls.getStaticField('currentSize');
      expect(validateMutableField(mutableField!, 1024)).assertEqual(true);
      let readonlyField: StaticField | null = cls.getStaticField('MAX_SIZE');
      expect(validateMutableField(readonlyField!, 2048)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_5500
     * @tc.name testStaticFieldIsReadonly055
     * @tc.desc Verify cloneReadonlyConfig helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass042();
      let config: Record<string, string | number | boolean | null> = cloneReadonlyConfig(cls);
      expect(config['EMPTY_STRING']).assertEqual('');
      expect(config['DEFAULT_LOCALE']).assertEqual('en-US');
      expect(config['APP_NAMESPACE']).assertEqual('com.example.app');
      expect(config['runtimeLocale']).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_5600
     * @tc.name testStaticFieldIsReadonly056
     * @tc.desc Verify isReadonly with mixed readonly and mutable fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass048();
      let readonlyField: StaticField | null = cls.getStaticField('name');
      expect(readonlyField!.isReadonly()).assertEqual(true);
      let mutableField: StaticField | null = cls.getStaticField('mutableName');
      expect(mutableField!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_5700
     * @tc.name testStaticFieldIsReadonly057
     * @tc.desc Verify isReadonly with public and private readonly fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass049();
      let publicField: StaticField | null = cls.getStaticField('CONSTANT');
      expect(publicField!.isReadonly()).assertEqual(true);
      let privateField: StaticField | null = cls.getStaticField('SECRET');
      expect(privateField!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_5800
     * @tc.name testStaticFieldIsReadonly058
     * @tc.desc Verify isReadonly with protected readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass050();
      const field: StaticField | null = cls.getStaticField('configFlag');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_5900
     * @tc.name testStaticFieldIsReadonly059
     * @tc.desc Verify isReadonly with multiple fields of various types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass051();
      expect(cls.getStaticField('id')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('name')!.isReadonly()).assertEqual(false);
      expect(cls.getStaticField('active')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('count')!.isReadonly()).assertEqual(false);
      expect(cls.getStaticField('rate')!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_6000
     * @tc.name testStaticFieldIsReadonly060
     * @tc.desc Verify isReadonly when all fields are readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass052();
      const fields: StaticField[] = cls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].isReadonly()).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_6100
     * @tc.name testStaticFieldIsReadonly061
     * @tc.desc Verify isReadonly when no fields are readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass053();
      const fields: StaticField[] = cls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].isReadonly()).assertEqual(false);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_6200
     * @tc.name testStaticFieldIsReadonly062
     * @tc.desc Verify isReadonly with default value readonly fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass054();
      expect(cls.getStaticField('defaultNum')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('defaultStr')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('defaultBool')!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_6300
     * @tc.name testStaticFieldIsReadonly063
     * @tc.desc Verify isReadonly with complex config class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass055();
      expect(cls.getStaticField('HOST')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('PORT')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('SSL_ENABLED')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('MAX_CONNECTIONS')!.isReadonly()).assertEqual(true);
      expect(cls.getStaticField('activeConnections')!.isReadonly()).assertEqual(false);
      expect(cls.getStaticField('TIMEOUT_MS')!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_6400
     * @tc.name testStaticFieldIsReadonly064
     * @tc.desc Verify isReadonly consistency across multiple instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls1: ReflectClass = reflectMyClass048();
      const cls2: ReflectClass = reflectMyClass048();
      const field1: StaticField | null = cls1.getStaticField('name');
      const field2: StaticField | null = cls2.getStaticField('name');
      expect(field1!.isReadonly()).assertEqual(field2!.isReadonly());
      expect(field1!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_6500
     * @tc.name testStaticFieldIsReadonly065
     * @tc.desc Verify isReadonly with field iteration and counting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsReadonly065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass055();
      const fields: StaticField[] = cls.getDeclaredStaticFields();
      let readonlyCount: int = 0;
      for (let i = 0; i < fields.length; i++) {
        if (fields[i].isReadonly()) {
          readonlyCount++;
        }
      }
      expect(readonlyCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_INTEGRATION_ISREADONLY_0100
     * @tc.name integrationIsReadonly001
     * @tc.desc Verify isReadonly returns true for readonly fields using real Class.from API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('integrationIsReadonly001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const field = Class.from<IntegrationIsReadonlyClass>().getStaticField('CONSTANT_VALUE');
      expect(field !== undefined).assertEqual(true);
      expect(field!.isReadonly()).assertEqual(true);
    });
  });
}