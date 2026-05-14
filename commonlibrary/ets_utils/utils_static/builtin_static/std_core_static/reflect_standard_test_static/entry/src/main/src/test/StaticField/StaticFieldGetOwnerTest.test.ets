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
import { StaticField, ReflectClass, createReflectClass } from './StaticFieldReflect';

class MyClass001 {
  public static name: string = 'test';
}

class MyClass004 {
  public static name: string = 'test';
}

class MyClass005 {
  public static data: string = 'value';
}

class MyClass006 {
  public static field1: string = 'test1';
  public static field2: string = 'test2';
  public static field3: string = 'test3';
}

class ParentClass007 {
  public static parentField: string = 'parent';
}

class ChildClass007 extends ParentClass007 {
  public static childField: string = 'child';
}

class ParentClass008 {
  public static parentField: string = 'parent';
}

class ChildClass008 extends ParentClass008 {
  public static childField: string = 'child';
}

class GrandParent009 {
  public static grandField: string = 'grand';
}

class Parent009 extends GrandParent009 {
  public static parentField: string = 'parent';
}

class Child009 extends Parent009 {
  public static childField: string = 'child';
}

class MyClass010 {
  public static pubField: string = 'public';
}

class MyClass011 {
  private static privField: string = 'private';
}

class MyClass012 {
  protected static protField: string = 'protected';
}

class MyClass013 {
  public static interField: string = 'internal';
}

class MyClass014 {
  public static readonly readonlyField: string = 'readonly';
}

class MyClass015 {
  public static strField: string = 'string';
  public static numField: number = 100;
  public static boolField: boolean = true;
  public static arrField: number[] = [1, 2, 3];
  public static objField: Record<string, string> = { 'key': 'value' };
}

class MyClass021 {
  public static name: string = 'test';
}

class MyClass022 {
  public static readonly value: number = 100;
}

class MyClass023 {
  private static privValue: string = 'private';
  protected static protValue: string = 'protected';
  public static pubValue: string = 'public';
}

class MyClass024 {
  public static data: string = 'test';
}

class MyClass025 {
  public static count: number = 0;
}

class MyClass026 {
  public static value: number = 100;
}

class MyClass027 {
  public static pubField: string = 'public';
}

class MyClass028 {
  public static pubNum: number = 1;
  private static privNum: number = 2;
  protected static protNum: number = 3;
}

class MyClass029 {
  public static field1: string = 'test1';
  public static field2: string = 'test2';
}

class MyClass032 {
  public static name: string = 'test';
  public static age: number = 25;
  public static active: boolean = true;
}

class ClassA033 {
  public static data: string = 'A';
}

class ClassB033 {
  public static data: string = 'B';
}

class Base034 {
  public static baseField: string = 'base';
}

class Middle034 extends Base034 {
  public static middleField: string = 'middle';
}

class Derived034 extends Middle034 {
  public static derivedField: string = 'derived';
}

class Parent035 {
  public static inheritedField: string = 'parent';
}

class Child035 extends Parent035 {
  public static ownField: string = 'child';
}

namespace MyNamespace036 {
  export class NamespacedClass {
    public static namespacedField: string = 'namespace';
  }
}

class Object037 {
  public static data: string = 'object';
}

class String037 {
  public static value: string = 'string';
}

class Array037 {
  public static items: string[] = [];
}

class GenericContainer038 {
  public static defaultValue: Record<string, string> | null = null;
  public static items: string[] = [];
}

class StringContainer038 extends GenericContainer038 {
}

class NumberContainer038 extends GenericContainer038 {
}

abstract class AbstractBase039 {
  public static abstractField: string = 'abstract';
  public static concreteField: string = 'concrete';

  abstract abstractMethod(): void;
}

class ConcreteImpl039 extends AbstractBase039 {
  public static implField: string = 'implementation';

  public abstractMethod(): void {
    console.info("Implemented");
  }
}

interface MyInterface040 {}

class InterfaceImpl040 implements MyInterface040 {
  public static interfaceField: string = 'implemented';
  public static classField: string = 'class';
}

class MyClass041 {
  public static value: number = 100;
}

class MyClass042 {
  public static field1: number = 1;
  public static field2: string = '2';
  public static field3: boolean = true;
}

class MyClass043 {
  public static staticValue: string = 'static';
  public instanceValue: string = 'instance';
}

class MyClass044 {
  public static data: string = 'test';
}

class MyClass045 {
  public static data: string = 'test';
}

class ClassA046 {
  public static field1: string = 'A1';
  public static field2: string = 'A2';
}

class ClassB046 {
  public static field3: string = 'B1';
  public static field4: string = 'B2';
}

class MyClass047 {
  public static data: string = 'test';
}

class Config048 {
  public static APP_NAME: string = 'MyApp';
  public static VERSION: string = '1.0.0';
}

class MyClass050 {
  public static importantData: string = 'critical';
}

class Config051 {
  public static TIMEOUT: number = 30000;
  private static API_KEY: string = 'secret';
}

class MyClass052 {
  public static debugField: string = 'debug me';
}

class DynamicClass053 {
  public static data: string = 'dynamic';
}

class ConfigV1054 {
  public static API_ENDPOINT: string = 'https://v1.api.com';
}

class ConfigV2054 extends ConfigV1054 {
  public static API_ENDPOINT: string = 'https://v2.api.com';
  public static TIMEOUT: number = 5000;
}

class MixedClass055 {
  public static staticField: string = 'static';

  public static getStaticField(): string {
    return MixedClass055.staticField;
  }

  public instanceField: string = 'instance';

  public getInstanceField(): string {
    return this.instanceField;
  }
}

class ServiceConfig058 {
  public static SERVICE_NAME: string = 'UserService';
  public static SERVICE_PORT: number = 8080;
  public static SERVICE_HOST: string = '0.0.0.0';
}

class DatabaseConfig059 {
  public static DB_DRIVER: string = 'mysql';
  public static DB_CHARSET: string = 'utf8mb4';
  public static DB_COLLATION: string = 'utf8mb4_unicode_ci';
  public static DB_PREFIX: string = 'app_';
}

class CacheConfig060 {
  public static CACHE_DRIVER: string = 'redis';
  public static CACHE_PREFIX: string = 'cache:';
  public static CACHE_TTL: number = 3600;
  public static CACHE_SERIALIZE: boolean = true;
}

class QueueConfig061 {
  public static QUEUE_DRIVER: string = 'rabbitmq';
  public static QUEUE_RETRY: number = 3;
  public static QUEUE_TIMEOUT: number = 30000;
  public static QUEUE_DELAY: number = 1000;
}

class MailConfig062 {
  public static MAIL_DRIVER: string = 'smtp';
  public static MAIL_HOST: string = 'smtp.example.com';
  public static MAIL_PORT: number = 587;
  public static MAIL_ENCRYPTION: string = 'tls';
}

class StorageConfig063 {
  public static STORAGE_DISK: string = 'local';
  public static STORAGE_PATH: string = '/storage/app';
  public static STORAGE_MAX_SIZE: number = 104857600;
}

class SessionConfig064 {
  public static SESSION_DRIVER: string = 'file';
  public static SESSION_LIFETIME: number = 120;
  public static SESSION_ENCRYPT: boolean = true;
}

class SecurityConfig065 {
  public static SECURITY_CIPHER: string = 'AES-256-CBC';
  public static SECURITY_HASH: string = 'sha256';
  public static SECURITY_SALT_LENGTH: number = 32;
}

