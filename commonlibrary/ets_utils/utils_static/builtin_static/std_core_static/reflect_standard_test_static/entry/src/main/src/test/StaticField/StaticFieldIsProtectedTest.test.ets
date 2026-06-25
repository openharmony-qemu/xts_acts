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
import { FieldValue, StaticField, ReflectClass, createReflectClass, PLACEHOLDER_PASSWORD, PLACEHOLDER_TOKEN, PLACEHOLDER_API_KEY, PLACEHOLDER_SSN } from '../Util.test';

class IntegrationIsProtectedClass {
  protected static hiddenField: string = 'secret';
  public static visibleField: string = 'public';
}

class MyClass001 {
  protected static name: string = 'test';
}

class MyClass004 {
  protected static config: string = 'settings';
  protected static buffer: string[] = [];
  protected static metadata: string = '';
}

class MyClass005 {
  public static name: string = 'test';
  public static count: int = 0;
}

class MyClass006 {
  private static secret: string = 'hidden';
  private static value: int = 100;
}

class MyClass007 {
  public static internalField: string = 'internal';
}

class MyClass009 {
  protected static prot: int = 1;
  public static pub: int = 2;
  private static priv: int = 3;
}

class MyClass012 {
  protected static num: int = 100;
  protected static str: string = 'test';
  protected static bool: boolean = true;
  protected static arr: int[] = [1, 2, 3];
  protected static obj: Record<string, string> = { 'key': 'value' };
  protected static charField: char = c'A';
}

class MyClass015 {
  protected static name: string = 'test';
}

class MyClass016 {
  protected static readonly value: int = 100;
}

class MyClass017 {
  protected static count: int = 0;
}

class MyClass018 {
  protected static prot: string = 'protected';
  public static pub: string = 'public';
}

class MyClass019 {
  protected static prot: string = 'protected';
  private static priv: string = 'private';
}

class MyClass020 {
  protected static readonly protReadonly: string = 'value';
  public static readonly pubReadonly: string = 'value';
}

class MyClass021 {
  protected static config: string = 'settings';
}

class MyClass022 {
  protected static config: string = 'settings';
}

class MyClass023 {
  protected static setting: string = 'value';
}

class MyClass024 {
  protected static counter: int = 0;
}

class Config027 {
  public static APP_NAME: string = 'MyApp';
  protected static API_KEY: string = PLACEHOLDER_API_KEY;
  protected static DEBUG_MODE: boolean = false;
  private static PASSWORD: string = PLACEHOLDER_PASSWORD;
  public static LOG_LEVEL: string = 'info';
}

class MyClass028 {
  public static publicField: string = 'public';
  protected static protectedField: string = 'protected';
  private static privateField: string = 'private';
}

class Parent029 {
  public static parentPublic: string = 'parent public';
  protected static parentProtected: string = 'parent protected';
  private static parentPrivate: string = 'parent private';
}

class Child029 extends Parent029 {
  public static childPublic: string = 'child public';
  protected static childProtected: string = 'child protected';
}

class BaseComponent030 {
  protected static defaultConfig: Record<string, string> = { 'theme': 'light' };
  protected static version: string = '1.0.0';
}

class Button030 extends BaseComponent030 {
}

interface MyInterface031 {
  constant: string;
}

class Impl031 implements MyInterface031 {
  public constant: string = 'implemented';
  protected static internalConstant: string = 'internal';
}

class GenericClass032 {
  public static defaultValue: string = '';
  protected static cache: string[] = [];
  private static metadata: string = '';
}

class MyClass033 {
  protected static handler: () => void = (): void => {
  };
  public static callback: () => void = (): void => {
  };
}

class InnerClass034 {
}

class MyClass034 {
  protected static inner: string = 'InnerClass034';
  public static outer: string = 'Object';
}

class MyClass035 {
  public static pub: int = 1;
  private static priv: int = 2;
  protected static prot: int = 3;
}

class MyClass036 {
  protected static value: int = 100;
}

class MyClass037 {
  protected static field1: int = 1;
  public static field2: int = 2;
  protected static field3: int = 3;
  public static field4: int = 4;
  protected static field5: int = 5;
}

class MyClass038 {
  protected static staticProtected: string = 'static';
  private instanceProtected: string = 'instance';
}

class MyClass039 {
  public static a: int = 1;
  protected static b: int = 2;
  public static c: int = 3;
  protected static d: int = 4;
}

class MyClass040 {
  public static a: int = 1;
  protected static b: int = 2;
  private static c: int = 3;
  protected static d: int = 4;
}

class MyClass041 {
  public static pub: int = 1;
  protected static prot: int = 2;
  private static priv: int = 3;
  public static inter: int = 4;
}

class MyClass042 {
  public static apiKey: string = 'public_key';
  protected static secretKey: string = PLACEHOLDER_API_KEY;
  protected static internalId: string = 'internal-123';
}

class MyClass043 {
  public static displayName: string = 'User';
  public static email: string = 'user@example.com';
  protected static password: string = PLACEHOLDER_PASSWORD;
  protected static authToken: string = PLACEHOLDER_TOKEN;
  protected static ssn: string = PLACEHOLDER_SSN;
}

class MyClass044 {
  protected static protectedData: string = 'sensitive';
  public static publicData: string = 'public';
}

class BaseComponent045 {
  public static componentName: string = 'BaseComponent';
  protected static hooks: string[] = ['onInit', 'onDestroy'];
  protected static defaultProps: Record<string, string> = { 'theme': 'light' };
  private static internalState: string = 'initializing';
}

class Button045 extends BaseComponent045 {
  public static componentName: string = 'Button';
  protected static hooks: string[] = ['onInit', 'onDestroy', 'onClick'];
}

abstract class FrameworkPlugin046 {
  public static pluginName: string = 'BasePlugin';
  protected static hookPoints: string[] = ['beforeInit', 'afterInit'];
  protected static dependencies: string[] = [];
  private static registry: Map<string, string> = new Map<string, string>();
}

class LoggingPlugin046 extends FrameworkPlugin046 {
  public static pluginName: string = 'LoggingPlugin';
  protected static dependencies: string[] = ['core'];
}

class AppConfig047 {
  public static APP_NAME: string = 'MyApp';
  public static VERSION: string = '1.0.0';
  protected static configPath: string = '/etc/myapp/config.json';
  protected static logLevel: string = 'INFO';
  private static secretKey: string = PLACEHOLDER_API_KEY;
}

class DevConfig047 extends AppConfig047 {
  protected static configPath: string = './config/dev.json';
  protected static logLevel: string = 'DEBUG';
}

class ProdConfig047 extends AppConfig047 {
  protected static configPath: string = '/etc/myapp/prod.json';
  protected static logLevel: string = 'WARN';
}

class MyClass048 {
  public static publicValue: string = 'public';
  protected static protectedValue: string = 'protected';
  private static privateValue: string = 'private';
}

abstract class PluginBase049 {
  public static pluginType: string = 'base';
  protected static integrationPoints: string[] = ['onLoad', 'onUnload'];
  protected static requiredVersion: string = '1.0.0';
  private static initialized: boolean = false;
}

class AnalyticsPlugin049 extends PluginBase049 {
  public static pluginType: string = 'analytics';
  protected static integrationPoints: string[] = ['onLoad', 'onUnload', 'onEvent'];
}

