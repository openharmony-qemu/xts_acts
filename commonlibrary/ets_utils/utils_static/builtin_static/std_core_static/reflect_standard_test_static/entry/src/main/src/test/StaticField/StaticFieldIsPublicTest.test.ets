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
import { FieldValue, StaticField, ReflectClass, createReflectClass, PLACEHOLDER_PASSWORD, PLACEHOLDER_API_KEY, PLACEHOLDER_TOKEN } from '../Util.test';

class IntegrationIsPublicClass {
  public static name: string = 'test';
  public static count: int = 0;
}

class MyClass001 {
  public static name: string = 'test';
}

class MyClass004 {
  public static name: string = 'test';
  public static count: int = 0;
  public static data: string[] = [];
}

class MyClass005 {
  private static secret: string = 'hidden';
  private static value: int = 100;
}

class MyClass006 {
  protected static config: string = 'settings';
  protected static buffer: string[] = [];
}

class MyClass007 {
  public static internalField: string = 'internal';
}

class MyClass009 {
  public static defaultField: string = 'default';
}

class MyClass012 {
  public static num: int = 100;
  public static str: string = 'test';
  public static bool: boolean = true;
  public static arr: int[] = [1, 2, 3];
  public static obj: Record<string, string> = { 'key': 'value' };
  public static charField: char = c'A';
}

class MyClass015 {
  public static name: string = 'test';
}

class MyClass016 {
  public static readonly value: int = 100;
}

class MyClass017 {
  public static count: int = 0;
}

class MyClass018 {
  public static readonly constant: double = 3.14;
}

class MyClass019 {
  public static pub: string = 'public';
  private static priv: string = 'private';
}

class MyClass020 {
  public static pub: string = 'public';
  protected static prot: string = 'protected';
}

class MyClass021 {
  public static readonly pubReadonly: string = 'value';
  private static readonly privReadonly: string = 'value';
}

class MyClass024 {
  public static constant: double = 3.14;
  private static secret: string = 'hidden';
}

class MyClass025 {
  public static variable: int = 100;
  private static secret: string = 'hidden';
}

class Config028 {
  public static APP_NAME: string = 'MyApp';
  public static VERSION: string = '1.0.0';
  private static API_KEY: string = PLACEHOLDER_API_KEY;
  protected static DEBUG_MODE: boolean = false;
  public static LOG_LEVEL: string = 'info';
}

class MyClass029 {
  public static publicField: string = 'public';
  private static privateField: string = 'private';
  protected static protectedField: string = 'protected';
}

class Parent030 {
  public static parentPublic: string = 'parent public';
  private static parentPrivate: string = 'parent private';
  protected static parentProtected: string = 'parent protected';
}

class Child030 extends Parent030 {
  public static childPublic: string = 'child public';
  private static childPrivate: string = 'child private';
}

interface MyInterface031 {
  constant: string;
}

class Impl031 implements MyInterface031 {
  private _constant: string = 'implemented';

  public get constant(): string {
    return this._constant;
  }

  public set constant(value: string) {
    this._constant = value;
  }
}

class GenericClass032 {
  public static defaultValue: string = '';
  public static count: int = 0;
  private static cache: string[] = [];
}

class MyClass033 {
  public static handler: () => void = (): void => {
  };
  private static callback: () => void = (): void => {
  };
}

class InnerClass034 {
}

class MyClass034 {
  public static inner: string = 'InnerClass034';
  private static outer: string = 'Object';
}

class MyClass035 {
  public static pub: int = 1;
  private static priv: int = 2;
  protected static prot: int = 3;
}

class MyClass036 {
  public static value: int = 100;
}

class MyClass037 {
  public static field1: int = 1;
  private static field2: int = 2;
  public static field3: int = 3;
  private static field4: int = 4;
  public static field5: int = 5;
}

class MyClass039 {
  public static pub: int = 100;
  private static priv: int = 200;
  protected static prot: int = 300;
}

class MyClass040 {
  public static a: int = 1;
  private static b: int = 2;
  public static c: int = 3;
  protected static d: int = 4;
}

class MyClass041 {
  public static pub: int = 1;
  private static priv: int = 2;
  protected static prot: int = 3;
  public static inter: int = 4;
}

class MyClass038 {
  public static staticPublic: string = 'static';
  public instancePublic: string = 'instance';
}

class MyClass042 {
  public static name: string = 'test';
  public static version: string = '1.0.0';
  private static secret: string = 'hidden';
}

class MyClass043 {
  public static displayName: string = 'User';
  public static email: string = 'user@example.com';
  private static password: string = PLACEHOLDER_PASSWORD;
  private static authToken: string = PLACEHOLDER_TOKEN;
}

class MyClass044 {
  public static publicData: string = 'public';
  private static privateData: string = 'private';
}

class AppConfig045 {
  public static APP_NAME: string = 'MyApp';
  public static VERSION: string = '1.0.0';
  public static ENVIRONMENT: string = 'production';
  private static DB_PASSWORD: string = PLACEHOLDER_PASSWORD;
  private static API_SECRET: string = PLACEHOLDER_API_KEY;
}

class API046 {
  public static ENDPOINT: string = 'https://api.example.com';
  public static TIMEOUT: int = 5000;
  private static INTERNAL_KEY: string = PLACEHOLDER_API_KEY;
}

class MyClass047 {
  public static SERVICE_NAME: string = 'UserService';
  public static SERVICE_PORT: int = 8080;
  public static SERVICE_HOST: string = 'localhost';
  private static SERVICE_SECRET: string = PLACEHOLDER_API_KEY;
  protected static SERVICE_CONFIG: string = 'config';
}

class MyClass048 {
  public static FEATURE_FLAG_A: boolean = true;
  public static FEATURE_FLAG_B: boolean = false;
  public static FEATURE_FLAG_C: boolean = true;
  private static FEATURE_INTERNAL: boolean = false;
}

class MyClass049 {
  public static DEFAULT_TIMEOUT: int = 30000;
  public static MAX_RETRIES: int = 3;
  public static CONNECTION_POOL_SIZE: int = 10;
  private static INTERNAL_BUFFER_SIZE: int = 4096;
}

