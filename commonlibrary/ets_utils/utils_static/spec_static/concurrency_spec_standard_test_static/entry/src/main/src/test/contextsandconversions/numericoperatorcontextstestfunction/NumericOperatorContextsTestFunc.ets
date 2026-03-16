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

enum IntEnum {One = 1, Two, Three}

enum IntEnum2 {One, Two, Three}

export function testNumericOperatorContexts0001() {
  const TAG = 'testNumericOperatorContexts0001';
  let v: Byte = new Byte(127 as byte);
  let arr: Byte[] = new Byte[127 + 1];
  arr[v.toInt()] = v;
  if (v.toInt() !== 127) {
    console.info(`${TAG} Task execution failed: v.toInt(): ${v.toInt()}`);
    throw new Error('v.toInt() check failed, expected 127');
  }
}

export function testNumericOperatorContexts0002() {
  const TAG = 'testNumericOperatorContexts0002';
  let v: Short = new Short(0x1ff);
  let arr: Short[] = new Short[511 + 1];
  arr[v.toInt()] = v;
  if (arr[v.toInt()] !== 511) {
    console.info(`${TAG} Task execution failed: arr[v.toInt()]: ${arr[v.toInt()]}`);
    throw new Error('arr[v.toInt()] check failed, expected 511');
  }
}

export function testNumericOperatorContexts0003() {
  const TAG = 'testNumericOperatorContexts0003';
  let v: Int = new Int(129);
  let arr: Int[] = new Int[129 + 1];
  arr[v.toInt()] = v;
  if (arr[v.toInt()] !== 129) {
    console.info(`${TAG} Task execution failed: arr[v.toInt()]: ${arr[v.toInt()]}`);
    throw new Error('arr[v.toInt()] check failed, expected 129');
  }
}

export function testNumericOperatorContexts0004() {
  const TAG = 'testNumericOperatorContexts0004';
  let v: Short = new Short(0x1ff);
  let arr: Short[] = new Short[511 + 1];
  arr[v.toInt()] = v;
  if (arr[v.toInt()] !== 511) {
    console.info(`${TAG} Task execution failed: arr[v.toInt()]: ${arr[v.toInt()]}`);
    throw new Error('arr[v.toInt()] check failed, expected 511');
  }
}

export function testNumericOperatorContexts0005() {
  const TAG = 'testNumericOperatorContexts0005';
  let v: Int = new Int(129);
  let arr: Int[] = new Int[129 + 1];
  arr[v.toInt()] = v;
  if (arr[v.toInt()] !== 129) {
    console.info(`${TAG} Task execution failed: arr[v.toInt()]: ${arr[v.toInt()]}`);
    throw new Error('arr[v.toInt()] check failed, expected 129');
  }
}

export function testNumericOperatorContexts0006() {
  const TAG = 'testNumericOperatorContexts0006';
  let v: float = 10.0f;
  let arr: float[] = new float[10 + 1];
  arr[v.toInt()] = v;
  if (arr[v.toInt()] !== 10) {
    console.info(`${TAG} Task execution failed: arr[v.toInt()]: ${arr[v.toInt()]}`);
    throw new Error('arr[v.toInt()] check failed, expected 10');
  }
}

export function testNumericOperatorContexts0007() {
  const TAG = 'testNumericOperatorContexts0007';
  let v: double = 20.0;
  let arr: double[] = new double[20 + 1];
  arr[v.toInt()] = v;
  if (arr[v.toInt()] !== 20) {
    console.info(`${TAG} Task execution failed: arr[v.toInt()]: ${arr[v.toInt()]}`);
    throw new Error('arr[v.toInt()] check failed, expected 20');
  }
}

export function testNumericOperatorContexts0008() {
  const TAG = 'testNumericOperatorContexts0008';
  let v: Float = new Float(1.0f);
  let arr: Float[] = new Float[1 + 1];
  arr[v.toInt()] = v;
  if (arr[v.toInt()] !== 1) {
    console.info(`${TAG} Task execution failed: arr[v.toInt()]: ${arr[v.toInt()]}`);
    throw new Error('arr[v.toInt()] check failed, expected 1');
  }
}

