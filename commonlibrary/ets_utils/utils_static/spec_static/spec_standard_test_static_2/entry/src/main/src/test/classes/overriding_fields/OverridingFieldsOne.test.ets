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

interface I_F100 {
  f: bigint
}

class Base_F100 implements I_F100 {
  f: bigint = 12345678901234567890n
}

class Derived_F100 extends Base_F100 {
  override f: bigint = 5556423623465n
}

function get_prop(i: I_F100): bigint {
  return i.f
}

function set_prop(i: I_F100, value: bigint) {
  i.f = value
}

function get_field(a: Base_F100): bigint {
  return a.f
}

function set_field(a: Base_F100, value: bigint) {
  a.f = value
}

interface I_F101 {
  f: char
}

class Base_F101 implements I_F101 {
  f: char = c'\u2028'
}

class Derived_F101 extends Base_F101 {
  override f: char = c'z'
}

function get_prop(i: I_F101): char {
  return i.f
}

function set_prop(i: I_F101, value: char) {
  i.f = value
}

function get_field(a: Base_F101): char {
  return a.f
}

function set_field(a: Base_F101, value: char) {
  a.f = value
}

interface I_F102 {
  f: boolean
}

class Base_F102 implements I_F102 {
  f: boolean = false
}

class Derived_F102 extends Base_F102 {
  override f: boolean = true
}

function get_prop(i: I_F102): boolean {
  return i.f
}

function set_prop(i: I_F102, value: boolean) {
  i.f = value
}

function get_field(a: Base_F102): boolean {
  return a.f
}

function set_field(a: Base_F102, value: boolean) {
  a.f = value
}

interface I_F103 {
  f: Any
}

class Base_F103 {
  f: Any = null
}

class Derived_F103 extends Base_F103 implements I_F103 {
  override f: Any = null
}

function get_prop(i: I_F103): Any {
  return i.f
}

function set_prop(i: I_F103, value: Any) {
  i.f = value
}

interface I_F104 {
  f: Object
}

class Base_F104 {
  f: Object = 5
}

class Derived_F104 extends Base_F104 implements I_F104 {
  override f: Object = 5
}

function get_prop(i: I_F104): Object {
  return i.f
}

function set_prop(i: I_F104, value: Object) {
  i.f = value
}

interface I_F105 {
  f: number
}

class Base_F105 {
  f: number = 3
}

class Derived_F105 extends Base_F105 implements I_F105 {
  override f: number = 3
}

function get_prop(i: I_F105): number {
  return i.f
}

function set_prop(i: I_F105, value: number) {
  i.f = value
}

interface I_F106 {
  f: double
}

class Base_F106 {
  f: double = 3.4
}

class Derived_F106 extends Base_F106 implements I_F106 {
  override f: double = 3.4
}

function get_prop(i: I_F106): double {
  return i.f
}

function set_prop(i: I_F106, value: double) {
  i.f = value
}

interface I_F107 {
  f: float
}

class Base_F107 {
  f: float = 6.7f
}

class Derived_F107 extends Base_F107 implements I_F107 {
  override f: float = 6.7f
}

function get_prop(i: I_F107): float {
  return i.f
}

function set_prop(i: I_F107, value: float) {
  i.f = value
}

interface I_F108 {
  f: long
}

class Base_F108 {
  f: long = 9223372036854775807
}

class Derived_F108 extends Base_F108 implements I_F108 {
  override f: long = 9223372036854775807
}

function get_prop(i: I_F108): long {
  return i.f
}

function set_prop(i: I_F108, value: long) {
  i.f = value
}

interface I_F109 {
  f: int
}

class Base_F109 {
  f: int = 123
}

class Derived_F109 extends Base_F109 implements I_F109 {
  override f: int = 123
}

function get_prop(i: I_F109): int {
  return i.f
}

function set_prop(i: I_F109, value: int) {
  i.f = value
}

interface I_F110 {
  f: short
}

class Base_F110 {
  f: short = 325
}

class Derived_F110 extends Base_F110 implements I_F110 {
  override f: short = 325
}

function get_prop(i: I_F110): short {
  return i.f
}

function set_prop(i: I_F110, value: short) {
  i.f = value
}

interface I_F111 {
  f: byte
}