class MyClass050 {
  public static readonly CACHE_TTL: int = 3600;
  public static readonly CACHE_MAX_SIZE: int = 1024;
  public static cacheEnabled: boolean = true;
  private static cacheStorage: Record<string, string> = {};
}

class MyClass051 {
  public static LOG_LEVEL_INFO: string = 'INFO';
  public static LOG_LEVEL_WARN: string = 'WARN';
  public static LOG_LEVEL_ERROR: string = 'ERROR';
  public static LOG_LEVEL_DEBUG: string = 'DEBUG';
  private static LOG_FORMAT: string = 'json';
}

class MyClass052 {
  public static DB_HOST: string = 'localhost';
  public static DB_PORT: int = 5432;
  public static DB_NAME: string = 'mydb';
  private static DB_PASSWORD: string = PLACEHOLDER_PASSWORD;
  private static DB_USER: string = PLACEHOLDER_PASSWORD;
}

class MyClass053 {
  public static METRIC_CPU: string = 'cpu_usage';
  public static METRIC_MEMORY: string = 'memory_usage';
  public static METRIC_DISK: string = 'disk_usage';
  public static METRIC_NETWORK: string = 'network_io';
  private static METRIC_INTERNAL: string = 'internal_metric';
}

class MyClass054 {
  public static REGION_US_EAST: string = 'us-east-1';
  public static REGION_US_WEST: string = 'us-west-1';
  public static REGION_EU_WEST: string = 'eu-west-1';
  public static REGION_AP_SOUTHEAST: string = 'ap-southeast-1';
  private static DEFAULT_REGION: string = 'us-east-1';
}

class MyClass055 {
  public static COLOR_RED: string = '#FF0000';
  public static COLOR_GREEN: string = '#00FF00';
  public static COLOR_BLUE: string = '#0000FF';
  public static COLOR_BLACK: string = '#000000';
  public static COLOR_WHITE: string = '#FFFFFF';
  private static COLOR_TRANSPARENT: string = '#00000000';
}

function reflectMyClass047(): ReflectClass {
  const cls = createReflectClass('MyClass047');
  cls.addStaticField('SERVICE_NAME', createReflectClass('string'), 'UserService', true, false, false, false);
  cls.addStaticField('SERVICE_PORT', createReflectClass('int'), 8080, true, false, false, false);
  cls.addStaticField('SERVICE_HOST', createReflectClass('string'), 'localhost', true, false, false, false);
  cls.addStaticField('SERVICE_SECRET', createReflectClass('string'), PLACEHOLDER_API_KEY, false, true, false, false);
  cls.addStaticField('SERVICE_CONFIG', createReflectClass('string'), 'config', false, false, true, false);
  return cls;
}

function reflectMyClass048(): ReflectClass {
  const cls = createReflectClass('MyClass048');
  cls.addStaticField('FEATURE_FLAG_A', createReflectClass('boolean'), true, true, false, false, false);
  cls.addStaticField('FEATURE_FLAG_B', createReflectClass('boolean'), false, true, false, false, false);
  cls.addStaticField('FEATURE_FLAG_C', createReflectClass('boolean'), true, true, false, false, false);
  cls.addStaticField('FEATURE_INTERNAL', createReflectClass('boolean'), false, false, true, false, false);
  return cls;
}

function reflectMyClass049(): ReflectClass {
  const cls = createReflectClass('MyClass049');
  cls.addStaticField('DEFAULT_TIMEOUT', createReflectClass('int'), 30000, true, false, false, false);
  cls.addStaticField('MAX_RETRIES', createReflectClass('int'), 3, true, false, false, false);
  cls.addStaticField('CONNECTION_POOL_SIZE', createReflectClass('int'), 10, true, false, false, false);
  cls.addStaticField('INTERNAL_BUFFER_SIZE', createReflectClass('int'), 4096, false, true, false, false);
  return cls;
}

function reflectMyClass050(): ReflectClass {
  const cls = createReflectClass('MyClass050');
  cls.addStaticField('CACHE_TTL', createReflectClass('int'), 3600, true, false, false, true);
  cls.addStaticField('CACHE_MAX_SIZE', createReflectClass('int'), 1024, true, false, false, true);
  cls.addStaticField('cacheEnabled', createReflectClass('boolean'), true, true, false, false, false);
  cls.addStaticField('cacheStorage', createReflectClass('Object'), {} as Record<string, FieldValue>, false, true, false, false);
  return cls;
}

function reflectMyClass051(): ReflectClass {
  const cls = createReflectClass('MyClass051');
  cls.addStaticField('LOG_LEVEL_INFO', createReflectClass('string'), 'INFO', true, false, false, false);
  cls.addStaticField('LOG_LEVEL_WARN', createReflectClass('string'), 'WARN', true, false, false, false);
  cls.addStaticField('LOG_LEVEL_ERROR', createReflectClass('string'), 'ERROR', true, false, false, false);
  cls.addStaticField('LOG_LEVEL_DEBUG', createReflectClass('string'), 'DEBUG', true, false, false, false);
  cls.addStaticField('LOG_FORMAT', createReflectClass('string'), 'json', false, true, false, false);
  return cls;
}

function reflectMyClass052(): ReflectClass {
  const cls = createReflectClass('MyClass052');
  cls.addStaticField('DB_HOST', createReflectClass('string'), 'localhost', true, false, false, false);
  cls.addStaticField('DB_PORT', createReflectClass('int'), 5432, true, false, false, false);
  cls.addStaticField('DB_NAME', createReflectClass('string'), 'mydb', true, false, false, false);
  cls.addStaticField('DB_PASSWORD', createReflectClass('string'), PLACEHOLDER_PASSWORD, false, true, false, false);
  cls.addStaticField('DB_USER', createReflectClass('string'), PLACEHOLDER_PASSWORD, false, true, false, false);
  return cls;
}

