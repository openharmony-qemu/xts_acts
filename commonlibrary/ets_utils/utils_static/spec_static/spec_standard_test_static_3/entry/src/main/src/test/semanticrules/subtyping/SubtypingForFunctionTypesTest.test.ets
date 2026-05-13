/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

import {
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType
} from '../../../../../hypium/index';

class Base1 {
  b: string = 'b'
}
class Derived1 extends Base1 {
  b: string = 'd'
}
function fooBB1(p: Base1): Base1 {return p};
function fooBD1(p: Base1): Derived1 {return new Derived1()};
function fooDB1(p: Derived1): Base1 { return new Base1()};
function fooDD1(p: Derived1): Derived1 { return p};
function fooBBN1(p: Base1, n: number): Base1 {return p};
function fooBDN1(p: Base1, n: number): Derived1 {return new Derived1()};
function fooDBN1(p: Derived1, n: number): Base1 { return new Base1()};
function fooDDN1(p: Derived1, n: number): Derived1 { return p};
function fooBBO1(p: Base1, n?: number): Base1 {return p};
function fooBDO1(p: Base1, n?: number): Derived1 {return new Derived1()};
function fooDBO1(p: Derived1, n?: number): Base1 { return new Base1()};
function fooDDO1(p: Derived1, n?: number): Derived1 { return p};
function fooBBR1(p: Base1, ...n: number[]): Base1 {return p};
function fooBDR1(p: Base1, ...n: number[]): Derived1 {return new Derived1()};
function fooDBR1(p: Derived1, ...n: number[]): Base1 { return new Base1()};
function fooDDR1(p: Derived1, ...n: number[]): Derived1 { return p};
let foobb1 = fooBB1
let foobd1 = fooBD1
let foodb1 = fooDB1
let foodd1 = fooDD1
let foobbn1 = fooBBN1
let foobdn1 = fooBDN1
let foodbn1 = fooDBN1
let fooddn1 = fooDDN1
let foobbo1 = fooBBO1
let foobdo1 = fooBDO1
let foodbo1 = fooDBO1
let fooddo1 = fooDDO1
let foobbr1 = fooBBR1
let foobdr1 = fooBDR1
let foodbr1 = fooDBR1
let fooddr1 = fooDDR1
foobb1 = foobd1 // OK: identical parameter types, and covariant return type

class Base2 {
  b: string = 'b'
}
class Derived2 extends Base2 {
  b: string = 'd'
}
function fooBB2(p: Base2): Base2 {return p};
function fooBD2(p: Base2): Derived2 {return new Derived2()};
function fooDB2(p: Derived2): Base2 { return new Base2()};
function fooDD2(p: Derived2): Derived2 { return p};
function fooBBN2(p: Base2, n: number): Base2 {return p};
function fooBDN2(p: Base2, n: number): Derived2 {return new Derived2()};
function fooDBN2(p: Derived2, n: number): Base2 { return new Base2()};
function fooDDN2(p: Derived2, n: number): Derived2 { return p};
function fooBBO2(p: Base2, n?: number): Base2 {return p};
function fooBDO2(p: Base2, n?: number): Derived2 {return new Derived2()};
function fooDBO2(p: Derived2, n?: number): Base2 { return new Base2()};
function fooDDO2(p: Derived2, n?: number): Derived2 { return p};
function fooBBR2(p: Base2, ...n: number[]): Base2 {return p};
function fooBDR2(p: Base2, ...n: number[]): Derived2 {return new Derived2()};
function fooDBR2(p: Derived2, ...n: number[]): Base2 { return new Base2()};
function fooDDR2(p: Derived2, ...n: number[]): Derived2 { return p};
let foobb2 = fooBB2
let foobd2 = fooBD2
let foodb2 = fooDB2
let foodd2 = fooDD2
let foobbn2 = fooBBN2
let foobdn2 = fooBDN2
let foodbn2 = fooDBN2
let fooddn2 = fooDDN2
let foobbo2 = fooBBO2
let foobdo2 = fooBDO2
let foodbo2 = fooDBO2
let fooddo2 = fooDDO2
let foobbr2 = fooBBR2
let foobdr2 = fooBDR2
let foodbr2 = fooDBR2
let fooddr2 = fooDDR2
foodb2 = foobd2 // OK: contravariant parameter types, and covariant return type

class Base3 {
  b: string = 'b'
}
class Derived3 extends Base3 {
  b: string = 'd'
}
function fooBB3(p: Base3): Base3 {return p};
function fooBD3(p: Base3): Derived3 {return new Derived3()};
function fooDB3(p: Derived3): Base3 { return new Base3()};
function fooDD3(p: Derived3): Derived3 { return p};
function fooBBN3(p: Base3, n: number): Base3 {return p};
function fooBDN3(p: Base3, n: number): Derived3 {return new Derived3()};
function fooDBN3(p: Derived3, n: number): Base3 { return new Base3()};
function fooDDN3(p: Derived3, n: number): Derived3 { return p};
function fooBBO3(p: Base3, n?: number): Base3 {return p};
function fooBDO3(p: Base3, n?: number): Derived3 {return new Derived3()};
function fooDBO3(p: Derived3, n?: number): Base3 { return new Base3()};
function fooDDO3(p: Derived3, n?: number): Derived3 { return p};
function fooBBR3(p: Base3, ...n: number[]): Base3 {return p};
function fooBDR3(p: Base3, ...n: number[]): Derived3 {return new Derived3()};
function fooDBR3(p: Derived3, ...n: number[]): Base3 { return new Base3()};
function fooDDR3(p: Derived3, ...n: number[]): Derived3 { return p};
let foobb3 = fooBB3
let foobd3 = fooBD3
let foodb3 = fooDB3
let foodd3 = fooDD3
let foobbn3 = fooBBN3
let foobdn3 = fooBDN3
let foodbn3 = fooDBN3
let fooddn3 = fooDDN3
let foobbo3 = fooBBO3
let foobdo3 = fooBDO3
let foodbo3 = fooDBO3
let fooddo3 = fooDDO3
let foobbr3 = fooBBR3
let foobdr3 = fooBDR3
let foodbr3 = fooDBR3
let fooddr3 = fooDDR3
foodb3 = foodd3 // OK: identical parameter types, and covariant return type

