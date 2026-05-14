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

export default function StaticFieldGetTypeTest(): void {
  describe('StaticFieldGetTypeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_0100
     * @tc.name testStaticFieldGetType001
     * @tc.desc Verify getType can be called without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass001();
      let field = cls.getStaticField("name");
      let type = field!.getType();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_0200
     * @tc.name testStaticFieldGetType002
     * @tc.desc Verify getType is called without passing any parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass001();
      let field = cls.getStaticField("name")!;
      let type = field.getType();
      expect(type !== null).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_0400
     * @tc.name testStaticFieldGetType004
     * @tc.desc Verify getType returns a Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass004();
      let field = cls.getStaticField("name");
      let type = field!.getType();
      expect(type instanceof ReflectClass).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_0500
     * @tc.name testStaticFieldGetType005
     * @tc.desc Verify primitive type static fields return corresponding Class objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass005();
      let numField = cls.getStaticField("num");
      let numType = numField!.getType();
      console.info("number type: " + numType.getName());
      let strField = cls.getStaticField("str");
      let strType = strField!.getType();
      console.info("string type: " + strType.getName());
      let boolField = cls.getStaticField("bool");
      let boolType = boolField!.getType();
      console.info("boolean type: " + boolType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_0600
     * @tc.name testStaticFieldGetType006
     * @tc.desc Verify array type static fields return array type Class objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass006();
      let arrField = cls.getStaticField("arr");
      let arrType = arrField!.getType();
      console.info("array type: " + arrType.getName());
      expect(arrType.getName().includes("Array")).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_0700
     * @tc.name testStaticFieldGetType007
     * @tc.desc Verify object type static fields return corresponding type Class objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass007();
      let personField = cls.getStaticField("person");
      let personType = personField!.getType();
      console.info("Person007 type: " + personType.getName());
      let objField = cls.getStaticField("obj");
      let objType = objField!.getType();
      console.info("object type: " + objType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_0800
     * @tc.name testStaticFieldGetType008
     * @tc.desc Verify function type static fields return function type Class objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass008();
      let handlerField = cls.getStaticField("handler");
      let handlerType = handlerField!.getType();
      console.info("function type: " + handlerType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_0900
     * @tc.name testStaticFieldGetType009
     * @tc.desc Verify union type static fields return type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass009();
      let unionField = cls.getStaticField("union");
      let unionType = unionField!.getType();
      console.info("union type: " + unionType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_1100
     * @tc.name testStaticFieldGetType011
     * @tc.desc Verify null value static fields return type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass011();
      let nullableField = cls.getStaticField("nullable");
      let nullableType = nullableField!.getType();
      console.info("nullable type: " + nullableType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_1200
     * @tc.name testStaticFieldGetType012
     * @tc.desc Verify undefined value static fields return type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass012();
      let optionalField = cls.getStaticField("optional");
      let optionalType = optionalField!.getType();
      console.info("optional type: " + optionalType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_1300
     * @tc.name testStaticFieldGetType013
     * @tc.desc Verify readonly static fields do not affect returned type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass013();
      let constField = cls.getStaticField("constant");
      let constType = constField!.getType();
      let varField = cls.getStaticField("variable");
      let varType = varField!.getType();
      expect(constType.getName()).assertEqual(varType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_1400
     * @tc.name testStaticFieldGetType014
     * @tc.desc Verify getType return value is Class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass001();
      let field = cls.getStaticField("name")!;
      let type = field.getType();
      expect(type instanceof ReflectClass).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_1500
     * @tc.name testStaticFieldGetType015
     * @tc.desc Verify static field type is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass001();
      let field = cls.getStaticField("name")!;
      let type = field.getType();
      expect(type !== null).assertEqual(true);
      expect(type !== undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_1600
     * @tc.name testStaticFieldGetType016
     * @tc.desc Verify returned Class object can call getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass001();
      let field = cls.getStaticField("name")!;
      let type = field.getType();
      let typeName = type.getName();
      expect(typeof typeName).assertEqual("string");
      expect(typeName.length > 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_1700
     * @tc.name testStaticFieldGetType017
     * @tc.desc Verify getType works for fields with different access modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass017();
      let pubField = cls.getStaticField("pubNum");
      expect(pubField!.getType().getName()).assertEqual("number");
      let privField = cls.getStaticField("privNum");
      expect(privField!.getType().getName()).assertEqual("number");
      let protField = cls.getStaticField("protNum");
      expect(protField!.getType().getName()).assertEqual("number");
      let interField = cls.getStaticField("interNum");
      expect(interField!.getType().getName()).assertEqual("number");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_1800
     * @tc.name testStaticFieldGetType018
     * @tc.desc Verify getType distinguishes numeric types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass018();
      let byteField = cls.getStaticField("byteVal");
      console.info("byte type: " + byteField!.getType().getName());
      let shortField = cls.getStaticField("shortVal");
      console.info("short type: " + shortField!.getType().getName());
      let intField = cls.getStaticField("intVal");
      console.info("int type: " + intField!.getType().getName());
      let longField = cls.getStaticField("longVal");
      console.info("long type: " + longField!.getType().getName());
      let floatField = cls.getStaticField("floatVal");
      console.info("float type: " + floatField!.getType().getName());
      let doubleField = cls.getStaticField("doubleVal");
      console.info("double type: " + doubleField!.getType().getName());
      let numberField = cls.getStaticField("numberVal");
      console.info("number type: " + numberField!.getType().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_1900
     * @tc.name testStaticFieldGetType019
     * @tc.desc Verify calling getType on null object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | null = null;
      try {
        field!.getType();
        expect().assertFail();
      } catch (error) {
        expect(error !== null).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_2000
     * @tc.name testStaticFieldGetType020
     * @tc.desc Verify calling getType on undefined object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | undefined;
      try {
        field!.getType();
        expect().assertFail();
      } catch (error) {
        expect(error !== null).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_2100
     * @tc.name testStaticFieldGetType021
     * @tc.desc Verify accessing a nonexistent static field before calling getType
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass021();
      let field = cls.getStaticField("nonexistent");
      if (field !== null) {
        let type = field.getType();
      } else {
        console.info("Field does not exist");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_2200
     * @tc.name testStaticFieldGetType022
     * @tc.desc Verify getType for public readonly static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass022();
      let field = cls.getStaticField("value");
      let type = field!.getType();
      expect(type.getName()).assertEqual("number");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_2300
     * @tc.name testStaticFieldGetType023
     * @tc.desc Verify getType for fields with different access levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass023();
      let privField = cls.getStaticField("privValue");
      let privType = privField!.getType();
      expect(privType.getName()).assertEqual("string");
      let protField = cls.getStaticField("protValue");
      let protType = protField!.getType();
      expect(protType.getName()).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_2400
     * @tc.name testStaticFieldGetType024
     * @tc.desc Verify combining getName and getType to get field and type names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass024();
      let field = cls.getStaticField("count");
      let fieldName = field!.getName();
      let typeName = field!.getType().getName();
      console.info(`Field ${fieldName} has type ${typeName}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_2500
     * @tc.name testStaticFieldGetType025
     * @tc.desc Verify combining getOwner and getType to get owner and type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass025();
      let field = cls.getStaticField("data");
      let owner = field!.getOwner();
      let type = field!.getType();
      console.info(`Field owner: ${owner.getName()}, field type: ${type.getName()}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_2600
     * @tc.name testStaticFieldGetType026
     * @tc.desc Verify combining getValue and getType to get value and type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass026();
      let field = cls.getStaticField("value");
      let value = field!.getValue();
      let type = field!.getType();
      console.info(`Value: ${value}, Type: ${type.getName()}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_2700
     * @tc.name testStaticFieldGetType027
     * @tc.desc Verify checking readonly field type with isReadonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass027();
      let constField = cls.getStaticField("constant");
      if (constField!.isReadonly()) {
        let type = constField!.getType();
        console.info(`Readonly field type: ${type.getName()}`);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_2800
     * @tc.name testStaticFieldGetType028
     * @tc.desc Verify getting types according to access levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
        let type = field.getType();
        console.info(`${accessLevel} ${field.getName()}: ${type.getName()}`);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_2900
     * @tc.name testStaticFieldGetType029
     * @tc.desc Verify getType is a synchronous method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass001();
      let field = cls.getStaticField("name")!;
      let type = field.getType();
      expect(type instanceof ReflectClass).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_3000
     * @tc.name testStaticFieldGetType030
     * @tc.desc Verify getType return value is not Promise type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass001();
      let field = cls.getStaticField("name")!;
      let result = field.getType();
      expect(result instanceof Promise).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_3100
     * @tc.name testStaticFieldGetType031
     * @tc.desc Verify collecting complete type information through reflection APIs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass031();
      let fields = cls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        let field = fields[i];
        let fieldName = field.getName();
        let typeName = field.getType().getName();
        console.info(`Field: ${fieldName}, Type: ${typeName}`);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_3200
     * @tc.name testStaticFieldGetType032
     * @tc.desc Verify using getType for runtime type checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass032();
      let countField = cls.getStaticField("count");
      expect(isNumericField(countField!)).assertEqual(true);
      let nameField = cls.getStaticField("name");
      expect(isNumericField(nameField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_3300
     * @tc.name testStaticFieldGetType033
     * @tc.desc Verify safe conversion based on field type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass033();
      let textField = cls.getStaticField("text");
      expect(getFieldValueAsString(textField!)).assertEqual("hello");
      let numField = cls.getStaticField("num");
      expect(getFieldValueAsString(numField!)).assertEqual("42");
      let flagField = cls.getStaticField("flag");
      expect(getFieldValueAsString(flagField!)).assertEqual("true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_3400
     * @tc.name testStaticFieldGetType034
     * @tc.desc Verify checking whether field type is compatible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass034();
      let idField = cls.getStaticField("identifier");
      expect(isTypeCompatible(idField!, "string")).assertEqual(true);
      let qtyField = cls.getStaticField("quantity");
      expect(isTypeCompatible(qtyField!, "number")).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_3600
     * @tc.name testStaticFieldGetType036
     * @tc.desc Verify any type static field type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass036();
      let field = cls.getStaticField("anyValue");
      let type = field!.getType();
      console.info("any type: " + type.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_3700
     * @tc.name testStaticFieldGetType037
     * @tc.desc Verify never type static field type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass037();
      let field = cls.getStaticField("neverValue");
      let type = field!.getType();
      console.info("never type: " + type.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_3800
     * @tc.name testStaticFieldGetType038
     * @tc.desc Verify unknown type static field type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass038();
      let field = cls.getStaticField("unknownValue");
      let type = field!.getType();
      console.info("unknown type: " + type.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_3900
     * @tc.name testStaticFieldGetType039
     * @tc.desc Verify enum type static field type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass039();
      let colorField = cls.getStaticField("favoriteColor");
      let colorType = colorField!.getType();
      console.info("enum type: " + colorType.getName());
      let colorsField = cls.getStaticField("colors");
      let colorsType = colorsField!.getType();
      console.info("enum array type: " + colorsType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_4000
     * @tc.name testStaticFieldGetType040
     * @tc.desc Verify interface type static field type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass040();
      let field = cls.getStaticField("user");
      let type = field!.getType();
      console.info("interface type: " + type.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_4100
     * @tc.name testStaticFieldGetType041
     * @tc.desc Verify class type static field type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass041();
      let instanceField = cls.getStaticField("instance");
      let instanceType = instanceField!.getType();
      console.info("instance type: " + instanceType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_4200
     * @tc.name testStaticFieldGetType042
     * @tc.desc Verify repeated getType calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass042();
      let field = cls.getStaticField("value");
      let type1 = field!.getType();
      let type2 = field!.getType();
      let type3 = field!.getType();
      expect(type1.getName()).assertEqual(type2.getName());
      expect(type2.getName()).assertEqual(type3.getName());
      expect(type1.getName()).assertEqual("number");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_4300
     * @tc.name testStaticFieldGetType043
     * @tc.desc Verify traversing many fields to get their types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass043();
      let fields = cls.getDeclaredStaticFields();
      let typeNames: string[] = [];
      for (let i = 0; i < fields.length; i++) {
        let type = fields[i].getType();
        typeNames.push(type.getName());
      }
      console.info("Type names: " + typeNames.join(", "));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_4400
     * @tc.name testStaticFieldGetType044
     * @tc.desc Verify StaticField getType and InstanceField getType behavior is consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass044();
      let staticField = cls.getStaticField("staticValue");
      let staticType = staticField!.getType();
      console.info("Static field type: " + staticType.getName());
      let instanceField = cls.getInstanceField("instanceValue");
      let instanceType = instanceField!.getType();
      console.info("Instance field type: " + instanceType.getName());
      expect(staticType.getName()).assertEqual(instanceType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_4500
     * @tc.name testStaticFieldGetType045
     * @tc.desc Verify helper logic for getting field type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass045();
      let countField = cls.getStaticField("count");
      expect(getFieldTypeName(countField!)).assertEqual("number");
      let nameField = cls.getStaticField("name");
      expect(getFieldTypeName(nameField!)).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_4600
     * @tc.name testStaticFieldGetType046
     * @tc.desc Verify checking whether a field is string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass046();
      let textField = cls.getStaticField("text");
      expect(isStringField(textField!)).assertEqual(true);
      let numField = cls.getStaticField("num");
      expect(isStringField(numField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_4700
     * @tc.name testStaticFieldGetType047
     * @tc.desc Verify checking whether a field is numeric type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass047();
      let countField = cls.getStaticField("count");
      expect(isNumericField(countField!)).assertEqual(true);
      let priceField = cls.getStaticField("price");
      expect(isNumericField(priceField!)).assertEqual(true);
      let nameField = cls.getStaticField("name");
      expect(isNumericField(nameField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_4800
     * @tc.name testStaticFieldGetType048
     * @tc.desc Verify checking whether a field is array or collection type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass048();
      let itemsField = cls.getStaticField("items");
      expect(isCollectionField(itemsField!)).assertEqual(true);
      let nameField = cls.getStaticField("name");
      expect(isCollectionField(nameField!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_4900
     * @tc.name testStaticFieldGetType049
     * @tc.desc Verify grouping fields by type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass049();
      let fields = cls.getDeclaredStaticFields();
      let groups = groupFieldsByType(fields);
      groups.forEach((fieldList, typeName): void => {
        console.info(`Type ${typeName}: ${fieldList.length} fields`);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_5000
     * @tc.name testStaticFieldGetType050
     * @tc.desc Verify using getType for data validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectConfig050();
      let keyField = cls.getStaticField("apiKey");
      expect(validateFieldValue(keyField!, 'new-key')).assertEqual(true);
      expect(validateFieldValue(keyField!, 123)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_5100
     * @tc.name testStaticFieldGetType051
     * @tc.desc Verify serializing fields based on field type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass051();
      let fields = cls.getDeclaredStaticFields();
      let json: string = '{';
      for (let i = 0; i < fields.length; i++) {
        let field = fields[i];
        if (i > 0) {
          json += ', ';
        }
        json += `"${field.getName()}": ${serializeField(field)}`;
      }
      json += '}';
      console.info(json);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_5200
     * @tc.name testStaticFieldGetType052
     * @tc.desc Verify generating field type documentation automatically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectAppConfig052();
      let doc = generateFieldTypesDoc(cls);
      console.info(doc);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_5300
     * @tc.name testStaticFieldGetType053
     * @tc.desc Verify mapping internal type names to friendly names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass053();
      let nameField = cls.getStaticField("name");
      expect(getFriendlyTypeName(nameField!)).assertEqual("string");
      let countField = cls.getStaticField("count");
      expect(getFriendlyTypeName(countField!)).assertEqual("integer");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_5400
     * @tc.name testStaticFieldGetType054
     * @tc.desc Verify processing fields dynamically based on type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass054();
      let fields = cls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        processFieldByType(fields[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_5500
     * @tc.name testStaticFieldGetType055
     * @tc.desc Verify type fields in inheritance relationship
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = reflectParent055();
      let parentField = parentCls.getStaticField("parentData");
      let parentType = parentField!.getType();
      let childCls = reflectChild055();
      let childField = childCls.getStaticField("childData");
      let childType = childField!.getType();
      expect(parentType.getName()).assertEqual(childType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_5700
     * @tc.name testStaticFieldGetType057
     * @tc.desc Verify union type static field type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectMyClass057();
      let unionField = cls.getStaticField("unionField");
      let unionType = unionField!.getType();
      console.info("Union type: " + unionType.getName());
      let nullableField = cls.getStaticField("nullableField");
      let nullableType = nullableField!.getType();
      console.info("Nullable type: " + nullableType.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_5800
     * @tc.name testStaticFieldGetType058
     * @tc.desc Verify type of data model fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectDataModel058();
      let field = cls.getStaticField('id');
      expect(field!.getType().getName()).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_5900
     * @tc.name testStaticFieldGetType059
     * @tc.desc Verify type of user model fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectUserModel059();
      let field = cls.getStaticField('username');
      expect(field!.getType().getName()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_6000
     * @tc.name testStaticFieldGetType060
     * @tc.desc Verify type of product model fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectProductModel060();
      let field = cls.getStaticField('price');
      expect(field!.getType().getName()).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_6100
     * @tc.name testStaticFieldGetType061
     * @tc.desc Verify type of order model fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectOrderModel061();
      let field = cls.getStaticField('status');
      expect(field!.getType().getName()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_6200
     * @tc.name testStaticFieldGetType062
     * @tc.desc Verify type of payment model fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectPaymentModel062();
      let field = cls.getStaticField('amount');
      expect(field!.getType().getName()).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_6300
     * @tc.name testStaticFieldGetType063
     * @tc.desc Verify type of log configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectLogConfig063();
      let field = cls.getStaticField('LOG_LEVEL');
      expect(field!.getType().getName()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_6400
     * @tc.name testStaticFieldGetType064
     * @tc.desc Verify type of auth configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectAuthConfig064();
      let field = cls.getStaticField('AUTH_EXPIRES');
      expect(field!.getType().getName()).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_6500
     * @tc.name testStaticFieldGetType065
     * @tc.desc Verify type of CORS configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectCorsConfig065();
      let field = cls.getStaticField('CORS_CREDENTIALS');
      expect(field!.getType().getName()).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_6600
     * @tc.name testStaticFieldGetType066
     * @tc.desc Verify type of pagination configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectPaginationConfig066();
      let field = cls.getStaticField('PER_PAGE_MAX');
      expect(field!.getType().getName()).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_6700
     * @tc.name testStaticFieldGetType067
     * @tc.desc Verify type of upload configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectUploadConfig067();
      let field = cls.getStaticField('UPLOAD_PATH');
      expect(field!.getType().getName()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_6800
     * @tc.name testStaticFieldGetType068
     * @tc.desc Verify type of encryption configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectEncryptionConfig068();
      let field = cls.getStaticField('ENCRYPT_KEY_LENGTH');
      expect(field!.getType().getName()).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_6900
     * @tc.name testStaticFieldGetType069
     * @tc.desc Verify type of localization configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectLocalizationConfig069();
      let field = cls.getStaticField('LOCALE_DEFAULT');
      expect(field!.getType().getName()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_7000
     * @tc.name testStaticFieldGetType070
     * @tc.desc Verify type of theme configuration fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectThemeConfig070();
      let field = cls.getStaticField('THEME_PRIMARY');
      expect(field!.getType().getName()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_7100
     * @tc.name testStaticFieldGetType071
     * @tc.desc Verify getTypeCategory helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectDataModel058();
      let idField: StaticField | null = cls.getStaticField('id');
      expect(getTypeCategory(idField!)).assertEqual('numeric');
      let nameField: StaticField | null = cls.getStaticField('name');
      expect(getTypeCategory(nameField!)).assertEqual('text');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_7200
     * @tc.name testStaticFieldGetType072
     * @tc.desc Verify countFieldsByType helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectUserModel059();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      let stringCount: number = countFieldsByType(fields, 'string');
      expect(stringCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_7300
     * @tc.name testStaticFieldGetType073
     * @tc.desc Verify getTypeDistribution helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectProductModel060();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      let dist: Record<string, number> = getTypeDistribution(fields);
      expect(dist['string']).assertEqual(2);
      expect(dist['number']).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_7400
     * @tc.name testStaticFieldGetType074
     * @tc.desc Verify filterFieldsByType helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectOrderModel061();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      let stringFields: StaticField[] = filterFieldsByType(fields, 'string');
      expect(stringFields.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_7500
     * @tc.name testStaticFieldGetType075
     * @tc.desc Verify compareFieldTypes helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectPaymentModel062();
      let field1: StaticField | null = cls.getStaticField('transactionId');
      let field2: StaticField | null = cls.getStaticField('currency');
      expect(compareFieldTypes(field1!, field2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_7600
     * @tc.name testStaticFieldGetType076
     * @tc.desc Verify getFieldTypeSignature helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectLogConfig063();
      let field: StaticField | null = cls.getStaticField('LOG_LEVEL');
      let sig: string = getFieldTypeSignature(field!);
      expect(sig.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_7700
     * @tc.name testStaticFieldGetType077
     * @tc.desc Verify validateTypeConsistency helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectAuthConfig064();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      expect(validateTypeConsistency(fields, 'string')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_7800
     * @tc.name testStaticFieldGetType078
     * @tc.desc Verify type consistency of all string fields in CORS config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldGetType078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = reflectCorsConfig065();
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      let stringFields: StaticField[] = filterFieldsByType(fields, 'string');
      expect(validateTypeConsistency(stringFields, 'string')).assertEqual(true);
    });
  });
}