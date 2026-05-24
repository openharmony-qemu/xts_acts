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

/* Shared fixtures for ClassGetInstanceMethodTest001/002 (39690 item 2.20). */

import Utils from '../Util.test';

export class MyClass001 {
  public test(): string {
    return "no param";
  }
}

export class MyClass002 {
  public test(msg: string): string {
    return msg;
  }
}

export class MyClass003 {
  public simpleMethod(): void {}
}

export class MyClass004 {
  public getUserName(): string {
    return "test";
  }
}

export class MyClass005 {
  public method123(): void {}
  public test2(): void {}
}

export class MyClass006 {
  public _internalMethod(): void {}
}

export class MyClass007 {
  private _name: string = '';
  public get name(): string {
    return this._name;
  }
}

export class MyClass008 {
  private _name: string = '';
  public set name(value: string) {
    this._name = value;
  }
}

export class MyClass009 {
  public test(): void {}
}

export class MyClass010 {
  public a(): void {}
}

export class MyClass011 {
  public thisIsAVeryLongMethodNameThatExceedsNormalLength(): void {}
}

export class MyClass012 {
  public 测试方法(): void {}
  public método(): void {}
}

export class MyClass013 {
  public test(): void {}
}

export class MyClass014 {
  public test(): void {}
}

export class MyClass015 {
  public test(): void {}
}

export class MyClass016 {
  public test(): void {}
}

export class MyClass017 {
  public test(): void {}
}

export class MyClass018 {
  public test(): void {}
}

export class MyClass019 {
  public test(): void {}
}

export class MyClass020 {
  public test(): void {}
}

export class MyClass021 {
  public test(msg: string): string {
    return msg;
  }
}

export class MyClass022 {
  public test(name: string, age: int, flag: boolean): void {}
}

export class MyClass023 {
  public testByte(b: byte): void {}
  public testShort(s: short): void {}
  public testInt(i: int): void {}
  public testLong(l: long): void {}
  public testFloat(f: float): void {}
  public testDouble(d: double): void {}
  public testBoolean(flag: boolean): void {}
  public testChar(ch: char): void {}
}

export class MyClass024 {
  public testString(s: string): void {}
  public testArray(arr: Array<int>): void {}
  public testMap(map: Map<string, int>): void {}
}

export class MyClass025 {
  public test(): string {
    return "test";
  }
  public test(msg: string): string {
    return msg;
  }
}

export class MyClass026 {
  public test(p1: int, p2: int, p3: int, p4: int, p5: int,
    p6: int, p7: int, p8: int, p9: int, p10: int): void {}
}

export class MyClass027 {
  public testList(list: Array<string>): void {}
  public testMap(map: Map<int, string>): void {}
  public testOptional(opt?: int): void {}
}

export class MyClass028 {
  public testUnion(value: int | string): void {}
}

export class MyClass029 {
  public test(): void {}
}

export class MyClass030 {
  public test(): void {}
}

export class MyClass031 {
  public test(msg: string): void {}
}

export class MyClass032 {
  public test(msg: string): void {}
}

export class MyClass033 {
  public test(name: string, age: int): void {}
}

export class MyClass034 {
  public test(msg: string): void {}
}

export class MyClass035 {
  public singleMethod(): void {}
}

export class MyClass036 {
  public test(): string {
    return "no param";
  }
  public test(msg: string): string {
    return msg;
  }
  public test(name: string, age: int): string {
    return name + ":" + age.toString();
  }
}

export class MyClass037 {
  public test(): string {
    return "no param";
  }
  public test(msg: string): string {
    return msg;
  }
}

export class MyClass038 {
  public myMethod(): string {
    return "my method";
  }
}

export class MyClass039 implements MyInterface039 {
  public sayHi(): string {
    return "hi";
  }
}

export interface MyInterface039 {
  sayHi(): string;
}

export class ParentClass040 {
  public parentMethod(): string {
    return "parent";
  }
}

export class MyClass040 extends ParentClass040 {
  public childMethod(): string {
    return "child";
  }
}

export interface Interface1041 {
  method1(): string;
}

export interface Interface2041 {
  method2(): string;
}

export class MyClass041 implements Interface1041, Interface2041 {
  public method1(): string {
    return "method1";
  }
  public method2(): string {
    return "method2";
  }
}

export class MyClass042 {
  public publicMethod(): string {
    return "public";
  }
}

export class MyClass043 {
  private privateMethod(): string {
    return "private";
  }
}

export class MyClass044 {
  protected protectedMethod(): string {
    return "protected";
  }
}

export class MyClass045 {
  private internalMethod(): string {
    return "internal";
  }
}

export class MyClass046 {
  public static staticMethod(): string {
    return "static";
  }
}

export class MyClass047 {
  public constructor() {}
}

export class MyClass048 {
  public nativeMethod(): void {}
}

export class MyClass049 {
  public final finalMethod(): void {}
}

