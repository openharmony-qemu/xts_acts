/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../hypium";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A_F001 {
  public x: int;
}

class B_F001 extends A_F001 {
  public y: boolean = true;
}

class A_F002 {
  private _x: int;

  public get x(): int {
    return this._x;
  }
}

class B_F002 extends A_F002 {

  public getX(): int {
    return super.x;
  }
}

class A_F003 {
  public static x: int;
}

class B_F003 extends A_F003 {
  public x: boolean;

  public getX(): int {
    return A_F003.x;
  }
}

class A_F004 {
  field: int
}

class A_F005 {
  field: int = 4
}

class B_F006 {
  protected _field: int
}

class A_F006 extends B_F006 {
  get field(): int {
    return this._field
  }
  set field(a: int) {
    this._field = a
  }
}

class B_F007 {
  protected _field: int = 4
}

class A_F007 extends B_F007 {
  get field(): int {
    return this._field
  }
  set field(a: int) {
    this._field = a
  }
}

class B_F008 {
  protected _field: int = 0
}

class A_F008 extends B_F008 {
  get field(): int {
    return this._field
  }
  set field(a: int) {
    this._field = a
  }
}

class C_F009 {data: int = 0}

class B_F009 {
  protected _field: C_F009 = {data: 4}
}

class A_F009 extends B_F009 {
  get field(): C_F009 {
    return this._field
  }
  set field(a: C_F009) {
    this._field = a
  }
}

class C_F010 {data: int = 0}

class B_F010 {
  protected _field: C_F010 = new C_F010()
}

class A_F010 extends B_F010 {
  get field(): C_F010 {
    return this._field
  }
  set field(a: C_F010) {
    this._field = a
  }
}

class A_F011 {
  field: int = 0
}

class C_F012 {data: int = 0}

class A_F012 {
  field: C_F012 = {data: 4}
}

class C_F013 {data: int = 0}

class A_F013 {
  field: C_F013 = new C_F013()
}

class A_F014 {
  private _field: int
  get field(): int {
    return this._field
  }
  set field(a: int) {
    this._field = a
  }
}

class A_F015 {
  private _field: int = 4
  get field(): int {
    return this._field
  }
  set field(a: int) {
    this._field = a
  }
}

class A_F016 {
  private _field: int = 0
  get field(): int {
    return this._field
  }
  set field(a: int) {
    this._field = a
  }
}

class C_F017 {data: int = 0}

class A_F017 {
  private _field: C_F017 = {data: 4}
  get field(): C_F017 {
    return this._field
  }
  set field(a: C_F017) {
    this._field = a
  }
}

class C_F018 {data: int = 0}

class A_F018 {
  private _field: C_F018 = new C_F018()
  get field(): C_F018 {
    return this._field
  }
  set field(a: C_F018) {
    this._field = a
  }
}

class A_F019 {
  field: int = 4
}

class A_F020 {
  field: number = 0.0
}

class C_F021 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F021 {
  protected _field = new C_F021(4)
}

class A_F021 extends B_F021 {
  get field(): C_F021 {
    return this._field
  }
  set field(a: C_F021) {
    this._field = a
  }
}

class C_F022 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F022 {
  protected _field: C_F022 = new C_F022()
}

class A_F022 extends B_F022 {
  get field(): C_F022 {
    return this._field
  }
  set field(a: C_F022) {
    this._field = a
  }
}

class C_F023 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F023 {
  field = new C_F023(4)
}

class C_F024 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F024 {
  field: C_F024 = new C_F024()
}

class A_F025 {
  private _field: int = 4
  get field(): int {
    return this._field
  }
  set field(a: int) {
    this._field = a
  }
}

class A_F026 {
  private _field = 0
  get field(): int {
    return this._field
  }
  set field(a: int) {
    this._field = a
  }
}

class C_F027 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F027 {
  private _field = new C_F027(4)
  get field(): C_F027 {
    return this._field
  }
  set field(a: C_F027) {
    this._field = a
  }
}

class C_F028 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F028 {
  private _field: C_F028 = new C_F028()
  get field(): C_F028 {
    return this._field
  }
  set field(a: C_F028) {
    this._field = a
  }
}

class B_F029 {
  protected _field: int = 4
}

class A_F029 extends B_F029 {
  get field(): int {
    return this._field
  }
  set field(a: int) {
    this._field = a
  }
}

class B_F030 {
  protected _field = 0
}

class A_F030 extends B_F030 {
  get field(): int {
    return this._field
  }
  set field(a: int) {
    this._field = a
  }
}

