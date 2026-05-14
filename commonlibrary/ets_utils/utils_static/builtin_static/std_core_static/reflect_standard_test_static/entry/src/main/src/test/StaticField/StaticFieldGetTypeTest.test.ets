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
  public static num: number = 100;
  public static str: string = 'test';
  public static bool: boolean = true;
}

class MyClass006 {
  public static arr: number[] = [1, 2, 3];
  public static strArr: string[] = ['a', 'b'];
}

class Person007 {
  public name: string = '';
}

class MyClass007 {
  public static person: Person007 = new Person007();
  public static obj: object = {};
}

class MyClass008 {
  public static handler: () => void = (): void => {
  };
  public static callback: (msg: string) => void = (msg: string): void => {
  };
}

class MyClass009 {
  public static union: string | number = 'test';
  public static nullable: string | null = null;
}

class MyClass011 {
  public static nullable: string | null = null;
  public static nullValue: Record<string, string> | null = null;
}

class MyClass012 {
  public static optional: string | null = null;
}

class MyClass013 {
  public static readonly constant: number = 3.14;
  public static variable: number = 2.71;
}

class MyClass017 {
  public static pubNum: number = 1;
  private static privNum: number = 2;
  protected static protNum: number = 3;
  public static interNum: number = 4;
}

class MyClass018 {
  public static byteVal: number = 0;
  public static shortVal: number = 0;
  public static intVal: number = 0;
  public static longVal: number = 0;
  public static floatVal: number = 0.0;
  public static doubleVal: number = 0.0;
  public static numberVal: number = 0;
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
}

class MyClass024 {
  public static count: number = 0;
}

class MyClass025 {
  public static data: string = 'test';
}

class MyClass026 {
  public static value: number = 100;
}

class MyClass027 {
  public static readonly constant: number = 3.14;
  public static variable: number = 2.71;
}

class MyClass028 {
  public static pubNum: number = 1;
  private static privNum: number = 2;
  protected static protNum: number = 3;
}

class MyClass031 {
  public static name: string = 'test';
  public static age: number = 25;
  public static active: boolean = true;
  public static scores: number[] = [90, 85, 95];
}

class MyClass032 {
  public static count: number = 100;
  public static price: number = 9.99;
  public static name: string = 'test';
}

class MyClass033 {
  public static text: string = 'hello';
  public static num: number = 42;
  public static flag: boolean = true;
}

class MyClass034 {
  public static identifier: string = 'ID-123';
  public static quantity: number = 100;
}

class MyClass036 {
  public static anyValue: string = 'could be anything';
}

class MyClass037 {
  public static neverValue: string = 'never';
}

class MyClass038 {
  public static unknownValue: string = 'unknown type';
}

enum Color039 {
  Red,
  Green,
  Blue
}

class MyClass039 {
  public static favoriteColor: Color039 = Color039.Red;
  public static colors: Color039[] = [Color039.Red, Color039.Blue];
}

interface IUser040 {
  name: string;
  age: number;
}

class MyClass040 {
  public static user: IUser040 = { name: 'Alice', age: 30 };
}

class InnerClass041 {
  public value: number = 100;
}

class MyClass041 {
  public static instance: InnerClass041 = new InnerClass041();
}

class MyClass042 {
  public static value: number = 100;
}

class MyClass043 {
  public static field1: number = 1;
  public static field2: string = '2';
  public static field3: boolean = true;
}

class MyClass044 {
  public static staticValue: string = 'static';
  public instanceValue: string = 'instance';
}

class MyClass045 {
  public static count: number = 100;
  public static name: string = 'test';
}

class MyClass046 {
  public static text: string = 'hello';
  public static num: number = 42;
}

class MyClass047 {
  public static count: number = 100;
  public static price: number = 9.99;
  public static name: string = 'test';
}

class MyClass048 {
  public static items: number[] = [1, 2, 3];
  public static name: string = 'test';
}

class MyClass049 {
  public static name: string = 'test';
  public static age: number = 25;
  public static score: number = 90.5;
  public static active: boolean = true;
}