export function testNumericOperatorContexts0009() {
  const TAG = 'testNumericOperatorContexts0009';
  let v: Double = new Double(2.0);
  let arr: Double[] = new Double[2 + 1];
  arr[v.toInt()] = v;
  if (arr[v.toInt()] !== 2) {
    console.info(`${TAG} Task execution failed: arr[v.toInt()]: ${arr[v.toInt()]}`);
    throw new Error('arr[v.toInt()] check failed, expected 2');
  }
}

export function testNumericOperatorContexts0010() {
  const TAG = 'testNumericOperatorContexts0010';
  let v1: double = 1e-23;
  let v2: double = 1e-23;
  if (v1 - v2 !== 0.0) {
    console.info(`${TAG} Task execution failed: v1 - v2: ${v1 - v2}`);
    throw new Error('v1 - v2 check failed, expected 0.0');
  }
}

export function testNumericOperatorContexts0011() {
  const TAG = 'testNumericOperatorContexts0011';
  let v1: byte = 1;
  let v2: short = 1;
  if (v1 * v2 !== 1) {
    console.info(`${TAG} Task execution failed: v1 * v2: ${v1 * v2}`);
    throw new Error('v1 * v2 check failed, expected 1');
  }
}

export function testNumericOperatorContexts0012() {
  const TAG = 'testNumericOperatorContexts0012';
  let v1: short = 100;
  let v2: double = 100.0;
  if (v1 + v2 !== 200.0) {
    console.info(`${TAG} Task execution failed: v1 + v2: ${v1 + v2}`);
    throw new Error('v1 + v2 check failed, expected 200.0');
  }
}

export function testNumericOperatorContexts0013() {
  const TAG = 'testNumericOperatorContexts0013';
  let v1: double = 100.0;
  let v2: long = 2;
  if (v1 / v2 !== 50.0) {
    console.info(`${TAG} Task execution failed: v1 / v2: ${v1 / v2}`);
    throw new Error('v1 / v2 check failed, expected 50.0');
  }
}

export function testNumericOperatorContexts0014() {
  const TAG = 'testNumericOperatorContexts0014';
  let v1: IntEnum = IntEnum.One;
  let v2: IntEnum = IntEnum.Two;
  if (v1 + v2 !== 3) {
    console.info(`${TAG} Task execution failed: v1 + v2: ${v1 + v2}`);
    throw new Error('v1 + v2 check failed, expected 3');
  }
}

export function testNumericOperatorContexts0015() {
  const TAG = 'testNumericOperatorContexts0015';
  let v1: IntEnum = IntEnum.One;
  let v2: IntEnum = IntEnum.Three;
  if (v1 * v2 !== 3) {
    console.info(`${TAG} Task execution failed: v1 * v2: ${v1 * v2}`);
    throw new Error('v1 * v2 check failed, expected 3');
  }
}

export function testNumericOperatorContexts0016() {
  const TAG = 'testNumericOperatorContexts0016';
  let v1: IntEnum = IntEnum.Two;
  let v2: IntEnum = IntEnum.One;
  if (v1 / v2 !== 2) {
    console.info(`${TAG} Task execution failed: v1 / v2: ${v1 / v2}`);
    throw new Error('v1 / v2 check failed, expected 2');
  }
}

export function testNumericOperatorContexts0017() {
  const TAG = 'testNumericOperatorContexts0017';
  let v1: IntEnum2 = IntEnum2.Two;
  let v2: IntEnum2 = IntEnum2.One;
  if (v1 > v2 !== true) {
    console.info(`${TAG} Task execution failed: v1 > v2: ${v1 > v2}`);
    throw new Error('v1 > v2 check failed, expected true');
  }
}

export function testNumericOperatorContexts0018() {
  const TAG = 'testNumericOperatorContexts0018';
  let x: bigint = 1n;
  let y: long = 1;
  if (x > new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x > new BigInt(y): ${x > new BigInt(y)}`);
    throw new Error('x > new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) > x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) > x: ${new BigInt(y) > x}`);
    throw new Error('new BigInt(y) > x check failed, expected false');
  }
}