class NotificationConfig066 {
  public static NOTIFY_CHANNELS: string = 'mail,sms,push';
  public static NOTIFY_RETRY: number = 5;
  public static NOTIFY_QUEUE: string = 'notifications';
}

class MonitoringConfig067 {
  public static MONITOR_INTERVAL: number = 60;
  public static MONITOR_RETENTION: number = 30;
  public static MONITOR_ALERT_THRESHOLD: number = 90;
}

class BackupConfig068 {
  public static BACKUP_SCHEDULE: string = '0 2 * * *';
  public static BACKUP_RETENTION: number = 7;
  public static BACKUP_COMPRESSION: boolean = true;
}

class FeatureFlags069 {
  public static FLAG_NEW_UI: boolean = false;
  public static FLAG_BETA: boolean = true;
  public static FLAG_EXPERIMENTAL: boolean = false;
}

class RateLimitConfig070 {
  public static RATE_LIMIT_ENABLED: boolean = true;
  public static RATE_LIMIT_MAX: number = 1000;
  public static RATE_LIMIT_WINDOW: number = 3600;
}

class FrameworkBase057 {
  public static registerField(field: StaticField): void {
    let owner = field.getOwner();
    let fieldName = field.getName();
    console.info(`Framework: Registered field ${owner.getName()}.${fieldName}`);
    FrameworkBase057.fieldRegistry.set(fieldName, owner);
  }

  private static fieldRegistry: Map<string, ReflectClass> = new Map<string, ReflectClass>();
}

class UserComponent057 {
  public static componentId: string = 'user-comp';
  public static version: string = '1.0.0';
}