class Base_F111 {
  f: byte = 127
}

class Derived_F111 extends Base_F111 implements I_F111 {
  override f: byte = 127
}

function get_prop(i: I_F111): byte {
  return i.f
}

function set_prop(i: I_F111, value: byte) {
  i.f = value
}

interface I_F112 {
  f: string
}

class Base_F112 {
  f: string = "abc"
}

class Derived_F112 extends Base_F112 implements I_F112 {
  override f: string = "abc"
}

function get_prop(i: I_F112): string {
  return i.f
}

function set_prop(i: I_F112, value: string) {
  i.f = value
}

interface I_F113 {
  f: bigint
}

class Base_F113 {
  f: bigint = 12345678901234567890n
}

class Derived_F113 extends Base_F113 implements I_F113 {
  override f: bigint = 12345678901234567890n
}

function get_prop(i: I_F113): bigint {
  return i.f
}

function set_prop(i: I_F113, value: bigint) {
  i.f = value
}

interface I_F114 {
  f: char
}

class Base_F114 {
  f: char = c'\u2028'
}

class Derived_F114 extends Base_F114 implements I_F114 {
  override f: char = c'\u2028'
}

function get_prop(i: I_F114): char {
  return i.f
}

function set_prop(i: I_F114, value: char) {
  i.f = value
}

interface I_F115 {
  f: boolean
}

class Base_F115 {
  f: boolean = false
}

class Derived_F115 extends Base_F115 implements I_F115 {
  override f: boolean = false
}

function get_prop(i: I_F115): boolean {
  return i.f
}

function set_prop(i: I_F115, value: boolean) {
  i.f = value
}

interface I1_F116 {
  f: Any
}
interface I2_F116 {
  f: Any
}
class A_F116 implements I1_F116, I2_F116 {
  f: Any = null
}

function get_prop_I1(i: I1_F116): Any {
  return i.f
}

function set_prop_I1(i: I1_F116, value: Any) {
  i.f = value
}

function get_prop_I2(i: I2_F116): Any {
  return i.f
}

function set_prop_I2(i: I2_F116, value: Any) {
  i.f = value
}

interface I1_F117 {
  f: Object
}
interface I2_F117 {
  f: Object
}
class A_F117 implements I1_F117, I2_F117 {
  f: Object = 5
}

function get_prop_I1(i: I1_F117): Object {
  return i.f
}

function set_prop_I1(i: I1_F117, value: Object) {
  i.f = value
}

function get_prop_I2(i: I2_F117): Object {
  return i.f
}

function set_prop_I2(i: I2_F117, value: Object) {
  i.f = value
}

interface I1_F118 {
  f: number
}
interface I2_F118 {
  f: number
}
class A_F118 implements I1_F118, I2_F118 {
  f: number = 3
}

function get_prop_I1(i: I1_F118): number {
  return i.f
}

function set_prop_I1(i: I1_F118, value: number) {
  i.f = value
}

function get_prop_I2(i: I2_F118): number {
  return i.f
}

function set_prop_I2(i: I2_F118, value: number) {
  i.f = value
}

interface I1_F119 {
  f: double
}
interface I2_F119 {
  f: double
}
class A_F119 implements I1_F119, I2_F119 {
  f: double = 3.4
}

function get_prop_I1(i: I1_F119): double {
  return i.f
}

function set_prop_I1(i: I1_F119, value: double) {
  i.f = value
}

function get_prop_I2(i: I2_F119): double {
  return i.f
}

function set_prop_I2(i: I2_F119, value: double) {
  i.f = value
}

interface I1_F120 {
  f: float
}
interface I2_F120 {
  f: float
}
class A_F120 implements I1_F120, I2_F120 {
  f: float = 6.7f
}

function get_prop_I1(i: I1_F120): float {
  return i.f
}

function set_prop_I1(i: I1_F120, value: float) {
  i.f = value
}

function get_prop_I2(i: I2_F120): float {
  return i.f
}

function set_prop_I2(i: I2_F120, value: float) {
  i.f = value
}

interface I1_F121 {
  f: long
}
interface I2_F121 {
  f: long
}
class A_F121 implements I1_F121, I2_F121 {
  f: long = 9223372036854775807
}

function get_prop_I1(i: I1_F121): long {
  return i.f
}