export class MyClass050 {
  public async asyncMethod(): Promise<string> {
    return "async";
  }
}

export abstract class MyClass051 {
  public abstract abstractMethod(): void;
}

export class MyClass052 {
  public test(): string {
    return "test";
  }
}

export class MyClass053 {
  public myMethod(): void {}
}

export class MyClass054 {
  public test(): void {}
}

export class MyClass055 {
  public test(): string {
    return "test";
  }
}

export class MyClass056 {
  public test(name: string, age: int): void {}
}

export class MyClass057 {
  public test(a: int, b: int, c: int): void {}
}

export class MyClass058 {
  public test(msg: string): string {
    return "Hello " + msg;
  }
}

export class MyClass059 {
  public test(): void {}
}

export class MyClass060 {
  public myMethod(): void {}
}

export class MyClass061 {
  public myMethod(): void {}
}

export class MyClass062 {
  public test(msg: string): string {
    return msg;
  }
}

export class ParentClass063 {
  public parentMethod(): string {
    return "parent";
  }
}

export class MyClass063 extends ParentClass063 {}

export class MyClass064 {
  private privateMethod(): string {
    return "private";
  }
}

export class MyClass065 {
  public static staticMethod(): string {
    return "static";
  }
}

export class MyClass066 {
  public test(): void {}
}

export class MyClass067 {
  public test(): void {}
}

export class EmptyClass068 {}

export class MyClass069 implements MyInterface069 {
  public interfaceMethod(): string {
    return "interface";
  }
}

export interface MyInterface069 {
  interfaceMethod(): string;
}

export abstract class AbstractClass070 {
  public abstract abstractMethod(): void;
  public concreteMethod(): void {}
}

export class GenericClass071<T> {
  public genericMethod(value: T): T {
    return value;
  }
}

export class MyClass072 {
  public test(): string {
    return "no param";
  }
  public test(msg: string): string {
    return msg;
  }
}

export class MyClass073 {
  public test(): string { return "0"; }
  public test(a: string): string { return a; }
  public test(a: string, b: int): string { return a + b; }
  public test(a: string, b: int, c: boolean): string { return a + b + c; }
}

export class MyClass074 {
  public test(): string { return "0"; }
  public test(msg: string): string { return msg; }
}

export class MyClass075 {
  public test(): void {}
}

export class MyClass076 {
  public test(msg: string): void {}
}

export class MyClass077 {
  public test(msg: string): void {}
}

export class MyClass078 {
  public test(): string { return "0"; }
  public test(msg: string): string { return msg; }
}

export class MyClass079 {
  public test(): string { return "0"; }
  public test(msg: string): string { return msg; }
}

export class MyClass080 {
  public test(): string { return "0"; }
  public test(msg: string): string { return msg; }
}

export class MyClass081 {
  public test(
    p1: int, p2: int, p3: int, p4: int, p5: int,
    p6: int, p7: int, p8: int, p9: int, p10: int,
    p11: int, p12: int, p13: int, p14: int, p15: int,
    p16: int, p17: int, p18: int, p19: int, p20: int
  ): void {}
}

export class MyClass082 {
  public test(map: Map<string, Map<int, Array<string>>>): void {}
}

export class MyClass083 {
  public test(obj: MyClass083): void {}
}

export class LargeClass084 {
  public method001(): void {}
  public method002(): void {}
  public method003(): void {}
  public method004(): void {}
  public method005(): void {}
  public method006(): void {}
  public method007(): void {}
  public method008(): void {}
  public method009(): void {}
  public method010(): void {}
  public method011(): void {}
  public method012(): void {}
  public method013(): void {}
  public method014(): void {}
  public method015(): void {}
  public method016(): void {}
  public method017(): void {}
  public method018(): void {}
  public method019(): void {}
  public method020(): void {}
  public method021(): void {}
  public method022(): void {}
  public method023(): void {}
  public method024(): void {}
  public method025(): void {}
  public method026(): void {}
  public method027(): void {}
  public method028(): void {}
  public method029(): void {}
  public method030(): void {}
  public method031(): void {}
  public method032(): void {}
  public method033(): void {}
  public method034(): void {}
  public method035(): void {}
  public method036(): void {}
  public method037(): void {}
  public method038(): void {}
  public method039(): void {}
  public method040(): void {}
  public method041(): void {}
  public method042(): void {}
  public method043(): void {}
  public method044(): void {}
  public method045(): void {}
  public method046(): void {}
  public method047(): void {}
  public method048(): void {}
  public method049(): void {}
  public method050(): void {}
  public method051(): void {}
  public method052(): void {}
  public method053(): void {}
  public method054(): void {}
  public method055(): void {}
  public method056(): void {}
  public method057(): void {}
  public method058(): void {}
  public method059(): void {}
  public method060(): void {}
  public method061(): void {}
  public method062(): void {}
  public method063(): void {}
  public method064(): void {}
  public method065(): void {}
  public method066(): void {}
  public method067(): void {}
  public method068(): void {}
  public method069(): void {}
  public method070(): void {}
  public method071(): void {}
  public method072(): void {}
  public method073(): void {}
  public method074(): void {}
  public method075(): void {}
  public method076(): void {}
  public method077(): void {}
  public method078(): void {}
  public method079(): void {}
  public method080(): void {}
  public method081(): void {}
  public method082(): void {}
  public method083(): void {}
  public method084(): void {}
  public method085(): void {}
  public method086(): void {}
  public method087(): void {}
  public method088(): void {}
  public method089(): void {}
  public method090(): void {}
  public method091(): void {}
  public method092(): void {}
  public method093(): void {}
  public method094(): void {}
  public method095(): void {}
  public method096(): void {}
  public method097(): void {}
  public method098(): void {}
  public method099(): void {}
  public method100(): void {}
}