class A_F031 {
  field!: long
}

class C_F032 {data!: int}

class A_F032 {
  field!: C_F032
}

class A_F033 {
  private _field!: long
  get field(): long {
    return this._field
  }
  set field(a: long) {
    this._field = a
  }
}

class C_F034 {data!: int}

class A_F034 {
  private _field!: C_F034
  get field(): C_F034 {
    return this._field
  }
  set field(a: C_F034) {
    this._field = a
  }
}

class B_F035 {
  protected _field!: long
}

class A_F035 extends B_F035 {
  get field(): long {
    return this._field
  }
  set field(a: long) {
    this._field = a
  }
}

class C_F036 {data!: int}

class B_F036 {
  protected _field!: C_F036
}

class A_F036 extends B_F036 {
  get field(): C_F036 {
    return this._field
  }
  set field(a: C_F036) {
    this._field = a
  }
}

class A_F037 {
  field?: int
}

class C_F038 {data: int = 0}

class A_F038 {
  field?: C_F038
}

class C_F039 {data: int = 0}

class A_F039 {
  private _field?: C_F039 = {data: 4}
  get field(): C_F039 | undefined {
    return this._field
  }
  set field(a: C_F039 | undefined) {
    this._field = a
  }
}

class C_F040 {data: int = 0}

class A_F040 {
  private _field?: C_F040 = new C_F040()
  get field(): C_F040 | undefined {
    return this._field
  }
  set field(a: C_F040 | undefined) {
    this._field = a
  }
}

class B_F041 {
  protected _field?: int
}

class A_F041 extends B_F041 {
  get field(): int | undefined {
    return this._field
  }
  set field(a: int | undefined) {
    this._field = a
  }
}

class C_F042 {data: int = 0}

class B_F042 {
  protected _field?: C_F042
}

class A_F042 extends B_F042 {
  get field(): C_F042 | undefined {
    return this._field
  }
  set field(a: C_F042 | undefined) {
    this._field = a
  }
}

class B_F043 {
  protected _field?: int = 4
}

class A_F043 extends B_F043 {
  get field(): int | undefined {
    return this._field
  }
  set field(a: int | undefined) {
    this._field = a
  }
}

class B_F044 {
  protected _field?: int = 0
}

class A_F044 extends B_F044 {
  get field(): int | undefined {
    return this._field
  }
  set field(a: int | undefined) {
    this._field = a
  }
}

class C_F045 {data: int = 0}

class B_F045 {
  protected _field?: C_F045 = {data: 4}
}

class A_F045 extends B_F045 {
  get field(): C_F045 | undefined {
    return this._field
  }
  set field(a: C_F045 | undefined) {
    this._field = a
  }
}

class C_F046 {data: int = 0}

class B_F046 {
  protected _field?: C_F046 = new C_F046()
}

class A_F046 extends B_F046 {
  get field(): C_F046 | undefined {
    return this._field
  }
  set field(a: C_F046 | undefined) {
    this._field = a
  }
}

class A_F047 {
  field?: int | undefined = 4
}

class A_F048 {
  field?: int | undefined = 0
}

class C_F049 {data: int = 0}

class A_F049 {
  field?: C_F049 = {data: 4}
}

class C_F050 {data: int = 0}

class A_F050 {
  field?: C_F050 = new C_F050()
}

class A_F051 {
  private _field?: int
  get field(): int | undefined {
    return this._field
  }
  set field(a: int | undefined) {
    this._field = a
  }
}

class C_F052 {data: int = 0}

class A_F052 {
  private _field?: C_F052
  get field(): C_F052 | undefined {
    return this._field
  }
  set field(a: C_F052 | undefined) {
    this._field = a
  }
}

class A_F053 {
  private _field?: int = 4
  get field(): int | undefined {
    return this._field
  }
  set field(a: int | undefined) {
    this._field = a
  }
}

class A_F054 {
  private _field?: int = 0
  get field(): int | undefined {
    return this._field
  }
  set field(a: int | undefined) {
    this._field = a
  }
}

class A_F055 {
  field?: int = 4
}

class A_F056 {
  field?: number = 0.0
}

class C_F057 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F057 {
  protected _field? = new C_F057(4)
}

class A_F057 extends B_F057 {
  get field(): C_F057 | undefined {
    return this._field
  }
  set field(a: C_F057 | undefined) {
    this._field = a
  }
}


class C_F059 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F059 {
  field? = new C_F059(4)
}

