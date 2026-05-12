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

class A_F128 {
  static field: int = 0
}

class C_F129 {data: int = 0}

class A_F129 {
  static field: C_F129 = {data: 4}
}

class C_F130 {data: int = 0}

class A_F130 {
  static field: C_F130 = new C_F130()
}

class A_F131 {
  private static _field: int
  static get field(): int {
    return A_F131._field
  }
  static set field(a: int) {
    A_F131._field = a
  }
}

class A_F132 {
  private static _field: int = 4
  static get field(): int {
    return A_F132._field
  }
  static set field(a: int) {
    A_F132._field = a
  }
}

class A_F133 {
  private static _field: int = 0
  static get field(): int {
    return A_F133._field
  }
  static set field(a: int) {
    A_F133._field = a
  }
}

class C_F134 {data: int = 0}

class A_F134 {
  private static _field: C_F134 = {data: 4}
  static get field(): C_F134 {
    return A_F134._field
  }
  static set field(a: C_F134) {
    A_F134._field = a
  }
}

class C_F135 {data: int = 0}

class A_F135 {
  private static _field: C_F135 = new C_F135()
  static get field(): C_F135 {
    return A_F135._field
  }
  static set field(a: C_F135) {
    A_F135._field = a
  }
}

class A_F137 {
  static field: number = 0.0
}

class C_F138 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F138 {
  protected static _field = new C_F138(4)
}

class A_F138 extends B_F138 {
  static get field(): C_F138 {
    return B_F138._field
  }
  static set field(a: C_F138) {
    B_F138._field = a
  }
}

class C_F139 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F139 {
  protected static _field: C_F139 = new C_F139()
}

class A_F139 extends B_F139 {
  static get field(): C_F139 {
    return B_F139._field
  }
  static set field(a: C_F139) {
    B_F139._field = a
  }
}

class C_F140 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F140 {
  static field = new C_F140(4)
}

class C_F141 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F141 {
  static field: C_F141 = new C_F141()
}

class A_F142 {
  private static _field: int = 4
  static get field(): int {
    return A_F142._field
  }
  static set field(a: int) {
    A_F142._field = a
  }
}

class A_F143 {
  private static _field = 0
  static get field(): int {
    return A_F143._field
  }
  static set field(a: int) {
    A_F143._field = a
  }
}

class C_F144 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F144 {
  private static _field = new C_F144(4)
  static get field(): C_F144 {
    return A_F144._field
  }
  static set field(a: C_F144) {
    A_F144._field = a
  }
}

class C_F145 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F145 {
  private static _field: C_F145 = new C_F145()
  static get field(): C_F145 {
    return A_F145._field
  }
  static set field(a: C_F145) {
    A_F145._field = a
  }
}

class B_F146 {
  protected static _field: int = 4
}

class A_F146 extends B_F146 {
  static get field(): int {
    return B_F146._field
  }
  static set field(a: int) {
    B_F146._field = a
  }
}

class B_F147 {
  protected static _field = 0
}

class A_F147 extends B_F147 {
  static get field(): int {
    return B_F147._field
  }
  static set field(a: int) {
    B_F147._field = a
  }
}

class A_F148 {
  static field?: int
}

class C_F149 {data: int = 0}

class A_F149 {
  static field?: C_F149
}

class C_F150 {data: int = 0}

class A_F150 {
  private static _field?: C_F150 = {data: 4}
  static get field(): C_F150 | undefined {
    return A_F150._field
  }
  static set field(a: C_F150 | undefined) {
    A_F150._field = a
  }
}

class C_F151 {data: int = 0}

class A_F151 {
  private static _field?: C_F151 = new C_F151()
  static get field(): C_F151 | undefined {
    return A_F151._field
  }
  static set field(a: C_F151 | undefined) {
    A_F151._field = a
  }
}

class B_F152 {
  protected static _field?: int
}

class A_F152 extends B_F152 {
  static get field(): int | undefined {
    return B_F152._field
  }
  static set field(a: int | undefined) {
    B_F152._field = a
  }
}

class C_F153 {data: int = 0}

class B_F153 {
  protected static _field?: C_F153
}

class A_F153 extends B_F153 {
  static get field(): C_F153 | undefined {
    return B_F153._field
  }
  static set field(a: C_F153 | undefined) {
    B_F153._field = a
  }
}

class B_F154 {
  protected static _field?: int = 4
}

class A_F154 extends B_F154 {
  static get field(): int | undefined {
    return B_F154._field
  }
  static set field(a: int | undefined) {
    B_F154._field = a
  }
}

class B_F155 {
  protected static _field?: int = 0
}

class A_F155 extends B_F155 {
  static get field(): int | undefined {
    return B_F155._field
  }
  static set field(a: int | undefined) {
    B_F155._field = a
  }
}

