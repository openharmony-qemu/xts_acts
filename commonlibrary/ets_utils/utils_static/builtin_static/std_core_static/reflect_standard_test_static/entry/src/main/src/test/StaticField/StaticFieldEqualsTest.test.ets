'use static'
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

class IntegrationEqualsClass {
  public static name: string = 'test';
  public static count: int = 100;
}

function reflectMyClass001(): ReflectClass {
  const cls = createReflectClass('MyClass001');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass004(): ReflectClass {
  const cls = createReflectClass('MyClass004');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass005(): ReflectClass {
  const cls = createReflectClass('MyClass005');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass006(): ReflectClass {
  const cls = createReflectClass('MyClass006');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass007(): ReflectClass {
  const cls = createReflectClass('MyClass007');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass008(): ReflectClass {
  const cls = createReflectClass('MyClass008');
  cls.addStaticField('staticData', createReflectClass('string'), 'static', true, false, false, false);
  cls.addInstanceField('instanceData', createReflectClass('string'), true, false, false, false);
  return cls;
}

function reflectMyClass009(): ReflectClass {
  const cls = createReflectClass('MyClass009');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass010(): ReflectClass {
  const cls = createReflectClass('MyClass010');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass011(): ReflectClass {
  const cls = createReflectClass('MyClass011');
  cls.addStaticField('field1', createReflectClass('string'), 'test1', true, false, false, false);
  cls.addStaticField('field2', createReflectClass('string'), 'test2', true, false, false, false);
  return cls;
}

function reflectClassA012(): ReflectClass {
  const cls = createReflectClass('ClassA012');
  cls.addStaticField('data', createReflectClass('string'), 'A', true, false, false, false);
  return cls;
}

function reflectClassB012(): ReflectClass {
  const cls = createReflectClass('ClassB012');
  cls.addStaticField('data', createReflectClass('string'), 'B', true, false, false, false);
  return cls;
}

function reflectMyClass013(): ReflectClass {
  const cls = createReflectClass('MyClass013');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass014(): ReflectClass {
  const cls = createReflectClass('MyClass014');
  cls.addStaticField('data', createReflectClass('string'), 'public', true, false, false, false);
  return cls;
}

function reflectOtherClass014(): ReflectClass {
  const cls = createReflectClass('OtherClass014');
  cls.addStaticField('data', createReflectClass('string'), 'private', false, true, false, false);
  return cls;
}

function reflectMyClass017(): ReflectClass {
  const cls = createReflectClass('MyClass017');
  cls.addStaticField('field1', createReflectClass('int'), 1, true, false, false, false);
  cls.addStaticField('field2', createReflectClass('int'), 2, true, false, false, false);
  cls.addStaticField('field3', createReflectClass('int'), 3, true, false, false, false);
  return cls;
}

function reflectMyClass018(): ReflectClass {
  const cls = createReflectClass('MyClass018');
  cls.addStaticField('strField', createReflectClass('string'), 'string', true, false, false, false);
  cls.addStaticField('numField', createReflectClass('int'), 100, true, false, false, false);
  return cls;
}

function reflectMyClass021(): ReflectClass {
  const cls = createReflectClass('MyClass021');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass022(): ReflectClass {
  const cls = createReflectClass('MyClass022');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass023(): ReflectClass {
  const cls = createReflectClass('MyClass023');
  cls.addStaticField('value1', createReflectClass('int'), 100, true, false, false, false);
  cls.addStaticField('value2', createReflectClass('int'), 200, true, false, false, false);
  return cls;
}

function reflectMyClass024(): ReflectClass {
  const cls = createReflectClass('MyClass024');
  cls.addStaticField('field1', createReflectClass('string'), 'test1', true, false, false, false);
  cls.addStaticField('field2', createReflectClass('string'), 'test2', true, false, false, false);
  return cls;
}

function reflectMyClass025(): ReflectClass {
  const cls = createReflectClass('MyClass025');
  cls.addStaticField('value1', createReflectClass('int'), 100, true, false, false, false);
  cls.addStaticField('value2', createReflectClass('int'), 100, true, false, false, false);
  return cls;
}

function reflectMyClass026(): ReflectClass {
  const cls = createReflectClass('MyClass026');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass027(): ReflectClass {
  const cls = createReflectClass('MyClass027');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass028(): ReflectClass {
  const cls = createReflectClass('MyClass028');
  cls.addStaticField('field1', createReflectClass('string'), 'test1', true, false, false, false);
  cls.addStaticField('field2', createReflectClass('string'), 'test2', true, false, false, false);
  return cls;
}

function reflectMyClass029(): ReflectClass {
  const cls = createReflectClass('MyClass029');
  cls.addStaticField('strField', createReflectClass('string'), 'string', true, false, false, false);
  cls.addStaticField('numField', createReflectClass('int'), 100, true, false, false, false);
  cls.addStaticField('anotherStr', createReflectClass('string'), 'another', true, false, false, false);
  return cls;
}

function reflectMyClass030(): ReflectClass {
  const cls = createReflectClass('MyClass030');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass031(): ReflectClass {
  const cls = createReflectClass('MyClass031');
  cls.addStaticField('field1', createReflectClass('int'), 1, true, false, false, false);
  cls.addStaticField('field2', createReflectClass('int'), 2, true, false, false, false);
  cls.addStaticField('field3', createReflectClass('int'), 3, true, false, false, false);
  return cls;
}

function reflectMyClass032(): ReflectClass {
  const cls = createReflectClass('MyClass032');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass033(): ReflectClass {
  const cls = createReflectClass('MyClass033');
  cls.addStaticField('staticValue', createReflectClass('string'), 'static', true, false, false, false);
  cls.addInstanceField('instanceValue', createReflectClass('string'), true, false, false, false);
  return cls;
}

function reflectMyClass034(): ReflectClass {
  const cls = createReflectClass('MyClass034');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass035(): ReflectClass {
  const cls = createReflectClass('MyClass035');
  cls.addStaticField('common', createReflectClass('string'), 'value', true, false, false, false);
  cls.addStaticField('only1', createReflectClass('string'), 'only1', true, false, false, false);
  return cls;
}

function reflectOtherClass035(): ReflectClass {
  const cls = createReflectClass('OtherClass035');
  cls.addStaticField('common', createReflectClass('string'), 'value', true, false, false, false);
  cls.addStaticField('only2', createReflectClass('string'), 'only2', true, false, false, false);
  return cls;
}

function reflectOldConfig037(): ReflectClass {
  const cls = createReflectClass('OldConfig037');
  cls.addStaticField('TIMEOUT', createReflectClass('int'), 30000, true, false, false, false);
  cls.addStaticField('RETRY_COUNT', createReflectClass('int'), 3, true, false, false, false);
  cls.addStaticField('DEBUG', createReflectClass('boolean'), false, true, false, false, false);
  return cls;
}

function reflectNewConfig037(): ReflectClass {
  const cls = createReflectClass('NewConfig037');
  cls.addStaticField('TIMEOUT', createReflectClass('int'), 50000, true, false, false, false);
  cls.addStaticField('RETRY_COUNT', createReflectClass('int'), 3, true, false, false, false);
  cls.addStaticField('DEBUG', createReflectClass('boolean'), true, true, false, false, false);
  cls.addStaticField('NEW_SETTING', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass038(): ReflectClass {
  const cls = createReflectClass('MyClass038');
  cls.addStaticField('expensiveField', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass041(): ReflectClass {
  const cls = createReflectClass('MyClass041');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass042(): ReflectClass {
  const cls = createReflectClass('MyClass042');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  cls.addStaticField('selfRef', createReflectClass('Object'), cls, true, false, false, false);
  return cls;
}

function reflectMyClass043(): ReflectClass {
  const cls = createReflectClass('MyClass043');
  cls.addStaticField('nullValue', createReflectClass('string'), undefined, true, false, false, false);
  cls.addStaticField('undefinedValue', createReflectClass('string'), undefined, true, false, false, false);
  cls.addStaticField('nanValue', createReflectClass('double'), NaN, true, false, false, false);
  cls.addStaticField('infinityValue', createReflectClass('double'), Infinity, true, false, false, false);
  return cls;
}

function reflectParentClass044(): ReflectClass {
  const cls = createReflectClass('ParentClass044');
  cls.addStaticField('data', createReflectClass('string'), 'parent', true, false, false, false);
  return cls;
}

function reflectChildClass044(): ReflectClass {
  const cls = createReflectClass('ChildClass044');
  cls.addStaticField('data', createReflectClass('string'), 'child', true, false, false, false);
  return cls;
}

function reflectMyClass045(): ReflectClass {
  const cls = createReflectClass('MyClass045');
  cls.addStaticField('sharedField', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass046(): ReflectClass {
  const cls = createReflectClass('MyClass046');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass047(): ReflectClass {
  const cls = createReflectClass('MyClass047');
  cls.addStaticField('VERSION', createReflectClass('string'), '1.0.0', true, false, false, false);
  cls.addStaticField('BUILD_NUMBER', createReflectClass('int'), 100, true, false, false, false);
  cls.addStaticField('RELEASE_DATE', createReflectClass('string'), '2026-01-01', true, false, false, false);
  return cls;
}

function reflectMyClass048(): ReflectClass {
  const cls = createReflectClass('MyClass048');
  cls.addStaticField('API_URL', createReflectClass('string'), 'https://api.example.com', true, false, false, false);
  cls.addStaticField('API_TIMEOUT', createReflectClass('int'), 5000, true, false, false, false);
  cls.addStaticField('API_RETRY', createReflectClass('int'), 3, true, false, false, false);
  return cls;
}

function reflectMyClass049(): ReflectClass {
  const cls = createReflectClass('MyClass049');
  cls.addStaticField('DB_HOST', createReflectClass('string'), 'localhost', true, false, false, false);
  cls.addStaticField('DB_PORT', createReflectClass('int'), 5432, true, false, false, false);
  cls.addStaticField('DB_NAME', createReflectClass('string'), 'mydb', true, false, false, false);
  cls.addStaticField('DB_USER', createReflectClass('string'), 'admin', true, false, false, false);
  return cls;
}

function reflectMyClass050(): ReflectClass {
  const cls = createReflectClass('MyClass050');
  cls.addStaticField('CACHE_TTL', createReflectClass('int'), 3600, true, false, false, false);
  cls.addStaticField('CACHE_SIZE', createReflectClass('int'), 1024, true, false, false, false);
  cls.addStaticField('CACHE_ENABLED', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectMyClass051(): ReflectClass {
  const cls = createReflectClass('MyClass051');
  cls.addStaticField('LOG_LEVEL', createReflectClass('string'), 'INFO', true, false, false, false);
  cls.addStaticField('LOG_FORMAT', createReflectClass('string'), 'JSON', true, false, false, false);
  cls.addStaticField('LOG_OUTPUT', createReflectClass('string'), 'FILE', true, false, false, false);
  cls.addStaticField('LOG_ROTATION', createReflectClass('string'), 'DAILY', true, false, false, false);
  return cls;
}

function reflectMyClass052(): ReflectClass {
  const cls = createReflectClass('MyClass052');
  cls.addStaticField('AUTH_TOKEN', createReflectClass('string'), 'token_abc123', false, false, true, false);
  cls.addStaticField('AUTH_EXPIRY', createReflectClass('int'), 86400, false, false, true, false);
  cls.addStaticField('AUTH_TYPE', createReflectClass('string'), 'Bearer', true, false, false, false);
  return cls;
}

function reflectMyClass053(): ReflectClass {
  const cls = createReflectClass('MyClass053');
  cls.addStaticField('MAX_CONNECTIONS', createReflectClass('int'), 100, true, false, false, false);
  cls.addStaticField('MAX_REQUESTS', createReflectClass('int'), 1000, true, false, false, false);
  cls.addStaticField('MAX_TIMEOUT', createReflectClass('int'), 30000, true, false, false, false);
  cls.addStaticField('MAX_RETRIES', createReflectClass('int'), 5, true, false, false, false);
  return cls;
}

function reflectMyClass054(): ReflectClass {
  const cls = createReflectClass('MyClass054');
  cls.addStaticField('FEATURE_A', createReflectClass('boolean'), true, true, false, false, false);
  cls.addStaticField('FEATURE_B', createReflectClass('boolean'), false, true, false, false, false);
  cls.addStaticField('FEATURE_C', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectMyClass055(): ReflectClass {
  const cls = createReflectClass('MyClass055');
  cls.addStaticField('THRESHOLD_MIN', createReflectClass('double'), 0.1, true, false, false, false);
  cls.addStaticField('THRESHOLD_MAX', createReflectClass('double'), 0.9, true, false, false, false);
  cls.addStaticField('THRESHOLD_DEFAULT', createReflectClass('double'), 0.5, true, false, false, false);
  return cls;
}

function reflectMyClass056(): ReflectClass {
  const cls = createReflectClass('MyClass056');
  cls.addStaticField('ENV_DEV', createReflectClass('string'), 'development', true, false, false, false);
  cls.addStaticField('ENV_STAGING', createReflectClass('string'), 'staging', true, false, false, false);
  cls.addStaticField('ENV_PROD', createReflectClass('string'), 'production', true, false, false, false);
  return cls;
}

function reflectMyClass057(): ReflectClass {
  const cls = createReflectClass('MyClass057');
  cls.addStaticField('REGION_US', createReflectClass('string'), 'us-east-1', true, false, false, false);
  cls.addStaticField('REGION_EU', createReflectClass('string'), 'eu-west-1', true, false, false, false);
  cls.addStaticField('REGION_APAC', createReflectClass('string'), 'ap-southeast-1', true, false, false, false);
  return cls;
}

function reflectMyClass058(): ReflectClass {
  const cls = createReflectClass('MyClass058');
  cls.addStaticField('METRIC_CPU', createReflectClass('string'), 'cpu_usage', true, false, false, false);
  cls.addStaticField('METRIC_MEM', createReflectClass('string'), 'mem_usage', true, false, false, false);
  cls.addStaticField('METRIC_DISK', createReflectClass('string'), 'disk_usage', true, false, false, false);
  cls.addStaticField('METRIC_NET', createReflectClass('string'), 'net_usage', true, false, false, false);
  return cls;
}

function reflectMyClass059(): ReflectClass {
  const cls = createReflectClass('MyClass059');
  cls.addStaticField('STATUS_OK', createReflectClass('int'), 200, true, false, false, false);
  cls.addStaticField('STATUS_NOT_FOUND', createReflectClass('int'), 404, true, false, false, false);
  cls.addStaticField('STATUS_ERROR', createReflectClass('int'), 500, true, false, false, false);
  return cls;
}

function reflectMyClass060(): ReflectClass {
  const cls = createReflectClass('MyClass060');
  cls.addStaticField('LIMIT_RATE', createReflectClass('int'), 100, true, false, false, false);
  cls.addStaticField('LIMIT_BURST', createReflectClass('int'), 200, true, false, false, false);
  cls.addStaticField('LIMIT_WINDOW', createReflectClass('int'), 60, true, false, false, false);
  return cls;
}

function reflectMyClass061(): ReflectClass {
  const cls = createReflectClass('MyClass061');
  cls.addStaticField('PRIORITY_HIGH', createReflectClass('int'), 1, true, false, false, false);
  cls.addStaticField('PRIORITY_MEDIUM', createReflectClass('int'), 2, true, false, false, false);
  cls.addStaticField('PRIORITY_LOW', createReflectClass('int'), 3, true, false, false, false);
  return cls;
}

function reflectMyClass062(): ReflectClass {
  const cls = createReflectClass('MyClass062');
  cls.addStaticField('FORMAT_JSON', createReflectClass('string'), 'application/json', true, false, false, false);
  cls.addStaticField('FORMAT_XML', createReflectClass('string'), 'application/xml', true, false, false, false);
  cls.addStaticField('FORMAT_TEXT', createReflectClass('string'), 'text/plain', true, false, false, false);
  return cls;
}

function reflectMyClass063(): ReflectClass {
  const cls = createReflectClass('MyClass063');
  cls.addStaticField('MODE_READ', createReflectClass('string'), 'r', true, false, false, false);
  cls.addStaticField('MODE_WRITE', createReflectClass('string'), 'w', true, false, false, false);
  cls.addStaticField('MODE_APPEND', createReflectClass('string'), 'a', true, false, false, false);
  return cls;
}

function reflectMyClass064(): ReflectClass {
  const cls = createReflectClass('MyClass064');
  cls.addStaticField('SCOPE_GLOBAL', createReflectClass('string'), 'global', true, false, false, false);
  cls.addStaticField('SCOPE_LOCAL', createReflectClass('string'), 'local', true, false, false, false);
  cls.addStaticField('SCOPE_SESSION', createReflectClass('string'), 'session', true, false, false, false);
  return cls;
}

function reflectMyClass065(): ReflectClass {
  const cls = createReflectClass('MyClass065');
  cls.addStaticField('TYPE_STRING', createReflectClass('string'), 'string', true, false, false, false);
  cls.addStaticField('TYPE_INT', createReflectClass('string'), 'int', true, false, false, false);
  cls.addStaticField('TYPE_BOOL', createReflectClass('string'), 'boolean', true, false, false, false);
  cls.addStaticField('TYPE_ARRAY', createReflectClass('string'), 'array', true, false, false, false);
  return cls;
}

class MyClass001 {
  public static name: string = 'test';
}

class MyClass004 {
  public static data: string = 'value';
}

class MyClass005 {
  public static data: string = 'value';
}

class MyClass006 {
  public static data: string = 'value';
}

class MyClass007 {
  public static data: string = 'value';
}

class MyClass008 {
  public static staticData: string = 'static';
  public instanceData: string = 'instance';
}

class MyClass009 {
  public static name: string = 'test';
}

class MyClass010 {
  public static data: string = 'value';
}

class MyClass011 {
  public static field1: string = 'test1';
  public static field2: string = 'test2';
}

class ClassA012 {
  public static data: string = 'A';
}

class ClassB012 {
  public static data: string = 'B';
}

class MyClass013 {
  public static name: string = 'test';
}

class MyClass014 {
  public static data: string = 'public';
}

class OtherClass014 {
  private static data: string = 'private';
}

class MyClass017 {
  public static field1: int = 1;
  public static field2: int = 2;
  public static field3: int = 3;
}

class MyClass018 {
  public static strField: string = 'string';
  public static numField: int = 100;
}

class MyClass021 {
  public static data: string = 'value';
}

class MyClass022 {
  public static data: string = 'value';
}

class MyClass023 {
  public static value1: int = 100;
  public static value2: int = 200;
}

class MyClass024 {
  public static field1: string = 'test1';
  public static field2: string = 'test2';
}

class MyClass025 {
  public static value1: int = 100;
  public static value2: int = 100;
}

class MyClass026 {
  public static data: string = 'value';
}

class MyClass027 {
  public static data: string = 'value';
}

class MyClass028 {
  public static field1: string = 'test1';
  public static field2: string = 'test2';
}

class MyClass029 {
  public static strField: string = 'string';
  public static numField: int = 100;
  public static anotherStr: string = 'another';
}

class MyClass030 {
  public static data: string = 'value';
}

class MyClass031 {
  public static field1: int = 1;
  public static field2: int = 2;
  public static field3: int = 3;
}

class MyClass032 {
  public static data: string = 'value';
}

class MyClass033 {
  public static staticValue: string = 'static';
  public instanceValue: string = 'instance';
}

class MyClass034 {
  public static data: string = 'value';
}

class MyClass035 {
  public static common: string = 'value';
  public static only1: string = 'only1';
}

class OtherClass035 {
  public static common: string = 'value';
  public static only2: string = 'only2';
}

class OldConfig037 {
  public static TIMEOUT: int = 30000;
  public static RETRY_COUNT: int = 3;
  public static DEBUG: boolean = false;
}

class NewConfig037 {
  public static TIMEOUT: int = 50000;
  public static RETRY_COUNT: int = 3;
  public static DEBUG: boolean = true;
  public static NEW_SETTING: string = 'value';
}

class FieldCache038 {
  private static cache: Map<string, FieldValue> = new Map<string, FieldValue>();

  private static getFieldKey(field: StaticField): string {
    const key: string = `${field.getOwner().getName()}.${field.getName()}`;
    return key;
  }

  public static get(field: StaticField): FieldValue | null {
    const key = FieldCache038.getFieldKey(field);
    if (FieldCache038.cache.has(key)) {
      return FieldCache038.cache.get(key) as FieldValue;
    }
    return null;
  }

  public static set(field: StaticField, value: FieldValue): void {
    const key = FieldCache038.getFieldKey(field);
    FieldCache038.cache.set(key, value);
  }

  public static has(field: StaticField): boolean {
    const key = FieldCache038.getFieldKey(field);
    return FieldCache038.cache.has(key);
  }
}

class MyClass038 {
  public static expensiveField: string = 'value';
}

class FieldSet039 {
  private fields: StaticField[] = [];

  public add(field: StaticField): void {
    if (!this.contains(field)) {
      this.fields.push(field);
    }
  }

  public contains(field: StaticField): boolean {
    for (let i = 0; i < this.fields.length; i++) {
      if (this.fields[i].equals(field)) {
        return true;
      }
    }
    return false;
  }

  public union(other: FieldSet039): FieldSet039 {
    const result = new FieldSet039();

    for (let i = 0; i < this.fields.length; i++) {
      result.add(this.fields[i]);
    }

    let otherFields = other.toArray();
    for (let i = 0; i < otherFields.length; i++) {
      result.add(otherFields[i]);
    }

    return result;
  }

  public intersection(other: FieldSet039): FieldSet039 {
    const result = new FieldSet039();

    for (let i = 0; i < this.fields.length; i++) {
      if (other.contains(this.fields[i])) {
        result.add(this.fields[i]);
      }
    }

    return result;
  }

  public toArray(): StaticField[] {
    return this.fields;
  }
}

interface FieldEntry {
  field: StaticField;
  value: FieldValue;
}

class FieldMap040 {
  private entries: FieldEntry[] = [];

  public put(field: StaticField, value: FieldValue): void {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].field.equals(field)) {
        this.entries[i].value = value;
        return;
      }
    }

    this.entries.push({ field: field, value: value });
  }

  public get(field: StaticField): FieldValue | null {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].field.equals(field)) {
        return this.entries[i].value;
      }
    }
    return null;
  }

  public hasKey(field: StaticField): boolean {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].field.equals(field)) {
        return true;
      }
    }
    return false;
  }
}

class MyClass041 {
  public static data: string = 'value';
}

class MyClass042 {
  public static data: string = 'value';
  public static selfRef: Object = new Object();
}

class MyClass043 {
  public static nullValue: FieldValue | undefined = undefined;
  public static undefinedValue: FieldValue | undefined = undefined;
  public static nanValue: double = NaN;
  public static infinityValue: double = Infinity;
}

class ParentClass044 {
  public static data: string = 'parent';
}

class ChildClass044 extends ParentClass044 {
  public static data: string = 'child';
}

class MyClass045 {
  public static sharedField: string = 'value';
}

class MyClass046 {
  public static data: string = 'value';
}

class MyClass047 {
  public static VERSION: string = '1.0.0';
  public static BUILD_NUMBER: int = 100;
  public static RELEASE_DATE: string = '2026-01-01';
}

class MyClass048 {
  public static API_URL: string = 'https://api.example.com';
  public static API_TIMEOUT: int = 5000;
  public static API_RETRY: int = 3;
}

class MyClass049 {
  public static DB_HOST: string = 'localhost';
  public static DB_PORT: int = 5432;
  public static DB_NAME: string = 'mydb';
  public static DB_USER: string = 'admin';
}

class MyClass050 {
  public static CACHE_TTL: int = 3600;
  public static CACHE_SIZE: int = 1024;
  public static CACHE_ENABLED: boolean = true;
}

class MyClass051 {
  public static LOG_LEVEL: string = 'INFO';
  public static LOG_FORMAT: string = 'JSON';
  public static LOG_OUTPUT: string = 'FILE';
  public static LOG_ROTATION: string = 'DAILY';
}

class MyClass052 {
  protected static AUTH_TOKEN: string = 'token_abc123';
  protected static AUTH_EXPIRY: int = 86400;
  public static AUTH_TYPE: string = 'Bearer';
}

class MyClass053 {
  public static MAX_CONNECTIONS: int = 100;
  public static MAX_REQUESTS: int = 1000;
  public static MAX_TIMEOUT: int = 30000;
  public static MAX_RETRIES: int = 5;
}

class MyClass054 {
  public static FEATURE_A: boolean = true;
  public static FEATURE_B: boolean = false;
  public static FEATURE_C: boolean = true;
}

class MyClass055 {
  public static THRESHOLD_MIN: double = 0.1;
  public static THRESHOLD_MAX: double = 0.9;
  public static THRESHOLD_DEFAULT: double = 0.5;
}

class MyClass056 {
  public static ENV_DEV: string = 'development';
  public static ENV_STAGING: string = 'staging';
  public static ENV_PROD: string = 'production';
}

class MyClass057 {
  public static REGION_US: string = 'us-east-1';
  public static REGION_EU: string = 'eu-west-1';
  public static REGION_APAC: string = 'ap-southeast-1';
}

class MyClass058 {
  public static METRIC_CPU: string = 'cpu_usage';
  public static METRIC_MEM: string = 'mem_usage';
  public static METRIC_DISK: string = 'disk_usage';
  public static METRIC_NET: string = 'net_usage';
}

class MyClass059 {
  public static STATUS_OK: int = 200;
  public static STATUS_NOT_FOUND: int = 404;
  public static STATUS_ERROR: int = 500;
}

class MyClass060 {
  public static LIMIT_RATE: int = 100;
  public static LIMIT_BURST: int = 200;
  public static LIMIT_WINDOW: int = 60;
}

class MyClass061 {
  public static PRIORITY_HIGH: int = 1;
  public static PRIORITY_MEDIUM: int = 2;
  public static PRIORITY_LOW: int = 3;
}

class MyClass062 {
  public static FORMAT_JSON: string = 'application/json';
  public static FORMAT_XML: string = 'application/xml';
  public static FORMAT_TEXT: string = 'text/plain';
}

class MyClass063 {
  public static MODE_READ: string = 'r';
  public static MODE_WRITE: string = 'w';
  public static MODE_APPEND: string = 'a';
}

class MyClass064 {
  public static SCOPE_GLOBAL: string = 'global';
  public static SCOPE_LOCAL: string = 'local';
  public static SCOPE_SESSION: string = 'session';
}

class MyClass065 {
  public static TYPE_STRING: string = 'string';
  public static TYPE_INT: string = 'int';
  public static TYPE_BOOL: string = 'boolean';
  public static TYPE_ARRAY: string = 'array';
}

function uniqueFields(fields: StaticField[]): StaticField[] {
  const unique: StaticField[] = [];
  for (let i = 0; i < fields.length; i++) {
    let isDuplicate: boolean = false;
    for (let j = 0; j < unique.length; j++) {
      if (fields[i].equals(unique[j])) {
        isDuplicate = true;
        break;
      }
    }
    if (!isDuplicate) {
      unique.push(fields[i]);
    }
  }
  return unique;
}

function findField(fields: StaticField[], target: StaticField): StaticField | null {
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].equals(target)) {
      return fields[i];
    }
  }
  return null;
}

function fieldsEquals(fields1: StaticField[], fields2: StaticField[]): boolean {
  if (fields1.length !== fields2.length) {
    return false;
  }
  for (let i = 0; i < fields1.length; i++) {
    let found: boolean = false;
    for (let j = 0; j < fields2.length; j++) {
      if (fields1[i].equals(fields2[j])) {
        found = true;
        break;
      }
    }
    if (!found) {
      return false;
    }
  }
  return true;
}

function groupFieldsByType(fields: StaticField[]): Map<string, StaticField[]> {
  const groups: Map<string, StaticField[]> = new Map<string, StaticField[]>();
  const groupTypes: ReflectClass[] = [];
  for (let i = 0; i < fields.length; i++) {
    const currentType = fields[i].getType();
    let found = false;
    for (let j = 0; j < groupTypes.length; j++) {
      if (currentType.equals(groupTypes[j])) {
        groups.get(groupTypes[j].getName())!.push(fields[i]);
        found = true;
        break;
      }
    }
    if (!found) {
      groupTypes.push(currentType);
      groups.set(currentType.getName(), [fields[i]]);
    }
  }
  return groups;
}

function containsField(fields: StaticField[], target: StaticField): boolean {
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].equals(target)) {
      return true;
    }
  }
  return false;
}

function intersectFields(fields1: StaticField[], fields2: StaticField[]): StaticField[] {
  const intersection: StaticField[] = [];
  for (let i = 0; i < fields1.length; i++) {
    for (let j = 0; j < fields2.length; j++) {
      if (fields1[i].getName() === fields2[j].getName()) {
        intersection.push(fields1[i]);
        break;
      }
    }
  }
  return intersection;
}

function differenceFields(fields1: StaticField[], fields2: StaticField[]): StaticField[] {
  const difference: StaticField[] = [];
  for (let i = 0; i < fields1.length; i++) {
    let found: boolean = false;
    for (let j = 0; j < fields2.length; j++) {
      if (fields1[i].equals(fields2[j])) {
        found = true;
        break;
      }
    }
    if (!found) {
      difference.push(fields1[i]);
    }
  }
  return difference;
}

function compareConfigFields(oldClass: ReflectClass, newClass: ReflectClass): void {
  const oldFields: StaticField[] = oldClass.getDeclaredStaticFields();
  const newFields: StaticField[] = newClass.getDeclaredStaticFields();
  for (let i = 0; i < oldFields.length; i++) {
    const oldField: StaticField = oldFields[i];
    let found: boolean = false;
    for (let j = 0; j < newFields.length; j++) {
      const newField: StaticField = newFields[j];
      if (oldField.getName() === newField.getName()) {
        found = true;
        break;
      }
    }
  }
  for (let j = 0; j < newFields.length; j++) {
    const newFieldName: string = newFields[j].getName();
    let found: boolean = false;
    for (let i = 0; i < oldFields.length; i++) {
      if (oldFields[i].getName() === newFieldName) {
        found = true;
        break;
      }
    }
  }
}

function getExpensiveFieldValue(field: StaticField): FieldValue | undefined {
  if (FieldCache038.has(field)) {
    return FieldCache038.get(field)!;
  }
  const value: FieldValue | undefined = field.getValue();
  FieldCache038.set(field, value!);
  return value!;
}

function fieldsAreDeepEqual(field1: StaticField, field2: StaticField): boolean {
  if (field1.getName() !== field2.getName()) {
    return false;
  }
  if (!field1.getType().equals(field2.getType())) {
    return false;
  }
  if (!field1.getOwner().equals(field2.getOwner())) {
    return false;
  }
  if (field1.getValue() !== field2.getValue()) {
    return false;
  }
  return true;
}

function compareFieldsWithLog(field1: StaticField, field2: StaticField): boolean {
  return field1.equals(field2);
}

function findFieldByName(fields: StaticField[], name: string): StaticField | null {
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].getName() === name) {
      return fields[i];
    }
  }
  return null;
}

function countEqualFields(fields1: StaticField[], fields2: StaticField[]): number {
  let count: number = 0;
  for (let i = 0; i < fields1.length; i++) {
    for (let j = 0; j < fields2.length; j++) {
      if (fields1[i].equals(fields2[j])) {
        count++;
      }
    }
  }
  return count;
}

function areAllFieldsEqual(fields: StaticField[]): boolean {
  if (fields.length <= 1) {
    return true;
  }
  for (let i = 1; i < fields.length; i++) {
    if (!fields[0].equals(fields[i])) {
      return false;
    }
  }
  return true;
}

function getFieldEqualityMatrix(fields: StaticField[]): boolean[][] {
  const matrix: boolean[][] = [];
  for (let i = 0; i < fields.length; i++) {
    matrix[i] = [];
    for (let j = 0; j < fields.length; j++) {
      matrix[i][j] = fields[i].equals(fields[j]);
    }
  }
  return matrix;
}

function validateEqualityProperties(field: StaticField): boolean {
  if (!field.equals(field)) {
    return false;
  }
  return true;
}

function compareFieldCollections(cls1: ReflectClass, cls2: ReflectClass): Record<string, string> {
  const result: Record<string, string> = {};
  const fields1: StaticField[] = cls1.getDeclaredStaticFields();
  const fields2: StaticField[] = cls2.getDeclaredStaticFields();

  for (let i = 0; i < fields1.length; i++) {
    const name: string = fields1[i].getName();
    const field2: StaticField | null = findFieldByName(fields2, name);
    if (field2 !== null) {
      if (fields1[i].equals(field2)) {
        result[name] = 'identical';
      } else {
        result[name] = 'different';
      }
    } else {
      result[name] = 'only_in_first';
    }
  }

  for (let j = 0; j < fields2.length; j++) {
    const name: string = fields2[j].getName();
    if (result[name] === undefined) {
      result[name] = 'only_in_second';
    }
  }

  return result;
}

function findDuplicateFields(fields: StaticField[]): StaticField[][] {
  const duplicates: StaticField[][] = [];
  const visited: boolean[] = [];

  for (let i = 0; i < fields.length; i++) {
    visited[i] = false;
  }

  for (let i = 0; i < fields.length; i++) {
    if (visited[i]) {
      continue;
    }
    const group: StaticField[] = [fields[i]];
    visited[i] = true;
    for (let j = i + 1; j < fields.length; j++) {
      if (!visited[j] && fields[i].equals(fields[j])) {
        group.push(fields[j]);
        visited[j] = true;
      }
    }
    if (group.length > 1) {
      duplicates.push(group);
    }
  }

  return duplicates;
}

function symmetricEquals(field1: StaticField, field2: StaticField): boolean {
  const result1: boolean = field1.equals(field2);
  const result2: boolean = field2.equals(field1);
  return result1 === result2;
}

export function StaticFieldEqualsTest(): void {
  describe('StaticFieldEqualsTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_0100
     * @tc.name testStaticFieldEquals001
     * @tc.desc Verify equals requires one StaticField parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass001();
      let field = cls.getStaticField("name");
      const result = field!.equals(field!);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_0400
     * @tc.name testStaticFieldEquals004
     * @tc.desc Verify equals with StaticField type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass004();
      let field1 = cls.getStaticField("data");
      let field2 = cls.getStaticField("data");
      const result = field1!.equals(field2!);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_0500
     * @tc.name testStaticFieldEquals005
     * @tc.desc Verify equals returns false when passing null parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass005();
      let field = cls.getStaticField("data");
      const result = field!.equals(null);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_0600
     * @tc.name testStaticFieldEquals006
     * @tc.desc Verify equals returns false when passing undefined parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass006();
      let field = cls.getStaticField("data");
      const result = field!.equals(undefined);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_0800
     * @tc.name testStaticFieldEquals008
     * @tc.desc Verify equals with InstanceField type parameter returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass008();
      let staticField = cls.getStaticField("staticData");
      let instanceField = cls.getInstanceField("instanceData");
      const result = staticField!.equals(instanceField as StaticField);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_0900
     * @tc.name testStaticFieldEquals009
     * @tc.desc Verify two references of the same field return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass009();
      let field1 = cls.getStaticField("name");
      let field2 = cls.getStaticField("name");
      expect(field1!.equals(field2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_1000
     * @tc.name testStaticFieldEquals010
     * @tc.desc Verify field comparing with itself returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass010();
      let field = cls.getStaticField("data");
      expect(field!.equals(field!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_1100
     * @tc.name testStaticFieldEquals011
     * @tc.desc Verify different fields comparison returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass011();
      let field1 = cls.getStaticField("field1");
      let field2 = cls.getStaticField("field2");
      expect(field1!.equals(field2!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_1200
     * @tc.name testStaticFieldEquals012
     * @tc.desc Verify fields with same name from different classes return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const clsA = reflectClassA012();
      const clsB = reflectClassB012();
      let fieldA = clsA.getStaticField("data");
      let fieldB = clsB.getStaticField("data");
      expect(fieldA!.equals(fieldB!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_1300
     * @tc.name testStaticFieldEquals013
     * @tc.desc Verify difference between equals and strict reference comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass013();
      let field1 = cls.getStaticField("name");
      let field2 = cls.getStaticField("name");

      expect(field1!.equals(field2!)).assertEqual(true);

      expect(field1! === field2!).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_1400
     * @tc.name testStaticFieldEquals014
     * @tc.desc Verify fields with same name but different access modifiers return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls1 = reflectMyClass014();
      const cls2 = reflectOtherClass014();
      let field1 = cls1.getStaticField("data");
      let field2 = cls2.getStaticField("data");
      expect(field1!.equals(field2!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_1500
     * @tc.name testStaticFieldEquals015
     * @tc.desc Verify return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass014();
      let field = cls.getStaticField("data");
      let otherField = cls.getStaticField("data");
      const result = field!.equals(otherField!);
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_1600
     * @tc.name testStaticFieldEquals016
     * @tc.desc Verify return value is always boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass014();
      let field = cls.getStaticField("data");
      let otherField = cls.getStaticField("data");
      const result = field!.equals(otherField!);
      expect(result === null).assertEqual(false);
      expect(result === undefined).assertEqual(false);
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_1700
     * @tc.name testStaticFieldEquals017
     * @tc.desc Verify comparing a large number of fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass017();
      let fields: StaticField[] = cls.getDeclaredStaticFields();

      for (let i = 0; i < fields.length; i++) {
        for (let j = i; j < fields.length; j++) {
          let isEqual = fields[i].equals(fields[j]);
          if (i === j) {
            expect(isEqual).assertEqual(true);
          } else {
            expect(isEqual).assertEqual(false);
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_1800
     * @tc.name testStaticFieldEquals018
     * @tc.desc Verify comparing fields of different types returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass018();
      let strField = cls.getStaticField("strField");
      let numField = cls.getStaticField("numField");
      expect(strField!.equals(numField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_1900
     * @tc.name testStaticFieldEquals019
     * @tc.desc Verify calling equals on null object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | null = null;
      let otherField: StaticField | null = null;
      const result = field?.equals(otherField);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_2000
     * @tc.name testStaticFieldEquals020
     * @tc.desc Verify calling equals on undefined object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | undefined;
      let otherField: StaticField | undefined;
      const result = field?.equals(otherField);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_2100
     * @tc.name testStaticFieldEquals021
     * @tc.desc Verify passing null parameter returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass021();
      let field = cls.getStaticField("data");
      const result = field!.equals(null);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_2200
     * @tc.name testStaticFieldEquals022
     * @tc.desc Verify combining field name comparison and equals result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass022();
      let field1 = cls.getStaticField("data");
      let field2 = cls.getStaticField("data");

      if (field1!.getName() === field2!.getName()) {
        expect(field1!.equals(field2!)).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_2300
     * @tc.name testStaticFieldEquals023
     * @tc.desc Verify comparing fields of the same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass023();
      let field1 = cls.getStaticField("value1");
      let field2 = cls.getStaticField("value2");

      expect(field1!.getType().getName()).assertEqual(field2!.getType().getName());
      expect(field1!.equals(field2!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_2400
     * @tc.name testStaticFieldEquals024
     * @tc.desc Verify comparing fields from the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass024();
      let field1 = cls.getStaticField("field1");
      let field2 = cls.getStaticField("field2");

      expect(field1!.getOwner().equals(field2!.getOwner())).assertEqual(true);
      expect(field1!.equals(field2!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_2500
     * @tc.name testStaticFieldEquals025
     * @tc.desc Verify comparing fields with the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cls = reflectMyClass025();
      let field1 = cls.getStaticField("value1");
      let field2 = cls.getStaticField("value2");

      expect(field1!.getValue() as string | number | boolean | null)
        .assertEqual(field2!.getValue() as string | number | boolean | null);
      expect(field1!.equals(field2!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_2600
     * @tc.name testStaticFieldEquals026
     * @tc.desc Verify removing duplicate fields using equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass026();
      let field1 = cls.getStaticField("data");
      let field2 = cls.getStaticField("data");

      let duplicated = [field1!, field2!];
      let unique = uniqueFields(duplicated);
      expect(unique.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_2700
     * @tc.name testStaticFieldEquals027
     * @tc.desc Verify finding target field in field list using equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass027();
      let targetField = cls.getStaticField("data");
      let allFields: StaticField[] = cls.getDeclaredStaticFields();

      let found = findField(allFields, targetField!);
      expect(found !== null).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_2800
     * @tc.name testStaticFieldEquals028
     * @tc.desc Verify field collection equality comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass028();
      let fields1: StaticField[] = cls.getDeclaredStaticFields();
      let fields2: StaticField[] = cls.getDeclaredStaticFields();

      expect(fieldsEquals(fields1, fields2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_2900
     * @tc.name testStaticFieldEquals029
     * @tc.desc Verify grouping fields by type using equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass029();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      let groups = groupFieldsByType(fields);
      expect(groups.size).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_3000
     * @tc.name testStaticFieldEquals030
     * @tc.desc Verify two references to the same static field are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass030();
      let field1 = cls.getStaticField("data");
      let field2 = cls.getStaticField("data");
      expect(field1!.equals(field2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_3100
     * @tc.name testStaticFieldEquals031
     * @tc.desc Verify equals method performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass031();
      let fields: StaticField[] = cls.getDeclaredStaticFields();

      let startTime = Date.now();
      let count = 0;

      for (let i = 0; i < fields.length; i++) {
        for (let j = 0; j < fields.length; j++) {
          if (fields[i].equals(fields[j])) {
            count++;
          }
        }
      }

      let endTime = Date.now();
      expect(count).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_3200
     * @tc.name testStaticFieldEquals032
     * @tc.desc Verify performance comparison between strict reference and equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass032();
      let field1 = cls.getStaticField("data");
      let field2 = cls.getStaticField("data");

      let start1 = Date.now();
      for (let i = 0; i < 100; i++) {
        const result = field1! === field2!;
      }
      let time1 = Date.now() - start1;

      let start2 = Date.now();
      for (let i = 0; i < 100; i++) {
        const result = field1!.equals(field2!);
      }
      let time2 = Date.now() - start2;

      expect(field1! === field2!).assertEqual(true);
      expect(field1!.equals(field2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_3300
     * @tc.name testStaticFieldEquals033
     * @tc.desc Verify StaticField and InstanceField equals behavior consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass033();

      let staticField1 = cls.getStaticField("staticValue");
      let staticField2 = cls.getStaticField("staticValue");
      expect(staticField1!.equals(staticField2!)).assertEqual(true);

      let instanceField1 = cls.getInstanceField("instanceValue");
      let instanceField2 = cls.getInstanceField("instanceValue");
      expect(instanceField1!.equals(instanceField2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_3400
     * @tc.name testStaticFieldEquals034
     * @tc.desc Verify checking if field is in collection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass034();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      expect(fields.length > 0).assertEqual(true);
      let targetField = cls.getStaticField("data");

      expect(containsField(fields, targetField!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_3500
     * @tc.name testStaticFieldEquals035
     * @tc.desc Verify calculating intersection of two field collections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls1 = reflectMyClass035();
      const cls2 = reflectOtherClass035();
      let fields1: StaticField[] = cls1.getDeclaredStaticFields();
      let fields2: StaticField[] = cls2.getDeclaredStaticFields();
      expect(fields1.length > 0).assertEqual(true);
      expect(fields2.length > 0).assertEqual(true);

      let intersection = intersectFields(fields1, fields2);
      expect(intersection.length).assertEqual(1);
      expect(intersection[0].getName()).assertEqual("common");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_3600
     * @tc.name testStaticFieldEquals036
     * @tc.desc Verify calculating difference of two field collections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass031();
      let fields: StaticField[] = cls.getDeclaredStaticFields();

      let diff = differenceFields(fields, fields);
      expect(diff.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_3700
     * @tc.name testStaticFieldEquals037
     * @tc.desc Verify configuration change detection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let oldCls = reflectOldConfig037();
      let newCls = reflectNewConfig037();

      let oldFields: StaticField[] = oldCls.getDeclaredStaticFields();
      let newFields: StaticField[] = newCls.getDeclaredStaticFields();
      expect(oldFields.length > 0).assertEqual(true);
      expect(newFields.length > 0).assertEqual(true);
      compareConfigFields(oldCls, newCls);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_3800
     * @tc.name testStaticFieldEquals038
     * @tc.desc Verify field caching using equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass038();
      let field = cls.getStaticField("expensiveField");

      let value1 = getExpensiveFieldValue(field!);
      let value2 = getExpensiveFieldValue(field!);
      expect(value1 === value2).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_4100
     * @tc.name testStaticFieldEquals041
     * @tc.desc Verify field comparison based on multiple attributes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass041();
      let field1 = cls.getStaticField("data");
      let field2 = cls.getStaticField("data");

      expect(fieldsAreDeepEqual(field1!, field2!)).assertEqual(true);
      expect(field1!.equals(field2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_4200
     * @tc.name testStaticFieldEquals042
     * @tc.desc Verify handling possible circular references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass042();
      let dataField = cls.getStaticField("data");
      let selfRefField = cls.getStaticField("selfRef");

      expect(dataField!.equals(selfRefField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_4300
     * @tc.name testStaticFieldEquals043
     * @tc.desc Verify comparing fields with special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass043();
      let nullField = cls.getStaticField("nullValue");
      let undefField = cls.getStaticField("undefinedValue");

      expect(nullField!.equals(undefField!)).assertEqual(false);

      expect(nullField!.equals(nullField!)).assertEqual(true);
      expect(undefField!.equals(undefField!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_4400
     * @tc.name testStaticFieldEquals044
     * @tc.desc Verify comparing fields with same name in parent-child class hierarchy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = reflectParentClass044();
      let childCls = reflectChildClass044();

      let parentField = parentCls.getStaticField("data");
      let childField = childCls.getStaticField("data");

      expect(parentField!.equals(childField!)).assertEqual(false);

      expect(parentField!.equals(parentField!)).assertEqual(true);
      expect(childField!.equals(childField!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_4500
     * @tc.name testStaticFieldEquals045
     * @tc.desc Verify equals in concurrent scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass045();
      let field = cls.getStaticField("sharedField");

      const results: boolean[] = [];
      for (let i = 0; i < 100; i++) {
        results.push(field!.equals(field!));
      }

      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_4600
     * @tc.name testStaticFieldEquals046
     * @tc.desc Verify detailed field comparison log output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass046();
      let field1 = cls.getStaticField("data");
      let field2 = cls.getStaticField("data");

      const result = compareFieldsWithLog(field1!, field2!);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_4700
     * @tc.name testStaticFieldEquals047
     * @tc.desc Verify equals with version configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass047();
      let versionField = cls.getStaticField('VERSION');
      let buildField = cls.getStaticField('BUILD_NUMBER');
      expect(versionField!.equals(buildField!)).assertEqual(false);
      expect(versionField!.equals(versionField!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_4800
     * @tc.name testStaticFieldEquals048
     * @tc.desc Verify equals with API configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass048();
      let urlField = cls.getStaticField('API_URL');
      let timeoutField = cls.getStaticField('API_TIMEOUT');
      expect(urlField!.equals(timeoutField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_4900
     * @tc.name testStaticFieldEquals049
     * @tc.desc Verify equals with database configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass049();
      let hostField = cls.getStaticField('DB_HOST');
      let portField = cls.getStaticField('DB_PORT');
      expect(hostField!.equals(portField!)).assertEqual(false);
      expect(hostField!.equals(hostField!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_5000
     * @tc.name testStaticFieldEquals050
     * @tc.desc Verify equals with cache configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass050();
      let ttlField = cls.getStaticField('CACHE_TTL');
      let sizeField = cls.getStaticField('CACHE_SIZE');
      expect(ttlField!.equals(sizeField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_5100
     * @tc.name testStaticFieldEquals051
     * @tc.desc Verify equals with logging configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass051();
      let levelField = cls.getStaticField('LOG_LEVEL');
      let formatField = cls.getStaticField('LOG_FORMAT');
      expect(levelField!.equals(formatField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_5200
     * @tc.name testStaticFieldEquals052
     * @tc.desc Verify equals with protected auth fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass052();
      let tokenField = cls.getStaticField('AUTH_TOKEN');
      let typeField = cls.getStaticField('AUTH_TYPE');
      expect(tokenField!.equals(typeField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_5300
     * @tc.name testStaticFieldEquals053
     * @tc.desc Verify equals with max limit configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass053();
      let connField = cls.getStaticField('MAX_CONNECTIONS');
      let reqField = cls.getStaticField('MAX_REQUESTS');
      expect(connField!.equals(reqField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_5400
     * @tc.name testStaticFieldEquals054
     * @tc.desc Verify equals with feature flag fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass054();
      let featureA = cls.getStaticField('FEATURE_A');
      let featureC = cls.getStaticField('FEATURE_C');
      expect(featureA!.equals(featureC!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_5500
     * @tc.name testStaticFieldEquals055
     * @tc.desc Verify equals with threshold fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass055();
      let minField = cls.getStaticField('THRESHOLD_MIN');
      let maxField = cls.getStaticField('THRESHOLD_MAX');
      expect(minField!.equals(maxField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_5600
     * @tc.name testStaticFieldEquals056
     * @tc.desc Verify equals with environment fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass056();
      let devField = cls.getStaticField('ENV_DEV');
      let prodField = cls.getStaticField('ENV_PROD');
      expect(devField!.equals(prodField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_5700
     * @tc.name testStaticFieldEquals057
     * @tc.desc Verify equals with region fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass057();
      let usField = cls.getStaticField('REGION_US');
      let euField = cls.getStaticField('REGION_EU');
      expect(usField!.equals(euField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_5800
     * @tc.name testStaticFieldEquals058
     * @tc.desc Verify equals with metric fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass058();
      let cpuField = cls.getStaticField('METRIC_CPU');
      let memField = cls.getStaticField('METRIC_MEM');
      expect(cpuField!.equals(memField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_5900
     * @tc.name testStaticFieldEquals059
     * @tc.desc Verify equals with HTTP status code fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass059();
      let okField = cls.getStaticField('STATUS_OK');
      let errField = cls.getStaticField('STATUS_ERROR');
      expect(okField!.equals(errField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_6000
     * @tc.name testStaticFieldEquals060
     * @tc.desc Verify equals with rate limit fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass060();
      let rateField = cls.getStaticField('LIMIT_RATE');
      let burstField = cls.getStaticField('LIMIT_BURST');
      expect(rateField!.equals(burstField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_6100
     * @tc.name testStaticFieldEquals061
     * @tc.desc Verify equals with priority fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass061();
      let highField = cls.getStaticField('PRIORITY_HIGH');
      let lowField = cls.getStaticField('PRIORITY_LOW');
      expect(highField!.equals(lowField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_6200
     * @tc.name testStaticFieldEquals062
     * @tc.desc Verify equals with content type fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass062();
      let jsonField = cls.getStaticField('FORMAT_JSON');
      let xmlField = cls.getStaticField('FORMAT_XML');
      expect(jsonField!.equals(xmlField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_6300
     * @tc.name testStaticFieldEquals063
     * @tc.desc Verify equals with file mode fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass063();
      let readField = cls.getStaticField('MODE_READ');
      let writeField = cls.getStaticField('MODE_WRITE');
      expect(readField!.equals(writeField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_6400
     * @tc.name testStaticFieldEquals064
     * @tc.desc Verify equals with scope fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass064();
      let globalField = cls.getStaticField('SCOPE_GLOBAL');
      let localField = cls.getStaticField('SCOPE_LOCAL');
      expect(globalField!.equals(localField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_6500
     * @tc.name testStaticFieldEquals065
     * @tc.desc Verify equals with type definition fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass065();
      let strField = cls.getStaticField('TYPE_STRING');
      let intField = cls.getStaticField('TYPE_INT');
      expect(strField!.equals(intField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_6600
     * @tc.name testStaticFieldEquals066
     * @tc.desc Verify findFieldByName helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass047();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      let found: StaticField | null = findFieldByName(fields, 'VERSION');
      expect(found !== null).assertEqual(true);
      expect(found!.getName()).assertEqual('VERSION');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_6700
     * @tc.name testStaticFieldEquals067
     * @tc.desc Verify countEqualFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass053();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      let count: number = countEqualFields(fields, fields);
      expect(count).assertEqual(fields.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_6800
     * @tc.name testStaticFieldEquals068
     * @tc.desc Verify areAllFieldsEqual helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass046();
      let field1 = cls.getStaticField('data');
      let field2 = cls.getStaticField('data');
      let fields: StaticField[] = [field1!, field2!];
      expect(areAllFieldsEqual(fields)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_7000
     * @tc.name testStaticFieldEquals070
     * @tc.desc Verify validateEqualityProperties helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass048();
      let field: StaticField | null = cls.getStaticField('API_URL');
      expect(validateEqualityProperties(field!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_7100
     * @tc.name testStaticFieldEquals071
     * @tc.desc Verify compareFieldCollections helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls1 = reflectMyClass047();
      const cls2 = reflectMyClass048();
      let fields1: StaticField[] = cls1.getDeclaredStaticFields();
      let fields2: StaticField[] = cls2.getDeclaredStaticFields();
      expect(fields1.length > 0).assertEqual(true);
      expect(fields2.length > 0).assertEqual(true);
      const result: Record<string, string> = compareFieldCollections(cls1, cls2);
      expect(result['VERSION']).assertEqual('only_in_first');
      expect(result['API_URL']).assertEqual('only_in_second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_7300
     * @tc.name testStaticFieldEquals073
     * @tc.desc Verify symmetricEquals helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldEquals073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = reflectMyClass046();
      let field1 = cls.getStaticField('data');
      let field2 = cls.getStaticField('data');
      expect(symmetricEquals(field1!, field2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_INTEGRATION_EQUALS_0100    
     * @tc.name integrationEquals001
     * @tc.desc Verify equals returns true for same field and false for different fields using real Class.from API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('integrationEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const cls = Class.from<IntegrationEqualsClass>();
      const field1 = cls.getStaticField('name');
      const field2 = cls.getStaticField('name');
      const field3 = cls.getStaticField('count');
      expect(field1 !== undefined).assertEqual(true);
      expect(field2 !== undefined).assertEqual(true);
      expect(field3 !== undefined).assertEqual(true);
      expect(field1!.equals(field2!)).assertEqual(true);
      expect(field1!.equals(field3!)).assertEqual(false);
    });
  });
}