class Config050 {
  public static apiKey: string = 'test-key';
  public static timeout: number = 30000;
  public static enabled: boolean = true;
}

class MyClass051 {
  public static name: string = 'test';
  public static count: number = 100;
  public static active: boolean = true;
}

class AppConfig052 {
  public static APP_NAME: string = 'MyApp';
  public static VERSION: string = '1.0.0';
  private static API_KEY: string = 'secret';
}

class MyClass053 {
  public static name: string = 'test';
  public static count: number = 100;
}

class MyClass054 {
  public static text: string = 'hello';
  public static num: number = 42;
  public static flag: boolean = true;
}

class Parent055 {
  public static parentData: string = 'parent';
}

class Child055 extends Parent055 {
  public static childData: string = 'child';
}

class MyClass057 {
  public static unionField: string | number = 'test';
  public static nullableField: string | null = null;
}

class DataModel058 {
  public static id: number = 0;
  public static name: string = '';
  public static createdAt: string = '';
  public static updatedAt: string = '';
}

class UserModel059 {
  public static username: string = '';
  public static email: string = '';
  public static role: string = 'user';
  public static isActive: boolean = true;
}

class ProductModel060 {
  public static sku: string = '';
  public static price: number = 0.0;
  public static quantity: number = 0;
  public static category: string = '';
}

class OrderModel061 {
  public static orderId: string = '';
  public static total: number = 0.0;
  public static status: string = 'pending';
  public static items: string[] = [];
}

class PaymentModel062 {
  public static transactionId: string = '';
  public static amount: number = 0.0;
  public static currency: string = 'CNY';
  public static method: string = 'wechat';
}

class LogConfig063 {
  public static LOG_LEVEL: string = 'info';
  public static LOG_FORMAT: string = 'json';
  public static LOG_OUTPUT: string = 'file';
  public static LOG_MAX_SIZE: number = 10485760;
}

class AuthConfig064 {
  public static AUTH_GUARD: string = 'jwt';
  public static AUTH_EXPIRES: number = 86400;
  public static AUTH_REFRESH: boolean = true;
}

class CorsConfig065 {
  public static CORS_ORIGIN: string = '*';
  public static CORS_METHODS: string = 'GET,POST,PUT,DELETE';
  public static CORS_HEADERS: string = 'Content-Type,Authorization';
  public static CORS_CREDENTIALS: boolean = true;
}

class PaginationConfig066 {
  public static PAGE_DEFAULT: number = 1;
  public static PER_PAGE_DEFAULT: number = 15;
  public static PER_PAGE_MAX: number = 100;
}

class UploadConfig067 {
  public static UPLOAD_MAX_SIZE: number = 5242880;
  public static UPLOAD_ALLOWED_TYPES: string = 'jpg,png,pdf';
  public static UPLOAD_PATH: string = '/uploads';
}

class EncryptionConfig068 {
  public static ENCRYPT_ALGORITHM: string = 'AES-256-GCM';
  public static ENCRYPT_KEY_LENGTH: number = 256;
  public static ENCRYPT_IV_LENGTH: number = 12;
}

class LocalizationConfig069 {
  public static LOCALE_DEFAULT: string = 'zh-CN';
  public static LOCALE_FALLBACK: string = 'en';
  public static LOCALE_SUPPORTED: string = 'zh-CN,en,ja';
}