class Base4 {
  b: string = 'b'
}
class Derived4 extends Base4 {
  b: string = 'd'
}
function fooBB4(p: Base4): Base4 {return p};
function fooBD4(p: Base4): Derived4 {return new Derived4()};
function fooDB4(p: Derived4): Base4 { return new Base4()};
function fooDD4(p: Derived4): Derived4 { return p};
function fooBBN4(p: Base4, n: number): Base4 {return p};
function fooBDN4(p: Base4, n: number): Derived4 {return new Derived4()};
function fooDBN4(p: Derived4, n: number): Base4 { return new Base4()};
function fooDDN4(p: Derived4, n: number): Derived4 { return p};
function fooBBO4(p: Base4, n?: number): Base4 {return p};
function fooBDO4(p: Base4, n?: number): Derived4 {return new Derived4()};
function fooDBO4(p: Derived4, n?: number): Base4 { return new Base4()};
function fooDDO4(p: Derived4, n?: number): Derived4 { return p};
function fooBBR4(p: Base4, ...n: number[]): Base4 {return p};
function fooBDR4(p: Base4, ...n: number[]): Derived4 {return new Derived4()};
function fooDBR4(p: Derived4, ...n: number[]): Base4 { return new Base4()};
function fooDDR4(p: Derived4, ...n: number[]): Derived4 { return p};
let foobb4 = fooBB4
let foobd4 = fooBD4
let foodb4 = fooDB4
let foodd4 = fooDD4
let foobbn4 = fooBBN4
let foobdn4 = fooBDN4
let foodbn4 = fooDBN4
let fooddn4 = fooDDN4
let foobbo4 = fooBBO4
let foobdo4 = fooBDO4
let foodbo4 = fooDBO4
let fooddo4 = fooDDO4
let foobbr4 = fooBBR4
let foobdr4 = fooBDR4
let foodbr4 = fooDBR4
let fooddr4 = fooDDR4
foodd4 = foobd4 // OK: contravariant parameter types, and identical return type

class Base5 {
  b: string = 'b'
}
class Derived5 extends Base5 {
  b: string = 'd'
}
function fooBB5(p: Base5): Base5 {return p};
function fooBD5(p: Base5): Derived5 {return new Derived5()};
function fooDB5(p: Derived5): Base5 { return new Base5()};
function fooDD5(p: Derived5): Derived5 { return p};
function fooBBN5(p: Base5, n: number): Base5 {return p};
function fooBDN5(p: Base5, n: number): Derived5 {return new Derived5()};
function fooDBN5(p: Derived5, n: number): Base5 { return new Base5()};
function fooDDN5(p: Derived5, n: number): Derived5 { return p};
function fooBBO5(p: Base5, n?: number): Base5 {return p};
function fooBDO5(p: Base5, n?: number): Derived5 {return new Derived5()};
function fooDBO5(p: Derived5, n?: number): Base5 { return new Base5()};
function fooDDO5(p: Derived5, n?: number): Derived5 { return p};
function fooBBR5(p: Base5, ...n: number[]): Base5 {return p};
function fooBDR5(p: Base5, ...n: number[]): Derived5 {return new Derived5()};
function fooDBR5(p: Derived5, ...n: number[]): Base5 { return new Base5()};
function fooDDR5(p: Derived5, ...n: number[]): Derived5 { return p};
let foobb5 = fooBB5
let foobd5 = fooBD5
let foodb5 = fooDB5
let foodd5 = fooDD5
let foobbn5 = fooBBN5
let foobdn5 = fooBDN5
let foodbn5 = fooDBN5
let fooddn5 = fooDDN5
let foobbo5 = fooBBO5
let foobdo5 = fooBDO5
let foodbo5 = fooDBO5
let fooddo5 = fooDDO5
let foobbr5 = fooBBR5
let foobdr5 = fooBDR5
let foodbr5 = fooDBR5
let fooddr5 = fooDDR5
foobbn5 = foobdn5

class Base6 {
  b: string = 'b'
}
class Derived6 extends Base6 {
  b: string = 'd'
}
function fooBB6(p: Base6): Base6 {return p};
function fooBD6(p: Base6): Derived6 {return new Derived6()};
function fooDB6(p: Derived6): Base6 { return new Base6()};
function fooDD6(p: Derived6): Derived6 { return p};
function fooBBN6(p: Base6, n: number): Base6 {return p};
function fooBDN6(p: Base6, n: number): Derived6 {return new Derived6()};
function fooDBN6(p: Derived6, n: number): Base6 { return new Base6()};
function fooDDN6(p: Derived6, n: number): Derived6 { return p};
function fooBBO6(p: Base6, n?: number): Base6 {return p};
function fooBDO6(p: Base6, n?: number): Derived6 {return new Derived6()};
function fooDBO6(p: Derived6, n?: number): Base6 { return new Base6()};
function fooDDO6(p: Derived6, n?: number): Derived6 { return p};
function fooBBR6(p: Base6, ...n: number[]): Base6 {return p};
function fooBDR6(p: Base6, ...n: number[]): Derived6 {return new Derived6()};
function fooDBR6(p: Derived6, ...n: number[]): Base6 { return new Base6()};
function fooDDR6(p: Derived6, ...n: number[]): Derived6 { return p};
let foobb6 = fooBB6
let foobd6 = fooBD6
let foodb6 = fooDB6
let foodd6 = fooDD6
let foobbn6 = fooBBN6
let foobdn6 = fooBDN6
let foodbn6 = fooDBN6
let fooddn6 = fooDDN6
let foobbo6 = fooBBO6
let foobdo6 = fooBDO6
let foodbo6 = fooDBO6
let fooddo6 = fooDDO6
let foobbr6 = fooBBR6
let foobdr6 = fooBDR6
let foodbr6 = fooDBR6
let fooddr6 = fooDDR6
foobbo6 = foobdo6