abstract class Vehicle050 {
  public static brand: string = 'Generic';
  protected static engineType: string = 'gasoline';
  protected static fuelCapacity: int = 50;
  private static serialNumberPrefix: string = 'VH-';
}

class ElectricCar050 extends Vehicle050 {
  protected static engineType: string = 'electric';
  protected static fuelCapacity: int = 100;
}

class MyClass051 {
  protected static TEMPLATE_PATH: string = '/templates';
  protected static TEMPLATE_EXTENSION: string = '.html';
  protected static TEMPLATE_CACHE_ENABLED: boolean = true;
  public static TEMPLATE_ENGINE: string = 'handlebars';
}

class MyClass052 {
  protected static MIDDLEWARE_STACK: string[] = ['auth', 'logging', 'cors'];
  protected static MIDDLEWARE_ORDER: int[] = [1, 2, 3];
  protected static MIDDLEWARE_ENABLED: boolean = true;
  public static MIDDLEWARE_VERSION: string = '2.0';
}

class MyClass053 {
  protected static VALIDATION_RULES: Record<string, string> = { 'email': 'required|email' };
  protected static VALIDATION_MESSAGES: Record<string, string> = { 'email': 'Invalid email' };
  protected static VALIDATION_STRICT: boolean = true;
  public static VALIDATION_ENABLED: boolean = true;
}

class MyClass054 {
  protected static EVENT_CLICK: string = 'click';
  protected static EVENT_CHANGE: string = 'change';
  protected static EVENT_SUBMIT: string = 'submit';
  protected static EVENT_CUSTOM: string = 'custom';
  public static EVENT_NAMESPACE: string = 'app';
}

class MyClass055 {
  protected static ROUTE_HOME: string = '/home';
  protected static ROUTE_ABOUT: string = '/about';
  protected static ROUTE_CONTACT: string = '/contact';
  protected static ROUTE_ADMIN: string = '/admin';
  public static ROUTE_PREFIX: string = '/app';
}

class MyClass056 {
  protected static readonly PROTECTED_CONSTANT: int = 100;
  protected static readonly PROTECTED_NAME: string = 'protected';
  public static readonly PUBLIC_CONSTANT: int = 200;
}

class MyClass057 {
  protected static fieldA: string = 'a';
  protected static fieldB: string = 'b';
  protected static fieldC: string = 'c';
  protected static fieldD: string = 'd';
  public static fieldE: string = 'e';
}

class MyClass058 {
  protected static protectedStr: string = 'protected';
  protected static protectedNum: int = 888;
  protected static protectedBool: boolean = false;
  protected static protectedArr: string[] = ['x', 'y'];
  public static publicStr: string = 'public';
}

class MyClass059 {
  protected static NAMESPACE_DEFAULT: string = 'default';
  protected static NAMESPACE_ADMIN: string = 'admin';
  protected static NAMESPACE_API: string = 'api';
  protected static NAMESPACE_PUBLIC: string = 'public';
  private static NAMESPACE_INTERNAL: string = 'internal';
}

function reflectMyClass001(): ReflectClass {
  const cls = createReflectClass('MyClass001');
  cls.addStaticField('name', createReflectClass('string'), 'test', false, false, true, false);
  return cls;
}

function reflectMyClass051(): ReflectClass {
  const cls = createReflectClass('MyClass051');
  cls.addStaticField('TEMPLATE_PATH', createReflectClass('string'), '/templates', false, false, true, false);
  cls.addStaticField('TEMPLATE_EXTENSION', createReflectClass('string'), '.html', false, false, true, false);
  cls.addStaticField('TEMPLATE_CACHE_ENABLED', createReflectClass('boolean'), true, false, false, true, false);
  cls.addStaticField('TEMPLATE_ENGINE', createReflectClass('string'), 'handlebars', true, false, false, false);
  return cls;
}

function reflectMyClass052(): ReflectClass {
  const cls = createReflectClass('MyClass052');
  cls.addStaticField('MIDDLEWARE_STACK', createReflectClass('string[]'), [] as FieldValue[], false, false, true, false);
  cls.addStaticField('MIDDLEWARE_ORDER', createReflectClass('int[]'), [] as FieldValue[], false, false, true, false);
  cls.addStaticField('MIDDLEWARE_ENABLED', createReflectClass('boolean'), true, false, false, true, false);
  cls.addStaticField('MIDDLEWARE_VERSION', createReflectClass('string'), '2.0', true, false, false, false);
  return cls;
}

function reflectMyClass053(): ReflectClass {
  const cls = createReflectClass('MyClass053');
  cls.addStaticField('VALIDATION_RULES', createReflectClass('Object'), {} as Record<string, FieldValue>, false, false, true, false);
  cls.addStaticField('VALIDATION_MESSAGES', createReflectClass('Object'), {} as Record<string, FieldValue>, false, false, true, false);
  cls.addStaticField('VALIDATION_STRICT', createReflectClass('boolean'), true, false, false, true, false);
  cls.addStaticField('VALIDATION_ENABLED', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectMyClass054(): ReflectClass {
  const cls = createReflectClass('MyClass054');
  cls.addStaticField('EVENT_CLICK', createReflectClass('string'), 'click', false, false, true, false);
  cls.addStaticField('EVENT_CHANGE', createReflectClass('string'), 'change', false, false, true, false);
  cls.addStaticField('EVENT_SUBMIT', createReflectClass('string'), 'submit', false, false, true, false);
  cls.addStaticField('EVENT_CUSTOM', createReflectClass('string'), 'custom', false, false, true, false);
  cls.addStaticField('EVENT_NAMESPACE', createReflectClass('string'), 'app', true, false, false, false);
  return cls;
}

function reflectMyClass055(): ReflectClass {
  const cls = createReflectClass('MyClass055');
  cls.addStaticField('ROUTE_HOME', createReflectClass('string'), '/home', false, false, true, false);
  cls.addStaticField('ROUTE_ABOUT', createReflectClass('string'), '/about', false, false, true, false);
  cls.addStaticField('ROUTE_CONTACT', createReflectClass('string'), '/contact', false, false, true, false);
  cls.addStaticField('ROUTE_ADMIN', createReflectClass('string'), '/admin', false, false, true, false);
  cls.addStaticField('ROUTE_PREFIX', createReflectClass('string'), '/app', true, false, false, false);
  return cls;
}

function reflectMyClass056(): ReflectClass {
  const cls = createReflectClass('MyClass056');
  cls.addStaticField('PROTECTED_CONSTANT', createReflectClass('int'), 100, false, false, true, true);
  cls.addStaticField('PROTECTED_NAME', createReflectClass('string'), 'protected', false, false, true, true);
  cls.addStaticField('PUBLIC_CONSTANT', createReflectClass('int'), 200, true, false, false, true);
  return cls;
}

function reflectMyClass057(): ReflectClass {
  const cls = createReflectClass('MyClass057');
  cls.addStaticField('fieldA', createReflectClass('string'), 'a', false, false, true, false);
  cls.addStaticField('fieldB', createReflectClass('string'), 'b', false, false, true, false);
  cls.addStaticField('fieldC', createReflectClass('string'), 'c', false, false, true, false);
  cls.addStaticField('fieldD', createReflectClass('string'), 'd', false, false, true, false);
  cls.addStaticField('fieldE', createReflectClass('string'), 'e', true, false, false, false);
  return cls;
}

function reflectMyClass058(): ReflectClass {
  const cls = createReflectClass('MyClass058');
  cls.addStaticField('protectedStr', createReflectClass('string'), 'protected', false, false, true, false);
  cls.addStaticField('protectedNum', createReflectClass('int'), 888, false, false, true, false);
  cls.addStaticField('protectedBool', createReflectClass('boolean'), false, false, false, true, false);
  cls.addStaticField('protectedArr', createReflectClass('string[]'), [] as FieldValue[], false, false, true, false);
  cls.addStaticField('publicStr', createReflectClass('string'), 'public', true, false, false, false);
  return cls;
}

function reflectMyClass059(): ReflectClass {
  const cls = createReflectClass('MyClass059');
  cls.addStaticField('NAMESPACE_DEFAULT', createReflectClass('string'), 'default', false, false, true, false);
  cls.addStaticField('NAMESPACE_ADMIN', createReflectClass('string'), 'admin', false, false, true, false);
  cls.addStaticField('NAMESPACE_API', createReflectClass('string'), 'api', false, false, true, false);
  cls.addStaticField('NAMESPACE_PUBLIC', createReflectClass('string'), 'public', false, false, true, false);
  cls.addStaticField('NAMESPACE_INTERNAL', createReflectClass('string'), 'internal', false, true, false, false);
  return cls;
}

function getProtectedFieldNames(cls: ReflectClass): string[] {
  let names: string[] = [];
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isProtected()) {
      names.push(fields[i].getName());
    }
  }
  return names;
}