export class MyClass085 {
  public test(): void {}
}

export function findMethod086(): string {
  let cls = Class.from<MyClass086>();
  let method = cls.getInstanceMethod('test');
  return method !== null ? 'found' : 'not found';
}

export class MyClass086 {
  public test(): void {}
}

export class MyClass087 {
  public method1(): void {}
  public method2(): void {}
}

export function dynamicCall088(obj: Object, methodName: string, a: int, b: int): int {
  let cls = Class.of(obj);
  let method = cls.getInstanceMethod(methodName, [Class.PRIMITIVE_INT, Class.PRIMITIVE_INT]);
  if (method === undefined) {
    method = cls.getInstanceMethod(methodName);
  }
  if (method !== undefined) {
    return method!.invoke(obj, [a, b]) as int;
  }
  return 0;
}

export class Calculator088 {
  public add(a: int, b: int): int {
    return a + b;
  }
  public subtract(a: int, b: int): int {
    return a - b;
  }
  public multiply(a: int, b: int): int {
    return a * b;
  }
}

export function hasMethod089(obj: Object, methodName: string): boolean {
  let cls = Class.of(obj);
  let method = cls.getInstanceMethod(methodName);
  return method !== undefined;
}

export class MyClass089 {
  public existingMethod(): void {}
}

export class TestClass090 {
  public greet(name: string): string {
    return "Hello, " + name;
  }
}

export class ReflectionUtils090 {
  public static invokeMethod(obj: Object, methodName: string, arg: string): string {
    let cls = Class.of(obj);
    let method = cls.getInstanceMethod(methodName, [Class.from<string>()]);
    if (method !== undefined) {
      return method!.invoke(obj, [arg]) as string;
    }
    throw new Error(`Method ${methodName} not found`);
  }

  public static methodExists(obj: Object, methodName: string): boolean {
    let cls = Class.of(obj);
    return cls.getInstanceMethod(methodName) !== undefined;
  }
}

export class APIClass25091 {
  public method25(): void {}
}

export class APIClass24091 {
  public method24(): void {}
}

export class MyClass093 {
  public async asyncMethod(): Promise<string> {
    return "async result";
  }
}

export class Builder094 {
  private name: string = '';
  private age: int = 0;

  public setName(name: string): this {
    this.name = name;
    return this;
  }

  public setAge(age: int): this {
    this.age = age;
    return this;
  }
}

export class MyClass095 {
  public getValue(): int | string {
    return 42;
  }
}

export class MyClass096 {
  public alwaysThrow(): never {
    throw new Error('Always throws');
  }
}

export class MyClass097 {
  public async final combinedMethod(): Promise<string> {
    return "combined";
  }
}

export abstract class AbstractClass098 {
  public abstract abstractMethod(): void;
  public concreteMethod(): string {
    return "concrete";
  }
}

export class MyClass099 {
  public process<T extends Number>(value: T): T {
    return value;
  }
}

export class MinimalClass100 {
  public min(): void {}
}

export class ComplexClass101 {
  public publicField: int = 0;
  private privateField: string = '';
  protected protectedField: boolean = true;

  public static staticField: double = 0.0;

  public constructor() {}
  public constructor(value: int) { this.publicField = value; }

  public instanceMethod(): void {}
  private privateInstanceMethod(): void {}

  public static staticMethod(): void {}

  public get property(): string { return this.privateField; }
  public set property(value: string) { this.privateField = value; }
}

export class GrandParent102 {
  public grandParentMethod(): string { return "grandparent"; }
}

export class Parent102 extends GrandParent102 {
  public parentMethod(): string { return "parent"; }
}

export class Child102 extends Parent102 {
  public childMethod(): string { return "child"; }
}

export class GrandChild102 extends Child102 {
  public grandChildMethod(): string { return "grandchild"; }
}

export function asInstanceMethodArray(methods: FixedArray<reflect.InstanceMethod>): Array<reflect.InstanceMethod> {
  return Utils.fixedArrayToArray(methods);
}