class Base7 {
  b: string = 'b'
}
class Derived7 extends Base7 {
  b: string = 'd'
}
function fooBB7(p: Base7): Base7 {return p};
function fooBD7(p: Base7): Derived7 {return new Derived7()};
function fooDB7(p: Derived7): Base7 { return new Base7()};
function fooDD7(p: Derived7): Derived7 { return p};
function fooBBN7(p: Base7, n: number): Base7 {return p};
function fooBDN7(p: Base7, n: number): Derived7 {return new Derived7()};
function fooDBN7(p: Derived7, n: number): Base7 { return new Base7()};
function fooDDN7(p: Derived7, n: number): Derived7 { return p};
function fooBBO7(p: Base7, n?: number): Base7 {return p};
function fooBDO7(p: Base7, n?: number): Derived7 {return new Derived7()};
function fooDBO7(p: Derived7, n?: number): Base7 { return new Base7()};
function fooDDO7(p: Derived7, n?: number): Derived7 { return p};
function fooBBR7(p: Base7, ...n: number[]): Base7 {return p};
function fooBDR7(p: Base7, ...n: number[]): Derived7 {return new Derived7()};
function fooDBR7(p: Derived7, ...n: number[]): Base7 { return new Base7()};
function fooDDR7(p: Derived7, ...n: number[]): Derived7 { return p};
let foobb7 = fooBB7
let foobd7 = fooBD7
let foodb7 = fooDB7
let foodd7 = fooDD7
let foobbn7 = fooBBN7
let foobdn7 = fooBDN7
let foodbn7 = fooDBN7
let fooddn7 = fooDDN7
let foobbo7 = fooBBO7
let foobdo7 = fooBDO7
let foodbo7 = fooDBO7
let fooddo7 = fooDDO7
let foobbr7 = fooBBR7
let foobdr7 = fooBDR7
let foodbr7 = fooDBR7
let fooddr7 = fooDDR7
foobbn7 = foobd7


class Base8 {
  b: string = 'b'
}
class Derived8 extends Base8 {
  b: string = 'd'
}
function fooBB8(p: Base8): Base8 {return p};
function fooBD8(p: Base8): Derived8 {return new Derived8()};
function fooDB8(p: Derived8): Base8 { return new Base8()};
function fooDD8(p: Derived8): Derived8 { return p};
function fooBBN8(p: Base8, n: number): Base8 {return p};
function fooBDN8(p: Base8, n: number): Derived8 {return new Derived8()};
function fooDBN8(p: Derived8, n: number): Base8 { return new Base8()};
function fooDDN8(p: Derived8, n: number): Derived8 { return p};
function fooBBO8(p: Base8, n?: number): Base8 {return p};
function fooBDO8(p: Base8, n?: number): Derived8 {return new Derived8()};
function fooDBO8(p: Derived8, n?: number): Base8 { return new Base8()};
function fooDDO8(p: Derived8, n?: number): Derived8 { return p};
function fooBBR8(p: Base8, ...n: number[]): Base8 {return p};
function fooBDR8(p: Base8, ...n: number[]): Derived8 {return new Derived8()};
function fooDBR8(p: Derived8, ...n: number[]): Base8 { return new Base8()};
function fooDDR8(p: Derived8, ...n: number[]): Derived8 { return p};
let foobb8 = fooBB8
let foobd8 = fooBD8
let foodb8 = fooDB8
let foodd8 = fooDD8
let foobbn8 = fooBBN8
let foobdn8 = fooBDN8
let foodbn8 = fooDBN8
let fooddn8 = fooDDN8
let foobbo8 = fooBBO8
let foobdo8 = fooBDO8
let foodbo8 = fooDBO8
let fooddo8 = fooDDO8
let foobbr8 = fooBBR8
let foobdr8 = fooBDR8
let foodbr8 = fooDBR8
let fooddr8 = fooDDR8
foobbo8 = foobd8


class Base9 {
  b: string = 'b'
}
class Derived9 extends Base9 {
  b: string = 'd'
}
function fooBB9(p: Base9): Base9 {return p};
function fooBD9(p: Base9): Derived9 {return new Derived9()};
function fooDB9(p: Derived9): Base9 { return new Base9()};
function fooDD9(p: Derived9): Derived9 { return p};
function fooBBN9(p: Base9, n: number): Base9 {return p};
function fooBDN9(p: Base9, n: number): Derived9 {return new Derived9()};
function fooDBN9(p: Derived9, n: number): Base9 { return new Base9()};
function fooDDN9(p: Derived9, n: number): Derived9 { return p};
function fooBBO9(p: Base9, n?: number): Base9 {return p};
function fooBDO9(p: Base9, n?: number): Derived9 {return new Derived9()};
function fooDBO9(p: Derived9, n?: number): Base9 { return new Base9()};
function fooDDO9(p: Derived9, n?: number): Derived9 { return p};
function fooBBR9(p: Base9, ...n: number[]): Base9 {return p};
function fooBDR9(p: Base9, ...n: number[]): Derived9 {return new Derived9()};
function fooDBR9(p: Derived9, ...n: number[]): Base9 { return new Base9()};
function fooDDR9(p: Derived9, ...n: number[]): Derived9 { return p};
let foobb9 = fooBB9
let foobd9 = fooBD9
let foodb9 = fooDB9
let foodd9 = fooDD9
let foobbn9 = fooBBN9
let foobdn9 = fooBDN9
let foodbn9 = fooDBN9
let fooddn9 = fooDDN9
let foobbo9 = fooBBO9
let foobdo9 = fooBDO9
let foodbo9 = fooDBO9
let fooddo9 = fooDDO9
let foobbr9 = fooBBR9
let foobdr9 = fooBDR9
let foodbr9 = fooDBR9
let fooddr9 = fooDDR9
foodbn9 = foobd9


