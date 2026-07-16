'use static'
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

class Base {}
class Derived extends Base {}

function fooBB<T>(p: T): T {return p}
function fooBD<T, G extends T>(p: T): G {return p as G}
function fooDB<G extends T, T>(p: G): T { return p as T};
function fooDD<G extends T, T>(p: G): G { return p};
function fooBBN<T>(p: T, n: number): T {return p};
function fooBDN<T, G extends T>(p: T, n: number): G {return p as G};
function fooDBN<G extends T, T>(p: G, n: number): T { return p as T};
function fooDDN<G extends T, T>(p: G, n: number): G { return p};
function fooBBO<T>(p: T, n?: number): T {return p};
function fooBDO<T, G extends T>(p: T, n?: number): G {return p as G};
function fooDBO<G extends T, T>(p: G, n?: number): T { return p as T};
function fooDDO<G extends T, T>(p: G, n?: number): G { return p};
function fooBBR<T>(p: T, ...n: number[]): T {return p};
function fooBDR<T, G extends T>(p: T, ...n: number[]): G {return p as G};
function fooDBR<G extends T, T>(p: G, ...n: number[]): T { return p as T};
function fooDDR<G extends T, T>(p: G, ...n: number[]): G { return p};

let foobb23 = fooBB<Base>; let foobd23 = fooBD<Base,Derived>; let foodd23 = fooDD<Derived,Derived>
foodd23 = foobd23
let foobb24 = fooBB<Base>; let foobbn24 = fooBBN<Base>
foobbn24 = foobb24
let foobb25 = fooBB<Base>; let foobbo25 = fooBBO<Base>
foobbo25 = foobb25
let foobd26 = fooBD<Base,Derived>; let foobbn26 = fooBBN<Base>
foobbn26 = foobd26
let foobb27 = fooBB<Base>; let foobbo27 = fooBBO<Base>
foobbo27 = foobb27
let foobd28 = fooBD<Base,Derived>; let foodbn28 = fooDBN<Derived,Base>
foodbn28 = foobd28
let foobd29 = fooBD<Base,Derived>; let foodbo29 = fooDBO<Derived,Base>
foodbo29 = foobd29
let fooddn30 = fooDDN<Derived,Derived>; let foodbn30 = fooDBN<Derived,Base>
foodbn30 = fooddn30
let fooddo31 = fooDDO<Derived,Derived>; let foodbo31 = fooDBO<Derived,Base>
foodbo31 = fooddo31
let fooddr32 = fooDDR<Derived,Derived>; let foodbr32 = fooDBR<Derived,Base>
foodbr32 = fooddr32
let foobdn33 = fooBDN<Base,Derived>; let foodbn33 = fooDBN<Derived,Base>
foodbn33 = foobdn33
let foobdo34 = fooBDO<Base,Derived>; let foodbo34 = fooDBO<Derived,Base>
foodbo34 = foobdo34
let foobdr35 = fooBDR<Base,Derived>; let foodbr35 = fooDBR<Derived,Base>
foodbr35 = foobdr35
let foobbn36 = fooBBN<Base>; let foodbn36 = fooDBN<Derived,Base>
foodbn36 = foobbn36
let foobbo37 = fooBBO<Base>; let foodbo37 = fooDBO<Derived,Base>
foodbo37 = foobbo37
let foobbr38 = fooBBR<Base>; let foodbr38 = fooDBR<Derived,Base>

class BaseP { b: string = 'b' }
class DerivedP extends BaseP { b: string = 'd' }
class C {
  fooBB(p: BaseP): BaseP {return p}
  fooBD(p: BaseP): DerivedP {return new DerivedP()}
  fooDB(p: DerivedP): BaseP { return new BaseP()}
  fooDD(p: DerivedP): DerivedP { return p}
  fooBBN(p: BaseP, n: number): BaseP {return p}
  fooBDN(p: BaseP, n: number): DerivedP {return new DerivedP()}
  fooDBN(p: DerivedP, n: number): BaseP { return new BaseP()}
  fooDDN(p: DerivedP, n: number): DerivedP { return p}
  fooBBO(p: BaseP, n?: number): BaseP {return p}
  fooBDO(p: BaseP, n?: number): DerivedP {return new DerivedP()}
  fooDBO(p: DerivedP, n?: number): BaseP { return new BaseP()}
  fooDDO(p: DerivedP, n?: number): DerivedP { return p}
  fooBBR(p: BaseP, ...n: number[]): BaseP {return p}
  fooBDR(p: BaseP, ...n: number[]): DerivedP {return new DerivedP()}
  fooDBR(p: DerivedP, ...n: number[]): BaseP { return new BaseP()}
  fooDDR(p: DerivedP, ...n: number[]): DerivedP { return p}
}
const c: C = new C()

let foobb39 = c.fooBB; let foobd39 = c.fooBD
foobb39 = foobd39
let foobd40 = c.fooBD; let foodb40 = c.fooDB
foodb40 = foobd40
let foodb41 = c.fooDB; let foodd41 = c.fooDD
foodb41 = foodd41
let foobd42 = c.fooBD; let foodd42 = c.fooDD
foodd42 = foobd42
let foobb43 = c.fooBB; let foobbn43 = c.fooBBN
foobbn43 = foobb43
let foobb44 = c.fooBB; let foobbo44 = c.fooBBO
foobbo44 = foobb44