class ThemeConfig070 {
  public static THEME_DEFAULT: string = 'light';
  public static THEME_PRIMARY: string = '#1890ff';
  public static THEME_SUCCESS: string = '#52c41a';
  public static THEME_WARNING: string = '#faad14';
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
  cls.addStaticField('num', createReflectClass('number'), 100, true, false, false, false);
  cls.addStaticField('str', createReflectClass('string'), 'test', true, false, false, false);
  cls.addStaticField('bool', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectMyClass006(): ReflectClass {
  let cls = createReflectClass('MyClass006');
  cls.addStaticField('arr', createReflectClass('Array<number>'), null, true, false, false, false);
  cls.addStaticField('strArr', createReflectClass('Array<string>'), null, true, false, false, false);
  return cls;
}

function reflectMyClass007(): ReflectClass {
  let cls = createReflectClass('MyClass007');
  cls.addStaticField('person', createReflectClass('Person007'), null, true, false, false, false);
  cls.addStaticField('obj', createReflectClass('object'), null, true, false, false, false);
  return cls;
}

function reflectMyClass008(): ReflectClass {
  let cls = createReflectClass('MyClass008');
  cls.addStaticField('handler', createReflectClass('function'), null, true, false, false, false);
  cls.addStaticField('callback', createReflectClass('function'), null, true, false, false, false);
  return cls;
}

function reflectMyClass009(): ReflectClass {
  let cls = createReflectClass('MyClass009');
  cls.addStaticField('union', createReflectClass('string'), 'test', true, false, false, false);
  cls.addStaticField('nullable', createReflectClass('string'), null, true, false, false, false);
  return cls;
}

function reflectMyClass011(): ReflectClass {
  let cls = createReflectClass('MyClass011');
  cls.addStaticField('nullable', createReflectClass('string'), null, true, false, false, false);
  cls.addStaticField('nullValue', createReflectClass('object'), null, true, false, false, false);
  return cls;
}

function reflectMyClass012(): ReflectClass {
  let cls = createReflectClass('MyClass012');
  cls.addStaticField('optional', createReflectClass('string'), null, true, false, false, false);
  return cls;
}

function reflectMyClass013(): ReflectClass {
  let cls = createReflectClass('MyClass013');
  cls.addStaticField('constant', createReflectClass('number'), 3.14, true, false, false, true);
  cls.addStaticField('variable', createReflectClass('number'), 2.71, true, false, false, false);
  return cls;
}

function reflectMyClass017(): ReflectClass {
  let cls = createReflectClass('MyClass017');
  cls.addStaticField('pubNum', createReflectClass('number'), 1, true, false, false, false);
  cls.addStaticField('privNum', createReflectClass('number'), 2, false, true, false, false);
  cls.addStaticField('protNum', createReflectClass('number'), 3, false, false, true, false);
  cls.addStaticField('interNum', createReflectClass('number'), 4, true, false, false, false);
  return cls;
}

function reflectMyClass018(): ReflectClass {
  let cls = createReflectClass('MyClass018');
  cls.addStaticField('byteVal', createReflectClass('number'), 0, true, false, false, false);
  cls.addStaticField('shortVal', createReflectClass('number'), 0, true, false, false, false);
  cls.addStaticField('intVal', createReflectClass('number'), 0, true, false, false, false);
  cls.addStaticField('longVal', createReflectClass('number'), 0, true, false, false, false);
  cls.addStaticField('floatVal', createReflectClass('number'), 0.0, true, false, false, false);
  cls.addStaticField('doubleVal', createReflectClass('number'), 0.0, true, false, false, false);
  cls.addStaticField('numberVal', createReflectClass('number'), 0, true, false, false, false);
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
  return cls;
}

function reflectMyClass024(): ReflectClass {
  let cls = createReflectClass('MyClass024');
  cls.addStaticField('count', createReflectClass('number'), 0, true, false, false, false);
  return cls;
}

function reflectMyClass025(): ReflectClass {
  let cls = createReflectClass('MyClass025');
  cls.addStaticField('data', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass026(): ReflectClass {
  let cls = createReflectClass('MyClass026');
  cls.addStaticField('value', createReflectClass('number'), 100, true, false, false, false);
  return cls;
}

function reflectMyClass027(): ReflectClass {
  let cls = createReflectClass('MyClass027');
  cls.addStaticField('constant', createReflectClass('number'), 3.14, true, false, false, true);
  cls.addStaticField('variable', createReflectClass('number'), 2.71, true, false, false, false);
  return cls;
}

function reflectMyClass028(): ReflectClass {
  let cls = createReflectClass('MyClass028');
  cls.addStaticField('pubNum', createReflectClass('number'), 1, true, false, false, false);
  cls.addStaticField('privNum', createReflectClass('number'), 2, false, true, false, false);
  cls.addStaticField('protNum', createReflectClass('number'), 3, false, false, true, false);
  return cls;
}

function reflectMyClass031(): ReflectClass {
  let cls = createReflectClass('MyClass031');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  cls.addStaticField('age', createReflectClass('number'), 25, true, false, false, false);
  cls.addStaticField('active', createReflectClass('boolean'), true, true, false, false, false);
  cls.addStaticField('scores', createReflectClass('number[]'), null, true, false, false, false);
  return cls;
}

function reflectMyClass032(): ReflectClass {
  let cls = createReflectClass('MyClass032');
  cls.addStaticField('count', createReflectClass('number'), 100, true, false, false, false);
  cls.addStaticField('price', createReflectClass('number'), 9.99, true, false, false, false);
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass033(): ReflectClass {
  let cls = createReflectClass('MyClass033');
  cls.addStaticField('text', createReflectClass('string'), 'hello', true, false, false, false);
  cls.addStaticField('num', createReflectClass('number'), 42, true, false, false, false);
  cls.addStaticField('flag', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectMyClass034(): ReflectClass {
  let cls = createReflectClass('MyClass034');
  cls.addStaticField('identifier', createReflectClass('string'), 'ID-123', true, false, false, false);
  cls.addStaticField('quantity', createReflectClass('number'), 100, true, false, false, false);
  return cls;
}

function reflectMyClass036(): ReflectClass {
  let cls = createReflectClass('MyClass036');
  cls.addStaticField('anyValue', createReflectClass('string'), 'could be anything', true, false, false, false);
  return cls;
}

function reflectMyClass037(): ReflectClass {
  let cls = createReflectClass('MyClass037');
  cls.addStaticField('neverValue', createReflectClass('string'), 'never', true, false, false, false);
  return cls;
}

function reflectMyClass038(): ReflectClass {
  let cls = createReflectClass('MyClass038');
  cls.addStaticField('unknownValue', createReflectClass('string'), 'unknown type', true, false, false, false);
  return cls;
}

function reflectMyClass039(): ReflectClass {
  let cls = createReflectClass('MyClass039');
  cls.addStaticField('favoriteColor', createReflectClass('Color039'), 0, true, false, false, false);
  cls.addStaticField('colors', createReflectClass('Color039[]'), null, true, false, false, false);
  return cls;
}

function reflectMyClass040(): ReflectClass {
  let cls = createReflectClass('MyClass040');
  cls.addStaticField('user', createReflectClass('IUser040'), null, true, false, false, false);
  return cls;
}

function reflectMyClass041(): ReflectClass {
  let cls = createReflectClass('MyClass041');
  cls.addStaticField('instance', createReflectClass('InnerClass041'), null, true, false, false, false);
  return cls;
}

function reflectMyClass042(): ReflectClass {
  let cls = createReflectClass('MyClass042');
  cls.addStaticField('value', createReflectClass('number'), 100, true, false, false, false);
  return cls;
}

function reflectMyClass043(): ReflectClass {
  let cls = createReflectClass('MyClass043');
  cls.addStaticField('field1', createReflectClass('number'), 1, true, false, false, false);
  cls.addStaticField('field2', createReflectClass('string'), '2', true, false, false, false);
  cls.addStaticField('field3', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectMyClass044(): ReflectClass {
  let cls = createReflectClass('MyClass044');
  cls.addStaticField('staticValue', createReflectClass('string'), 'static', true, false, false, false);
  cls.addInstanceField('instanceValue', createReflectClass('string'), true, false, false, false);
  return cls;
}

function reflectMyClass045(): ReflectClass {
  let cls = createReflectClass('MyClass045');
  cls.addStaticField('count', createReflectClass('number'), 100, true, false, false, false);
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass046(): ReflectClass {
  let cls = createReflectClass('MyClass046');
  cls.addStaticField('text', createReflectClass('string'), 'hello', true, false, false, false);
  cls.addStaticField('num', createReflectClass('number'), 42, true, false, false, false);
  return cls;
}

function reflectMyClass047(): ReflectClass {
  let cls = createReflectClass('MyClass047');
  cls.addStaticField('count', createReflectClass('number'), 100, true, false, false, false);
  cls.addStaticField('price', createReflectClass('number'), 9.99, true, false, false, false);
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass048(): ReflectClass {
  let cls = createReflectClass('MyClass048');
  cls.addStaticField('items', createReflectClass('Array<number>'), null, true, false, false, false);
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  return cls;
}

function reflectMyClass049(): ReflectClass {
  let cls = createReflectClass('MyClass049');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  cls.addStaticField('age', createReflectClass('number'), 25, true, false, false, false);
  cls.addStaticField('score', createReflectClass('number'), 90.5, true, false, false, false);
  cls.addStaticField('active', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectConfig050(): ReflectClass {
  let cls = createReflectClass('Config050');
  cls.addStaticField('apiKey', createReflectClass('string'), 'test-key', true, false, false, false);
  cls.addStaticField('timeout', createReflectClass('number'), 30000, true, false, false, false);
  cls.addStaticField('enabled', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectMyClass051(): ReflectClass {
  let cls = createReflectClass('MyClass051');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  cls.addStaticField('count', createReflectClass('number'), 100, true, false, false, false);
  cls.addStaticField('active', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectAppConfig052(): ReflectClass {
  let cls = createReflectClass('AppConfig052');
  cls.addStaticField('APP_NAME', createReflectClass('string'), 'MyApp', true, false, false, false);
  cls.addStaticField('VERSION', createReflectClass('string'), '1.0.0', true, false, false, false);
  cls.addStaticField('API_KEY', createReflectClass('string'), 'secret', false, true, false, false);
  return cls;
}

function reflectMyClass053(): ReflectClass {
  let cls = createReflectClass('MyClass053');
  cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
  cls.addStaticField('count', createReflectClass('number'), 100, true, false, false, false);
  return cls;
}

function reflectMyClass054(): ReflectClass {
  let cls = createReflectClass('MyClass054');
  cls.addStaticField('text', createReflectClass('string'), 'hello', true, false, false, false);
  cls.addStaticField('num', createReflectClass('number'), 42, true, false, false, false);
  cls.addStaticField('flag', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectParent055(): ReflectClass {
  let cls = createReflectClass('Parent055');
  cls.addStaticField('parentData', createReflectClass('string'), 'parent', true, false, false, false);
  return cls;
}

function reflectChild055(): ReflectClass {
  let cls = createReflectClass('Child055');
  cls.addStaticField('childData', createReflectClass('string'), 'child', true, false, false, false);
  return cls;
}

function reflectMyClass057(): ReflectClass {
  let cls = createReflectClass('MyClass057');
  cls.addStaticField('unionField', createReflectClass('string'), 'test', true, false, false, false);
  cls.addStaticField('nullableField', createReflectClass('string'), null, true, false, false, false);
  return cls;
}

function reflectDataModel058(): ReflectClass {
  let cls = createReflectClass('DataModel058');
  cls.addStaticField('id', createReflectClass('number'), 0, true, false, false, false);
  cls.addStaticField('name', createReflectClass('string'), '', true, false, false, false);
  cls.addStaticField('createdAt', createReflectClass('string'), '', true, false, false, false);
  cls.addStaticField('updatedAt', createReflectClass('string'), '', true, false, false, false);
  return cls;
}

function reflectUserModel059(): ReflectClass {
  let cls = createReflectClass('UserModel059');
  cls.addStaticField('username', createReflectClass('string'), '', true, false, false, false);
  cls.addStaticField('email', createReflectClass('string'), '', true, false, false, false);
  cls.addStaticField('role', createReflectClass('string'), 'user', true, false, false, false);
  cls.addStaticField('isActive', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectProductModel060(): ReflectClass {
  let cls = createReflectClass('ProductModel060');
  cls.addStaticField('sku', createReflectClass('string'), '', true, false, false, false);
  cls.addStaticField('price', createReflectClass('number'), 0.0, true, false, false, false);
  cls.addStaticField('quantity', createReflectClass('number'), 0, true, false, false, false);
  cls.addStaticField('category', createReflectClass('string'), '', true, false, false, false);
  return cls;
}

function reflectOrderModel061(): ReflectClass {
  let cls = createReflectClass('OrderModel061');
  cls.addStaticField('orderId', createReflectClass('string'), '', true, false, false, false);
  cls.addStaticField('total', createReflectClass('number'), 0.0, true, false, false, false);
  cls.addStaticField('status', createReflectClass('string'), 'pending', true, false, false, false);
  cls.addStaticField('items', createReflectClass('Array<string>'), null, true, false, false, false);
  return cls;
}

function reflectPaymentModel062(): ReflectClass {
  let cls = createReflectClass('PaymentModel062');
  cls.addStaticField('transactionId', createReflectClass('string'), '', true, false, false, false);
  cls.addStaticField('amount', createReflectClass('number'), 0.0, true, false, false, false);
  cls.addStaticField('currency', createReflectClass('string'), 'CNY', true, false, false, false);
  cls.addStaticField('method', createReflectClass('string'), 'wechat', true, false, false, false);
  return cls;
}

function reflectLogConfig063(): ReflectClass {
  let cls = createReflectClass('LogConfig063');
  cls.addStaticField('LOG_LEVEL', createReflectClass('string'), 'info', true, false, false, false);
  cls.addStaticField('LOG_FORMAT', createReflectClass('string'), 'json', true, false, false, false);
  cls.addStaticField('LOG_OUTPUT', createReflectClass('string'), 'file', true, false, false, false);
  cls.addStaticField('LOG_MAX_SIZE', createReflectClass('number'), 10485760, true, false, false, false);
  return cls;
}

function reflectAuthConfig064(): ReflectClass {
  let cls = createReflectClass('AuthConfig064');
  cls.addStaticField('AUTH_GUARD', createReflectClass('string'), 'jwt', true, false, false, false);
  cls.addStaticField('AUTH_EXPIRES', createReflectClass('number'), 86400, true, false, false, false);
  cls.addStaticField('AUTH_REFRESH', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectCorsConfig065(): ReflectClass {
  let cls = createReflectClass('CorsConfig065');
  cls.addStaticField('CORS_ORIGIN', createReflectClass('string'), '*', true, false, false, false);
  cls.addStaticField('CORS_METHODS', createReflectClass('string'), 'GET,POST,PUT,DELETE', true, false, false, false);
  cls.addStaticField('CORS_HEADERS', createReflectClass('string'), 'Content-Type,Authorization', true, false, false, false);
  cls.addStaticField('CORS_CREDENTIALS', createReflectClass('boolean'), true, true, false, false, false);
  return cls;
}

function reflectPaginationConfig066(): ReflectClass {
  let cls = createReflectClass('PaginationConfig066');
  cls.addStaticField('PAGE_DEFAULT', createReflectClass('number'), 1, true, false, false, false);
  cls.addStaticField('PER_PAGE_DEFAULT', createReflectClass('number'), 15, true, false, false, false);
  cls.addStaticField('PER_PAGE_MAX', createReflectClass('number'), 100, true, false, false, false);
  return cls;
}

function reflectUploadConfig067(): ReflectClass {
  let cls = createReflectClass('UploadConfig067');
  cls.addStaticField('UPLOAD_MAX_SIZE', createReflectClass('number'), 5242880, true, false, false, false);
  cls.addStaticField('UPLOAD_ALLOWED_TYPES', createReflectClass('string'), 'jpg,png,pdf', true, false, false, false);
  cls.addStaticField('UPLOAD_PATH', createReflectClass('string'), '/uploads', true, false, false, false);
  return cls;
}

function reflectEncryptionConfig068(): ReflectClass {
  let cls = createReflectClass('EncryptionConfig068');
  cls.addStaticField('ENCRYPT_ALGORITHM', createReflectClass('string'), 'AES-256-GCM', true, false, false, false);
  cls.addStaticField('ENCRYPT_KEY_LENGTH', createReflectClass('number'), 256, true, false, false, false);
  cls.addStaticField('ENCRYPT_IV_LENGTH', createReflectClass('number'), 12, true, false, false, false);
  return cls;
}

function reflectLocalizationConfig069(): ReflectClass {
  let cls = createReflectClass('LocalizationConfig069');
  cls.addStaticField('LOCALE_DEFAULT', createReflectClass('string'), 'zh-CN', true, false, false, false);
  cls.addStaticField('LOCALE_FALLBACK', createReflectClass('string'), 'en', true, false, false, false);
  cls.addStaticField('LOCALE_SUPPORTED', createReflectClass('string'), 'zh-CN,en,ja', true, false, false, false);
  return cls;
}

function reflectThemeConfig070(): ReflectClass {
  let cls = createReflectClass('ThemeConfig070');
  cls.addStaticField('THEME_DEFAULT', createReflectClass('string'), 'light', true, false, false, false);
  cls.addStaticField('THEME_PRIMARY', createReflectClass('string'), '#1890ff', true, false, false, false);
  cls.addStaticField('THEME_SUCCESS', createReflectClass('string'), '#52c41a', true, false, false, false);
  cls.addStaticField('THEME_WARNING', createReflectClass('string'), '#faad14', true, false, false, false);
  return cls;
}

// Helper functions moved outside test cases
function isNumericField(field: StaticField): boolean {
  let type = field.getType();
  let typeName = type.getName();
  return typeName === 'number' || typeName === 'i32' || typeName === 'f64';
}

function getFieldValueAsString(field: StaticField): string {
  let type = field.getType();
  let value = field.getValue();
  let typeName = type.getName();
  if (typeName === 'string' || typeName === 'std.core.String') {
    return value as string;
  } else if (typeName === 'number' || typeName === 'i32' || typeName === 'f64') {
    return String(value);
  } else if (typeName === 'boolean' || typeName === 'bool') {
    return String(value);
  }
  return String(value);
}

function isTypeCompatible(field: StaticField, expectedTypeName: string): boolean {
  let fieldType = field.getType();
  let actualTypeName = fieldType.getName();
  return actualTypeName === expectedTypeName;
}

function getFieldTypeName(field: StaticField): string {
  return field.getType().getName();
}

function isStringField(field: StaticField): boolean {
  let typeName = field.getType().getName();
  return typeName === 'string' || typeName === 'std.core.String' || typeName === 'String';
}

function isCollectionField(field: StaticField): boolean {
  let typeName = field.getType().getName();
  return typeName.includes('Array') || typeName.includes('List') || typeName.includes('Set') ||
  typeName.includes('Map');
}

function groupFieldsByType(fields: StaticField[]): Map<string, StaticField[]> {
  let groups = new Map<string, StaticField[]>();
  for (let i = 0; i < fields.length; i++) {
    let field = fields[i];
    let typeName = field.getType().getName();
    if (!groups.has(typeName)) {
      groups.set(typeName, []);
    }
    groups.get(typeName)!.push(field);
  }
  return groups;
}

function validateFieldValue(field: StaticField, value: string | number | boolean | null): boolean {
  let fieldType = field.getType();
  let typeName = fieldType.getName();
  let valueType = typeof value;
  if (typeName === 'string' || typeName === 'std.core.String' || typeName === 'String') {
    return valueType === 'string';
  } else if (typeName === 'number' || typeName === 'i32') {
    return valueType === 'number';
  } else if (typeName === 'boolean' || typeName === 'bool') {
    return valueType === 'boolean';
  }
  return true;
}

function serializeField(field: StaticField): string {
  let type = field.getType();
  let value = field.getValue();
  let typeName = type.getName();
  if (typeName === 'string' || typeName === 'std.core.String') {
    return `"${value}"`;
  } else if (typeName === 'boolean' || typeName === 'bool') {
    return String(value);
  } else {
    return String(value);
  }
}

function generateFieldTypesDoc(cls: ReflectClass): string {
  let fields = cls.getDeclaredStaticFields();
  let doc: string = '# Static Fields\n\n';
  for (let i = 0; i < fields.length; i++) {
    let field = fields[i];
    let fieldName = field.getName();
    let typeName = field.getType().getName();
    let accessLevel = field.isPublic() ? 'public' : (field.isPrivate() ? 'private' : 'protected');
    doc += `- **${fieldName}** (${accessLevel} ${typeName})\n`;
  }
  return doc;
}

function getFriendlyTypeName(field: StaticField): string {
  let typeName = field.getType().getName();
  let typeMap: Map<string, string> = new Map<string, string>([
    ['string', 'string'],
    ['std.core.String', 'string'],
    ['number', 'integer'],
    ['i32', 'integer'],
    ['f64', 'float'],
    ['boolean', 'boolean'],
    ['bool', 'boolean']
  ]);
  if (typeMap.has(typeName)) {
    return typeMap.get(typeName)!;
  }
  return typeName;
}

function processFieldByType(field: StaticField): void {
  let type = field.getType();
  let typeName = type.getName();
  let value = field.getValue();
  if (typeName === 'string' || typeName === 'std.core.String') {
    console.info(`Processing string: ${value}`);
  } else if (typeName === 'number' || typeName === 'i32') {
    console.info(`Processing number: ${value}`);
  } else if (typeName === 'boolean' || typeName === 'bool') {
    console.info(`Processing boolean: ${value}`);
  } else {
    console.info(`Processing ${typeName}: ${value}`);
  }
}

function getTypeCategory(field: StaticField): string {
  let typeName = field.getType().getName();
  if (typeName === 'string' || typeName === 'std.core.String') {
    return 'text';
  } else if (typeName === 'number' || typeName === 'i32' || typeName === 'f64') {
    return 'numeric';
  } else if (typeName === 'boolean' || typeName === 'bool') {
    return 'logical';
  } else if (typeName.includes('Array') || typeName.includes('List')) {
    return 'collection';
  }
  return 'complex';
}

function countFieldsByType(fields: StaticField[], typeName: string): number {
  let count: number = 0;
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].getType().getName() === typeName) {
      count++;
    }
  }
  return count;
}

function getTypeDistribution(fields: StaticField[]): Record<string, number> {
  let distribution: Record<string, number> = {};
  for (let i = 0; i < fields.length; i++) {
    let typeName: string = fields[i].getType().getName();
    if (distribution[typeName] === undefined) {
      distribution[typeName] = 0;
    }
    let count: number = distribution[typeName] as number;
    distribution[typeName] = count + 1;
  }
  return distribution;
}

function filterFieldsByType(fields: StaticField[], typeName: string): StaticField[] {
  let result: StaticField[] = [];
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].getType().getName() === typeName) {
      result.push(fields[i]);
    }
  }
  return result;
}

function compareFieldTypes(field1: StaticField, field2: StaticField): boolean {
  return field1.getType().getName() === field2.getType().getName();
}

function getFieldTypeSignature(field: StaticField): string {
  let type = field.getType();
  let typeName = type.getName();
  let accessModifier: string = '';
  if (field.isPublic()) {
    accessModifier = '+';
  } else if (field.isPrivate()) {
    accessModifier = '-';
  } else if (field.isProtected()) {
    accessModifier = '#';
  }
  let readonly: string = field.isReadonly() ? ' (readonly)' : '';
  return `${accessModifier}${field.getName()}: ${typeName}${readonly}`;
}

function validateTypeConsistency(fields: StaticField[], expectedType: string): boolean {
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].getType().getName() !== expectedType) {
      return false;
    }
  }
  return true;
}