class Base10 {
  b: string = 'b'
}
class Derived10 extends Base10 {
  b: string = 'd'
}
function fooBB10(p: Base10): Base10 {return p};
function fooBD10(p: Base10): Derived10 {return new Derived10()};
function fooDB10(p: Derived10): Base10 { return new Base10()};
function fooDD10(p: Derived10): Derived10 { return p};
function fooBBN10(p: Base10, n: number): Base10 {return p};
function fooBDN10(p: Base10, n: number): Derived10 {return new Derived10()};
function fooDBN10(p: Derived10, n: number): Base10 { return new Base10()};
function fooDDN10(p: Derived10, n: number): Derived10 { return p};
function fooBBO10(p: Base10, n?: number): Base10 {return p};
function fooBDO10(p: Base10, n?: number): Derived10 {return new Derived10()};
function fooDBO10(p: Derived10, n?: number): Base10 { return new Base10()};
function fooDDO10(p: Derived10, n?: number): Derived10 { return p};
function fooBBR10(p: Base10, ...n: number[]): Base10 {return p};
function fooBDR10(p: Base10, ...n: number[]): Derived10 {return new Derived10()};
function fooDBR10(p: Derived10, ...n: number[]): Base10 { return new Base10()};
function fooDDR10(p: Derived10, ...n: number[]): Derived10 { return p};
let foobb10 = fooBB10
let foobd10 = fooBD10
let foodb10 = fooDB10
let foodd10 = fooDD10
let foobbn10 = fooBBN10
let foobdn10 = fooBDN10
let foodbn10 = fooDBN10
let fooddn10 = fooDDN10
let foobbo10 = fooBBO10
let foobdo10 = fooBDO10
let foodbo10 = fooDBO10
let fooddo10 = fooDDO10
let foobbr10 = fooBBR10
let foobdr10 = fooBDR10
let foodbr10 = fooDBR10
let fooddr10 = fooDDR10
foodbo10 = foobd10


class Base11 {
  b: string = 'b'
}
class Derived11 extends Base11 {
  b: string = 'd'
}
function fooBB11(p: Base11): Base11 {return p};
function fooBD11(p: Base11): Derived11 {return new Derived11()};
function fooDB11(p: Derived11): Base11 { return new Base11()};
function fooDD11(p: Derived11): Derived11 { return p};
function fooBBN11(p: Base11, n: number): Base11 {return p};
function fooBDN11(p: Base11, n: number): Derived11 {return new Derived11()};
function fooDBN11(p: Derived11, n: number): Base11 { return new Base11()};
function fooDDN11(p: Derived11, n: number): Derived11 { return p};
function fooBBO11(p: Base11, n?: number): Base11 {return p};
function fooBDO11(p: Base11, n?: number): Derived11 {return new Derived11()};
function fooDBO11(p: Derived11, n?: number): Base11 { return new Base11()};
function fooDDO11(p: Derived11, n?: number): Derived11 { return p};
function fooBBR11(p: Base11, ...n: number[]): Base11 {return p};
function fooBDR11(p: Base11, ...n: number[]): Derived11 {return new Derived11()};
function fooDBR11(p: Derived11, ...n: number[]): Base11 { return new Base11()};
function fooDDR11(p: Derived11, ...n: number[]): Derived11 { return p};
let foobb11 = fooBB11
let foobd11 = fooBD11
let foodb11 = fooDB11
let foodd11 = fooDD11
let foobbn11 = fooBBN11
let foobdn11 = fooBDN11
let foodbn11 = fooDBN11
let fooddn11 = fooDDN11
let foobbo11 = fooBBO11
let foobdo11 = fooBDO11
let foodbo11 = fooDBO11
let fooddo11 = fooDDO11
let foobbr11 = fooBBR11
let foobdr11 = fooBDR11
let foodbr11 = fooDBR11
let fooddr11 = fooDDR11
foodbn11 = fooddn11


class Base12 {
  b: string = 'b'
}
class Derived12 extends Base12 {
  b: string = 'd'
}
function fooBB12(p: Base12): Base12 {return p};
function fooBD12(p: Base12): Derived12 {return new Derived12()};
function fooDB12(p: Derived12): Base12 { return new Base12()};
function fooDD12(p: Derived12): Derived12 { return p};
function fooBBN12(p: Base12, n: number): Base12 {return p};
function fooBDN12(p: Base12, n: number): Derived12 {return new Derived12()};
function fooDBN12(p: Derived12, n: number): Base12 { return new Base12()};
function fooDDN12(p: Derived12, n: number): Derived12 { return p};
function fooBBO12(p: Base12, n?: number): Base12 {return p};
function fooBDO12(p: Base12, n?: number): Derived12 {return new Derived12()};
function fooDBO12(p: Derived12, n?: number): Base12 { return new Base12()};
function fooDDO12(p: Derived12, n?: number): Derived12 { return p};
function fooBBR12(p: Base12, ...n: number[]): Base12 {return p};
function fooBDR12(p: Base12, ...n: number[]): Derived12 {return new Derived12()};
function fooDBR12(p: Derived12, ...n: number[]): Base12 { return new Base12()};
function fooDDR12(p: Derived12, ...n: number[]): Derived12 { return p};
let foobb12 = fooBB12
let foobd12 = fooBD12
let foodb12 = fooDB12
let foodd12 = fooDD12
let foobbn12 = fooBBN12
let foobdn12 = fooBDN12
let foodbn12 = fooDBN12
let fooddn12 = fooDDN12
let foobbo12 = fooBBO12
let foobdo12 = fooBDO12
let foodbo12 = fooDBO12
let fooddo12 = fooDDO12
let foobbr12 = fooBBR12
let foobdr12 = fooBDR12
let foodbr12 = fooDBR12
let fooddr12 = fooDDR12
foodbo12 = fooddo12


class Base13 {
  b: string = 'b'
}
class Derived13 extends Base13 {
  b: string = 'd'
}
function fooBB13(p: Base13): Base13 {return p};
function fooBD13(p: Base13): Derived13 {return new Derived13()};
function fooDB13(p: Derived13): Base13 { return new Base13()};
function fooDD13(p: Derived13): Derived13 { return p};
function fooBBN13(p: Base13, n: number): Base13 {return p};
function fooBDN13(p: Base13, n: number): Derived13 {return new Derived13()};
function fooDBN13(p: Derived13, n: number): Base13 { return new Base13()};
function fooDDN13(p: Derived13, n: number): Derived13 { return p};
function fooBBO13(p: Base13, n?: number): Base13 {return p};
function fooBDO13(p: Base13, n?: number): Derived13 {return new Derived13()};
function fooDBO13(p: Derived13, n?: number): Base13 { return new Base13()};
function fooDDO13(p: Derived13, n?: number): Derived13 { return p};
function fooBBR13(p: Base13, ...n: number[]): Base13 {return p};
function fooBDR13(p: Base13, ...n: number[]): Derived13 {return new Derived13()};
function fooDBR13(p: Derived13, ...n: number[]): Base13 { return new Base13()};
function fooDDR13(p: Derived13, ...n: number[]): Derived13 { return p};
let foobb13 = fooBB13
let foobd13 = fooBD13
let foodb13 = fooDB13
let foodd13 = fooDD13
let foobbn13 = fooBBN13
let foobdn13 = fooBDN13
let foodbn13 = fooDBN13
let fooddn13 = fooDDN13
let foobbo13 = fooBBO13
let foobdo13 = fooBDO13
let foodbo13 = fooDBO13
let fooddo13 = fooDDO13
let foobbr13 = fooBBR13
let foobdr13 = fooBDR13
let foodbr13 = fooDBR13
let fooddr13 = fooDDR13
foodbr13 = fooddr13