class C_F156 {data: int = 0}

class B_F156 {
  protected static _field?: C_F156 = {data: 4}
}

class A_F156 extends B_F156 {
  static get field(): C_F156 | undefined {
    return B_F156._field
  }
  static set field(a: C_F156 | undefined) {
    B_F156._field = a
  }
}

class C_F157 {data: int = 0}

class B_F157 {
  protected static _field?: C_F157 = new C_F157()
}

class A_F157 extends B_F157 {
  static get field(): C_F157 | undefined {
    return B_F157._field
  }
  static set field(a: C_F157 | undefined) {
    B_F157._field = a
  }
}

class A_F158 {
  static field?: int | undefined = 4
}

class A_F159 {
  static field?: int | undefined = 0
}

class C_F160 {data: int = 0}

class A_F160 {
  static field?: C_F160 = {data: 4}
}

class C_F161 {data: int = 0}

class A_F161 {
  static field?: C_F161 = new C_F161()
}

class A_F162 {
  private static _field?: int
  static get field(): int | undefined {
    return A_F162._field
  }
  static set field(a: int | undefined) {
    A_F162._field = a
  }
}

class C_F163 {data: int = 0}

class A_F163 {
  private static _field?: C_F163
  static get field(): C_F163 | undefined {
    return A_F163._field
  }
  static set field(a: C_F163 | undefined) {
    A_F163._field = a
  }
}

class A_F164 {
  private static _field?: int = 4
  static get field(): int | undefined {
    return A_F164._field
  }
  static set field(a: int | undefined) {
    A_F164._field = a
  }
}

class A_F165 {
  private static _field?: int = 0
  static get field(): int | undefined {
    return A_F165._field
  }
  static set field(a: int | undefined) {
    A_F165._field = a
  }
}

class A_F166 {
  static field?: int = 4
}

class A_F167 {
  static field?: number = 0.0
}

class C_F168 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F168 {
  protected static _field? = new C_F168(4)
}

class A_F168 extends B_F168 {
  static get field(): C_F168 | undefined {
    return B_F168._field
  }
  static set field(a: C_F168 | undefined) {
    B_F168._field = a
  }
}

class C_F170 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F170 {
  static field? = new C_F170(4)
}

class C_F171 {
  data: int
  constructor(a: int = 0) {
    this.data = a
  }
}

class A_F171 {
  static field?: C_F171
}

class A_F172 {
  private static _field: Int|undefined = 0
  static get field(): int | undefined {
    return A_F172._field
  }
  static set field(a: int | undefined) {
    A_F172._field = a
  }
}

class A_F173 {
  private static _field? = 0
  static get field(): int | undefined {
    return A_F173._field
  }
  static set field(a: int | undefined) {
    A_F173._field = a
  }
}

class C_F174 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F174 {
  private static _field? = new C_F174(4)
  static get field(): C_F174 | undefined {
    return A_F174._field
  }
  static set field(a: C_F174 | undefined) {
    A_F174._field = a
  }
}

class B_F176 {
  protected static _field: Int|undefined = undefined
}

class A_F176 extends B_F176 {
  static get field(): int | undefined {
    return B_F176._field
  }
  static set field(a: int | undefined) {
    B_F176._field = a
  }
}

class B_F177 {
  protected static _field? = 0
}

class A_F177 extends B_F177 {
  static get field(): int | undefined {
    return B_F177._field
  }
  static set field(a: int | undefined) {
    B_F177._field = a
  }
}

class C_F180 {data: int = 0}

class B_F180 {
  protected static _field: C_F180 = {data: 4}
}

class A_F180 extends B_F180 {
  static get field(): C_F180 {
    return B_F180._field
  }
}

class C_F181 {data: int = 0}

class B_F181 {
  protected static _field: C_F181 = new C_F181()
}

class A_F181 extends B_F181 {
  static get field(): C_F181 {
    return B_F181._field
  }
}

class C_F182 {data: int = 0}

class A_F182 {
  static field: C_F182 = {data: 4}
}

class C_F183 {data: int = 0}

class A_F183 {
  static field: C_F183 = new C_F183()
}

class A_F184 {
  private static _field: int = 4
  static get field(): int {
    return A_F184._field
  }
}

class A_F185 {
  private static _field: int = 0
  static get field(): int {
    return A_F185._field
  }
}

class C_F186 {data: int = 0}

class A_F186 {
  private static _field: C_F186 = {data: 4}
  static get field(): C_F186 {
    return A_F186._field
  }
}

class C_F187 {data: int = 0}

class A_F187 {
  private static _field: C_F187 = new C_F187()
  static get field(): C_F187 {
    return A_F187._field
  }
}

class B_F188 {
  protected static _field: int = 4
}

class A_F188 extends B_F188 {
  static get field(): int {
    return B_F188._field
  }
}