function set_prop_I1(i: I1_F121, value: long) {
  i.f = value
}

function get_prop_I2(i: I2_F121): long {
  return i.f
}

function set_prop_I2(i: I2_F121, value: long) {
  i.f = value
}

interface I1_F122 {
  f: int
}
interface I2_F122 {
  f: int
}
class A_F122 implements I1_F122, I2_F122 {
  f: int = 123
}

function get_prop_I1(i: I1_F122): int {
  return i.f
}

function set_prop_I1(i: I1_F122, value: int) {
  i.f = value
}

function get_prop_I2(i: I2_F122): int {
  return i.f
}

function set_prop_I2(i: I2_F122, value: int) {
  i.f = value
}

interface I1_F123 {
  f: short
}
interface I2_F123 {
  f: short
}
class A_F123 implements I1_F123, I2_F123 {
  f: short = 325
}

function get_prop_I1(i: I1_F123): short {
  return i.f
}

function set_prop_I1(i: I1_F123, value: short) {
  i.f = value
}

function get_prop_I2(i: I2_F123): short {
  return i.f
}

function set_prop_I2(i: I2_F123, value: short) {
  i.f = value
}

interface I1_F124 {
  f: byte
}
interface I2_F124 {
  f: byte
}
class A_F124 implements I1_F124, I2_F124 {
  f: byte = 127
}

function get_prop_I1(i: I1_F124): byte {
  return i.f
}

function set_prop_I1(i: I1_F124, value: byte) {
  i.f = value
}

function get_prop_I2(i: I2_F124): byte {
  return i.f
}

function set_prop_I2(i: I2_F124, value: byte) {
  i.f = value
}

interface I1_F125 {
  f: string
}
interface I2_F125 {
  f: string
}
class A_F125 implements I1_F125, I2_F125 {
  f: string = "abc"
}

function get_prop_I1(i: I1_F125): string {
  return i.f
}

function set_prop_I1(i: I1_F125, value: string) {
  i.f = value
}

function get_prop_I2(i: I2_F125): string {
  return i.f
}

function set_prop_I2(i: I2_F125, value: string) {
  i.f = value
}

interface I1_F126 {
  f: bigint
}
interface I2_F126 {
  f: bigint
}
class A_F126 implements I1_F126, I2_F126 {
  f: bigint = 12345678901234567890n
}

function get_prop_I1(i: I1_F126): bigint {
  return i.f
}

function set_prop_I1(i: I1_F126, value: bigint) {
  i.f = value
}

function get_prop_I2(i: I2_F126): bigint {
  return i.f
}

function set_prop_I2(i: I2_F126, value: bigint) {
  i.f = value
}

interface I1_F127 {
  f: char
}
interface I2_F127 {
  f: char
}
class A_F127 implements I1_F127, I2_F127 {
  f: char = c'\u2028'
}

function get_prop_I1(i: I1_F127): char {
  return i.f
}

function set_prop_I1(i: I1_F127, value: char) {
  i.f = value
}

function get_prop_I2(i: I2_F127): char {
  return i.f
}

function set_prop_I2(i: I2_F127, value: char) {
  i.f = value
}

interface I1_F128 {
  f: boolean
}
interface I2_F128 {
  f: boolean
}
class A_F128 implements I1_F128, I2_F128 {
  f: boolean = false
}

function get_prop_I1(i: I1_F128): boolean {
  return i.f
}

function set_prop_I1(i: I1_F128, value: boolean) {
  i.f = value
}

function get_prop_I2(i: I2_F128): boolean {
  return i.f
}

function set_prop_I2(i: I2_F128, value: boolean) {
  i.f = value
}

interface I1_F129 {
  f: Any
}
interface I2_F129 {
  f: Any
}
interface I3_F129 extends I2_F129 {
}
class A_F129 implements I1_F129, I3_F129 {
  f: Any = null
}

function get_prop_I1(i: I1_F129): Any {
  return i.f
}

function set_prop_I1(i: I1_F129, value: Any) {
  i.f = value
}

function get_prop_I2(i: I2_F129): Any {
  return i.f
}

function set_prop_I2(i: I2_F129, value: Any) {
  i.f = value
}

function get_prop_I3(i: I3_F129): Any {
  return i.f
}