class Base14 {
  b: string = 'b'
}
class Derived14 extends Base14 {
  b: string = 'd'
}
function fooBB14(p: Base14): Base14 {return p};
function fooBD14(p: Base14): Derived14 {return new Derived14()};
function fooDB14(p: Derived14): Base14 { return new Base14()};
function fooDD14(p: Derived14): Derived14 { return p};
function fooBBN14(p: Base14, n: number): Base14 {return p};
function fooBDN14(p: Base14, n: number): Derived14 {return new Derived14()};
function fooDBN14(p: Derived14, n: number): Base14 { return new Base14()};
function fooDDN14(p: Derived14, n: number): Derived14 { return p};
function fooBBO14(p: Base14, n?: number): Base14 {return p};
function fooBDO14(p: Base14, n?: number): Derived14 {return new Derived14()};
function fooDBO14(p: Derived14, n?: number): Base14 { return new Base14()};
function fooDDO14(p: Derived14, n?: number): Derived14 { return p};
function fooBBR14(p: Base14, ...n: number[]): Base14 {return p};
function fooBDR14(p: Base14, ...n: number[]): Derived14 {return new Derived14()};
function fooDBR14(p: Derived14, ...n: number[]): Base14 { return new Base14()};
function fooDDR14(p: Derived14, ...n: number[]): Derived14 { return p};
let foobb14 = fooBB14
let foobd14 = fooBD14
let foodb14 = fooDB14
let foodd14 = fooDD14
let foobbn14 = fooBBN14
let foobdn14 = fooBDN14
let foodbn14 = fooDBN14
let fooddn14 = fooDDN14
let foobbo14 = fooBBO14
let foobdo14 = fooBDO14
let foodbo14 = fooDBO14
let fooddo14 = fooDDO14
let foobbr14 = fooBBR14
let foobdr14 = fooBDR14
let foodbr14 = fooDBR14
let fooddr14 = fooDDR14
foodbn14 = foobdn14


class Base15 {
  b: string = 'b'
}
class Derived15 extends Base15 {
  b: string = 'd'
}
function fooBB15(p: Base15): Base15 {return p};
function fooBD15(p: Base15): Derived15 {return new Derived15()};
function fooDB15(p: Derived15): Base15 { return new Base15()};
function fooDD15(p: Derived15): Derived15 { return p};
function fooBBN15(p: Base15, n: number): Base15 {return p};
function fooBDN15(p: Base15, n: number): Derived15 {return new Derived15()};
function fooDBN15(p: Derived15, n: number): Base15 { return new Base15()};
function fooDDN15(p: Derived15, n: number): Derived15 { return p};
function fooBBO15(p: Base15, n?: number): Base15 {return p};
function fooBDO15(p: Base15, n?: number): Derived15 {return new Derived15()};
function fooDBO15(p: Derived15, n?: number): Base15 { return new Base15()};
function fooDDO15(p: Derived15, n?: number): Derived15 { return p};
function fooBBR15(p: Base15, ...n: number[]): Base15 {return p};
function fooBDR15(p: Base15, ...n: number[]): Derived15 {return new Derived15()};
function fooDBR15(p: Derived15, ...n: number[]): Base15 { return new Base15()};
function fooDDR15(p: Derived15, ...n: number[]): Derived15 { return p};
let foobb15 = fooBB15
let foobd15 = fooBD15
let foodb15 = fooDB15
let foodd15 = fooDD15
let foobbn15 = fooBBN15
let foobdn15 = fooBDN15
let foodbn15 = fooDBN15
let fooddn15 = fooDDN15
let foobbo15 = fooBBO15
let foobdo15 = fooBDO15
let foodbo15 = fooDBO15
let fooddo15 = fooDDO15
let foobbr15 = fooBBR15
let foobdr15 = fooBDR15
let foodbr15 = fooDBR15
let fooddr15 = fooDDR15
foodbo15 = foobdo15


class Base16 {
  b: string = 'b'
}
class Derived16 extends Base16 {
  b: string = 'd'
}
function fooBB16(p: Base16): Base16 {return p};
function fooBD16(p: Base16): Derived16 {return new Derived16()};
function fooDB16(p: Derived16): Base16 { return new Base16()};
function fooDD16(p: Derived16): Derived16 { return p};
function fooBBN16(p: Base16, n: number): Base16 {return p};
function fooBDN16(p: Base16, n: number): Derived16 {return new Derived16()};
function fooDBN16(p: Derived16, n: number): Base16 { return new Base16()};
function fooDDN16(p: Derived16, n: number): Derived16 { return p};
function fooBBO16(p: Base16, n?: number): Base16 {return p};
function fooBDO16(p: Base16, n?: number): Derived16 {return new Derived16()};
function fooDBO16(p: Derived16, n?: number): Base16 { return new Base16()};
function fooDDO16(p: Derived16, n?: number): Derived16 { return p};
function fooBBR16(p: Base16, ...n: number[]): Base16 {return p};
function fooBDR16(p: Base16, ...n: number[]): Derived16 {return new Derived16()};
function fooDBR16(p: Derived16, ...n: number[]): Base16 { return new Base16()};
function fooDDR16(p: Derived16, ...n: number[]): Derived16 { return p};
let foobb16 = fooBB16
let foobd16 = fooBD16
let foodb16 = fooDB16
let foodd16 = fooDD16
let foobbn16 = fooBBN16
let foobdn16 = fooBDN16
let foodbn16 = fooDBN16
let fooddn16 = fooDDN16
let foobbo16 = fooBBO16
let foobdo16 = fooBDO16
let foodbo16 = fooDBO16
let fooddo16 = fooDDO16
let foobbr16 = fooBBR16
let foobdr16 = fooBDR16
let foodbr16 = fooDBR16
let fooddr16 = fooDDR16
foodbr16 = foobdr16


