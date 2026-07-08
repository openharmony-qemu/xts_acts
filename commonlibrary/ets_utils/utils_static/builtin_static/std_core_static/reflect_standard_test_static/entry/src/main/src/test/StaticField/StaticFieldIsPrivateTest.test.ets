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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';
import { FieldValue, StaticField, ReflectClass, createReflectClass, PLACEHOLDER_PASSWORD, PLACEHOLDER_TOKEN, PLACEHOLDER_API_KEY, PLACEHOLDER_SSN, PLACEHOLDER_CARD_NUMBER, PLACEHOLDER_CVV, PLACEHOLDER_USERNAME, PLACEHOLDER_PATIENT_NAME, PLACEHOLDER_DIAGNOSIS } from '../Util.test';

class IntegrationIsPrivateClass {
  private static hiddenField: string = 'secret';
  public static visibleField: string = 'public';
}

class MyClass001 {
  private static name: string = 'test';
}

class MyClass004 {
  private static secret: string = 'hidden';
  private static value: int = 100;
  private static data: string[] = [];
}

class MyClass005 {
  public static name: string = 'test';
  public static count: int = 0;
}

class MyClass006 {
  protected static config: string = 'settings';
  protected static buffer: string[] = [];
}

class MyClass007 {
  public static internalField: string = 'internal';
}

class MyClass009 {
  private static priv: int = 1;
  public static pub: int = 2;
  protected static prot: int = 3;
}

class MyClass012 {
  private static num: int = 100;
  private static str: string = 'test';
  private static bool: boolean = true;
  private static arr: int[] = [1, 2, 3];
  private static obj: Record<string, string> = { 'key': 'value' };
  private static charField: char = c'A';
}

class MyClass015 {
  private static name: string = 'test';
}

class MyClass016 {
  private static readonly value: int = 100;
}

class MyClass017 {
  private static count: int = 0;
}

class MyClass018 {
  private static readonly constant: double = 3.14;
}

class MyClass019 {
  private static priv: string = 'private';
  public static pub: string = 'public';
}

class MyClass020 {
  private static priv: string = 'private';
  protected static prot: string = 'protected';
}

class MyClass021 {
  private static readonly privReadonly: string = 'value';
  public static readonly pubReadonly: string = 'value';
}

class MyClass022 {
  private static secret: string = 'hidden';
}

class MyClass023 {
  private static secret: string = 'hidden';
}

class MyClass024 {
  private static secret: string = 'hidden';
}

class MyClass025 {
  private static counter: int = 0;
}

class Config028 {
  public static APP_NAME: string = 'MyApp';
  private static API_KEY: string = PLACEHOLDER_API_KEY;
  protected static DEBUG_MODE: boolean = false;
  private static PASSWORD: string = PLACEHOLDER_PASSWORD;
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
  public constant: string = 'implemented';
  private static internalConstant: string = 'internal';
}

class GenericClass032 {
  public static defaultValue: string = '';
  private static cache: string[] = [];
  protected static metadata: string = '';
}

class MyClass033 {
  private static handler: () => void = (): void => {
  };
  public static callback: () => void = (): void => {
  };
}

class InnerClass034 {
}

class MyClass034 {
  private static inner: string = 'InnerClass034';
  public static outer: string = 'Object';
}

class MyClass035 {
  public static pub: int = 1;
  private static priv: int = 2;
  protected static prot: int = 3;
}

class MyClass036 {
  private static value: int = 100;
}

class MyClass037 {
  private static field1: int = 1;
  public static field2: int = 2;
  private static field3: int = 3;
  public static field4: int = 4;
  private static field5: int = 5;
}

class MyClass038 {
  private static staticPrivate: string = 'static';
  private instancePrivate: string = 'instance';
}

class MyClass039 {
  public static a: int = 1;
  private static b: int = 2;
  public static c: int = 3;
  private static d: int = 4;
}

class MyClass040 {
  public static a: int = 1;
  private static b: int = 2;
}

class MyClass041 {
  public static pub: int = 1;
  private static priv: int = 2;
  protected static prot: int = 3;
  public static inter: int = 4;
}

class MyClass042 {
  public static apiKey: string = 'public_key';
  private static secretKey: string = PLACEHOLDER_API_KEY;
  private static internalId: string = 'internal-123';
}

class MyClass043 {
  public static displayName: string = 'User';
  public static email: string = 'user@example.com';
  private static password: string = PLACEHOLDER_PASSWORD;
  private static authToken: string = PLACEHOLDER_TOKEN;
  private static ssn: string = PLACEHOLDER_SSN;
}

class MyClass044 {
  private static privateData: string = 'sensitive';
  public static publicData: string = 'public';
}

class MyClass045 {
  private static instance: MyClass045 | undefined = undefined;
  private static count: int = 0;
  public static readonly VERSION: string = '1.0.0';
}

class MyClass046 {
  public static APP_NAME: string = 'MyApp';
  public static VERSION: string = '1.0.0';
  public static ENVIRONMENT: string = 'production';
  private static DB_PASSWORD: string = PLACEHOLDER_PASSWORD;
  private static API_SECRET: string = PLACEHOLDER_API_KEY;
  private static ENCRYPTION_KEY: string = PLACEHOLDER_TOKEN;
}

class MyClass047 {
  public static LOG_LEVEL: string = 'INFO';
  private static buffer: string[] = [];
  private static maxSize: int = 1000;
}

class MyClass048 {
  public static readonly MAX_SIZE: int = 100;
  public static hitRate: double = 0.0;
  private static storage: Map<string, string> = new Map<string, string>();
  private static accessCount: int = 0;
  private static hitCount: int = 0;
}

class MyClass049 {
  public static API_ENDPOINT: string = 'https://api.example.com';
  private static apiToken: string = PLACEHOLDER_TOKEN;
  public static passwordHash: string = PLACEHOLDER_PASSWORD;
  private static encryptionKey: string = PLACEHOLDER_API_KEY;
}

class MyClass050 {
  private static CREDENTIALS_USERNAME: string = PLACEHOLDER_USERNAME;
  private static CREDENTIALS_PASSWORD: string = PLACEHOLDER_PASSWORD;
  private static CREDENTIALS_TOKEN: string = PLACEHOLDER_TOKEN;
  public static CREDENTIALS_EXPIRY: int = 3600;
}

class MyClass051 {
  private static SESSION_ID: string = PLACEHOLDER_TOKEN;
  private static SESSION_KEY: string = PLACEHOLDER_API_KEY;
  private static SESSION_EXPIRY: int = 1800;
  public static SESSION_TIMEOUT: int = 3600;
}

class MyClass052 {
  private static PAYMENT_CARD_NUMBER: string = PLACEHOLDER_CARD_NUMBER;
  private static PAYMENT_CVV: string = PLACEHOLDER_CVV;
  private static PAYMENT_EXPIRY: string = '12/28';
  public static PAYMENT_GATEWAY: string = 'https://pay.example.com';
}

class MyClass053 {
  private static HEALTH_RECORD_ID: string = PLACEHOLDER_SSN;
  private static HEALTH_PATIENT_NAME: string = PLACEHOLDER_PATIENT_NAME;
  private static HEALTH_DIAGNOSIS: string = PLACEHOLDER_DIAGNOSIS;
  public static HEALTH_FACILITY: string = 'General Hospital';
}