export function testNumericOperatorContexts0019() {
  const TAG = 'testNumericOperatorContexts0019';
  let x: bigint = 1n;
  let y: long = 1;
  if (x >= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x >= new BigInt(y): ${x >= new BigInt(y)}`);
    throw new Error('x >= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) >= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) >= x: ${new BigInt(y) >= x}`);
    throw new Error('new BigInt(y) >= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0020() {
  const TAG = 'testNumericOperatorContexts0020';
  let x: bigint = 1n;
  let y: long = 1;
  if (x < new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x < new BigInt(y): ${x < new BigInt(y)}`);
    throw new Error('x < new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) < x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) < x: ${new BigInt(y) < x}`);
    throw new Error('new BigInt(y) < x check failed, expected false');
  }
}

export function testNumericOperatorContexts0021() {
  const TAG = 'testNumericOperatorContexts0021';
  let x: bigint = 1n;
  let y: long = 1;
  if (x <= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x <= new BigInt(y): ${x <= new BigInt(y)}`);
    throw new Error('x <= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) <= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) <= x: ${new BigInt(y) <= x}`);
    throw new Error('new BigInt(y) <= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0022() {
  const TAG = 'testNumericOperatorContexts0022';
  let x: bigint = 1n;
  let y: long = 1;
  if (x == new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x == new BigInt(y): ${x == new BigInt(y)}`);
    throw new Error('x == new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) == x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) == x: ${new BigInt(y) == x}`);
    throw new Error('new BigInt(y) == x check failed, expected true');
  }
}

export function testNumericOperatorContexts0023() {
  const TAG = 'testNumericOperatorContexts0023';
  let x: bigint = 1n;
  let y: long = 1;
  if (x === new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x === new BigInt(y): ${x === new BigInt(y)}`);
    throw new Error('x === new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) === x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) === x: ${new BigInt(y) === x}`);
    throw new Error('new BigInt(y) === x check failed, expected true');
  }
}

export function testNumericOperatorContexts0024() {
  const TAG = 'testNumericOperatorContexts0024';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x <= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x <= new BigInt(y): ${x <= new BigInt(y)}`);
    throw new Error('x <= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) <= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) <= x: ${new BigInt(y) <= x}`);
    throw new Error('new BigInt(y) <= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0025() {
  const TAG = 'testNumericOperatorContexts0025';
  let x: bigint = 1n;
  let y: long = 1;
  if (x != new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x != new BigInt(y): ${x != new BigInt(y)}`);
    throw new Error('x != new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) != x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) != x: ${new BigInt(y) != x}`);
    throw new Error('new BigInt(y) != x check failed, expected false');
  }
}

export function testNumericOperatorContexts0026() {
  const TAG = 'testNumericOperatorContexts0026';
  let x: bigint = 1n;
  let y: long = 1;
  if (x !== new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x !== new BigInt(y): ${x !== new BigInt(y)}`);
    throw new Error('x !== new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) !== x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) !== x: ${new BigInt(y) !== x}`);
    throw new Error('new BigInt(y) !== x check failed, expected false');
  }
}

export function testNumericOperatorContexts0027() {
  const TAG = 'testNumericOperatorContexts0027';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x > new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x > new BigInt(y): ${x > new BigInt(y)}`);
    throw new Error('x > new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) > x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) > x: ${new BigInt(y) > x}`);
    throw new Error('new BigInt(y) > x check failed, expected false');
  }
}

export function testNumericOperatorContexts0028() {
  const TAG = 'testNumericOperatorContexts0028';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x >= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x >= new BigInt(y): ${x >= new BigInt(y)}`);
    throw new Error('x >= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) >= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) >= x: ${new BigInt(y) >= x}`);
    throw new Error('new BigInt(y) >= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0029() {
  const TAG = 'testNumericOperatorContexts0029';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x < new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x < new BigInt(y): ${x < new BigInt(y)}`);
    throw new Error('x < new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) < x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) < x: ${new BigInt(y) < x}`);
    throw new Error('new BigInt(y) < x check failed, expected false');
  }
}

export function testNumericOperatorContexts0030() {
  const TAG = 'testNumericOperatorContexts0030';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x <= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x <= new BigInt(y): ${x <= new BigInt(y)}`);
    throw new Error('x <= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) <= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) <= x: ${new BigInt(y) <= x}`);
    throw new Error('new BigInt(y) <= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0031() {
  const TAG = 'testNumericOperatorContexts0031';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x == new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x == new BigInt(y): ${x == new BigInt(y)}`);
    throw new Error('x == new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) == x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) == x: ${new BigInt(y) == x}`);
    throw new Error('new BigInt(y) == x check failed, expected true');
  }
}