class Base17 {
  b: string = 'b'
}
class Derived17 extends Base17 {
  b: string = 'd'
}
function fooBB17(p: Base17): Base17 {return p};
function fooBD17(p: Base17): Derived17 {return new Derived17()};
function fooDB17(p: Derived17): Base17 { return new Base17()};
function fooDD17(p: Derived17): Derived17 { return p};
function fooBBN17(p: Base17, n: number): Base17 {return p};
function fooBDN17(p: Base17, n: number): Derived17 {return new Derived17()};
function fooDBN17(p: Derived17, n: number): Base17 { return new Base17()};
function fooDDN17(p: Derived17, n: number): Derived17 { return p};
function fooBBO17(p: Base17, n?: number): Base17 {return p};
function fooBDO17(p: Base17, n?: number): Derived17 {return new Derived17()};
function fooDBO17(p: Derived17, n?: number): Base17 { return new Base17()};
function fooDDO17(p: Derived17, n?: number): Derived17 { return p};
function fooBBR17(p: Base17, ...n: number[]): Base17 {return p};
function fooBDR17(p: Base17, ...n: number[]): Derived17 {return new Derived17()};
function fooDBR17(p: Derived17, ...n: number[]): Base17 { return new Base17()};
function fooDDR17(p: Derived17, ...n: number[]): Derived17 { return p};
let foobb17 = fooBB17
let foobd17 = fooBD17
let foodb17 = fooDB17
let foodd17 = fooDD17
let foobbn17 = fooBBN17
let foobdn17 = fooBDN17
let foodbn17 = fooDBN17
let fooddn17 = fooDDN17
let foobbo17 = fooBBO17
let foobdo17 = fooBDO17
let foodbo17 = fooDBO17
let fooddo17 = fooDDO17
let foobbr17 = fooBBR17
let foobdr17 = fooBDR17
let foodbr17 = fooDBR17
let fooddr17 = fooDDR17
foodbn17 = foobbn17


class Base18 {
  b: string = 'b'
}
class Derived18 extends Base18 {
  b: string = 'd'
}
function fooBB18(p: Base18): Base18 {return p};
function fooBD18(p: Base18): Derived18 {return new Derived18()};
function fooDB18(p: Derived18): Base18 { return new Base18()};
function fooDD18(p: Derived18): Derived18 { return p};
function fooBBN18(p: Base18, n: number): Base18 {return p};
function fooBDN18(p: Base18, n: number): Derived18 {return new Derived18()};
function fooDBN18(p: Derived18, n: number): Base18 { return new Base18()};
function fooDDN18(p: Derived18, n: number): Derived18 { return p};
function fooBBO18(p: Base18, n?: number): Base18 {return p};
function fooBDO18(p: Base18, n?: number): Derived18 {return new Derived18()};
function fooDBO18(p: Derived18, n?: number): Base18 { return new Base18()};
function fooDDO18(p: Derived18, n?: number): Derived18 { return p};
function fooBBR18(p: Base18, ...n: number[]): Base18 {return p};
function fooBDR18(p: Base18, ...n: number[]): Derived18 {return new Derived18()};
function fooDBR18(p: Derived18, ...n: number[]): Base18 { return new Base18()};
function fooDDR18(p: Derived18, ...n: number[]): Derived18 { return p};
let foobb18 = fooBB18
let foobd18 = fooBD18
let foodb18 = fooDB18
let foodd18 = fooDD18
let foobbn18 = fooBBN18
let foobdn18 = fooBDN18
let foodbn18 = fooDBN18
let fooddn18 = fooDDN18
let foobbo18 = fooBBO18
let foobdo18 = fooBDO18
let foodbo18 = fooDBO18
let fooddo18 = fooDDO18
let foobbr18 = fooBBR18
let foobdr18 = fooBDR18
let foodbr18 = fooDBR18
let fooddr18 = fooDDR18
foodbo18 = foobbo18


class Base19 {
  b: string = 'b'
}
class Derived19 extends Base19 {
  b: string = 'd'
}
function fooBB19(p: Base19): Base19 {return p};
function fooBD19(p: Base19): Derived19 {return new Derived19()};
function fooDB19(p: Derived19): Base19 { return new Base19()};
function fooDD19(p: Derived19): Derived19 { return p};
function fooBBN19(p: Base19, n: number): Base19 {return p};
function fooBDN19(p: Base19, n: number): Derived19 {return new Derived19()};
function fooDBN19(p: Derived19, n: number): Base19 { return new Base19()};
function fooDDN19(p: Derived19, n: number): Derived19 { return p};
function fooBBO19(p: Base19, n?: number): Base19 {return p};
function fooBDO19(p: Base19, n?: number): Derived19 {return new Derived19()};
function fooDBO19(p: Derived19, n?: number): Base19 { return new Base19()};
function fooDDO19(p: Derived19, n?: number): Derived19 { return p};
function fooBBR19(p: Base19, ...n: number[]): Base19 {return p};
function fooBDR19(p: Base19, ...n: number[]): Derived19 {return new Derived19()};
function fooDBR19(p: Derived19, ...n: number[]): Base19 { return new Base19()};
function fooDDR19(p: Derived19, ...n: number[]): Derived19 { return p};
let foobb19 = fooBB19
let foobd19 = fooBD19
let foodb19 = fooDB19
let foodd19 = fooDD19
let foobbn19 = fooBBN19
let foobdn19 = fooBDN19
let foodbn19 = fooDBN19
let fooddn19 = fooDDN19
let foobbo19 = fooBBO19
let foobdo19 = fooBDO19
let foodbo19 = fooDBO19
let fooddo19 = fooDDO19
let foobbr19 = fooBBR19
let foobdr19 = fooBDR19
let foodbr19 = fooDBR19
let fooddr19 = fooDDR19
foodbr19 = foobbr19