class A_F061 {
  private _field: Int|undefined = 0
  get field(): int | undefined {
    return this._field
  }
  set field(a: int | undefined) {
    this._field = a
  }
}

class A_F062 {
  private _field? = 0
  get field(): int | undefined {
    return this._field
  }
  set field(a: int | undefined) {
    this._field = a
  }
}

class C_F063 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F063 {
  private _field? = new C_F063(4)
  get field(): C_F063 | undefined {
    return this._field
  }
  set field(a: C_F063 | undefined) {
    this._field = a
  }
}

class B_F065 {
  protected _field: Int|undefined = undefined
}

class A_F065 extends B_F065 {
  get field(): int | undefined {
    return this._field
  }
  set field(a: int | undefined) {
    this._field = a
  }
}

class B_F066 {
  protected _field? = 0
}

class A_F066 extends B_F066 {
  get field(): int | undefined {
    return this._field
  }
  set field(a: int | undefined) {
    this._field = a
  }
}

class A_F067 {
  field: int = 4
}

class A_F068 {
  field: int = 0
}

class C_F069 {data: int = 0}

class B_F069 {
  protected _field: C_F069 = {data: 4}
}

class A_F069 extends B_F069 {
  get field(): C_F069 {
    return this._field
  }
}

class C_F070 {data: int = 0}

class B_F070 {
  protected _field: C_F070 = new C_F070()
}

class A_F070 extends B_F070 {
  get field(): C_F070 {
    return this._field
  }
}

class C_F071 {data: int = 0}

class A_F071 {
  field: C_F071 = {data: 4}
}

class C_F072 {data: int = 0}

class A_F072 {
  field: C_F072 = new C_F072()
}

class A_F073 {
  private _field: int = 4
  get field(): int {
    return this._field
  }
  set field(value: int) {
    this._field = value
  }
}

class A_F074 {
  private _field: int = 0
  get field(): int {
    return this._field
  }
  set field(value: int) {
    this._field = value
  }
}

class C_F075 {data: int = 0}

class A_F075 {
  private _field: C_F075 = {data: 4}
  get field(): C_F075 {
    return this._field
  }
}

class C_F076 {data: int = 0}

class A_F076 {
  private _field: C_F076 = new C_F076()
  get field(): C_F076 {
    return this._field
  }
}

class B_F077 {
  protected _field: int = 4
}

class A_F077 extends B_F077 {
  get field(): int {
    return this._field
  }
  set field(value: int) {
    this._field = value
  }
}

class B_F078 {
  protected _field: int = 0
}

class A_F078 extends B_F078 {
  get field(): int {
    return this._field
  }
  set field(value: int) {
    this._field = value
  }
}

class A_F079 {
  field: number = 4
}

class A_F080 {
  field = 0
}

class C_F081 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F081 {
  protected _field = new C_F081(4)
}

class A_F081 extends B_F081 {
  get field(): C_F081 {
    return this._field
  }
}

class C_F082 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F082 {
  protected _field: C_F082 = new C_F082()
}

class A_F082 extends B_F082 {
  get field(): C_F082 {
    return this._field
  }
}

class C_F083 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F083 {
  field = new C_F083(4)
}

class C_F084 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F084 {
  field: C_F084 = new C_F084(4)
}

class A_F085 {
  private _field: int = 4
  get field(): int {
    return this._field
  }
  set field(value: int) {
    this._field = value
  }
}

class A_F086 {
  private _field = 0
  get field(): int {
    return this._field
  }
  set field(value: int) {
    this._field = value
  }
}

class C_F087 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F087 {
  private _field = new C_F087(4)
  get field(): C_F087 {
    return this._field
  }
}

class C_F088 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F088 {
  private _field: C_F088 = new C_F088()
  get field(): C_F088 {
    return this._field
  }
}

class B_F089 {
  protected _field: int = 4
}

class A_F089 extends B_F089 {
  get field(): int {
    return this._field
  }
  set field(value: int) {
    this._field = value
  }
}

class B_F090 {
  protected _field = 0
}

class A_F090 extends B_F090 {
  get field(): int {
    return this._field
  }
  set field(value: int) {
    this._field = value
  }
}

class A_F091 {
  field?: int
}

class C_F092 {data: int = 0}

class A_F092 {
  field?: C_F092
}

class C_F093 {data: int = 0}

class A_F093 {
  private _field?: C_F093 = {data: 4}
  get field(): C_F093 | undefined {
    return this._field
  }
}

class C_F094 {data: int = 0}