function set_prop_I3(i: I3_F129, value: Any) {
  i.f = value
}

interface I1_F130 {
  f: Object
}
interface I2_F130 {
  f: Object
}
interface I3_F130 extends I2_F130 {
}
class A_F130 implements I1_F130, I3_F130 {
  f: Object = 5
}

function get_prop_I1(i: I1_F130): Object {
  return i.f
}

function set_prop_I1(i: I1_F130, value: Object) {
  i.f = value
}

function get_prop_I2(i: I2_F130): Object {
  return i.f
}

function set_prop_I2(i: I2_F130, value: Object) {
  i.f = value
}

function get_prop_I3(i: I3_F130): Object {
  return i.f
}

function set_prop_I3(i: I3_F130, value: Object) {
  i.f = value
}

interface I1_F131 {
  f: number
}
interface I2_F131 {
  f: number
}
interface I3_F131 extends I2_F131 {
}
class A_F131 implements I1_F131, I3_F131 {
  f: number = 3
}

function get_prop_I1(i: I1_F131): number {
  return i.f
}

function set_prop_I1(i: I1_F131, value: number) {
  i.f = value
}

function get_prop_I2(i: I2_F131): number {
  return i.f
}

function set_prop_I2(i: I2_F131, value: number) {
  i.f = value
}

function get_prop_I3(i: I3_F131): number {
  return i.f
}

function set_prop_I3(i: I3_F131, value: number) {
  i.f = value
}

interface I1_F132 {
  f: double
}
interface I2_F132 {
  f: double
}
interface I3_F132 extends I2_F132 {
}
class A_F132 implements I1_F132, I3_F132 {
  f: double = 3.4
}

function get_prop_I1(i: I1_F132): double {
  return i.f
}

function set_prop_I1(i: I1_F132, value: double) {
  i.f = value
}

function get_prop_I2(i: I2_F132): double {
  return i.f
}

function set_prop_I2(i: I2_F132, value: double) {
  i.f = value
}

function get_prop_I3(i: I3_F132): double {
  return i.f
}

function set_prop_I3(i: I3_F132, value: double) {
  i.f = value
}

interface I1_F133 {
  f: float
}
interface I2_F133 {
  f: float
}
interface I3_F133 extends I2_F133 {
}
class A_F133 implements I1_F133, I3_F133 {
  f: float = 6.7f
}

function get_prop_I1(i: I1_F133): float {
  return i.f
}

function set_prop_I1(i: I1_F133, value: float) {
  i.f = value
}

function get_prop_I2(i: I2_F133): float {
  return i.f
}

function set_prop_I2(i: I2_F133, value: float) {
  i.f = value
}

function get_prop_I3(i: I3_F133): float {
  return i.f
}

function set_prop_I3(i: I3_F133, value: float) {
  i.f = value
}

interface I1_F134 {
  f: long
}
interface I2_F134 {
  f: long
}
interface I3_F134 extends I2_F134 {
}
class A_F134 implements I1_F134, I3_F134 {
  f: long = 9223372036854775807
}

function get_prop_I1(i: I1_F134): long {
  return i.f
}

function set_prop_I1(i: I1_F134, value: long) {
  i.f = value
}

function get_prop_I2(i: I2_F134): long {
  return i.f
}

function set_prop_I2(i: I2_F134, value: long) {
  i.f = value
}

function get_prop_I3(i: I3_F134): long {
  return i.f
}

function set_prop_I3(i: I3_F134, value: long) {
  i.f = value
}

interface I1_F135 {
  f: int
}
interface I2_F135 {
  f: int
}
interface I3_F135 extends I2_F135 {
}
class A_F135 implements I1_F135, I3_F135 {
  f: int = 123
}

function get_prop_I1(i: I1_F135): int {
  return i.f
}

function set_prop_I1(i: I1_F135, value: int) {
  i.f = value
}

function get_prop_I2(i: I2_F135): int {
  return i.f
}

function set_prop_I2(i: I2_F135, value: int) {
  i.f = value
}

function get_prop_I3(i: I3_F135): int {
  return i.f
}

function set_prop_I3(i: I3_F135, value: int) {
  i.f = value
}