class Base20 {}
class Derived20 extends Base20 {}
function fooBB20<T20>(p: T20): T20 {return p}
function fooBD20<T20, G20 extends T20>(p: T20): G20 {return p as G20}
function fooDB20<G20 extends T20, T20>(p: G20): T20 { return p as T20};
function fooDD20<G20 extends T20, T20>(p: G20): G20 { return p};
function fooBBN20<T20>(p: T20, n: number): T20 {return p};
function fooBDN20<T20, G20 extends T20>(p: T20, n: number): G20 {return p as G20};
function fooDBN20<G20 extends T20, T20>(p: G20, n: number): T20 { return p as T20};
function fooDDN20<G20 extends T20, T20>(p: G20, n: number): G20 { return p};
function fooBBO20<T20>(p: T20, n?: number): T20 {return p};
function fooBDO20<T20, G20 extends T20>(p: T20, n?: number): G20 {return p as G20};
function fooDBO20<G20 extends T20, T20>(p: G20, n?: number): T20 { return p as T20};
function fooDDO20<G20 extends T20, T20>(p: G20, n?: number): G20 { return p};
function fooBBR20<T20>(p: T20, ...n: number[]): T20 {return p};
function fooBDR20<T20, G20 extends T20>(p: T20, ...n: number[]): G20 {return p as G20};
function fooDBR20<G20 extends T20, T20>(p: G20, ...n: number[]): T20 { return p as T20};
function fooDDR20<G20 extends T20, T20>(p: G20, ...n: number[]): G20 { return p};
let foobb20 = fooBB20<Base20>
let foobd20 = fooBD20<Base20,Derived20>
let foodb20 = fooDB20<Derived20,Base20>
let foodd20 = fooDD20<Derived20,Derived20>
let foobbn20 = fooBBN20<Base20>
let foobdn20 = fooBDN20<Base20,Derived20>
let foodbn20 = fooDBN20<Derived20,Base20>
let fooddn20 = fooDDN20<Derived20,Derived20>
let foobbo20 = fooBBO20<Base20>
let foobdo20 = fooBDO20<Base20,Derived20>
let foodbo20 = fooDBO20<Derived20,Base20>
let fooddo20 = fooDDO20<Derived20,Derived20>
let foobbr20 = fooBBR20<Base20>
let foobdr20 = fooBDR20<Base20,Derived20>
let foodbr20 = fooDBR20<Derived20,Base20>
let fooddr20 = fooDDR20<Derived20,Derived20>
foobb20 = foobd20 // OK: identical parameter types, and covariant return type


class Base21 {}
class Derived21 extends Base21 {}
function fooBB21<T21>(p: T21): T21 {return p}
function fooBD21<T21, G21 extends T21>(p: T21): G21 {return p as G21}
function fooDB21<G21 extends T21, T21>(p: G21): T21 { return p as T21};
function fooDD21<G21 extends T21, T21>(p: G21): G21 { return p};
function fooBBN21<T21>(p: T21, n: number): T21 {return p};
function fooBDN21<T21, G21 extends T21>(p: T21, n: number): G21 {return p as G21};
function fooDBN21<G21 extends T21, T21>(p: G21, n: number): T21 { return p as T21};
function fooDDN21<G21 extends T21, T21>(p: G21, n: number): G21 { return p};
function fooBBO21<T21>(p: T21, n?: number): T21 {return p};
function fooBDO21<T21, G21 extends T21>(p: T21, n?: number): G21 {return p as G21};
function fooDBO21<G21 extends T21, T21>(p: G21, n?: number): T21 { return p as T21};
function fooDDO21<G21 extends T21, T21>(p: G21, n?: number): G21 { return p};
function fooBBR21<T21>(p: T21, ...n: number[]): T21 {return p};
function fooBDR21<T21, G21 extends T21>(p: T21, ...n: number[]): G21 {return p as G21};
function fooDBR21<G21 extends T21, T21>(p: G21, ...n: number[]): T21 { return p as T21};
function fooDDR21<G21 extends T21, T21>(p: G21, ...n: number[]): G21 { return p};
let foobb21 = fooBB21<Base21>
let foobd21 = fooBD21<Base21,Derived21>
let foodb21 = fooDB21<Derived21,Base21>
let foodd21 = fooDD21<Derived21,Derived21>
let foobbn21 = fooBBN21<Base21>
let foobdn21 = fooBDN21<Base21,Derived21>
let foodbn21 = fooDBN21<Derived21,Base21>
let fooddn21 = fooDDN21<Derived21,Derived21>
let foobbo21 = fooBBO21<Base21>
let foobdo21 = fooBDO21<Base21,Derived21>
let foodbo21 = fooDBO21<Derived21,Base21>
let fooddo21 = fooDDO21<Derived21,Derived21>
let foobbr21 = fooBBR21<Base21>
let foobdr21 = fooBDR21<Base21,Derived21>
let foodbr21 = fooDBR21<Derived21,Base21>
let fooddr21 = fooDDR21<Derived21,Derived21>
foodb21 = foobd21 // OK: identical parameter types, and covariant return type


