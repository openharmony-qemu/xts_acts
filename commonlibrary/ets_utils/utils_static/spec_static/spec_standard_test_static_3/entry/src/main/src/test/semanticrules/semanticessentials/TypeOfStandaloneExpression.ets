import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

let v1 = true
const c1 = true

let v2 = false
const c2 = false

let v3 = 0
const c3 = 0

let v4 = 1
const c4 = 1

let v5 = 2_147_483_647
const c5 = 2_147_483_647

let v6 = 0x00000000
const c6 = 0x00000000

let v7 = 0xffffffff
const c7 = 0xffffffff

let v8 = 0X00_00_00_00_ca_fe_CA_FE
const c8 = 0X00_00_00_00_ca_fe_CA_FE

let v9 = 0o00000000000
const c9 = 0o00000000000

let v10 = 0O37777777777
const c10 = 0O37777777777

let v11 = 0o000_000_012_345_671_234
const c11 = 0o000_000_012_345_671_234

let v12 = 0B00000000000000000000000000000000
const c12 = 0B00000000000000000000000000000000

let v13 = 0b00000_00000000_00000000_1010101_01010101_01010101_01010101_01010101_01010101_01010101_01010101
const c13 = 0b00000_00000000_00000000_1010101_01010101_01010101_01010101_01010101_01010101_01010101_01010101

let v14 = 3.14
const c14 = 3.14

let v15 = .5
const c15 = .5

let v16 = 1e10
const c16 = 1e10

let v17 = 1E10
const c17 = 1E10

let v18 = 0.0
const c18 = 0.0

let v19 = 0.
const c19 = 0.

let v20 = .0
const c20 = .0

let v21 = 0.e1
const c21 = 0.e1

let v22 = 0.0E1
const c22 = 0.0E1

let v23 = 0.0e+1
const c23 = 0.0e+1

let v24 = 0.0E-1
const c24 = 0.0E-1

let v25 = .0e0
const c25 = .0e0

let v26 = .0e+1
const c26 = .0e+1

let v27 = .0E-1
const c27 = .0E-1

let v28 = .0e1
const c28 = .0e1

let v29 = .0E0
const c29 = .0E0

let v30 = 0n
const c30 = 0n

let v31 = 153n
const c31 = 153n

let v32 = 1_153n
const c32 = 1_153n

let v33 = -153n
const c33 = -153n

let v34 = ""
const c34 = ""

let v35 = "string"
const c35 = "string"

let v36 = "42"
const c36 = "42"

let v37 = "\u0027"
const c37 = "\u0027"

let v38 = new Number(42)
const c38 = new Number(42)

let v39 = new Number(1)
const c39 = new Number(1)

let v40 = new RegExp("abc")
const c40 = new RegExp("abc")

let v41 = new Object()
const c41 = new Object()

let v42 = [-1, 3.0]
const c42 = [-1, 3.0]

let v43 = ["ok", -8]
const c43 = ["ok", -8]

let v44 = [[2, 6], [7, 4]]
const c44 = [[2, 6], [7, 4]]

let v45 = [["a", 1], ["b",2]]
const c45 = [["a", 1], ["b",2]]

let v46 = null
const c46 = null

let v47 = undefined
const c47 = undefined

let v48 = ():void => {}
const c48 = ():void => {}

let v49 = (p?: number):void => {}
const c49 = (p?: number):void => {}

let v50 = 3 < 5
const c50 = 3 < 5

let v51 = 2 * (3.14 + 42)
const c51 = 2 * (3.14 + 42)

let lorem = `lorem
    ipsum dolor
    sit amet
    `
const ipsum = lorem

function main() {
  true;
  false;
  0;
  1;
  2_147_483_647;
  0x00000000;
  0xffffffff;
  0X00_00_00_00_ca_fe_CA_FE;
  0o00000000000;
  0O37777777777;
  0o000_000_012_345_671_234;
  0B00000000000000000000000000000000;
  0b00000_00000000_00000000_1010101_01010101_01010101_01010101_01010101_01010101_01010101_01010101;
  3.14;
  .5;
  1e10;
  1E10;
  0.0;
  0.;
  .0;
  0.e1;
  0.0E1;
  0.0e+1;
  0.0E-1;
  .0e0;
  .0e+1;
  .0E-1;
  .0e1;
  .0E0;
  0n;
  153n;
  1_153n;
  -153n;
  "";
  "string";
  "42";
  "\u0027";
  new Number(42);
  new Number(1);
  new RegExp("abc");
  new Object();
  [-1, 3.0];
  ["ok", -8];
  [[2, 6], [7, 4]];
  [["a", 1], ["b",2]];
  null;
  undefined;
  ():void => {};
  (p?: number):void => {};
  3 < 5;
  2 * (3.14 + 42);

  42; "foo"
  3.14;
  null; undefined

  `consectetur adipiscing elit,
    sed do eiusmo`
}

let ab : "A" | "B" = "A"

let v1Union = ab
const c1Union = ab

let v2Union = "B" + ab
const c2Union = "B" + ab

let v3Union = [ab]
const c3Union = [ab]

let v4Union = [(): void => {}, ab]
const c4Union = [(): void => {}, ab]

function mainUnion() {
  ab;
  "B" + ab;
  [ab];
  [(): void => {}, ab];
}

export default function TypeOfStandaloneExpression(): void{
  describe('TypeOfStandaloneExpression', () => {
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
     * @tc.number    SUB_BASEDATE_STANDALONE_EXPRESSION_TEST_0100
     * @tc.name      testStandaloneExpressionPositiveCases0001
     * @tc.desc      Standalone expression (see Type of Expression)
     * is an expression for which no target type is expected in its context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStandaloneExpressionPositiveCases0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      main();
      expect(v1).assertTrue();

    });

    /**
     * @tc.number    SUB_BASEDATE_STANDALONE_EXPRESSION_TEST_0200
     * @tc.name      testStandaloneExpressionUnionTypes0002
     * @tc.desc      Standalone expression (see Type of Expression)
     * is an expression for which no target type is expected in its context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStandaloneExpressionUnionTypes0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      mainUnion();
      expect(ab).assertEqual("A");
    });
  });
}