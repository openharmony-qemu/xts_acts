'use static';
 /*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

 class OperationsBoll {
   static or(a0: boolean, a1: boolean): boolean {
     return a0 || a1;
   }
 }

 class OperationsByte {
   static sum(a0: byte, a1: byte): byte {
     return (a0 + a1).toByte();
   }
 }

 class OperationsChar {
   static sub(c0: char, c1: char): char {
     let c: Char = new Char(c'0');
     if (c0 > c1) {
       c = (c0.toInt() - c1.toInt()).toChar();
     } else {
       c = (c1.toInt() - c0.toInt()).toChar();
     }
     return c as char;
   }
 }

 class OperationsDouble {
   static sum(a0: double, a1: double): double {
     return a0 + a1 as double;
   }
 }

 class OperationsFloat {
   static sum(a0: float, a1: float): float {
     return a0 + a1 as float;
   }
 }

 class OperationsInt {
   static sum(a0: int, a1: int): int {
     return a0 + a1;
   }
 };

 class OperationsLong {
   static sum(a0: long, a1: long): long {
     return a0 + a1 as long;
   }
 };

 class PhoneRef {
   static get_button_names(): string {
     return "up";
   }

   static get_num_string(a0: int, a1: int): string {
     if (a0 == 5 && a1 == 6) {
       return "INT5"
     }
     return "NO1";
   }

   static funcA(a0: int, a1: int): string {
     if (a0 == 5 && a1 == 6) {
       return "INT5"
     }
     return "NO1";
   }
 };

 class OperationsShort {
   static sum(a0: short, a1: short): short {
     return (a0 + a1).toShort();
   }
 };

 class OperationsVoid {
     static voidMethod(a0: int, a1: int): void {
       OperationsVoid.count += a0;
       OperationsVoid.count += a1;
     }

    static getCount(): int {
      return OperationsVoid.count;
    }

    static count: int = 0;
  }

 class OperationsMeds {
   static sum(a0: short, a1: short): short {
     return (a0 + a1).toShort();
   }
 }

 class OperationsMedInt {
   static sum(a0: int, a1: int): int {
     return a0 + a1;
   }
 }

  class OperationsMedLong {
   static sum(a0: long, a1: long): long {
     return a0 + a1 as long;
   }
 }

  class OperationsMedFloat {
   static sum(a0: float, a1: float): float {
    return a0 + a1 as float;
   }
 }

  class TestDouble {
   static funcA(a0: double, a1: double): double {
    return a0 + a1 as double;
   }
 }

  class TestVoid {
   static funcA(a0: int, a1: int): void {
    TestVoid.count += a0;
    TestVoid.count += a1;
  }

  static count: int = 0;
 }

 class BoolOps {
   static funcA(a0: boolean, a1: boolean): boolean {
     return a0 || a1;
   }
   static funcA(a0: int, a1: int): int {
     return a0 + a1;
   }
   static funcB(a0: boolean, a1: boolean): boolean {
     return a0 || a1;
   }
 }

 class BoolSubOps {
   static funcB(a0: boolean, a1: boolean): boolean {
     return a0 && a1;
   }
 }

 class BoolCounter {
   static count: boolean = true;
   static increment(a0: boolean, a1: boolean): void {
     BoolCounter.count = false;
   }
   static getCount(): boolean {
     return BoolCounter.count;
   }
 }

 class BoolVisibility {
   static publicMethod(a0: boolean, a1: boolean): boolean {
     return a0 || a1;
   }
   static callPrivateMethod(a0: boolean, a1: boolean): boolean {
     return a0 && a1;
   }
 }

 class IntOps {
   static funcA(a0: int, a1: int): int {
     return a0 + a1;
   }
   static funcA(a0: double, a1: double): double {
     return a0 + a1;
   }
   static funcB(a0: int, a1: int): int {
     return a0 + a1;
   }
 }

 class IntSubOps {
   static funcB(a0: int, a1: int): int {
     return a1 - a0;
   }
 }

 class IntCounter {
   static count: int = 0;
   static increment(a0: int, a1: int): void {
     IntCounter.count = a0 + a1;
   }
   static getCount(): int {
     return IntCounter.count;
   }
 }

 class IntVisibility {
   static publicMethod(a0: int, a1: int): int {
     return a0 + a1;
   }
   static callPrivateMethod(a0: int, a1: int): int {
     return a1 - a0;
   }
 }

 class ShortOps {
   static funcA(a0: short, a1: short): short {
     return (a0 + a1).toShort();
   }
   static funcA(a0: int, a1: int): int {
     return a0 + a1;
   }
   static funcB(a0: short, a1: short): short {
     return (a0 + a1).toShort();
   }
 }

 class ShortSubOps {
   static funcB(a0: short, a1: short): short {
     return (a1 - a0).toShort();
   }
 }

 class ShortCounter {
   static count: short = 0;
   static increment(a0: short, a1: short): void {
     ShortCounter.count = (a0 + a1).toShort();
   }
   static getCount(): short {
     return ShortCounter.count;
   }
 }

 class ShortVisibility {
   static publicMethod(a0: short, a1: short): short {
     return (a0 + a1).toShort();
   }
   static callPrivateMethod(a0: short, a1: short): short {
     return (a1 - a0).toShort();
   }
 }

 class ByteOps {
   static funcA(a0: byte, a1: byte): byte {
     return (a0 + a1).toByte();
   }
   static funcA(a0: int, a1: int): int {
     return a0 + a1;
   }
   static funcB(a0: byte, a1: byte): byte {
     return (a0 + a1).toByte();
   }
 }

 class ByteSubOps {
   static funcB(a0: byte, a1: byte): byte {
     return (a1 - a0).toByte();
   }
 }

 class ByteCounter {
   static count: byte = 0;
   static increment(a0: byte, a1: byte): void {
     ByteCounter.count = (a0 + a1).toByte();
   }
   static getCount(): byte {
     return ByteCounter.count;
   }
 }

 class ByteVisibility {
   static publicMethod(a0: byte, a1: byte): byte {
     return (a0 + a1).toByte();
   }
   static callPrivateMethod(a0: byte, a1: byte): byte {
     return (a1 - a0).toByte();
   }
 }

 class TestBoolC {
   static funcA(a0: boolean, a1: boolean): boolean {
     return a0 || a1;
   }
 }

 class TestBoolD {
   static funcA(a0: boolean, a1: boolean): boolean {
     return a0 && a1;
   }
 }

 class TestBoolE {
   static funcA(a0: boolean, a1: boolean): boolean {
     return a0 || a1;
   }
 }

 class TestIntC {
   static funcA(a0: int, a1: int): int {
     return a0 + a1;
   }
 }

 class TestIntD {
   static funcA(a0: int, a1: int): int {
     return a1 - a0;
   }
 }

 class TestIntE {
   static funcA(a0: int, a1: int): int {
     return a0 + a1;
   }
 }

 class TestShortC {
   static funcA(a0: int, a1: int): int {
     return a0 + a1;
   }
 }

 class TestShortD {
   static funcA(a0: int, a1: int): int {
     return a1 - a0;
   }
 }

 class TestShortE {
   static funcA(a0: int, a1: int): int {
     return a0 + a1;
   }
 }

 class TestByteC {
   static funcA(a0: byte, a1: byte): byte {
     return (a0 + a1).toByte();
   }
 }

 class TestByteD {
   static funcA(a0: byte, a1: byte): byte {
     return (a1 - a0).toByte();
   }
 }

 class TestByteE {
   static funcA(a0: byte, a1: byte): byte {
     return (a0 + a1).toByte();
   }
 }

 export class FooStatic {
   constructor() {
   }

   static get_button_names(): string {
     return "up";
   }

   static get_button_names_v(a: int): string {
     return "get "+a;
   }

   static funcA(a0: boolean, a1: boolean): boolean {
     return a0 || a1;
   }
 }