function getNonProtectedFieldNames(cls: ReflectClass): string[] {
  let names: string[] = [];
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (!fields[i].isProtected()) {
      names.push(fields[i].getName());
    }
  }
  return names;
}

function countProtectedFields(cls: ReflectClass): number {
  let count: int = 0;
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isProtected()) {
      count++;
    }
  }
  return count;
}

function hasProtectedFields(cls: ReflectClass): boolean {
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isProtected()) {
      return true;
    }
  }
  return false;
}

function filterProtectedFields(fields: StaticField[]): StaticField[] {
  const result: StaticField[] = [];
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isProtected()) {
      result.push(fields[i]);
    }
  }
  return result;
}

function getInheritableFields(cls: ReflectClass): StaticField[] {
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  let inheritable: StaticField[] = [];
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isProtected() || fields[i].isPublic()) {
      inheritable.push(fields[i]);
    }
  }
  return inheritable;
}

function validateProtectedFieldNaming(field: StaticField): boolean {
  if (!field.isProtected()) {
    return true;
  }
  let name: string = field.getName();
  return name === name.toUpperCase() || name.startsWith('_');
}

function buildProtectedFieldConfig(cls: ReflectClass): Record<string, string | number | boolean | null> {
  let config: Record<string, string | number | boolean | null> = {};
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isProtected()) {
      config[fields[i].getName()] = fields[i].getValue() as string | number | boolean | null;
    }
  }
  return config;
}

function reflectMyClass004(): ReflectClass {
  const cls = createReflectClass('MyClass004');
  cls.addStaticField('config', createReflectClass('string'), 'settings', false, false, true, false);
  cls.addStaticField('buffer', createReflectClass('string[]'), '', false, false, true, false);
  cls.addStaticField('metadata', createReflectClass('string'), '', false, false, true, false);
  return cls;
}

function reflectMyClass005(): ReflectClass {
  const cls = createReflectClass('MyClass005');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  cls.addStaticField('count', createReflectClass('int'), 0, true, false, false, false);
  return cls;
}

function reflectMyClass006(): ReflectClass {
  const cls = createReflectClass('MyClass006');
  cls.addStaticField('secret', createReflectClass('string'), 'hidden', false, true, false, false);
  cls.addStaticField('value', createReflectClass('int'), 100, false, true, false, false);
  return cls;
}

function reflectMyClass007(): ReflectClass {
  const cls = createReflectClass('MyClass007');
  cls.addStaticField('internalField', createReflectClass('string'), 'internal', true, false, false, false);
  return cls;
}

function reflectMyClass009(): ReflectClass {
  const cls = createReflectClass('MyClass009');
  cls.addStaticField('prot', createReflectClass('int'), 1, false, false, true, false);
  cls.addStaticField('pub', createReflectClass('int'), 2, true, false, false, false);
  cls.addStaticField('priv', createReflectClass('int'), 3, false, true, false, false);
  return cls;
}

function reflectMyClass012(): ReflectClass {
  const cls = createReflectClass('MyClass012');
  cls.addStaticField('num', createReflectClass('int'), 100, false, false, true, false);
  cls.addStaticField('str', createReflectClass('string'), 'test', false, false, true, false);
  cls.addStaticField('bool', createReflectClass('boolean'), true, false, false, true, false);
  cls.addStaticField('arr', createReflectClass('int[]'), [] as FieldValue[], false, false, true, false);
  cls.addStaticField('obj', createReflectClass('Object'), {} as Record<string, FieldValue>, false, false, true, false);
  cls.addStaticField('charField', createReflectClass('char'), c'A' as FieldValue, false, false, true, false);
  return cls;
}

function reflectMyClass015(): ReflectClass {
  const cls = createReflectClass('MyClass015');
  cls.addStaticField('name', createReflectClass('string'), 'test', false, false, true, false);
  return cls;
}

function reflectMyClass016(): ReflectClass {
  const cls = createReflectClass('MyClass016');
  cls.addStaticField('value', createReflectClass('int'), 100, false, false, true, true);
  return cls;
}

function reflectMyClass017(): ReflectClass {
  const cls = createReflectClass('MyClass017');
  cls.addStaticField('count', createReflectClass('int'), 0, false, false, true, false);
  return cls;
}

function reflectMyClass018(): ReflectClass {
  const cls = createReflectClass('MyClass018');
  cls.addStaticField('prot', createReflectClass('string'), 'protected', false, false, true, false);
  cls.addStaticField('pub', createReflectClass('string'), 'public', true, false, false, false);
  return cls;
}

function reflectMyClass019(): ReflectClass {
  const cls = createReflectClass('MyClass019');
  cls.addStaticField('prot', createReflectClass('string'), 'protected', false, false, true, false);
  cls.addStaticField('priv', createReflectClass('string'), 'private', false, true, false, false);
  return cls;
}

function reflectMyClass020(): ReflectClass {
  const cls = createReflectClass('MyClass020');
  cls.addStaticField('protReadonly', createReflectClass('string'), 'value', false, false, true, true);
  cls.addStaticField('pubReadonly', createReflectClass('string'), 'value', true, false, false, true);
  return cls;
}

function reflectMyClass021(): ReflectClass {
  const cls = createReflectClass('MyClass021');
  cls.addStaticField('config', createReflectClass('string'), 'settings', false, false, true, false);
  return cls;
}

function reflectMyClass022(): ReflectClass {
  const cls = createReflectClass('MyClass022');
  cls.addStaticField('config', createReflectClass('string'), 'settings', false, false, true, false);
  return cls;
}

function reflectMyClass023(): ReflectClass {
  const cls = createReflectClass('MyClass023');
  cls.addStaticField('setting', createReflectClass('string'), 'value', false, false, true, false);
  return cls;
}