class B_F189 {
  protected static _field: int = 0
}

class A_F189 extends B_F189 {
  static get field(): int {
    return B_F189._field
  }
}

class A_F190 {
  static field: number = 4
}

class A_F191 {
  static field = 0
}

class C_F192 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F192 {
  protected static _field = new C_F192(4)
}

class A_F192 extends B_F192 {
  static get field(): C_F192 {
    return B_F192._field
  }
}

class C_F193 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F193 {
  protected static _field: C_F193 = new C_F193()
}

class A_F193 extends B_F193 {
  static get field(): C_F193 {
    return B_F193._field
  }
}

class C_F194 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F194 {
  static field = new C_F194(4)
}

class A_F196 {
  private static _field: int = 4
  static get field(): int {
    return A_F196._field
  }
}

class A_F197 {
  private static _field = 0
  static get field(): int {
    return A_F197._field
  }
}

class C_F198 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F198 {
  private static _field = new C_F198(4)
  static get field(): C_F198 {
    return A_F198._field
  }
}

class C_F199 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F199 {
  private static _field: C_F199 = new C_F199()
  static get field(): C_F199 {
    return A_F199._field
  }
}

class B_F200 {
  protected static _field: int = 4
}

class A_F200 extends B_F200 {
  static get field(): int {
    return B_F200._field
  }
}

class B_F201 {
  protected static _field = 0
}

class A_F201 extends B_F201 {
  static get field(): int {
    return B_F201._field
  }
}

class A_F202 {
  static field?: int
}

class C_F203 {data: int = 0}

class A_F203 {
  static field?: C_F203
}

class C_F204 {data: int = 0}

class A_F204 {
  private static _field?: C_F204 = {data: 4}
  static get field(): C_F204 | undefined {
    return A_F204._field
  }
}

class C_F205 {data: int = 0}

class A_F205 {
  private static _field?: C_F205 = new C_F205()
  static get field(): C_F205 | undefined {
    return A_F205._field
  }
}

class B_F206 {
  protected static _field?: int
}

class A_F206 extends B_F206 {
  static get field(): int | undefined {
    return B_F206._field
  }
}

class C_F207 {data: int = 0}

class B_F207 {
  protected static _field?: C_F207
}

class A_F207 extends B_F207 {
  static get field(): C_F207 | undefined {
    return B_F207._field
  }
}

class B_F208 {
  protected static _field?: int = 4
}

class A_F208 extends B_F208 {
  static get field(): int | undefined {
    return B_F208._field
  }
}

class B_F209 {
  protected static _field?: int = 0
}

class A_F209 extends B_F209 {
  static get field(): int | undefined {
    return B_F209._field
  }
}

class C_F210 {data: int = 0}

class B_F210 {
  protected static _field?: C_F210 = {data: 4}
}

class A_F210 extends B_F210 {
  static get field(): C_F210 | undefined {
    return B_F210._field
  }
}

class C_F211 {data: int = 0}

class B_F211 {
  protected static _field?: C_F211 = new C_F211()
}

class A_F211 extends B_F211 {
  static get field(): C_F211 | undefined {
    return B_F211._field
  }
}

class A_F212 {
  static field?: int | undefined = 4
}

class A_F213 {
  static field?: int | undefined = 0
}

class C_F214 {data: int = 0}

class A_F214 {
  static field?: C_F214 = {data: 4}
}

class C_F215 {data: int = 0}

class A_F215 {
  static field?: C_F215 = new C_F215()
}

class A_F216 {
  private static _field?: int
  static get field(): int | undefined {
    return A_F216._field
  }
}

class C_F217 {data: int = 0}

class A_F217 {
  private static _field?: C_F217
  static get field(): C_F217 | undefined {
    return A_F217._field
  }
}

class A_F218 {
  private static _field?: int = 4
  static get field(): int | undefined {
    return A_F218._field
  }
}

class A_F219 {
  private static _field?: int = 0
  static get field(): int | undefined {
    return A_F219._field
  }
}

class A_F220 {
  static field?: int = 4
}

class A_F221 {
  static field? = 0
}

class C_F222 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F222 {
  protected static _field? = new C_F222(4)
}

class A_F222 extends B_F222 {
  static get field(): C_F222 | undefined {
    return B_F222._field
  }
}

class C_F223 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class B_F223 {
  protected static _field: C_F223|undefined = new C_F223()
}

class A_F223 extends B_F223 {
  static get field(): C_F223 | undefined {
    return B_F223._field
  }
}

class C_F224 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F224 {
  static field? = new C_F224(4)
}

class C_F225 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F225 {
  static field? = 0
}

class A_F226 {
  private static _field?: int = 4
  static get field(): int | undefined {
    return A_F226._field
  }
}

