'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import Utils from '../Util.test';

class Data041 {
  val: int = 0;
}

class ObjWithId {
  id: int = 0;
}

class NestedNullable {
  val: int = 0;
  child: NestedNullable | null = null;
}

class ObjWithX {
  x: int = 0;
}

class ConfigObj {
  multiplier: int = 0;
}

class CalcObj {
  square(x: int): int {
    return x * x;
  }
}

class ObjWithAB {
  a: int = 0;
  b: string = '';
}

function isPrime028(n: int): boolean {
  if (n < 2) return false;
  for (let j = 2; j * j <= n; j++) {
    if (n % j === 0) return false;
  }
  return true;
}

function collatzSteps032(n: int): int {
  let steps = 0;
  let val = n;
  while (val !== 1) {
    if (val % 2 === 0) {
      val = val / 2;
    } else {
      val = 3 * val + 1;
    }
    steps++;
  }
  return steps;
}

function gcd033(a: int, b: int): int {
  if (b === 0) return a;
  return gcd033(b, a % b);
}

export default function ArrayConstructor4_2Test(): void {
  describe('ArrayConstructor4_2Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0100
     * @tc.name testArrayConstructor4001
     * @tc.desc Verify initializer sums all indices externally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0;
      const arr = new Array<int>(4, (i: int): int => {
        sum += i;
        return i;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0200
     * @tc.name testArrayConstructor4002
     * @tc.desc Verify initializer modifies an external array each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const external: Array<int> = new Array<int>();
      const arr = new Array<string>(3, (i: int): string => {
        external.push(i * 10);
        return 'x' + i;
      });
      expect(arr.length).assertEqual(3);
      expect(external[0]).assertEqual(0);
      expect(external[2]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0300
     * @tc.name testArrayConstructor4003
     * @tc.desc Verify initializer preserves the last assigned state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let state = 0;
      const arr = new Array<int>(5, (i: int): int => {
        state = i;
        return state;
      });
      expect(state).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0400
     * @tc.name testArrayConstructor4004
     * @tc.desc Verify initializer with pseudo-random seed computation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let seed = 1;
      const arr = new Array<long>(5, (i: int): long => {
        seed = (seed * 1103515245 + 12345) & 0x7fffffff;
        return seed;
      });
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0500
     * @tc.name testArrayConstructor4005
     * @tc.desc Verify initializer creates a new object on each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const arr = new Array<ObjWithId>(3, (i: int): ObjWithId => {
        count++;
        return new ObjWithId();
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0600
     * @tc.name testArrayConstructor4006
     * @tc.desc Verify initializer collects timestamps each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const times: Array<number> = new Array<number>();
      const arr = new Array<int>(2, (i: int): int => {
        times.push(Date.now());
        return i;
      });
      expect(times.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0700
     * @tc.name testArrayConstructor4007
     * @tc.desc Verify initializer interacts with outer variable across indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = 100;
      const arr = new Array<int>(4, (i: int): int => {
        const tmp = base;
        base += 10;
        return tmp + i;
      });
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(111);
      expect(arr[2]).assertEqual(122);
      expect(arr[3]).assertEqual(133);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0800
     * @tc.name testArrayConstructor4008
     * @tc.desc Verify initializer returns union type based on index parity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const flags: Array<boolean> = new Array<boolean>();
      const arr = new Array<int | string>(4, (i: int): int | string => {
        flags.push(i % 2 === 0);
        return i % 2 === 0 ? 'even' : i;
      });
      expect(arr[0]).assertEqual('even');
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual('even');
      expect(arr[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_0900
     * @tc.name testArrayConstructor4009
     * @tc.desc Verify initializer captures external object property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const config: ConfigObj = new ConfigObj();
      config.multiplier = 5;
      const arr = new Array<int>(3, (i: int): int => i * config.multiplier);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1000
     * @tc.name testArrayConstructor4010
     * @tc.desc Verify initializer calls an external function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleFn = (x: int): int => x * 2;
      const arr = new Array<int>(5, (i: int): int => doubleFn(i));
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1100
     * @tc.name testArrayConstructor4011
     * @tc.desc Verify initializer snapshot of external variable later changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factor = 2;
      const arr = new Array<int>(4, (i: int): int => i * factor);
      factor = 10;
      expect(arr[0]).assertEqual(0);
      expect(arr[3]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1200
     * @tc.name testArrayConstructor4012
     * @tc.desc Verify initializer uses a binary external function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const addFn = (a: int, b: int): int => {
        return a + b;
      };
      const arr = new Array<int>(4, (i: int): int => addFn(i, 10));
      expect(arr[0]).assertEqual(10);
      expect(arr[3]).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1300
     * @tc.name testArrayConstructor4013
     * @tc.desc Verify initializer depends on an external boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const allowed = new Array<boolean>(true, false, true, false);
      const arr = new Array<string>(4, (i: int): string => allowed[i] ? 'yes' : 'no');
      expect(arr[0]).assertEqual('yes');
      expect(arr[1]).assertEqual('no');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1400
     * @tc.name testArrayConstructor4014
     * @tc.desc Verify initializer calls method on an external object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const calc: CalcObj = new CalcObj();
      const arr = new Array<int>(4, (i: int): int => calc.square(i));
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1500
     * @tc.name testArrayConstructor4015
     * @tc.desc Verify initializer uses indexOf reverse lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const forward = new Array<int>(1, 2, 3);
      const backward = new Array<int>(3, (i: int): int => forward.indexOf(i + 1));
      expect(backward[0]).assertEqual(0);
      expect(backward[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1600
     * @tc.name testArrayConstructor4016
     * @tc.desc Verify initializer generates an arithmetic sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(6, (i: int): int => 3 * i + 1);
      expect(arr[0]).assertEqual(1);
      expect(arr[5]).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1700
     * @tc.name testArrayConstructor4017
     * @tc.desc Verify initializer generates a geometric sequence (powers of 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, (i: int): number => Math.pow(3, i));
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(81);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1800
     * @tc.name testArrayConstructor4018
     * @tc.desc Verify initializer generates sine wave values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(5, (i: int): double => Math.sin(i * Math.PI / 4));
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(Math.sin(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_1900
     * @tc.name testArrayConstructor4019
     * @tc.desc Verify initializer generates factorial sequence with state, only use push to store data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fact: Array<int> = new Array<int>();
      const arr = new Array<int>(5, (i: int): int => {
        let val: int;
        if (i === 0) {
          val = 1;
          fact.push(val);
        } else {
          val = fact[fact.length - 1] * i;
          fact.push(val);
        }
        return val;
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[4]).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2000
     * @tc.name testArrayConstructor4020
     * @tc.desc Verify initializer generates Fibonacci via DP, only use push to store data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fib: Array<int> = new Array<int>();
      const arr = new Array<int>(7, (i: int): int => {
        let val: int;
        if (i <= 1) {
          val = i;
          fib.push(val);
        } else {
          const prev1 = fib[fib.length - 1];
          const prev2 = fib[fib.length - 2];
          val = prev1 + prev2;
          fib.push(val);
        }
        return val;
      });
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[6]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2100
     * @tc.name testArrayConstructor4021
     * @tc.desc Verify initializer generates prime boolean flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(10, (i: int): boolean => isPrime028(i));
      expect(arr[0]).assertFalse();
      expect(arr[2]).assertTrue();
      expect(arr[4]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2200
     * @tc.name testArrayConstructor4022
     * @tc.desc Verify initializer generates binary parity (0/1 alternating)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(8, (i: int): int => i % 2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[7]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2300
     * @tc.name testArrayConstructor4023
     * @tc.desc Verify initializer computes Pascal triangle row 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (i: int): int => {
        let val = 1;
        const limit = i < 3 ? i : 5 - i - 1;
        for (let j = 0; j < limit; j++) {
          val = val * (5 - j - 1) / (j + 1);
        }
        return val;
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2400
     * @tc.name testArrayConstructor4024
     * @tc.desc Verify initializer generates Gray code sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(8, (i: int): int => i ^ (i >> 1));
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
      expect(arr[7]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2500
     * @tc.name testArrayConstructor4025
     * @tc.desc Verify initializer computes Collatz conjecture steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, (i: int): int => collatzSteps032(i + 1));
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2600
     * @tc.name testArrayConstructor4026
     * @tc.desc Verify initializer computes GCD sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (i: int): int => gcd033(20, (i + 1) * 5));
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(20);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2700
     * @tc.name testArrayConstructor4027
     * @tc.desc Verify initializer generates digital root sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, (i: int): int => {
        const n = i + 1;
        return 1 + (n - 1) % 9;
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[9]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2800
     * @tc.name testArrayConstructor4028
     * @tc.desc Verify initializer returning same object reference shares across positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared: ObjWithX = new ObjWithX();
      const arr = new Array<ObjWithX>(3, (i: int): ObjWithX => shared);
      shared.x = 99;
      expect(arr[1].x).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_2900
     * @tc.name testArrayConstructor4029
     * @tc.desc Verify initializer returning new object literals are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ObjWithX>(3, (i: int): ObjWithX => {
        const obj = new ObjWithX();
        obj.x = i;
        return obj;
      });
      arr[0].x = 100;
      expect(arr[1].x).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3000
     * @tc.name testArrayConstructor4030
     * @tc.desc Verify deeply nested array isolation in initializer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<Array<int>>>(2, (i: int): Array<Array<int>> =>
        new Array<Array<int>>(new Array<int>(i, i + 1), new Array<int>(i + 2, i + 3)));
      arr[0][0][0] = 99;
      expect(arr[1][0][0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3100
     * @tc.name testArrayConstructor4031
     * @tc.desc Verify returning external array shares reference across positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new Array<int>(10, 20);
      const arr = new Array<Array<int>>(2, (i: int): Array<int> => buf);
      arr[0][0] = 99;
      expect(buf[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3200
     * @tc.name testArrayConstructor4032
     * @tc.desc Verify struct literal objects from initializer are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ObjWithAB>(2, (i: int): ObjWithAB => {
        const item = new ObjWithAB();
        item.a = i;
        item.b = 's' + i;
        return item;
      });
      arr[0].a = 99;
      expect(arr[1].a).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3300
     * @tc.name testArrayConstructor4033
     * @tc.desc Verify class instances from initializer remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Data041>(3, (i: int): Data041 => new Data041());
      arr[0].val = 99;
      expect(arr[1].val).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3400
     * @tc.name testArrayConstructor4034
     * @tc.desc Verify returning same function reference works across positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn = (x: int): int => x * 2;
      const arr = new Array<(x: int) => int>(3, (i: int): (x: int) => int => fn);
      expect(arr[0](5)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3500
     * @tc.name testArrayConstructor4035
     * @tc.desc Verify initializer with three-way conditional branches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>(6, (i: int): string => {
        if (i < 2) return 'low';
        else if (i < 4) return 'mid';
        else return 'high';
      });
      expect(arr[0]).assertEqual('low');
      expect(arr[2]).assertEqual('mid');
      expect(arr[5]).assertEqual('high');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3600
     * @tc.name testArrayConstructor4036
     * @tc.desc Verify initializer with nested ternary conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(6, (i: int): int => i === 0 ? -1 : i % 2 === 0 ? i * 2 : i * 3);
      expect(arr[0]).assertEqual(-1);
      expect(arr[2]).assertEqual(4);
      expect(arr[5]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3700
     * @tc.name testArrayConstructor4037
     * @tc.desc Verify initializer simulating switch branches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>(4, (i: int): string => {
        if (i === 0) return 'zero';
        else if (i === 1) return 'one';
        else if (i === 2) return 'two';
        else return 'many';
      });
      expect(arr[0]).assertEqual('zero');
      expect(arr[3]).assertEqual('many');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3800
     * @tc.name testArrayConstructor4038
     * @tc.desc Verify initializer with range-based return values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, (i: int): int => {
        if (i >= 0 && i < 3) return 10;
        else if (i >= 3 && i < 7) return 20;
        else return 30;
      });
      expect(arr[0]).assertEqual(10);
      expect(arr[5]).assertEqual(20);
      expect(arr[9]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_3900
     * @tc.name testArrayConstructor4039
     * @tc.desc Verify initializer with first and last special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (i: int): int => {
        if (i === 0) return 100;
        else if (i === 4) return 500;
        else return i * 50;
      });
      expect(arr[0]).assertEqual(100);
      expect(arr[2]).assertEqual(100);
      expect(arr[4]).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4000
     * @tc.name testArrayConstructor4040
     * @tc.desc Verify initializer with mod 3 FizzBuzz-like branching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>(8, (i: int): string => {
        if (i % 3 === 0) return 'Fizz';
        else if (i % 3 === 1) return 'Buzz';
        else return 'FizzBuzz';
      });
      expect(arr[0]).assertEqual('Fizz');
      expect(arr[1]).assertEqual('Buzz');
      expect(arr[2]).assertEqual('FizzBuzz');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4100
     * @tc.name testArrayConstructor4041
     * @tc.desc Verify initializer marks prime vs composite numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>(10, (i: int): string => isPrime028(i) ? 'P' + i : 'C' + i);
      expect(arr[0]).assertEqual('C0');
      expect(arr[2]).assertEqual('P2');
      expect(arr[4]).assertEqual('C4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4200
     * @tc.name testArrayConstructor4042
     * @tc.desc Verify partial creation preserved when initializer throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(7, (i: int): int => {
        const diff = i - 3;
        return diff < 0 ? -diff : diff;
      });
      expect(arr[0]).assertEqual(3);
      expect(arr[3]).assertEqual(0);
      expect(arr[6]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4300
     * @tc.name testArrayConstructor4043
     * @tc.desc Verify partial construction preserved when initializer throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const successIndexList: Array<int> = new Array<int>();
      try {
        new Array<int>(5, (i: int): int => {
          if (i === 3) throw new Error('init index 3 trigger exception');
          successIndexList.push(i);
          return i;
        });
      } catch (e) {
        expect(e.name).assertEqual('Error')
      }
      expect(successIndexList.length).assertEqual(3);
      expect(successIndexList[0]).assertEqual(0);
      expect(successIndexList[1]).assertEqual(1);
      expect(successIndexList[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4400
     * @tc.name testArrayConstructor4044
     * @tc.desc Verify initializer returns int cast to short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<short>(3, (i: int): short => (i * 100).toShort());
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4500
     * @tc.name testArrayConstructor4045
     * @tc.desc Verify initializer returns byte negative boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(3, (i: int): byte => (-128 + i).toByte());
      expect(arr[0]).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4600
     * @tc.name testArrayConstructor4046
     * @tc.desc Verify initializer returns float with truncated precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(3, (i: int): float => (i + 0.123456789).toFloat());
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4700
     * @tc.name testArrayConstructor4047
     * @tc.desc Verify initializer returns double with full precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(3, (i: int): double => i + 0.123456789012345);
      expect(arr[0]).assertEqual(0.123456789012345);
      expect(arr[2]).assertEqual(2.123456789012345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4800
     * @tc.name testArrayConstructor4048
     * @tc.desc Verify initializer returns long huge value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(2, (i: int): bigint => 9223372036854775807n);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_4900
     * @tc.name testArrayConstructor4049
     * @tc.desc Verify map after initializer-based creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(2, (i: int): bigint => i === 0 ? 9223372036854775807n : -9223372036854775808n);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5000
     * @tc.name testArrayConstructor4050
     * @tc.desc Verify filter then reduce after initializer-based creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(4, (i: int): int => i).map((v: int): int => {
        return v * 10;
      });
      expect(arr[0]).assertEqual(0);
      expect(arr[3]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5100
     * @tc.name testArrayConstructor4051
     * @tc.desc Verify filter then reduce after initializer-based construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, (i: int): int => i)
        .filter((v: int): boolean => v % 2 === 0)
        .reduce((s: int, v: int): int => s + v, 0);
      expect(arr).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5200
     * @tc.name testArrayConstructor4052
     * @tc.desc Verify every returns true for all-even check after initializer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<int>(5, (i: int): int => i * 2).every((v: int): boolean => v % 2 === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5300
     * @tc.name testArrayConstructor4053
     * @tc.desc Verify initialized vs single-element created arrays differ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<int>(5, (i: int): int => i * 3).some((v: int): boolean => v > 10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5400
     * @tc.name testArrayConstructor4054
     * @tc.desc Verify at method after initializer-based creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(3, (i: int): int => i);
      const b = Array.create<int>(1, 3);
      const aAllDefined = a.every((v: int): boolean => v !== undefined);
      const bAllUndefined = b.every((v: int): boolean => v === undefined);
      expect(aAllDefined).assertTrue();
      expect(bAllUndefined).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5500
     * @tc.name testArrayConstructor4055
     * @tc.desc Verify at method after initializer-based construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (i: int): int => i * 10);
      expect(arr.at(-1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5600
     * @tc.name testArrayConstructor4056
     * @tc.desc Verify initializer modifies a Map object on each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>();
      const arr = new Array<string>(3, (i: int): string => {
        map.set(i, 'val' + i);
        return map.get(i)!;
      });
      expect(arr[0]).assertEqual('val0');
      expect(arr[1]).assertEqual('val1');
      expect(arr[2]).assertEqual('val2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5700
     * @tc.name testArrayConstructor4057
     * @tc.desc Verify initializer captures an external array in closure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Array<int>(10, 20, 30, 40);
      const arr = new Array<int>(4, (i: int): int => src[i] * 2);
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(60);
      expect(arr[3]).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5800
     * @tc.name testArrayConstructor4058
     * @tc.desc Verify initializer uses an external Map as lookup table
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lookup = new Map<int, string>();
      lookup.set(0, 'zero');
      lookup.set(1, 'one');
      lookup.set(2, 'two');
      const arr = new Array<string>(3, (i: int): string => lookup.get(i)!);
      expect(arr[0]).assertEqual('zero');
      expect(arr[1]).assertEqual('one');
      expect(arr[2]).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_5900
     * @tc.name testArrayConstructor4059
     * @tc.desc Verify sub-array elements from initializer are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>(3, (i: int): Array<int> => new Array<int>(i, i + 1));
      arr[0][0] = 99;
      expect(arr[1][0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_6000
     * @tc.name testArrayConstructor4060
     * @tc.desc Verify Map instances from initializer are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Map<string, int>>(2, (i: int): Map<string, int> => {
        const m = new Map<string, int>();
        m.set('k', i);
        return m;
      });
      arr[0].set('k', 99);
      expect(arr[1].get('k')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_6100
     * @tc.name testArrayConstructor4061
     * @tc.desc Verify Set instances from initializer are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Set<int>>(2, (i: int): Set<int> => {
        const s = new Set<int>();
        s.add(i);
        return s;
      });
      arr[0].add(99);
      expect(arr[1].has(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_6200
     * @tc.name testArrayConstructor4062
     * @tc.desc Verify initializer result can be spread into an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(3, (i: int): int => i);
      const b = new Array<int>();
      for (let idx = 0; idx < a.length; idx++) {
        b.push(a[idx]);
      }
      expect(b[0]).assertEqual(0);
      expect(b[1]).assertEqual(1);
      expect(b[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_6300
     * @tc.name testArrayConstructor4063
     * @tc.desc Verify initializer returns char with conditional branching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(3, (i: int): char => {
        if (i === 0) return c'A';
        if (i === 1) return c'B';
        return c'C';
      });
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(c'A');
      expect(arr[1]).assertEqual(c'B');
      expect(arr[2]).assertEqual(c'C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_6400
     * @tc.name testArrayConstructor4064
     * @tc.desc Verify initializer returns null for NestedNullable|null array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<NestedNullable | null>(3, (i: int): NestedNullable | null => {
        if (i === 1) {
          return null;
        }
        const obj = new NestedNullable();
        obj.val = i;
        return obj;
      });
      expect(arr.length).assertEqual(3);
      const first = arr[0];
      expect(first instanceof NestedNullable).assertTrue();
      expect(arr[1]).assertNull();
      expect(arr[2] instanceof NestedNullable).assertTrue();
      if (first != null && first instanceof NestedNullable) {
        expect(first.val).assertEqual(0);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_6500
     * @tc.name testArrayConstructor4065
     * @tc.desc Verify initializer creates NestedNullable with child=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<NestedNullable>(2, (i: int): NestedNullable => {
        const obj = new NestedNullable();
        obj.val = i;
        obj.child = null;
        return obj;
      });
      expect(arr.length).assertEqual(2);
      expect(arr[0].child).assertNull();
      expect(arr[1].child).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_6600
     * @tc.name testArrayConstructor4066
     * @tc.desc Verify initializer creates deep nested null chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new NestedNullable();
      parent.val = 1;
      const child = new NestedNullable();
      child.val = 2;
      child.child = null;
      parent.child = child;
      const arr = new Array<NestedNullable>(1, (i: int): NestedNullable => parent);
      const item = arr[0];
      expect(item.val).assertEqual(1);
      const itemChild = item.child;
      if (itemChild != null) {
        expect(itemChild.child).assertNull();
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_FOUR_6700
     * @tc.name testArrayConstructor4067
     * @tc.desc Verify initializer returns undefined for int|undefined array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor4067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(3, (i: int): int | undefined => {
        return i === 1 ? undefined : i * 10;
      });
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertEqual(20);
    });

  });
}