class A_F094 {
  private _field?: C_F094 = new C_F094()
  get field(): C_F094 | undefined {
    return this._field
  }
}

class B_F095 {
  protected _field?: int
}

class A_F095 extends B_F095 {
  get field(): int | undefined {
    return this._field
  }
}

class C_F096 {data: int = 0}

class B_F096 {
  protected _field?: C_F096
}

class A_F096 extends B_F096 {
  get field(): C_F096 | undefined {
    return this._field
  }
}

class B_F097 {
  protected _field?: int = 4
}

class A_F097 extends B_F097 {
  get field(): int | undefined {
    return this._field
  }
}

class B_F098 {
  protected _field?: int = 0
}

class A_F098 extends B_F098 {
  get field(): int | undefined {
    return this._field
  }
}

class C_F099 {data: int = 0}

class B_F099 {
  protected _field?: C_F099 = {data: 4}
}

class A_F099 extends B_F099 {
  get field(): C_F099 | undefined {
    return this._field
  }
}

class C_F100 {data: int = 0}

class B_F100 {
  protected _field?: C_F100 = new C_F100()
}

class A_F100 extends B_F100 {
  get field(): C_F100 | undefined {
    return this._field
  }
}

class A_F101 {
  field?: int | undefined = 4
}

class A_F102 {
  field?: int | undefined = 0
}

class C_F103 {data: int = 0}

class A_F103 {
  field?: C_F103 = {data: 4}
}

class C_F104 {data: int = 0}

class A_F104 {
  field?: C_F104 = new C_F104()
}

class A_F105 {
  private _field?: int
  get field(): int | undefined {
    return this._field
  }
}

class C_F106 {data: int = 0}

class A_F106 {
  private _field?: C_F106
  get field(): C_F106 | undefined {
    return this._field
  }
}

class A_F107 {
  private _field?: int = 4
  get field(): int | undefined {
    return this._field
  }
}

class A_F108 {
  private _field?: int = 0
  get field(): int | undefined {
    return this._field
  }
}

class A_F109 {
  field?: number = 4
}

class A_F110 {
  field? = 0
}

class C_F111 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F111 {
  protected _field? = new C_F111(4)
}

class A_F111 extends B_F111 {
  get field(): C_F111 | undefined {
    return this._field
  }
}

class C_F112 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F112 {
  protected _field: C_F112|undefined = new C_F112()
}

class A_F112 extends B_F112 {
  get field(): C_F112 | undefined {
    return this._field
  }
}

class C_F113 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F113 {
  field? = new C_F113(4)
}

class A_F115 {
  private _field: Int|undefined = 0
  get field(): int | undefined {
    return this._field
  }
}

class A_F116 {
  private _field? = 0
  get field(): int | undefined {
    return this._field
  }
}

class C_F117 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F117 {
  private _field? = new C_F117(4)
  get field(): C_F117 | undefined {
    return this._field
  }
}

class B_F119 {
  protected _field: Int|undefined = 0
}

class A_F119 extends B_F119 {
  get field(): int | undefined {
    return this._field
  }
}

class B_F120 {
  protected _field? = 0
}

class A_F120 extends B_F120 {
  get field(): int | undefined {
    return this._field
  }
}

class A_F121 {
  static field: int
}

class A_F122 {
  static field: int = 4
}

class B_F123 {
  protected static _field: int
}

class A_F123 extends B_F123 {
  static get field(): int {
    return B_F123._field
  }
  static set field(a: int) {
    B_F123._field = a
  }
}

class B_F124 {
  protected static _field: int = 4
}

class A_F124 extends B_F124 {
  static get field(): int {
    return B_F124._field
  }
  static set field(a: int) {
    B_F124._field = a
  }
}

class B_F125 {
  protected static _field: int = 0
}

class A_F125 extends B_F125 {
  static get field(): int {
    return B_F125._field
  }
  static set field(a: int) {
    B_F125._field = a
  }
}

class C_F126 {data: int = 0}

class B_F126 {
  protected static _field: C_F126 = {data: 4}
}

class A_F126 extends B_F126 {
  static get field(): C_F126 {
    return B_F126._field
  }
  static set field(a: C_F126) {
    B_F126._field = a
  }
}

class C_F127 {data: int = 0}

class B_F127 {
  protected static _field: C_F127 = new C_F127()
}

class A_F127 extends B_F127 {
  static get field(): C_F127 {
    return B_F127._field
  }
  static set field(a: C_F127) {
    B_F127._field = a
  }
}
