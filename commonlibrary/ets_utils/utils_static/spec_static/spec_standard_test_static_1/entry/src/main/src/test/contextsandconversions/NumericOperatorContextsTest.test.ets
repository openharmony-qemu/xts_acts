/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';

enum IntEnum {One = 1, Two, Three}

enum IntEnum2 {One, Two, Three}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function NumericOperatorContextsTest() {
  describe("NumericOperatorContextsTest", () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0100
     * @tc.name      testNumericOperatorContexts0001
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Byte = new Byte(127 as byte);
      let arr: Byte[] = new Byte[127 + 1];
      arr[v.toInt()] = v;
      expect(v.toInt()).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0200
     * @tc.name      testNumericOperatorContexts0002
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with short type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Short = new Short(0x1ff);
      let arr: Short[] = new Short[511 + 1];
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(511);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0300
     * @tc.name      testNumericOperatorContexts0003
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with Byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Int = new Int(129);
      let arr: Int[] = new Int[129 + 1];
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(129);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0400
     * @tc.name      testNumericOperatorContexts0004
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with Short type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Short = new Short(0x1ff);
      let arr: Short[] = new Short[511 + 1];
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(511);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0500
     * @tc.name      testNumericOperatorContexts0005
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with Int type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Int = new Int(129);
      let arr: Int[] = new Int[129 + 1];
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(129);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0600
     * @tc.name      testNumericOperatorContexts0006
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with float type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: float = 10.0f;
      let arr: float[] = new float[10 + 1];
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(10);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0700
     * @tc.name      testNumericOperatorContexts0007
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with double type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: double = 20.0;
      let arr: double[] = new double[20 + 1];
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(20);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0800
     * @tc.name      testNumericOperatorContexts0008
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with Float type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Float = new Float(1.0f);
      let arr: Float[] = new Float[1 + 1];
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0900
     * @tc.name      testNumericOperatorContexts0009
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with Double type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Double = new Double(2.0);
      let arr: Double[] = new Double[2 + 1];
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(2);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1000
     * @tc.name      testNumericOperatorContexts0010
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 1e-23;
      let v2: double = 1e-23;
      expect(v1 - v2).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1100
     * @tc.name      testNumericOperatorContexts0011
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: byte = 1;
      let v2: short = 1;
      expect(v1 * v2).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1200
     * @tc.name      testNumericOperatorContexts0012
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with short and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: short = 100;
      let v2: double = 100.0;
      expect(v1 + v2).assertEqual(200.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1300
     * @tc.name      testNumericOperatorContexts0013
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with double and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 100.0;
      let v2: long = 2;
      expect(v1 / v2).assertEqual(50.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1400
     * @tc.name      testNumericOperatorContexts0014
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with IntEnum and IntEnum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: IntEnum = IntEnum.One;
      let v2: IntEnum = IntEnum.Two;
      expect(v1 + v2).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1500
     * @tc.name      testNumericOperatorContexts0015
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with IntEnum and IntEnum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: IntEnum = IntEnum.One;
      let v2: IntEnum = IntEnum.Three;
      expect(v1 * v2).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1600
     * @tc.name      testNumericOperatorContexts0016
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with IntEnum and IntEnum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: IntEnum = IntEnum.Two;
      let v2: IntEnum = IntEnum.One;
      expect(v1 / v2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1700
     * @tc.name      testNumericOperatorContexts0017
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with IntEnum and IntEnum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: IntEnum2 = IntEnum2.Two;
      let v2: IntEnum2 = IntEnum2.One;
      expect(v1 > v2).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1800
     * @tc.name      testNumericOperatorContexts0018
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x > new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) > x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1900
     * @tc.name      testNumericOperatorContexts0019
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x >= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) >= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2000
     * @tc.name      testNumericOperatorContexts0020
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x < new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) < x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2100
     * @tc.name      testNumericOperatorContexts0021
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x <= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) <= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2200
     * @tc.name      testNumericOperatorContexts0022
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x == new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) == x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2300
     * @tc.name      testNumericOperatorContexts0023
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x === new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) === x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2400
     * @tc.name      testNumericOperatorContexts0024
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x <= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) <= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2500
     * @tc.name      testNumericOperatorContexts0025
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x != new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) != x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2600
     * @tc.name      testNumericOperatorContexts0026
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x !== new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) !== x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2700
     * @tc.name      testNumericOperatorContexts0027
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x > new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) > x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2800
     * @tc.name      testNumericOperatorContexts0028
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x >= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) >= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2900
     * @tc.name      testNumericOperatorContexts0029
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x < new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) < x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3000
     * @tc.name      testNumericOperatorContexts0030
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x <= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) <= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3100
     * @tc.name      testNumericOperatorContexts0031
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x == new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) == x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3200
     * @tc.name      testNumericOperatorContexts0032
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x === new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) === x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3300
     * @tc.name      testNumericOperatorContexts0033
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x != new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) != x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3400
     * @tc.name      testNumericOperatorContexts0034
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x !== new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) !== x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3500
     * @tc.name      testNumericOperatorContexts0035
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x == new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) == x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3600
     * @tc.name      testNumericOperatorContexts0036
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x === new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) === x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3700
     * @tc.name      testNumericOperatorContexts0037
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x != new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) != x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3800
     * @tc.name      testNumericOperatorContexts0038
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x !== new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) !== x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3900
     * @tc.name      testNumericOperatorContexts0039
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x > new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) > x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4000
     * @tc.name      testNumericOperatorContexts0040
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x >= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) >= x).assertEqual(true);
    });

    // ----------------- conversions_byte 系列 -----------------
    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4100
     * @tc.name      testNumericOperatorContexts0041
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4200
     * @tc.name      testNumericOperatorContexts0042
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4300
     * @tc.name      testNumericOperatorContexts0043
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4400
     * @tc.name      testNumericOperatorContexts0044
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4500
     * @tc.name      testNumericOperatorContexts0045
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4600
     * @tc.name      testNumericOperatorContexts0046
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4700
     * @tc.name      testNumericOperatorContexts0047
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4800
     * @tc.name      testNumericOperatorContexts0048
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4900
     * @tc.name      testNumericOperatorContexts0049
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5000
     * @tc.name      testNumericOperatorContexts0050
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5100
     * @tc.name      testNumericOperatorContexts0051
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5200
     * @tc.name      testNumericOperatorContexts0052
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5300
     * @tc.name      testNumericOperatorContexts0053
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5400
     * @tc.name      testNumericOperatorContexts0054
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5500
     * @tc.name      testNumericOperatorContexts0055
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5600
     * @tc.name      testNumericOperatorContexts0056
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5700
     * @tc.name      testNumericOperatorContexts0057
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5800
     * @tc.name      testNumericOperatorContexts0058
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5900
     * @tc.name      testNumericOperatorContexts0059
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6000
     * @tc.name      testNumericOperatorContexts0060
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6100
     * @tc.name      testNumericOperatorContexts0061
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6200
     * @tc.name      testNumericOperatorContexts0062
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6300
     * @tc.name      testNumericOperatorContexts0063
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6400
     * @tc.name      testNumericOperatorContexts0064
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6500
     * @tc.name      testNumericOperatorContexts0065
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6600
     * @tc.name      testNumericOperatorContexts0066
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6700
     * @tc.name      testNumericOperatorContexts0067
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6800
     * @tc.name      testNumericOperatorContexts0068
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x > new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) > x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6900
     * @tc.name      testNumericOperatorContexts0069
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x >= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) >= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7000
     * @tc.name      testNumericOperatorContexts0070
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x < new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) < x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7100
     * @tc.name      testNumericOperatorContexts0071
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x <= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) <= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7200
     * @tc.name      testNumericOperatorContexts0072
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x == new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) == x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7300
     * @tc.name      testNumericOperatorContexts0073
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x === new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) === x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7400
     * @tc.name      testNumericOperatorContexts0074
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x != new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) != x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7500
     * @tc.name      testNumericOperatorContexts0075
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x !== new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) !== x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7600
     * @tc.name      testNumericOperatorContexts0076
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x > new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) > x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7700
     * @tc.name      testNumericOperatorContexts0077
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x >= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) >= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7800
     * @tc.name      testNumericOperatorContexts0078
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x < new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) < x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7900
     * @tc.name      testNumericOperatorContexts0079
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x <= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) <= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8000
     * @tc.name      testNumericOperatorContexts0080
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x < new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) < x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8100
     * @tc.name      testNumericOperatorContexts0081
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x == new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) == x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8200
     * @tc.name      testNumericOperatorContexts0082
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x === new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) === x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8300
     * @tc.name      testNumericOperatorContexts0083
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x != new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) != x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8400
     * @tc.name      testNumericOperatorContexts0084
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x !== new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) !== x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8500
     * @tc.name      testNumericOperatorContexts0085
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8600
     * @tc.name      testNumericOperatorContexts0086
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8700
     * @tc.name      testNumericOperatorContexts0087
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8800
     * @tc.name      testNumericOperatorContexts0088
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8900
     * @tc.name      testNumericOperatorContexts0089
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9000
     * @tc.name      testNumericOperatorContexts0090
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9100
     * @tc.name      testNumericOperatorContexts0091
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9200
     * @tc.name      testNumericOperatorContexts0092
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9300
     * @tc.name      testNumericOperatorContexts0093
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9400
     * @tc.name      testNumericOperatorContexts0094
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9500
     * @tc.name      testNumericOperatorContexts0095
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9600
     * @tc.name      testNumericOperatorContexts0096
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9700
     * @tc.name      testNumericOperatorContexts0097
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9800
     * @tc.name      testNumericOperatorContexts0098
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9900
     * @tc.name      testNumericOperatorContexts0099
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10000
     * @tc.name      testNumericOperatorContexts0100
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10100
     * @tc.name      testNumericOperatorContexts0101
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10200
     * @tc.name      testNumericOperatorContexts0102
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10300
     * @tc.name      testNumericOperatorContexts0103
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10400
     * @tc.name      testNumericOperatorContexts0104
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    // ----------------- conversions_double 系列 (共8个用例) -----------------
    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10500
     * @tc.name      testNumericOperatorContexts0105
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10600
     * @tc.name      testNumericOperatorContexts0106
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10700
     * @tc.name      testNumericOperatorContexts0107
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10800
     * @tc.name      testNumericOperatorContexts0108
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10900
     * @tc.name      testNumericOperatorContexts0109
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11000
     * @tc.name      testNumericOperatorContexts0110
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11100
     * @tc.name      testNumericOperatorContexts0111
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11200
     * @tc.name      testNumericOperatorContexts0112
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    // ----------------- conversions_float 系列 (共16个用例) -----------------
    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11300
     * @tc.name      testNumericOperatorContexts0113
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11400
     * @tc.name      testNumericOperatorContexts0114
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11500
     * @tc.name      testNumericOperatorContexts0115
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11600
     * @tc.name      testNumericOperatorContexts0116
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11700
     * @tc.name      testNumericOperatorContexts0117
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11800
     * @tc.name      testNumericOperatorContexts0118
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11900
     * @tc.name      testNumericOperatorContexts0119
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

  });
}