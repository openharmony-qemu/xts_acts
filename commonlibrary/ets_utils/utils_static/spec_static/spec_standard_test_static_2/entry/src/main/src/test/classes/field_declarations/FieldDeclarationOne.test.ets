'use static'
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
} from "../../../../../hypium/index";
import Utils from '../../Util.test'

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

interface I2_F249 extends I1_F249 {
}

class A_F249 implements I2_F249, I1_F249 {
    field: int = 4
}

class A_F250 {
  public x: int = 4;
}

class B_F250 extends A_F250 {
  public x: int = 5;
}

interface A_F251 {
  get x(): boolean;
}

class B_F251 implements A_F251 {
  public x: boolean;

  public getX(): boolean {
    return this.x;
  }
}

export default function FieldDeclarationOneTest(): void {
  describe("FieldDeclarationOneTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_FIELD_DECLARATION_ONE_0100
     * @tc.name      testFieldDeclarationOne0001
     * @tc.desc      Checking for initialization public optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F103 = new A_F103()
      expect(a.field instanceof C_F103).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_0200
     * @tc.name      testFieldDeclarationOne0002
     * @tc.desc      Checking for initialization public optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F104 = new A_F104()
      expect(a.field instanceof C_F104).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_0300
     * @tc.name      testFieldDeclarationOne0003
     * @tc.desc      Checking for initialization private optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F105 = new A_F105()
      expect(typeof a.field).assertEqual("undefined")
      expect(a.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_0400
     * @tc.name      testFieldDeclarationOne0004
     * @tc.desc      Checking for initialization private optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F106 = new A_F106()
      expect(a.field instanceof C_F106).assertFalse()
      expect(a.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_0500
     * @tc.name      testFieldDeclarationOne0005
     * @tc.desc      Checking for initialization private optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F107 = new A_F107()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_0600
     * @tc.name      testFieldDeclarationOne0006
     * @tc.desc      Checking for initialization private optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F108 = new A_F108()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_0700
     * @tc.name      testFieldDeclarationOne0007
     * @tc.desc      Checking for initialization public optional field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F109 = new A_F109()
      expect(typeof a.field).assertEqual("number")
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_0800
     * @tc.name      testFieldDeclarationOne0008
     * @tc.desc      Checking for initialization public optional field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F110 = new A_F110()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_0900
     * @tc.name      testFieldDeclarationOne0009
     * @tc.desc      Checking for initialization protected optional field with implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F111 = new A_F111()
      expect(a.field instanceof C_F111).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_1000
     * @tc.name      testFieldDeclarationOne0010
     * @tc.desc      Checking for initialization protected optional field with implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F112 = new A_F112()
      expect(a.field instanceof C_F112).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_1100
     * @tc.name      testFieldDeclarationOne0011
     * @tc.desc      Checking for initialization public optional field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F113 = new A_F113()
      expect(a.field instanceof C_F113).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_1200
     * @tc.name      testFieldDeclarationOne0012
     * @tc.desc      Checking for initialization private optional field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F115 = new A_F115()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_1300
     * @tc.name      testFieldDeclarationOne0013
     * @tc.desc      Checking for initialization private optional field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F116 = new A_F116()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_1400
     * @tc.name      testFieldDeclarationOne0014
     * @tc.desc      Checking for initialization private optional field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F117 = new A_F117()
      expect(a.field instanceof C_F117).assertTrue()
      expect(typeof a.field!!.data).assertEqual('int')
      expect(a.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_1500
     * @tc.name      testFieldDeclarationOne0015
     * @tc.desc      Checking for initialization protected optional field with implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F119 = new A_F119()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_1600
     * @tc.name      testFieldDeclarationOne0016
     * @tc.desc      Checking for initialization protected optional field with implicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F120 = new A_F120()
      expect(typeof a.field).assertEqual("int")
      expect(a.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_1700
     * @tc.name      testFieldDeclarationOne0017
     * @tc.desc      Checking for initialization public static field with explicit type with default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F121.field).assertEqual("int")
      expect(A_F121.field).assertEqual(0)
      A_F121.field = 5
      expect(typeof A_F121.field).assertEqual("int")
      expect(A_F121.field).assertEqual(5)
      A_F121.field = 0
      expect(typeof A_F121.field).assertEqual("int")
      expect(A_F121.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_1800
     * @tc.name      testFieldDeclarationOne0018
     * @tc.desc      Checking for initialization public static field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F122.field).assertEqual("int")
      expect(A_F122.field).assertEqual(4)
      A_F122.field = 5
      expect(typeof A_F122.field).assertEqual("int")
      expect(A_F122.field).assertEqual(5)
      A_F122.field = 4
      expect(typeof A_F122.field).assertEqual("int")
      expect(A_F122.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_1900
     * @tc.name      testFieldDeclarationOne0019
     * @tc.desc      Checking for initialization protected static field with explicit type with default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F123.field).assertEqual("int")
      expect(A_F123.field).assertEqual(0)
      A_F123.field = 5
      expect(typeof A_F123.field).assertEqual("int")
      expect(A_F123.field).assertEqual(5)
      A_F123.field = 0
      expect(typeof A_F123.field).assertEqual("int")
      expect(A_F123.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_2000
     * @tc.name      testFieldDeclarationOne0020
     * @tc.desc      Checking for initialization protected static field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F124.field).assertEqual("int")
      expect(A_F124.field).assertEqual(4)
      A_F124.field = 5
      expect(typeof A_F124.field).assertEqual("int")
      expect(A_F124.field).assertEqual(5)
      A_F124.field = 4
      expect(typeof A_F124.field).assertEqual("int")
      expect(A_F124.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_2100
     * @tc.name      testFieldDeclarationOne0021
     * @tc.desc      Checking for initialization protected static field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F125.field).assertEqual("int")
      expect(A_F125.field).assertEqual(0)
      A_F125.field = 5
      expect(typeof A_F125.field).assertEqual("int")
      expect(A_F125.field).assertEqual(5)
      A_F125.field = 0
      expect(typeof A_F125.field).assertEqual("int")
      expect(A_F125.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_2200
     * @tc.name      testFieldDeclarationOne0022
     * @tc.desc      Checking for initialization protected static field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F126.field instanceof C_F126).assertTrue()
      expect(typeof A_F126.field!.data).assertEqual('int')
      expect(A_F126.field.data).assertEqual(4)
      A_F126.field = new C_F126()
      A_F126.field.data = 5
      expect(A_F126.field instanceof C_F126).assertTrue()
      expect(typeof A_F126.field!.data).assertEqual('int')
      expect(A_F126.field.data).assertEqual(5)
      A_F126.field = new C_F126()
      A_F126.field.data = 4
      expect(A_F126.field instanceof C_F126).assertTrue()
      expect(typeof A_F126.field!.data).assertEqual('int')
      expect(A_F126.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_2300
     * @tc.name      testFieldDeclarationOne0023
     * @tc.desc      Checking for initialization protected static field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F127.field instanceof C_F127).assertTrue()
      expect(typeof A_F127.field!.data).assertEqual('int')
      expect(A_F127.field.data).assertEqual(0)
      A_F127.field = new C_F127()
      A_F127.field.data = 5
      expect(A_F127.field instanceof C_F127).assertTrue()
      expect(typeof A_F127.field!.data).assertEqual('int')
      expect(A_F127.field.data).assertEqual(5)
      A_F127.field = new C_F127()
      A_F127.field.data = 4
      expect(A_F127.field instanceof C_F127).assertTrue()
      expect(typeof A_F127.field!.data).assertEqual('int')
      expect(A_F127.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_2400
     * @tc.name      testFieldDeclarationOne0024
     * @tc.desc      Checking for initialization public static field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F128.field).assertEqual("int")
      expect(A_F128.field).assertEqual(0)
      A_F128.field = 5
      expect(typeof A_F128.field).assertEqual("int")
      expect(A_F128.field).assertEqual(5)
      A_F128.field = 0
      expect(typeof A_F128.field).assertEqual("int")
      expect(A_F128.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_2500
     * @tc.name      testFieldDeclarationOne0025
     * @tc.desc      Checking for initialization public static field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F129.field instanceof C_F129).assertTrue()
      expect(typeof A_F129.field!.data).assertEqual('int')
      expect(A_F129.field.data).assertEqual(4)
      A_F129.field = new C_F129()
      A_F129.field.data = 5
      expect(A_F129.field instanceof C_F129).assertTrue()
      expect(typeof A_F129.field!.data).assertEqual('int')
      expect(A_F129.field.data).assertEqual(5)
      A_F129.field = new C_F129()
      A_F129.field.data = 4
      expect(A_F129.field instanceof C_F129).assertTrue()
      expect(typeof A_F129.field!.data).assertEqual('int')
      expect(A_F129.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_2600
     * @tc.name      testFieldDeclarationOne0026
     * @tc.desc      Checking for initialization public static field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F130.field instanceof C_F130).assertTrue()
      expect(typeof A_F130.field!.data).assertEqual('int')
      expect(A_F130.field.data).assertEqual(0)
      A_F130.field = new C_F130()
      A_F130.field.data = 5
      expect(A_F130.field instanceof C_F130).assertTrue()
      expect(typeof A_F130.field!.data).assertEqual('int')
      expect(A_F130.field.data).assertEqual(5)
      A_F130.field = new C_F130()
      A_F130.field.data = 4
      expect(A_F130.field instanceof C_F130).assertTrue()
      expect(typeof A_F130.field!.data).assertEqual('int')
      expect(A_F130.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_2700
     * @tc.name      testFieldDeclarationOne0027
     * @tc.desc      Checking for initialization private static field with explicit type with default
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F131.field).assertEqual("int")
      expect(A_F131.field).assertEqual(0)
      A_F131.field = 5
      expect(typeof A_F131.field).assertEqual("int")
      expect(A_F131.field).assertEqual(5)
      A_F131.field = 0
      expect(typeof A_F131.field).assertEqual("int")
      expect(A_F131.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_2800
     * @tc.name      testFieldDeclarationOne0028
     * @tc.desc      Checking for initialization private static field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F132.field).assertEqual("int")
      expect(A_F132.field).assertEqual(4)
      A_F132.field = 5
      expect(typeof A_F132.field).assertEqual("int")
      expect(A_F132.field).assertEqual(5)
      A_F132.field = 4
      expect(typeof A_F132.field).assertEqual("int")
      expect(A_F132.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_2900
     * @tc.name      testFieldDeclarationOne0029
     * @tc.desc      Checking for initialization private static field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F133.field).assertEqual("int")
      expect(A_F133.field).assertEqual(0)
      A_F133.field = 5
      expect(typeof A_F133.field).assertEqual("int")
      expect(A_F133.field).assertEqual(5)
      A_F133.field = 0
      expect(typeof A_F133.field).assertEqual("int")
      expect(A_F133.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_3000
     * @tc.name      testFieldDeclarationOne0030
     * @tc.desc      Checking for initialization private static field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F134.field instanceof C_F134).assertTrue()
      expect(typeof A_F134.field!.data).assertEqual('int')
      expect(A_F134.field.data).assertEqual(4)
      A_F134.field = new C_F134()
      A_F134.field.data = 5
      expect(A_F134.field instanceof C_F134).assertTrue()
      expect(typeof A_F134.field!.data).assertEqual('int')
      expect(A_F134.field.data).assertEqual(5)
      A_F134.field = new C_F134()
      A_F134.field.data = 4
      expect(A_F134.field instanceof C_F134).assertTrue()
      expect(typeof A_F134.field!.data).assertEqual('int')
      expect(A_F134.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_3100
     * @tc.name      testFieldDeclarationOne0031
     * @tc.desc      Checking for initialization private static field with explicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F135.field instanceof C_F135).assertTrue()
      expect(typeof A_F135.field!.data).assertEqual('int')
      expect(A_F135.field.data).assertEqual(0)
      A_F135.field = new C_F135()
      A_F135.field.data = 5
      expect(A_F135.field instanceof C_F135).assertTrue()
      expect(typeof A_F135.field!.data).assertEqual('int')
      expect(A_F135.field.data).assertEqual(5)
      A_F135.field = new C_F135()
      A_F135.field.data = 4
      expect(A_F135.field instanceof C_F135).assertTrue()
      expect(typeof A_F135.field!.data).assertEqual('int')
      expect(A_F135.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_3200
     * @tc.name      testFieldDeclarationOne0032
     * @tc.desc      Checking for initialization public static field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F137.field).assertEqual("number")
      expect(A_F137.field).assertEqual(0)
      A_F137.field = 5
      expect(typeof A_F137.field).assertEqual("number")
      expect(A_F137.field).assertEqual(5)
      A_F137.field = 0.0
      expect(typeof A_F137.field).assertEqual("number")
      expect(A_F137.field).assertEqual(0.0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_3300
     * @tc.name      testFieldDeclarationOne0033
     * @tc.desc      Checking for initialization protected static field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F138.field instanceof C_F138).assertTrue()
      expect(typeof A_F138.field!.data).assertEqual('int')
      expect(A_F138.field.data).assertEqual(4)
      A_F138.field = new C_F138(5)
      expect(A_F138.field instanceof C_F138).assertTrue()
      expect(typeof A_F138.field!.data).assertEqual('int')
      expect(A_F138.field.data).assertEqual(5)
      A_F138.field = new C_F138(4)
      expect(A_F138.field instanceof C_F138).assertTrue()
      expect(typeof A_F138.field!.data).assertEqual('int')
      expect(A_F138.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_3400
     * @tc.name      testFieldDeclarationOne0034
     * @tc.desc      Checking for initialization protected static field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F139.field instanceof C_F139).assertTrue()
      expect(typeof A_F139.field!.data).assertEqual('int')
      expect(A_F139.field.data).assertEqual(0)
      A_F139.field = new C_F139(5)
      expect(A_F139.field instanceof C_F139).assertTrue()
      expect(typeof A_F139.field!.data).assertEqual('int')
      expect(A_F139.field.data).assertEqual(5)
      A_F139.field = new C_F139(4)
      expect(A_F139.field instanceof C_F139).assertTrue()
      expect(typeof A_F139.field!.data).assertEqual('int')
      expect(A_F139.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_3500
     * @tc.name      testFieldDeclarationOne0035
     * @tc.desc      Checking for initialization public static field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F140.field instanceof C_F140).assertTrue()
      expect(typeof A_F140.field!.data).assertEqual('int')
      expect(A_F140.field.data).assertEqual(4)
      A_F140.field = new C_F140(5)
      expect(A_F140.field instanceof C_F140).assertTrue()
      expect(typeof A_F140.field!.data).assertEqual('int')
      expect(A_F140.field.data).assertEqual(5)
      A_F140.field = new C_F140(4)
      expect(A_F140.field instanceof C_F140).assertTrue()
      expect(typeof A_F140.field!.data).assertEqual('int')
      expect(A_F140.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_3600
     * @tc.name      testFieldDeclarationOne0036
     * @tc.desc      Checking for initialization public static field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F141.field instanceof C_F141).assertTrue()
      expect(typeof A_F141.field!.data).assertEqual('int')
      expect(A_F141.field.data).assertEqual(0)
      A_F141.field = new C_F141(5)
      expect(A_F141.field instanceof C_F141).assertTrue()
      expect(typeof A_F141.field!.data).assertEqual('int')
      expect(A_F141.field.data).assertEqual(5)
      A_F141.field = new C_F141(4)
      expect(A_F141.field instanceof C_F141).assertTrue()
      expect(typeof A_F141.field!.data).assertEqual('int')
      expect(A_F141.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_3700
     * @tc.name      testFieldDeclarationOne0037
     * @tc.desc      Checking for initialization private static field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F142.field).assertEqual("int")
      expect(A_F142.field).assertEqual(4)
      A_F142.field = 5
      expect(typeof A_F142.field).assertEqual("int")
      expect(A_F142.field).assertEqual(5)
      A_F142.field = 4
      expect(typeof A_F142.field).assertEqual("int")
      expect(A_F142.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_3800
     * @tc.name      testFieldDeclarationOne0038
     * @tc.desc      Checking for initialization private static field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F143.field).assertEqual("int")
      expect(A_F143.field).assertEqual(0)
      A_F143.field = 5
      expect(typeof A_F143.field).assertEqual("int")
      expect(A_F143.field).assertEqual(5)
      A_F143.field = 0
      expect(typeof A_F143.field).assertEqual("int")
      expect(A_F143.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_3900
     * @tc.name      testFieldDeclarationOne0039
     * @tc.desc      Checking for initialization private static field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F144.field instanceof C_F144).assertTrue()
      expect(typeof A_F144.field!.data).assertEqual('int')
      expect(A_F144.field.data).assertEqual(4)
      A_F144.field = new C_F144(5)
      expect(A_F144.field instanceof C_F144).assertTrue()
      expect(typeof A_F144.field!.data).assertEqual('int')
      expect(A_F144.field.data).assertEqual(5)
      A_F144.field = new C_F144(4)
      expect(A_F144.field instanceof C_F144).assertTrue()
      expect(typeof A_F144.field!.data).assertEqual('int')
      expect(A_F144.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_4000
     * @tc.name      testFieldDeclarationOne0040
     * @tc.desc      Checking for initialization private static field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F145.field instanceof C_F145).assertTrue()
      expect(typeof A_F145.field!.data).assertEqual('int')
      expect(A_F145.field.data).assertEqual(0)
      A_F145.field = new C_F145(5)
      expect(A_F145.field instanceof C_F145).assertTrue()
      expect(typeof A_F145.field!.data).assertEqual('int')
      expect(A_F145.field.data).assertEqual(5)
      A_F145.field = new C_F145(4)
      expect(A_F145.field instanceof C_F145).assertTrue()
      expect(typeof A_F145.field!.data).assertEqual('int')
      expect(A_F145.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_4100
     * @tc.name      testFieldDeclarationOne0041
     * @tc.desc      Checking for initialization protected static field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F146.field).assertEqual("int")
      expect(A_F146.field).assertEqual(4)
      A_F146.field = 5
      expect(typeof A_F146.field).assertEqual("int")
      expect(A_F146.field).assertEqual(5)
      A_F146.field = 4
      expect(typeof A_F146.field).assertEqual("int")
      expect(A_F146.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_4200
     * @tc.name      testFieldDeclarationOne0042
     * @tc.desc      Checking for initialization protected static field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F147.field).assertEqual("int")
      expect(A_F147.field).assertEqual(0)
      A_F147.field = 5
      expect(typeof A_F147.field).assertEqual("int")
      expect(A_F147.field).assertEqual(5)
      A_F147.field = 0
      expect(typeof A_F147.field).assertEqual("int")
      expect(A_F147.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_4300
     * @tc.name      testFieldDeclarationOne0043
     * @tc.desc      Checking for initialization public static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F148.field).assertEqual("undefined")
      expect(A_F148.field).assertEqual(undefined)
      A_F148.field = 5
      expect(typeof A_F148.field).assertEqual("int")
      expect(A_F148.field).assertEqual(5)
      A_F148.field = undefined
      expect(typeof A_F148.field).assertEqual("undefined")
      expect(A_F148.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_4400
     * @tc.name      testFieldDeclarationOne0044
     * @tc.desc      Checking for initialization public static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F149.field instanceof C_F149).assertFalse()
      expect(A_F149.field).assertEqual(undefined)
      A_F149.field = new C_F149()
      A_F149.field!.data = 5
      expect(A_F149.field instanceof C_F149).assertTrue()
      expect(typeof A_F149.field!!.data).assertEqual('int')
      expect(A_F149.field!.data).assertEqual(5)
      A_F149.field = undefined
      expect(A_F149.field instanceof C_F149).assertFalse()
      expect(A_F149.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_4500
     * @tc.name      testFieldDeclarationOne0045
     * @tc.desc      Checking for initialization private static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F150.field instanceof C_F150).assertTrue()
      expect(typeof A_F150.field!!.data).assertEqual('int')
      expect(A_F150.field!.data).assertEqual(4)
      A_F150.field = new C_F150()
      A_F150.field!.data = 5
      expect(A_F150.field instanceof C_F150).assertTrue()
      expect(typeof A_F150.field!!.data).assertEqual('int')
      expect(A_F150.field!.data).assertEqual(5)
      A_F150.field = new C_F150()
      A_F150.field!.data = 4
      expect(A_F150.field instanceof C_F150).assertTrue()
      expect(typeof A_F150.field!!.data).assertEqual('int')
      expect(A_F150.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_4600
     * @tc.name      testFieldDeclarationOne0046
     * @tc.desc      Checking for initialization private static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F151.field instanceof C_F151).assertTrue()
      expect(typeof A_F151.field!!.data).assertEqual('int')
      expect(A_F151.field!.data).assertEqual(0)
      A_F151.field = new C_F151()
      A_F151.field!.data = 5
      expect(A_F151.field instanceof C_F151).assertTrue()
      expect(typeof A_F151.field!!.data).assertEqual('int')
      expect(A_F151.field!.data).assertEqual(5)
      A_F151.field = new C_F151()
      A_F151.field!.data = 4
      expect(A_F151.field instanceof C_F151).assertTrue()
      expect(typeof A_F151.field!!.data).assertEqual('int')
      expect(A_F151.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_4700
     * @tc.name      testFieldDeclarationOne0047
     * @tc.desc      Checking for initialization protected static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F152.field).assertEqual("undefined")
      expect(A_F152.field).assertEqual(undefined)
      A_F152.field = 5
      expect(typeof A_F152.field).assertEqual("int")
      expect(A_F152.field).assertEqual(5)
      A_F152.field = undefined
      expect(typeof A_F152.field).assertEqual("undefined")
      expect(A_F152.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_4800
     * @tc.name      testFieldDeclarationOne0048
     * @tc.desc      Checking for initialization protected static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F153.field instanceof C_F153).assertFalse()
      expect(A_F153.field).assertEqual(undefined)
      A_F153.field = new C_F153()
      A_F153.field!.data = 5
      expect(A_F153.field instanceof C_F153).assertTrue()
      expect(typeof A_F153.field!!.data).assertEqual('int')
      expect(A_F153.field!.data).assertEqual(5)
      A_F153.field = undefined
      expect(A_F153.field instanceof C_F153).assertFalse()
      expect(A_F153.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_4900
     * @tc.name      testFieldDeclarationOne0049
     * @tc.desc      Checking for initialization protected static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F154.field).assertEqual("int")
      expect(A_F154.field).assertEqual(4)
      A_F154.field = 5
      expect(typeof A_F154.field).assertEqual("int")
      expect(A_F154.field).assertEqual(5)
      A_F154.field = 4
      expect(typeof A_F154.field).assertEqual("int")
      expect(A_F154.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_5000
     * @tc.name      testFieldDeclarationOne0050
     * @tc.desc      Checking for initialization protected static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F155.field).assertEqual("int")
      expect(A_F155.field).assertEqual(0)
      A_F155.field = 5
      expect(typeof A_F155.field).assertEqual("int")
      expect(A_F155.field).assertEqual(5)
      A_F155.field = 0
      expect(typeof A_F155.field).assertEqual("int")
      expect(A_F155.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_5100
     * @tc.name      testFieldDeclarationOne0051
     * @tc.desc      Checking for initialization protected static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F156.field instanceof C_F156).assertTrue()
      expect(typeof A_F156.field!!.data).assertEqual('int')
      expect(A_F156.field!.data).assertEqual(4)
      A_F156.field = new C_F156()
      A_F156.field!.data = 5
      expect(A_F156.field instanceof C_F156).assertTrue()
      expect(typeof A_F156.field!!.data).assertEqual('int')
      expect(A_F156.field!.data).assertEqual(5)
      A_F156.field = new C_F156()
      A_F156.field!.data = 4
      expect(A_F156.field instanceof C_F156).assertTrue()
      expect(typeof A_F156.field!!.data).assertEqual('int')
      expect(A_F156.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_5200
     * @tc.name      testFieldDeclarationOne0052
     * @tc.desc      Checking for initialization protected static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F157.field instanceof C_F157).assertTrue()
      expect(typeof A_F157.field!!.data).assertEqual('int')
      expect(A_F157.field!.data).assertEqual(0)
      A_F157.field = new C_F157()
      A_F157.field!.data = 5
      expect(A_F157.field instanceof C_F157).assertTrue()
      expect(typeof A_F157.field!!.data).assertEqual('int')
      expect(A_F157.field!.data).assertEqual(5)
      A_F157.field = new C_F157()
      A_F157.field!.data = 4
      expect(A_F157.field instanceof C_F157).assertTrue()
      expect(typeof A_F157.field!!.data).assertEqual('int')
      expect(A_F157.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_5300
     * @tc.name      testFieldDeclarationOne0053
     * @tc.desc      Checking for initialization public static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F158.field).assertEqual("int")
      expect(A_F158.field).assertEqual(4)
      A_F158.field = 5
      expect(typeof A_F158.field).assertEqual("int")
      expect(A_F158.field).assertEqual(5)
      A_F158.field = 4
      expect(typeof A_F158.field).assertEqual("int")
      expect(A_F158.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_5400
     * @tc.name      testFieldDeclarationOne0054
     * @tc.desc      Checking for initialization public static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F159.field).assertEqual("int")
      expect(A_F159.field).assertEqual(0)
      A_F159.field = 5
      expect(typeof A_F159.field).assertEqual("int")
      expect(A_F159.field).assertEqual(5)
      A_F159.field = 0
      expect(typeof A_F159.field).assertEqual("int")
      expect(A_F159.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_5500
     * @tc.name      testFieldDeclarationOne0055
     * @tc.desc      Checking for initialization public static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F160.field instanceof C_F160).assertTrue()
      expect(typeof A_F160.field!!.data).assertEqual('int')
      expect(A_F160.field!.data).assertEqual(4)
      A_F160.field = new C_F160()
      A_F160.field!.data = 5
      expect(A_F160.field instanceof C_F160).assertTrue()
      expect(typeof A_F160.field!!.data).assertEqual('int')
      expect(A_F160.field!.data).assertEqual(5)
      A_F160.field = new C_F160()
      A_F160.field!.data = 4
      expect(A_F160.field instanceof C_F160).assertTrue()
      expect(typeof A_F160.field!!.data).assertEqual('int')
      expect(A_F160.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_5600
     * @tc.name      testFieldDeclarationOne0056
     * @tc.desc      Checking for initialization public static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F161.field instanceof C_F161).assertTrue()
      expect(typeof A_F161.field!!.data).assertEqual('int')
      expect(A_F161.field!.data).assertEqual(0)
      A_F161.field = new C_F161()
      A_F161.field!.data = 5
      expect(A_F161.field instanceof C_F161).assertTrue()
      expect(typeof A_F161.field!!.data).assertEqual('int')
      expect(A_F161.field!.data).assertEqual(5)
      A_F161.field = new C_F161()
      A_F161.field!.data = 4
      expect(A_F161.field instanceof C_F161).assertTrue()
      expect(typeof A_F161.field!!.data).assertEqual('int')
      expect(A_F161.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_5700
     * @tc.name      testFieldDeclarationOne0057
     * @tc.desc      Checking for initialization private static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F162.field).assertEqual("undefined")
      expect(A_F162.field).assertEqual(undefined)
      A_F162.field = 5
      expect(typeof A_F162.field).assertEqual("int")
      expect(A_F162.field).assertEqual(5)
      A_F162.field = undefined
      expect(typeof A_F162.field).assertEqual("undefined")
      expect(A_F162.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_5800
     * @tc.name      testFieldDeclarationOne0058
     * @tc.desc      Checking for initialization private static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F163.field instanceof C_F163).assertFalse()
      expect(A_F163.field).assertEqual(undefined)
      A_F163.field = new C_F163()
      A_F163.field!.data = 5
      expect(A_F163.field instanceof C_F163).assertTrue()
      expect(typeof A_F163.field!!.data).assertEqual('int')
      expect(A_F163.field!.data).assertEqual(5)
      A_F163.field = undefined
      expect(A_F163.field instanceof C_F163).assertFalse()
      expect(A_F163.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_5900
     * @tc.name      testFieldDeclarationOne0059
     * @tc.desc      Checking for initialization private static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F164.field).assertEqual("int")
      expect(A_F164.field).assertEqual(4)
      A_F164.field = 5
      expect(typeof A_F164.field).assertEqual("int")
      expect(A_F164.field).assertEqual(5)
      A_F164.field = 4
      expect(typeof A_F164.field).assertEqual("int")
      expect(A_F164.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_6000
     * @tc.name      testFieldDeclarationOne0060
     * @tc.desc      Checking for initialization private static optional field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F165.field).assertEqual("int")
      expect(A_F165.field).assertEqual(0)
      A_F165.field = 5
      expect(typeof A_F165.field).assertEqual("int")
      expect(A_F165.field).assertEqual(5)
      A_F165.field = 0
      expect(typeof A_F165.field).assertEqual("int")
      expect(A_F165.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_6100
     * @tc.name      testFieldDeclarationOne0061
     * @tc.desc      Checking for initialization public optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F166.field).assertEqual("int")
      expect(A_F166.field).assertEqual(4)
      A_F166.field = 5
      expect(typeof A_F166.field).assertEqual("int")
      expect(A_F166.field).assertEqual(5)
      A_F166.field = 4
      expect(typeof A_F166.field).assertEqual("int")
      expect(A_F166.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_6200
     * @tc.name      testFieldDeclarationOne0062
     * @tc.desc      Checking for initialization public optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F167.field).assertEqual("number")
      expect(A_F167.field).assertEqual(0.0)
      A_F167.field = 5
      expect(typeof A_F167.field).assertEqual("number")
      expect(A_F167.field).assertEqual(5)
      A_F167.field = 0.0
      expect(typeof A_F167.field).assertEqual("number")
      expect(A_F167.field).assertEqual(0.0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_6300
     * @tc.name      testFieldDeclarationOne0063
     * @tc.desc      Checking for initialization protected optional field with implicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F168.field instanceof C_F168).assertTrue()
      expect(typeof A_F168.field!!.data).assertEqual('int')
      expect(A_F168.field!.data).assertEqual(4)
      A_F168.field = new C_F168(5)
      expect(A_F168.field instanceof C_F168).assertTrue()
      expect(typeof A_F168.field!!.data).assertEqual('int')
      expect(A_F168.field!.data).assertEqual(5)
      A_F168.field = new C_F168(4)
      expect(A_F168.field instanceof C_F168).assertTrue()
      expect(typeof A_F168.field!!.data).assertEqual('int')
      expect(A_F168.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_6400
     * @tc.name      testFieldDeclarationOne0064
     * @tc.desc      Checking for initialization public optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F170.field instanceof C_F170).assertTrue()
      expect(typeof A_F170.field!!.data).assertEqual('int')
      expect(A_F170.field!.data).assertEqual(4)
      A_F170.field = new C_F170(5)
      expect(A_F170.field instanceof C_F170).assertTrue()
      expect(typeof A_F170.field!!.data).assertEqual('int')
      expect(A_F170.field!.data).assertEqual(5)
      A_F170.field = new C_F170(4)
      expect(A_F170.field instanceof C_F170).assertTrue()
      expect(typeof A_F170.field!!.data).assertEqual('int')
      expect(A_F170.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_6500
     * @tc.name      testFieldDeclarationOne0065
     * @tc.desc      Checking for initialization public optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F171.field).assertEqual(undefined)
      A_F171.field = new C_F171(4)
      expect(A_F171.field instanceof C_F171).assertTrue()
      expect(typeof A_F171.field!.data).assertEqual('int')
      expect(A_F171.field!.data).assertEqual(4)
      A_F171.field = new C_F171(5)
      expect(A_F171.field instanceof C_F171).assertTrue()
      expect(typeof A_F171.field!.data).assertEqual('int')
      expect(A_F171.field!.data).assertEqual(5)
      A_F171.field = new C_F171(4)
      expect(A_F171.field instanceof C_F171).assertTrue()
      expect(typeof A_F171.field!.data).assertEqual('int')
      expect(A_F171.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_6600
     * @tc.name      testFieldDeclarationOne0066
     * @tc.desc      Checking for initialization private optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F172.field).assertEqual("int")
      expect(A_F172.field).assertEqual(0)
      A_F172.field = 5
      expect(typeof A_F172.field).assertEqual("int")
      expect(A_F172.field).assertEqual(5)
      A_F172.field = 0
      expect(typeof A_F172.field).assertEqual("int")
      expect(A_F172.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_6700
     * @tc.name      testFieldDeclarationOne0067
     * @tc.desc      Checking for initialization private optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F173.field).assertEqual("int")
      expect(A_F173.field).assertEqual(0)
      A_F173.field = 5
      expect(typeof A_F173.field).assertEqual("int")
      expect(A_F173.field).assertEqual(5)
      A_F173.field = 0
      expect(typeof A_F173.field).assertEqual("int")
      expect(A_F173.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_6800
     * @tc.name      testFieldDeclarationOne0068
     * @tc.desc      Checking for initialization private optional field with implicit type with field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F174.field instanceof C_F174).assertTrue()
      expect(typeof A_F174.field!!.data).assertEqual('int')
      expect(A_F174.field!.data).assertEqual(4)
      A_F174.field = new C_F174(5)
      expect(A_F174.field instanceof C_F174).assertTrue()
      expect(typeof A_F174.field!!.data).assertEqual('int')
      expect(A_F174.field!.data).assertEqual(5)
      A_F174.field = new C_F174(4)
      expect(A_F174.field instanceof C_F174).assertTrue()
      expect(typeof A_F174.field!!.data).assertEqual('int')
      expect(A_F174.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_6900
     * @tc.name      testFieldDeclarationOne0069
     * @tc.desc      Checking for initialization protected optional field with implicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F176.field).assertEqual("undefined")
      expect(A_F176.field).assertEqual(undefined)
      A_F176.field = 5
      expect(typeof A_F176.field).assertEqual("int")
      expect(A_F176.field).assertEqual(5)
      A_F176.field = 4
      expect(typeof A_F176.field).assertEqual("int")
      expect(A_F176.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_7000
     * @tc.name      testFieldDeclarationOne0070
     * @tc.desc      Checking for initialization protected optional field with implicit type with
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F177.field).assertEqual("int")
      expect(A_F177.field).assertEqual(0)
      A_F177.field = 5
      expect(typeof A_F177.field).assertEqual("int")
      expect(A_F177.field).assertEqual(5)
      A_F177.field = 0
      expect(typeof A_F177.field).assertEqual("int")
      expect(A_F177.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_7100
     * @tc.name      testFieldDeclarationOne0071
     * @tc.desc      Checking for initialization protected static field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F180.field instanceof C_F180).assertTrue()
      expect(typeof A_F180.field!.data).assertEqual('int')
      expect(A_F180.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_7200
     * @tc.name      testFieldDeclarationOne0072
     * @tc.desc      Checking for initialization protected static field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F181.field instanceof C_F181).assertTrue()
      expect(typeof A_F181.field!.data).assertEqual('int')
      expect(A_F181.field.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_7300
     * @tc.name      testFieldDeclarationOne0073
     * @tc.desc      Checking for initialization public static field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F182.field instanceof C_F182).assertTrue()
      expect(typeof A_F182.field!.data).assertEqual('int')
      expect(A_F182.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_7400
     * @tc.name      testFieldDeclarationOne0074
     * @tc.desc      Checking for initialization public static field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F183.field instanceof C_F183).assertTrue()
      expect(typeof A_F183.field!.data).assertEqual('int')
      expect(A_F183.field.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_7500
     * @tc.name      testFieldDeclarationOne0075
     * @tc.desc      Checking for initialization private static field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F184.field).assertEqual("int")
      expect(A_F184.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_7600
     * @tc.name      testFieldDeclarationOne0076
     * @tc.desc      Checking for initialization private static field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F185.field).assertEqual("int")
      expect(A_F185.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_7700
     * @tc.name      testFieldDeclarationOne0077
     * @tc.desc      Checking for initialization private static field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F186.field instanceof C_F186).assertTrue()
      expect(typeof A_F186.field!.data).assertEqual('int')
      expect(A_F186.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_7800
     * @tc.name      testFieldDeclarationOne0078
     * @tc.desc      Checking for initialization private static field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F187.field instanceof C_F187).assertTrue()
      expect(typeof A_F187.field!.data).assertEqual('int')
      expect(A_F187.field.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_7900
     * @tc.name      testFieldDeclarationOne0079
     * @tc.desc      Checking for initialization protected static field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F188.field).assertEqual("int")
      expect(A_F188.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_8000
     * @tc.name      testFieldDeclarationOne0080
     * @tc.desc      Checking for initialization protected static field with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F189.field).assertEqual("int")
      expect(A_F189.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_8100
     * @tc.name      testFieldDeclarationOne0081
     * @tc.desc      Checking for initialization public static field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F190.field).assertEqual("number")
      expect(A_F190.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_8200
     * @tc.name      testFieldDeclarationOne0082
     * @tc.desc      Checking for initialization public static field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F191.field).assertEqual("int")
      expect(A_F191.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_8300
     * @tc.name      testFieldDeclarationOne0083
     * @tc.desc      Checking for initialization protected static field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F192.field instanceof C_F192).assertTrue()
      expect(typeof A_F192.field!.data).assertEqual('int')
      expect(A_F192.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_8400
     * @tc.name      testFieldDeclarationOne0084
     * @tc.desc      Checking for initialization protected static field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F193.field instanceof C_F193).assertTrue()
      expect(typeof A_F193.field!.data).assertEqual('int')
      expect(A_F193.field.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_8500
     * @tc.name      testFieldDeclarationOne0085
     * @tc.desc      Checking for initialization public static field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F194.field instanceof C_F194).assertTrue()
      expect(typeof A_F194.field!.data).assertEqual('int')
      expect(A_F194.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_8600
     * @tc.name      testFieldDeclarationOne0086
     * @tc.desc      Checking for initialization private static field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F196.field).assertEqual("int")
      expect(A_F196.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_8700
     * @tc.name      testFieldDeclarationOne0087
     * @tc.desc      Checking for initialization private static field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F197.field).assertEqual("int")
      expect(A_F197.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_8800
     * @tc.name      testFieldDeclarationOne0088
     * @tc.desc      Checking for initialization private static field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F198.field instanceof C_F198).assertTrue()
      expect(typeof A_F198.field!.data).assertEqual('int')
      expect(A_F198.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_8900
     * @tc.name      testFieldDeclarationOne0089
     * @tc.desc      Checking for initialization private static field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F199.field instanceof C_F199).assertTrue()
      expect(typeof A_F199.field!.data).assertEqual('int')
      expect(A_F199.field.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_9000
     * @tc.name      testFieldDeclarationOne0090
     * @tc.desc      Checking for initialization protected static field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F200.field).assertEqual("int")
      expect(A_F200.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_9100
     * @tc.name      testFieldDeclarationOne0091
     * @tc.desc      Checking for initialization protected static field with implicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F201.field).assertEqual("int")
      expect(A_F201.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_9200
     * @tc.name      testFieldDeclarationOne0092
     * @tc.desc      Checking for initialization public static optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F202.field).assertEqual("undefined")
      expect(A_F202.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_9300
     * @tc.name      testFieldDeclarationOne0093
     * @tc.desc      Checking for initialization public static optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F203.field instanceof C_F203).assertFalse()
      expect(A_F203.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_9400
     * @tc.name      testFieldDeclarationOne0094
     * @tc.desc      Checking for initialization private static optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F204.field instanceof C_F204).assertTrue()
      expect(typeof A_F204.field!!.data).assertEqual('int')
      expect(A_F204.field!.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_9500
     * @tc.name      testFieldDeclarationOne0095
     * @tc.desc      Checking for initialization private static optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F205.field instanceof C_F205).assertTrue()
      expect(typeof A_F205.field!!.data).assertEqual('int')
      expect(A_F205.field!.data).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_9600
     * @tc.name      testFieldDeclarationOne0096
     * @tc.desc      Checking for initialization protected static optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F206.field).assertEqual("undefined")
      expect(A_F206.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_9700
     * @tc.name      testFieldDeclarationOne0097
     * @tc.desc      Checking for initialization protected static optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F207.field instanceof C_F207).assertFalse()
      expect(A_F207.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_9800
     * @tc.name      testFieldDeclarationOne0098
     * @tc.desc      Checking for initialization protected static optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F208.field).assertEqual("int")
      expect(A_F208.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_DECLARATION_ONE_9900
     * @tc.name      testFieldDeclarationOne0099
     * @tc.desc      Checking for initialization protected static optional field with explicit
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldDeclarationOne0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof A_F209.field).assertEqual("int")
      expect(A_F209.field).assertEqual(0)
    })
  })
}