class MyClass054 {
  private static INTERNAL_CONFIG_PATH: string = '/etc/app/config';
  private static INTERNAL_LOG_PATH: string = '/var/log/app';
  private static INTERNAL_TEMP_PATH: string = '/tmp/app';
  public static CONFIG_VERSION: string = '2.0';
}

class MyClass055 {
  private static privateCounter: int = 0;
  private static privateThreshold: int = 100;
  private static privateLimit: int = 1000;
  public static publicMax: int = 10000;
}

class MyClass056 {
  private static readonly PRIVATE_CONSTANT: int = 42;
  private static readonly PRIVATE_SECRET: string = PLACEHOLDER_API_KEY;
  public static readonly PUBLIC_CONSTANT: int = 100;
}

class MyClass057 {
  private static fieldA: string = 'a';
  private static fieldB: string = 'b';
  private static fieldC: string = 'c';
  private static fieldD: string = 'd';
  private static fieldE: string = 'e';
  public static fieldF: string = 'f';
}

class MyClass058 {
  private static privateStr: string = 'private';
  private static privateNum: int = 999;
  private static privateBool: boolean = true;
  private static privateArr: string[] = ['a', 'b'];
  private static privateObj: Record<string, string> = { 'key': 'val' };
  public static publicStr: string = 'public';
}

class MyClass059 {
  private static secretKey: string = PLACEHOLDER_API_KEY;
  private static internalId: int = 100;
  public static publicName: string = 'public';
}

class MyClass060 {
  private static readonly CONSTANT: int = 42;
  private static cache: string[] = [];
  public static version: string = '1.0';
}

class MyClass061 {
  private static handler: () => void = (): void => {
  };
  public static callback: () => void = (): void => {
  };
}

class MyClass062 {
  private static inner: string = 'InnerClass062';
  public static outer: string = 'Object';
}

class MyClass063 {
  private static a: int = 1;
  private static b: int = 2;
  private static c: int = 3;
}

class MyClass064 {
  private static password: string = PLACEHOLDER_PASSWORD;
  private static apiKey: string = PLACEHOLDER_API_KEY;
  private static authToken: string = PLACEHOLDER_TOKEN;
  public static appName: string = 'MyApp';
}

function getAccessLevel(field: StaticField): string {
  if (field.isPublic()) {
    return 'public';
  } else if (field.isPrivate()) {
    return 'private';
  } else if (field.isProtected()) {
    return 'protected';
  } else if (field.isInternal()) {
    return 'internal';
  }
  return '';
}

function exportPublicConfig(cls: ReflectClass): Record<string, string | number | boolean | null> {
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  let config: Record<string, string | number | boolean | null> = {};
  for (let i = 0; i < fields.length; i++) {
    let field: StaticField = fields[i];
    if (!field.isPrivate()) {
      config[field.getName()] = field.getValue() as string | number | boolean | null;
    }
  }
  return config;
}

function auditSensitiveFields(cls: ReflectClass): void {
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  let sensitivePatterns: string[] = ['password', 'secret', 'token', 'key', 'auth'];
  for (let i = 0; i < fields.length; i++) {
    let field: StaticField = fields[i];
    let fieldName = field.getName().toLowerCase();
    for (let j = 0; j < sensitivePatterns.length; j++) {
      if (fieldName.indexOf(sensitivePatterns[j]) !== -1 && !field.isPrivate()) {
        throw new TypeError('Sensitive field [' + field.getName() + '] is not private');
      }
    }
  }
}

function getPrivateFieldNames(cls: ReflectClass): string[] {
  let names: string[] = [];
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isPrivate()) {
      names.push(fields[i].getName());
    }
  }
  return names;
}

function getNonPrivateFieldNames(cls: ReflectClass): string[] {
  let names: string[] = [];
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (!fields[i].isPrivate()) {
      names.push(fields[i].getName());
    }
  }
  return names;
}

function countPrivateFields(cls: ReflectClass): number {
  let count: int = 0;
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isPrivate()) {
      count++;
    }
  }
  return count;
}

function hasPrivateFields(cls: ReflectClass): boolean {
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isPrivate()) {
      return true;
    }
  }
  return false;
}

function filterPrivateFields(fields: StaticField[]): StaticField[] {
  const result: StaticField[] = [];
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isPrivate()) {
      result.push(fields[i]);
    }
  }
  return result;
}

function maskPrivateFieldValues(cls: ReflectClass): Record<string, string> {
  let masked: Record<string, string> = {};
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    let field: StaticField = fields[i];
    if (field.isPrivate()) {
      masked[field.getName()] = '***MASKED***';
    } else {
      masked[field.getName()] = `${field.getValue()}`;
    }
  }
  return masked;
}

function validatePrivateFieldEncapsulation(cls: ReflectClass): boolean {
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    let field: StaticField = fields[i];
    let name = field.getName().toLowerCase();
    if ((name.includes('password') || name.includes('secret') || name.includes('token')) && !field.isPrivate()) {
      return false;
    }
  }
  return true;
}

function getPrivateFieldValueMap(cls: ReflectClass): Map<string, string | number | boolean | null> {
  let map: Map<string, string | number | boolean | null> = new Map<string, string | number | boolean | null>();
  let fields: StaticField[] = cls.getDeclaredStaticFields();
  for (let i = 0; i < fields.length; i++) {
    if (fields[i].isPrivate()) {
      map.set(fields[i].getName(), fields[i].getValue() as string | number | boolean | null);
    }
  }
  return map;
}