function reflectMyClass053(): ReflectClass {
  const cls = createReflectClass('MyClass053');
  cls.addStaticField('METRIC_CPU', createReflectClass('string'), 'cpu_usage', true, false, false, false);
  cls.addStaticField('METRIC_MEMORY', createReflectClass('string'), 'memory_usage', true, false, false, false);
  cls.addStaticField('METRIC_DISK', createReflectClass('string'), 'disk_usage', true, false, false, false);
  cls.addStaticField('METRIC_NETWORK', createReflectClass('string'), 'network_io', true, false, false, false);
  cls.addStaticField('METRIC_INTERNAL', createReflectClass('string'), 'internal_metric', false, true, false, false);
  return cls;
}

function reflectMyClass054(): ReflectClass {
  const cls = createReflectClass('MyClass054');
  cls.addStaticField('REGION_US_EAST', createReflectClass('string'), 'us-east-1', true, false, false, false);
  cls.addStaticField('REGION_US_WEST', createReflectClass('string'), 'us-west-1', true, false, false, false);
  cls.addStaticField('REGION_EU_WEST', createReflectClass('string'), 'eu-west-1', true, false, false, false);
  cls.addStaticField('REGION_AP_SOUTHEAST', createReflectClass('string'), 'ap-southeast-1', true, false, false, false);
  cls.addStaticField('DEFAULT_REGION', createReflectClass('string'), 'us-east-1', false, true, false, false);
  return cls;
}

function reflectMyClass055(): ReflectClass {
  const cls = createReflectClass('MyClass055');
  cls.addStaticField('COLOR_RED', createReflectClass('string'), '#FF0000', true, false, false, false);
  cls.addStaticField('COLOR_GREEN', createReflectClass('string'), '#00FF00', true, false, false, false);
  cls.addStaticField('COLOR_BLUE', createReflectClass('string'), '#0000FF', true, false, false, false);
  cls.addStaticField('COLOR_BLACK', createReflectClass('string'), '#000000', true, false, false, false);
  cls.addStaticField('COLOR_WHITE', createReflectClass('string'), '#FFFFFF', true, false, false, false);
  cls.addStaticField('COLOR_TRANSPARENT', createReflectClass('string'), '#00000000', false, true, false, false);
  return cls;
}

function reflectAppConfig045(): ReflectClass {
  const cls = createReflectClass('AppConfig045');
  cls.addStaticField('APP_NAME', createReflectClass('string'), 'MyApp', true, false, false, false);
  cls.addStaticField('VERSION', createReflectClass('string'), '1.0.0', true, false, false, false);
  cls.addStaticField('ENVIRONMENT', createReflectClass('string'), 'production', true, false, false, false);
  cls.addStaticField('DB_PASSWORD', createReflectClass('string'), PLACEHOLDER_PASSWORD, false, true, false, false);
  cls.addStaticField('API_SECRET', createReflectClass('string'), PLACEHOLDER_API_KEY, false, true, false, false);
  return cls;
}

function reflectAPI046(): ReflectClass {
  const cls = createReflectClass('API046');
  cls.addStaticField('ENDPOINT', createReflectClass('string'), 'https://api.example.com', true, false, false, false);
  cls.addStaticField('TIMEOUT', createReflectClass('int'), 5000, true, false, false, false);
  cls.addStaticField('INTERNAL_KEY', createReflectClass('string'), PLACEHOLDER_API_KEY, false, true, false, false);
  return cls;
}

class MyClass056 {
  public static pub: string = 'public';
  private static priv: string = 'private';
  protected static prot: string = 'protected';
  public static inter: string = 'internal';
}

class MyClass057 {
  public static readonly CONSTANT: int = 100;
  public static variable: int = 200;
}

class MyClass058 {
  public static name: string = 'test';
  public static readonly id: int = 1;
}

class MyClass059 {
  public static flagA: boolean = true;
  public static flagB: boolean = false;
  public static flagC: boolean = true;
}

class MyClass060 {
  public static host: string = 'localhost';
  public static port: int = 8080;
  public static ssl: boolean = true;
}

class MyClass061 {
  public static items: string[] = [];
  public static config: Record<string, string> = {};
}

class MyClass062 {
  public static handler: () => void = (): void => {
  };
  public static callback: () => void = (): void => {
  };
}

function reflectMyClass056(): ReflectClass {
  const cls = createReflectClass('MyClass056');
  cls.addStaticField('pub', createReflectClass('string'), 'public', true, false, false, false);
  cls.addStaticField('priv', createReflectClass('string'), 'private', false, true, false, false);
  cls.addStaticField('prot', createReflectClass('string'), 'protected', false, false, true, false);
  cls.addStaticField('inter', createReflectClass('string'), 'internal', true, false, false, false);
  return cls;
}

function reflectMyClass057(): ReflectClass {
  const cls = createReflectClass('MyClass057');
  cls.addStaticField('CONSTANT', createReflectClass('int'), 100, true, false, false, true);
  cls.addStaticField('variable', createReflectClass('int'), 200, true, false, false, false);
  return cls;
}

function reflectMyClass058(): ReflectClass {
  const cls = createReflectClass('MyClass058');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  cls.addStaticField('id', createReflectClass('int'), 1, true, false, false, true);
  return cls;
}

function reflectMyClass059(): ReflectClass {
  const cls = createReflectClass('MyClass059');
  cls.addStaticField('flagA', createReflectClass('boolean'), true, true, false, false, false);
  cls.addStaticField('flagB', createReflectClass('boolean'), false, true, false, false, false);
  cls.addStaticField('flagC', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectMyClass060(): ReflectClass {
  const cls = createReflectClass('MyClass060');
  cls.addStaticField('host', createReflectClass('string'), 'localhost', true, false, false, false);
  cls.addStaticField('port', createReflectClass('int'), 8080, true, false, false, false);
  cls.addStaticField('ssl', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectMyClass061(): ReflectClass {
  const cls = createReflectClass('MyClass061');
  cls.addStaticField('items', createReflectClass('string[]'), '', true, false, false, false);
  cls.addStaticField('config', createReflectClass('Object'), {} as Record<string, FieldValue>, true, false, false, false);
  return cls;
}

function reflectMyClass062(): ReflectClass {
  const cls = createReflectClass('MyClass062');
  cls.addStaticField('handler', createReflectClass('function'), '', true, false, false, false);
  cls.addStaticField('callback', createReflectClass('function'), '', true, false, false, false);
  return cls;
}

function generatePublicAPIDoc(cls: ReflectClass): string {
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  let doc: string = '# Public Static Fields\n\n';
  for (let i = 0; i < fields.length; i++) {
    let field: StaticField = fields[i];
    if (field.isPublic()) {
      doc += '- ' + field.getName() + ': ' + field.getType().getName() + '\n';
    }
  }
  return doc;
}

function getPublicFieldNames(cls: ReflectClass): string[] {
  let names: string[] = [];
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isPublic()) {
      names.push(fields[i].getName());
    }
  }
  return names;
}

function getNonPublicFieldNames(cls: ReflectClass): string[] {
  let names: string[] = [];
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (!fields[i].isPublic()) {
      names.push(fields[i].getName());
    }
  }
  return names;
}

function countPublicFields(cls: ReflectClass): number {
  let count: number = 0;
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isPublic()) {
      count++;
    }
  }
  return count;
}