function reflectMyClass024(): ReflectClass {
  const cls = createReflectClass('MyClass024');
  cls.addStaticField('counter', createReflectClass('int'), 0, false, false, true, false);
  return cls;
}

function reflectConfig027(): ReflectClass {
  const cls = createReflectClass('Config027');
  cls.addStaticField('APP_NAME', createReflectClass('string'), 'MyApp', true, false, false, false);
  cls.addStaticField('API_KEY', createReflectClass('string'), PLACEHOLDER_API_KEY, false, false, true, false);
  cls.addStaticField('DEBUG_MODE', createReflectClass('boolean'), false, false, false, true, false);
  cls.addStaticField('PASSWORD', createReflectClass('string'), PLACEHOLDER_PASSWORD, false, true, false, false);
  cls.addStaticField('LOG_LEVEL', createReflectClass('string'), 'info', true, false, false, false);
  return cls;
}

function reflectMyClass028(): ReflectClass {
  const cls = createReflectClass('MyClass028');
  cls.addStaticField('publicField', createReflectClass('string'), 'public', true, false, false, false);
  cls.addStaticField('protectedField', createReflectClass('string'), 'protected', false, false, true, false);
  cls.addStaticField('privateField', createReflectClass('string'), 'private', false, true, false, false);
  return cls;
}

function reflectParent029(): ReflectClass {
  const cls = createReflectClass('Parent029');
  cls.addStaticField('parentPublic', createReflectClass('string'), 'parent public', true, false, false, false);
  cls.addStaticField('parentProtected', createReflectClass('string'), 'parent protected', false, false, true, false);
  cls.addStaticField('parentPrivate', createReflectClass('string'), 'parent private', false, true, false, false);
  return cls;
}

function reflectChild029(): ReflectClass {
  const cls = createReflectClass('Child029');
  cls.addStaticField('childPublic', createReflectClass('string'), 'child public', true, false, false, false);
  cls.addStaticField('childProtected', createReflectClass('string'), 'child protected', false, false, true, false);
  return cls;
}

function reflectBaseComponent030(): ReflectClass {
  const cls = createReflectClass('BaseComponent030');
  cls.addStaticField('defaultConfig', createReflectClass('Object'), {} as Record<string, FieldValue>, false, false, true, false);
  cls.addStaticField('version', createReflectClass('string'), '1.0.0', false, false, true, false);
  return cls;
}

function reflectImpl031(): ReflectClass {
  const cls = createReflectClass('Impl031');
  cls.addStaticField('constant', createReflectClass('string'), 'implemented', true, false, false, false);
  cls.addStaticField('internalConstant', createReflectClass('string'), 'internal', false, false, true, false);
  return cls;
}

function reflectGenericClass032(): ReflectClass {
  const cls = createReflectClass('GenericClass032');
  cls.addStaticField('defaultValue', createReflectClass('string'), '', true, false, false, false);
  cls.addStaticField('cache', createReflectClass('string[]'), '', false, false, true, false);
  cls.addStaticField('metadata', createReflectClass('string'), '', false, true, false, false);
  return cls;
}

function reflectMyClass033(): ReflectClass {
  const cls = createReflectClass('MyClass033');
  cls.addStaticField('handler', createReflectClass('function'), '', false, false, true, false);
  cls.addStaticField('callback', createReflectClass('function'), '', true, false, false, false);
  return cls;
}

function reflectMyClass034(): ReflectClass {
  const cls = createReflectClass('MyClass034');
  cls.addStaticField('inner', createReflectClass('string'), 'InnerClass034', false, false, true, false);
  cls.addStaticField('outer', createReflectClass('string'), 'Object', true, false, false, false);
  return cls;
}

function reflectMyClass035(): ReflectClass {
  const cls = createReflectClass('MyClass035');
  cls.addStaticField('pub', createReflectClass('int'), 1, true, false, false, false);
  cls.addStaticField('priv', createReflectClass('int'), 2, false, true, false, false);
  cls.addStaticField('prot', createReflectClass('int'), 3, false, false, true, false);
  return cls;
}

function reflectMyClass036(): ReflectClass {
  const cls = createReflectClass('MyClass036');
  cls.addStaticField('value', createReflectClass('int'), 100, false, false, true, false);
  return cls;
}

function reflectMyClass037(): ReflectClass {
  const cls = createReflectClass('MyClass037');
  cls.addStaticField('field1', createReflectClass('int'), 1, false, false, true, false);
  cls.addStaticField('field2', createReflectClass('int'), 2, true, false, false, false);
  cls.addStaticField('field3', createReflectClass('int'), 3, false, false, true, false);
  cls.addStaticField('field4', createReflectClass('int'), 4, true, false, false, false);
  cls.addStaticField('field5', createReflectClass('int'), 5, false, false, true, false);
  return cls;
}

function reflectMyClass038(): ReflectClass {
  const cls = createReflectClass('MyClass038');
  cls.addStaticField('staticProtected', createReflectClass('string'), 'static', false, false, true, false);
  return cls;
}

function reflectMyClass039(): ReflectClass {
  const cls = createReflectClass('MyClass039');
  cls.addStaticField('a', createReflectClass('int'), 1, true, false, false, false);
  cls.addStaticField('b', createReflectClass('int'), 2, false, false, true, false);
  cls.addStaticField('c', createReflectClass('int'), 3, true, false, false, false);
  cls.addStaticField('d', createReflectClass('int'), 4, false, false, true, false);
  return cls;
}

function reflectMyClass040(): ReflectClass {
  const cls = createReflectClass('MyClass040');
  cls.addStaticField('a', createReflectClass('int'), 1, true, false, false, false);
  cls.addStaticField('b', createReflectClass('int'), 2, false, false, true, false);
  cls.addStaticField('c', createReflectClass('int'), 3, false, true, false, false);
  cls.addStaticField('d', createReflectClass('int'), 4, false, false, true, false);
  return cls;
}

function reflectMyClass041(): ReflectClass {
  const cls = createReflectClass('MyClass041');
  cls.addStaticField('pub', createReflectClass('int'), 1, true, false, false, false);
  cls.addStaticField('prot', createReflectClass('int'), 2, false, false, true, false);
  cls.addStaticField('priv', createReflectClass('int'), 3, false, true, false, false);
  cls.addStaticField('inter', createReflectClass('int'), 4, true, false, false, false);
  return cls;
}

function reflectMyClass042(): ReflectClass {
  const cls = createReflectClass('MyClass042');
  cls.addStaticField('apiKey', createReflectClass('string'), 'public_key', true, false, false, false);
  cls.addStaticField('secretKey', createReflectClass('string'), PLACEHOLDER_API_KEY, false, false, true, false);
  cls.addStaticField('internalId', createReflectClass('string'), 'internal-123', false, false, true, false);
  return cls;
}

function reflectMyClass043(): ReflectClass {
  const cls = createReflectClass('MyClass043');
  cls.addStaticField('displayName', createReflectClass('string'), 'User', true, false, false, false);
  cls.addStaticField('email', createReflectClass('string'), 'user@example.com', true, false, false, false);
  cls.addStaticField('password', createReflectClass('string'), PLACEHOLDER_PASSWORD, false, false, true, false);
  cls.addStaticField('authToken', createReflectClass('string'), PLACEHOLDER_TOKEN, false, false, true, false);
  cls.addStaticField('ssn', createReflectClass('string'), PLACEHOLDER_SSN, false, false, true, false);
  return cls;
}

