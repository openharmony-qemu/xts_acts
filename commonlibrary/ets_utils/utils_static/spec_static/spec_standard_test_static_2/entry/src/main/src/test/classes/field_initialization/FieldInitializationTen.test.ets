/*
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

class A_F991 {
    static v: number = 4
    static field: number = A_F991.v
  }

class A_F992 {
    static v: float = 4.5f
    static field: float = A_F992.v
  }

class A_F993 {
    static v: bigint = 4n
    static field: bigint = A_F993.v
  }

class A_F994 {
    static v: string = "abc"
    static field: string = A_F994.v
  }

class A_F995 {
    static v: char = c'a'
    static field: char = A_F995.v
  }

class A_F996 {
    static v: boolean = false
    static field: boolean = A_F996.v
  }

class A_F997 {
    static v: Object = 4
    static field: Object = A_F997.v
  }

class A_F998 {
    static v: Object | undefined = undefined
    static field: Object | undefined = A_F998.v
  }

class A_F999 {
    static v: Object | undefined | null = 4
    static field: Object | undefined | null = A_F999.v
  }

class A_F1000 {
    static v: Any = 4
    static field: Any = A_F1000.v
  }

class A_F1001 {
    private static _v: long = 4
    static get v(): long {
      return A_F1001._v
    }
    static field: long = A_F1001.v
  }

class A_F1002 {
    private static _v: int = 4
    static get v(): int {
      return A_F1002._v
    }
    static field: int = A_F1002.v
  }

class A_F1003 {
    private static _v: byte = 4
    static get v(): byte {
      return A_F1003._v
    }
    static field: byte = A_F1003.v
  }

class A_F1004 {
    private static _v: short = 4
    static get v(): short {
      return A_F1004._v
    }
    static field: short = A_F1004.v
  }

class A_F1005 {
    private static _v: double = 4
    static get v(): double {
      return A_F1005._v
    }
    static field: double = A_F1005.v
  }

class A_F1006 {
    private static _v: int = 4
    static get v(): number {
      return A_F1006._v
    }
    static field: number = A_F1006.v
  }

class A_F1007 {
    private static _v: float = 4.5f
    static get v(): float {
      return A_F1007._v
    }
    static field: float = A_F1007.v
  }

class A_F1008 {
    private static _v: bigint = 4n
    static get v(): bigint {
      return A_F1008._v
    }
    static field: bigint = A_F1008.v
  }

class A_F1009 {
    private static _v: string = "abc"
    static get v(): string {
      return A_F1009._v
    }
    static field: string = A_F1009.v
  }

class A_F1010 {
    private static _v: char = c'a'
    static get v(): char {
      return A_F1010._v
    }
    static field: char = A_F1010.v
  }

class A_F1011 {
    private static _v: boolean = false
    static get v(): boolean {
      return A_F1011._v
    }
    static field: boolean = A_F1011.v
  }

class A_F1012 {
    private static _v: Object = 4
    static get v(): Object {
      return A_F1012._v
    }
    static field: Object = A_F1012.v
  }

class A_F1013 {
    private static _v: Object | undefined = undefined
    static get v(): Object | undefined {
      return A_F1013._v
    }
    static field: Object | undefined = A_F1013.v
  }

class A_F1014 {
    private static _v: Object | undefined | null = 4
    static get v(): Object | undefined | null {
      return A_F1014._v
    }
    static field: Object | undefined | null = A_F1014.v
  }

class A_F1015 {
    private static _v: Any = 4
    static get v(): Any {
      return A_F1015._v
    }
    static field: Any = A_F1015.v
  }

class Base_F1016 {
    private static _v: long = 4
    static get v(): long {
      return Base_F1016._v
    }
  }
  class A_F1016 extends Base_F1016 {
    static field: long = Base_F1016.v
  }

class Base_F1017 {
    private static _v: int = 4
    static get v(): int {
      return Base_F1017._v
    }
  }
  class A_F1017 extends Base_F1017 {
    static field: int = Base_F1017.v
  }

class Base_F1018 {
    private static _v: byte = 4
    static get v(): byte {
      return Base_F1018._v
    }
  }
  class A_F1018 extends Base_F1018 {
    static field: byte = Base_F1018.v
  }

class Base_F1019 {
    private static _v: short = 4
    static get v(): short {
      return Base_F1019._v
    }
  }
  class A_F1019 extends Base_F1019 {
    static field: short = Base_F1019.v
  }

class Base_F1020 {
    private static _v: double = 4
    static get v(): double {
      return Base_F1020._v
    }
  }
  class A_F1020 extends Base_F1020 {
    static field: double = Base_F1020.v
  }

class Base_F1021 {
    private static _v: int = 4
    static get v(): number {
      return Base_F1021._v
    }
  }
  class A_F1021 extends Base_F1021 {
    static field: number = Base_F1021.v
  }

class Base_F1022 {
    private static _v: float = 4.5f
    static get v(): float {
      return Base_F1022._v
    }
  }
  class A_F1022 extends Base_F1022 {
    static field: float = Base_F1022.v
  }

class Base_F1023 {
    private static _v: bigint = 4n
    static get v(): bigint {
      return Base_F1023._v
    }
  }
  class A_F1023 extends Base_F1023 {
    static field: bigint = Base_F1023.v
  }

class Base_F1024 {
    private static _v: string = "abc"
    static get v(): string {
      return Base_F1024._v
    }
  }
  class A_F1024 extends Base_F1024 {
    static field: string = Base_F1024.v
  }

class Base_F1025 {
    private static _v: char = c'a'
    static get v(): char {
      return Base_F1025._v
    }
  }
  class A_F1025 extends Base_F1025 {
    static field: char = Base_F1025.v
  }

class Base_F1026 {
    private static _v: boolean = false
    static get v(): boolean {
      return Base_F1026._v
    }
  }
  class A_F1026 extends Base_F1026 {
    static field: boolean = Base_F1026.v
  }

class Base_F1027 {
    private static _v: Object = 4
    static get v(): Object {
      return Base_F1027._v
    }
  }
  class A_F1027 extends Base_F1027 {
    static field: Object = Base_F1027.v
  }

class Base_F1028 {
    private static _v: Object | undefined = undefined
    static get v(): Object | undefined {
      return Base_F1028._v
    }
  }
  class A_F1028 extends Base_F1028 {
    static field: Object | undefined = Base_F1028.v
  }

class Base_F1029 {
    private static _v: Object | undefined | null = 4
    static get v(): Object | undefined | null {
      return Base_F1029._v
    }
  }
  class A_F1029 extends Base_F1029 {
    static field: Object | undefined | null = Base_F1029.v
  }

class Base_F1030 {
    private static _v: Any = 4
    static get v(): Any {
      return Base_F1030._v
    }
  }
  class A_F1030 extends Base_F1030 {
    static field: Any = Base_F1030.v
  }

function foo_F1030(): long {
    return 4
  }
  class A_F1031 {
    static field: long = foo_F1030()
  }

function foo_F1031(): int {
    return 4
  }
  class A_F1032 {
    static field: int = foo_F1031()
  }

function foo_F1032(): byte {
    return 4
  }
  class A_F1033 {
    static field: byte = foo_F1032()
  }

function foo_F1033(): short {
    return 4
  }
  class A_F1034 {
    static field: short = foo_F1033()
  }

function foo_F1034(): double {
    return 4
  }
  class A_F1035 {
    static field: double = foo_F1034()
  }

function foo_F1035(): number {
    return 4
  }
  class A_F1036 {
    static field: number = foo_F1035()
  }

function foo_F1036(): float {
    return 4.5f
  }
  class A_F1037 {
    static field: float = foo_F1036()
  }

function foo_F1037(): bigint {
    return 4n
  }
  class A_F1038 {
    static field: bigint = foo_F1037()
  }

function foo_F1038(): string {
    return "abc"
  }
  class A_F1039 {
    static field: string = foo_F1038()
  }

function foo_F1039(): char {
    return c'a'
  }
  class A_F1040 {
    static field: char = foo_F1039()
  }

function foo_F1040(): boolean {
    return false
  }
  class A_F1041 {
    static field: boolean = foo_F1040()
  }

function foo_F1041(): Object {
    return 4
  }
  class A_F1042 {
    static field: Object = foo_F1041()
  }

function foo_F1042(): Object | undefined {
    return undefined
  }
  class A_F1043 {
    static field: Object | undefined = foo_F1042()
  }

function foo_F1043(): Object | undefined | null {
    return 4
  }
  class A_F1044 {
    static field: Object | undefined | null = foo_F1043()
  }

function foo_F1044(): Any {
    return 4
  }
  class A_F1045 {
    static field: Any = foo_F1044()
  }
function foo_F1045(): Any {
    return 5
  }

class A_F1046 {
    private static v: long = 4
    private static _field: long = A_F1046.v
    static get field(): long {
      return A_F1046._field
    }
    static set field(a: long) {
      A_F1046._field = a
    }
  }

class A_F1047 {
    private static v: int = 4
    private static _field: int = A_F1047.v
    static get field(): int {
      return A_F1047._field
    }
    static set field(a: int) {
      A_F1047._field = a
    }
  }

class A_F1048 {
    private static v: byte = 4
    private static _field: byte = A_F1048.v
    static get field(): byte {
      return A_F1048._field
    }
    static set field(a: byte) {
      A_F1048._field = a
    }
  }

class A_F1049 {
    private static v: short = 4
    private static _field: short = A_F1049.v
    static get field(): short {
      return A_F1049._field
    }
    static set field(a: short) {
      A_F1049._field = a
    }
  }

class A_F1050 {
    private static v: double = 4
    private static _field: double = A_F1050.v
    static get field(): double {
      return A_F1050._field
    }
    static set field(a: double) {
      A_F1050._field = a
    }
  }

class A_F1051 {
    private static v: int = 4
    private static _field: number = A_F1051.v
    static get field(): number {
      return A_F1051._field
    }
    static set field(a: number) {
      A_F1051._field = a
    }
  }

class A_F1052 {
    private static v: float = 4.5f
    private static _field: float = A_F1052.v
    static get field(): float {
      return A_F1052._field
    }
    static set field(a: float) {
      A_F1052._field = a
    }
  }

class A_F1053 {
    private static v: bigint = 4n
    private static _field: bigint = A_F1053.v
    static get field(): bigint {
      return A_F1053._field
    }
    static set field(a: bigint) {
      A_F1053._field = a
    }
  }

class A_F1054 {
    private static v: string = "abc"
    private static _field: string = A_F1054.v
    static get field(): string {
      return A_F1054._field
    }
    static set field(a: string) {
      A_F1054._field = a
    }
  }

class A_F1055 {
    private static v: char = c'a'
    private static _field: char = A_F1055.v
    static get field(): char {
      return A_F1055._field
    }
    static set field(a: char) {
      A_F1055._field = a
    }
  }

class A_F1056 {
    private static v: boolean = false
    private static _field: boolean = A_F1056.v
    static get field(): boolean {
      return A_F1056._field
    }
    static set field(a: boolean) {
      A_F1056._field = a
    }
  }

class A_F1057 {
    private static v: Object = 4
    private static _field: Object = A_F1057.v
    static get field(): Object {
      return A_F1057._field
    }
    static set field(a: Object) {
      A_F1057._field = a
    }
  }

class A_F1058 {
    private static v: Object | undefined = undefined
    private static _field: Object | undefined = A_F1058.v
    static get field(): Object | undefined {
      return A_F1058._field
    }
    static set field(a: Object | undefined) {
      A_F1058._field = a
    }
  }

class A_F1059 {
    private static v: Object | undefined | null = 4
    private static _field: Object | undefined | null = A_F1059.v
    static get field(): Object | undefined | null {
      return A_F1059._field
    }
    static set field(a: Object | undefined | null) {
      A_F1059._field = a
    }
  }

class A_F1060 {
    private static v: Any = 4
    private static _field: Any = A_F1060.v
    static get field(): Any {
      return A_F1060._field
    }
    static set field(a: Any) {
      A_F1060._field = a
    }
  }

class Base_F1061 {
    protected static _v: long = 4
    static get v(): long {
      return Base_F1061._v
    }
  }
  class A_F1061 extends Base_F1061 {
    protected static _field: long = Base_F1061.v
    static get field(): long {
      return A_F1061._field
    }
    static set field(a: long) {
      A_F1061._field = a
    }
  }

class Base_F1062 {
    protected static _v: int = 4
    static get v(): int {
      return Base_F1062._v
    }
  }
  class A_F1062 extends Base_F1062 {
    protected static _field: int = Base_F1062.v
    static get field(): int {
      return A_F1062._field
    }
    static set field(a: int) {
      A_F1062._field = a
    }
  }

class Base_F1063 {
    protected static _v: byte = 4
    static get v(): byte {
      return Base_F1063._v
    }
  }
  class A_F1063 extends Base_F1063 {
    protected static _field: byte = Base_F1063.v
    static get field(): byte {
      return A_F1063._field
    }
    static set field(a: byte) {
      A_F1063._field = a
    }
  }

class Base_F1064 {
    protected static _v: short = 4
    static get v(): short {
      return Base_F1064._v
    }
  }
  class A_F1064 extends Base_F1064 {
    protected static _field: short = Base_F1064.v
    static get field(): short {
      return A_F1064._field
    }
    static set field(a: short) {
      A_F1064._field = a
    }
  }

class Base_F1065 {
    protected static _v: double = 4
    static get v(): double {
      return Base_F1065._v
    }
  }
  class A_F1065 extends Base_F1065 {
    protected static _field: double = Base_F1065.v
    static get field(): double {
      return A_F1065._field
    }
    static set field(a: double) {
      A_F1065._field = a
    }
  }

class Base_F1066 {
    protected static _v: number = 4
    static get v(): number {
      return Base_F1066._v
    }
  }
  class A_F1066 extends Base_F1066 {
    protected static _field: number = Base_F1066.v
    static get field(): number {
      return A_F1066._field
    }
    static set field(a: number) {
      A_F1066._field = a
    }
  }

class Base_F1067 {
    protected static _v: float = 4.5f
    static get v(): float {
      return Base_F1067._v
    }
  }
  class A_F1067 extends Base_F1067 {
    protected static _field: float = Base_F1067.v
    static get field(): float {
      return A_F1067._field
    }
    static set field(a: float) {
      A_F1067._field = a
    }
  }

class Base_F1068 {
    protected static _v: bigint = 4n
    static get v(): bigint {
      return Base_F1068._v
    }
  }
  class A_F1068 extends Base_F1068 {
    protected static _field: bigint = Base_F1068.v
    static get field(): bigint {
      return A_F1068._field
    }
    static set field(a: bigint) {
      A_F1068._field = a
    }
  }

class Base_F1069 {
    protected static _v: string = "abc"
    static get v(): string {
      return Base_F1069._v
    }
  }
  class A_F1069 extends Base_F1069 {
    protected static _field: string = Base_F1069.v
    static get field(): string {
      return A_F1069._field
    }
    static set field(a: string) {
      A_F1069._field = a
    }
  }

class Base_F1070 {
    protected static _v: char = c'a'
    static get v(): char {
      return Base_F1070._v
    }
  }
  class A_F1070 extends Base_F1070 {
    protected static _field: char = Base_F1070.v
    static get field(): char {
      return A_F1070._field
    }
    static set field(a: char) {
      A_F1070._field = a
    }
  }

class Base_F1071 {
    protected static _v: boolean = false
    static get v(): boolean {
      return Base_F1071._v
    }
  }
  class A_F1071 extends Base_F1071 {
    protected static _field: boolean = Base_F1071.v
    static get field(): boolean {
      return A_F1071._field
    }
    static set field(a: boolean) {
      A_F1071._field = a
    }
  }

class Base_F1072 {
    protected static _v: Object = 4
    static get v(): Object {
      return Base_F1072._v
    }
  }
  class A_F1072 extends Base_F1072 {
    protected static _field: Object = Base_F1072.v
    static get field(): Object {
      return A_F1072._field
    }
    static set field(a: Object) {
      A_F1072._field = a
    }
  }

class Base_F1073 {
    protected static _v: Object | undefined = undefined
    static get v(): Object | undefined {
      return Base_F1073._v
    }
  }
  class A_F1073 extends Base_F1073 {
    protected static _field: Object | undefined = Base_F1073.v
    static get field(): Object | undefined {
      return A_F1073._field
    }
    static set field(a: Object | undefined) {
      A_F1073._field = a
    }
  }

class Base_F1074 {
    protected static _v: Object | undefined | null = 4
    static get v(): Object | undefined | null {
      return Base_F1074._v
    }
  }
  class A_F1074 extends Base_F1074 {
    protected static _field: Object | undefined | null = Base_F1074.v
    static get field(): Object | undefined | null {
      return A_F1074._field
    }
    static set field(a: Object | undefined | null) {
      A_F1074._field = a
    }
  }

class Base_F1075 {
    protected static _v: Any = 4
    static get v(): Any {
      return Base_F1075._v
    }
  }
  class A_F1075 extends Base_F1075 {
    protected static _field: Any = Base_F1075.v
    static get field(): Any {
      return A_F1075._field
    }
    static set field(a: Any) {
      A_F1075._field = a
    }
  }

class C_F1076 {data: int = 0}
  class A_F1076 {
    static field: C_F1076 = {data: 4}
  }

class C_F1077 {data: int = 0}
  class A_F1077 {
    static v: C_F1077 = {data: 4}
    static field: C_F1077 = A_F1077.v
  }

class C_F1078 {data: int = 0}
  class A_F1078 {
    private static _v: C_F1078 = {data: 4}
    static get v(): C_F1078 {
      return A_F1078._v
    }
    static field: C_F1078 = A_F1078.v
  }

class C_F1079 {data: int = 0}
  class Base_F1079 {
    private static _v: C_F1079 = {data: 4}
    static get v(): C_F1079 {
      return Base_F1079._v
    }
  }
  class A_F1079 extends Base_F1079 {
    static field: C_F1079 = Base_F1079.v
  }

class C_F1080 {data: int = 0}
  function foo_F1079(): C_F1080 {
    return {data: 4}
  }
  class A_F1080 {
    static field: C_F1080 = foo_F1079()
  }
function foo_F1080(): C_F1080 {
    return {data: 4}
  }

class C_F1081 {data: int = 0}
  class A_F1081 {
    private static v: C_F1081 = {data: 4}
    private static _field: C_F1081 = A_F1081.v
    static get field(): C_F1081 {
      return A_F1081._field
    }
    static set field(a: C_F1081) {
      A_F1081._field = a
    }
  }

class C_F1082 {data: int = 0}
  class Base_F1082 {
    protected static _v: C_F1082 = {data: 4}
    static get v(): C_F1082 {
      return Base_F1082._v
    }
  }
  class A_F1082 extends Base_F1082 {
    protected static _field: C_F1082 = Base_F1082.v
    static get field(): C_F1082 {
      return A_F1082._field
    }
    static set field(a: C_F1082) {
      A_F1082._field = a
    }
  }

class Animal_F1083 {
    name: string = ""
  }
  class Dog_F1083 extends Animal_F1083 {
    constructor () {
      super()
      this.name = "dog"
    }
  }
  class Cat_F1083 extends Animal_F1083 {
    constructor () {
      super()
      this.name = "cat"
    }
  }
  class C_F1083 {
    static field: Animal_F1083 = new Animal_F1083
  }

class Animal_F1084 {
    name: string = ""
  }
  class Dog_F1084 extends Animal_F1084 {
    constructor () {
      super()
      this.name = "dog"
    }
  }
  class Cat_F1084 extends Animal_F1084 {
    constructor () {
      super()
      this.name = "cat"
    }
  }
  class C_F1084 {
    static field: Animal_F1084 = new Dog_F1084
  }

class Animal_F1085 {
    name: string = ""
  }
  class Dog_F1085 extends Animal_F1085 {
    constructor () {
      super()
      this.name = "dog"
    }
  }
  class Cat_F1085 extends Animal_F1085 {
    constructor () {
      super()
      this.name = "cat"
    }
  }
  class C_F1085 {
    static field: Animal_F1085 = new Cat_F1085
  }

class A_F1086 {
    v: int
    constructor(v: int = 0) {
      this.v = v
    }
  }
  class B_F1086 extends A_F1086 {
    constructor(v: int = 0) {
      super(-v)
    }
    foo(): int {
      return 13
    }
  }
  type HandlerBInt_F1086 = (a: B_F1086, b: int) => A_F1086
  type HandlerAInt_F1086 = (a: A_F1086, b: int) => B_F1086
  const handlerAInt_F1086: HandlerAInt_F1086 = (a: A_F1086, b: int): B_F1086 => {
    if (a instanceof B_F1086){
      return new B_F1086(a.foo() + b)
    } else {
      return new B_F1086(b)
    }
  }
  type HandlerA_F1086 = (a: A_F1086) => A_F1086
  const handlerA_F1086: HandlerA_F1086 = (a: A_F1086): A_F1086 => {
    if (a instanceof B_F1086){
      return new A_F1086(a.foo())
    } else {
      return new A_F1086
    }
  }
  type HandlerNothing_F1086 = () => B_F1086
  const handlerNothing_F1086: HandlerNothing_F1086 = (): B_F1086 => {
    return new B_F1086(567)
  }
  class C_F1086 {
    static field: HandlerBInt_F1086 = handlerNothing_F1086
  }

class A_F1087 {
    v: int
    constructor(v: int = 0) {
      this.v = v
    }
  }
  class B_F1087 extends A_F1087 {
    constructor(v: int = 0) {
      super(-v)
    }
    foo(): int {
      return 13
    }
  }
  type HandlerBInt_F1087 = (a: B_F1087, b: int) => A_F1087
  type HandlerAInt_F1087 = (a: A_F1087, b: int) => B_F1087
  const handlerAInt_F1087: HandlerAInt_F1087 = (a: A_F1087, b: int): B_F1087 => {
    if (a instanceof B_F1087){
      return new B_F1087(a.foo() + b)
    } else {
      return new B_F1087(b)
    }
  }
  type HandlerA_F1087 = (a: A_F1087) => A_F1087
  const handlerA_F1087: HandlerA_F1087 = (a: A_F1087): A_F1087 => {
    if (a instanceof B_F1087){
      return new A_F1087(a.foo())
    } else {
      return new A_F1087
    }
  }
  type HandlerNothing_F1087 = () => B_F1087
  const handlerNothing_F1087: HandlerNothing_F1087 = (): B_F1087 => {
    return new B_F1087(567)
  }
  class C_F1087 {
    static field: HandlerBInt_F1087 = handlerA_F1087
  }

class A_F1088 {
    v: int
    constructor(v: int = 0) {
      this.v = v
    }
  }
  class B_F1088 extends A_F1088 {
    constructor(v: int = 0) {
      super(-v)
    }
    foo(): int {
      return 13
    }
  }
  type HandlerBInt_F1088 = (a: B_F1088, b: int) => A_F1088
  type HandlerAInt_F1088 = (a: A_F1088, b: int) => B_F1088
  const handlerAInt_F1088: HandlerAInt_F1088 = (a: A_F1088, b: int): B_F1088 => {
    if (a instanceof B_F1088){
      return new B_F1088(a.foo() + b)
    } else {
      return new B_F1088(b)
    }
  }
  type HandlerA_F1088 = (a: A_F1088) => A_F1088
  const handlerA_F1088: HandlerA_F1088 = (a: A_F1088): A_F1088 => {
    if (a instanceof B_F1088){
      return new A_F1088(a.foo())
    } else {
      return new A_F1088
    }
  }
  type HandlerNothing_F1088 = () => B_F1088
  const handlerNothing_F1088: HandlerNothing_F1088 = (): B_F1088 => {
    return new B_F1088(567)
  }
  class C_F1088 {
    static field: HandlerBInt_F1088 = handlerAInt_F1088
  }

class A_F1089 {
    static field: long
    static {
      A_F1089.field = 4
    }
  }

export default function FieldInitializationTestTen(): void {
  describe("FieldInitializationTestTen", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0991
     * @tc.name      testFieldInit0991
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0991", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F991.field instanceof number).assertTrue()
      expect(A_F991.field).assertEqual(4)
          A_F991.field = 5
      expect(A_F991.field instanceof number).assertTrue()
      expect(A_F991.field).assertEqual(5)
          A_F991.field = 4
      expect(A_F991.field instanceof number).assertTrue()
      expect(A_F991.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0992
     * @tc.name      testFieldInit0992
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0992", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F992.field instanceof float).assertTrue()
      expect(A_F992.field).assertEqual(4.5f)
          A_F992.field = 7.3f
      expect(A_F992.field instanceof float).assertTrue()
      expect(A_F992.field).assertEqual(7.3f)
          A_F992.field = 4.5f
      expect(A_F992.field instanceof float).assertTrue()
      expect(A_F992.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0993
     * @tc.name      testFieldInit0993
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0993", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F993.field instanceof bigint).assertTrue()
      expect(A_F993.field).assertEqual(4n)
          A_F993.field = 5n
      expect(A_F993.field instanceof bigint).assertTrue()
      expect(A_F993.field).assertEqual(5n)
          A_F993.field = 4n
      expect(A_F993.field instanceof bigint).assertTrue()
      expect(A_F993.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0994
     * @tc.name      testFieldInit0994
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0994", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F994.field instanceof string).assertTrue()
      expect(A_F994.field).assertEqual("abc")
          A_F994.field = "efg"
      expect(A_F994.field instanceof string).assertTrue()
      expect(A_F994.field).assertEqual("efg")
          A_F994.field = "abc"
      expect(A_F994.field instanceof string).assertTrue()
      expect(A_F994.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0995
     * @tc.name      testFieldInit0995
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0995", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F995.field instanceof char).assertTrue()
      expect(A_F995.field).assertEqual(c'a')
          A_F995.field = c'b'
      expect(A_F995.field instanceof char).assertTrue()
      expect(A_F995.field).assertEqual(c'b')
          A_F995.field = c'a'
      expect(A_F995.field instanceof char).assertTrue()
      expect(A_F995.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0996
     * @tc.name      testFieldInit0996
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0996", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F996.field instanceof boolean).assertTrue()
      expect(A_F996.field).assertEqual(false)
          A_F996.field = true
      expect(A_F996.field instanceof boolean).assertTrue()
      expect(A_F996.field).assertEqual(true)
          A_F996.field = false
      expect(A_F996.field instanceof boolean).assertTrue()
      expect(A_F996.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0997
     * @tc.name      testFieldInit0997
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0997", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F997.field instanceof Object).assertTrue()
      expect(A_F997.field).assertEqual(4)
          A_F997.field = 5
      expect(A_F997.field instanceof Object).assertTrue()
      expect(A_F997.field).assertEqual(5)
          A_F997.field = 4
      expect(A_F997.field instanceof Object).assertTrue()
      expect(A_F997.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0998
     * @tc.name      testFieldInit0998
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0998", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F998.field instanceof Object | undefined).assertTrue()
      expect(A_F998.field).assertEqual(undefined)
          A_F998.field = 5
      expect(A_F998.field instanceof Object | undefined).assertTrue()
      expect(A_F998.field).assertEqual(5)
          A_F998.field = undefined
      expect(A_F998.field instanceof Object | undefined).assertTrue()
      expect(A_F998.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0999
     * @tc.name      testFieldInit0999
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0999", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F999.field instanceof Object | undefined | null).assertTrue()
      expect(A_F999.field).assertEqual(4)
          A_F999.field = 5
      expect(A_F999.field instanceof Object | undefined | null).assertTrue()
      expect(A_F999.field).assertEqual(5)
          A_F999.field = 4
      expect(A_F999.field instanceof Object | undefined | null).assertTrue()
      expect(A_F999.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1000
     * @tc.name      testFieldInit1000
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1000.field instanceof Any).assertTrue()
      expect(A_F1000.field).assertEqual(4)
          A_F1000.field = 5
      expect(A_F1000.field instanceof Any).assertTrue()
      expect(A_F1000.field).assertEqual(5)
          A_F1000.field = 4
      expect(A_F1000.field instanceof Any).assertTrue()
      expect(A_F1000.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1001
     * @tc.name      testFieldInit1001
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1001.field instanceof long).assertTrue()
      expect(A_F1001.field).assertEqual(4)
          A_F1001.field = 5
      expect(A_F1001.field instanceof long).assertTrue()
      expect(A_F1001.field).assertEqual(5)
          A_F1001.field = 4
      expect(A_F1001.field instanceof long).assertTrue()
      expect(A_F1001.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1002
     * @tc.name      testFieldInit1002
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1002.field instanceof int).assertTrue()
      expect(A_F1002.field).assertEqual(4)
          A_F1002.field = 5
      expect(A_F1002.field instanceof int).assertTrue()
      expect(A_F1002.field).assertEqual(5)
          A_F1002.field = 4
      expect(A_F1002.field instanceof int).assertTrue()
      expect(A_F1002.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1003
     * @tc.name      testFieldInit1003
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1003.field instanceof byte).assertTrue()
      expect(A_F1003.field).assertEqual(4)
          A_F1003.field = 5
      expect(A_F1003.field instanceof byte).assertTrue()
      expect(A_F1003.field).assertEqual(5)
          A_F1003.field = 4
      expect(A_F1003.field instanceof byte).assertTrue()
      expect(A_F1003.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1004
     * @tc.name      testFieldInit1004
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1004.field instanceof short).assertTrue()
      expect(A_F1004.field).assertEqual(4)
          A_F1004.field = 5
      expect(A_F1004.field instanceof short).assertTrue()
      expect(A_F1004.field).assertEqual(5)
          A_F1004.field = 4
      expect(A_F1004.field instanceof short).assertTrue()
      expect(A_F1004.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1005
     * @tc.name      testFieldInit1005
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1005.field instanceof double).assertTrue()
      expect(A_F1005.field).assertEqual(4)
          A_F1005.field = 7.3
      expect(A_F1005.field instanceof double).assertTrue()
      expect(A_F1005.field).assertEqual(7.3)
          A_F1005.field = 4
      expect(A_F1005.field instanceof double).assertTrue()
      expect(A_F1005.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1006
     * @tc.name      testFieldInit1006
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1006.field instanceof number).assertTrue()
      expect(A_F1006.field).assertEqual(4)
          A_F1006.field = 5
      expect(A_F1006.field instanceof number).assertTrue()
      expect(A_F1006.field).assertEqual(5)
          A_F1006.field = 4
      expect(A_F1006.field instanceof number).assertTrue()
      expect(A_F1006.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1007
     * @tc.name      testFieldInit1007
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1007.field instanceof float).assertTrue()
      expect(A_F1007.field).assertEqual(4.5f)
          A_F1007.field = 7.3f
      expect(A_F1007.field instanceof float).assertTrue()
      expect(A_F1007.field).assertEqual(7.3f)
          A_F1007.field = 4.5f
      expect(A_F1007.field instanceof float).assertTrue()
      expect(A_F1007.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1008
     * @tc.name      testFieldInit1008
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1008.field instanceof bigint).assertTrue()
      expect(A_F1008.field).assertEqual(4n)
          A_F1008.field = 5n
      expect(A_F1008.field instanceof bigint).assertTrue()
      expect(A_F1008.field).assertEqual(5n)
          A_F1008.field = 4n
      expect(A_F1008.field instanceof bigint).assertTrue()
      expect(A_F1008.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1009
     * @tc.name      testFieldInit1009
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1009.field instanceof string).assertTrue()
      expect(A_F1009.field).assertEqual("abc")
          A_F1009.field = "efg"
      expect(A_F1009.field instanceof string).assertTrue()
      expect(A_F1009.field).assertEqual("efg")
          A_F1009.field = "abc"
      expect(A_F1009.field instanceof string).assertTrue()
      expect(A_F1009.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1010
     * @tc.name      testFieldInit1010
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1010.field instanceof char).assertTrue()
      expect(A_F1010.field).assertEqual(c'a')
          A_F1010.field = c'b'
      expect(A_F1010.field instanceof char).assertTrue()
      expect(A_F1010.field).assertEqual(c'b')
          A_F1010.field = c'a'
      expect(A_F1010.field instanceof char).assertTrue()
      expect(A_F1010.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1011
     * @tc.name      testFieldInit1011
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1011.field instanceof boolean).assertTrue()
      expect(A_F1011.field).assertEqual(false)
          A_F1011.field = true
      expect(A_F1011.field instanceof boolean).assertTrue()
      expect(A_F1011.field).assertEqual(true)
          A_F1011.field = false
      expect(A_F1011.field instanceof boolean).assertTrue()
      expect(A_F1011.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1012
     * @tc.name      testFieldInit1012
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1012.field instanceof Object).assertTrue()
      expect(A_F1012.field).assertEqual(4)
          A_F1012.field = 5
      expect(A_F1012.field instanceof Object).assertTrue()
      expect(A_F1012.field).assertEqual(5)
          A_F1012.field = 4
      expect(A_F1012.field instanceof Object).assertTrue()
      expect(A_F1012.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1013
     * @tc.name      testFieldInit1013
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1013.field instanceof Object | undefined).assertTrue()
      expect(A_F1013.field).assertEqual(undefined)
          A_F1013.field = 5
      expect(A_F1013.field instanceof Object | undefined).assertTrue()
      expect(A_F1013.field).assertEqual(5)
          A_F1013.field = undefined
      expect(A_F1013.field instanceof Object | undefined).assertTrue()
      expect(A_F1013.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1014
     * @tc.name      testFieldInit1014
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1014.field instanceof Object | undefined | null).assertTrue()
      expect(A_F1014.field).assertEqual(4)
          A_F1014.field = 5
      expect(A_F1014.field instanceof Object | undefined | null).assertTrue()
      expect(A_F1014.field).assertEqual(5)
          A_F1014.field = 4
      expect(A_F1014.field instanceof Object | undefined | null).assertTrue()
      expect(A_F1014.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1015
     * @tc.name      testFieldInit1015
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1015.field instanceof Any).assertTrue()
      expect(A_F1015.field).assertEqual(4)
          A_F1015.field = 5
      expect(A_F1015.field instanceof Any).assertTrue()
      expect(A_F1015.field).assertEqual(5)
          A_F1015.field = 4
      expect(A_F1015.field instanceof Any).assertTrue()
      expect(A_F1015.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1016
     * @tc.name      testFieldInit1016
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1016.field instanceof long).assertTrue()
      expect(A_F1016.field).assertEqual(4)
          A_F1016.field = 5
      expect(A_F1016.field instanceof long).assertTrue()
      expect(A_F1016.field).assertEqual(5)
          A_F1016.field = 4
      expect(A_F1016.field instanceof long).assertTrue()
      expect(A_F1016.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1017
     * @tc.name      testFieldInit1017
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F1017.field instanceof int).assertTrue()
      expect(A_F1017.field).assertEqual(4)
          A_F1017.field = 5
      expect(A_F1017.field instanceof int).assertTrue()
      expect(A_F1017.field).assertEqual(5)
          A_F1017.field = 4
      expect(A_F1017.field instanceof int).assertTrue()
      expect(A_F1017.field).assertEqual(4)
    })