function hasPublicFields(cls: ReflectClass): boolean {
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isPublic()) {
      return true;
    }
  }
  return false;
}

function getFieldVisibilityMap(cls: ReflectClass): Map<string, string> {
  let map: Map<string, string> = new Map<string, string>();
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    let field: StaticField = fields[i];
    if (field.isPublic()) {
      map.set(field.getName(), 'public');
    } else if (field.isPrivate()) {
      map.set(field.getName(), 'private');
    } else if (field.isProtected()) {
      map.set(field.getName(), 'protected');
    }
  }
  return map;
}

function filterPublicFields(fields: StaticField[]): StaticField[] {
  const result: StaticField[] = [];
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isPublic()) {
      result.push(fields[i]);
    }
  }
  return result;
}

function validatePublicFieldAccess(field: StaticField): boolean {
  if (!field.isPublic()) {
    return false;
  }
  let value: string | number | boolean | null = field.getValue() as string | number | boolean | null;
  return value !== undefined;
}

function buildPublicFieldIndex(cls: ReflectClass): Record<string, string | number | boolean | null> {
  let index: Record<string, string | number | boolean | null> = {};
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isPublic()) {
      index[fields[i].getName()] = fields[i].getValue() as string | number | boolean | null;
    }
  }
  return index;
}