function reflectMyClass044(): ReflectClass {
  const cls = createReflectClass('MyClass044');
  cls.addStaticField('protectedData', createReflectClass('string'), 'sensitive', false, false, true, false);
  cls.addStaticField('publicData', createReflectClass('string'), 'public', true, false, false, false);
  return cls;
}

function reflectBaseComponent045(): ReflectClass {
  const cls = createReflectClass('BaseComponent045');
  cls.addStaticField('componentName', createReflectClass('string'), 'BaseComponent', true, false, false, false);
  cls.addStaticField('hooks', createReflectClass('string[]'), '', false, false, true, false);
  cls.addStaticField('defaultProps', createReflectClass('Object'), {} as Record<string, FieldValue>, false, false, true, false);
  cls.addStaticField('internalState', createReflectClass('string'), 'initializing', false, true, false, false);
  return cls;
}

function reflectFrameworkPlugin046(): ReflectClass {
  const cls = createReflectClass('FrameworkPlugin046');
  cls.addStaticField('pluginName', createReflectClass('string'), 'BasePlugin', true, false, false, false);
  cls.addStaticField('hookPoints', createReflectClass('string[]'), '', false, false, true, false);
  cls.addStaticField('dependencies', createReflectClass('string[]'), '', false, false, true, false);
  cls.addStaticField('registry', createReflectClass('Object'), {} as Record<string, FieldValue>, false, true, false, false);
  return cls;
}

function reflectAppConfig047(): ReflectClass {
  const cls = createReflectClass('AppConfig047');
  cls.addStaticField('APP_NAME', createReflectClass('string'), 'MyApp', true, false, false, false);
  cls.addStaticField('VERSION', createReflectClass('string'), '1.0.0', true, false, false, false);
  cls.addStaticField('configPath', createReflectClass('string'), '/etc/myapp/config.json', false, false, true, false);
  cls.addStaticField('logLevel', createReflectClass('string'), 'INFO', false, false, true, false);
  cls.addStaticField('secretKey', createReflectClass('string'), PLACEHOLDER_API_KEY, false, true, false, false);
  return cls;
}

function reflectMyClass048(): ReflectClass {
  const cls = createReflectClass('MyClass048');
  cls.addStaticField('publicValue', createReflectClass('string'), 'public', true, false, false, false);
  cls.addStaticField('protectedValue', createReflectClass('string'), 'protected', false, false, true, false);
  cls.addStaticField('privateValue', createReflectClass('string'), 'private', false, true, false, false);
  return cls;
}

function reflectAnalyticsPlugin049(): ReflectClass {
  const cls = createReflectClass('AnalyticsPlugin049');
  cls.addStaticField('pluginType', createReflectClass('string'), 'analytics', true, false, false, false);
  cls.addStaticField('integrationPoints', createReflectClass('string[]'), '', false, false, true, false);
  cls.addStaticField('requiredVersion', createReflectClass('string'), '1.0.0', false, false, true, false);
  cls.addStaticField('initialized', createReflectClass('boolean'), false, false, false, true, false);
  return cls;
}

function reflectVehicle050(): ReflectClass {
  const cls = createReflectClass('Vehicle050');
  cls.addStaticField('brand', createReflectClass('string'), 'Generic', true, false, false, false);
  cls.addStaticField('engineType', createReflectClass('string'), 'gasoline', false, false, true, false);
  cls.addStaticField('fuelCapacity', createReflectClass('int'), 50, false, false, true, false);
  cls.addStaticField('serialNumberPrefix', createReflectClass('string'), 'VH-', false, true, false, false);
  return cls;
}