export default function SubtypingForFunctionTypesTest01(): void {
  describe('SubtypingForFunctionTypesTest01', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0100
     * @tc.name testPositiveFunctionGeneric0023
     * @tc.desc "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *           \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *           \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *           \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *           \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *           \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *           \ is a subtype of SR (covariance)."
     */
    it("testPositiveFunctionGeneric0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foodd23(new Derived) instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0200
     * @tc.name      testPositiveFunctionGeneric0024
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
    it("testPositiveFunctionGeneric0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foobbn24(new Base, 1) instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0300
     * @tc.name      testPositiveFunctionGeneric0025
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
    it("testPositiveFunctionGeneric0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foobbo25(new Base) instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0400
     * @tc.name      testPositiveFunctionGeneric0026
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
    it("testPositiveFunctionGeneric0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foobbn26(new Derived, 1) instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0500
     * @tc.name      testPositiveFunctionGeneric0027
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
    it("testPositiveFunctionGeneric0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foobbo27(new Derived) instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0600
     * @tc.name      testPositiveFunctionGeneric0028
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
    it("testPositiveFunctionGeneric0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foodbn28(new Derived, 1) instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0700
     * @tc.name      testPositiveFunctionGeneric0029
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
    it("testPositiveFunctionGeneric0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foodbo29(new Derived) instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0800
     * @tc.name      testPositiveFunctionGeneric0030
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
    it("testPositiveFunctionGeneric0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foodbn30(new Derived, 1) instanceof Derived).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_0900
     * @tc.name      testPositiveFunctionGeneric0031
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
    it("testPositiveFunctionGeneric0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foodbo31(new Derived) instanceof Derived).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1000
     * @tc.name      testPositiveFunctionGeneric0032
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
    it("testPositiveFunctionGeneric0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foodbr32(new Derived, 1, 2, 3) instanceof Derived).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1100
     * @tc.name      testPositiveFunctionGeneric0033
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
    it("testPositiveFunctionGeneric0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foodbn33(new Derived, 1) instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1200
     * @tc.name      testPositiveFunctionGeneric0034
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
    it("testPositiveFunctionGeneric0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foodbo34(new Derived) instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1300
     * @tc.name      testPositiveFunctionGeneric0035
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
    it("testPositiveFunctionGeneric0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foodbr35(new Derived, 1, 2, 3) instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_TEST_1400
     * @tc.name      testPositiveFunctionGeneric0036
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
    it("testPositiveFunctionGeneric0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = foodbn36.unsafeCall(new Base, 1.0)
      expect(r instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1500
     * @tc.name      testPositiveFunctionGeneric0037
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
    it("testPositiveFunctionGeneric0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = foodbo37.unsafeCall(new Base)
      expect(r instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1600
     * @tc.name      testPositiveFunctionGeneric0038
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
    it("testPositiveFunctionGeneric0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      foodbr38 = foobbr38;
      let r = foodbr38.unsafeCall(new Derived, 1.0, 2.0, 3.0);
      expect(r instanceof Base).assertTrue();
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1700
     * @tc.name      testPositiveInstanceMethod0039
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foobb39(new BaseP) instanceof DerivedP).assertTrue()
      expect(foobb39(new BaseP).b).assertEqual('d')
    })

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1800
     * @tc.name      testPositiveInstanceMethod0040
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = foodb40.unsafeCall(new BaseP)
      expect(r instanceof DerivedP).assertTrue()
      expect((r as BaseP).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_1900
     * @tc.name      testPositiveInstanceMethod0041
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foodb41(new DerivedP) instanceof DerivedP).assertTrue()
      expect(foodb41(new DerivedP).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_2000
     * @tc.name      testPositiveInstanceMethod0042
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = foodd42.unsafeCall(new BaseP)
      expect(r instanceof DerivedP).assertTrue()
      expect((r as BaseP).b).assertEqual('d')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_2100
     * @tc.name      testPositiveInstanceMethod0043
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foobbn43(new BaseP, 1) instanceof BaseP).assertTrue()
      expect(foobbn43(new BaseP, 1).b).assertEqual('b')
    });

    /**
     * @tc.number    SUB_SUBTYPING_FOR_FUNCTION_TYPES_ONE_2200
     * @tc.name      testPositiveInstanceMethod0044
     * @tc.desc      "Function type F with parameters FP1, ... , FPm and return type FR is a subtype\
     *               \ of function type S with parameters SP1 , ... , SPn and return type SR if all of\
     *               \ the following conditions are met: \u2022 m <= n \u2022 for each i <= m\n    -\
     *               \ Parameter type of SPi is a subtype of parameter type of FPi (contravariance),\
     *               \ and\n    \u2013 FPi is a rest parameter if SPi is a rest parameter.\n    \u2013\
     *               \ FPi is an optional parameter if SPi is an optional parameter.\n\u2022 Type FR\
     *               \ is a subtype of SR (covariance).""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveInstanceMethod0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foobbo44(new BaseP) instanceof BaseP).assertTrue()
      expect(foobbo44(new BaseP).b).assertEqual('b')
    });
  })
}
