'use static';
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
let foobb1 = fooBB1
let foobd1 = fooBD1
foobb1 = foobd1

class Base2 {
  b: string = 'b'
}
class Derived2 extends Base2 {
  b: string = 'd'
}
function fooBD2(p: Base2): Derived2 {return new Derived2()};
function fooDB2(p: Derived2): Base2 { return new Base2()};
let foobd2 = fooBD2
let foodb2 = fooDB2
foodb2 = foobd2

class Base3 {
  b: string = 'b'
}
class Derived3 extends Base3 {
  b: string = 'd'
}
function fooDB3(p: Derived3): Base3 { return new Base3()};
function fooDD3(p: Derived3): Derived3 { return p};
let foodb3 = fooDB3
let foodd3 = fooDD3
foodb3 = foodd3

class Base4 {
  b: string = 'b'
}
class Derived4 extends Base4 {
  b: string = 'd'
}
function fooBD4(p: Base4): Derived4 {return new Derived4()};
function fooDD4(p: Derived4): Derived4 { return p};
let foobd4 = fooBD4
let foodd4 = fooDD4
foodd4 = foobd4

class Base5 {
  b: string = 'b'
}
class Derived5 extends Base5 {
  b: string = 'd'
}
function fooBBN5(p: Base5, n: number): Base5 {return p};
function fooBDN5(p: Base5, n: number): Derived5 {return new Derived5()};
let foobbn5 = fooBBN5
let foobdn5 = fooBDN5
foobbn5 = foobdn5

class Base6 {
  b: string = 'b'
}
class Derived6 extends Base6 {
  b: string = 'd'
}
function fooBBO6(p: Base6, n?: number): Base6 {return p};
function fooBDO6(p: Base6, n?: number): Derived6 {return new Derived6()};
let foobbo6 = fooBBO6
let foobdo6 = fooBDO6
foobbo6 = foobdo6

class Base7 {
  b: string = 'b'
}
class Derived7 extends Base7 {
  b: string = 'd'
}
function fooBD7(p: Base7): Derived7 {return new Derived7()};
function fooBBN7(p: Base7, n: number): Base7 {return p};
let foobd7 = fooBD7
let foobbn7 = fooBBN7
foobbn7 = foobd7

class Base8 {
  b: string = 'b'
}
class Derived8 extends Base8 {
  b: string = 'd'
}
function fooBD8(p: Base8): Derived8 {return new Derived8()};
function fooBBO8(p: Base8, n?: number): Base8 {return p};
let foobd8 = fooBD8
let foobbo8 = fooBBO8
foobbo8 = foobd8

class Base9 {
  b: string = 'b'
}
class Derived9 extends Base9 {
  b: string = 'd'
}
function fooBD9(p: Base9): Derived9 {return new Derived9()};
function fooDBN9(p: Derived9, n: number): Base9 { return new Base9()};
let foobd9 = fooBD9
let foodbn9 = fooDBN9
foodbn9 = foobd9

class Base10 {
  b: string = 'b'
}
class Derived10 extends Base10 {
  b: string = 'd'
}
function fooBD10(p: Base10): Derived10 {return new Derived10()};
function fooDBO10(p: Derived10, n?: number): Base10 { return new Base10()};
let foobd10 = fooBD10
let foodbo10 = fooDBO10
foodbo10 = foobd10

class Base11 {
  b: string = 'b'
}
class Derived11 extends Base11 {
  b: string = 'd'
}
function fooDBN11(p: Derived11, n: number): Base11 { return new Base11()};
function fooDDN11(p: Derived11, n: number): Derived11 { return p};
let foodbn11 = fooDBN11
let fooddn11 = fooDDN11
foodbn11 = fooddn11

class Base12 {
  b: string = 'b'
}
class Derived12 extends Base12 {
  b: string = 'd'
}
function fooDBO12(p: Derived12, n?: number): Base12 { return new Base12()};
function fooDDO12(p: Derived12, n?: number): Derived12 { return p};
let foodbo12 = fooDBO12
let fooddo12 = fooDDO12
foodbo12 = fooddo12

class Base13 {
  b: string = 'b'
}
class Derived13 extends Base13 {
  b: string = 'd'
}
function fooDBR13(p: Derived13, ...n: number[]): Base13 { return new Base13()};
function fooDDR13(p: Derived13, ...n: number[]): Derived13 { return p};
let foodbr13 = fooDBR13
let fooddr13 = fooDDR13
foodbr13 = fooddr13

class Base14 {
  b: string = 'b'
}
class Derived14 extends Base14 {
  b: string = 'd'
}
function fooBDN14(p: Base14, n: number): Derived14 {return new Derived14()};
function fooDBN14(p: Derived14, n: number): Base14 { return new Base14()};
let foobdn14 = fooBDN14
let foodbn14 = fooDBN14
foodbn14 = foobdn14

class Base15 {
  b: string = 'b'
}
class Derived15 extends Base15 {
  b: string = 'd'
}
function fooBDO15(p: Base15, n?: number): Derived15 {return new Derived15()};
function fooDBO15(p: Derived15, n?: number): Base15 { return new Base15()};
let foobdo15 = fooBDO15
let foodbo15 = fooDBO15
foodbo15 = foobdo15

class Base16 {
  b: string = 'b'
}
class Derived16 extends Base16 {
  b: string = 'd'
}
function fooBDR16(p: Base16, ...n: number[]): Derived16 {return new Derived16()};
function fooDBR16(p: Derived16, ...n: number[]): Base16 { return new Base16()};
let foobdr16 = fooBDR16
let foodbr16 = fooDBR16
foodbr16 = foobdr16

export default function SubtypingForFunctionTypesTest(): void {
  describe('SubtypingForFunctionTypesTest', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
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

      expect(foodbr16(new Derived16, 1, 2, 3) instanceof Derived16).assertTrue()
      expect(foodbr16(new Derived16, 1, 2, 3).b).assertEqual('d')
    });

  })
}