class Base22 {}
class Derived22 extends Base22 {}
function fooBB22<T22>(p: T22): T22 {return p}
function fooBD22<T22, G22 extends T22>(p: T22): G22 {return p as G22}
function fooDB22<G22 extends T22, T22>(p: G22): T22 { return p as T22};
function fooDD22<G22 extends T22, T22>(p: G22): G22 { return p};
function fooBBN22<T22>(p: T22, n: number): T22 {return p};
function fooBDN22<T22, G22 extends T22>(p: T22, n: number): G22 {return p as G22};
function fooDBN22<G22 extends T22, T22>(p: G22, n: number): T22 { return p as T22};
function fooDDN22<G22 extends T22, T22>(p: G22, n: number): G22 { return p};
function fooBBO22<T22>(p: T22, n?: number): T22 {return p};
function fooBDO22<T22, G22 extends T22>(p: T22, n?: number): G22 {return p as G22};
function fooDBO22<G22 extends T22, T22>(p: G22, n?: number): T22 { return p as T22};
function fooDDO22<G22 extends T22, T22>(p: G22, n?: number): G22 { return p};
function fooBBR22<T22>(p: T22, ...n: number[]): T22 {return p};
function fooBDR22<T22, G22 extends T22>(p: T22, ...n: number[]): G22 {return p as G22};
function fooDBR22<G22 extends T22, T22>(p: G22, ...n: number[]): T22 { return p as T22};
function fooDDR22<G22 extends T22, T22>(p: G22, ...n: number[]): G22 { return p};
let foobb22 = fooBB22<Base22>
let foobd22 = fooBD22<Base22,Derived22>
let foodb22 = fooDB22<Derived22,Base22>
let foodd22 = fooDD22<Derived22,Derived22>
let foobbn22 = fooBBN22<Base22>
let foobdn22 = fooBDN22<Base22,Derived22>
let foodbn22 = fooDBN22<Derived22,Base22>
let fooddn22 = fooDDN22<Derived22,Derived22>
let foobbo22 = fooBBO22<Base22>
let foobdo22 = fooBDO22<Base22,Derived22>
let foodbo22 = fooDBO22<Derived22,Base22>
let fooddo22 = fooDDO22<Derived22,Derived22>
let foobbr22 = fooBBR22<Base22>
let foobdr22 = fooBDR22<Base22,Derived22>
let foodbr22 = fooDBR22<Derived22,Base22>
let fooddr22 = fooDDR22<Derived22,Derived22>
foodb22 = foodd22

export default function SubtypingForFunctionTypesTest(): void {
  describe('SubtypingForFunctionTypesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_0100
     * @tc.name      testPositiveFunction0001
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0001';

      expect(foobb1(new Base1) instanceof Derived1).assertTrue()
      expect(foobb1(new Base1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_0200
     * @tc.name      testPositiveFunction0002
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0002';

      let r = foodb2.unsafeCall(new Base2)
      expect(r instanceof Derived2).assertTrue()
      expect((r as Base2).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_0300
     * @tc.name      testPositiveFunction0003
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0003';

      expect(foodb3(new Derived3) instanceof Derived3).assertTrue()
      expect(foodb3(new Derived3).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_0400
     * @tc.name      testPositiveFunction0004
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0004';

      let r = foodd4.unsafeCall(new Base4)
      expect(r instanceof Derived4).assertTrue()
      expect((r as Base4).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_0500
     * @tc.name      testPositiveFunction0005
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0005';

      expect(foobbn5(new Base5, 1) instanceof Base5).assertTrue()
      expect(foobbn5(new Base5, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_0600
     * @tc.name      testPositiveFunction0006
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0006';

      expect(foobbo6(new Base6) instanceof Base6).assertTrue()
      expect(foobbo6(new Base6).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_0700
     * @tc.name      testPositiveFunction0007
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0007';

      expect(foobbn7(new Base7, 1) instanceof Derived7).assertTrue()
      expect(foobbn7(new Base7, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_0800
     * @tc.name      testPositiveFunction0008
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0008';

      expect(foobbo8(new Base8) instanceof Derived8).assertTrue()
      expect(foobbo8(new Base8).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_0900
     * @tc.name      testPositiveFunction0009
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0009';

      expect(foodbn9(new Derived9, 1) instanceof Derived9).assertTrue()
      expect(foodbn9(new Derived9, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1000
     * @tc.name      testPositiveFunction0010
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0010';

      expect(foodbo10(new Derived10) instanceof Derived10).assertTrue()
      expect(foodbo10(new Derived10).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1100
     * @tc.name      testPositiveFunction0011
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0011';

      expect(foodbn11(new Derived11, 1) instanceof Derived11).assertTrue()
      expect(foodbn11(new Derived11, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1200
     * @tc.name      testPositiveFunction0012
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0012';

      expect(foodbo12(new Derived12) instanceof Derived12).assertTrue()
      expect(foodbo12(new Derived12).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1300
     * @tc.name      testPositiveFunction0013
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0013';

      expect(foodbr13(new Derived13, 1, 2, 3) instanceof Derived13).assertTrue()
      expect(foodbr13(new Derived13, 1, 2, 3).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1400
     * @tc.name      testPositiveFunction0014
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0014';

      expect(foodbn14(new Derived14, 1) instanceof Derived14).assertTrue()
      expect(foodbn14(new Derived14, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1400
     * @tc.name      testPositiveFunction0014
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0014';

      expect(foodbn14(new Derived14, 1) instanceof Derived14).assertTrue()
      expect(foodbn14(new Derived14, 1).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1500
     * @tc.name      testPositiveFunction0015
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0015';

      expect(foodbo15(new Derived15) instanceof Derived15).assertTrue()
      expect(foodbo15(new Derived15).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1600
     * @tc.name      testPositiveFunction0016
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0016';

      expect(foodbr16(new Derived16, 1, 2, 3) instanceof Derived16).assertTrue()
      expect(foodbr16(new Derived16, 1, 2, 3).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1700
     * @tc.name      testPositiveFunction0017
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0017';

      let r = foodbn17.unsafeCall(new Base17, 1.0)

      expect(r instanceof Base17).assertTrue()
      expect((r as Base17).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1800
     * @tc.name      testPositiveFunction0018
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0018';

      let r = foodbo18.unsafeCall(new Base18)

      expect(r instanceof Base18).assertTrue()
      expect((r as Base18).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_1900
     * @tc.name      testPositiveFunction0019
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \\ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2014 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunction0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunction0019';

      let r = foodbr19.unsafeCall(new Base19, 1.0, 2.0, 3.0)
      expect(r instanceof Base19).assertTrue()
      expect((r as Base19).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_2000
     * @tc.name      testPositiveFunctionGeneric0020
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunctionGeneric0020';

      expect(foobb20(new Derived20) instanceof Base20).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_2100
     * @tc.name      testPositiveFunctionGeneric0021
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunctionGeneric0021';

      expect(foodb21(new Derived21) instanceof Derived21).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_2200
     * @tc.name      testPositiveFunctionGeneric0022
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance)."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveFunctionGeneric0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPositiveFunctionGeneric0022';

      expect(foodb22(new Derived22) instanceof Derived22).assertTrue()
    });

  })
}