class A_F227 {
  private static _field? = 0
  static get field(): int | undefined {
    return A_F227._field
  }
}

class C_F228 {
  data: int
  constructor(a: int = 0){
    this.data = a
  }
}

class A_F228 {
  private static _field? = new C_F228(4)
  static get field(): C_F228 | undefined {
    return A_F228._field
  }
}

class B_F230 {
  protected static _field: Int|undefined = 0
}

class A_F230 extends B_F230 {
  static get field(): int | undefined {
    return B_F230._field
  }
}

class B_F231 {
  protected static _field? = 0
}

class A_F231 extends B_F231 {
  static get field(): int | undefined {
    return B_F231._field
  }
}

class A_F232 {
  public i: int;
  public static s: int;
  public b: int = 5;
}

class A_F233 {
  public x: int;

  public y: boolean;
}

class B_F233 extends A_F233 {
}

class A_F234 {
  public x: int;
}

interface C_F234 {
  y: boolean;
}

class B_F234 extends A_F234 implements C_F234 {
  y: boolean;
}

interface A_F235 {
  x: int;
}

interface C_F235 {
  y: boolean;
}

class B_F235 implements A_F235, C_F235 {
  x: int;
  y: boolean;
}

interface I_F236 {
  field: int
}

class B_F236 implements I_F236 {
    field: int
}

class A_F236 extends B_F236 implements I_F236 {
}

interface I_F237 {
  field: int
}

class B_F237 implements I_F237 {
    field: int
}

class A_F237 extends B_F237 implements I_F237 {
}

interface I1_F238 {
  field: int
}

interface I2_F238 extends I1_F238 {
}

class A_F238 implements I1_F238, I2_F238 {
    field: int = 4
}

interface I1_F239 {
  field: int
}

interface I2_F239 extends I1_F239 {
}

class A_F239 implements I2_F239, I1_F239 {
    field: int = 4
}

interface I1_F240 {
  field: int
}

interface I2_F240 extends I1_F240 {
}

class A_F240 implements I1_F240, I2_F240 {
    field: int = 4
}

interface I1_F241 {
  field: int
}

interface I2_F241 extends I1_F241 {
}

class A_F241 implements I2_F241, I1_F241 {
    field: int = 4
}

interface I_F242 {
  field: int
}

class B_F242 implements I_F242 {
    field: int = 4
}

class A_F242 extends B_F242 implements I_F242 {
  field: int = 5
}

interface I_F243 {
  field: int
}

class B_F243 implements I_F243 {
    field: int = 4
}

class A_F243 extends B_F243 implements I_F243 {
  field: int = 5
}

interface I_F244 {
  field: int
}

class B_F244 implements I_F244 {
    field: int = 4
}

class C_F244 extends B_F244 {
}

class A_F244 extends C_F244 implements I_F244 {
}

interface I_F245 {
  field: int
}

class B_F245 implements I_F245 {
    field: int = 4
}

class C_F245 extends B_F245 {
}

class A_F245 extends C_F245 implements I_F245 {
}

interface I_F246 {
  field: int
}

class B_F246 implements I_F246 {
    field: int = 4
}

class C_F246 extends B_F246 {
  field: int = 5
}

class A_F246 extends C_F246 implements I_F246 {
  field: int = 4
}

interface I_F247 {
  field: int
}

class B_F247 implements I_F247 {
    field: int = 4
}

class C_F247 extends B_F247 {
  field: int = 5
}

class A_F247 extends C_F247 implements I_F247 {
  field: int = 4
}

interface I1_F248 {
  field: int
}

interface I2_F248 extends I1_F248 {
}

class A_F248 implements I1_F248, I2_F248 {
    field: int = 4
}

interface I1_F249 {
  field: int
}