interface I1_F136 {
  f: short
}
interface I2_F136 {
  f: short
}
interface I3_F136 extends I2_F136 {
}
class A_F136 implements I1_F136, I3_F136 {
  f: short = 325
}

function get_prop_I1(i: I1_F136): short {
  return i.f
}

function set_prop_I1(i: I1_F136, value: short) {
  i.f = value
}

function get_prop_I2(i: I2_F136): short {
  return i.f
}

function set_prop_I2(i: I2_F136, value: short) {
  i.f = value
}

function get_prop_I3(i: I3_F136): short {
  return i.f
}

function set_prop_I3(i: I3_F136, value: short) {
  i.f = value
}

interface I1_F137 {
  f: byte
}
interface I2_F137 {
  f: byte
}
interface I3_F137 extends I2_F137 {
}
class A_F137 implements I1_F137, I3_F137 {
  f: byte = 127
}

function get_prop_I1(i: I1_F137): byte {
  return i.f
}

function set_prop_I1(i: I1_F137, value: byte) {
  i.f = value
}

function get_prop_I2(i: I2_F137): byte {
  return i.f
}

function set_prop_I2(i: I2_F137, value: byte) {
  i.f = value
}

function get_prop_I3(i: I3_F137): byte {
  return i.f
}

function set_prop_I3(i: I3_F137, value: byte) {
  i.f = value
}

interface I1_F138 {
  f: string
}
interface I2_F138 {
  f: string
}
interface I3_F138 extends I2_F138 {
}
class A_F138 implements I1_F138, I3_F138 {
  f: string = "abc"
}

function get_prop_I1(i: I1_F138): string {
  return i.f
}

function set_prop_I1(i: I1_F138, value: string) {
  i.f = value
}

function get_prop_I2(i: I2_F138): string {
  return i.f
}

function set_prop_I2(i: I2_F138, value: string) {
  i.f = value
}

function get_prop_I3(i: I3_F138): string {
  return i.f
}

function set_prop_I3(i: I3_F138, value: string) {
  i.f = value
}

interface I1_F139 {
  f: bigint
}
interface I2_F139 {
  f: bigint
}
interface I3_F139 extends I2_F139 {
}
class A_F139 implements I1_F139, I3_F139 {
  f: bigint = 12345678901234567890n
}

function get_prop_I1(i: I1_F139): bigint {
  return i.f
}

function set_prop_I1(i: I1_F139, value: bigint) {
  i.f = value
}

function get_prop_I2(i: I2_F139): bigint {
  return i.f
}

function set_prop_I2(i: I2_F139, value: bigint) {
  i.f = value
}

function get_prop_I3(i: I3_F139): bigint {
  return i.f
}

function set_prop_I3(i: I3_F139, value: bigint) {
  i.f = value
}

interface I1_F140 {
  f: char
}
interface I2_F140 {
  f: char
}
interface I3_F140 extends I2_F140 {
}
class A_F140 implements I1_F140, I3_F140 {
  f: char = c'\u2028'
}

function get_prop_I1(i: I1_F140): char {
  return i.f
}

function set_prop_I1(i: I1_F140, value: char) {
  i.f = value
}

function get_prop_I2(i: I2_F140): char {
  return i.f
}

function set_prop_I2(i: I2_F140, value: char) {
  i.f = value
}

function get_prop_I3(i: I3_F140): char {
  return i.f
}

function set_prop_I3(i: I3_F140, value: char) {
  i.f = value
}

interface I1_F141 {
  f: boolean
}
interface I2_F141 {
  f: boolean
}
interface I3_F141 extends I2_F141 {
}
class A_F141 implements I1_F141, I3_F141 {
  f: boolean = false
}

function get_prop_I1(i: I1_F141): boolean {
  return i.f
}

function set_prop_I1(i: I1_F141, value: boolean) {
  i.f = value
}

function get_prop_I2(i: I2_F141): boolean {
  return i.f
}

function set_prop_I2(i: I2_F141, value: boolean) {
  i.f = value
}

function get_prop_I3(i: I3_F141): boolean {
  return i.f
}

function set_prop_I3(i: I3_F141, value: boolean) {
  i.f = value
}

class C_F142 {
  f: Any = null
}

interface I_F142 {
  f: Any
}