export function StaticFieldIsPrivateTest(): void {
  describe('StaticFieldIsPrivateTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_0100
     * @tc.name testStaticFieldIsPrivate001
     * @tc.desc Verify isPrivate does not require any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass001');
      cls.addStaticField('name', createReflectClass('string'), 'test', false, true, false, false);
      let field: StaticField | null = cls.getStaticField('name');
      const result = field!.isPrivate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_0400
     * @tc.name testStaticFieldIsPrivate004
     * @tc.desc Verify isPrivate returns true for private static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass004');
      cls.addStaticField('secret', createReflectClass('string'), 'hidden', false, true, false, false);
      cls.addStaticField('value', createReflectClass('int'), 100, false, true, false, false);
      cls.addStaticField('data', createReflectClass('string[]'), '', false, true, false, false);
      let field1: StaticField | null = cls.getStaticField('secret');
      expect(field1!.isPrivate()).assertEqual(true);
      let field2: StaticField | null = cls.getStaticField('value');
      expect(field2!.isPrivate()).assertEqual(true);
      let field3: StaticField | null = cls.getStaticField('data');
      expect(field3!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_0500
     * @tc.name testStaticFieldIsPrivate005
     * @tc.desc Verify isPrivate returns false for public static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass005');
      cls.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      cls.addStaticField('count', createReflectClass('int'), 0, true, false, false, false);
      let field1: StaticField | null = cls.getStaticField('name');
      expect(field1!.isPrivate()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('count');
      expect(field2!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_0600
     * @tc.name testStaticFieldIsPrivate006
     * @tc.desc Verify isPrivate returns false for protected static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass006');
      cls.addStaticField('config', createReflectClass('string'), 'settings', false, false, true, false);
      cls.addStaticField('buffer', createReflectClass('string[]'), '', false, false, true, false);
      let field1: StaticField | null = cls.getStaticField('config');
      expect(field1!.isPrivate()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('buffer');
      expect(field2!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_0700
     * @tc.name testStaticFieldIsPrivate007
     * @tc.desc Verify isPrivate returns false for public static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass007');
      cls.addStaticField('internalField', createReflectClass('string'), 'internal', true, false, false, false);
      let field: StaticField | null = cls.getStaticField('internalField');
      expect(field!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_0800
     * @tc.name testStaticFieldIsPrivate008
     * @tc.desc Verify isPrivate return value is strictly boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass004');
      cls.addStaticField('secret', createReflectClass('string'), 'hidden', false, true, false, false);
      let field: StaticField | null = cls.getStaticField('secret');
      const result = field!.isPrivate();
      expect(typeof result).assertEqual('boolean');
      expect(result).assertEqual(true);
      const cls2: ReflectClass = createReflectClass('MyClass005');
      cls2.addStaticField('name', createReflectClass('string'), 'test', true, false, false, false);
      let field2: StaticField | null = cls2.getStaticField('name');
      const result2 = field2!.isPrivate();
      expect(typeof result2).assertEqual('boolean');
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_0900
     * @tc.name testStaticFieldIsPrivate009
     * @tc.desc Verify isPrivate is mutually exclusive with isPublic and isProtected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass009');
      cls.addStaticField('priv', createReflectClass('int'), 1, false, true, false, false);
      cls.addStaticField('pub', createReflectClass('int'), 2, true, false, false, false);
      cls.addStaticField('prot', createReflectClass('int'), 3, false, false, true, false);
      let field1: StaticField | null = cls.getStaticField('priv');
      expect(field1!.isPrivate()).assertEqual(true);
      expect(field1!.isPublic()).assertEqual(false);
      expect(field1!.isProtected()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('pub');
      expect(field2!.isPrivate()).assertEqual(false);
      expect(field2!.isPublic()).assertEqual(true);
      let field3: StaticField | null = cls.getStaticField('prot');
      expect(field3!.isPrivate()).assertEqual(false);
      expect(field3!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_1000
     * @tc.name testStaticFieldIsPrivate010
     * @tc.desc Verify typeof isPrivate return value is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass004');
      cls.addStaticField('secret', createReflectClass('string'), 'hidden', false, true, false, false);
      let field: StaticField | null = cls.getStaticField('secret');
      const result = field!.isPrivate();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_1100
     * @tc.name testStaticFieldIsPrivate011
     * @tc.desc Verify isPrivate return value can be used as boolean condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass009');
      cls.addStaticField('priv', createReflectClass('int'), 1, false, true, false, false);
      let field: StaticField | null = cls.getStaticField('priv');
      expect(field!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_1200
     * @tc.name testStaticFieldIsPrivate012
     * @tc.desc Verify isPrivate returns true for private fields of various types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass012');
      cls.addStaticField('num', createReflectClass('int'), 100, false, true, false, false);
      cls.addStaticField('str', createReflectClass('string'), 'test', false, true, false, false);
      cls.addStaticField('bool', createReflectClass('boolean'), true, false, true, false, false);
      cls.addStaticField('arr', createReflectClass('int[]'), [] as FieldValue[], false, true, false, false);
      cls.addStaticField('obj', createReflectClass('Object'), {} as Record<string, FieldValue>, false, true, false, false);
      cls.addStaticField('charField', createReflectClass('char'), c'A' as FieldValue, false, true, false, false);
      expect(cls.getStaticField('num')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('str')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('bool')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('arr')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('obj')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('charField')!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_1300
     * @tc.name testStaticFieldIsPrivate013
     * @tc.desc Verify calling isPrivate on null object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | null = null;
      try {
        field!.isPrivate();
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_1400
     * @tc.name testStaticFieldIsPrivate014
     * @tc.desc Verify calling isPrivate on undefined object throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | undefined = undefined;
      try {
        field!.isPrivate();
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_1500
     * @tc.name testStaticFieldIsPrivate015
     * @tc.desc Verify isPrivate on non-existent static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass015');
      cls.addStaticField('name', createReflectClass('string'), 'test', false, true, false, false);
      let field: StaticField | null = cls.getStaticField('nonexistent');
      if (field !== null) {
        const result: boolean = field.isPrivate();
      } else {
        console.info('Field does not exist');
      }
      expect(field).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_1600
     * @tc.name testStaticFieldIsPrivate016
     * @tc.desc Verify isPrivate with private readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass016');
      cls.addStaticField('value', createReflectClass('int'), 100, false, true, false, true);
      let field: StaticField | null = cls.getStaticField('value');
      expect(field!.isPrivate()).assertEqual(true);
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_1700
     * @tc.name testStaticFieldIsPrivate017
     * @tc.desc Verify isPrivate with private static field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass017');
      cls.addStaticField('count', createReflectClass('int'), 0, false, true, false, false);
      let field: StaticField | null = cls.getStaticField('count');
      expect(field!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_1800
     * @tc.name testStaticFieldIsPrivate018
     * @tc.desc Verify isPrivate with private const field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass018');
      cls.addStaticField('constant', createReflectClass('double'), 3.14, false, true, false, true);
      let field: StaticField | null = cls.getStaticField('constant');
      expect(field!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_1900
     * @tc.name testStaticFieldIsPrivate019
     * @tc.desc Verify isPrivate and isPublic are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass019');
      cls.addStaticField('priv', createReflectClass('string'), 'private', false, true, false, false);
      cls.addStaticField('pub', createReflectClass('string'), 'public', true, false, false, false);
      let field1: StaticField | null = cls.getStaticField('priv');
      expect(field1!.isPrivate()).assertEqual(true);
      expect(field1!.isPublic()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('pub');
      expect(field2!.isPrivate()).assertEqual(false);
      expect(field2!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_2000
     * @tc.name testStaticFieldIsPrivate020
     * @tc.desc Verify isPrivate and isProtected are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass020');
      cls.addStaticField('priv', createReflectClass('string'), 'private', false, true, false, false);
      cls.addStaticField('prot', createReflectClass('string'), 'protected', false, false, true, false);
      let field1: StaticField | null = cls.getStaticField('priv');
      expect(field1!.isPrivate()).assertEqual(true);
      expect(field1!.isProtected()).assertEqual(false);
      let field2: StaticField | null = cls.getStaticField('prot');
      expect(field2!.isPrivate()).assertEqual(false);
      expect(field2!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_2100
     * @tc.name testStaticFieldIsPrivate021
     * @tc.desc Verify isPrivate combined with isReadonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass021');
      cls.addStaticField('privReadonly', createReflectClass('string'), 'value', false, true, false, true);
      cls.addStaticField('pubReadonly', createReflectClass('string'), 'value', true, false, false, true);
      let field1: StaticField | null = cls.getStaticField('privReadonly');
      expect(field1!.isPrivate() && field1!.isReadonly()).assertEqual(true);
      let field2: StaticField | null = cls.getStaticField('pubReadonly');
      expect(field2!.isPrivate() || field2!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_2200
     * @tc.name testStaticFieldIsPrivate022
     * @tc.desc Verify getting type information of private field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass022');
      cls.addStaticField('secret', createReflectClass('string'), 'hidden', false, true, false, false);
      let field: StaticField | null = cls.getStaticField('secret');
      expect(field!.isPrivate()).assertEqual(true);
      let fieldType: ReflectClass = field!.getType();
      expect(fieldType.getName()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_2300
     * @tc.name testStaticFieldIsPrivate023
     * @tc.desc Verify isPrivate with field that has mixed access modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass023');
      cls.addStaticField('secret', createReflectClass('string'), 'hidden', false, true, false, false);
      let field: StaticField | null = cls.getStaticField('secret');
      expect(field!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_2400
     * @tc.name testStaticFieldIsPrivate024
     * @tc.desc Verify isPrivate with field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass024');
      cls.addStaticField('secret', createReflectClass('string'), 'hidden', false, true, false, false);
      let field: StaticField | null = cls.getStaticField('secret');
      expect(field!.isPrivate()).assertEqual(true);
      let value: string | number | boolean | null = field!.getValue() as string | number | boolean | null;
      expect(value).assertEqual('hidden');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_2500
     * @tc.name testStaticFieldIsPrivate025
     * @tc.desc Verify isPrivate with field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass025');
      cls.addStaticField('counter', createReflectClass('int'), 0, false, true, false, false);
      let field: StaticField | null = cls.getStaticField('counter');
      expect(field!.isPrivate()).assertEqual(true);
      let fieldName: string = field!.getName();
      expect(fieldName).assertEqual('counter');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_2600
     * @tc.name testStaticFieldIsPrivate026
     * @tc.desc Verify isPrivate with field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass026');
      cls.addStaticField('name', createReflectClass('string'), 'test', false, true, false, false);
      let field: StaticField | null = cls.getStaticField('name');
      expect(field!.isPrivate()).assertEqual(true);
      let fieldName: string = field!.getName();
      expect(fieldName).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_2700
     * @tc.name testStaticFieldIsPrivate027
     * @tc.desc Verify isPrivate with field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass027');
      cls.addStaticField('name', createReflectClass('string'), 'test', false, true, false, false);
      let field: StaticField | null = cls.getStaticField('name');
      expect(field!.isPrivate()).assertEqual(true);
      let value: string | number | boolean | null = field!.getValue() as string | number | boolean | null;
      expect(value).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_2800
     * @tc.name testStaticFieldIsPrivate028
     * @tc.desc Verify isPrivate with config class fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('Config028');
      cls.addStaticField('APP_NAME', createReflectClass('string'), 'MyApp', true, false, false, false);
      cls.addStaticField('API_KEY', createReflectClass('string'), PLACEHOLDER_API_KEY, false, true, false, false);
      cls.addStaticField('DEBUG_MODE', createReflectClass('boolean'), false, false, false, true, false);
      cls.addStaticField('PASSWORD', createReflectClass('string'), PLACEHOLDER_PASSWORD, false, true, false, false);
      cls.addStaticField('LOG_LEVEL', createReflectClass('string'), 'info', true, false, false, false);
      let appNameField: StaticField | null = cls.getStaticField('APP_NAME');
      expect(appNameField!.isPrivate()).assertEqual(false);
      let apiKeyField: StaticField | null = cls.getStaticField('API_KEY');
      expect(apiKeyField!.isPrivate()).assertEqual(true);
      let passwordField: StaticField | null = cls.getStaticField('PASSWORD');
      expect(passwordField!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_2900
     * @tc.name testStaticFieldIsPrivate029
     * @tc.desc Verify isPrivate with multiple access modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass029');
      cls.addStaticField('publicField', createReflectClass('string'), 'public', true, false, false, false);
      cls.addStaticField('privateField', createReflectClass('string'), 'private', false, true, false, false);
      cls.addStaticField('protectedField', createReflectClass('string'), 'protected', false, false, true, false);
      let pubField: StaticField | null = cls.getStaticField('publicField');
      expect(pubField!.isPrivate()).assertEqual(false);
      let privField: StaticField | null = cls.getStaticField('privateField');
      expect(privField!.isPrivate()).assertEqual(true);
      let protField: StaticField | null = cls.getStaticField('protectedField');
      expect(protField!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_3000
     * @tc.name testStaticFieldIsPrivate030
     * @tc.desc Verify isPrivate with inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('Child030');
      cls.addStaticField('childPublic', createReflectClass('string'), 'child public', true, false, false, false);
      cls.addStaticField('childPrivate', createReflectClass('string'), 'child private', false, true, false, false);
      let childPubField: StaticField | null = cls.getStaticField('childPublic');
      expect(childPubField!.isPrivate()).assertEqual(false);
      let childPrivField: StaticField | null = cls.getStaticField('childPrivate');
      expect(childPrivField!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_3100
     * @tc.name testStaticFieldIsPrivate031
     * @tc.desc Verify isPrivate with interface implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('Impl031');
      cls.addStaticField('constant', createReflectClass('string'), 'implemented', true, false, false, false);
      cls.addStaticField('internalConstant', createReflectClass('string'), 'internal', false, true, false, false);
      let field: StaticField | null = cls.getStaticField('constant');
      expect(field!.isPrivate()).assertEqual(false);
      let internalField: StaticField | null = cls.getStaticField('internalConstant');
      expect(internalField!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_3200
     * @tc.name testStaticFieldIsPrivate032
     * @tc.desc Verify isPrivate with generic class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('GenericClass032');
      cls.addStaticField('defaultValue', createReflectClass('string'), '', true, false, false, false);
      cls.addStaticField('cache', createReflectClass('string[]'), '', false, true, false, false);
      cls.addStaticField('metadata', createReflectClass('string'), '', false, false, true, false);
      let field: StaticField | null = cls.getStaticField('defaultValue');
      expect(field!.isPrivate()).assertEqual(false);
      let cacheField: StaticField | null = cls.getStaticField('cache');
      expect(cacheField!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_3300
     * @tc.name testStaticFieldIsPrivate033
     * @tc.desc Verify isPrivate with function type fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass033');
      cls.addStaticField('handler', createReflectClass('function'), '', false, true, false, false);
      cls.addStaticField('callback', createReflectClass('function'), '', true, false, false, false);
      let handlerField: StaticField | null = cls.getStaticField('handler');
      expect(handlerField!.isPrivate()).assertEqual(true);
      let callbackField: StaticField | null = cls.getStaticField('callback');
      expect(callbackField!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_3400
     * @tc.name testStaticFieldIsPrivate034
     * @tc.desc Verify isPrivate with class type fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass034');
      cls.addStaticField('inner', createReflectClass('string'), 'InnerClass034', false, true, false, false);
      cls.addStaticField('outer', createReflectClass('string'), 'Object', true, false, false, false);
      let innerField: StaticField | null = cls.getStaticField('inner');
      expect(innerField!.isPrivate()).assertEqual(true);
      let outerField: StaticField | null = cls.getStaticField('outer');
      expect(outerField!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_3500
     * @tc.name testStaticFieldIsPrivate035
     * @tc.desc Verify isPrivate with numeric fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass035');
      cls.addStaticField('pub', createReflectClass('int'), 1, true, false, false, false);
      cls.addStaticField('priv', createReflectClass('int'), 2, false, true, false, false);
      cls.addStaticField('prot', createReflectClass('int'), 3, false, false, true, false);
      let pubField: StaticField | null = cls.getStaticField('pub');
      expect(pubField!.isPrivate()).assertEqual(false);
      let privField: StaticField | null = cls.getStaticField('priv');
      expect(privField!.isPrivate()).assertEqual(true);
      let protField: StaticField | null = cls.getStaticField('prot');
      expect(protField!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_3600
     * @tc.name testStaticFieldIsPrivate036
     * @tc.desc Verify isPrivate with single field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass036');
      cls.addStaticField('value', createReflectClass('int'), 100, false, true, false, false);
      let field: StaticField | null = cls.getStaticField('value');
      expect(field!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_3700
     * @tc.name testStaticFieldIsPrivate037
     * @tc.desc Verify isPrivate with mixed fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass037');
      cls.addStaticField('field1', createReflectClass('int'), 1, false, true, false, false);
      cls.addStaticField('field2', createReflectClass('int'), 2, true, false, false, false);
      cls.addStaticField('field3', createReflectClass('int'), 3, false, true, false, false);
      cls.addStaticField('field4', createReflectClass('int'), 4, true, false, false, false);
      cls.addStaticField('field5', createReflectClass('int'), 5, false, true, false, false);
      expect(cls.getStaticField('field1')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('field2')!.isPrivate()).assertEqual(false);
      expect(cls.getStaticField('field3')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('field4')!.isPrivate()).assertEqual(false);
      expect(cls.getStaticField('field5')!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_3800
     * @tc.name testStaticFieldIsPrivate038
     * @tc.desc Verify isPrivate with static vs instance fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass038');
      cls.addStaticField('staticPrivate', createReflectClass('string'), 'static', false, true, false, false);
      let field: StaticField | null = cls.getStaticField('staticPrivate');
      expect(field!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_3900
     * @tc.name testStaticFieldIsPrivate039
     * @tc.desc Verify isPrivate with mixed access fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass039');
      cls.addStaticField('a', createReflectClass('int'), 1, true, false, false, false);
      cls.addStaticField('b', createReflectClass('int'), 2, false, true, false, false);
      cls.addStaticField('c', createReflectClass('int'), 3, true, false, false, false);
      cls.addStaticField('d', createReflectClass('int'), 4, false, true, false, false);
      expect(cls.getStaticField('a')!.isPrivate()).assertEqual(false);
      expect(cls.getStaticField('b')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('c')!.isPrivate()).assertEqual(false);
      expect(cls.getStaticField('d')!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_4000
     * @tc.name testStaticFieldIsPrivate040
     * @tc.desc Verify isPrivate with mixed access fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass040');
      cls.addStaticField('a', createReflectClass('int'), 1, true, false, false, false);
      cls.addStaticField('b', createReflectClass('int'), 2, false, true, false, false);
      expect(cls.getStaticField('a')!.isPrivate()).assertEqual(false);
      expect(cls.getStaticField('b')!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_4100
     * @tc.name testStaticFieldIsPrivate041
     * @tc.desc Verify isPrivate with all access modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass041');
      cls.addStaticField('pub', createReflectClass('int'), 1, true, false, false, false);
      cls.addStaticField('priv', createReflectClass('int'), 2, false, true, false, false);
      cls.addStaticField('prot', createReflectClass('int'), 3, false, false, true, false);
      cls.addInternalStaticField('inter', createReflectClass('int'), 4, false);
      expect(getAccessLevel(cls.getStaticField('pub')!)).assertEqual('public');
      expect(getAccessLevel(cls.getStaticField('priv')!)).assertEqual('private');
      expect(getAccessLevel(cls.getStaticField('prot')!)).assertEqual('protected');
      expect(getAccessLevel(cls.getStaticField('inter')!)).assertEqual('internal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_4200
     * @tc.name testStaticFieldIsPrivate042
     * @tc.desc Verify encapsulation of private fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass042');
      cls.addStaticField('apiKey', createReflectClass('string'), 'public_key', true, false, false, false);
      cls.addStaticField('secretKey', createReflectClass('string'), PLACEHOLDER_API_KEY, false, true, false, false);
      cls.addStaticField('internalId', createReflectClass('string'), 'internal-123', false, true, false, false);
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        let field: StaticField = fields[i];
      }
      expect(cls.getStaticField('apiKey')!.isPrivate()).assertEqual(false);
      expect(cls.getStaticField('secretKey')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('internalId')!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_4300
     * @tc.name testStaticFieldIsPrivate043
     * @tc.desc Verify sensitive data should be marked as private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass043');
      cls.addStaticField('displayName', createReflectClass('string'), 'User', true, false, false, false);
      cls.addStaticField('email', createReflectClass('string'), 'user@example.com', true, false, false, false);
      cls.addStaticField('password', createReflectClass('string'), 'secret', false, true, false, false);
      cls.addStaticField('authToken', createReflectClass('string'), 'token', false, true, false, false);
      cls.addStaticField('ssn', createReflectClass('string'), PLACEHOLDER_SSN, false, true, false, false);
      let displayField: StaticField | null = cls.getStaticField('displayName');
      expect(displayField!.isPrivate()).assertEqual(false);
      let emailField: StaticField | null = cls.getStaticField('email');
      expect(emailField!.isPrivate()).assertEqual(false);
      let passwordField: StaticField | null = cls.getStaticField('password');
      expect(passwordField!.isPrivate()).assertEqual(true);
      let tokenField: StaticField | null = cls.getStaticField('authToken');
      expect(tokenField!.isPrivate()).assertEqual(true);
      let ssnField: StaticField | null = cls.getStaticField('ssn');
      expect(ssnField!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_4400
     * @tc.name testStaticFieldIsPrivate044
     * @tc.desc Verify reflection API can access private fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass044');
      cls.addStaticField('privateData', createReflectClass('string'), 'sensitive', false, true, false, false);
      cls.addStaticField('publicData', createReflectClass('string'), 'public', true, false, false, false);
      let privateField: StaticField | null = cls.getStaticField('privateData');
      expect(privateField!.isPrivate()).assertEqual(true);
      let value: string | number | boolean | null = privateField!.getValue() as string | number | boolean | null;
      privateField!.setValue('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_4500
     * @tc.name testStaticFieldIsPrivate045
     * @tc.desc Verify singleton pattern uses private static fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass045');
      cls.addStaticField('instance', createReflectClass('Object'), undefined, false, true, false, false);
      cls.addStaticField('count', createReflectClass('int'), 0, false, true, false, false);
      cls.addStaticField('VERSION', createReflectClass('string'), '1.0.0', true, false, false, true);
      let instanceField: StaticField | null = cls.getStaticField('instance');
      expect(instanceField!.isPrivate()).assertEqual(true);
      let countField: StaticField | null = cls.getStaticField('count');
      expect(countField!.isPrivate()).assertEqual(true);
      let versionField: StaticField | null = cls.getStaticField('VERSION');
      expect(versionField!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_4600
     * @tc.name testStaticFieldIsPrivate046
     * @tc.desc Verify distinguishing public and private config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass046');
      cls.addStaticField('APP_NAME', createReflectClass('string'), 'MyApp', true, false, false, false);
      cls.addStaticField('VERSION', createReflectClass('string'), '1.0.0', true, false, false, false);
      cls.addStaticField('ENVIRONMENT', createReflectClass('string'), 'production', true, false, false, false);
      cls.addStaticField('DB_PASSWORD', createReflectClass('string'), PLACEHOLDER_PASSWORD, false, true, false, false);
      cls.addStaticField('API_SECRET', createReflectClass('string'), PLACEHOLDER_API_KEY, false, true, false, false);
      cls.addStaticField('ENCRYPTION_KEY', createReflectClass('string'), PLACEHOLDER_API_KEY, false, true, false, false);
      let publicConfig: Record<string, string | number | boolean | null> = exportPublicConfig(cls);
      expect(publicConfig['APP_NAME']).assertEqual('MyApp');
      expect(publicConfig['DB_PASSWORD']).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_4700
     * @tc.name testStaticFieldIsPrivate047
     * @tc.desc Verify private static fields for log buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass047');
      cls.addStaticField('LOG_LEVEL', createReflectClass('string'), 'INFO', true, false, false, false);
      cls.addStaticField('buffer', createReflectClass('string[]'), '', false, true, false, false);
      cls.addStaticField('maxSize', createReflectClass('int'), 1000, false, true, false, false);
      let logLevelField: StaticField | null = cls.getStaticField('LOG_LEVEL');
      expect(logLevelField!.isPrivate()).assertEqual(false);
      let bufferField: StaticField | null = cls.getStaticField('buffer');
      expect(bufferField!.isPrivate()).assertEqual(true);
      let maxSizeField: StaticField | null = cls.getStaticField('maxSize');
      expect(maxSizeField!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_4800
     * @tc.name testStaticFieldIsPrivate048
     * @tc.desc Verify private static fields for cache storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass048');
      cls.addStaticField('MAX_SIZE', createReflectClass('int'), 100, true, false, false, true);
      cls.addStaticField('hitRate', createReflectClass('double'), 0.0, true, false, false, false);
      cls.addStaticField('storage', createReflectClass('Object'), {} as Record<string, FieldValue>, false, true, false, false);
      cls.addStaticField('accessCount', createReflectClass('int'), 0, false, true, false, false);
      let maxSizeField: StaticField | null = cls.getStaticField('MAX_SIZE');
      expect(maxSizeField!.isPrivate()).assertEqual(false);
      let hitRateField: StaticField | null = cls.getStaticField('hitRate');
      expect(hitRateField!.isPrivate()).assertEqual(false);
      let storageField: StaticField | null = cls.getStaticField('storage');
      expect(storageField!.isPrivate()).assertEqual(true);
      let accessCountField: StaticField | null = cls.getStaticField('accessCount');
      expect(accessCountField!.isPrivate()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_4900
     * @tc.name testStaticFieldIsPrivate049
     * @tc.desc Verify auditing sensitive fields for private access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass049');
      cls.addStaticField('API_ENDPOINT', createReflectClass('string'), 'https://api.example.com', true, false, false,
        false);
      cls.addStaticField('apiToken', createReflectClass('string'), 'secret-token', false, true, false, false);
      cls.addStaticField('passwordHash', createReflectClass('string'), 'hash', false, true, false, false);
      cls.addStaticField('encryptionKey', createReflectClass('string'), 'key', false, true, false, false);
      auditSensitiveFields(cls);
      expect(cls.getDeclaredStaticFields().length > 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_5000
     * @tc.name testStaticFieldIsPrivate050
     * @tc.desc Verify private fields in credentials class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass050');
      cls.addStaticField('CREDENTIALS_USERNAME', createReflectClass('string'), 'admin', false, true, false, false);
      cls.addStaticField('CREDENTIALS_PASSWORD', createReflectClass('string'), 'super_secret', false, true, false, false);
      cls.addStaticField('CREDENTIALS_TOKEN', createReflectClass('string'), 'token_abc123', false, true, false, false);
      cls.addStaticField('CREDENTIALS_EXPIRY', createReflectClass('int'), 3600, true, false, false, false);
      expect(cls.getStaticField('CREDENTIALS_USERNAME')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('CREDENTIALS_PASSWORD')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('CREDENTIALS_TOKEN')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('CREDENTIALS_EXPIRY')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_5100
     * @tc.name testStaticFieldIsPrivate051
     * @tc.desc Verify private fields in session class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass051');
      cls.addStaticField('SESSION_ID', createReflectClass('string'), 'session-001', false, true, false, false);
      cls.addStaticField('SESSION_KEY', createReflectClass('string'), 'key-001', false, true, false, false);
      cls.addStaticField('SESSION_EXPIRY', createReflectClass('int'), 1800, false, true, false, false);
      cls.addStaticField('SESSION_TIMEOUT', createReflectClass('int'), 3600, true, false, false, false);
      expect(cls.getStaticField('SESSION_ID')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('SESSION_KEY')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('SESSION_EXPIRY')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('SESSION_TIMEOUT')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_5200
     * @tc.name testStaticFieldIsPrivate052
     * @tc.desc Verify private fields in payment class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass052');
      cls.addStaticField('PAYMENT_CARD_NUMBER', createReflectClass('string'), '4111111111111111', false, true, false,
        false);
      cls.addStaticField('PAYMENT_CVV', createReflectClass('string'), '123', false, true, false, false);
      cls.addStaticField('PAYMENT_EXPIRY', createReflectClass('string'), '12/28', false, true, false, false);
      cls.addStaticField('PAYMENT_GATEWAY', createReflectClass('string'), 'https://pay.example.com', true, false, false,
        false);
      expect(cls.getStaticField('PAYMENT_CARD_NUMBER')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('PAYMENT_CVV')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('PAYMENT_EXPIRY')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('PAYMENT_GATEWAY')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_5300
     * @tc.name testStaticFieldIsPrivate053
     * @tc.desc Verify private fields in health record class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass053');
      cls.addStaticField('HEALTH_RECORD_ID', createReflectClass('string'), 'HR-001', false, true, false, false);
      cls.addStaticField('HEALTH_PATIENT_NAME', createReflectClass('string'), 'John Doe', false, true, false, false);
      cls.addStaticField('HEALTH_DIAGNOSIS', createReflectClass('string'), 'confidential', false, true, false, false);
      cls.addStaticField('HEALTH_FACILITY', createReflectClass('string'), 'General Hospital', true, false, false, false);
      expect(cls.getStaticField('HEALTH_RECORD_ID')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('HEALTH_PATIENT_NAME')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('HEALTH_DIAGNOSIS')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('HEALTH_FACILITY')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_5400
     * @tc.name testStaticFieldIsPrivate054
     * @tc.desc Verify private fields in internal paths class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass054');
      cls.addStaticField('INTERNAL_CONFIG_PATH', createReflectClass('string'), '/etc/app/config', false, true, false,
        false);
      cls.addStaticField('INTERNAL_LOG_PATH', createReflectClass('string'), '/var/log/app', false, true, false, false);
      cls.addStaticField('INTERNAL_TEMP_PATH', createReflectClass('string'), '/tmp/app', false, true, false, false);
      cls.addStaticField('CONFIG_VERSION', createReflectClass('string'), '2.0', true, false, false, false);
      expect(cls.getStaticField('INTERNAL_CONFIG_PATH')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('INTERNAL_LOG_PATH')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('INTERNAL_TEMP_PATH')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('CONFIG_VERSION')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_5500
     * @tc.name testStaticFieldIsPrivate055
     * @tc.desc Verify private fields in counter class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass055');
      cls.addStaticField('privateCounter', createReflectClass('int'), 0, false, true, false, false);
      cls.addStaticField('privateThreshold', createReflectClass('int'), 100, false, true, false, false);
      cls.addStaticField('privateLimit', createReflectClass('int'), 1000, false, true, false, false);
      cls.addStaticField('publicMax', createReflectClass('int'), 10000, true, false, false, false);
      expect(cls.getStaticField('privateCounter')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('privateThreshold')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('privateLimit')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('publicMax')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_5600
     * @tc.name testStaticFieldIsPrivate056
     * @tc.desc Verify private readonly fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass056');
      cls.addStaticField('PRIVATE_CONSTANT', createReflectClass('int'), 42, false, true, false, true);
      cls.addStaticField('PRIVATE_SECRET', createReflectClass('string'), 'secret', false, true, false, true);
      cls.addStaticField('PUBLIC_CONSTANT', createReflectClass('int'), 100, true, false, false, true);
      expect(cls.getStaticField('PRIVATE_CONSTANT')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('PRIVATE_SECRET')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('PUBLIC_CONSTANT')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_5700
     * @tc.name testStaticFieldIsPrivate057
     * @tc.desc Verify many private fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass057');
      cls.addStaticField('fieldA', createReflectClass('string'), 'a', false, true, false, false);
      cls.addStaticField('fieldB', createReflectClass('string'), 'b', false, true, false, false);
      cls.addStaticField('fieldC', createReflectClass('string'), 'c', false, true, false, false);
      cls.addStaticField('fieldD', createReflectClass('string'), 'd', false, true, false, false);
      cls.addStaticField('fieldE', createReflectClass('string'), 'e', false, true, false, false);
      cls.addStaticField('fieldF', createReflectClass('string'), 'f', true, false, false, false);
      expect(cls.getStaticField('fieldA')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('fieldB')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('fieldC')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('fieldD')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('fieldE')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('fieldF')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_5800
     * @tc.name testStaticFieldIsPrivate058
     * @tc.desc Verify private fields of multiple types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass058');
      cls.addStaticField('privateStr', createReflectClass('string'), 'private', false, true, false, false);
      cls.addStaticField('privateNum', createReflectClass('int'), 999, false, true, false, false);
      cls.addStaticField('privateBool', createReflectClass('boolean'), true, false, true, false, false);
      cls.addStaticField('privateArr', createReflectClass('string[]'), '', false, true, false, false);
      cls.addStaticField('privateObj', createReflectClass('Object'), {} as Record<string, FieldValue>, false, true, false, false);
      cls.addStaticField('publicStr', createReflectClass('string'), 'public', true, false, false, false);
      expect(cls.getStaticField('privateStr')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('privateNum')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('privateBool')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('privateArr')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('privateObj')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('publicStr')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_5900
     * @tc.name testStaticFieldIsPrivate059
     * @tc.desc Verify getPrivateFieldNames helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass050');
      cls.addStaticField('CREDENTIALS_USERNAME', createReflectClass('string'), 'admin', false, true, false, false);
      cls.addStaticField('CREDENTIALS_PASSWORD', createReflectClass('string'), 'super_secret', false, true, false, false);
      cls.addStaticField('CREDENTIALS_TOKEN', createReflectClass('string'), 'token_abc123', false, true, false, false);
      cls.addStaticField('CREDENTIALS_EXPIRY', createReflectClass('int'), 3600, true, false, false, false);
      let names: string[] = getPrivateFieldNames(cls);
      expect(names.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_6000
     * @tc.name testStaticFieldIsPrivate060
     * @tc.desc Verify getNonPrivateFieldNames helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass051');
      cls.addStaticField('SESSION_ID', createReflectClass('string'), 'session-001', false, true, false, false);
      cls.addStaticField('SESSION_KEY', createReflectClass('string'), 'key-001', false, true, false, false);
      cls.addStaticField('SESSION_EXPIRY', createReflectClass('int'), 1800, false, true, false, false);
      cls.addStaticField('SESSION_TIMEOUT', createReflectClass('int'), 3600, true, false, false, false);
      let names: string[] = getNonPrivateFieldNames(cls);
      expect(names.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_6100
     * @tc.name testStaticFieldIsPrivate061
     * @tc.desc Verify countPrivateFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass057');
      cls.addStaticField('fieldA', createReflectClass('string'), 'a', false, true, false, false);
      cls.addStaticField('fieldB', createReflectClass('string'), 'b', false, true, false, false);
      cls.addStaticField('fieldC', createReflectClass('string'), 'c', false, true, false, false);
      cls.addStaticField('fieldD', createReflectClass('string'), 'd', false, true, false, false);
      cls.addStaticField('fieldE', createReflectClass('string'), 'e', false, true, false, false);
      cls.addStaticField('fieldF', createReflectClass('string'), 'f', true, false, false, false);
      let count: number = countPrivateFields(cls);
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_6200
     * @tc.name testStaticFieldIsPrivate062
     * @tc.desc Verify hasPrivateFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls1: ReflectClass = createReflectClass('MyClass050');
      cls1.addStaticField('CREDENTIALS_USERNAME', createReflectClass('string'), 'admin', false, true, false, false);
      expect(hasPrivateFields(cls1)).assertEqual(true);
      const cls2: ReflectClass = createReflectClass('EmptyClass');
      expect(hasPrivateFields(cls2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_6300
     * @tc.name testStaticFieldIsPrivate063
     * @tc.desc Verify filterPrivateFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass058');
      cls.addStaticField('privateStr', createReflectClass('string'), 'private', false, true, false, false);
      cls.addStaticField('privateNum', createReflectClass('int'), 999, false, true, false, false);
      cls.addStaticField('publicStr', createReflectClass('string'), 'public', true, false, false, false);
      let allFields: StaticField[] = cls.getDeclaredStaticFields();
      let privateFields: StaticField[] = filterPrivateFields(allFields);
      expect(privateFields.length).assertEqual(2);
      for (let i = 0; i < privateFields.length; i++) {
        expect(privateFields[i].isPrivate()).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_6400
     * @tc.name testStaticFieldIsPrivate064
     * @tc.desc Verify maskPrivateFieldValues helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass050');
      cls.addStaticField('CREDENTIALS_USERNAME', createReflectClass('string'), 'admin', false, true, false, false);
      cls.addStaticField('CREDENTIALS_PASSWORD', createReflectClass('string'), 'super_secret', false, true, false, false);
      cls.addStaticField('CREDENTIALS_EXPIRY', createReflectClass('int'), 3600, true, false, false, false);
      let masked: Record<string, string> = maskPrivateFieldValues(cls);
      expect(masked['CREDENTIALS_USERNAME']).assertEqual('***MASKED***');
      expect(masked['CREDENTIALS_PASSWORD']).assertEqual('***MASKED***');
      expect(masked['CREDENTIALS_EXPIRY']).assertEqual('3600');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_6500
     * @tc.name testStaticFieldIsPrivate065
     * @tc.desc Verify validatePrivateFieldEncapsulation helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls1: ReflectClass = createReflectClass('MyClass050');
      cls1.addStaticField('CREDENTIALS_USERNAME', createReflectClass('string'), 'admin', false, true, false, false);
      cls1.addStaticField('CREDENTIALS_PASSWORD', createReflectClass('string'), 'super_secret', false, true, false, false);
      cls1.addStaticField('CREDENTIALS_TOKEN', createReflectClass('string'), 'token_abc123', false, true, false, false);
      cls1.addStaticField('CREDENTIALS_EXPIRY', createReflectClass('int'), 3600, true, false, false, false);
      expect(validatePrivateFieldEncapsulation(cls1)).assertEqual(true);
      const cls2: ReflectClass = createReflectClass('BadClass');
      cls2.addStaticField('password', createReflectClass('string'), 'bad', true, false, false, false);
      expect(validatePrivateFieldEncapsulation(cls2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_6600
     * @tc.name testStaticFieldIsPrivate066
     * @tc.desc Verify getPrivateFieldValueMap helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass056');
      cls.addStaticField('PRIVATE_CONSTANT', createReflectClass('int'), 42, false, true, false, true);
      cls.addStaticField('PRIVATE_SECRET', createReflectClass('string'), 'secret', false, true, false, true);
      cls.addStaticField('PUBLIC_CONSTANT', createReflectClass('int'), 100, true, false, false, true);
      let map: Map<string, string | number | boolean | null> = getPrivateFieldValueMap(cls);
      expect(map.get('PRIVATE_CONSTANT')).assertEqual(42);
      expect(map.get('PRIVATE_SECRET')).assertEqual('secret');
      expect(map.has('PUBLIC_CONSTANT')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_6700
     * @tc.name testStaticFieldIsPrivate067
     * @tc.desc Verify isPrivate with mixed private and public fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass059');
      cls.addStaticField('secretKey', createReflectClass('string'), 'secret', false, true, false, false);
      cls.addStaticField('internalId', createReflectClass('int'), 100, false, true, false, false);
      cls.addStaticField('publicName', createReflectClass('string'), 'public', true, false, false, false);
      expect(cls.getStaticField('secretKey')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('internalId')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('publicName')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_6800
     * @tc.name testStaticFieldIsPrivate068
     * @tc.desc Verify isPrivate with readonly private fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass060');
      cls.addStaticField('CONSTANT', createReflectClass('int'), 42, false, true, false, true);
      cls.addStaticField('cache', createReflectClass('string[]'), '', false, true, false, false);
      cls.addStaticField('version', createReflectClass('string'), '1.0', true, false, false, false);
      expect(cls.getStaticField('CONSTANT')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('cache')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('version')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_6900
     * @tc.name testStaticFieldIsPrivate069
     * @tc.desc Verify isPrivate with function type private fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass061');
      cls.addStaticField('handler', createReflectClass('function'), '', false, true, false, false);
      cls.addStaticField('callback', createReflectClass('function'), '', true, false, false, false);
      expect(cls.getStaticField('handler')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('callback')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_7000
     * @tc.name testStaticFieldIsPrivate070
     * @tc.desc Verify isPrivate with class type private fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass062');
      cls.addStaticField('inner', createReflectClass('string'), 'InnerClass062', false, true, false, false);
      cls.addStaticField('outer', createReflectClass('string'), 'Object', true, false, false, false);
      expect(cls.getStaticField('inner')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('outer')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_7100
     * @tc.name testStaticFieldIsPrivate071
     * @tc.desc Verify isPrivate when all fields are private
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass063');
      cls.addStaticField('a', createReflectClass('int'), 1, false, true, false, false);
      cls.addStaticField('b', createReflectClass('int'), 2, false, true, false, false);
      cls.addStaticField('c', createReflectClass('int'), 3, false, true, false, false);
      let fields: StaticField[] = cls.getDeclaredStaticFields();
      for (let i = 0; i < fields.length; i++) {
        expect(fields[i].isPrivate()).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_7200
     * @tc.name testStaticFieldIsPrivate072
     * @tc.desc Verify isPrivate with sensitive field names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass064');
      cls.addStaticField('password', createReflectClass('string'), 'pwd', false, true, false, false);
      cls.addStaticField('apiKey', createReflectClass('string'), 'key', false, true, false, false);
      cls.addStaticField('authToken', createReflectClass('string'), 'token', false, true, false, false);
      cls.addStaticField('appName', createReflectClass('string'), 'MyApp', true, false, false, false);
      expect(cls.getStaticField('password')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('apiKey')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('authToken')!.isPrivate()).assertEqual(true);
      expect(cls.getStaticField('appName')!.isPrivate()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_7300
     * @tc.name testStaticFieldIsPrivate073
     * @tc.desc Verify countPrivateFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass059');
      cls.addStaticField('secretKey', createReflectClass('string'), 'secret', false, true, false, false);
      cls.addStaticField('internalId', createReflectClass('int'), 100, false, true, false, false);
      cls.addStaticField('publicName', createReflectClass('string'), 'public', true, false, false, false);
      let count: number = countPrivateFields(cls);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_7400
     * @tc.name testStaticFieldIsPrivate074
     * @tc.desc Verify hasPrivateFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass063');
      cls.addStaticField('a', createReflectClass('int'), 1, false, true, false, false);
      cls.addStaticField('b', createReflectClass('int'), 2, false, true, false, false);
      expect(hasPrivateFields(cls)).assertEqual(true);
      const cls2: ReflectClass = createReflectClass('PublicOnly');
      cls2.addStaticField('x', createReflectClass('int'), 0, true, false, false, false);
      expect(hasPrivateFields(cls2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_7500
     * @tc.name testStaticFieldIsPrivate075
     * @tc.desc Verify filterPrivateFields helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticFieldIsPrivate075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls: ReflectClass = createReflectClass('MyClass064');
      cls.addStaticField('password', createReflectClass('string'), 'pwd', false, true, false, false);
      cls.addStaticField('apiKey', createReflectClass('string'), 'key', false, true, false, false);
      cls.addStaticField('authToken', createReflectClass('string'), 'token', false, true, false, false);
      cls.addStaticField('appName', createReflectClass('string'), 'MyApp', true, false, false, false);
      let allFields: StaticField[] = cls.getDeclaredStaticFields();
      let privateFields: StaticField[] = filterPrivateFields(allFields);
      expect(privateFields.length).assertEqual(3);
      for (let i = 0; i < privateFields.length; i++) {
        expect(privateFields[i].isPrivate()).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_INTEGRATION_ISPRIVATE_0100
     * @tc.name integrationIsPrivate001
     * @tc.desc Verify private fields are not accessible via getStaticField using real Class.from API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('integrationIsPrivate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const field = Class.from<IntegrationIsPrivateClass>().getStaticField('hiddenField');
      expect(field === undefined).assertEqual(true);
    });
  });
}