export default function FieldDeclarationTest(): void {
  describe("FieldDeclarationTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_0100
     * @tc.name      testFieldDeclaration0001
     * @tc.desc      Access to a hidden field using cast.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A_F001 = new B_F001();
      expect(instance.y).assertTrue();
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_0200
     * @tc.name      testFieldDeclaration0002
     * @tc.desc      Access to a hidden field by access expression with 'super' keyword.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B_F002 = new B_F002();
      expect(typeof instance.getX()).assertEqual("int");
      expect(instance.getX()).assertEqual(0);
      expect(typeof instance.x).assertEqual("int");
      expect(instance.x).assertEqual(0);
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_0300
     * @tc.name      testFieldDeclaration0003
     * @tc.desc      Access to a static hidden field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B_F003 = new B_F003();
      expect(instance.getX()).assertEqual(0);
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_0400
     * @tc.name      testFieldDeclaration0004
     * @tc.desc      Checking for initialization public field with explicit type with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F004 = new A_F004()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_0500
     * @tc.name      testFieldDeclaration0005
     * @tc.desc      Checking for initialization public field with explicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F005 = new A_F005()
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_0600
     * @tc.name      testFieldDeclaration0006
     * @tc.desc      Checking for initialization protected field with explicit type with default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F006 = new A_F006()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_0700
     * @tc.name      testFieldDeclaration0007
     * @tc.desc      Checking for initialization protected field with explicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F007 = new A_F007()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_0800
     * @tc.name      testFieldDeclaration0008
     * @tc.desc      Checking for initialization protected field with explicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F008 = new A_F008()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_0900
     * @tc.name      testFieldDeclaration0009
     * @tc.desc      Checking for initialization protected field with explicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F009 = new A_F009()
      a.field = new C_F009()
      a.field.data = 5
      expect(a.field instanceof C_F009).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_1000
     * @tc.name      testFieldDeclaration0010
     * @tc.desc      Checking for initialization protected field with explicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F010 = new A_F010()
      a.field = new C_F010()
      a.field.data = 5
      expect(a.field instanceof C_F010).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_1100
     * @tc.name      testFieldDeclaration0011
     * @tc.desc      Checking for initialization public field with explicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F011 = new A_F011()
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_1200
     * @tc.name      testFieldDeclaration0012
     * @tc.desc      Checking for initialization public field with explicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F012 = new A_F012()
      expect(a.field instanceof C_F012).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
      a.field = new C_F012()
      a.field.data = 5
      expect(a.field instanceof C_F012).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_1300
     * @tc.name      testFieldDeclaration0013
     * @tc.desc      Checking for initialization public field with explicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F013 = new A_F013()
      expect(a.field instanceof C_F013).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(0)
      a.field = new C_F013()
      a.field.data = 5
      expect(a.field instanceof C_F013).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_1400
     * @tc.name      testFieldDeclaration0014
     * @tc.desc      Checking for initialization private field with explicit type with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F014 = new A_F014()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_1500
     * @tc.name      testFieldDeclaration0015
     * @tc.desc      Checking for initialization private field with explicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F015 = new A_F015()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_1600
     * @tc.name      testFieldDeclaration0016
     * @tc.desc      Checking for initialization private field with explicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F016 = new A_F016()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_1700
     * @tc.name      testFieldDeclaration0017
     * @tc.desc      Checking for initialization private field with explicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F017 = new A_F017()
      expect(a.field instanceof C_F017).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
      a.field = new C_F017()
      a.field.data = 5
      expect(a.field instanceof C_F017).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_1800
     * @tc.name      testFieldDeclaration0018
     * @tc.desc      Checking for initialization private field with explicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F018 = new A_F018()
      expect(a.field instanceof C_F018).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(0)
      a.field = new C_F018()
      a.field.data = 5
      expect(a.field instanceof C_F018).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_1900
     * @tc.name      testFieldDeclaration0019
     * @tc.desc      Checking for initialization public field with implicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F019 = new A_F019()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_2000
     * @tc.name      testFieldDeclaration0020
     * @tc.desc      Checking for initialization public field with implicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F020 = new A_F020()
      expect(typeof a.field).assertEqual("number")
      expect(a.field).assertEqual(0.0)
      a.field = 5
      expect(typeof a.field).assertEqual("number")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_2100
     * @tc.name      testFieldDeclaration0021
     * @tc.desc      Checking for initialization protected field with implicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F021 = new A_F021()
      expect(a.field instanceof C_F021).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
      a.field = new C_F021(5)
      expect(a.field instanceof C_F021).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_2200
     * @tc.name      testFieldDeclaration0022
     * @tc.desc      Checking for initialization protected field with implicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F022 = new A_F022()
      expect(a.field instanceof C_F022).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(0)
      a.field = new C_F022(5)
      expect(a.field instanceof C_F022).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_2300
     * @tc.name      testFieldDeclaration0023
     * @tc.desc      Checking for initialization public field with implicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F023 = new A_F023()
      expect(a.field instanceof C_F023).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
      a.field = new C_F023(5)
      expect(a.field instanceof C_F023).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_2400
     * @tc.name      testFieldDeclaration0024
     * @tc.desc      Checking for initialization public field with implicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F024 = new A_F024()
      a.field = new C_F024(4)
      expect(a.field instanceof C_F024).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
      a.field = new C_F024(5)
      expect(a.field instanceof C_F024).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_2500
     * @tc.name      testFieldDeclaration0025
     * @tc.desc      Checking for initialization private field with implicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F025 = new A_F025()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_2600
     * @tc.name      testFieldDeclaration0026
     * @tc.desc      Checking for initialization private field with implicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F026 = new A_F026()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_2700
     * @tc.name      testFieldDeclaration0027
     * @tc.desc      Checking for initialization private field with implicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F027 = new A_F027()
      expect(a.field instanceof C_F027).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
      a.field = new C_F027(5)
      expect(a.field instanceof C_F027).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_2800
     * @tc.name      testFieldDeclaration0028
     * @tc.desc      Checking for initialization private field with implicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F028 = new A_F028()
      expect(a.field instanceof C_F028).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(0)
      a.field = new C_F028(5)
      expect(a.field instanceof C_F028).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_2900
     * @tc.name      testFieldDeclaration0029
     * @tc.desc      Checking for initialization protected field with implicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F029 = new A_F029()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_3000
     * @tc.name      testFieldDeclaration0030
     * @tc.desc      Checking for initialization protected field with implicit type with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F030 = new A_F030()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_3100
     * @tc.name      testFieldDeclaration0031
     * @tc.desc      Checking for initialization public field with late initialization from outside
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F031 = new A_F031()
      a.field = 5
      expect(typeof a.field).assertEqual("long")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_3200
     * @tc.name      testFieldDeclaration0032
     * @tc.desc      Checking for initialization public field with late initialization from outside
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F032 = new A_F032()
      a.field = new C_F032()
      a.field.data = 5
      expect(a.field instanceof C_F032).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_3300
     * @tc.name      testFieldDeclaration0033
     * @tc.desc      Checking for initialization private field with late initialization from outside
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F033 = new A_F033()
      a.field = 5
      expect(typeof a.field).assertEqual("long")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_3400
     * @tc.name      testFieldDeclaration0034
     * @tc.desc      Checking for initialization private field with late initialization from outside
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F034 = new A_F034()
      a.field = new C_F034()
      a.field.data = 5
      expect(a.field instanceof C_F034).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_3500
     * @tc.name      testFieldDeclaration0035
     * @tc.desc      Checking for initialization protected field with late initialization from outside
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F035 = new A_F035()
      a.field = 5
      expect(typeof a.field).assertEqual("long")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_3600
     * @tc.name      testFieldDeclaration0036
     * @tc.desc      Checking for initialization protected field with late initialization from outside
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F036 = new A_F036()
      a.field = new C_F036()
      a.field.data = 5
      expect(a.field instanceof C_F036).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_3700
     * @tc.name      testFieldDeclaration0037
     * @tc.desc      Checking for initialization public optional field with explicit type with default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F037 = new A_F037()
      expect(typeof a.field).assertEqual("undefined")
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_3800
     * @tc.name      testFieldDeclaration0038
     * @tc.desc      Checking for initialization public optional field with explicit type with default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F038 = new A_F038()
      expect(a.field instanceof C_F038 | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = new C_F038()
      a.field!.data = 5
      expect(a.field instanceof C_F038 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_3900
     * @tc.name      testFieldDeclaration0039
     * @tc.desc      Checking for initialization private optional field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F039 = new A_F039()
      a.field = new C_F039()
      a.field!.data = 4
      expect(a.field instanceof C_F039 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
      a.field = new C_F039()
      a.field!.data = 5
      expect(a.field instanceof C_F039 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_4000
     * @tc.name      testFieldDeclaration0040
     * @tc.desc      Checking for initialization private optional field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F040 = new A_F040()
      a.field = new C_F040()
      a.field!.data = 4
      expect(a.field instanceof C_F040 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
      a.field = new C_F040()
      a.field!.data = 5
      expect(a.field instanceof C_F040 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_4100
     * @tc.name      testFieldDeclaration0041
     * @tc.desc      Checking for initialization protected optional field with explicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F041 = new A_F041()
      expect(typeof a.field).assertEqual("undefined")
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_4200
     * @tc.name      testFieldDeclaration0042
     * @tc.desc      Checking for initialization protected optional field with explicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F042 = new A_F042()
      expect(a.field instanceof C_F042 | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = new C_F042()
      a.field!.data = 5
      expect(a.field instanceof C_F042 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_4300
     * @tc.name      testFieldDeclaration0043
     * @tc.desc      Checking for initialization protected optional field with explicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F043 = new A_F043()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_4400
     * @tc.name      testFieldDeclaration0044
     * @tc.desc      Checking for initialization protected optional field with explicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F044 = new A_F044()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_4500
     * @tc.name      testFieldDeclaration0045
     * @tc.desc      Checking for initialization protected optional field with explicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F045 = new A_F045()
      expect(a.field instanceof C_F045 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
      a.field = new C_F045()
      a.field!.data = 5
      expect(a.field instanceof C_F045 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_4600
     * @tc.name      testFieldDeclaration0046
     * @tc.desc      Checking for initialization protected optional field with explicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F046 = new A_F046()
      expect(a.field instanceof C_F046 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(0)
      a.field = new C_F046()
      a.field!.data = 5
      expect(a.field instanceof C_F046 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_4700
     * @tc.name      testFieldDeclaration0047
     * @tc.desc      Checking for initialization public optional field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F047 = new A_F047()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_4800
     * @tc.name      testFieldDeclaration0048
     * @tc.desc      Checking for initialization public optional field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F048 = new A_F048()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_4900
     * @tc.name      testFieldDeclaration0049
     * @tc.desc      Checking for initialization public optional field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F049 = new A_F049()
      expect(a.field instanceof C_F049 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
      a.field = new C_F049()
      a.field!.data = 5
      expect(a.field instanceof C_F049 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_5000
     * @tc.name      testFieldDeclaration0050
     * @tc.desc      Checking for initialization public optional field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F050 = new A_F050()
      expect(a.field instanceof C_F050 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(0)
      a.field = new C_F050()
      a.field!.data = 5
      expect(a.field instanceof C_F050 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_5100
     * @tc.name      testFieldDeclaration0051
     * @tc.desc      Checking for initialization private optional field with explicit type with default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F051 = new A_F051()
      expect(typeof a.field).assertEqual("undefined")
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_5200
     * @tc.name      testFieldDeclaration0052
     * @tc.desc      Checking for initialization private optional field with explicit type with default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F052 = new A_F052()
      expect(a.field instanceof C_F052 | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = new C_F052()
      a.field!.data = 5
      expect(a.field instanceof C_F052 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_5300
     * @tc.name      testFieldDeclaration0053
     * @tc.desc      Checking for initialization private optional field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F053 = new A_F053()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_5400
     * @tc.name      testFieldDeclaration0054
     * @tc.desc      Checking for initialization private optional field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F054 = new A_F054()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_5500
     * @tc.name      testFieldDeclaration0055
     * @tc.desc      Checking for initialization public optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F055 = new A_F055()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_5600
     * @tc.name      testFieldDeclaration0056
     * @tc.desc      Checking for initialization public optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F056 = new A_F056()
      expect(typeof a.field).assertEqual("number")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("number")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_5700
     * @tc.name      testFieldDeclaration0057
     * @tc.desc      Checking for initialization protected optional field with implicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F057 = new A_F057()
      expect(a.field instanceof C_F057 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
      a.field = new C_F057(5)
      expect(a.field instanceof C_F057 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_5800
     * @tc.name      testFieldDeclaration0058
     * @tc.desc      Checking for initialization public optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F059 = new A_F059()
      expect(a.field instanceof C_F059 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
      a.field = new C_F059(5)
      expect(a.field instanceof C_F059 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_5900
     * @tc.name      testFieldDeclaration0059
     * @tc.desc      Checking for initialization private optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F061 = new A_F061()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_6000
     * @tc.name      testFieldDeclaration0060
     * @tc.desc      Checking for initialization private optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F062 = new A_F062()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_6100
     * @tc.name      testFieldDeclaration0061
     * @tc.desc      Checking for initialization private optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F063 = new A_F063()
      expect(a.field instanceof C_F063 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
      a.field = new C_F063(5)
      expect(a.field instanceof C_F063 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_6200
     * @tc.name      testFieldDeclaration0062
     * @tc.desc      Checking for initialization protected optional field with implicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F065 = new A_F065()
      expect(typeof a.field).assertEqual("undefined")
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_6300
     * @tc.name      testFieldDeclaration0063
     * @tc.desc      Checking for initialization protected optional field with implicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F066 = new A_F066()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_6400
     * @tc.name      testFieldDeclaration0064
     * @tc.desc      Checking for initialization public field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F067 = new A_F067()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_6500
     * @tc.name      testFieldDeclaration0065
     * @tc.desc      Checking for initialization public field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F068 = new A_F068()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_6600
     * @tc.name      testFieldDeclaration0066
     * @tc.desc      Checking for initialization protected field with explicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F069 = new A_F069()
      expect(a.field instanceof C_F069).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_6700
     * @tc.name      testFieldDeclaration0067
     * @tc.desc      Checking for initialization protected field with explicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F070 = new A_F070()
      expect(a.field instanceof C_F070).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_6800
     * @tc.name      testFieldDeclaration0068
     * @tc.desc      Checking for initialization public field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F071 = new A_F071()
      expect(a.field instanceof C_F071).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_6900
     * @tc.name      testFieldDeclaration0069
     * @tc.desc      Checking for initialization public field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F072 = new A_F072()
      expect(a.field instanceof C_F072).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_7000
     * @tc.name      testFieldDeclaration0070
     * @tc.desc      Checking for initialization private field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F073 = new A_F073()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_7100
     * @tc.name      testFieldDeclaration0071
     * @tc.desc      Checking for initialization private field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F074 = new A_F074()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_7200
     * @tc.name      testFieldDeclaration0072
     * @tc.desc      Checking for initialization private field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F075 = new A_F075()
      expect(a.field instanceof C_F075).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_7300
     * @tc.name      testFieldDeclaration0073
     * @tc.desc      Checking for initialization private field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F076 = new A_F076()
      expect(a.field instanceof C_F076).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_7400
     * @tc.name      testFieldDeclaration0074
     * @tc.desc      Checking for initialization protected field with explicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F077 = new A_F077()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_7500
     * @tc.name      testFieldDeclaration0075
     * @tc.desc      Checking for initialization protected field with explicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F078 = new A_F078()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_7600
     * @tc.name      testFieldDeclaration0076
     * @tc.desc      Checking for initialization public field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F079 = new A_F079()
      expect(typeof a.field).assertEqual("number")
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_7700
     * @tc.name      testFieldDeclaration0077
     * @tc.desc      Checking for initialization public field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F080 = new A_F080()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_7800
     * @tc.name      testFieldDeclaration0078
     * @tc.desc      Checking for initialization protected field with implicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F081 = new A_F081()
      expect(a.field instanceof C_F081).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_7900
     * @tc.name      testFieldDeclaration0079
     * @tc.desc      Checking for initialization protected field with implicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F082 = new A_F082()
      expect(a.field instanceof C_F082).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_8000
     * @tc.name      testFieldDeclaration0080
     * @tc.desc      Checking for initialization public field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F083 = new A_F083()
      expect(a.field instanceof C_F083).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_8100
     * @tc.name      testFieldDeclaration0081
     * @tc.desc      Checking for initialization public field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F084 = new A_F084()
      expect(a.field instanceof C_F084).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_8200
     * @tc.name      testFieldDeclaration0082
     * @tc.desc      Checking for initialization private field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F085 = new A_F085()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_8300
     * @tc.name      testFieldDeclaration0083
     * @tc.desc      Checking for initialization private field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F086 = new A_F086()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_8400
     * @tc.name      testFieldDeclaration0084
     * @tc.desc      Checking for initialization private field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F087 = new A_F087()
      expect(a.field instanceof C_F087).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_8500
     * @tc.name      testFieldDeclaration0085
     * @tc.desc      Checking for initialization private field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F088 = new A_F088()
      expect(a.field instanceof C_F088).assertTrue()
      expect(typeof a.field!.data).assertEqual('int')
      expect(a.field.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_8600
     * @tc.name      testFieldDeclaration0086
     * @tc.desc      Checking for initialization protected field with implicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F089 = new A_F089()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_8700
     * @tc.name      testFieldDeclaration0087
     * @tc.desc      Checking for initialization protected field with implicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F090 = new A_F090()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_8800
     * @tc.name      testFieldDeclaration0088
     * @tc.desc      Checking for initialization public optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F091 = new A_F091()
      expect(typeof a.field).assertEqual("undefined")
      expect(a.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_8900
     * @tc.name      testFieldDeclaration0089
     * @tc.desc      Checking for initialization public optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F092 = new A_F092()
      expect(a.field instanceof C_F092 | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_9000
     * @tc.name      testFieldDeclaration0090
     * @tc.desc      Checking for initialization private optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F093 = new A_F093()
      expect(a.field instanceof C_F093 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_9100
     * @tc.name      testFieldDeclaration0091
     * @tc.desc      Checking for initialization private optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F094 = new A_F094()
      expect(a.field instanceof C_F094 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_9200
     * @tc.name      testFieldDeclaration0092
     * @tc.desc      Checking for initialization protected optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F095 = new A_F095()
      expect(typeof a.field).assertEqual("undefined")
      expect(a.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_9300
     * @tc.name      testFieldDeclaration0093
     * @tc.desc      Checking for initialization protected optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F096 = new A_F096()
      expect(a.field instanceof C_F096 | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_9400
     * @tc.name      testFieldDeclaration0094
     * @tc.desc      Checking for initialization protected optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F097 = new A_F097()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_9500
     * @tc.name      testFieldDeclaration0095
     * @tc.desc      Checking for initialization protected optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F098 = new A_F098()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_9600
     * @tc.name      testFieldDeclaration0096
     * @tc.desc      Checking for initialization protected optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F099 = new A_F099()
      expect(a.field instanceof C_F099 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_9700
     * @tc.name      testFieldDeclaration0097
     * @tc.desc      Checking for initialization protected optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F100 = new A_F100()
      expect(a.field instanceof C_F100 | undefined).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_9800
     * @tc.name      testFieldDeclaration0098
     * @tc.desc      Checking for initialization public optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F101 = new A_F101()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_TEST_9900
     * @tc.name      testFieldDeclaration0099
     * @tc.desc      Checking for initialization public optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclaration0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F102 = new A_F102()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

  })
}