class D_F142 extends C_F142 implements I_F142 {
  f: Any = 7
}

function get_prop(i: I_F142): Any {
  return i.f
}

function set_prop(i: I_F142, value: Any) {
  i.f = value
}

function get_field(a: C_F142): Any {
  return a.f
}

function set_field(a: C_F142, value: Any) {
  a.f = value
}

class C_F143 {
  f: Object = 5
}

interface I_F143 {
  f: Object
}

class D_F143 extends C_F143 implements I_F143 {
  f: Object = "abc"
}

function get_prop(i: I_F143): Object {
  return i.f
}

function set_prop(i: I_F143, value: Object) {
  i.f = value
}

function get_field(a: C_F143): Object {
  return a.f
}

function set_field(a: C_F143, value: Object) {
  a.f = value
}

class C_F144 {
  f: number = 3
}

interface I_F144 {
  f: number
}

class D_F144 extends C_F144 implements I_F144 {
  f: number = 6.7
}

function get_prop(i: I_F144): number {
  return i.f
}

function set_prop(i: I_F144, value: number) {
  i.f = value
}

function get_field(a: C_F144): number {
  return a.f
}

function set_field(a: C_F144, value: number) {
  a.f = value
}

class C_F145 {
  f: double = 3.4
}

interface I_F145 {
  f: double
}

class D_F145 extends C_F145 implements I_F145 {
  f: double = 5.0
}

function get_prop(i: I_F145): double {
  return i.f
}

function set_prop(i: I_F145, value: double) {
  i.f = value
}

function get_field(a: C_F145): double {
  return a.f
}

function set_field(a: C_F145, value: double) {
  a.f = value
}

class C_F146 {
  f: float = 6.7f
}

interface I_F146 {
  f: float
}

class D_F146 extends C_F146 implements I_F146 {
  f: float = 7.3f
}

function get_prop(i: I_F146): float {
  return i.f
}

function set_prop(i: I_F146, value: float) {
  i.f = value
}

function get_field(a: C_F146): float {
  return a.f
}

function set_field(a: C_F146, value: float) {
  a.f = value
}

class C_F147 {
  f: long = 9223372036854775807
}

interface I_F147 {
  f: long
}

class D_F147 extends C_F147 implements I_F147 {
  f: long = 78945
}

function get_prop(i: I_F147): long {
  return i.f
}

function set_prop(i: I_F147, value: long) {
  i.f = value
}

function get_field(a: C_F147): long {
  return a.f
}

function set_field(a: C_F147, value: long) {
  a.f = value
}

class C_F148 {
  f: int = 123
}

interface I_F148 {
  f: int
}

class D_F148 extends C_F148 implements I_F148 {
  f: int = 321
}

function get_prop(i: I_F148): int {
  return i.f
}

function set_prop(i: I_F148, value: int) {
  i.f = value
}

function get_field(a: C_F148): int {
  return a.f
}

function set_field(a: C_F148, value: int) {
  a.f = value
}

class C_F149 {
  f: short = 325
}

interface I_F149 {
  f: short
}

class D_F149 extends C_F149 implements I_F149 {
  f: short = 253
}

function get_prop(i: I_F149): short {
  return i.f
}

function set_prop(i: I_F149, value: short) {
  i.f = value
}

function get_field(a: C_F149): short {
  return a.f
}

function set_field(a: C_F149, value: short) {
  a.f = value
}

class C_F150 {
  f: byte = 127
}

interface I_F150 {
  f: byte
}

class D_F150 extends C_F150 implements I_F150 {
  f: byte = 78
}

function get_prop(i: I_F150): byte {
  return i.f
}

function set_prop(i: I_F150, value: byte) {
  i.f = value
}

function get_field(a: C_F150): byte {
  return a.f
}

function set_field(a: C_F150, value: byte) {
  a.f = value
}

class C_F151 {
  f: string = "abc"
}

interface I_F151 {
  f: string
}

class D_F151 extends C_F151 implements I_F151 {
  f: string = "defg"
}

function get_prop(i: I_F151): string {
  return i.f
}

function set_prop(i: I_F151, value: string) {
  i.f = value
}

function get_field(a: C_F151): string {
  return a.f
}

function set_field(a: C_F151, value: string) {
  a.f = value
}