export function StaticFieldIsPublicTest(): void {
  describe('StaticFieldIsPublicTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_0100
     * @tc.name testStaticFieldIsPublic001
     * @tc.desc Verify isPublic does not require any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass001');
      cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('name');
      const result: boolean = field!.isPublic();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_0200
     * @tc.name testStaticFieldIsPublic002
     * @tc.desc Verify isPublic returns boolean without passing any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass001');
      cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('name');
      const result: boolean = field!.isPublic();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_0400
     * @tc.name testStaticFieldIsPublic004
     * @tc.desc Verify isPublic returns true for public static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass004');
      cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      cls.addStaticField('count', createReflectClass('int'), 0, true, false, false, false);
      cls.addStaticField('data', createReflectClass('string[]'), '', true, false, false, false);
      let field1: StaticField | null = cls.getStaticField('name');
      expect(field1!.isPublic()).assertEqual(true);
      let field2: StaticField | null = cls.getStaticField('count');
      expect(field2!.isPublic()).assertEqual(true);
      let field3: StaticField | null = cls.getStaticField('data');
      expect(field3!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_0500
     * @tc.name testStaticFieldIsPublic005
     * @tc.desc Verify isPublic returns false for private static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass005');
      cls.addStaticField('secret', createReflectClass('string'), 'hidden', false, true, false, false);
      cls.addStaticField('value', createReflectClass('int'), 100, false, true, false, false);
      let field1: StaticField | null = cls.getStaticField('secret');
      expect(field1!.isPublic()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('value');
      expect(field2!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_0600
     * @tc.name testStaticFieldIsPublic006
     * @tc.desc Verify isPublic returns false for protected static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass006');
      cls.addStaticField('config', createReflectClass('string'), 'settings', false, false, true, false);
      cls.addStaticField('buffer', createReflectClass('string[]'), '', false, false, true, false);
      let field1: StaticField | null = cls.getStaticField('config');
      expect(field1!.isPublic()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('buffer');
      expect(field2!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_0700
     * @tc.name testStaticFieldIsPublic007
     * @tc.desc Verify isPublic returns true for public static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass007');
      cls.addStaticField('internalField', createReflectClass('string'), 'internal', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('internalField');
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_0800
     * @tc.name testStaticFieldIsPublic008
     * @tc.desc Verify isPublic return value is strictly boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass004');
      cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('name');
      const result: boolean = field!.isPublic();
      expect(typeof result).assertEqual('boolean');
      expect(result).assertEqual(true);
      const cls2: ReflectClass = createReflectClass('MyClass005');
      cls2.addStaticField('secret', createReflectClass('string'), 'hidden', false, true, false, false);
      let field2: StaticField | null = cls2.getStaticField('secret');
      const result2: boolean = field2!.isPublic();
      expect(typeof result2).assertEqual('boolean');
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_0900
     * @tc.name testStaticFieldIsPublic009
     * @tc.desc Verify field with explicit public modifier returns true for isPublic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass009');
      cls.addStaticField('defaultField', createReflectClass('string'), 'default', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('defaultField');
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_1000
     * @tc.name testStaticFieldIsPublic010
     * @tc.desc Verify typeof isPublic return value is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass004');
      cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('name');
      const result: boolean = field!.isPublic();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_1100
     * @tc.name testStaticFieldIsPublic011
     * @tc.desc Verify isPublic return value can be used as boolean condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass004');
      cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('name');
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_1200
     * @tc.name testStaticFieldIsPublic012
     * @tc.desc Verify isPublic returns true for public fields of various types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass012');
      cls.addStaticField('num', createReflectClass('int'), 100, true, false, false, false);
      cls.addStaticField('str', createReflectClass('string'), 'test', true, false, false, false);
      cls.addStaticField('bool', createReflectClass('boolean'), true, true, false, false, false);
      cls.addStaticField('arr', createReflectClass('int[]'), [] as FieldValue[], true, false, false, false);
      cls.addStaticField('obj', createReflectClass('Object'), {} as Record<string, FieldValue>, true, false, false, false);
      cls.addStaticField('charField', createReflectClass('char'), c'A' as FieldValue, true, false, false, false);
      expect(cls.getStaticField('num')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('str')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('bool')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('arr')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('obj')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('charField')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_1300
     * @tc.name testStaticFieldIsPublic013
     * @tc.desc Verify calling isPublic on null object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | null = null;
      try {
        field!.isPublic();
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_1400
     * @tc.name testStaticFieldIsPublic014
     * @tc.desc Verify calling isPublic on undefined object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | undefined = undefined;
      try {
        field!.isPublic();
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_1500
     * @tc.name testStaticFieldIsPublic015
     * @tc.desc Verify isPublic on non-existent static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass015');
      cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('nonexistent');
      if (field !== null) {
        const result: boolean = field.isPublic();
      }
      expect(field).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_1600
     * @tc.name testStaticFieldIsPublic016
     * @tc.desc Verify isPublic with public readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass016');
      cls.addStaticField('value', createReflectClass('int'), 100, true, false, false, true);
      let field: StaticField | null = cls.getStaticField('value');
      expect(field!.isPublic()).assertEqual(true);
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_1700
     * @tc.name testStaticFieldIsPublic017
     * @tc.desc Verify isPublic with public static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass017');
      cls.addStaticField('count', createReflectClass('int'), 0, true, false, false, false);
      let field: StaticField | null = cls.getStaticField('count');
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_1800
     * @tc.name testStaticFieldIsPublic018
     * @tc.desc Verify isPublic with public const field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass018');
      cls.addStaticField('constant', createReflectClass('double'), 3.14, true, false, false, true);
      let field: StaticField | null = cls.getStaticField('constant');
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_1900
     * @tc.name testStaticFieldIsPublic019
     * @tc.desc Verify isPublic and isPrivate are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass019');
      cls.addStaticField('pub', createReflectClass('string'), 'public', true, false, false, false);
      cls.addStaticField('priv', createReflectClass('string'), 'private', false, true, false, false);
      let field1: StaticField | null = cls.getStaticField('pub');
      expect(field1!.isPublic()).assertEqual(true);
      expect(field1!.isPrivate()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('priv');
      expect(field2!.isPublic()).assertEqual(false);
      expect(field2!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_2000
     * @tc.name testStaticFieldIsPublic020
     * @tc.desc Verify isPublic and isProtected are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass020');
      cls.addStaticField('pub', createReflectClass('string'), 'public', true, false, false, false);
      cls.addStaticField('prot', createReflectClass('string'), 'protected', false, false, true, false);
      let field1: StaticField | null = cls.getStaticField('pub');
      expect(field1!.isPublic()).assertEqual(true);
      expect(field1!.isProtected()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('prot');
      expect(field2!.isPublic()).assertEqual(false);
      expect(field2!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_2100
     * @tc.name testStaticFieldIsPublic021
     * @tc.desc Verify isPublic combined with isReadonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass021');
      cls.addStaticField('pubReadonly', createReflectClass('string'), 'value', true, false, false, true);
      cls.addStaticField('privReadonly', createReflectClass('string'), 'value', false, true, false, true);
      let field1: StaticField | null = cls.getStaticField('pubReadonly');
      expect(field1!.isPublic() && field1!.isReadonly()).assertEqual(true);
      let field2: StaticField | null = cls.getStaticField('privReadonly');
      expect(field2!.isPublic() || field2!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_2200
     * @tc.name testStaticFieldIsPublic022
     * @tc.desc Verify getting type information of public field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass022');
      cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('name');
      expect(field!.isPublic()).assertEqual(true);
      let fieldType: ReflectClass = field!.getType();
      expect(fieldType.getName()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_2300
     * @tc.name testStaticFieldIsPublic023
     * @tc.desc Verify isPublic with field that has mixed access modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass023');
      cls.addStaticField('pubField', createReflectClass('string'), 'public', true, false, false, false);
      cls.addStaticField('privField', createReflectClass('string'), 'private', false, true, false, false);
      let pubField: StaticField | null = cls.getStaticField('pubField');
      expect(pubField!.isPublic()).assertEqual(true);
      let privField: StaticField | null = cls.getStaticField('privField');
      expect(privField!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_2400
     * @tc.name testStaticFieldIsPublic024
     * @tc.desc Verify isPublic with constant field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass024');
      cls.addStaticField('constant', createReflectClass('double'), 3.14, true, false, false, true);
      cls.addStaticField('secret', createReflectClass('string'), 'hidden', false, true, false, false);
      let constField: StaticField | null = cls.getStaticField('constant');
      expect(constField!.isPublic()).assertEqual(true);
      let secretField: StaticField | null = cls.getStaticField('secret');
      expect(secretField!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_2500
     * @tc.name testStaticFieldIsPublic025
     * @tc.desc Verify isPublic with variable field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass025');
      cls.addStaticField('variable', createReflectClass('int'), 100, true, false, false, false);
      cls.addStaticField('secret', createReflectClass('string'), 'hidden', false, true, false, false);
      let varField: StaticField | null = cls.getStaticField('variable');
      expect(varField!.isPublic()).assertEqual(true);
      let secretField: StaticField | null = cls.getStaticField('secret');
      expect(secretField!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_2600
     * @tc.name testStaticFieldIsPublic026
     * @tc.desc Verify isPublic with field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass026');
      cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('name');
      expect(field!.isPublic()).assertEqual(true);
      let value: string | number | boolean | null = field!.getValue() as string | number | boolean | null;
      expect(value).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_2700
     * @tc.name testStaticFieldIsPublic027
     * @tc.desc Verify isPublic with field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass027');
      cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('name');
      expect(field!.isPublic()).assertEqual(true);
      let fieldName: string = field!.getName();
      expect(fieldName).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_2800
     * @tc.name testStaticFieldIsPublic028
     * @tc.desc Verify isPublic with config class fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('Config028');
      cls.addStaticField('APP_NAME', createReflectClass('string'), 'MyApp', true, false, false, false);
      cls.addStaticField('VERSION', createReflectClass('string'), '1.0.0', true, false, false, false);
      cls.addStaticField('API_KEY', createReflectClass('string'), 'secret', false, true, false, false);
      cls.addStaticField('DEBUG_MODE', createReflectClass('boolean'), false, false, false, true, false);
      cls.addStaticField('LOG_LEVEL', createReflectClass('string'), 'info', true, false, false, false);
      let appNameField: StaticField | null = cls.getStaticField('APP_NAME');
      expect(appNameField!.isPublic()).assertEqual(true);
      let apiKeyField: StaticField | null = cls.getStaticField('API_KEY');
      expect(apiKeyField!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_2900
     * @tc.name testStaticFieldIsPublic029
     * @tc.desc Verify isPublic with multiple access modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass029');
      cls.addStaticField('publicField', createReflectClass('string'), 'public', true, false, false, false);
      cls.addStaticField('privateField', createReflectClass('string'), 'private', false, true, false, false);
      cls.addStaticField('protectedField', createReflectClass('string'), 'protected', false, false, true, false);
      let pubField: StaticField | null = cls.getStaticField('publicField');
      expect(pubField!.isPublic()).assertEqual(true);
      let privField: StaticField | null = cls.getStaticField('privateField');
      expect(privField!.isPublic()).assertEqual(false);
      let protField: StaticField | null = cls.getStaticField('protectedField');
      expect(protField!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_3000
     * @tc.name testStaticFieldIsPublic030
     * @tc.desc Verify isPublic with inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('Child030');
      cls.addStaticField('childPublic', createReflectClass('string'), 'child public', true, false, false, false);
      cls.addStaticField('childPrivate', createReflectClass('string'), 'child private', false, true, false, false);
      let childPubField: StaticField | null = cls.getStaticField('childPublic');
      expect(childPubField!.isPublic()).assertEqual(true);
      let childPrivField: StaticField | null = cls.getStaticField('childPrivate');
      expect(childPrivField!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_3100
     * @tc.name testStaticFieldIsPublic031
     * @tc.desc Verify isPublic with interface implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('Impl031');
      cls.addStaticField('constant', createReflectClass('string'), 'implemented', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('constant');
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_3200
     * @tc.name testStaticFieldIsPublic032
     * @tc.desc Verify isPublic with generic class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('GenericClass032');
      cls.addStaticField('defaultValue', createReflectClass('string'), '', true, false, false, false);
      cls.addStaticField('count', createReflectClass('int'), 0, true, false, false, false);
      let field: StaticField | null = cls.getStaticField('defaultValue');
      expect(field!.isPublic()).assertEqual(true);
      let countField: StaticField | null = cls.getStaticField('count');
      expect(countField!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_3300
     * @tc.name testStaticFieldIsPublic033
     * @tc.desc Verify isPublic with function type fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass033');
      cls.addStaticField('handler', createReflectClass('function'), '', true, false, false, false);
      cls.addStaticField('callback', createReflectClass('function'), '', false, true, false, false);
      let handlerField: StaticField | null = cls.getStaticField('handler');
      expect(handlerField!.isPublic()).assertEqual(true);
      let callbackField: StaticField | null = cls.getStaticField('callback');
      expect(callbackField!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_3400
     * @tc.name testStaticFieldIsPublic034
     * @tc.desc Verify isPublic with class type fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass034');
      cls.addStaticField('inner', createReflectClass('string'), 'InnerClass034', true, false, false, false);
      cls.addStaticField('outer', createReflectClass('string'), 'Object', false, true, false, false);
      let innerField: StaticField | null = cls.getStaticField('inner');
      expect(innerField!.isPublic()).assertEqual(true);
      let outerField: StaticField | null = cls.getStaticField('outer');
      expect(outerField!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_3500
     * @tc.name testStaticFieldIsPublic035
     * @tc.desc Verify isPublic with numeric fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass035');
      cls.addStaticField('pub', createReflectClass('int'), 1, true, false, false, false);
      cls.addStaticField('priv', createReflectClass('int'), 2, false, true, false, false);
      cls.addStaticField('prot', createReflectClass('int'), 3, false, false, true, false);
      let pubField: StaticField | null = cls.getStaticField('pub');
      expect(pubField!.isPublic()).assertEqual(true);
      let privField: StaticField | null = cls.getStaticField('priv');
      expect(privField!.isPublic()).assertEqual(false);
      let protField: StaticField | null = cls.getStaticField('prot');
      expect(protField!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_3600
     * @tc.name testStaticFieldIsPublic036
     * @tc.desc Verify isPublic with single field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass036');
      cls.addStaticField('value', createReflectClass('int'), 100, true, false, false, false);
      let field: StaticField | null = cls.getStaticField('value');
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_3700
     * @tc.name testStaticFieldIsPublic037
     * @tc.desc Verify isPublic with mixed fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass037');
      cls.addStaticField('field1', createReflectClass('int'), 1, true, false, false, false);
      cls.addStaticField('field2', createReflectClass('int'), 2, false, true, false, false);
      cls.addStaticField('field3', createReflectClass('int'), 3, true, false, false, false);
      cls.addStaticField('field4', createReflectClass('int'), 4, false, true, false, false);
      cls.addStaticField('field5', createReflectClass('int'), 5, true, false, false, false);
      expect(cls.getStaticField('field1')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('field2')!.isPublic()).assertEqual(false);
      expect(cls.getStaticField('field3')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('field4')!.isPublic()).assertEqual(false);
      expect(cls.getStaticField('field5')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_3800
     * @tc.name testStaticFieldIsPublic038
     * @tc.desc Verify isPublic with static vs instance fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass038');
      cls.addStaticField('staticPublic', createReflectClass('string'), 'static', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('staticPublic');
      expect(field!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_3900
     * @tc.name testStaticFieldIsPublic039
     * @tc.desc Verify isPublic with mixed access fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass039');
      cls.addStaticField('pub', createReflectClass('int'), 100, true, false, false, false);
      cls.addStaticField('priv', createReflectClass('int'), 200, false, true, false, false);
      cls.addStaticField('prot', createReflectClass('int'), 300, false, false, true, false);
      expect(cls.getStaticField('pub')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('priv')!.isPublic()).assertEqual(false);
      expect(cls.getStaticField('prot')!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_4000
     * @tc.name testStaticFieldIsPublic040
     * @tc.desc Verify isPublic with mixed access fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass040');
      cls.addStaticField('a', createReflectClass('int'), 1, true, false, false, false);
      cls.addStaticField('b', createReflectClass('int'), 2, false, true, false, false);
      cls.addStaticField('c', createReflectClass('int'), 3, true, false, false, false);
      cls.addStaticField('d', createReflectClass('int'), 4, false, false, true, false);
      expect(cls.getStaticField('a')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('b')!.isPublic()).assertEqual(false);
      expect(cls.getStaticField('c')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('d')!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_4100
     * @tc.name testStaticFieldIsPublic041
     * @tc.desc Verify isPublic with all access modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass041');
      cls.addStaticField('pub', createReflectClass('int'), 1, true, false, false, false);
      cls.addStaticField('priv', createReflectClass('int'), 2, false, true, false, false);
      cls.addStaticField('prot', createReflectClass('int'), 3, false, false, true, false);
      cls.addStaticField('inter', createReflectClass('int'), 4, true, false, false, false);
      expect(cls.getStaticField('pub')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('priv')!.isPublic()).assertEqual(false);
      expect(cls.getStaticField('prot')!.isPublic()).assertEqual(false);
      expect(cls.getStaticField('inter')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_4200
     * @tc.name testStaticFieldIsPublic042
     * @tc.desc Verify isPublic with class fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass042');
      cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      cls.addStaticField('version', createReflectClass('string'), '1.0.0', true, false, false, false);
      cls.addStaticField('secret', createReflectClass('string'), 'hidden', false, true, false, false);
      expect(cls.getStaticField('name')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('version')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('secret')!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_4300
     * @tc.name testStaticFieldIsPublic043
     * @tc.desc Verify isPublic with user data fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass043');
      cls.addStaticField('displayName', createReflectClass('string'), 'User', true, false, false, false);
      cls.addStaticField('email', createReflectClass('string'), 'user@example.com', true, false, false, false);
      cls.addStaticField('password', createReflectClass('string'), 'secret', false, true, false, false);
      cls.addStaticField('authToken', createReflectClass('string'), 'token', false, true, false, false);
      let displayField: StaticField | null = cls.getStaticField('displayName');
      expect(displayField!.isPublic()).assertEqual(true);
      let emailField: StaticField | null = cls.getStaticField('email');
      expect(emailField!.isPublic()).assertEqual(true);
      let passwordField: StaticField | null = cls.getStaticField('password');
      expect(passwordField!.isPublic()).assertEqual(false);
      let tokenField: StaticField | null = cls.getStaticField('authToken');
      expect(tokenField!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_4400
     * @tc.name testStaticFieldIsPublic044
     * @tc.desc Verify reflection API can access public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass044');
      cls.addStaticField('publicData', createReflectClass('string'), 'public', true, false, false, false);
      cls.addStaticField('privateData', createReflectClass('string'), 'private', false, true, false, false);
      let publicField: StaticField | null = cls.getStaticField('publicData');
      expect(publicField!.isPublic()).assertEqual(true);
      let value: string | number | boolean | null = publicField!.getValue() as string | number | boolean | null;
      publicField!.setValue('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_4500
     * @tc.name testStaticFieldIsPublic045
     * @tc.desc Verify configuration management with public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectAppConfig045();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      expect(fields.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_4600
     * @tc.name testStaticFieldIsPublic046
     * @tc.desc Verify generating public API documentation from public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectAPI046();
      let doc: string = generatePublicAPIDoc(cls);
      expect(doc.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_4700
     * @tc.name testStaticFieldIsPublic047
     * @tc.desc Verify public fields in service configuration class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass047();
      expect(cls.getStaticField('SERVICE_NAME')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('SERVICE_PORT')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('SERVICE_HOST')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('SERVICE_SECRET')!.isPublic()).assertEqual(false);
      expect(cls.getStaticField('SERVICE_CONFIG')!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_4800
     * @tc.name testStaticFieldIsPublic048
     * @tc.desc Verify public fields in feature flag class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass048();
      expect(cls.getStaticField('FEATURE_FLAG_A')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('FEATURE_FLAG_B')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('FEATURE_FLAG_C')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('FEATURE_INTERNAL')!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_4900
     * @tc.name testStaticFieldIsPublic049
     * @tc.desc Verify public fields in connection configuration class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass049();
      expect(cls.getStaticField('DEFAULT_TIMEOUT')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('MAX_RETRIES')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('CONNECTION_POOL_SIZE')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('INTERNAL_BUFFER_SIZE')!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_5000
     * @tc.name testStaticFieldIsPublic050
     * @tc.desc Verify public fields in cache configuration class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass050();
      expect(cls.getStaticField('CACHE_TTL')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('CACHE_MAX_SIZE')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('cacheEnabled')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('cacheStorage')!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_5100
     * @tc.name testStaticFieldIsPublic051
     * @tc.desc Verify public fields in log level class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass051();
      expect(cls.getStaticField('LOG_LEVEL_INFO')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('LOG_LEVEL_WARN')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('LOG_LEVEL_ERROR')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('LOG_LEVEL_DEBUG')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('LOG_FORMAT')!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_5200
     * @tc.name testStaticFieldIsPublic052
     * @tc.desc Verify public fields in database configuration class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass052();
      expect(cls.getStaticField('DB_HOST')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('DB_PORT')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('DB_NAME')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('DB_PASSWORD')!.isPublic()).assertEqual(false);
      expect(cls.getStaticField('DB_USER')!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_5300
     * @tc.name testStaticFieldIsPublic053
     * @tc.desc Verify public fields in metrics class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass053();
      expect(cls.getStaticField('METRIC_CPU')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('METRIC_MEMORY')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('METRIC_DISK')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('METRIC_NETWORK')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('METRIC_INTERNAL')!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_5400
     * @tc.name testStaticFieldIsPublic054
     * @tc.desc Verify public fields in region configuration class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass054();
      expect(cls.getStaticField('REGION_US_EAST')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('REGION_US_WEST')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('REGION_EU_WEST')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('REGION_AP_SOUTHEAST')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('DEFAULT_REGION')!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_5500
     * @tc.name testStaticFieldIsPublic055
     * @tc.desc Verify public fields in color constants class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass055();
      expect(cls.getStaticField('COLOR_RED')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('COLOR_GREEN')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('COLOR_BLUE')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('COLOR_BLACK')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('COLOR_WHITE')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('COLOR_TRANSPARENT')!.isPublic()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_5600
     * @tc.name testStaticFieldIsPublic056
     * @tc.desc Verify getPublicFieldNames helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass047();
      let names: string[] = getPublicFieldNames(cls);
      expect(names.length).assertEqual(3);
      expect(names.indexOf('SERVICE_NAME') >= 0).assertEqual(true);
      expect(names.indexOf('SERVICE_PORT') >= 0).assertEqual(true);
      expect(names.indexOf('SERVICE_HOST') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_5700
     * @tc.name testStaticFieldIsPublic057
     * @tc.desc Verify getNonPublicFieldNames helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass052();
      let names: string[] = getNonPublicFieldNames(cls);
      expect(names.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_5800
     * @tc.name testStaticFieldIsPublic058
     * @tc.desc Verify countPublicFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass051();
      let count: number = countPublicFields(cls);
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_5900
     * @tc.name testStaticFieldIsPublic059
     * @tc.desc Verify hasPublicFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls1: ReflectClass = reflectMyClass055();
      expect(hasPublicFields(cls1)).assertEqual(true);
      const cls2: ReflectClass = createReflectClass('EmptyClass');
      expect(hasPublicFields(cls2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_6000
     * @tc.name testStaticFieldIsPublic060
     * @tc.desc Verify getFieldVisibilityMap helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass047();
      let map: Map<string, string> = getFieldVisibilityMap(cls);
      expect(map.get('SERVICE_NAME')).assertEqual('public');
      expect(map.get('SERVICE_SECRET')).assertEqual('private');
      expect(map.get('SERVICE_CONFIG')).assertEqual('protected');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_6100
     * @tc.name testStaticFieldIsPublic061
     * @tc.desc Verify filterPublicFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass049();
      let allFields: StaticField[] = cls.getDeclaredStaticFields();
      let publicFields: StaticField[] = filterPublicFields(allFields);
      expect(publicFields.length).assertEqual(3);
      for (let i = 0; i < publicFields.length; i++) {
        expect(publicFields[i].isPublic()).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_6200
     * @tc.name testStaticFieldIsPublic062
     * @tc.desc Verify validatePublicFieldAccess helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass053();
      let publicField: StaticField | null = cls.getStaticField('METRIC_CPU');
      expect(validatePublicFieldAccess(publicField!)).assertEqual(true);
      let privateField: StaticField | null = cls.getStaticField('METRIC_INTERNAL');
      expect(validatePublicFieldAccess(privateField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_6300
     * @tc.name testStaticFieldIsPublic063
     * @tc.desc Verify buildPublicFieldIndex helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass054();
      let index: Record<string, string | number | boolean | null> = buildPublicFieldIndex(cls);
      expect(index['REGION_US_EAST']).assertEqual('us-east-1');
      expect(index['REGION_US_WEST']).assertEqual('us-west-1');
      expect(index['REGION_EU_WEST']).assertEqual('eu-west-1');
      expect(index['REGION_AP_SOUTHEAST']).assertEqual('ap-southeast-1');
      expect(index['DEFAULT_REGION']).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_6400
     * @tc.name testStaticFieldIsPublic064
     * @tc.desc Verify isPublic with all access modifiers in one class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass056();
      expect(cls.getStaticField('pub')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('priv')!.isPublic()).assertEqual(false);
      expect(cls.getStaticField('prot')!.isPublic()).assertEqual(false);
      expect(cls.getStaticField('inter')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_6500
     * @tc.name testStaticFieldIsPublic065
     * @tc.desc Verify isPublic with readonly and non-readonly public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass057();
      expect(cls.getStaticField('CONSTANT')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('variable')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_6600
     * @tc.name testStaticFieldIsPublic066
     * @tc.desc Verify isPublic with mixed field modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass058();
      expect(cls.getStaticField('name')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('id')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_6700
     * @tc.name testStaticFieldIsPublic067
     * @tc.desc Verify isPublic with boolean flag fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass059();
      expect(cls.getStaticField('flagA')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('flagB')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('flagC')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_6800
     * @tc.name testStaticFieldIsPublic068
     * @tc.desc Verify isPublic with server config fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass060();
      expect(cls.getStaticField('host')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('port')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('ssl')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_6900
     * @tc.name testStaticFieldIsPublic069
     * @tc.desc Verify isPublic with array and object fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass061();
      expect(cls.getStaticField('items')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('config')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_7000
     * @tc.name testStaticFieldIsPublic070
     * @tc.desc Verify isPublic with function type fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass062();
      expect(cls.getStaticField('handler')!.isPublic()).assertEqual(true);
      expect(cls.getStaticField('callback')!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_7100
     * @tc.name testStaticFieldIsPublic071
     * @tc.desc Verify getPublicFieldNames helper with all public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass060();
      let names: string[] = getPublicFieldNames(cls);
      expect(names.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_7200
     * @tc.name testStaticFieldIsPublic072
     * @tc.desc Verify countPublicFields helper with mixed access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass056();
      let count: number = countPublicFields(cls);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPUBLIC_7300
     * @tc.name testStaticFieldIsPublic073
     * @tc.desc Verify hasPublicFields helper with all public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPublic073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass060();
      expect(hasPublicFields(cls)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_INTEGRATION_ISPUBLIC_0100
     * @tc.name integrationIsPublic001
     * @tc.desc Verify isPublic returns true for public fields using real Class.from API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('integrationIsPublic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const field = Class.from<IntegrationIsPublicClass>().getStaticField('name');
      expect(field !== undefined).assertEqual(true);
      expect(field!.isPublic()).assertEqual(true);
    });
  });
}