export function testNumericOperatorContexts0032() {
  const TAG = 'testNumericOperatorContexts0032';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x === new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x === new BigInt(y): ${x === new BigInt(y)}`);
    throw new Error('x === new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) === x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) === x: ${new BigInt(y) === x}`);
    throw new Error('new BigInt(y) === x check failed, expected true');
  }
}

export function testNumericOperatorContexts0033() {
  const TAG = 'testNumericOperatorContexts0033';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x != new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x != new BigInt(y): ${x != new BigInt(y)}`);
    throw new Error('x != new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) != x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) != x: ${new BigInt(y) != x}`);
    throw new Error('new BigInt(y) != x check failed, expected false');
  }
}

export function testNumericOperatorContexts0034() {
  const TAG = 'testNumericOperatorContexts0034';
  let x: bigint = 1n;
  let y: bigint = 1n;
  if (x !== new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x !== new BigInt(y): ${x !== new BigInt(y)}`);
    throw new Error('x !== new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) !== x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) !== x: ${new BigInt(y) !== x}`);
    throw new Error('new BigInt(y) !== x check failed, expected false');
  }
}

export function testNumericOperatorContexts0035() {
  const TAG = 'testNumericOperatorContexts0035';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x == new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x == new BigInt(y): ${x == new BigInt(y)}`);
    throw new Error('x == new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) == x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) == x: ${new BigInt(y) == x}`);
    throw new Error('new BigInt(y) == x check failed, expected true');
  }
}

export function testNumericOperatorContexts0036() {
  const TAG = 'testNumericOperatorContexts0036';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x === new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x === new BigInt(y): ${x === new BigInt(y)}`);
    throw new Error('x === new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) === x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) === x: ${new BigInt(y) === x}`);
    throw new Error('new BigInt(y) === x check failed, expected true');
  }
}

export function testNumericOperatorContexts0037() {
  const TAG = 'testNumericOperatorContexts0037';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x != new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x != new BigInt(y): ${x != new BigInt(y)}`);
    throw new Error('x != new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) != x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) != x: ${new BigInt(y) != x}`);
    throw new Error('new BigInt(y) != x check failed, expected false');
  }
}

export function testNumericOperatorContexts0038() {
  const TAG = 'testNumericOperatorContexts0038';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x !== new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x !== new BigInt(y): ${x !== new BigInt(y)}`);
    throw new Error('x !== new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) !== x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) !== x: ${new BigInt(y) !== x}`);
    throw new Error('new BigInt(y) !== x check failed, expected false');
  }
}

export function testNumericOperatorContexts0039() {
  const TAG = 'testNumericOperatorContexts0039';
  let x: bigint = 1n;
  let y: short = 1;
  if (x > new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x > new BigInt(y): ${x > new BigInt(y)}`);
    throw new Error('x > new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) > x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) > x: ${new BigInt(y) > x}`);
    throw new Error('new BigInt(y) > x check failed, expected false');
  }
}