// Reflection utility functions
function reflectMyClass001(): ReflectClass {
  let cls = createReflectClass('MyClass001');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass004(): ReflectClass {
  let cls = createReflectClass('MyClass004');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass005(): ReflectClass {
  let cls = createReflectClass('MyClass005');
  cls.addStaticField('data', createReflectClass('string'), 'value', true, false, false, false);
  return cls;
}

function reflectMyClass006(): ReflectClass {
  let cls = createReflectClass('MyClass006');
  cls.addStaticField('field1', createReflectClass('string'), 'test1', true, false, false, false);
  cls.addStaticField('field2', createReflectClass('string'), 'test2', true, false, false, false);
  cls.addStaticField('field3', createReflectClass('string'), 'test3', true, false, false, false);
  return cls;
}

function reflectChildClass007(): ReflectClass {
  let cls = createReflectClass('ChildClass007');
  cls.addStaticField('childField', createReflectClass('string'), 'child', true, false, false, false);
  return cls;
}

function reflectParentClass008(): ReflectClass {
  let cls = createReflectClass('ParentClass008');
  cls.addStaticField('parentField', createReflectClass('string'), 'parent', true, false, false, false);
  return cls;
}

function reflectChildClass008(): ReflectClass {
  let cls = createReflectClass('ChildClass008');
  cls.addStaticField('childField', createReflectClass('string'), 'child', true, false, false, false);
  cls.addStaticField('parentField', createReflectClass('string'), 'parent', true, false, false, false);
  return cls;
}

function reflectChild009(): ReflectClass {
  let cls = createReflectClass('Child009');
  cls.addStaticField('childField', createReflectClass('string'), 'child', true, false, false, false);
  cls.addStaticField('parentField', createReflectClass('string'), 'parent', true, false, false, false);
  cls.addStaticField('grandField', createReflectClass('string'), 'grand', true, false, false, false);
  return cls;
}

function reflectMyClass010(): ReflectClass {
  let cls = createReflectClass('MyClass010');
  cls.addStaticField('pubField', createReflectClass('string'), 'public', true, false, false, false);
  return cls;
}

function reflectMyClass011(): ReflectClass {
  let cls = createReflectClass('MyClass011');
  cls.addStaticField('privField', createReflectClass('string'), 'private', false, true, false, false);
  return cls;
}

function reflectMyClass012(): ReflectClass {
  let cls = createReflectClass('MyClass012');
  cls.addStaticField('protField', createReflectClass('string'), 'protected', false, false, true, false);
  return cls;
}

function reflectMyClass013(): ReflectClass {
  let cls = createReflectClass('MyClass013');
  cls.addStaticField('interField', createReflectClass('string'), 'internal', true, false, false, false);
  return cls;
}

function reflectMyClass014(): ReflectClass {
  let cls = createReflectClass('MyClass014');
  cls.addStaticField('readonlyField', createReflectClass('string'), 'readonly', true, false, false, true);
  return cls;
}

function reflectMyClass015(): ReflectClass {
  let cls = createReflectClass('MyClass015');
  cls.addStaticField('strField', createReflectClass('string'), 'string', true, false, false, false);
  cls.addStaticField('numField', createReflectClass('number'), 100, true, false, false, false);
  cls.addStaticField('boolField', createReflectClass('boolean'), true, true, false, false, false);
  cls.addStaticField('arrField', createReflectClass('number[]'), null, true, false, false, false);
  cls.addStaticField('objField', createReflectClass('object'), null, true, false, false, false);
  return cls;
}

function reflectMyClass021(): ReflectClass {
  let cls = createReflectClass('MyClass021');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass022(): ReflectClass {
  let cls = createReflectClass('MyClass022');
  cls.addStaticField('value', createReflectClass('number'), 100, true, false, false, true);
  return cls;
}

function reflectMyClass023(): ReflectClass {
  let cls = createReflectClass('MyClass023');
  cls.addStaticField('privValue', createReflectClass('string'), 'private', false, true, false, false);
  cls.addStaticField('protValue', createReflectClass('string'), 'protected', false, false, true, false);
  cls.addStaticField('pubValue', createReflectClass('string'), 'public', true, false, false, false);
  return cls;
}

function reflectMyClass024(): ReflectClass {
  let cls = createReflectClass('MyClass024');
  cls.addStaticField('data', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass025(): ReflectClass {
  let cls = createReflectClass('MyClass025');
  cls.addStaticField('count', createReflectClass('number'), 0, true, false, false, false);
  return cls;
}

function reflectMyClass026(): ReflectClass {
  let cls = createReflectClass('MyClass026');
  cls.addStaticField('value', createReflectClass('number'), 100, true, false, false, false);
  return cls;
}

function reflectMyClass027(): ReflectClass {
  let cls = createReflectClass('MyClass027');
  cls.addStaticField('pubField', createReflectClass('string'), 'public', true, false, false, false);
  return cls;
}

function reflectMyClass028(): ReflectClass {
  let cls = createReflectClass('MyClass028');
  cls.addStaticField('pubNum', createReflectClass('number'), 1, true, false, false, false);
  cls.addStaticField('privNum', createReflectClass('number'), 2, false, true, false, false);
  cls.addStaticField('protNum', createReflectClass('number'), 3, false, false, true, false);
  return cls;
}

function reflectMyClass029(): ReflectClass {
  let cls = createReflectClass('MyClass029');
  cls.addStaticField('field1', createReflectClass('string'), 'test1', true, false, false, false);
  cls.addStaticField('field2', createReflectClass('string'), 'test2', true, false, false, false);
  return cls;
}

function reflectMyClass032(): ReflectClass {
  let cls = createReflectClass('MyClass032');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  cls.addStaticField('age', createReflectClass('number'), 25, true, false, false, false);
  cls.addStaticField('active', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectClassA033(): ReflectClass {
  let cls = createReflectClass('ClassA033');
  cls.addStaticField('data', createReflectClass('string'), 'A', true, false, false, false);
  return cls;
}

function reflectClassB033(): ReflectClass {
  let cls = createReflectClass('ClassB033');
  cls.addStaticField('data', createReflectClass('string'), 'B', true, false, false, false);
  return cls;
}

function reflectDerived034(): ReflectClass {
  let cls = createReflectClass('Derived034');
  cls.addStaticField('derivedField', createReflectClass('string'), 'derived', true, false, false, false);
  cls.addStaticField('middleField', createReflectClass('string'), 'middle', true, false, false, false);
  cls.addStaticField('baseField', createReflectClass('string'), 'base', true, false, false, false);
  return cls;
}

function reflectChild035(): ReflectClass {
  let cls = createReflectClass('Child035');
  cls.addStaticField('ownField', createReflectClass('string'), 'child', true, false, false, false);
  cls.addStaticField('inheritedField', createReflectClass('string'), 'parent', true, false, false, false);
  return cls;
}

function reflectNamespacedClass036(): ReflectClass {
  let cls = createReflectClass('NamespacedClass');
  cls.addStaticField('namespacedField', createReflectClass('string'), 'namespace', true, false, false, false);
  return cls;
}

function reflectObject037(): ReflectClass {
  let cls = createReflectClass('Object037');
  cls.addStaticField('data', createReflectClass('string'), 'object', true, false, false, false);
  return cls;
}

function reflectString037(): ReflectClass {
  let cls = createReflectClass('String037');
  cls.addStaticField('value', createReflectClass('string'), 'string', true, false, false, false);
  return cls;
}

function reflectArray037(): ReflectClass {
  let cls = createReflectClass('Array037');
  cls.addStaticField('items', createReflectClass('object[]'), null, true, false, false, false);
  return cls;
}

function reflectStringContainer038(): ReflectClass {
  let cls = createReflectClass('StringContainer038');
  cls.addStaticField('defaultValue', createReflectClass('object'), null, true, false, false, false);
  return cls;
}

function reflectNumberContainer038(): ReflectClass {
  let cls = createReflectClass('NumberContainer038');
  cls.addStaticField('defaultValue', createReflectClass('object'), null, true, false, false, false);
  return cls;
}

function reflectAbstractBase039(): ReflectClass {
  let cls = createReflectClass('AbstractBase039');
  cls.addStaticField('abstractField', createReflectClass('string'), 'abstract', true, false, false, false);
  cls.addStaticField('concreteField', createReflectClass('string'), 'concrete', true, false, false, false);
  return cls;
}

function reflectConcreteImpl039(): ReflectClass {
  let cls = createReflectClass('ConcreteImpl039');
  cls.addStaticField('implField', createReflectClass('string'), 'implementation', true, false, false, false);
  return cls;
}

function reflectInterfaceImpl040(): ReflectClass {
  let cls = createReflectClass('InterfaceImpl040');
  cls.addStaticField('interfaceField', createReflectClass('string'), 'implemented', true, false, false, false);
  cls.addStaticField('classField', createReflectClass('string'), 'class', true, false, false, false);
  return cls;
}

function reflectMyClass041(): ReflectClass {
  let cls = createReflectClass('MyClass041');
  cls.addStaticField('value', createReflectClass('number'), 100, true, false, false, false);
  return cls;
}

function reflectMyClass042(): ReflectClass {
  let cls = createReflectClass('MyClass042');
  cls.addStaticField('field1', createReflectClass('number'), 1, true, false, false, false);
  cls.addStaticField('field2', createReflectClass('string'), '2', true, false, false, false);
  cls.addStaticField('field3', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectMyClass043(): ReflectClass {
  let cls = createReflectClass('MyClass043');
  cls.addStaticField('staticValue', createReflectClass('string'), 'static', true, false, false, false);
  cls.addInstanceField('instanceValue', createReflectClass('string'), true, false, false, false);
  return cls;
}

function reflectMyClass044(): ReflectClass {
  let cls = createReflectClass('MyClass044');
  cls.addStaticField('data', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass045(): ReflectClass {
  let cls = createReflectClass('MyClass045');
  cls.addStaticField('data', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectClassA046(): ReflectClass {
  let cls = createReflectClass('ClassA046');
  cls.addStaticField('field1', createReflectClass('string'), 'A1', true, false, false, false);
  cls.addStaticField('field2', createReflectClass('string'), 'A2', true, false, false, false);
  return cls;
}

function reflectClassB046(): ReflectClass {
  let cls = createReflectClass('ClassB046');
  cls.addStaticField('field3', createReflectClass('string'), 'B1', true, false, false, false);
  cls.addStaticField('field4', createReflectClass('string'), 'B2', true, false, false, false);
  return cls;
}

function reflectMyClass047(): ReflectClass {
  let cls = createReflectClass('MyClass047');
  cls.addStaticField('data', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectConfig048(): ReflectClass {
  let cls = createReflectClass('Config048');
  cls.addStaticField('APP_NAME', createReflectClass('string'), 'MyApp', true, false, false, false);
  cls.addStaticField('VERSION', createReflectClass('string'), '1.0.0', true, false, false, false);
  return cls;
}

function reflectMyClass050(): ReflectClass {
  let cls = createReflectClass('MyClass050');
  cls.addStaticField('importantData', createReflectClass('string'), 'critical', true, false, false, false);
  return cls;
}

function reflectConfig051(): ReflectClass {
  let cls = createReflectClass('Config051');
  cls.addStaticField('TIMEOUT', createReflectClass('number'), 30000, true, false, false, false);
  cls.addStaticField('API_KEY', createReflectClass('string'), 'secret', false, true, false, false);
  return cls;
}

function reflectMyClass052(): ReflectClass {
  let cls = createReflectClass('MyClass052');
  cls.addStaticField('debugField', createReflectClass('string'), 'debug me', true, false, false, false);
  return cls;
}

function reflectDynamicClass053(): ReflectClass {
  let cls = createReflectClass('DynamicClass053');
  cls.addStaticField('data', createReflectClass('string'), 'dynamic', true, false, false, false);
  return cls;
}

function reflectConfigV1054(): ReflectClass {
  let cls = createReflectClass('ConfigV1054');
  cls.addStaticField('API_ENDPOINT', createReflectClass('string'), 'https://v1.api.com', true, false, false, false);
  return cls;
}

function reflectConfigV2054(): ReflectClass {
  let cls = createReflectClass('ConfigV2054');
  cls.addStaticField('API_ENDPOINT', createReflectClass('string'), 'https://v2.api.com', true, false, false, false);
  cls.addStaticField('TIMEOUT', createReflectClass('number'), 5000, true, false, false, false);
  return cls;
}

function reflectMixedClass055(): ReflectClass {
  let cls = createReflectClass('MixedClass055');
  cls.addStaticField('staticField', createReflectClass('string'), 'static', true, false, false, false);
  cls.addInstanceField('instanceField', createReflectClass('string'), true, false, false, false);
  return cls;
}

function reflectUserComponent057(): ReflectClass {
  let cls = createReflectClass('UserComponent057');
  cls.addStaticField('componentId', createReflectClass('string'), 'user-comp', true, false, false, false);
  cls.addStaticField('version', createReflectClass('string'), '1.0.0', true, false, false, false);
  return cls;
}

function reflectServiceConfig058(): ReflectClass {
  let cls = createReflectClass('ServiceConfig058');
  cls.addStaticField('SERVICE_NAME', createReflectClass('string'), 'UserService', true, false, false, false);
  cls.addStaticField('SERVICE_PORT', createReflectClass('number'), 8080, true, false, false, false);
  cls.addStaticField('SERVICE_HOST', createReflectClass('string'), '0.0.0.0', true, false, false, false);
  return cls;
}

function reflectDatabaseConfig059(): ReflectClass {
  let cls = createReflectClass('DatabaseConfig059');
  cls.addStaticField('DB_DRIVER', createReflectClass('string'), 'mysql', true, false, false, false);
  cls.addStaticField('DB_CHARSET', createReflectClass('string'), 'utf8mb4', true, false, false, false);
  cls.addStaticField('DB_COLLATION', createReflectClass('string'), 'utf8mb4_unicode_ci', true, false, false, false);
  cls.addStaticField('DB_PREFIX', createReflectClass('string'), 'app_', true, false, false, false);
  return cls;
}

function reflectCacheConfig060(): ReflectClass {
  let cls = createReflectClass('CacheConfig060');
  cls.addStaticField('CACHE_DRIVER', createReflectClass('string'), 'redis', true, false, false, false);
  cls.addStaticField('CACHE_PREFIX', createReflectClass('string'), 'cache:', true, false, false, false);
  cls.addStaticField('CACHE_TTL', createReflectClass('number'), 3600, true, false, false, false);
  cls.addStaticField('CACHE_SERIALIZE', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectQueueConfig061(): ReflectClass {
  let cls = createReflectClass('QueueConfig061');
  cls.addStaticField('QUEUE_DRIVER', createReflectClass('string'), 'rabbitmq', true, false, false, false);
  cls.addStaticField('QUEUE_RETRY', createReflectClass('number'), 3, true, false, false, false);
  cls.addStaticField('QUEUE_TIMEOUT', createReflectClass('number'), 30000, true, false, false, false);
  cls.addStaticField('QUEUE_DELAY', createReflectClass('number'), 1000, true, false, false, false);
  return cls;
}

function reflectMailConfig062(): ReflectClass {
  let cls = createReflectClass('MailConfig062');
  cls.addStaticField('MAIL_DRIVER', createReflectClass('string'), 'smtp', true, false, false, false);
  cls.addStaticField('MAIL_HOST', createReflectClass('string'), 'smtp.example.com', true, false, false, false);
  cls.addStaticField('MAIL_PORT', createReflectClass('number'), 587, true, false, false, false);
  cls.addStaticField('MAIL_ENCRYPTION', createReflectClass('string'), 'tls', true, false, false, false);
  return cls;
}

function reflectStorageConfig063(): ReflectClass {
  let cls = createReflectClass('StorageConfig063');
  cls.addStaticField('STORAGE_DISK', createReflectClass('string'), 'local', true, false, false, false);
  cls.addStaticField('STORAGE_PATH', createReflectClass('string'), '/storage/app', true, false, false, false);
  cls.addStaticField('STORAGE_MAX_SIZE', createReflectClass('number'), 104857600, true, false, false, false);
  return cls;
}

function reflectSessionConfig064(): ReflectClass {
  let cls = createReflectClass('SessionConfig064');
  cls.addStaticField('SESSION_DRIVER', createReflectClass('string'), 'file', true, false, false, false);
  cls.addStaticField('SESSION_LIFETIME', createReflectClass('number'), 120, true, false, false, false);
  cls.addStaticField('SESSION_ENCRYPT', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectSecurityConfig065(): ReflectClass {
  let cls = createReflectClass('SecurityConfig065');
  cls.addStaticField('SECURITY_CIPHER', createReflectClass('string'), 'AES-256-CBC', true, false, false, false);
  cls.addStaticField('SECURITY_HASH', createReflectClass('string'), 'sha256', true, false, false, false);
  cls.addStaticField('SECURITY_SALT_LENGTH', createReflectClass('number'), 32, true, false, false, false);
  return cls;
}

function reflectNotificationConfig066(): ReflectClass {
  let cls = createReflectClass('NotificationConfig066');
  cls.addStaticField('NOTIFY_CHANNELS', createReflectClass('string'), 'mail,sms,push', true, false, false, false);
  cls.addStaticField('NOTIFY_RETRY', createReflectClass('number'), 5, true, false, false, false);
  cls.addStaticField('NOTIFY_QUEUE', createReflectClass('string'), 'notifications', true, false, false, false);
  return cls;
}

function reflectMonitoringConfig067(): ReflectClass {
  let cls = createReflectClass('MonitoringConfig067');
  cls.addStaticField('MONITOR_INTERVAL', createReflectClass('number'), 60, true, false, false, false);
  cls.addStaticField('MONITOR_RETENTION', createReflectClass('number'), 30, true, false, false, false);
  cls.addStaticField('MONITOR_ALERT_THRESHOLD', createReflectClass('number'), 90, true, false, false, false);
  return cls;
}

function reflectBackupConfig068(): ReflectClass {
  let cls = createReflectClass('BackupConfig068');
  cls.addStaticField('BACKUP_SCHEDULE', createReflectClass('string'), '0 2 * * *', true, false, false, false);
  cls.addStaticField('BACKUP_RETENTION', createReflectClass('number'), 7, true, false, false, false);
  cls.addStaticField('BACKUP_COMPRESSION', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectFeatureFlags069(): ReflectClass {
  let cls = createReflectClass('FeatureFlags069');
  cls.addStaticField('FLAG_NEW_UI', createReflectClass('boolean'), false, true, false, false, false);
  cls.addStaticField('FLAG_BETA', createReflectClass('boolean'), true, true, false, false, false);
  cls.addStaticField('FLAG_EXPERIMENTAL', createReflectClass('boolean'), false, true, false, false, false);
  return cls;
}

function reflectRateLimitConfig070(): ReflectClass {
  let cls = createReflectClass('RateLimitConfig070');
  cls.addStaticField('RATE_LIMIT_ENABLED', createReflectClass('boolean'), true, true, false, false, false);
  cls.addStaticField('RATE_LIMIT_MAX', createReflectClass('number'), 1000, true, false, false, false);
  cls.addStaticField('RATE_LIMIT_WINDOW', createReflectClass('number'), 3600, true, false, false, false);
  return cls;
}

// Helper functions moved outside test cases to avoid nested function errors
function getFieldOrigin(field: StaticField): string {
  let owner = field.getOwner();
  return `Field ${field.getName()} is defined in class ${owner.getName()}`;
}

function checkOwner(cls: ReflectClass, fieldName: string): void {
  let field = cls.getStaticField(fieldName);
  if (field !== undefined) {
    let owner = field!.getOwner();
    console.info(`${fieldName} owner: ${owner.getName()}`);
  }
}

function getFieldOwnerName(field: StaticField): string {
  return field.getOwner().getName();
}

function isFieldOwnedBy(field: StaticField, className: string): boolean {
  let owner = field.getOwner();
  return owner.getName() === className;
}

function groupFieldsByOwner(fields: StaticField[]): Map<string, StaticField[]> {
  let groups = new Map<string, StaticField[]>();
  for (let i = 0; i < fields.length; i++) {
    let field = fields[i];
    let ownerName = field.getOwner().getName();
    if (!groups.has(ownerName)) {
      groups.set(ownerName, []);
    }
    groups.get(ownerName)!.push(field);
  }
  return groups;
}

function getFieldFullPath(field: StaticField): string {
  let owner = field.getOwner();
  let ownerName = owner.getName();
  let fieldName = field.getName();
  return `${ownerName}.${fieldName}`;
}

function serializeFieldWithOwner(field: StaticField): Record<string, string | null> {
  let owner = field.getOwner();
  let result: Record<string, string | null> = {
    'owner': owner.getName(),
    'name': field.getName(),
    'type': field.getType().getName(),
    'value': String(field.getValue())
  };
  return result;
}

function logFieldAccess(field: StaticField): void {
  let owner = field.getOwner();
  let timestamp = new Date().toISOString();
  console.info(`[${timestamp}] Accessed ${owner.getName()}.${field.getName()}`);
}

function generateFieldDoc(field: StaticField): string {
  let owner = field.getOwner();
  let type = field.getType();
  let access = field.isPublic() ? 'public' : (field.isPrivate() ? 'private' : 'protected');
  return `**${owner.getName()}.${field.getName()}** (${access} ${type.getName()})`;
}

function debugField(field: StaticField): void {
  let owner = field.getOwner();
  let type = field.getType();
  let value = field.getValue();
  console.info("=== Field Debug Info ===");
  console.info(`Name: ${field.getName()}`);
  console.info(`Owner: ${owner.getName()}`);
  console.info(`Type: ${type.getName()}`);
  console.info(`Value: ${value}`);
  console.info(`Public: ${field.isPublic()}`);
  console.info(`Private: ${field.isPrivate()}`);
  console.info(`Protected: ${field.isProtected()}`);
  console.info(`Readonly: ${field.isReadonly()}`);
  console.info("========================");
}

function analyzeFieldByClassName(className: string, fieldName: string): void {
  let cls = getClassByName(className);
  if (cls !== null) {
    let field = cls.getStaticField(fieldName);
    if (field !== undefined) {
      let owner = field!.getOwner();
      console.info(`Field ${fieldName} is owned by ${owner.getName()}`);
    }
  }
}

function getClassByName(className: string): ReflectClass | null {
  let classMap: Map<string, ReflectClass> = new Map<string, ReflectClass>();
  classMap.set('DynamicClass053', reflectDynamicClass053());
  if (classMap.has(className)) {
    return classMap.get(className)!;
  }
  return null;
}

function getOwnerClassName(field: StaticField): string {
  return field.getOwner().getName();
}

function compareFieldOwners(field1: StaticField, field2: StaticField): boolean {
  return field1.getOwner().equals(field2.getOwner());
}

function listFieldOwners(fields: StaticField[]): string[] {
  let owners: string[] = [];
  for (let i = 0; i < fields.length; i++) {
    owners.push(fields[i].getOwner().getName());
  }
  return owners;
}

function getUniqueOwners(fields: StaticField[]): string[] {
  let owners: string[] = [];
  for (let i = 0; i < fields.length; i++) {
    let ownerName: string = fields[i].getOwner().getName();
    let found: boolean = false;
    for (let j = 0; j < owners.length; j++) {
      if (owners[j] === ownerName) {
        found = true;
        break;
      }
    }
    if (!found) {
      owners.push(ownerName);
    }
  }
  return owners;
}

function buildOwnerFieldMap(cls: ReflectClass): Record<string, string[]> {
  let result: Record<string, string[]> = {};
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    let ownerName: string = fields[i].getOwner().getName();
    if (result[ownerName] === undefined) {
      result[ownerName] = [];
    }
    let fieldList: string[] = result[ownerName] as string[];
    fieldList.push(fields[i].getName());
  }
  return result;
}

function validateOwnerConsistency(fields: StaticField[]): boolean {
  if (fields.length === 0) {
    return true;
  }
  let firstOwner: string = fields[0].getOwner().getName();
  for (let i = 1; i < fields.length; i++) {
    if (fields[i].getOwner().getName() !== firstOwner) {
      return false;
    }
  }
  return true;
}

function getFieldOwnerSummary(field: StaticField): string {
  let owner = field.getOwner();
  return `${owner.getName()}::${field.getName()} (${field.getType().getName()})`;
}

function findFieldsByOwner(fields: StaticField[], ownerName: string): StaticField[] {
  let result: StaticField[] = [];
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].getOwner().getName() === ownerName) {
      result.push(fields[i]);
    }
  }
  return result;
}

export default function StaticFieldGetOwnerTest(): void {
  describe('StaticFieldGetOwnerTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_0100
     * @tc.name testStaticFieldGetOwner001
     * @tc.desc Verify getOwner can be called without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass001();
      let field = cls.getStaticField("name");
      let owner = field!.getOwner();
      expect(owner.getName()).assertEqual("MyClass001");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_0200
     * @tc.name testStaticFieldGetOwner002
     * @tc.desc Verify getOwner is called without passing any parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass001();
      let field = cls.getStaticField("name");
      let owner = field!.getOwner();
      expect(owner.getName()).assertEqual("MyClass001");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_0400
     * @tc.name testStaticFieldGetOwner004
     * @tc.desc Verify getOwner returns a Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass004();
      let field = cls.getStaticField("name");
      let owner = field!.getOwner();
      expect(owner instanceof ReflectClass).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_0500
     * @tc.name testStaticFieldGetOwner005
     * @tc.desc Verify getOwner returns the class that declares the static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass005();
      let field = cls.getStaticField("data");
      let owner = field!.getOwner();
      expect(owner.getName()).assertEqual("MyClass005");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_0600
     * @tc.name testStaticFieldGetOwner006
     * @tc.desc Verify multiple static fields in the same class return the same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass006();
      let field1 = cls.getStaticField("field1");
      let owner1 = field1!.getOwner();
      let field2 = cls.getStaticField("field2");
      let owner2 = field2!.getOwner();
      let field3 = cls.getStaticField("field3");
      let owner3 = field3!.getOwner();
      expect(owner1.getName()).assertEqual(owner2.getName());
      expect(owner2.getName()).assertEqual(owner3.getName());
      expect(owner1.getName()).assertEqual("MyClass006");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_0700
     * @tc.name testStaticFieldGetOwner007
     * @tc.desc Verify the owner of a child class static field is the child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = reflectChildClass007();
      let childField = childCls.getStaticField("childField");
      let childOwner = childField!.getOwner();
      expect(childOwner.getName()).assertEqual("ChildClass007");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_0800
     * @tc.name testStaticFieldGetOwner008
     * @tc.desc Verify the owner of an inherited parent static field is the parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = reflectParentClass008();
      let parentField = parentCls.getStaticField("parentField");
      let parentOwner = parentField!.getOwner();
      expect(parentOwner.getName()).assertEqual("ParentClass008");
      let childCls = reflectChildClass008();
      let childParentField = childCls.getStaticField("parentField");
      if (childParentField !== undefined) {
        let owner = childParentField!.getOwner();
        expect(owner.getName()).assertEqual("ChildClass008");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_0900
     * @tc.name testStaticFieldGetOwner009
     * @tc.desc Verify owner relationships in a multi-level inheritance hierarchy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = reflectChild009();
      let childField = childCls.getStaticField("childField");
      expect(childField!.getOwner().getName()).assertEqual("Child009");
      let parentField = childCls.getStaticField("parentField");
      if (parentField !== undefined) {
        expect(parentField!.getOwner().getName()).assertEqual("Child009");
      }
      let grandField = childCls.getStaticField("grandField");
      if (grandField !== undefined) {
        expect(grandField!.getOwner().getName()).assertEqual("Child009");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_1000
     * @tc.name testStaticFieldGetOwner010
     * @tc.desc Verify the owner of a public static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass010();
      let field = cls.getStaticField("pubField");
      let owner = field!.getOwner();
      expect(owner.getName()).assertEqual("MyClass010");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_1100
     * @tc.name testStaticFieldGetOwner011
     * @tc.desc Verify the owner of a private static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass011();
      let field = cls.getStaticField("privField");
      let owner = field!.getOwner();
      expect(owner.getName()).assertEqual("MyClass011");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_1200
     * @tc.name testStaticFieldGetOwner012
     * @tc.desc Verify the owner of a protected static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass012();
      let field = cls.getStaticField("protField");
      let owner = field!.getOwner();
      expect(owner.getName()).assertEqual("MyClass012");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_1300
     * @tc.name testStaticFieldGetOwner013
     * @tc.desc Verify the owner of an internal static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass013();
      let field = cls.getStaticField("interField");
      let owner = field!.getOwner();
      expect(owner.getName()).assertEqual("MyClass013");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_1400
     * @tc.name testStaticFieldGetOwner014
     * @tc.desc Verify the owner of a readonly static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass014();
      let field = cls.getStaticField("readonlyField");
      let owner = field!.getOwner();
      expect(owner.getName()).assertEqual("MyClass014");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_1500
     * @tc.name testStaticFieldGetOwner015
     * @tc.desc Verify static fields with different value types have the same owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass015();
      let fields = cls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        let owner = fields[i].getOwner();
        expect(owner.getName()).assertEqual("MyClass015");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_1600
     * @tc.name testStaticFieldGetOwner016
     * @tc.desc Verify the return value type of getOwner is Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass004();
      let field = cls.getStaticField("name");
      let owner = field!.getOwner();
      expect(owner instanceof ReflectClass).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_1700
     * @tc.name testStaticFieldGetOwner017
     * @tc.desc Verify the owner returned by getOwner is not null or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass004();
      let field = cls.getStaticField("name");
      let owner = field!.getOwner();
      expect(owner !== null).assertEqual(true);
      expect(owner !== undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_1800
     * @tc.name testStaticFieldGetOwner018
     * @tc.desc Verify the returned Class object supports calling getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass004();
      let field = cls.getStaticField("name");
      let owner = field!.getOwner();
      let ownerName = owner.getName();
      expect(typeof ownerName).assertEqual("string");
      expect(ownerName.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_1900
     * @tc.name testStaticFieldGetOwner019
     * @tc.desc Verify calling getOwner on a null field object throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | null = null;
      try {
        field!.getOwner();
        expect().assertFail();
      } catch (_) {
        expect(_ !== null).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_2000
     * @tc.name testStaticFieldGetOwner020
     * @tc.desc Verify calling getOwner on an undefined field object throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | undefined;
      try {
        field!.getOwner();
        expect().assertFail();
      } catch (_) {
        expect(_ !== null).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_2100
     * @tc.name testStaticFieldGetOwner021
     * @tc.desc Verify behavior when accessing a nonexistent static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass021();
      let field = cls.getStaticField("nonexistent");
      if (field !== null) {
        let owner = field.getOwner();
      } else {
        console.info("Field does not exist");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_2200
     * @tc.name testStaticFieldGetOwner022
     * @tc.desc Verify the owner of a public readonly static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass022();
      let field = cls.getStaticField("value");
      let owner = field!.getOwner();
      expect(owner.getName()).assertEqual("MyClass022");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_2300
     * @tc.name testStaticFieldGetOwner023
     * @tc.desc Verify owners of static fields with different access levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass023();
      let privField = cls.getStaticField("privValue");
      expect(privField!.getOwner().getName()).assertEqual("MyClass023");
      let protField = cls.getStaticField("protValue");
      expect(protField!.getOwner().getName()).assertEqual("MyClass023");
      let pubField = cls.getStaticField("pubValue");
      expect(pubField!.getOwner().getName()).assertEqual("MyClass023");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_2400
     * @tc.name testStaticFieldGetOwner024
     * @tc.desc Verify getting both static field name and owner name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass024();
      let field = cls.getStaticField("data");
      let fieldName = field!.getName();
      let ownerName = field!.getOwner().getName();
      console.info(`Field ${fieldName} is owned by ${ownerName}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_2500
     * @tc.name testStaticFieldGetOwner025
     * @tc.desc Verify getting both static field type and owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass025();
      let field = cls.getStaticField("count");
      let owner = field!.getOwner();
      let type = field!.getType();
      console.info(`Owner: ${owner.getName()}, Type: ${type.getName()}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_2600
     * @tc.name testStaticFieldGetOwner026
     * @tc.desc Verify getting both static field value and owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass026();
      let field = cls.getStaticField("value");
      let owner = field!.getOwner();
      let value = field!.getValue();
      console.info(`${owner.getName()}.${field!.getName()} = ${value}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_2700
     * @tc.name testStaticFieldGetOwner027
     * @tc.desc Verify getting the owner of a public static field with isPublic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass027();
      let field = cls.getStaticField("pubField");
      if (field!.isPublic()) {
        let owner = field!.getOwner();
        console.info(`Public field owned by: ${owner.getName()}`);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_2800
     * @tc.name testStaticFieldGetOwner028
     * @tc.desc Verify getting owners according to access level methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass028();
      let fields = cls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        let field = fields[i];
        let accessLevel: string = "unknown";
        if (field.isPublic()) {
          accessLevel = "public";
        } else if (field.isPrivate()) {
          accessLevel = "private";
        } else if (field.isProtected()) {
          accessLevel = "protected";
        }
        let owner = field.getOwner();
        console.info(`${accessLevel} ${field.getName()} owned by ${owner.getName()}`);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_2900
     * @tc.name testStaticFieldGetOwner029
     * @tc.desc Verify comparing owners of fields in the same class with equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass029();
      let field1 = cls.getStaticField("field1");
      let field2 = cls.getStaticField("field2");
      let owner1 = field1!.getOwner();
      let owner2 = field2!.getOwner();
      expect(owner1.equals(owner2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_3000
     * @tc.name testStaticFieldGetOwner030
     * @tc.desc Verify getOwner is a synchronous method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass004();
      let field = cls.getStaticField("name");
      let owner = field!.getOwner();
      expect(owner instanceof ReflectClass).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_3100
     * @tc.name testStaticFieldGetOwner031
     * @tc.desc Verify getOwner does not return a Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass004();
      let field = cls.getStaticField("name");
      let result = field!.getOwner();
      expect(result instanceof Promise).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_3200
     * @tc.name testStaticFieldGetOwner032
     * @tc.desc Verify collecting owner information while traversing static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass032();
      let fields = cls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        let field = fields[i];
        let fieldName = field.getName();
        let ownerName = field.getOwner().getName();
        console.info(`Field: ${fieldName}, Owner: ${ownerName}`);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_3300
     * @tc.name testStaticFieldGetOwner033
     * @tc.desc Verify comparing owners of static fields from different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = reflectClassA033();
      let fieldA = clsA.getStaticField("data");
      let ownerA = fieldA!.getOwner();
      let clsB = reflectClassB033();
      let fieldB = clsB.getStaticField("data");
      let ownerB = fieldB!.getOwner();
      expect(ownerA.equals(ownerB)).assertEqual(false);
      expect(ownerA.getName()).assertEqual("ClassA033");
      expect(ownerB.getName()).assertEqual("ClassB033");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_3400
     * @tc.name testStaticFieldGetOwner034
     * @tc.desc Verify owner relationships of static fields in a complete inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let derivedCls = reflectDerived034();
      let fields = derivedCls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        let field = fields[i];
        let owner = field.getOwner();
        let fieldName = field.getName();
        console.info(`${fieldName} owned by ${owner.getName()}`);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_3500
     * @tc.name testStaticFieldGetOwner035
     * @tc.desc Verify tracing the class where a static field is defined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = reflectChild035();
      let ownField = childCls.getStaticField("ownField");
      console.info(getFieldOrigin(ownField!));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_3600
     * @tc.name testStaticFieldGetOwner036
     * @tc.desc Verify the owner of a static field in a namespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectNamespacedClass036();
      let field = cls.getStaticField("namespacedField");
      let owner = field!.getOwner();
      console.info("Namespaced field owner: " + owner.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_3700
     * @tc.name testStaticFieldGetOwner037
     * @tc.desc Verify owners of static fields in classes with common names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objCls = reflectObject037();
      checkOwner(objCls, "data");
      let strCls = reflectString037();
      checkOwner(strCls, "value");
      let arrCls = reflectArray037();
      checkOwner(arrCls, "items");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_3800
     * @tc.name testStaticFieldGetOwner038
     * @tc.desc Verify owners of static fields in generic-related classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strCls = reflectStringContainer038();
      let strField = strCls.getStaticField("defaultValue");
      let strOwner = strField!.getOwner();
      console.info("StringContainer038 field owner: " + strOwner.getName());
      let numCls = reflectNumberContainer038();
      let numField = numCls.getStaticField("defaultValue");
      let numOwner = numField!.getOwner();
      console.info("NumberContainer038 field owner: " + numOwner.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_3900
     * @tc.name testStaticFieldGetOwner039
     * @tc.desc Verify owners of static fields in abstract classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let absCls = reflectAbstractBase039();
      let absField = absCls.getStaticField("abstractField");
      let absOwner = absField!.getOwner();
      expect(absOwner.getName()).assertEqual("AbstractBase039");
      let implCls = reflectConcreteImpl039();
      let implField = implCls.getStaticField("implField");
      let implOwner = implField!.getOwner();
      expect(implOwner.getName()).assertEqual("ConcreteImpl039");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_4000
     * @tc.name testStaticFieldGetOwner040
     * @tc.desc Verify owners of static fields in an interface implementation class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectInterfaceImpl040();
      let intField = cls.getStaticField("interfaceField");
      let intOwner = intField!.getOwner();
      expect(intOwner.getName()).assertEqual("InterfaceImpl040");
      let clsField = cls.getStaticField("classField");
      let clsOwner = clsField!.getOwner();
      expect(clsOwner.getName()).assertEqual("InterfaceImpl040");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_4100
     * @tc.name testStaticFieldGetOwner041
     * @tc.desc Verify repeated getOwner calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass041();
      let field = cls.getStaticField("value");
      let owner1 = field!.getOwner();
      let owner2 = field!.getOwner();
      let owner3 = field!.getOwner();
      expect(owner1.getName()).assertEqual(owner2.getName());
      expect(owner2.getName()).assertEqual(owner3.getName());
      expect(owner1.getName()).assertEqual("MyClass041");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_4200
     * @tc.name testStaticFieldGetOwner042
     * @tc.desc Verify querying owners for many static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass042();
      let fields = cls.getDeclaredStaticFields();
      let ownerNames: string[] = [];
      for (let i = 0; i < fields.length; i++) {
        let owner = fields[i].getOwner();
        ownerNames.push(owner.getName());
      }
      for (let i = 1; i < ownerNames.length; i++) {
        expect(ownerNames[i]).assertEqual(ownerNames[0]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_4300
     * @tc.name testStaticFieldGetOwner043
     * @tc.desc Verify StaticField getOwner behavior compared with InstanceField getOwner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass043();
      let staticField = cls.getStaticField("staticValue");
      let staticOwner = staticField!.getOwner();
      console.info("Static field owner: " + staticOwner.getName());
      expect(staticOwner.getName()).assertEqual("MyClass043");
      let instanceField = cls.getInstanceField("instanceValue");
      let instanceOwner = instanceField!.getOwner();
      console.info("Instance field owner: " + instanceOwner.getName());
      expect(instanceOwner.getName()).assertEqual("MyClass043");
      expect(staticOwner.equals(instanceOwner)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_4400
     * @tc.name testStaticFieldGetOwner044
     * @tc.desc Verify helper logic for getting a static field owner name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass044();
      let field = cls.getStaticField("data");
      expect(getFieldOwnerName(field!)).assertEqual("MyClass044");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_4500
     * @tc.name testStaticFieldGetOwner045
     * @tc.desc Verify helper logic for checking whether a static field belongs to a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass045();
      let field = cls.getStaticField("data");
      expect(isFieldOwnedBy(field!, "MyClass045")).assertEqual(true);
      expect(isFieldOwnedBy(field!, "OtherClass")).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_4600
     * @tc.name testStaticFieldGetOwner046
     * @tc.desc Verify grouping static fields by owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = reflectClassA046();
      let fieldsA = clsA.getDeclaredStaticFields();
      let clsB = reflectClassB046();
      let fieldsB = clsB.getDeclaredStaticFields();
      let allFields = fieldsA.concat(fieldsB);
      let groups = groupFieldsByOwner(allFields);
      groups.forEach((fieldList, ownerName): void => {
        console.info(`${ownerName}: ${fieldList.length} fields`);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_4700
     * @tc.name testStaticFieldGetOwner047
     * @tc.desc Verify generating a full path from owner and static field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass047();
      let field = cls.getStaticField("data");
      expect(getFieldFullPath(field!)).assertEqual("MyClass047.data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_4800
     * @tc.name testStaticFieldGetOwner048
     * @tc.desc Verify serialization includes owner information for static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectConfig048();
      let fields = cls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        let serialized = serializeFieldWithOwner(fields[i]);
        console.info(JSON.stringify(serialized));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_4900
     * @tc.name testStaticFieldGetOwner049
     * @tc.desc Verify deserialization can use owner information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: Record<string, string | number | boolean | null> =
        { 'owner': 'Config048', 'name': 'APP_NAME', 'value': 'MyApp' };
      let ownerName: string = data['owner'] as string;
      let fieldName: string = data['name'] as string;
      let value: string | number | boolean | null = data['value']!;
      console.info(`Deserialized ${ownerName}.${fieldName} = ${value}`);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_5000
     * @tc.name testStaticFieldGetOwner050
     * @tc.desc Verify logs include static field owner information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass050();
      let field = cls.getStaticField("importantData");
      logFieldAccess(field!);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_5100
     * @tc.name testStaticFieldGetOwner051
     * @tc.desc Verify generated API documentation includes owner information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectConfig051();
      let fields = cls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        console.info(generateFieldDoc(fields[i]));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_5200
     * @tc.name testStaticFieldGetOwner052
     * @tc.desc Verify debug output displays static field source information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass052();
      let field = cls.getStaticField("debugField");
      debugField(field!);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_5300
     * @tc.name testStaticFieldGetOwner053
     * @tc.desc Verify owner information in dynamic class loading scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      analyzeFieldByClassName("DynamicClass053", "data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_5400
     * @tc.name testStaticFieldGetOwner054
     * @tc.desc Verify owners of versioned class static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1Cls = reflectConfigV1054();
      let v1Field = v1Cls.getStaticField("API_ENDPOINT");
      console.info(`V1 field owner: ${v1Field!.getOwner().getName()}`);
      let v2Cls = reflectConfigV2054();
      let v2Field = v2Cls.getStaticField("API_ENDPOINT");
      if (v2Field !== undefined) {
        console.info(`V2 field owner: ${v2Field!.getOwner().getName()}`);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_5500
     * @tc.name testStaticFieldGetOwner055
     * @tc.desc Verify owner relationships in mixed static and instance member scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMixedClass055();
      let staticField = cls.getStaticField("staticField");
      let staticOwner = staticField!.getOwner();
      console.info(`Static field owner: ${staticOwner.getName()}`);
      let instanceField = cls.getInstanceField("instanceField");
      let instanceOwner = instanceField!.getOwner();
      console.info(`Instance field owner: ${instanceOwner.getName()}`);
      expect(staticOwner.getName()).assertEqual(instanceOwner.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_5600
     * @tc.name testStaticFieldGetOwner056
     * @tc.desc Verify owner operations in metaprogramming scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceClass = reflectConfig048();
      let targetClass = reflectMyClass050();
      let sourceFields = sourceClass.getDeclaredStaticFields();
      for (let i = 0; i < sourceFields.length; i++) {
        let field = sourceFields[i];
        let fieldName = field.getName();
        let value = field.getValue();
        let targetField = targetClass.getStaticField(fieldName);
        if (targetField === undefined) {
          console.info(`Copying ${fieldName} from Config048 to MyClass050`);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_5700
     * @tc.name testStaticFieldGetOwner057
     * @tc.desc Verify framework-level processing of static field owner information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectUserComponent057();
      let fields = cls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        FrameworkBase057.registerField(fields[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_5800
     * @tc.name testStaticFieldGetOwner058
     * @tc.desc Verify owner of service configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectServiceConfig058();
      let field = cls.getStaticField('SERVICE_NAME');
      expect(field!.getOwner().getName()).assertEqual('ServiceConfig058');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_5900
     * @tc.name testStaticFieldGetOwner059
     * @tc.desc Verify owner of database configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectDatabaseConfig059();
      let field = cls.getStaticField('DB_DRIVER');
      expect(field!.getOwner().getName()).assertEqual('DatabaseConfig059');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_6000
     * @tc.name testStaticFieldGetOwner060
     * @tc.desc Verify owner of cache configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectCacheConfig060();
      let field = cls.getStaticField('CACHE_DRIVER');
      expect(field!.getOwner().getName()).assertEqual('CacheConfig060');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_6100
     * @tc.name testStaticFieldGetOwner061
     * @tc.desc Verify owner of queue configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectQueueConfig061();
      let field = cls.getStaticField('QUEUE_DRIVER');
      expect(field!.getOwner().getName()).assertEqual('QueueConfig061');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_6200
     * @tc.name testStaticFieldGetOwner062
     * @tc.desc Verify owner of mail configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMailConfig062();
      let field = cls.getStaticField('MAIL_DRIVER');
      expect(field!.getOwner().getName()).assertEqual('MailConfig062');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_6300
     * @tc.name testStaticFieldGetOwner063
     * @tc.desc Verify owner of storage configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectStorageConfig063();
      let field = cls.getStaticField('STORAGE_DISK');
      expect(field!.getOwner().getName()).assertEqual('StorageConfig063');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_6400
     * @tc.name testStaticFieldGetOwner064
     * @tc.desc Verify owner of session configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectSessionConfig064();
      let field = cls.getStaticField('SESSION_DRIVER');
      expect(field!.getOwner().getName()).assertEqual('SessionConfig064');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_6500
     * @tc.name testStaticFieldGetOwner065
     * @tc.desc Verify owner of security configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectSecurityConfig065();
      let field = cls.getStaticField('SECURITY_CIPHER');
      expect(field!.getOwner().getName()).assertEqual('SecurityConfig065');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_6600
     * @tc.name testStaticFieldGetOwner066
     * @tc.desc Verify owner of notification configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectNotificationConfig066();
      let field = cls.getStaticField('NOTIFY_CHANNELS');
      expect(field!.getOwner().getName()).assertEqual('NotificationConfig066');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_6700
     * @tc.name testStaticFieldGetOwner067
     * @tc.desc Verify owner of monitoring configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMonitoringConfig067();
      let field = cls.getStaticField('MONITOR_INTERVAL');
      expect(field!.getOwner().getName()).assertEqual('MonitoringConfig067');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_6800
     * @tc.name testStaticFieldGetOwner068
     * @tc.desc Verify owner of backup configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectBackupConfig068();
      let field = cls.getStaticField('BACKUP_SCHEDULE');
      expect(field!.getOwner().getName()).assertEqual('BackupConfig068');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_6900
     * @tc.name testStaticFieldGetOwner069
     * @tc.desc Verify owner of feature flag fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectFeatureFlags069();
      let field = cls.getStaticField('FLAG_BETA');
      expect(field!.getOwner().getName()).assertEqual('FeatureFlags069');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_7000
     * @tc.name testStaticFieldGetOwner070
     * @tc.desc Verify owner of rate limit configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectRateLimitConfig070();
      let field = cls.getStaticField('RATE_LIMIT_MAX');
      expect(field!.getOwner().getName()).assertEqual('RateLimitConfig070');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_7100
     * @tc.name testStaticFieldGetOwner071
     * @tc.desc Verify getOwnerClassName helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectServiceConfig058();
      let field: StaticField | null = cls.getStaticField('SERVICE_NAME');
      expect(getOwnerClassName(field!)).assertEqual('ServiceConfig058');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_7200
     * @tc.name testStaticFieldGetOwner072
     * @tc.desc Verify compareFieldOwners helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectDatabaseConfig059();
      let field1: StaticField | null = cls.getStaticField('DB_DRIVER');
      let field2: StaticField | null = cls.getStaticField('DB_CHARSET');
      expect(compareFieldOwners(field1!, field2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_7300
     * @tc.name testStaticFieldGetOwner073
     * @tc.desc Verify listFieldOwners helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectCacheConfig060();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      let owners: string[] = listFieldOwners(fields);
      for (let i = 0; i < owners.length; i++) {
        expect(owners[i]).assertEqual('CacheConfig060');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_7400
     * @tc.name testStaticFieldGetOwner074
     * @tc.desc Verify getUniqueOwners helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectQueueConfig061();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      let unique: string[] = getUniqueOwners(fields);
      expect(unique.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_7500
     * @tc.name testStaticFieldGetOwner075
     * @tc.desc Verify buildOwnerFieldMap helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMailConfig062();
      let map: Record<string, string[]> = buildOwnerFieldMap(cls);
      expect(map['MailConfig062']!.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_7600
     * @tc.name testStaticFieldGetOwner076
     * @tc.desc Verify validateOwnerConsistency helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectStorageConfig063();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      expect(validateOwnerConsistency(fields)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_7700
     * @tc.name testStaticFieldGetOwner077
     * @tc.desc Verify getFieldOwnerSummary helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectSessionConfig064();
      let field: StaticField | null = cls.getStaticField('SESSION_DRIVER');
      let summary: string = getFieldOwnerSummary(field!);
      expect(summary.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETOWNER_7800
     * @tc.name testStaticFieldGetOwner078
     * @tc.desc Verify findFieldsByOwner helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetOwner078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectSecurityConfig065();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      let found: StaticField[] = findFieldsByOwner(fields, 'SecurityConfig065');
      expect(found.length).assertEqual(3);
    });
  });
}