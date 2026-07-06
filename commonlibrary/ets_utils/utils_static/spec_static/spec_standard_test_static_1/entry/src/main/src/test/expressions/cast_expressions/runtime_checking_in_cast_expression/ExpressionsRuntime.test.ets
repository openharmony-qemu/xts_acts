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

import Utils from "../../../Util.test";

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
} from "../../../../../../hypium";

interface I1 {}
interface J1 {}
interface K1 {}
class A1 implements I1 {}
class B1 extends A1 implements J1 {}

export default function ExpressionsRuntimeTest(): void {
  describe("ExpressionsRuntimeTest", () => {
    beforeAll(() => {})
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_0100..0500
     * @tc.name      testCastFromA1newA1
     * @tc.desc      as-cast from static type A1 with runtime A1 to A1/B1/I1/J1/K1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastFromA1newA1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1 = new A1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
      let errorCaught = false;
      try {
        let y: B1 = v as B1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
      let z: I1 = v as I1;
      expect(z instanceof I1).assertTrue();
      errorCaught = false;
      try {
        let w: J1 = v as J1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
      errorCaught = false;
      try {
        let u: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_0600..1000
     * @tc.name      testCastFromObjectNewA1
     * @tc.desc      as-cast from static type Object with runtime A1 to A1/B1/I1/J1/K1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastFromObjectNewA1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new A1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
      let errorCaught = false;
      try {
        let y: B1 = v as B1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
      let z: I1 = v as I1;
      expect(z instanceof I1).assertTrue();
      errorCaught = false;
      try {
        let w: J1 = v as J1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
      errorCaught = false;
      try {
        let u: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_1100..1500
     * @tc.name      testCastFromI1NewA1
     * @tc.desc      as-cast from static type I1 with runtime A1 to A1/B1/I1/J1/K1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastFromI1NewA1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I1 = new A1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
      let errorCaught = false;
      try {
        let y: B1 = v as B1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
      let z: I1 = v as I1;
      expect(z instanceof I1).assertTrue();
      errorCaught = false;
      try {
        let w: J1 = v as J1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
      errorCaught = false;
      try {
        let u: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_1600..2000
     * @tc.name      testCastFromB1NewB1
     * @tc.desc      as-cast from static type B1 with runtime B1 to A1/B1/I1/J1/K1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastFromB1NewB1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: B1 = new B1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
      let y: B1 = v as B1;
      expect(y instanceof B1).assertTrue();
      let z: I1 = v as I1;
      expect(z instanceof I1).assertTrue();
      let w: J1 = v as J1;
      expect(w instanceof J1).assertTrue();
      let errorCaught = false;
      try {
        let u: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_2100..2500
     * @tc.name      testCastFromA1NewB1
     * @tc.desc      as-cast from static type A1 with runtime B1 to A1/B1/I1/J1/K1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastFromA1NewB1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1 = new B1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
      let y: B1 = v as B1;
      expect(y instanceof B1).assertTrue();
      let z: I1 = v as I1;
      expect(z instanceof I1).assertTrue();
      let w: J1 = v as J1;
      expect(w instanceof J1).assertTrue();
      let errorCaught = false;
      try {
        let u: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_2600..3000
     * @tc.name      testCastFromI1NewB1
     * @tc.desc      as-cast from static type I1 with runtime B1 to A1/B1/I1/J1/K1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastFromI1NewB1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I1 = new B1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
      let y: B1 = v as B1;
      expect(y instanceof B1).assertTrue();
      let z: I1 = v as I1;
      expect(z instanceof I1).assertTrue();
      let w: J1 = v as J1;
      expect(w instanceof J1).assertTrue();
      let errorCaught = false;
      try {
        let u: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_3100..3500
     * @tc.name      testCastFromJ1NewB1
     * @tc.desc      as-cast from static type J1 with runtime B1 to A1/B1/I1/J1/K1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastFromJ1NewB1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: J1 = new B1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
      let y: B1 = v as B1;
      expect(y instanceof B1).assertTrue();
      let z: I1 = v as I1;
      expect(z instanceof I1).assertTrue();
      let w: J1 = v as J1;
      expect(w instanceof J1).assertTrue();
      let errorCaught = false;
      try {
        let u: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });
  });
}