class C_F152 {
  f: bigint = 12345678901234567890n
}

interface I_F152 {
  f: bigint
}

class D_F152 extends C_F152 implements I_F152 {
  f: bigint = 5556423623465n
}

function get_prop(i: I_F152): bigint {
  return i.f
}

function set_prop(i: I_F152, value: bigint) {
  i.f = value
}

function get_field(a: C_F152): bigint {
  return a.f
}

function set_field(a: C_F152, value: bigint) {
  a.f = value
}

class C_F153 {
  f: char = c'\u2028'
}

interface I_F153 {
  f: char
}

class D_F153 extends C_F153 implements I_F153 {
  f: char = c'z'
}

function get_prop(i: I_F153): char {
  return i.f
}

function set_prop(i: I_F153, value: char) {
  i.f = value
}

function get_field(a: C_F153): char {
  return a.f
}

function set_field(a: C_F153, value: char) {
  a.f = value
}

class C_F154 {
  f: boolean = false
}

interface I_F154 {
  f: boolean
}

class D_F154 extends C_F154 implements I_F154 {
  f: boolean = true
}

function get_prop(i: I_F154): boolean {
  return i.f
}

function set_prop(i: I_F154, value: boolean) {
  i.f = value
}

function get_field(a: C_F154): boolean {
  return a.f
}

function set_field(a: C_F154, value: boolean) {
  a.f = value
}

interface I_F155 {
  f: Any
}

interface II_F155 extends I_F155 {
  f: Any
}

class A_F155 implements II_F155 {
  f: Any = null
}

class B_F155 implements I_F155 {
  f: Any = 7
}

function get_prop_I(i: I_F155): Any {
  return i.f
}

function set_prop_I(i: I_F155, value: Any) {
  i.f = value
}

function get_prop_II(i: I_F155): Any {
  return i.f
}

function set_prop_II(i: I_F155, value: Any) {
  i.f = value
}

interface I_F156 {
  f: Object
}

interface II_F156 extends I_F156 {
  f: Object
}

class A_F156 implements II_F156 {
  f: Object = 5
}

class B_F156 implements I_F156 {
  f: Object = "abc"
}

function get_prop_I(i: I_F156): Object {
  return i.f
}

function set_prop_I(i: I_F156, value: Object) {
  i.f = value
}

function get_prop_II(i: I_F156): Object {
  return i.f
}

function set_prop_II(i: I_F156, value: Object) {
  i.f = value
}

interface I_F157 {
  f: number
}

interface II_F157 extends I_F157 {
  f: number
}

class A_F157 implements II_F157 {
  f: number = 3
}

class B_F157 implements I_F157 {
  f: number = 6.7
}

function get_prop_I(i: I_F157): number {
  return i.f
}

function set_prop_I(i: I_F157, value: number) {
  i.f = value
}

function get_prop_II(i: I_F157): number {
  return i.f
}

function set_prop_II(i: I_F157, value: number) {
  i.f = value
}

interface I_F158 {
  f: double
}

interface II_F158 extends I_F158 {
  f: double
}

class A_F158 implements II_F158 {
  f: double = 3.4
}

class B_F158 implements I_F158 {
  f: double = 5.0
}

function get_prop_I(i: I_F158): double {
  return i.f
}

function set_prop_I(i: I_F158, value: double) {
  i.f = value
}

function get_prop_II(i: I_F158): double {
  return i.f
}

function set_prop_II(i: I_F158, value: double) {
  i.f = value
}

interface I_F159 {
  f: float
}

interface II_F159 extends I_F159 {
  f: float
}

class A_F159 implements II_F159 {
  f: float = 6.7f
}

class B_F159 implements I_F159 {
  f: float = 7.3f
}

function get_prop_I(i: I_F159): float {
  return i.f
}

function set_prop_I(i: I_F159, value: float) {
  i.f = value
}

function get_prop_II(i: I_F159): float {
  return i.f
}

function set_prop_II(i: I_F159, value: float) {
  i.f = value
}

interface I_F160 {
  f: long
}

interface II_F160 extends I_F160 {
  f: long
}

class A_F160 implements II_F160 {
  f: long = 9223372036854775807
}

class B_F160 implements I_F160 {
  f: long = 78945
}

