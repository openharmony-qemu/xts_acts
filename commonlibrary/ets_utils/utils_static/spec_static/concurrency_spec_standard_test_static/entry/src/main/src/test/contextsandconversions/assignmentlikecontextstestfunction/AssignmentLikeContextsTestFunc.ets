'use static'
/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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


class A {
  public fld_1: boolean;
  public fld_2: boolean;

  public constructor(p1: boolean, p2: boolean) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }

  public foo(p1: boolean, p2: boolean): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}

enum Color {
  Red,
  Green,
  Blue
}
class A1 {
  public fld_1: byte;
  public fld_2: byte;
  public fld_3: byte;
  public constructor(p1: byte, p2: byte, p3: byte) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: byte, p2: byte, p3: byte): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A2 {
  public fld_1: char;
  public fld_2: char;
  public fld_3: char;
  public constructor(p1: char, p2: char, p3: char) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: char, p2: char, p3: char): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A3 {
  public fld_1: short;
  public fld_2: short;
  public constructor(p1: short, p2: short) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: short, p2: short): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A4 {
  public fld_1: int;
  public fld_2: int;
  public fld_3: int;
  public constructor(p1: int, p2: int, p3: int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: int, p2: int, p3: int): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A5 {
  public fld_1: long;
  public fld_2: long;
  public constructor(p1: long, p2: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: long, p2: long): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A6 {
  public fld_1: float;
  public fld_2: float;
  public constructor(p1: float, p2: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: float, p2: float): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A7 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A8 {
  public fld_1: short;
  public fld_2: short;
  public fld_3: short;
  public constructor(p1: short, p2: short, p3: short) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: short, p2: short, p3: short): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A9 {
  public fld_1: int;
  public fld_2: int;
  public fld_3: int;
  public constructor(p1: int, p2: int, p3: int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: int, p2: int, p3: int): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A10 {
  public fld_1: long;
  public fld_2: long;
  public fld_3: long;
  public constructor(p1: long, p2: long, p3: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: long, p2: long, p3: long): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A11 {
  public fld_1: float;
  public fld_2: float;
  public fld_3: float;
  public constructor(p1: float, p2: float, p3: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: float, p2: float, p3: float): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A12 {
  public fld_1: double;
  public fld_2: double;
  public fld_3: double;
  public constructor(p1: double, p2: double, p3: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: double, p2: double, p3: double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A13 {
  public fld_1: int;
  public fld_2: int;
  public constructor(p1: int, p2: int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: int, p2: int): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A14 {
  public fld_1: long;
  public fld_2: long;
  public constructor(p1: long, p2: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: long, p2: long): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A15 {
  public fld_1: float;
  public fld_2: float;
  public constructor(p1: float, p2: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: float, p2: float): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A16 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A17 {
  public fld_1: long;
  public fld_2: long;
  public fld_3: long;
  public constructor(p1: long, p2: long, p3: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: long, p2: long, p3: long): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A18 {
  public fld_1: float;
  public fld_2: float;
  public fld_3: float;
  public constructor(p1: float, p2: float, p3: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: float, p2: float, p3: float): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A19 {
  public fld_1: double;
  public fld_2: double;
  public fld_3: double;
  public constructor(p1: double, p2: double, p3: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: double, p2: double, p3: double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A20 {
  public fld_1: float;
  public fld_2: float;
  public constructor(p1: float, p2: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: float, p2: float): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A21 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A22 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A23 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A24 {
  public fld_1: Object;
  public fld_2: Object;
  public fld_3: Object;
  public constructor(p1: Object, p2: Object, p3: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Object, p2: Object, p3: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
    if(this.fld_3 === null){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 should not be null');
        }
  }
}
class A25 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A26 {
  public fld_1: Floating;
  public fld_2: Floating;
  public constructor(p1: Floating, p2: Floating) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Floating, p2: Floating): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A27 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A28 {
  public fld_1: Floating;
  public fld_2: Floating;
  public constructor(p1: Floating, p2: Floating) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Floating, p2: Floating): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A29 {
  public fld_1: Object;
  public fld_2: Object;
  public fld_3: Object;
  public constructor(p1: Object, p2: Object, p3: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Object, p2: Object, p3: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
    if(this.fld_3 === null){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 should not be null');
        }
  }
}
class A30 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A31 {
  public fld_1: Integral;
  public fld_2: Integral;
  public constructor(p1: Integral, p2: Integral) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Integral, p2: Integral): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A32 {
  public fld_1: Object;
  public fld_2: Object;
  public fld_3: Object;
  public constructor(p1: Object, p2: Object, p3: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Object, p2: Object, p3: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
    if(this.fld_3 === null){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 should not be null');
        }
  }
}
class A33 {
  public fld_1: Integral;
  public fld_2: Integral;
  public fld_3: Integral;
  public constructor(p1: Integral, p2: Integral, p3: Integral) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Integral, p2: Integral, p3: Integral): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
    if(this.fld_3 === null){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 should not be null');
        }
  }
}
class A34 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A35 {
  public fld_1: Integral;
  public fld_2: Integral;
  public constructor(p1: Integral, p2: Integral) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Integral, p2: Integral): void {
    if(this.fld_1 === null){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 should not be null');
        }
    if(this.fld_2 === null){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 should not be null');
        }
  }
}
class A36 {
  public fld_1: Boolean;
  public fld_2: Boolean;
  public constructor(p1: Boolean, p2: Boolean) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Boolean, p2: Boolean): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A37 {
  public fld_1: Byte;
  public fld_2: Byte;
  public fld_3: Byte;
  public constructor(p1: Byte, p2: Byte, p3: Byte) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Byte, p2: Byte, p3: Byte): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A38 {
  public fld_1: Char;
  public fld_2: Char;
  public fld_3: Char;
  public constructor(p1: Char, p2: Char, p3: Char) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Char, p2: Char, p3: Char): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A39 {
  public fld_1: Short;
  public fld_2: Short;
  public constructor(p1: Short, p2: Short) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Short, p2: Short): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A40 {
  public fld_1: Int;
  public fld_2: Int;
  public fld_3: Int;
  public constructor(p1: Int, p2: Int, p3: Int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Int, p2: Int, p3: Int): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
  }
}
class A41 {
  public fld_1: Long;
  public fld_2: Long;
  public constructor(p1: Long, p2: Long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Long, p2: Long): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A42 {
  public fld_1: Float;
  public fld_2: Float;
  public constructor(p1: Float, p2: Float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Float, p2: Float): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
class A43 {
  public fld_1: Double;
  public fld_2: Double;
  public constructor(p1: Double, p2: Double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Double, p2: Double): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
  }
}
interface I {}
class A44 implements I {}
class A45 {}
class B<A45> {}
class B1<T extends A45> {}
type Barfunc = (a: Object) => Object;
function bar(a: Object): Object {
  return new Object();
}

class A46 {
  public fld_1: boolean;
  public fld_2: byte;
  public fld_3: short;
  public fld_4: int;
  public fld_5: long;
  public fld_6: float;
  public fld_7: double;
  public fld_8: char;
  public fld_9: Boolean|null;
  public fld_10: Byte|null;
  public fld_11: Char|null;
  public fld_12: Error|null;
  public fld_13: Barfunc|null;
  public fld_14: Barfunc[]|null;

  public constructor(
    p1: boolean,
    p2: byte,
    p3: short,
    p4: int,
    p5: long,
    p6: float,
    p7: double,
    p8: char,
    p9: Boolean|null,
    p10: Byte|null,
    p11: Char|null,
    p12: Error|null,
    p13: Barfunc|null,
    p14: Barfunc[]|null
  ) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
    this.fld_4 = p4;
    this.fld_5 = p5;
    this.fld_6 = p6;
    this.fld_7 = p7;
    this.fld_8 = p8;
    this.fld_9 = p9;
    this.fld_10 = p10;
    this.fld_11 = p11;
    this.fld_12 = p12;
    this.fld_13 = p13;
    this.fld_14 = p14;
  }

  public foo(
    p1: boolean,
    p2: byte,
    p3: short,
    p4: int,
    p5: long,
    p6: float,
    p7: double,
    p8: char,
    p9: Boolean|null,
    p10: Byte|null,
    p11: Char|null,
    p12: Error|null,
    p13: Barfunc|null,
    p14: Barfunc[]|null
  ): void {
    if(this.fld_1 !== p1){
          console.info(`Task execution failed: this.fld_1: ${this.fld_1}`);
          throw new Error('this.fld_1 check failed, expected p1');
        }
    if(this.fld_2 !== p2){
          console.info(`Task execution failed: this.fld_2: ${this.fld_2}`);
          throw new Error('this.fld_2 check failed, expected p2');
        }
    if(this.fld_3 !== p3){
          console.info(`Task execution failed: this.fld_3: ${this.fld_3}`);
          throw new Error('this.fld_3 check failed, expected p3');
        }
    if(this.fld_4 !== p4){
          console.info(`Task execution failed: this.fld_4: ${this.fld_4}`);
          throw new Error('this.fld_4 check failed, expected p4');
        }
    if(this.fld_5 !== p5){
          console.info(`Task execution failed: this.fld_5: ${this.fld_5}`);
          throw new Error('this.fld_5 check failed, expected p5');
        }
    if(this.fld_6 !== p6){
          console.info(`Task execution failed: this.fld_6: ${this.fld_6}`);
          throw new Error('this.fld_6 check failed, expected p6');
        }
    if(this.fld_7 !== p7){
          console.info(`Task execution failed: this.fld_7: ${this.fld_7}`);
          throw new Error('this.fld_7 check failed, expected p7');
        }
    if(this.fld_8 !== p8){
          console.info(`Task execution failed: this.fld_8: ${this.fld_8}`);
          throw new Error('this.fld_8 check failed, expected p8');
        }
    if(this.fld_9 !== p9){
          console.info(`Task execution failed: this.fld_9: ${this.fld_9}`);
          throw new Error('this.fld_9 check failed, expected p9');
        }
    if(this.fld_10 !== p10){
          console.info(`Task execution failed: this.fld_10: ${this.fld_10}`);
          throw new Error('this.fld_10 check failed, expected p10');
        }
    if(this.fld_11 !== p11){
          console.info(`Task execution failed: this.fld_11: ${this.fld_11}`);
          throw new Error('this.fld_11 check failed, expected p11');
        }
    if(this.fld_12 !== p12){
          console.info(`Task execution failed: this.fld_12: ${this.fld_12}`);
          throw new Error('this.fld_12 check failed, expected p12');
        }
    if(this.fld_13 !== p13){
          console.info(`Task execution failed: this.fld_13: ${this.fld_13}`);
          throw new Error('this.fld_13 check failed, expected p13');
        }
    if(this.fld_14 !== p14){
          console.info(`Task execution failed: this.fld_14: ${this.fld_14}`);
          throw new Error('this.fld_14 check failed, expected p14');
        }
  }
}
class B2<T> {}
class C<T> extends B2<T> {}
class C1<T> extends B<B<T>> {}
interface J {}
type Func = (a: int, b: string) => Boolean|null;
class C3<T> extends B2<A45> {}
class C4<T> {}
function foo<T extends Byte>(p: T): byte {
  let src: T = p;
  let dst: byte = src;
  return dst;
}
function foo1<T extends Short>(p: T): short {
  let src: T = p;
  let dst: short = src;
  return dst;
}
function foo2<T extends Int>(p: T): int {
  let src: T = p;
  let dst: int = src;
  return dst;
}
function foo3<T extends Long>(p: T): long {
  let src: T = p;
  let dst: long = src;
  return dst;
}
class A47 {
  public fld: short;
  constructor(p: Short) {
    this.fld = p;
  }
  public foo(p: Short): void {
    this.fld = p;
  }
}
class A48 {
  public fld: int;
  constructor(p: Int) {
    this.fld = p;
  }
  public foo(p: Int): void {
    this.fld = p;
  }
}
class A49 {
  public fld: long;
  constructor(p: Long) {
    this.fld = p;
  }
  public foo(p: Long): void {
    this.fld = p;
  }
}
function foo5(p: Object): void {
  if(p === null){
        console.info(`Task execution failed: p: ${p}`);
        throw new Error('p should not be null');
      }
}

export function testAssignmentLikeContexts0001(){
  const TAG = 'testAssignmentLikeContexts0001';
  let src_1: Boolean = new Boolean(true);
        let dst_1: boolean = src_1;

        let src_2: Boolean = new Boolean(false);
        let dst_2: boolean = src_2;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0002(){
  const TAG = 'testAssignmentLikeContexts0002';
  let v1: Boolean = new Boolean(true);
        let v2: Boolean = new Boolean(false);
        let c: A = new A(v1, v2);
        c.foo(v1, v2);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }
}

export function testAssignmentLikeContexts0003(){
  const TAG = 'testAssignmentLikeContexts0003';
  let src_1: boolean = true;
        let dst_1: Boolean = new Boolean(src_1);

        let src_2: boolean = false;
        let dst_2: Boolean = new Boolean(src_2);
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0004(){
  const TAG = 'testAssignmentLikeContexts0004';
  let src_1: boolean = true;
        let dst_1: Object = src_1 as Object;

        let src_2: boolean = false;
        let dst_2: Object = src_2 as Object;
  if(dst_1 === undefined){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be undefined');
      }

  if(dst_2 === undefined){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be undefined');
      }
}

export function testAssignmentLikeContexts0005(){
  const TAG = 'testAssignmentLikeContexts0005';
  let src: Object[] = [];
        let dst: Object = src as Object;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0006(){
  const TAG = 'testAssignmentLikeContexts0006';
  let src: Object[][] = [[], []];
        let dst: Object = src as Object;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0007(){
  const TAG = 'testAssignmentLikeContexts0007';
  let src_1: boolean = true;
        let dst_1: Object = src_1 as Object;

        let src_2: boolean = false;
        let dst_2: Object = src_2 as Object;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }
}

export function testAssignmentLikeContexts0008(){
  const TAG = 'testAssignmentLikeContexts0008';
  let src_1: string = '\u0000';
        let dst_1: Object = src_1 as Object;

        let src_2: string = 'X';
        let dst_2: Object = src_2 as Object;

        let src_3: string = '\uffff';
        let dst_3: Object = src_3 as Object;
  if(dst_1 === null){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 should not be null');
      }

  if(dst_2 === null){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 should not be null');
      }

  if(dst_3 === null){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 should not be null');
      }
}

export function testAssignmentLikeContexts0009(){
  const TAG = 'testAssignmentLikeContexts0009';
  let src: Color = Color.Red;
        let dst: Color = src;
  if(src !== dst){
        console.info(`${TAG} Task execution failed: src: ${src}`);
        throw new Error('src check failed, expected dst');
      }
}

export function testAssignmentLikeContexts0010(){
  const TAG = 'testAssignmentLikeContexts0010';
  let src_1: Byte = new Byte(-128 as byte);
        let dst_1: Short = new Short(src_1.toShort());

        let src_2: Byte = new Byte(0 as byte);
        let dst_2: Short = new Short(src_2.toShort());

        let src_3: Byte = new Byte(127 as byte);
        let dst_3: Short = new Short(src_3.toShort());
  if(dst_1 !== src_1.toShort()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toShort()');
      }

  if(dst_2 !== src_2.toShort()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toShort()');
      }

  if(dst_3 !== src_3.toShort()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toShort()');
      }
}

export function testAssignmentLikeContexts0011(){
  const TAG = 'testAssignmentLikeContexts0011';
  let src_1: Byte = new Byte(-128 as byte);
        let dst_1: Int = new Int(src_1.toInt());

        let src_2: Byte = new Byte(0 as byte);
        let dst_2: Int = new Int(src_2.toInt());

        let src_3: Byte = new Byte(127 as byte);
        let dst_3: Int = new Int(src_3.toInt());
  if(dst_1 !== src_1.toInt()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toInt()');
      }

  if(dst_2 !== src_2.toInt()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toInt()');
      }

  if(dst_3 !== src_3.toInt()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toInt()');
      }
}

export function testAssignmentLikeContexts0012(){
  const TAG = 'testAssignmentLikeContexts0012';
  let src_1: Byte = new Byte(-128 as byte);
        let dst_1: Long = new Long(src_1.toLong());

        let src_2: Byte = new Byte(0 as byte);
        let dst_2: Long = new Long(src_2.toLong());

        let src_3: Byte = new Byte(127 as byte);
        let dst_3: Long = new Long(src_3.toLong());
  if(dst_1 !== src_1.toLong()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toLong()');
      }

  if(dst_2 !== src_2.toLong()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toLong()');
      }

  if(dst_3 !== src_3.toLong()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toLong()');
      }
}

export function testAssignmentLikeContexts0013(){
  const TAG = 'testAssignmentLikeContexts0013';
  let src_1: Byte = new Byte(-128 as byte);
        let dst_1: Float = new Float(src_1.toFloat());

        let src_2: Byte = new Byte(0 as byte);
        let dst_2: Float = new Float(src_2.toFloat());

        let src_3: Byte = new Byte(127 as byte);
        let dst_3: Float = new Float(src_3.toFloat());
  if(dst_1 !== src_1.toFloat()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toFloat()');
      }

  if(dst_2 !== src_2.toFloat()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toFloat()');
      }

  if(dst_3 !== src_3.toFloat()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toFloat()');
      }
}

export function testAssignmentLikeContexts0014(){
  const TAG = 'testAssignmentLikeContexts0014';
  let src_1: Byte = new Byte(-128 as byte);
        let dst_1: Double = new Double(src_1.toDouble());

        let src_2: Byte = new Byte(0 as byte);
        let dst_2: Double = new Double(src_2.toDouble());

        let src_3: Byte = new Byte(127 as byte);
        let dst_3: Double = new Double(src_3.toDouble());
  if(dst_1 !== src_1.toDouble()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toDouble()');
      }

  if(dst_2 !== src_2.toDouble()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toDouble()');
      }

  if(dst_3 !== src_3.toDouble()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toDouble()');
      }
}

export function testAssignmentLikeContexts0015(){
  const TAG = 'testAssignmentLikeContexts0015';
  let src_1: Short = new Short((-32768).toShort());
        let dst_1: Int = new Int(src_1.toInt());

        let src_2: Short = new Short((-128).toShort());
        let dst_2: Int = new Int(src_2.toInt());

        let src_3: Short = new Short((0).toShort());
        let dst_3: Int = new Int(src_3.toInt());
  if(dst_1 !== src_1.toInt()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toInt()');
      }

  if(dst_2 !== src_2.toInt()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toInt()');
      }

  if(dst_3 !== src_3.toInt()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toInt()');
      }
}

export function testAssignmentLikeContexts0016(){
  const TAG = 'testAssignmentLikeContexts0016';
  let src_1: Short = new Short((-32768).toShort());
        let dst_1: Long = new Long(src_1.toLong());

        let src_2: Short = new Short((-128).toShort());
        let dst_2: Long = new Long(src_2.toLong());

        let src_3: Short = new Short((0).toShort());
        let dst_3: Long = new Long(src_3.toLong());
  if(dst_1 !== src_1.toLong()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toLong()');
      }

  if(dst_2 !== src_2.toLong()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toLong()');
      }

  if(dst_3 !== src_3.toLong()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toLong()');
      }
}

export function testAssignmentLikeContexts0017(){
  const TAG = 'testAssignmentLikeContexts0017';
  let src_1: Short = new Short((-32768).toShort());
        let dst_1: Float = new Float(src_1.toFloat());

        let src_2: Short = new Short((-128).toShort());
        let dst_2: Float = new Float(src_2.toFloat());

        let src_3: Short = new Short((0).toShort());
        let dst_3: Float = new Float(src_3.toFloat());
  if(dst_1 !== src_1.toFloat()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toFloat()');
      }

  if(dst_2 !== src_2.toFloat()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toFloat()');
      }

  if(dst_3 !== src_3.toFloat()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toFloat()');
      }
}

export function testAssignmentLikeContexts0018(){
  const TAG = 'testAssignmentLikeContexts0018';
  let src_1: Short = new Short((-32768).toShort());
        let dst_1: Double = new Double(src_1.toDouble());

        let src_2: Short = new Short((-128).toShort());
        let dst_2: Double = new Double(src_2.toDouble());

        let src_3: Short = new Short((0).toShort());
        let dst_3: Double = new Double(src_3.toDouble());
  if(dst_1 !== src_1.toDouble()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toDouble()');
      }

  if(dst_2 !== src_2.toDouble()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toDouble()');
      }

  if(dst_3 !== src_3.toDouble()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toDouble()');
      }
}

export function testAssignmentLikeContexts0019(){
  const TAG = 'testAssignmentLikeContexts0019';
  let src_1: Int = new Int(127);
        let dst_1: Long = new Long(src_1.toLong());

        let src_2: Int = new Int(32767);
        let dst_2: Long = new Long(src_2.toLong());

        let src_3: Int = new Int(2147483647);
        let dst_3: Long = new Long(src_3.toLong());
  if(dst_1 !== src_1.toLong()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toLong()');
      }

  if(dst_2 !== src_2.toLong()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toLong()');
      }

  if(dst_3 !== src_3.toLong()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toLong()');
      }
}

export function testAssignmentLikeContexts0020(){
  const TAG = 'testAssignmentLikeContexts0020';
  let src_1: Int = new Int(127);
        let dst_1: Float = new Float(src_1.toFloat());

        let src_2: Int = new Int(32767);
        let dst_2: Float = new Float(src_2.toFloat());
  if(dst_1 !== src_1.toFloat()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toFloat()');
      }

  if(dst_2 !== src_2.toFloat()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toFloat()');
      }
}

export function testAssignmentLikeContexts0021(){
  const TAG = 'testAssignmentLikeContexts0021';
  let src_1: Int = new Int(127);
        let dst_1: Double = new Double(src_1.toDouble());

        let src_2: Int = new Int(32768);
        let dst_2: Double = new Double(src_2.toDouble());
  if(dst_1 !== src_1.toDouble()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toDouble()');
      }

  if(dst_2 !== src_2.toDouble()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toDouble()');
      }
}

export function testAssignmentLikeContexts0022(){
  const TAG = 'testAssignmentLikeContexts0022';
  let src_1: Long = new Long((-1).toLong());
        let dst_1: Float = new Float(src_1.toFloat());

        let src_2: Long = new Long((0).toLong());
        let dst_2: Float = new Float(src_2.toFloat());

        let src_3: Long = new Long((1).toLong());
        let dst_3: Float = new Float(src_3.toFloat());
  if(dst_1 !== src_1.toFloat()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toFloat()');
      }

  if(dst_2 !== src_2.toFloat()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toFloat()');
      }

  if(dst_3 !== src_3.toFloat()){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3.toFloat()');
      }
}

export function testAssignmentLikeContexts0023(){
  const TAG = 'testAssignmentLikeContexts0023';
  let src_1: Long = new Long((-128).toLong());
        let dst_1: Double = new Double(src_1.toDouble());

        let src_2: Long = new Long((127).toLong());
        let dst_2: Double = new Double(src_2.toDouble());
  if(dst_1 !== src_1.toDouble()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toDouble()');
      }

  if(dst_2 !== src_2.toDouble()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toDouble()');
      }
}

export function testAssignmentLikeContexts0024(){
  const TAG = 'testAssignmentLikeContexts0024';
  let src_1: Float = new Float(1.4e-10f);
        let dst_1: Double = new Double(src_1.toDouble());

        let src_2: Float = new Float(0.0000001f);
        let dst_2: Double = new Double(src_2.toDouble());
  if(dst_1 !== src_1.toDouble()){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1.toDouble()');
      }

  if(dst_2 !== src_2.toDouble()){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2.toDouble()');
      }
}

export function testAssignmentLikeContexts0025(){
  const TAG = 'testAssignmentLikeContexts0025';
  let src_1: Byte = new Byte(-128 as byte);
        let dst_1: byte = src_1;

        let src_2: Byte = new Byte(0 as byte);
        let dst_2: byte = src_2;

        let src_3: Byte = new Byte(127 as byte);
        let dst_3: byte = src_3;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }

  if(dst_3 !== src_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3');
      }
}

export function testAssignmentLikeContexts0026(){
  const TAG = 'testAssignmentLikeContexts0026';
  let src_1: Char = new Char(c'\u0000');
        let dst_1: char = src_1;

        let src_2: Char = new Char(c'X');
        let dst_2: char = src_2;

        let src_3: Char = new Char(c'\uffff');
        let dst_3: char = src_3;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }

  if(dst_3 !== src_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3');
      }
}

export function testAssignmentLikeContexts0027(){
  const TAG = 'testAssignmentLikeContexts0027';
  let src_1: Short = new Short((-32768).toShort());
        let dst_1: short = src_1;

        let src_2: Short = new Short((-128).toShort());
        let dst_2: short = src_2;

        let src_3: Short = new Short((0).toShort());
        let dst_3: short = src_3;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }

  if(dst_3 !== src_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3');
      }
}

export function testAssignmentLikeContexts0028(){
  const TAG = 'testAssignmentLikeContexts0028';
  let src_1: Int = new Int(127);
        let dst_1: int = src_1;

        let src_2: Int = new Int(32767);
        let dst_2: int = src_2;

        let src_3: Int = new Int(2147483647);
        let dst_3: int = src_3;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }

  if(dst_3 !== src_3){
        console.info(`${TAG} Task execution failed: dst_3: ${dst_3}`);
        throw new Error('dst_3 check failed, expected src_3');
      }
}

export function testAssignmentLikeContexts0029(){
  const TAG = 'testAssignmentLikeContexts0029';
  let src_1: Long = new Long((-9223372036854775808).toLong());
        let dst_1: long = src_1;

        let src_2: Long = new Long((9223372036854775807).toLong());
        let dst_2: long = src_2;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0030(){
  const TAG = 'testAssignmentLikeContexts0030';
  let src_1: Float = new Float(1.401298464324817e-45f);
        let dst_1: float = src_1;

        let src_2: Float = new Float(0.00000001f);
        let dst_2: float = src_2;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0031(){
  const TAG = 'testAssignmentLikeContexts0031';
  let src_1: Double = new Double(-1.401298464324817e-45);
        let dst_1: double = src_1;

        let src_2: Double = new Double(1.000000000000001);
        let dst_2: double = src_2;
  if(dst_1 !== src_1){
        console.info(`${TAG} Task execution failed: dst_1: ${dst_1}`);
        throw new Error('dst_1 check failed, expected src_1');
      }

  if(dst_2 !== src_2){
        console.info(`${TAG} Task execution failed: dst_2: ${dst_2}`);
        throw new Error('dst_2 check failed, expected src_2');
      }
}

export function testAssignmentLikeContexts0032(){
  const TAG = 'testAssignmentLikeContexts0032';
  let v1: Byte = new Byte(-128 as byte);
        let v2: Byte = new Byte(0 as byte);
        let v3: Byte = new Byte(127 as byte);
        let c: A1 = new A1(v1, v2, v3);
        c.foo(v1, v2, v3);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }

  if(c.fld_3 !== v3){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3');
      }
}

export function testAssignmentLikeContexts0033(){
  const TAG = 'testAssignmentLikeContexts0033';
  let v1: Char = new Char(c'\u0000');
        let v2: Char = new Char(c'X');
        let v3: Char = new Char(c'\uffff');
        let c: A2 = new A2(v1, v2, v3);
        c.foo(v1, v2, v3);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }

  if(c.fld_3 !== v3){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3');
      }
}

export function testAssignmentLikeContexts0034(){
  const TAG = 'testAssignmentLikeContexts0034';
  let v1: Short = new Short(Short.MIN_VALUE);
        let v2: Short = new Short((255).toShort());
        let c: A3 = new A3(v1, v2);
        c.foo(v1, v2);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }
}

export function testAssignmentLikeContexts0035(){
  const TAG = 'testAssignmentLikeContexts0035';
  let v1: Int = new Int(127);
        let v2: Int = new Int(32767);
        let v3: Int = new Int(Int.MAX_VALUE);
        let c: A4 = new A4(v1, v2, v3);
        c.foo(v1, v2, v3);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }

  if(c.fld_3 !== v3){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3');
      }
}

export function testAssignmentLikeContexts0036(){
  const TAG = 'testAssignmentLikeContexts0036';
  let v1: Long = new Long(Long.MIN_VALUE);
        let v2: Long = new Long((9223372036854775807).toLong());
        let c: A5 = new A5(v1, v2);
        c.foo(v1, v2);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }
}

export function testAssignmentLikeContexts0037(){
  const TAG = 'testAssignmentLikeContexts0037';
  let v1: Float = new Float(1.401298464324817e-45f);
        let v2: Float = new Float(Float.MAX_VALUE);
        let c: A6 = new A6(v1, v2);
        c.foo(v1, v2);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }
}

export function testAssignmentLikeContexts0038(){
  const TAG = 'testAssignmentLikeContexts0038';
  let v1: Double = new Double(-1.401298464324817e-45);
        let v2: Double = new Double(Double.MAX_VALUE);
        let c: A7 = new A7(v1, v2);
        c.foo(v1, v2);
  if(c.fld_1 !== v1){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1');
      }

  if(c.fld_2 !== v2){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2');
      }
}

export function testAssignmentLikeContexts0039(){
  const TAG = 'testAssignmentLikeContexts0039';
  let v1: Byte = new Byte(-128 as byte);
        let v2: Byte = new Byte(0 as byte);
        let v3: Byte = new Byte(127 as byte);
        let c: A8 = new A8(v1.toShort(), v2.toShort(), v3.toShort());
        c.foo(v1.toShort(), v2.toShort(), v3.toShort());
  if(c.fld_1 !== v1.toShort()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toShort()');
      }

  if(c.fld_2 !== v2.toShort()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toShort()');
      }

  if(c.fld_3 !== v3.toShort()){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3.toShort()');
      }
}

export function testAssignmentLikeContexts0040(){
  const TAG = 'testAssignmentLikeContexts0040';
  let v1: Byte = new Byte(-128 as byte);
        let v2: Byte = new Byte(0 as byte);
        let v3: Byte = new Byte(127 as byte);
        let c: A9 = new A9(v1.toInt(), v2.toInt(), v3.toInt());
        c.foo(v1.toInt(), v2.toInt(), v3.toInt());
  if(c.fld_1 !== v1.toInt()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toInt()');
      }

  if(c.fld_2 !== v2.toInt()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toInt()');
      }

  if(c.fld_3 !== v3.toInt()){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3.toInt()');
      }
}

export function testAssignmentLikeContexts0041(){
  const TAG = 'testAssignmentLikeContexts0041';
  let v1: Byte = new Byte(-128 as byte);
        let v2: Byte = new Byte(0 as byte);
        let v3: Byte = new Byte(127 as byte);
        let c: A10 = new A10(v1.toLong(), v2.toLong(), v3.toLong());
        c.foo(v1.toLong(), v2.toLong(), v3.toLong());
  if(c.fld_1 !== v1.toLong()){
        console.info(`${TAG} Task execution failed: c.fld_1: ${c.fld_1}`);
        throw new Error('c.fld_1 check failed, expected v1.toLong()');
      }

  if(c.fld_2 !== v2.toLong()){
        console.info(`${TAG} Task execution failed: c.fld_2: ${c.fld_2}`);
        throw new Error('c.fld_2 check failed, expected v2.toLong()');
      }

  if(c.fld_3 !== v3.toLong()){
        console.info(`${TAG} Task execution failed: c.fld_3: ${c.fld_3}`);
        throw new Error('c.fld_3 check failed, expected v3.toLong()');
      }
}