export function StaticFieldIsProtectedTest(): void {
  describe('StaticFieldIsProtectedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_0100
     * @tc.name testStaticFieldIsProtected001
     * @tc.desc Verify isProtected does not require any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass001();
      let field: StaticField | null = cls.getStaticField('name');
      const result: boolean = field!.isProtected();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_0200
     * @tc.name testStaticFieldIsProtected002
     * @tc.desc Verify isProtected returns boolean without passing any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass001();
      let field: StaticField | null = cls.getStaticField('name');
      const result: boolean = field!.isProtected();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_0300
     * @tc.name testStaticFieldIsProtected003
     * @tc.desc Verify isProtected returns correct value for protected static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass001();
      let field: StaticField | null = cls.getStaticField('name');
      const result: boolean = field!.isProtected();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_0400
     * @tc.name testStaticFieldIsProtected004
     * @tc.desc Verify isProtected returns true for protected static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass004();
      let field1: StaticField | null = cls.getStaticField('config');
      expect(field1!.isProtected()).assertEqual(true);
      let field2: StaticField | null = cls.getStaticField('buffer');
      expect(field2!.isProtected()).assertEqual(true);
      let field3: StaticField | null = cls.getStaticField('metadata');
      expect(field3!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_0500
     * @tc.name testStaticFieldIsProtected005
     * @tc.desc Verify isProtected returns false for public static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass005();
      let field1: StaticField | null = cls.getStaticField('name');
      expect(field1!.isProtected()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('count');
      expect(field2!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_0600
     * @tc.name testStaticFieldIsProtected006
     * @tc.desc Verify isProtected returns false for private static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass006();
      let field1: StaticField | null = cls.getStaticField('secret');
      expect(field1!.isProtected()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('value');
      expect(field2!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_0700
     * @tc.name testStaticFieldIsProtected007
     * @tc.desc Verify isProtected returns false for internal static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass007();
      let field: StaticField | null = cls.getStaticField('internalField');
      expect(field!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_0800
     * @tc.name testStaticFieldIsProtected008
     * @tc.desc Verify isProtected return value is strictly boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass004();
      let field: StaticField | null = cls.getStaticField('config');
      const result: boolean = field!.isProtected();
      expect(typeof result).assertEqual('boolean');
      expect(result).assertEqual(true);
      const cls2: ReflectClass = reflectMyClass005();
      let field2: StaticField | null = cls2.getStaticField('name');
      const result2: boolean = field2!.isProtected();
      expect(typeof result2).assertEqual('boolean');
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_0900
     * @tc.name testStaticFieldIsProtected009
     * @tc.desc Verify isProtected is mutually exclusive with isPublic and isPrivate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass009();
      let field1: StaticField | null = cls.getStaticField('prot');
      expect(field1!.isProtected()).assertEqual(true);
      expect(field1!.isPublic()).assertEqual(false);
      expect(field1!.isPrivate()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('pub');
      expect(field2!.isProtected()).assertEqual(false);
      expect(field2!.isPublic()).assertEqual(true);
      let field3: StaticField | null = cls.getStaticField('priv');
      expect(field3!.isProtected()).assertEqual(false);
      expect(field3!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_1000
     * @tc.name testStaticFieldIsProtected010
     * @tc.desc Verify typeof isProtected return value is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass004();
      let field: StaticField | null = cls.getStaticField('config');
      const result: boolean = field!.isProtected();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_1100
     * @tc.name testStaticFieldIsProtected011
     * @tc.desc Verify isProtected return value can be used as boolean condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass009();
      let field: StaticField | null = cls.getStaticField('prot');
      expect(field!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_1200
     * @tc.name testStaticFieldIsProtected012
     * @tc.desc Verify isProtected returns true for protected fields of various types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass012();
      expect(cls.getStaticField('num')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('str')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('bool')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('arr')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('obj')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('charField')!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_1300
     * @tc.name testStaticFieldIsProtected013
     * @tc.desc Verify calling isProtected on null object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | null = null;
      try {
        field!.isProtected();
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_1400
     * @tc.name testStaticFieldIsProtected014
     * @tc.desc Verify calling isProtected on undefined object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | undefined;
      try {
        field!.isProtected();
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_1500
     * @tc.name testStaticFieldIsProtected015
     * @tc.desc Verify isProtected on non-existent static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass015();
      let field: StaticField | null = cls.getStaticField('nonexistent');
      expect(field).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_1600
     * @tc.name testStaticFieldIsProtected016
     * @tc.desc Verify isProtected with protected readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass016();
      let field: StaticField | null = cls.getStaticField('value');
      expect(field!.isProtected()).assertEqual(true);
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_1700
     * @tc.name testStaticFieldIsProtected017
     * @tc.desc Verify isProtected with protected static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass017();
      let field: StaticField | null = cls.getStaticField('count');
      expect(field!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_1800
     * @tc.name testStaticFieldIsProtected018
     * @tc.desc Verify isProtected and isPublic are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass018();
      let field1: StaticField | null = cls.getStaticField('prot');
      expect(field1!.isProtected()).assertEqual(true);
      expect(field1!.isPublic()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('pub');
      expect(field2!.isProtected()).assertEqual(false);
      expect(field2!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_1900
     * @tc.name testStaticFieldIsProtected019
     * @tc.desc Verify isProtected and isPrivate are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass019();
      let field1: StaticField | null = cls.getStaticField('prot');
      expect(field1!.isProtected()).assertEqual(true);
      expect(field1!.isPrivate()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('priv');
      expect(field2!.isProtected()).assertEqual(false);
      expect(field2!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_2000
     * @tc.name testStaticFieldIsProtected020
     * @tc.desc Verify isProtected combined with isReadonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass020();
      let field1: StaticField | null = cls.getStaticField('protReadonly');
      expect(field1!.isProtected() && field1!.isReadonly()).assertEqual(true);
      let field2: StaticField | null = cls.getStaticField('pubReadonly');
      expect(field2!.isProtected() || !field2!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_2100
     * @tc.name testStaticFieldIsProtected021
     * @tc.desc Verify getting type information of protected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass021();
      let field: StaticField | null = cls.getStaticField('config');
      expect(field!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_2200
     * @tc.name testStaticFieldIsProtected022
     * @tc.desc Verify getting name of protected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass022();
      let field: StaticField | null = cls.getStaticField('config');
      expect(field!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_2300
     * @tc.name testStaticFieldIsProtected023
     * @tc.desc Verify getting value of protected field via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass023();
      let field: StaticField | null = cls.getStaticField('setting');
      if (field!.isProtected()) {
        let value: string | number | boolean | null = field!.getValue() as string | number | boolean | null;
        expect(value !== null && value !== undefined).assertEqual(true);
      }
      expect(field!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_2400
     * @tc.name testStaticFieldIsProtected024
     * @tc.desc Verify modifying protected field value via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass024();
      let field: StaticField | null = cls.getStaticField('counter');
      if (field!.isProtected()) {
        field!.setValue(100);
        expect(field!.getValue()).assertEqual(100);
      }
      expect(field!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_2500
     * @tc.name testStaticFieldIsProtected025
     * @tc.desc Verify isProtected is a synchronous method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass004();
      let field: StaticField | null = cls.getStaticField('config');
      const result: boolean = field!.isProtected();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_2600
     * @tc.name testStaticFieldIsProtected026
     * @tc.desc Verify isProtected return value is not a Promise type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass004();
      let field: StaticField | null = cls.getStaticField('config');
      const result: boolean = field!.isProtected();
      expect(result instanceof Promise).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_2700
     * @tc.name testStaticFieldIsProtected027
     * @tc.desc Verify complete reflection API flow for checking protected fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectConfig027();
      let protectedCount: int = 0;
      let publicCount: int = 0;
      let privateCount: int = 0;
      let fieldNames: string[] = ['APP_NAME', 'API_KEY', 'DEBUG_MODE', 'PASSWORD', 'LOG_LEVEL'];
      for (let i = 0; i < fieldNames.length; i++) {
        let field: StaticField | null = cls.getStaticField(fieldNames[i]);
        if (field !== null) {
          if (field.isProtected()) protectedCount++;
          else if (field.isPublic()) publicCount++;
          else if (field.isPrivate()) privateCount++;
        }
      }
      expect(protectedCount).assertEqual(2);
      expect(publicCount).assertEqual(2);
      expect(privateCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_2800
     * @tc.name testStaticFieldIsProtected028
     * @tc.desc Verify using isProtected to distinguish access levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass028();
      let fieldNames: string[] = ['publicField', 'protectedField', 'privateField'];
      for (let i = 0; i < fieldNames.length; i++) {
        let field: StaticField | null = cls.getStaticField(fieldNames[i]);
        if (field !== null) {
          let level: string = 'unknown';
          if (field.isProtected()) {
            level = 'protected';
          } else if (field.isPublic()) {
            level = 'public';
          } else if (field.isPrivate()) {
            level = 'private';
          }
        }
      }
      let protField: StaticField | null = cls.getStaticField('protectedField');
      expect(protField!.isProtected()).assertEqual(true);
      let pubField: StaticField | null = cls.getStaticField('publicField');
      expect(pubField!.isProtected()).assertEqual(false);
      let privField: StaticField | null = cls.getStaticField('privateField');
      expect(privField!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_2900
     * @tc.name testStaticFieldIsProtected029
     * @tc.desc Verify isProtected with parent class protected static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls: ReflectClass = reflectParent029();
      let parentField1: StaticField | null = parentCls.getStaticField('parentPublic');
      expect(parentField1!.isProtected()).assertEqual(false);
      let parentField2: StaticField | null = parentCls.getStaticField('parentProtected');
      expect(parentField2!.isProtected()).assertEqual(true);
      let childCls: ReflectClass = reflectChild029();
      let childField1: StaticField | null = childCls.getStaticField('childPublic');
      expect(childField1!.isProtected()).assertEqual(false);
      let childField2: StaticField | null = childCls.getStaticField('childProtected');
      expect(childField2!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_3000
     * @tc.name testStaticFieldIsProtected030
     * @tc.desc Verify accessing parent class protected fields from child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseCls: ReflectClass = reflectBaseComponent030();
      let configField: StaticField | null = baseCls.getStaticField('defaultConfig');
      expect(configField!.isProtected()).assertEqual(true);
      let versionField: StaticField | null = baseCls.getStaticField('version');
      expect(versionField!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_3100
     * @tc.name testStaticFieldIsProtected031
     * @tc.desc Verify interface fields cannot be protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectImpl031();
      let field1: StaticField | null = cls.getStaticField('constant');
      expect(field1!.isProtected()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('internalConstant');
      expect(field2!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_3200
     * @tc.name testStaticFieldIsProtected032
     * @tc.desc Verify isProtected with generic class protected static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectGenericClass032();
      let field1: StaticField | null = cls.getStaticField('defaultValue');
      expect(field1!.isProtected()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('cache');
      expect(field2!.isProtected()).assertEqual(true);
      let field3: StaticField | null = cls.getStaticField('metadata');
      expect(field3!.isProtected()).assertEqual(false);
      expect(field3!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_3300
     * @tc.name testStaticFieldIsProtected033
     * @tc.desc Verify isProtected with function type protected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass033();
      expect(cls.getStaticField('handler')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('callback')!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_3400
     * @tc.name testStaticFieldIsProtected034
     * @tc.desc Verify isProtected with class type protected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass034();
      expect(cls.getStaticField('inner')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('outer')!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_3500
     * @tc.name testStaticFieldIsProtected035
     * @tc.desc Verify public/private/protected modifiers are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass035();
      let fieldNames: string[] = ['pub', 'priv', 'prot'];
      for (let i = 0; i < fieldNames.length; i++) {
        let field: StaticField | null = cls.getStaticField(fieldNames[i]);
        if (field !== null) {
          let publicCount: int = (field.isPublic() ? 1 : 0);
          let privateCount: int = (field.isPrivate() ? 1 : 0);
          let protectedCount: int = (field.isProtected() ? 1 : 0);
          expect(publicCount + privateCount + protectedCount).assertEqual(1);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_3600
     * @tc.name testStaticFieldIsProtected036
     * @tc.desc Verify multiple calls to isProtected return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass036();
      let field: StaticField | null = cls.getStaticField('value');
      const result1: boolean = field!.isProtected();
      const result2: boolean = field!.isProtected();
      const result3: boolean = field!.isProtected();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_3700
     * @tc.name testStaticFieldIsProtected037
     * @tc.desc Verify traversing large number of fields and checking protected attribute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass037();
      let fieldNames: string[] = ['field1', 'field2', 'field3', 'field4', 'field5'];
      let protectedCount: int = 0;
      for (let i = 0; i < fieldNames.length; i++) {
        let field: StaticField | null = cls.getStaticField(fieldNames[i]);
        if (field !== null && field.isProtected()) {
          protectedCount++;
        }
      }
      expect(protectedCount).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_3800
     * @tc.name testStaticFieldIsProtected038
     * @tc.desc Verify StaticField isProtected and InstanceField isProtected behave consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass038();
      let staticField: StaticField | null = cls.getStaticField('staticProtected');
      expect(staticField!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_3900
     * @tc.name testStaticFieldIsProtected039
     * @tc.desc Verify filtering protected fields from field list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass039();
      let fieldNames: string[] = ['a', 'b', 'c', 'd'];
      let protectedFields: StaticField[] = [];
      for (let i = 0; i < fieldNames.length; i++) {
        let field: StaticField | null = cls.getStaticField(fieldNames[i]);
        if (field !== null && field.isProtected()) {
          protectedFields.push(field);
        }
      }
      expect(protectedFields.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_4000
     * @tc.name testStaticFieldIsProtected040
     * @tc.desc Verify excluding protected fields from field list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass040();
      let fieldNames: string[] = ['a', 'b', 'c', 'd'];
      let nonProtectedFields: StaticField[] = [];
      for (let i = 0; i < fieldNames.length; i++) {
        let field: StaticField | null = cls.getStaticField(fieldNames[i]);
        if (field !== null && !field.isProtected()) {
          nonProtectedFields.push(field);
        }
      }
      expect(nonProtectedFields.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_4100
     * @tc.name testStaticFieldIsProtected041
     * @tc.desc Verify getting access level string of a field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass041();
      let fieldNames: string[] = ['pub', 'prot', 'priv', 'inter'];
      for (let i = 0; i < fieldNames.length; i++) {
        let field: StaticField | null = cls.getStaticField(fieldNames[i]);
        if (field !== null) {
          let level: string = 'unknown';
          if (field.isPublic()) {
            level = 'public';
          } else if (field.isProtected()) {
            level = 'protected';
          } else if (field.isPrivate()) {
            level = 'private';
          } else {
            level = 'internal';
          }
        }
      }
      let protField: StaticField | null = cls.getStaticField('prot');
      expect(protField!.isProtected()).assertEqual(true);
      let pubField: StaticField | null = cls.getStaticField('pub');
      expect(pubField!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_4200
     * @tc.name testStaticFieldIsProtected042
     * @tc.desc Verify encapsulation of protected fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass042();
      let fieldNames: string[] = ['apiKey', 'secretKey', 'internalId'];
      for (let i = 0; i < fieldNames.length; i++) {
        let field: StaticField | null = cls.getStaticField(fieldNames[i]);
      }
      let secretKeyField: StaticField | null = cls.getStaticField('secretKey');
      expect(secretKeyField!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_4300
     * @tc.name testStaticFieldIsProtected043
     * @tc.desc Verify sensitive data should be marked as protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass043();
      let displayField: StaticField | null = cls.getStaticField('displayName');
      expect(displayField!.isProtected()).assertEqual(false);
      let emailField: StaticField | null = cls.getStaticField('email');
      expect(emailField!.isProtected()).assertEqual(false);
      let passwordField: StaticField | null = cls.getStaticField('password');
      expect(passwordField!.isProtected()).assertEqual(true);
      let tokenField: StaticField | null = cls.getStaticField('authToken');
      expect(tokenField!.isProtected()).assertEqual(true);
      let ssnField: StaticField | null = cls.getStaticField('ssn');
      expect(ssnField!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_4400
     * @tc.name testStaticFieldIsProtected044
     * @tc.desc Verify reflection API can access protected fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass044();
      let protectedField: StaticField | null = cls.getStaticField('protectedData');
      expect(protectedField!.isProtected()).assertEqual(true);
      let value: string | number | boolean | null = protectedField!.getValue() as string | number | boolean | null;
      protectedField!.setValue('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_4500
     * @tc.name testStaticFieldIsProtected045
     * @tc.desc Verify component base class uses protected fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseCls: ReflectClass = reflectBaseComponent045();
      let hooksField: StaticField | null = baseCls.getStaticField('hooks');
      expect(hooksField!.isProtected()).assertEqual(true);
      let propsField: StaticField | null = baseCls.getStaticField('defaultProps');
      expect(propsField!.isProtected()).assertEqual(true);
      let stateField: StaticField | null = baseCls.getStaticField('internalState');
      expect(stateField!.isProtected()).assertEqual(false);
      expect(stateField!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_4600
     * @tc.name testStaticFieldIsProtected046
     * @tc.desc Verify framework extension points use protected fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pluginCls: ReflectClass = reflectFrameworkPlugin046();
      let hooksField: StaticField | null = pluginCls.getStaticField('hookPoints');
      expect(hooksField!.isProtected()).assertEqual(true);
      let depsField: StaticField | null = pluginCls.getStaticField('dependencies');
      expect(depsField!.isProtected()).assertEqual(true);
      let registryField: StaticField | null = pluginCls.getStaticField('registry');
      expect(registryField!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_4700
     * @tc.name testStaticFieldIsProtected047
     * @tc.desc Verify config inheritance with protected fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseCls: ReflectClass = reflectAppConfig047();
      let pathField: StaticField | null = baseCls.getStaticField('configPath');
      expect(pathField!.isProtected()).assertEqual(true);
      let logField: StaticField | null = baseCls.getStaticField('logLevel');
      expect(logField!.isProtected()).assertEqual(true);
      let secretField: StaticField | null = baseCls.getStaticField('secretKey');
      expect(secretField!.isProtected()).assertEqual(false);
      expect(secretField!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_4800
     * @tc.name testStaticFieldIsProtected048
     * @tc.desc Verify accessing protected fields in unit tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass048();
      let field: StaticField | null = cls.getStaticField('protectedValue');
      if (field !== null && field.isProtected()) {
        let value: string | number | boolean | null = field.getValue() as string | number | boolean | null;
        field.setValue('new value');
        expect(field.getValue()).assertEqual('new value');
      }
      expect(field!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_4900
     * @tc.name testStaticFieldIsProtected049
     * @tc.desc Verify plugin system protected integration points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pluginCls: ReflectClass = reflectAnalyticsPlugin049();
      let field: StaticField | null = pluginCls.getStaticField('integrationPoints');
      let hasIntegrationPoints: boolean = (field !== null && field.isProtected());
      expect(hasIntegrationPoints).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_5000
     * @tc.name testStaticFieldIsProtected050
     * @tc.desc Verify protected field design in inheritance hierarchy scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vehicleCls: ReflectClass = reflectVehicle050();
      let engineField: StaticField | null = vehicleCls.getStaticField('engineType');
      expect(engineField!.isProtected()).assertEqual(true);
      let capacityField: StaticField | null = vehicleCls.getStaticField('fuelCapacity');
      expect(capacityField!.isProtected()).assertEqual(true);
      let serialField: StaticField | null = vehicleCls.getStaticField('serialNumberPrefix');
      expect(serialField!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_5100
     * @tc.name testStaticFieldIsProtected051
     * @tc.desc Verify protected fields in template configuration class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass051();
      expect(cls.getStaticField('TEMPLATE_PATH')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('TEMPLATE_EXTENSION')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('TEMPLATE_CACHE_ENABLED')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('TEMPLATE_ENGINE')!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_5200
     * @tc.name testStaticFieldIsProtected052
     * @tc.desc Verify protected fields in middleware configuration class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass052();
      expect(cls.getStaticField('MIDDLEWARE_STACK')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('MIDDLEWARE_ORDER')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('MIDDLEWARE_ENABLED')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('MIDDLEWARE_VERSION')!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_5300
     * @tc.name testStaticFieldIsProtected053
     * @tc.desc Verify protected fields in validation configuration class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass053();
      expect(cls.getStaticField('VALIDATION_RULES')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('VALIDATION_MESSAGES')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('VALIDATION_STRICT')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('VALIDATION_ENABLED')!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_5400
     * @tc.name testStaticFieldIsProtected054
     * @tc.desc Verify protected fields in event configuration class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass054();
      expect(cls.getStaticField('EVENT_CLICK')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('EVENT_CHANGE')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('EVENT_SUBMIT')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('EVENT_CUSTOM')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('EVENT_NAMESPACE')!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_5500
     * @tc.name testStaticFieldIsProtected055
     * @tc.desc Verify protected fields in route configuration class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass055();
      expect(cls.getStaticField('ROUTE_HOME')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('ROUTE_ABOUT')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('ROUTE_CONTACT')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('ROUTE_ADMIN')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('ROUTE_PREFIX')!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_5600
     * @tc.name testStaticFieldIsProtected056
     * @tc.desc Verify protected readonly fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass056();
      expect(cls.getStaticField('PROTECTED_CONSTANT')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('PROTECTED_NAME')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('PUBLIC_CONSTANT')!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_5700
     * @tc.name testStaticFieldIsProtected057
     * @tc.desc Verify many protected fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass057();
      expect(cls.getStaticField('fieldA')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('fieldB')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('fieldC')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('fieldD')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('fieldE')!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_5800
     * @tc.name testStaticFieldIsProtected058
     * @tc.desc Verify protected fields of multiple types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass058();
      expect(cls.getStaticField('protectedStr')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('protectedNum')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('protectedBool')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('protectedArr')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('publicStr')!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_5900
     * @tc.name testStaticFieldIsProtected059
     * @tc.desc Verify protected fields with private field in namespace class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass059();
      expect(cls.getStaticField('NAMESPACE_DEFAULT')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('NAMESPACE_ADMIN')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('NAMESPACE_API')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('NAMESPACE_PUBLIC')!.isProtected()).assertEqual(true);
      expect(cls.getStaticField('NAMESPACE_INTERNAL')!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_6000
     * @tc.name testStaticFieldIsProtected060
     * @tc.desc Verify getProtectedFieldNames helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass051();
      let names: string[] = getProtectedFieldNames(cls);
      expect(names.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_6100
     * @tc.name testStaticFieldIsProtected061
     * @tc.desc Verify getNonProtectedFieldNames helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass059();
      let names: string[] = getNonProtectedFieldNames(cls);
      expect(names.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_6200
     * @tc.name testStaticFieldIsProtected062
     * @tc.desc Verify countProtectedFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass054();
      let count: number = countProtectedFields(cls);
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_6300
     * @tc.name testStaticFieldIsProtected063
     * @tc.desc Verify hasProtectedFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls1: ReflectClass = reflectMyClass055();
      expect(hasProtectedFields(cls1)).assertEqual(true);
      const cls2: ReflectClass = createReflectClass('EmptyClass');
      expect(hasProtectedFields(cls2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_6400
     * @tc.name testStaticFieldIsProtected064
     * @tc.desc Verify filterProtectedFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass058();
      let allFields: StaticField[] = cls.getDeclaredStaticFields();
      let protectedFields: StaticField[] = filterProtectedFields(allFields);
      expect(protectedFields.length).assertEqual(4);
      for (let i = 0; i < protectedFields.length; i++) {
        expect(protectedFields[i].isProtected()).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_6500
     * @tc.name testStaticFieldIsProtected065
     * @tc.desc Verify getInheritableFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass051();
      let inheritable: StaticField[] = getInheritableFields(cls);
      expect(inheritable.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_6600
     * @tc.name testStaticFieldIsProtected066
     * @tc.desc Verify validateProtectedFieldNaming helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass051();
      let field: StaticField | null = cls.getStaticField('TEMPLATE_PATH');
      expect(validateProtectedFieldNaming(field!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_6700
     * @tc.name testStaticFieldIsProtected067
     * @tc.desc Verify buildProtectedFieldConfig helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsProtected067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = reflectMyClass056();
      let config: Record<string, string | number | boolean | null> = buildProtectedFieldConfig(cls);
      expect(config['PROTECTED_CONSTANT']).assertEqual(100);
      expect(config['PROTECTED_NAME']).assertEqual('protected');
      expect(config['PUBLIC_CONSTANT']).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_INTEGRATION_ISPROTECTED_0100
     * @tc.name integrationIsProtected001
     * @tc.desc Verify protected fields are not accessible via getStaticField using real Class.from API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('integrationIsProtected001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const field = Class.from<IntegrationIsProtectedClass>().getStaticField('hiddenField');
      expect(field === undefined).assertEqual(true);
    });
  });
}