function get_prop_I(i: I_F160): long {
  return i.f
}

function set_prop_I(i: I_F160, value: long) {
  i.f = value
}

function get_prop_II(i: I_F160): long {
  return i.f
}

function set_prop_II(i: I_F160, value: long) {
  i.f = value
}

interface I_F161 {
  f: int
}

interface II_F161 extends I_F161 {
  f: int
}

class A_F161 implements II_F161 {
  f: int = 123
}

class B_F161 implements I_F161 {
  f: int = 321
}

function get_prop_I(i: I_F161): int {
  return i.f
}

function set_prop_I(i: I_F161, value: int) {
  i.f = value
}

function get_prop_II(i: I_F161): int {
  return i.f
}

function set_prop_II(i: I_F161, value: int) {
  i.f = value
}

interface I_F162 {
  f: short
}

interface II_F162 extends I_F162 {
  f: short
}

class A_F162 implements II_F162 {
  f: short = 325
}

class B_F162 implements I_F162 {
  f: short = 253
}

function get_prop_I(i: I_F162): short {
  return i.f
}

function set_prop_I(i: I_F162, value: short) {
  i.f = value
}

function get_prop_II(i: I_F162): short {
  return i.f
}

function set_prop_II(i: I_F162, value: short) {
  i.f = value
}

interface I_F163 {
  f: byte
}

interface II_F163 extends I_F163 {
  f: byte
}

class A_F163 implements II_F163 {
  f: byte = 127
}

class B_F163 implements I_F163 {
  f: byte = 78
}

function get_prop_I(i: I_F163): byte {
  return i.f
}

function set_prop_I(i: I_F163, value: byte) {
  i.f = value
}

function get_prop_II(i: I_F163): byte {
  return i.f
}

function set_prop_II(i: I_F163, value: byte) {
  i.f = value
}

interface I_F164 {
  f: string
}

interface II_F164 extends I_F164 {
  f: string
}

class A_F164 implements II_F164 {
  f: string = "abc"
}

class B_F164 implements I_F164 {
  f: string = "defg"
}

function get_prop_I(i: I_F164): string {
  return i.f
}

function set_prop_I(i: I_F164, value: string) {
  i.f = value
}

function get_prop_II(i: I_F164): string {
  return i.f
}

function set_prop_II(i: I_F164, value: string) {
  i.f = value
}

interface I_F165 {
  f: bigint
}

interface II_F165 extends I_F165 {
  f: bigint
}

class A_F165 implements II_F165 {
  f: bigint = 12345678901234567890n
}

class B_F165 implements I_F165 {
  f: bigint = 5556423623465n
}

function get_prop_I(i: I_F165): bigint {
  return i.f
}

function set_prop_I(i: I_F165, value: bigint) {
  i.f = value
}

function get_prop_II(i: I_F165): bigint {
  return i.f
}

function set_prop_II(i: I_F165, value: bigint) {
  i.f = value
}

interface I_F166 {
  f: char
}

interface II_F166 extends I_F166 {
  f: char
}

class A_F166 implements II_F166 {
  f: char = c'\u2028'
}

class B_F166 implements I_F166 {
  f: char = c'z'
}

function get_prop_I(i: I_F166): char {
  return i.f
}

function set_prop_I(i: I_F166, value: char) {
  i.f = value
}

function get_prop_II(i: I_F166): char {
  return i.f
}

function set_prop_II(i: I_F166, value: char) {
  i.f = value
}

interface I_F167 {
  f: boolean
}

interface II_F167 extends I_F167 {
  f: boolean
}

class A_F167 implements II_F167 {
  f: boolean = false
}

class B_F167 implements I_F167 {
  f: boolean = true
}

function get_prop_I(i: I_F167): boolean {
  return i.f
}

function set_prop_I(i: I_F167, value: boolean) {
  i.f = value
}

function get_prop_II(i: I_F167): boolean {
  return i.f
}

function set_prop_II(i: I_F167, value: boolean) {
  i.f = value
}

interface I_F168 {
  f: Any
}

class A_F168 implements I_F168 {
  f: Any = null
}

function get_prop(i: I_F168): Any {
  return i.f
}

function set_prop(i: I_F168, value: Any) {
  i.f = value
}

interface I_F169 {
  f: Object
}