export function testNumericOperatorContexts0040() {
  const TAG = 'testNumericOperatorContexts0040';
  let x: bigint = 1n;
  let y: short = 1;
  if (x >= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x >= new BigInt(y): ${x >= new BigInt(y)}`);
    throw new Error('x >= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) >= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) >= x: ${new BigInt(y) >= x}`);
    throw new Error('new BigInt(y) >= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0041() {
  const TAG = 'testNumericOperatorContexts0041';
  let x: byte = 1;
  let y: byte = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0042() {
  const TAG = 'testNumericOperatorContexts0042';
  let x: byte = 1;
  let y: byte = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0043() {
  const TAG = 'testNumericOperatorContexts0043';
  let x: byte = 1;
  let y: short = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0044() {
  const TAG = 'testNumericOperatorContexts0044';
  let x: byte = 1;
  let y: short = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0045() {
  const TAG = 'testNumericOperatorContexts0045';
  let x: byte = 1;
  let y: short = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0046() {
  const TAG = 'testNumericOperatorContexts0046';
  let x: byte = 1;
  let y: short = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0047() {
  const TAG = 'testNumericOperatorContexts0047';
  let x: byte = 1;
  let y: short = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0048() {
  const TAG = 'testNumericOperatorContexts0048';
  let x: byte = 1;
  let y: short = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0049() {
  const TAG = 'testNumericOperatorContexts0049';
  let x: byte = 1;
  let y: int = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0050() {
  const TAG = 'testNumericOperatorContexts0050';
  let x: byte = 1;
  let y: int = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0051() {
  const TAG = 'testNumericOperatorContexts0051';
  let x: byte = 1;
  let y: int = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0052() {
  const TAG = 'testNumericOperatorContexts0052';
  let x: byte = 1;
  let y: int = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0053() {
  const TAG = 'testNumericOperatorContexts0053';
  let x: byte = 1;
  let y: byte = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0054() {
  const TAG = 'testNumericOperatorContexts0054';
  let x: byte = 1;
  let y: int = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0055() {
  const TAG = 'testNumericOperatorContexts0055';
  let x: byte = 1;
  let y: int = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0056() {
  const TAG = 'testNumericOperatorContexts0056';
  let x: byte = 1;
  let y: int = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0057() {
  const TAG = 'testNumericOperatorContexts0057';
  let x: byte = 1;
  let y: int = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0058() {
  const TAG = 'testNumericOperatorContexts0058';
  let x: byte = 1;
  let y: long = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0059() {
  const TAG = 'testNumericOperatorContexts0059';
  let x: byte = 1;
  let y: long = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0060() {
  const TAG = 'testNumericOperatorContexts0060';
  let x: byte = 1;
  let y: long = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0061() {
  const TAG = 'testNumericOperatorContexts0061';
  let x: byte = 1;
  let y: long = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0062() {
  const TAG = 'testNumericOperatorContexts0062';
  let x: byte = 1;
  let y: long = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0063() {
  const TAG = 'testNumericOperatorContexts0063';
  let x: byte = 1;
  let y: long = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0064() {
  const TAG = 'testNumericOperatorContexts0064';
  let x: byte = 1;
  let y: byte = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0065() {
  const TAG = 'testNumericOperatorContexts0065';
  let x: byte = 1;
  let y: long = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0066() {
  const TAG = 'testNumericOperatorContexts0066';
  let x: byte = 1;
  let y: long = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0067() {
  const TAG = 'testNumericOperatorContexts0067';
  let x: byte = 1;
  let y: float = 1;
  if ((x > y) !== false) {
    console.info(`${TAG} Task execution failed: (x > y): ${(x > y)}`);
    throw new Error('(x > y) check failed, expected false');
  }

  if ((y > x) !== false) {
    console.info(`${TAG} Task execution failed: (y > x): ${(y > x)}`);
    throw new Error('(y > x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0068() {
  const TAG = 'testNumericOperatorContexts0068';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x > new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x > new BigInt(y): ${x > new BigInt(y)}`);
    throw new Error('x > new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) > x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) > x: ${new BigInt(y) > x}`);
    throw new Error('new BigInt(y) > x check failed, expected false');
  }
}

export function testNumericOperatorContexts0069() {
  const TAG = 'testNumericOperatorContexts0069';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x >= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x >= new BigInt(y): ${x >= new BigInt(y)}`);
    throw new Error('x >= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) >= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) >= x: ${new BigInt(y) >= x}`);
    throw new Error('new BigInt(y) >= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0070() {
  const TAG = 'testNumericOperatorContexts0070';
  let x: bigint = 1n;
  let y: short = 1;
  if (x < new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x < new BigInt(y): ${x < new BigInt(y)}`);
    throw new Error('x < new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) < x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) < x: ${new BigInt(y) < x}`);
    throw new Error('new BigInt(y) < x check failed, expected false');
  }
}

export function testNumericOperatorContexts0071() {
  const TAG = 'testNumericOperatorContexts0071';
  let x: bigint = 1n;
  let y: short = 1;
  if (x <= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x <= new BigInt(y): ${x <= new BigInt(y)}`);
    throw new Error('x <= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) <= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) <= x: ${new BigInt(y) <= x}`);
    throw new Error('new BigInt(y) <= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0072() {
  const TAG = 'testNumericOperatorContexts0072';
  let x: bigint = 1n;
  let y: short = 1;
  if (x == new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x == new BigInt(y): ${x == new BigInt(y)}`);
    throw new Error('x == new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) == x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) == x: ${new BigInt(y) == x}`);
    throw new Error('new BigInt(y) == x check failed, expected true');
  }
}

export function testNumericOperatorContexts0073() {
  const TAG = 'testNumericOperatorContexts0073';
  let x: bigint = 1n;
  let y: short = 1;
  if (x === new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x === new BigInt(y): ${x === new BigInt(y)}`);
    throw new Error('x === new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) === x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) === x: ${new BigInt(y) === x}`);
    throw new Error('new BigInt(y) === x check failed, expected true');
  }
}

export function testNumericOperatorContexts0074() {
  const TAG = 'testNumericOperatorContexts0074';
  let x: bigint = 1n;
  let y: short = 1;
  if (x != new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x != new BigInt(y): ${x != new BigInt(y)}`);
    throw new Error('x != new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) != x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) != x: ${new BigInt(y) != x}`);
    throw new Error('new BigInt(y) != x check failed, expected false');
  }
}

export function testNumericOperatorContexts0075() {
  const TAG = 'testNumericOperatorContexts0075';
  let x: bigint = 1n;
  let y: short = 1;
  if (x !== new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x !== new BigInt(y): ${x !== new BigInt(y)}`);
    throw new Error('x !== new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) !== x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) !== x: ${new BigInt(y) !== x}`);
    throw new Error('new BigInt(y) !== x check failed, expected false');
  }
}

export function testNumericOperatorContexts0076() {
  const TAG = 'testNumericOperatorContexts0076';
  let x: bigint = 1n;
  let y: int = 1;
  if (x > new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x > new BigInt(y): ${x > new BigInt(y)}`);
    throw new Error('x > new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) > x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) > x: ${new BigInt(y) > x}`);
    throw new Error('new BigInt(y) > x check failed, expected false');
  }
}

export function testNumericOperatorContexts0077() {
  const TAG = 'testNumericOperatorContexts0077';
  let x: bigint = 1n;
  let y: int = 1;
  if (x >= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x >= new BigInt(y): ${x >= new BigInt(y)}`);
    throw new Error('x >= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) >= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) >= x: ${new BigInt(y) >= x}`);
    throw new Error('new BigInt(y) >= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0078() {
  const TAG = 'testNumericOperatorContexts0078';
  let x: bigint = 1n;
  let y: int = 1;
  if (x < new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x < new BigInt(y): ${x < new BigInt(y)}`);
    throw new Error('x < new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) < x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) < x: ${new BigInt(y) < x}`);
    throw new Error('new BigInt(y) < x check failed, expected false');
  }
}

export function testNumericOperatorContexts0079() {
  const TAG = 'testNumericOperatorContexts0079';
  let x: bigint = 1n;
  let y: int = 1;
  if (x <= new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x <= new BigInt(y): ${x <= new BigInt(y)}`);
    throw new Error('x <= new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) <= x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) <= x: ${new BigInt(y) <= x}`);
    throw new Error('new BigInt(y) <= x check failed, expected true');
  }
}

export function testNumericOperatorContexts0080() {
  const TAG = 'testNumericOperatorContexts0080';
  let x: bigint = 1n;
  let y: byte = 1;
  if (x < new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x < new BigInt(y): ${x < new BigInt(y)}`);
    throw new Error('x < new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) < x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) < x: ${new BigInt(y) < x}`);
    throw new Error('new BigInt(y) < x check failed, expected false');
  }
}

export function testNumericOperatorContexts0081() {
  const TAG = 'testNumericOperatorContexts0081';
  let x: bigint = 1n;
  let y: int = 1;
  if (x == new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x == new BigInt(y): ${x == new BigInt(y)}`);
    throw new Error('x == new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) == x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) == x: ${new BigInt(y) == x}`);
    throw new Error('new BigInt(y) == x check failed, expected true');
  }
}

export function testNumericOperatorContexts0082() {
  const TAG = 'testNumericOperatorContexts0082';
  let x: bigint = 1n;
  let y: int = 1;
  if (x === new BigInt(y) !== true) {
    console.info(`${TAG} Task execution failed: x === new BigInt(y): ${x === new BigInt(y)}`);
    throw new Error('x === new BigInt(y) check failed, expected true');
  }

  if (new BigInt(y) === x !== true) {
    console.info(`${TAG} Task execution failed: new BigInt(y) === x: ${new BigInt(y) === x}`);
    throw new Error('new BigInt(y) === x check failed, expected true');
  }
}

export function testNumericOperatorContexts0083() {
  const TAG = 'testNumericOperatorContexts0083';
  let x: bigint = 1n;
  let y: int = 1;
  if (x != new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x != new BigInt(y): ${x != new BigInt(y)}`);
    throw new Error('x != new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) != x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) != x: ${new BigInt(y) != x}`);
    throw new Error('new BigInt(y) != x check failed, expected false');
  }
}

export function testNumericOperatorContexts0084() {
  const TAG = 'testNumericOperatorContexts0084';
  let x: bigint = 1n;
  let y: int = 1;
  if (x !== new BigInt(y) !== false) {
    console.info(`${TAG} Task execution failed: x !== new BigInt(y): ${x !== new BigInt(y)}`);
    throw new Error('x !== new BigInt(y) check failed, expected false');
  }

  if (new BigInt(y) !== x !== false) {
    console.info(`${TAG} Task execution failed: new BigInt(y) !== x: ${new BigInt(y) !== x}`);
    throw new Error('new BigInt(y) !== x check failed, expected false');
  }
}

export function testNumericOperatorContexts0085() {
  const TAG = 'testNumericOperatorContexts0085';
  let x: byte = 1;
  let y: float = 1;
  if ((x >= y) !== true) {
    console.info(`${TAG} Task execution failed: (x >= y): ${(x >= y)}`);
    throw new Error('(x >= y) check failed, expected true');
  }

  if ((y >= x) !== true) {
    console.info(`${TAG} Task execution failed: (y >= x): ${(y >= x)}`);
    throw new Error('(y >= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0086() {
  const TAG = 'testNumericOperatorContexts0086';
  let x: byte = 1;
  let y: float = 1;
  if ((x < y) !== false) {
    console.info(`${TAG} Task execution failed: (x < y): ${(x < y)}`);
    throw new Error('(x < y) check failed, expected false');
  }

  if ((y < x) !== false) {
    console.info(`${TAG} Task execution failed: (y < x): ${(y < x)}`);
    throw new Error('(y < x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0087() {
  const TAG = 'testNumericOperatorContexts0087';
  let x: byte = 1;
  let y: float = 1;
  if ((x <= y) !== true) {
    console.info(`${TAG} Task execution failed: (x <= y): ${(x <= y)}`);
    throw new Error('(x <= y) check failed, expected true');
  }

  if ((y <= x) !== true) {
    console.info(`${TAG} Task execution failed: (y <= x): ${(y <= x)}`);
    throw new Error('(y <= x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0088() {
  const TAG = 'testNumericOperatorContexts0088';
  let x: byte = 1;
  let y: float = 1;
  if ((x == y) !== true) {
    console.info(`${TAG} Task execution failed: (x == y): ${(x == y)}`);
    throw new Error('(x == y) check failed, expected true');
  }

  if ((y == x) !== true) {
    console.info(`${TAG} Task execution failed: (y == x): ${(y == x)}`);
    throw new Error('(y == x) check failed, expected true');
  }
}

export function testNumericOperatorContexts0089() {
  const TAG = 'testNumericOperatorContexts0089';
  let x: byte = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0090() {
  const TAG = 'testNumericOperatorContexts0090';
  let x: byte = 1;
  let y: float = 1;
  if ((x != y) !== false) {
    console.info(`${TAG} Task execution failed: (x != y): ${(x != y)}`);
    throw new Error('(x != y) check failed, expected false');
  }

  if ((y != x) !== false) {
    console.info(`${TAG} Task execution failed: (y != x): ${(y != x)}`);
    throw new Error('(y != x) check failed, expected false');
  }
}

export function testNumericOperatorContexts0091() {
  const TAG = 'testNumericOperatorContexts0091';
  let x: byte = 1;
  let y: float = 1;
  if ((x !== y) !== false) {
    console.info(`${TAG} Task execution failed: (x !== y): ${(x !== y)}`);
    throw new Error('(x !== y) check failed, expected false');
  }

  if ((y !== x) !== false) {
    console.info(`${TAG} Task execution failed: (y !== x): ${(y !== x)}`);
    throw new Error('(y !== x) check failed, expected false');
  }
}

