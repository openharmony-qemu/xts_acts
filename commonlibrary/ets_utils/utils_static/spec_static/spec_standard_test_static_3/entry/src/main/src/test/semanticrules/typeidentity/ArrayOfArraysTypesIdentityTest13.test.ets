import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}

namespace testNS_1 {
  function cast_1(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_1(): boolean {
    let a_1: Array<number>[] = [[1, 3], [5, 7]]
    let b_1: Array<number[]> = cast_1(a_1)
    expect(a_1 instanceof Array).assertEqual(true)
    expect(a_1[0] instanceof Array).assertEqual(true)
    expect(a_1[1] instanceof Array).assertEqual(true)
    expect(b_1 instanceof Array).assertEqual(true)
    expect(b_1[0] instanceof Array).assertEqual(true)
    expect(b_1[1] instanceof Array).assertEqual(true)
    expect(b_1.length).assertEqual(2)
    expect(b_1[0].length).assertEqual(2)
    expect(b_1[1].length).assertEqual(2)
    expect(typeof b_1[0][0] === 'number').assertEqual(true)
    expect(b_1[0][0]).assertEqual(1)
    expect(typeof b_1[0][1] === 'number').assertEqual(true)
    expect(b_1[0][1]).assertEqual(3)
    expect(typeof b_1[1][0] === 'number').assertEqual(true)
    expect(b_1[1][0]).assertEqual(5)
    expect(typeof b_1[1][1] === 'number').assertEqual(true)
    expect(b_1[1][1]).assertEqual(7)
    a_1 = b_1
    expect(a_1 instanceof Array).assertEqual(true)
    expect(a_1[0] instanceof Array).assertEqual(true)
    expect(a_1[1] instanceof Array).assertEqual(true)
    expect(a_1.length).assertEqual(2)
    expect(a_1[0].length).assertEqual(2)
    expect(a_1[1].length).assertEqual(2)
    expect(typeof a_1[0][0] === 'number').assertEqual(true)
    expect(a_1[0][0]).assertEqual(1)
    expect(typeof a_1[0][1] === 'number').assertEqual(true)
    expect(a_1[0][1]).assertEqual(3)
    expect(typeof a_1[1][0] === 'number').assertEqual(true)
    expect(a_1[1][0]).assertEqual(5)
    expect(typeof a_1[1][1] === 'number').assertEqual(true)
    expect(a_1[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_2 {
  function cast_2(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_2(): boolean {
    let a_2: Array<number>[] = [[1, 3], [5, 7]]
    let b_2: Array<number[]> = cast_2(a_2)
    expect(a_2 instanceof Array).assertEqual(true)
    expect(a_2[0] instanceof Array).assertEqual(true)
    expect(a_2[1] instanceof Array).assertEqual(true)
    expect(b_2 instanceof Array).assertEqual(true)
    expect(b_2[0] instanceof Array).assertEqual(true)
    expect(b_2[1] instanceof Array).assertEqual(true)
    expect(b_2.length).assertEqual(2)
    expect(b_2[0].length).assertEqual(2)
    expect(b_2[1].length).assertEqual(2)
    expect(typeof b_2[0][0] === 'number').assertEqual(true)
    expect(b_2[0][0]).assertEqual(1)
    expect(typeof b_2[0][1] === 'number').assertEqual(true)
    expect(b_2[0][1]).assertEqual(3)
    expect(typeof b_2[1][0] === 'number').assertEqual(true)
    expect(b_2[1][0]).assertEqual(5)
    expect(typeof b_2[1][1] === 'number').assertEqual(true)
    expect(b_2[1][1]).assertEqual(7)
    a_2 = b_2
    expect(a_2 instanceof Array).assertEqual(true)
    expect(a_2[0] instanceof Array).assertEqual(true)
    expect(a_2[1] instanceof Array).assertEqual(true)
    expect(a_2.length).assertEqual(2)
    expect(a_2[0].length).assertEqual(2)
    expect(a_2[1].length).assertEqual(2)
    expect(typeof a_2[0][0] === 'number').assertEqual(true)
    expect(a_2[0][0]).assertEqual(1)
    expect(typeof a_2[0][1] === 'number').assertEqual(true)
    expect(a_2[0][1]).assertEqual(3)
    expect(typeof a_2[1][0] === 'number').assertEqual(true)
    expect(a_2[1][0]).assertEqual(5)
    expect(typeof a_2[1][1] === 'number').assertEqual(true)
    expect(a_2[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_3 {
  function cast_3(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_3(): boolean {
    let a_3: Array<number>[] = [[1, 3], [5, 7]]
    let b_3: Array<number[]> = cast_3(a_3)
    expect(a_3 instanceof Array).assertEqual(true)
    expect(a_3[0] instanceof Array).assertEqual(true)
    expect(a_3[1] instanceof Array).assertEqual(true)
    expect(b_3 instanceof Array).assertEqual(true)
    expect(b_3[0] instanceof Array).assertEqual(true)
    expect(b_3[1] instanceof Array).assertEqual(true)
    expect(b_3.length).assertEqual(2)
    expect(b_3[0].length).assertEqual(2)
    expect(b_3[1].length).assertEqual(2)
    expect(typeof b_3[0][0] === 'number').assertEqual(true)
    expect(b_3[0][0]).assertEqual(1)
    expect(typeof b_3[0][1] === 'number').assertEqual(true)
    expect(b_3[0][1]).assertEqual(3)
    expect(typeof b_3[1][0] === 'number').assertEqual(true)
    expect(b_3[1][0]).assertEqual(5)
    expect(typeof b_3[1][1] === 'number').assertEqual(true)
    expect(b_3[1][1]).assertEqual(7)
    a_3 = b_3
    expect(a_3 instanceof Array).assertEqual(true)
    expect(a_3[0] instanceof Array).assertEqual(true)
    expect(a_3[1] instanceof Array).assertEqual(true)
    expect(a_3.length).assertEqual(2)
    expect(a_3[0].length).assertEqual(2)
    expect(a_3[1].length).assertEqual(2)
    expect(typeof a_3[0][0] === 'number').assertEqual(true)
    expect(a_3[0][0]).assertEqual(1)
    expect(typeof a_3[0][1] === 'number').assertEqual(true)
    expect(a_3[0][1]).assertEqual(3)
    expect(typeof a_3[1][0] === 'number').assertEqual(true)
    expect(a_3[1][0]).assertEqual(5)
    expect(typeof a_3[1][1] === 'number').assertEqual(true)
    expect(a_3[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_4 {
  function cast_4(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_4(): boolean {
    let a_4: Array<number>[] = [[1, 3], [5, 7]]
    let b_4: Array<number[]> = cast_4(a_4)
    expect(a_4 instanceof Array).assertEqual(true)
    expect(a_4[0] instanceof Array).assertEqual(true)
    expect(a_4[1] instanceof Array).assertEqual(true)
    expect(b_4 instanceof Array).assertEqual(true)
    expect(b_4[0] instanceof Array).assertEqual(true)
    expect(b_4[1] instanceof Array).assertEqual(true)
    expect(b_4.length).assertEqual(2)
    expect(b_4[0].length).assertEqual(2)
    expect(b_4[1].length).assertEqual(2)
    expect(typeof b_4[0][0] === 'number').assertEqual(true)
    expect(b_4[0][0]).assertEqual(1)
    expect(typeof b_4[0][1] === 'number').assertEqual(true)
    expect(b_4[0][1]).assertEqual(3)
    expect(typeof b_4[1][0] === 'number').assertEqual(true)
    expect(b_4[1][0]).assertEqual(5)
    expect(typeof b_4[1][1] === 'number').assertEqual(true)
    expect(b_4[1][1]).assertEqual(7)
    a_4 = b_4
    expect(a_4 instanceof Array).assertEqual(true)
    expect(a_4[0] instanceof Array).assertEqual(true)
    expect(a_4[1] instanceof Array).assertEqual(true)
    expect(a_4.length).assertEqual(2)
    expect(a_4[0].length).assertEqual(2)
    expect(a_4[1].length).assertEqual(2)
    expect(typeof a_4[0][0] === 'number').assertEqual(true)
    expect(a_4[0][0]).assertEqual(1)
    expect(typeof a_4[0][1] === 'number').assertEqual(true)
    expect(a_4[0][1]).assertEqual(3)
    expect(typeof a_4[1][0] === 'number').assertEqual(true)
    expect(a_4[1][0]).assertEqual(5)
    expect(typeof a_4[1][1] === 'number').assertEqual(true)
    expect(a_4[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_5 {
  function cast_5(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_5(): boolean {
    let a_5: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_5: Array<number[]> = cast_5(a_5)
    expect(a_5 instanceof Array).assertEqual(true)
    expect(a_5[0] instanceof Array).assertEqual(true)
    expect(a_5[1] instanceof Array).assertEqual(true)
    expect(b_5 instanceof Array).assertEqual(true)
    expect(b_5[0] instanceof Array).assertEqual(true)
    expect(b_5[1] instanceof Array).assertEqual(true)
    expect(b_5.length).assertEqual(2)
    expect(b_5[0].length).assertEqual(2)
    expect(b_5[1].length).assertEqual(2)
    expect(typeof b_5[0][0] === 'number').assertEqual(true)
    expect(b_5[0][0]).assertEqual(1.5)
    expect(typeof b_5[0][1] === 'number').assertEqual(true)
    expect(b_5[0][1]).assertEqual(3.7)
    expect(typeof b_5[1][0] === 'number').assertEqual(true)
    expect(b_5[1][0]).assertEqual(5.4)
    expect(typeof b_5[1][1] === 'number').assertEqual(true)
    expect(b_5[1][1]).assertEqual(7.8)
    a_5 = b_5
    expect(a_5 instanceof Array).assertEqual(true)
    expect(a_5[0] instanceof Array).assertEqual(true)
    expect(a_5[1] instanceof Array).assertEqual(true)
    expect(a_5.length).assertEqual(2)
    expect(a_5[0].length).assertEqual(2)
    expect(a_5[1].length).assertEqual(2)
    expect(typeof a_5[0][0] === 'number').assertEqual(true)
    expect(a_5[0][0]).assertEqual(1.5)
    expect(typeof a_5[0][1] === 'number').assertEqual(true)
    expect(a_5[0][1]).assertEqual(3.7)
    expect(typeof a_5[1][0] === 'number').assertEqual(true)
    expect(a_5[1][0]).assertEqual(5.4)
    expect(typeof a_5[1][1] === 'number').assertEqual(true)
    expect(a_5[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_6 {
  function cast_6(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_6(): boolean {
    let a_6: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_6: Array<number[]> = cast_6(a_6)
    expect(a_6 instanceof Array).assertEqual(true)
    expect(a_6[0] instanceof Array).assertEqual(true)
    expect(a_6[1] instanceof Array).assertEqual(true)
    expect(b_6 instanceof Array).assertEqual(true)
    expect(b_6[0] instanceof Array).assertEqual(true)
    expect(b_6[1] instanceof Array).assertEqual(true)
    expect(b_6.length).assertEqual(2)
    expect(b_6[0].length).assertEqual(2)
    expect(b_6[1].length).assertEqual(2)
    expect(typeof b_6[0][0] === 'number').assertEqual(true)
    expect(b_6[0][0]).assertEqual(1.5)
    expect(typeof b_6[0][1] === 'number').assertEqual(true)
    expect(b_6[0][1]).assertEqual(3.7)
    expect(typeof b_6[1][0] === 'number').assertEqual(true)
    expect(b_6[1][0]).assertEqual(5.4)
    expect(typeof b_6[1][1] === 'number').assertEqual(true)
    expect(b_6[1][1]).assertEqual(7.8)
    a_6 = b_6
    expect(a_6 instanceof Array).assertEqual(true)
    expect(a_6[0] instanceof Array).assertEqual(true)
    expect(a_6[1] instanceof Array).assertEqual(true)
    expect(a_6.length).assertEqual(2)
    expect(a_6[0].length).assertEqual(2)
    expect(a_6[1].length).assertEqual(2)
    expect(typeof a_6[0][0] === 'number').assertEqual(true)
    expect(a_6[0][0]).assertEqual(1.5)
    expect(typeof a_6[0][1] === 'number').assertEqual(true)
    expect(a_6[0][1]).assertEqual(3.7)
    expect(typeof a_6[1][0] === 'number').assertEqual(true)
    expect(a_6[1][0]).assertEqual(5.4)
    expect(typeof a_6[1][1] === 'number').assertEqual(true)
    expect(a_6[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_7 {
  function cast_7(p: Object): Array<number[]> {
    return p as Array<number>[]
  }

  export function runTest_7(): boolean {
    let a_7: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_7: Array<number[]> = cast_7(a_7)
    expect(a_7 instanceof Array).assertEqual(true)
    expect(a_7[0] instanceof Array).assertEqual(true)
    expect(a_7[1] instanceof Array).assertEqual(true)
    expect(b_7 instanceof Array).assertEqual(true)
    expect(b_7[0] instanceof Array).assertEqual(true)
    expect(b_7[1] instanceof Array).assertEqual(true)
    expect(b_7.length).assertEqual(2)
    expect(b_7[0].length).assertEqual(2)
    expect(b_7[1].length).assertEqual(2)
    expect(typeof b_7[0][0] === 'number').assertEqual(true)
    expect(b_7[0][0]).assertEqual(1.5)
    expect(typeof b_7[0][1] === 'number').assertEqual(true)
    expect(b_7[0][1]).assertEqual(3.7)
    expect(typeof b_7[1][0] === 'number').assertEqual(true)
    expect(b_7[1][0]).assertEqual(5.4)
    expect(typeof b_7[1][1] === 'number').assertEqual(true)
    expect(b_7[1][1]).assertEqual(7.8)
    a_7 = b_7
    expect(a_7 instanceof Array).assertEqual(true)
    expect(a_7[0] instanceof Array).assertEqual(true)
    expect(a_7[1] instanceof Array).assertEqual(true)
    expect(a_7.length).assertEqual(2)
    expect(a_7[0].length).assertEqual(2)
    expect(a_7[1].length).assertEqual(2)
    expect(typeof a_7[0][0] === 'number').assertEqual(true)
    expect(a_7[0][0]).assertEqual(1.5)
    expect(typeof a_7[0][1] === 'number').assertEqual(true)
    expect(a_7[0][1]).assertEqual(3.7)
    expect(typeof a_7[1][0] === 'number').assertEqual(true)
    expect(a_7[1][0]).assertEqual(5.4)
    expect(typeof a_7[1][1] === 'number').assertEqual(true)
    expect(a_7[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_8 {
  function cast_8(p: Object): Array<bigint[]> {
    return p as Array<bigint>[]
  }

  export function runTest_8(): boolean {
    let a_8: Array<bigint>[] = [[1n, 3n], [5n, 7n]]
    let b_8: Array<bigint[]> = cast_8(a_8)
    expect(a_8 instanceof Array).assertEqual(true)
    expect(a_8[0] instanceof Array).assertEqual(true)
    expect(a_8[1] instanceof Array).assertEqual(true)
    expect(b_8 instanceof Array).assertEqual(true)
    expect(b_8[0] instanceof Array).assertEqual(true)
    expect(b_8[1] instanceof Array).assertEqual(true)
    expect(b_8.length).assertEqual(2)
    expect(b_8[0].length).assertEqual(2)
    expect(b_8[1].length).assertEqual(2)
    expect(typeof b_8[0][0] === 'bigint').assertEqual(true)
    expect(b_8[0][0]).assertEqual(1n)
    expect(typeof b_8[0][1] === 'bigint').assertEqual(true)
    expect(b_8[0][1]).assertEqual(3n)
    expect(typeof b_8[1][0] === 'bigint').assertEqual(true)
    expect(b_8[1][0]).assertEqual(5n)
    expect(typeof b_8[1][1] === 'bigint').assertEqual(true)
    expect(b_8[1][1]).assertEqual(7n)
    a_8 = b_8
    expect(a_8 instanceof Array).assertEqual(true)
    expect(a_8[0] instanceof Array).assertEqual(true)
    expect(a_8[1] instanceof Array).assertEqual(true)
    expect(a_8.length).assertEqual(2)
    expect(a_8[0].length).assertEqual(2)
    expect(a_8[1].length).assertEqual(2)
    expect(typeof a_8[0][0] === 'bigint').assertEqual(true)
    expect(a_8[0][0]).assertEqual(1n)
    expect(typeof a_8[0][1] === 'bigint').assertEqual(true)
    expect(a_8[0][1]).assertEqual(3n)
    expect(typeof a_8[1][0] === 'bigint').assertEqual(true)
    expect(a_8[1][0]).assertEqual(5n)
    expect(typeof a_8[1][1] === 'bigint').assertEqual(true)
    expect(a_8[1][1]).assertEqual(7n)
    return true
  }
}

namespace testNS_9 {
  function cast_9(p: Object): Array<string[]> {
    return p as Array<string>[]
  }

  export function runTest_9(): boolean {
    let a_9: Array<string>[] = [["ab", "c"], ["de", "f"]]
    let b_9: Array<string[]> = cast_9(a_9)
    expect(a_9 instanceof Array).assertEqual(true)
    expect(a_9[0] instanceof Array).assertEqual(true)
    expect(a_9[1] instanceof Array).assertEqual(true)
    expect(b_9 instanceof Array).assertEqual(true)
    expect(b_9[0] instanceof Array).assertEqual(true)
    expect(b_9[1] instanceof Array).assertEqual(true)
    expect(b_9.length).assertEqual(2)
    expect(b_9[0].length).assertEqual(2)
    expect(b_9[1].length).assertEqual(2)
    expect(typeof b_9[0][0] === 'string').assertEqual(true)
    expect(b_9[0][0]).assertEqual("ab")
    expect(typeof b_9[0][1] === 'string').assertEqual(true)
    expect(b_9[0][1]).assertEqual("c")
    expect(typeof b_9[1][0] === 'string').assertEqual(true)
    expect(b_9[1][0]).assertEqual("de")
    expect(typeof b_9[1][1] === 'string').assertEqual(true)
    expect(b_9[1][1]).assertEqual("f")
    a_9 = b_9
    expect(a_9 instanceof Array).assertEqual(true)
    expect(a_9[0] instanceof Array).assertEqual(true)
    expect(a_9[1] instanceof Array).assertEqual(true)
    expect(a_9.length).assertEqual(2)
    expect(a_9[0].length).assertEqual(2)
    expect(a_9[1].length).assertEqual(2)
    expect(typeof a_9[0][0] === 'string').assertEqual(true)
    expect(a_9[0][0]).assertEqual("ab")
    expect(typeof a_9[0][1] === 'string').assertEqual(true)
    expect(a_9[0][1]).assertEqual("c")
    expect(typeof a_9[1][0] === 'string').assertEqual(true)
    expect(a_9[1][0]).assertEqual("de")
    expect(typeof a_9[1][1] === 'string').assertEqual(true)
    expect(a_9[1][1]).assertEqual("f")
    return true
  }
}

namespace testNS_10 {
  function cast_10(p: Object): Array<string[]> {
    return p as Array<string>[]
  }

  export function runTest_10(): boolean {
    let a_10: Array<string>[] = [["a", "b"], ["c", "d"]]
    let b_10: Array<string[]> = cast_10(a_10)
    expect(a_10 instanceof Array).assertEqual(true)
    expect(a_10[0] instanceof Array).assertEqual(true)
    expect(a_10[1] instanceof Array).assertEqual(true)
    expect(b_10 instanceof Array).assertEqual(true)
    expect(b_10[0] instanceof Array).assertEqual(true)
    expect(b_10[1] instanceof Array).assertEqual(true)
    expect(b_10.length).assertEqual(2)
    expect(b_10[0].length).assertEqual(2)
    expect(b_10[1].length).assertEqual(2)
    expect(typeof b_10[0][0] === 'string').assertEqual(true)
    expect(b_10[0][0]).assertEqual("a")
    expect(typeof b_10[0][1] === 'string').assertEqual(true)
    expect(b_10[0][1]).assertEqual("b")
    expect(typeof b_10[1][0] === 'string').assertEqual(true)
    expect(b_10[1][0]).assertEqual("c")
    expect(typeof b_10[1][1] === 'string').assertEqual(true)
    expect(b_10[1][1]).assertEqual("d")
    a_10 = b_10
    expect(a_10 instanceof Array).assertEqual(true)
    expect(a_10[0] instanceof Array).assertEqual(true)
    expect(a_10[1] instanceof Array).assertEqual(true)
    expect(a_10.length).assertEqual(2)
    expect(a_10[0].length).assertEqual(2)
    expect(a_10[1].length).assertEqual(2)
    expect(typeof a_10[0][0] === 'string').assertEqual(true)
    expect(a_10[0][0]).assertEqual("a")
    expect(typeof a_10[0][1] === 'string').assertEqual(true)
    expect(a_10[0][1]).assertEqual("b")
    expect(typeof a_10[1][0] === 'string').assertEqual(true)
    expect(a_10[1][0]).assertEqual("c")
    expect(typeof a_10[1][1] === 'string').assertEqual(true)
    expect(a_10[1][1]).assertEqual("d")
    return true
  }
}

namespace testNS_11 {
  function cast_11(p: Object): Array<boolean[]> {
    return p as Array<boolean>[]
  }

  export function runTest_11(): boolean {
    let a_11: Array<boolean>[] = [[false, true], [true, false]]
    let b_11: Array<boolean[]> = cast_11(a_11)
    expect(a_11 instanceof Array).assertEqual(true)
    expect(a_11[0] instanceof Array).assertEqual(true)
    expect(a_11[1] instanceof Array).assertEqual(true)
    expect(b_11 instanceof Array).assertEqual(true)
    expect(b_11[0] instanceof Array).assertEqual(true)
    expect(b_11[1] instanceof Array).assertEqual(true)
    expect(b_11.length).assertEqual(2)
    expect(b_11[0].length).assertEqual(2)
    expect(b_11[1].length).assertEqual(2)
    expect(typeof b_11[0][0] === 'boolean').assertEqual(true)
    expect(b_11[0][0]).assertEqual(false)
    expect(typeof b_11[0][1] === 'boolean').assertEqual(true)
    expect(b_11[0][1]).assertEqual(true)
    expect(typeof b_11[1][0] === 'boolean').assertEqual(true)
    expect(b_11[1][0]).assertEqual(true)
    expect(typeof b_11[1][1] === 'boolean').assertEqual(true)
    expect(b_11[1][1]).assertEqual(false)
    a_11 = b_11
    expect(a_11 instanceof Array).assertEqual(true)
    expect(a_11[0] instanceof Array).assertEqual(true)
    expect(a_11[1] instanceof Array).assertEqual(true)
    expect(a_11.length).assertEqual(2)
    expect(a_11[0].length).assertEqual(2)
    expect(a_11[1].length).assertEqual(2)
    expect(typeof a_11[0][0] === 'boolean').assertEqual(true)
    expect(a_11[0][0]).assertEqual(false)
    expect(typeof a_11[0][1] === 'boolean').assertEqual(true)
    expect(a_11[0][1]).assertEqual(true)
    expect(typeof a_11[1][0] === 'boolean').assertEqual(true)
    expect(a_11[1][0]).assertEqual(true)
    expect(typeof a_11[1][1] === 'boolean').assertEqual(true)
    expect(a_11[1][1]).assertEqual(false)
    return true
  }
}

namespace testNS_12 {
  function cast_12(p: Object): Array<Object[]> {
    return p as Array<Object>[]
  }

  export function runTest_12(): boolean {
    let a_12: Array<Object>[] = [[1, 5n], ["abc", 17.6]]
    let b_12: Array<Object[]> = cast_12(a_12)
    expect(a_12 instanceof Array).assertEqual(true)
    expect(a_12[0] instanceof Array).assertEqual(true)
    expect(a_12[1] instanceof Array).assertEqual(true)
    expect(b_12 instanceof Array).assertEqual(true)
    expect(b_12[0] instanceof Array).assertEqual(true)
    expect(b_12[1] instanceof Array).assertEqual(true)
    expect(b_12.length).assertEqual(2)
    expect(b_12[0].length).assertEqual(2)
    expect(b_12[1].length).assertEqual(2)
    expect(b_12[0][0] instanceof Object).assertEqual(true)
    expect(b_12[0][0]).assertEqual(1)
    expect(b_12[0][1] instanceof Object).assertEqual(true)
    expect(b_12[0][1]).assertEqual(5n)
    expect(b_12[1][0] instanceof Object).assertEqual(true)
    expect(b_12[1][0]).assertEqual("abc")
    expect(b_12[1][1] instanceof Object).assertEqual(true)
    expect(b_12[1][1]).assertEqual(17.6)
    a_12 = b_12
    expect(a_12 instanceof Array).assertEqual(true)
    expect(a_12[0] instanceof Array).assertEqual(true)
    expect(a_12[1] instanceof Array).assertEqual(true)
    expect(a_12.length).assertEqual(2)
    expect(a_12[0].length).assertEqual(2)
    expect(a_12[1].length).assertEqual(2)
    expect(a_12[0][0] instanceof Object).assertEqual(true)
    expect(a_12[0][0]).assertEqual(1)
    expect(a_12[0][1] instanceof Object).assertEqual(true)
    expect(a_12[0][1]).assertEqual(5n)
    expect(a_12[1][0] instanceof Object).assertEqual(true)
    expect(a_12[1][0]).assertEqual("abc")
    expect(a_12[1][1] instanceof Object).assertEqual(true)
    expect(a_12[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_13 {
  function cast_13(p: Object): Array<Array<Object | undefined>> {
    return p as Array<Array<Object | undefined>>
  }

  export function runTest_13(): boolean {
    let a_13: Array<Object | undefined>[] = [[undefined, 5n], ["abc", 17.6]]
    let b_13: Array<Object | undefined>[] = cast_13(a_13)
    expect(a_13 instanceof Array).assertEqual(true)
    expect(a_13[0] instanceof Array).assertEqual(true)
    expect(a_13[1] instanceof Array).assertEqual(true)
    expect(b_13 instanceof Array).assertEqual(true)
    expect(b_13[0] instanceof Array).assertEqual(true)
    expect(b_13[1] instanceof Array).assertEqual(true)
    expect(b_13.length).assertEqual(2)
    expect(b_13[0].length).assertEqual(2)
    expect(b_13[1].length).assertEqual(2)
    expect(b_13[0][0] === undefined || b_13[0][0] instanceof Object).assertEqual(true)
    expect(b_13[0][0]).assertEqual(undefined)
    expect(b_13[0][1] instanceof Object).assertEqual(true)
    expect(b_13[0][1]).assertEqual(5n)
    expect(b_13[1][0] instanceof Object).assertEqual(true)
    expect(b_13[1][0]).assertEqual("abc")
    expect(b_13[1][1] instanceof Object).assertEqual(true)
    expect(b_13[1][1]).assertEqual(17.6)
    a_13 = b_13
    expect(a_13 instanceof Array).assertEqual(true)
    expect(a_13[0] instanceof Array).assertEqual(true)
    expect(a_13[1] instanceof Array).assertEqual(true)
    expect(a_13.length).assertEqual(2)
    expect(a_13[0].length).assertEqual(2)
    expect(a_13[1].length).assertEqual(2)
    expect(a_13[0][0] === undefined || a_13[0][0] instanceof Object).assertEqual(true)
    expect(a_13[0][0]).assertEqual(undefined)
    expect(a_13[0][1] instanceof Object).assertEqual(true)
    expect(a_13[0][1]).assertEqual(5n)
    expect(a_13[1][0] instanceof Object).assertEqual(true)
    expect(a_13[1][0]).assertEqual("abc")
    expect(a_13[1][1] instanceof Object).assertEqual(true)
    expect(a_13[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_14 {
  function cast_14(p: Object): Array<Array<Object | undefined | null>> {
    return p as Array<Array<Object | undefined | null>>
  }

  export function runTest_14(): boolean {
    let a_14: Array<Object | undefined | null>[] = [[undefined, 5n], [null, 17.6]]
    let b_14: Array<Object | undefined | null>[] = cast_14(a_14)
    expect(a_14 instanceof Array).assertEqual(true)
    expect(a_14[0] instanceof Array).assertEqual(true)
    expect(a_14[1] instanceof Array).assertEqual(true)
    expect(b_14 instanceof Array).assertEqual(true)
    expect(b_14[0] instanceof Array).assertEqual(true)
    expect(b_14[1] instanceof Array).assertEqual(true)
    expect(b_14.length).assertEqual(2)
    expect(b_14[0].length).assertEqual(2)
    expect(b_14[1].length).assertEqual(2)
    expect(b_14[0][0] === undefined || b_14[0][0] === null || b_14[0][0] instanceof Object).assertEqual(true)
    expect(b_14[0][0]).assertEqual(undefined)
    expect(b_14[0][1] instanceof Object).assertEqual(true)
    expect(b_14[0][1]).assertEqual(5n)
    expect(b_14[1][0] === null).assertEqual(true)
    expect(b_14[1][0]).assertEqual(null)
    expect(b_14[1][1] instanceof Object).assertEqual(true)
    expect(b_14[1][1]).assertEqual(17.6)
    a_14 = b_14
    expect(a_14 instanceof Array).assertEqual(true)
    expect(a_14[0] instanceof Array).assertEqual(true)
    expect(a_14[1] instanceof Array).assertEqual(true)
    expect(a_14.length).assertEqual(2)
    expect(a_14[0].length).assertEqual(2)
    expect(a_14[1].length).assertEqual(2)
    expect(a_14[0][0] === undefined || a_14[0][0] === null || a_14[0][0] instanceof Object).assertEqual(true)
    expect(a_14[0][0]).assertEqual(undefined)
    expect(a_14[0][1] instanceof Object).assertEqual(true)
    expect(a_14[0][1]).assertEqual(5n)
    expect(a_14[1][0] === null).assertEqual(true)
    expect(a_14[1][0]).assertEqual(null)
    expect(a_14[1][1] instanceof Object).assertEqual(true)
    expect(a_14[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_15 {
  function cast_15(p: Object): Array<Array<Object | undefined | null>> {
    return p as Array<Array<Object | undefined | null>>
  }

  export function runTest_15(): boolean {
    let a_15: Array<Object | undefined | null>[] = [[undefined, 5n], [null, 17.6]]
    let b_15: Array<Object | undefined | null>[] = cast_15(a_15)
    expect(a_15 instanceof Array).assertEqual(true)
    expect(a_15[0] instanceof Array).assertEqual(true)
    expect(a_15[1] instanceof Array).assertEqual(true)
    expect(b_15 instanceof Array).assertEqual(true)
    expect(b_15[0] instanceof Array).assertEqual(true)
    expect(b_15[1] instanceof Array).assertEqual(true)
    expect(b_15.length).assertEqual(2)
    expect(b_15[0].length).assertEqual(2)
    expect(b_15[1].length).assertEqual(2)
    expect(b_15[0][0] === undefined || b_15[0][0] === null || b_15[0][0] instanceof Object).assertEqual(true)
    expect(b_15[0][0]).assertEqual(undefined)
    expect(b_15[0][1] instanceof Object).assertEqual(true)
    expect(b_15[0][1]).assertEqual(5n)
    expect(b_15[1][0] === null).assertEqual(true)
    expect(b_15[1][0]).assertEqual(null)
    expect(b_15[1][1] instanceof Object).assertEqual(true)
    expect(b_15[1][1]).assertEqual(17.6)
    a_15 = b_15
    expect(a_15 instanceof Array).assertEqual(true)
    expect(a_15[0] instanceof Array).assertEqual(true)
    expect(a_15[1] instanceof Array).assertEqual(true)
    expect(a_15.length).assertEqual(2)
    expect(a_15[0].length).assertEqual(2)
    expect(a_15[1].length).assertEqual(2)
    expect(a_15[0][0] === undefined || a_15[0][0] === null || a_15[0][0] instanceof Object).assertEqual(true)
    expect(a_15[0][0]).assertEqual(undefined)
    expect(a_15[0][1] instanceof Object).assertEqual(true)
    expect(a_15[0][1]).assertEqual(5n)
    expect(a_15[1][0] === null).assertEqual(true)
    expect(a_15[1][0]).assertEqual(null)
    expect(a_15[1][1] instanceof Object).assertEqual(true)
    expect(a_15[1][1]).assertEqual(17.6)
    return true
  }
}

function cast1(p: Object): Array<number[]> {
  return p as Array<number>[]
}

namespace testNS_16 {
  function cast_16(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_16(): boolean {
    let a_16: Array<number>[] = [[1, 3], [5, 7]]
    let b_16: Array<number[]> = cast_16(a_16)
    expect(a_16 instanceof Array).assertEqual(true)
    expect(a_16[0] instanceof Array).assertEqual(true)
    expect(a_16[1] instanceof Array).assertEqual(true)
    expect(b_16 instanceof Array).assertEqual(true)
    expect(b_16[0] instanceof Array).assertEqual(true)
    expect(b_16[1] instanceof Array).assertEqual(true)
    expect(b_16.length).assertEqual(2)
    expect(b_16[0].length).assertEqual(2)
    expect(b_16[1].length).assertEqual(2)
    expect(typeof b_16[0][0] === 'number').assertEqual(true)
    expect(b_16[0][0]).assertEqual(1)
    expect(typeof b_16[0][1] === 'number').assertEqual(true)
    expect(b_16[0][1]).assertEqual(3)
    expect(typeof b_16[1][0] === 'number').assertEqual(true)
    expect(b_16[1][0]).assertEqual(5)
    expect(typeof b_16[1][1] === 'number').assertEqual(true)
    expect(b_16[1][1]).assertEqual(7)
    a_16 = b_16
    expect(a_16 instanceof Array).assertEqual(true)
    expect(a_16[0] instanceof Array).assertEqual(true)
    expect(a_16[1] instanceof Array).assertEqual(true)
    expect(a_16.length).assertEqual(2)
    expect(a_16[0].length).assertEqual(2)
    expect(a_16[1].length).assertEqual(2)
    expect(typeof a_16[0][0] === 'number').assertEqual(true)
    expect(a_16[0][0]).assertEqual(1)
    expect(typeof a_16[0][1] === 'number').assertEqual(true)
    expect(a_16[0][1]).assertEqual(3)
    expect(typeof a_16[1][0] === 'number').assertEqual(true)
    expect(a_16[1][0]).assertEqual(5)
    expect(typeof a_16[1][1] === 'number').assertEqual(true)
    expect(a_16[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_17 {
  function cast_17(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_17(): boolean {
    let a_17: Array<number>[] = [[1, 3], [5, 7]]
    let b_17: Array<number[]> = cast_17(a_17)
    expect(a_17 instanceof Array).assertEqual(true)
    expect(a_17[0] instanceof Array).assertEqual(true)
    expect(a_17[1] instanceof Array).assertEqual(true)
    expect(b_17 instanceof Array).assertEqual(true)
    expect(b_17[0] instanceof Array).assertEqual(true)
    expect(b_17[1] instanceof Array).assertEqual(true)
    expect(b_17.length).assertEqual(2)
    expect(b_17[0].length).assertEqual(2)
    expect(b_17[1].length).assertEqual(2)
    expect(typeof b_17[0][0] === 'number').assertEqual(true)
    expect(b_17[0][0]).assertEqual(1)
    expect(typeof b_17[0][1] === 'number').assertEqual(true)
    expect(b_17[0][1]).assertEqual(3)
    expect(typeof b_17[1][0] === 'number').assertEqual(true)
    expect(b_17[1][0]).assertEqual(5)
    expect(typeof b_17[1][1] === 'number').assertEqual(true)
    expect(b_17[1][1]).assertEqual(7)
    a_17 = b_17
    expect(a_17 instanceof Array).assertEqual(true)
    expect(a_17[0] instanceof Array).assertEqual(true)
    expect(a_17[1] instanceof Array).assertEqual(true)
    expect(a_17.length).assertEqual(2)
    expect(a_17[0].length).assertEqual(2)
    expect(a_17[1].length).assertEqual(2)
    expect(typeof a_17[0][0] === 'number').assertEqual(true)
    expect(a_17[0][0]).assertEqual(1)
    expect(typeof a_17[0][1] === 'number').assertEqual(true)
    expect(a_17[0][1]).assertEqual(3)
    expect(typeof a_17[1][0] === 'number').assertEqual(true)
    expect(a_17[1][0]).assertEqual(5)
    expect(typeof a_17[1][1] === 'number').assertEqual(true)
    expect(a_17[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_18 {
  function cast_18(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_18(): boolean {
    let a_18: Array<number>[] = [[1, 3], [5, 7]]
    let b_18: Array<number[]> = cast_18(a_18)
    expect(a_18 instanceof Array).assertEqual(true)
    expect(a_18[0] instanceof Array).assertEqual(true)
    expect(a_18[1] instanceof Array).assertEqual(true)
    expect(b_18 instanceof Array).assertEqual(true)
    expect(b_18[0] instanceof Array).assertEqual(true)
    expect(b_18[1] instanceof Array).assertEqual(true)
    expect(b_18.length).assertEqual(2)
    expect(b_18[0].length).assertEqual(2)
    expect(b_18[1].length).assertEqual(2)
    expect(typeof b_18[0][0] === 'number').assertEqual(true)
    expect(b_18[0][0]).assertEqual(1)
    expect(typeof b_18[0][1] === 'number').assertEqual(true)
    expect(b_18[0][1]).assertEqual(3)
    expect(typeof b_18[1][0] === 'number').assertEqual(true)
    expect(b_18[1][0]).assertEqual(5)
    expect(typeof b_18[1][1] === 'number').assertEqual(true)
    expect(b_18[1][1]).assertEqual(7)
    a_18 = b_18
    expect(a_18 instanceof Array).assertEqual(true)
    expect(a_18[0] instanceof Array).assertEqual(true)
    expect(a_18[1] instanceof Array).assertEqual(true)
    expect(a_18.length).assertEqual(2)
    expect(a_18[0].length).assertEqual(2)
    expect(a_18[1].length).assertEqual(2)
    expect(typeof a_18[0][0] === 'number').assertEqual(true)
    expect(a_18[0][0]).assertEqual(1)
    expect(typeof a_18[0][1] === 'number').assertEqual(true)
    expect(a_18[0][1]).assertEqual(3)
    expect(typeof a_18[1][0] === 'number').assertEqual(true)
    expect(a_18[1][0]).assertEqual(5)
    expect(typeof a_18[1][1] === 'number').assertEqual(true)
    expect(a_18[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_19 {
  function cast_19(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_19(): boolean {
    let a_19: Array<number>[] = [[1, 3], [5, 7]]
    let b_19: Array<number[]> = cast_19(a_19)
    expect(a_19 instanceof Array).assertEqual(true)
    expect(a_19[0] instanceof Array).assertEqual(true)
    expect(a_19[1] instanceof Array).assertEqual(true)
    expect(b_19 instanceof Array).assertEqual(true)
    expect(b_19[0] instanceof Array).assertEqual(true)
    expect(b_19[1] instanceof Array).assertEqual(true)
    expect(b_19.length).assertEqual(2)
    expect(b_19[0].length).assertEqual(2)
    expect(b_19[1].length).assertEqual(2)
    expect(typeof b_19[0][0] === 'number').assertEqual(true)
    expect(b_19[0][0]).assertEqual(1)
    expect(typeof b_19[0][1] === 'number').assertEqual(true)
    expect(b_19[0][1]).assertEqual(3)
    expect(typeof b_19[1][0] === 'number').assertEqual(true)
    expect(b_19[1][0]).assertEqual(5)
    expect(typeof b_19[1][1] === 'number').assertEqual(true)
    expect(b_19[1][1]).assertEqual(7)
    a_19 = b_19
    expect(a_19 instanceof Array).assertEqual(true)
    expect(a_19[0] instanceof Array).assertEqual(true)
    expect(a_19[1] instanceof Array).assertEqual(true)
    expect(a_19.length).assertEqual(2)
    expect(a_19[0].length).assertEqual(2)
    expect(a_19[1].length).assertEqual(2)
    expect(typeof a_19[0][0] === 'number').assertEqual(true)
    expect(a_19[0][0]).assertEqual(1)
    expect(typeof a_19[0][1] === 'number').assertEqual(true)
    expect(a_19[0][1]).assertEqual(3)
    expect(typeof a_19[1][0] === 'number').assertEqual(true)
    expect(a_19[1][0]).assertEqual(5)
    expect(typeof a_19[1][1] === 'number').assertEqual(true)
    expect(a_19[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_20 {
  function cast_20(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_20(): boolean {
    let a_20: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_20: Array<number[]> = cast_20(a_20)
    expect(a_20 instanceof Array).assertEqual(true)
    expect(a_20[0] instanceof Array).assertEqual(true)
    expect(a_20[1] instanceof Array).assertEqual(true)
    expect(b_20 instanceof Array).assertEqual(true)
    expect(b_20[0] instanceof Array).assertEqual(true)
    expect(b_20[1] instanceof Array).assertEqual(true)
    expect(b_20.length).assertEqual(2)
    expect(b_20[0].length).assertEqual(2)
    expect(b_20[1].length).assertEqual(2)
    expect(typeof b_20[0][0] === 'number').assertEqual(true)
    expect(b_20[0][0]).assertEqual(1.5)
    expect(typeof b_20[0][1] === 'number').assertEqual(true)
    expect(b_20[0][1]).assertEqual(3.7)
    expect(typeof b_20[1][0] === 'number').assertEqual(true)
    expect(b_20[1][0]).assertEqual(5.4)
    expect(typeof b_20[1][1] === 'number').assertEqual(true)
    expect(b_20[1][1]).assertEqual(7.8)
    a_20 = b_20
    expect(a_20 instanceof Array).assertEqual(true)
    expect(a_20[0] instanceof Array).assertEqual(true)
    expect(a_20[1] instanceof Array).assertEqual(true)
    expect(a_20.length).assertEqual(2)
    expect(a_20[0].length).assertEqual(2)
    expect(a_20[1].length).assertEqual(2)
    expect(typeof a_20[0][0] === 'number').assertEqual(true)
    expect(a_20[0][0]).assertEqual(1.5)
    expect(typeof a_20[0][1] === 'number').assertEqual(true)
    expect(a_20[0][1]).assertEqual(3.7)
    expect(typeof a_20[1][0] === 'number').assertEqual(true)
    expect(a_20[1][0]).assertEqual(5.4)
    expect(typeof a_20[1][1] === 'number').assertEqual(true)
    expect(a_20[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_21 {
  function cast_21(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_21(): boolean {
    let a_21: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_21: Array<number[]> = cast_21(a_21)
    expect(a_21 instanceof Array).assertEqual(true)
    expect(a_21[0] instanceof Array).assertEqual(true)
    expect(a_21[1] instanceof Array).assertEqual(true)
    expect(b_21 instanceof Array).assertEqual(true)
    expect(b_21[0] instanceof Array).assertEqual(true)
    expect(b_21[1] instanceof Array).assertEqual(true)
    expect(b_21.length).assertEqual(2)
    expect(b_21[0].length).assertEqual(2)
    expect(b_21[1].length).assertEqual(2)
    expect(typeof b_21[0][0] === 'number').assertEqual(true)
    expect(b_21[0][0]).assertEqual(1.5)
    expect(typeof b_21[0][1] === 'number').assertEqual(true)
    expect(b_21[0][1]).assertEqual(3.7)
    expect(typeof b_21[1][0] === 'number').assertEqual(true)
    expect(b_21[1][0]).assertEqual(5.4)
    expect(typeof b_21[1][1] === 'number').assertEqual(true)
    expect(b_21[1][1]).assertEqual(7.8)
    a_21 = b_21
    expect(a_21 instanceof Array).assertEqual(true)
    expect(a_21[0] instanceof Array).assertEqual(true)
    expect(a_21[1] instanceof Array).assertEqual(true)
    expect(a_21.length).assertEqual(2)
    expect(a_21[0].length).assertEqual(2)
    expect(a_21[1].length).assertEqual(2)
    expect(typeof a_21[0][0] === 'number').assertEqual(true)
    expect(a_21[0][0]).assertEqual(1.5)
    expect(typeof a_21[0][1] === 'number').assertEqual(true)
    expect(a_21[0][1]).assertEqual(3.7)
    expect(typeof a_21[1][0] === 'number').assertEqual(true)
    expect(a_21[1][0]).assertEqual(5.4)
    expect(typeof a_21[1][1] === 'number').assertEqual(true)
    expect(a_21[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_22 {
  function cast_22(p: Object): Array<number>[] {
    return p as Array<number[]>
  }

  export function runTest_22(): boolean {
    let a_22: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_22: Array<number[]> = cast_22(a_22)
    expect(a_22 instanceof Array).assertEqual(true)
    expect(a_22[0] instanceof Array).assertEqual(true)
    expect(a_22[1] instanceof Array).assertEqual(true)
    expect(b_22 instanceof Array).assertEqual(true)
    expect(b_22[0] instanceof Array).assertEqual(true)
    expect(b_22[1] instanceof Array).assertEqual(true)
    expect(b_22.length).assertEqual(2)
    expect(b_22[0].length).assertEqual(2)
    expect(b_22[1].length).assertEqual(2)
    expect(typeof b_22[0][0] === 'number').assertEqual(true)
    expect(b_22[0][0]).assertEqual(1.5)
    expect(typeof b_22[0][1] === 'number').assertEqual(true)
    expect(b_22[0][1]).assertEqual(3.7)
    expect(typeof b_22[1][0] === 'number').assertEqual(true)
    expect(b_22[1][0]).assertEqual(5.4)
    expect(typeof b_22[1][1] === 'number').assertEqual(true)
    expect(b_22[1][1]).assertEqual(7.8)
    a_22 = b_22
    expect(a_22 instanceof Array).assertEqual(true)
    expect(a_22[0] instanceof Array).assertEqual(true)
    expect(a_22[1] instanceof Array).assertEqual(true)
    expect(a_22.length).assertEqual(2)
    expect(a_22[0].length).assertEqual(2)
    expect(a_22[1].length).assertEqual(2)
    expect(typeof a_22[0][0] === 'number').assertEqual(true)
    expect(a_22[0][0]).assertEqual(1.5)
    expect(typeof a_22[0][1] === 'number').assertEqual(true)
    expect(a_22[0][1]).assertEqual(3.7)
    expect(typeof a_22[1][0] === 'number').assertEqual(true)
    expect(a_22[1][0]).assertEqual(5.4)
    expect(typeof a_22[1][1] === 'number').assertEqual(true)
    expect(a_22[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_23 {
  function cast_23(p: Object): Array<bigint>[] {
    return p as Array<bigint[]>
  }

  export function runTest_23(): boolean {
    let a_23: Array<bigint>[] = [[1n, 3n], [5n, 7n]]
    let b_23: Array<bigint[]> = cast_23(a_23)
    expect(a_23 instanceof Array).assertEqual(true)
    expect(a_23[0] instanceof Array).assertEqual(true)
    expect(a_23[1] instanceof Array).assertEqual(true)
    expect(b_23 instanceof Array).assertEqual(true)
    expect(b_23[0] instanceof Array).assertEqual(true)
    expect(b_23[1] instanceof Array).assertEqual(true)
    expect(b_23.length).assertEqual(2)
    expect(b_23[0].length).assertEqual(2)
    expect(b_23[1].length).assertEqual(2)
    expect(typeof b_23[0][0] === 'bigint').assertEqual(true)
    expect(b_23[0][0]).assertEqual(1n)
    expect(typeof b_23[0][1] === 'bigint').assertEqual(true)
    expect(b_23[0][1]).assertEqual(3n)
    expect(typeof b_23[1][0] === 'bigint').assertEqual(true)
    expect(b_23[1][0]).assertEqual(5n)
    expect(typeof b_23[1][1] === 'bigint').assertEqual(true)
    expect(b_23[1][1]).assertEqual(7n)
    a_23 = b_23
    expect(a_23 instanceof Array).assertEqual(true)
    expect(a_23[0] instanceof Array).assertEqual(true)
    expect(a_23[1] instanceof Array).assertEqual(true)
    expect(a_23.length).assertEqual(2)
    expect(a_23[0].length).assertEqual(2)
    expect(a_23[1].length).assertEqual(2)
    expect(typeof a_23[0][0] === 'bigint').assertEqual(true)
    expect(a_23[0][0]).assertEqual(1n)
    expect(typeof a_23[0][1] === 'bigint').assertEqual(true)
    expect(a_23[0][1]).assertEqual(3n)
    expect(typeof a_23[1][0] === 'bigint').assertEqual(true)
    expect(a_23[1][0]).assertEqual(5n)
    expect(typeof a_23[1][1] === 'bigint').assertEqual(true)
    expect(a_23[1][1]).assertEqual(7n)
    return true
  }
}

namespace testNS_24 {
  function cast_24(p: Object): Array<string>[] {
    return p as Array<string[]>
  }

  export function runTest_24(): boolean {
    let a_24: Array<string>[] = [["ab", "c"], ["de", "f"]]
    let b_24: Array<string[]> = cast_24(a_24)
    expect(a_24 instanceof Array).assertEqual(true)
    expect(a_24[0] instanceof Array).assertEqual(true)
    expect(a_24[1] instanceof Array).assertEqual(true)
    expect(b_24 instanceof Array).assertEqual(true)
    expect(b_24[0] instanceof Array).assertEqual(true)
    expect(b_24[1] instanceof Array).assertEqual(true)
    expect(b_24.length).assertEqual(2)
    expect(b_24[0].length).assertEqual(2)
    expect(b_24[1].length).assertEqual(2)
    expect(typeof b_24[0][0] === 'string').assertEqual(true)
    expect(b_24[0][0]).assertEqual("ab")
    expect(typeof b_24[0][1] === 'string').assertEqual(true)
    expect(b_24[0][1]).assertEqual("c")
    expect(typeof b_24[1][0] === 'string').assertEqual(true)
    expect(b_24[1][0]).assertEqual("de")
    expect(typeof b_24[1][1] === 'string').assertEqual(true)
    expect(b_24[1][1]).assertEqual("f")
    a_24 = b_24
    expect(a_24 instanceof Array).assertEqual(true)
    expect(a_24[0] instanceof Array).assertEqual(true)
    expect(a_24[1] instanceof Array).assertEqual(true)
    expect(a_24.length).assertEqual(2)
    expect(a_24[0].length).assertEqual(2)
    expect(a_24[1].length).assertEqual(2)
    expect(typeof a_24[0][0] === 'string').assertEqual(true)
    expect(a_24[0][0]).assertEqual("ab")
    expect(typeof a_24[0][1] === 'string').assertEqual(true)
    expect(a_24[0][1]).assertEqual("c")
    expect(typeof a_24[1][0] === 'string').assertEqual(true)
    expect(a_24[1][0]).assertEqual("de")
    expect(typeof a_24[1][1] === 'string').assertEqual(true)
    expect(a_24[1][1]).assertEqual("f")
    return true
  }
}

namespace testNS_25 {
  function cast_25(p: Object): Array<string>[] {
    return p as Array<string[]>
  }

  export function runTest_25(): boolean {
    let a_25: Array<string>[] = [["a", "b"], ["c", "d"]]
    let b_25: Array<string[]> = cast_25(a_25)
    expect(a_25 instanceof Array).assertEqual(true)
    expect(a_25[0] instanceof Array).assertEqual(true)
    expect(a_25[1] instanceof Array).assertEqual(true)
    expect(b_25 instanceof Array).assertEqual(true)
    expect(b_25[0] instanceof Array).assertEqual(true)
    expect(b_25[1] instanceof Array).assertEqual(true)
    expect(b_25.length).assertEqual(2)
    expect(b_25[0].length).assertEqual(2)
    expect(b_25[1].length).assertEqual(2)
    expect(typeof b_25[0][0] === 'string').assertEqual(true)
    expect(b_25[0][0]).assertEqual("a")
    expect(typeof b_25[0][1] === 'string').assertEqual(true)
    expect(b_25[0][1]).assertEqual("b")
    expect(typeof b_25[1][0] === 'string').assertEqual(true)
    expect(b_25[1][0]).assertEqual("c")
    expect(typeof b_25[1][1] === 'string').assertEqual(true)
    expect(b_25[1][1]).assertEqual("d")
    a_25 = b_25
    expect(a_25 instanceof Array).assertEqual(true)
    expect(a_25[0] instanceof Array).assertEqual(true)
    expect(a_25[1] instanceof Array).assertEqual(true)
    expect(a_25.length).assertEqual(2)
    expect(a_25[0].length).assertEqual(2)
    expect(a_25[1].length).assertEqual(2)
    expect(typeof a_25[0][0] === 'string').assertEqual(true)
    expect(a_25[0][0]).assertEqual("a")
    expect(typeof a_25[0][1] === 'string').assertEqual(true)
    expect(a_25[0][1]).assertEqual("b")
    expect(typeof a_25[1][0] === 'string').assertEqual(true)
    expect(a_25[1][0]).assertEqual("c")
    expect(typeof a_25[1][1] === 'string').assertEqual(true)
    expect(a_25[1][1]).assertEqual("d")
    return true
  }
}

namespace testNS_26 {
  function cast_26(p: Object): Array<boolean>[] {
    return p as Array<boolean[]>
  }

  export function runTest_26(): boolean {
    let a_26: Array<boolean>[] = [[false, true], [true, false]]
    let b_26: Array<boolean[]> = cast_26(a_26)
    expect(a_26 instanceof Array).assertEqual(true)
    expect(a_26[0] instanceof Array).assertEqual(true)
    expect(a_26[1] instanceof Array).assertEqual(true)
    expect(b_26 instanceof Array).assertEqual(true)
    expect(b_26[0] instanceof Array).assertEqual(true)
    expect(b_26[1] instanceof Array).assertEqual(true)
    expect(b_26.length).assertEqual(2)
    expect(b_26[0].length).assertEqual(2)
    expect(b_26[1].length).assertEqual(2)
    expect(typeof b_26[0][0] === 'boolean').assertEqual(true)
    expect(b_26[0][0]).assertEqual(false)
    expect(typeof b_26[0][1] === 'boolean').assertEqual(true)
    expect(b_26[0][1]).assertEqual(true)
    expect(typeof b_26[1][0] === 'boolean').assertEqual(true)
    expect(b_26[1][0]).assertEqual(true)
    expect(typeof b_26[1][1] === 'boolean').assertEqual(true)
    expect(b_26[1][1]).assertEqual(false)
    a_26 = b_26
    expect(a_26 instanceof Array).assertEqual(true)
    expect(a_26[0] instanceof Array).assertEqual(true)
    expect(a_26[1] instanceof Array).assertEqual(true)
    expect(a_26.length).assertEqual(2)
    expect(a_26[0].length).assertEqual(2)
    expect(a_26[1].length).assertEqual(2)
    expect(typeof a_26[0][0] === 'boolean').assertEqual(true)
    expect(a_26[0][0]).assertEqual(false)
    expect(typeof a_26[0][1] === 'boolean').assertEqual(true)
    expect(a_26[0][1]).assertEqual(true)
    expect(typeof a_26[1][0] === 'boolean').assertEqual(true)
    expect(a_26[1][0]).assertEqual(true)
    expect(typeof a_26[1][1] === 'boolean').assertEqual(true)
    expect(a_26[1][1]).assertEqual(false)
    return true
  }
}

namespace testNS_27 {
  function cast_27(p: Object): Array<Object>[] {
    return p as Array<Object[]>
  }

  export function runTest_27(): boolean {
    let a_27: Array<Object>[] = [[1, 5n], ["abc", 17.6]]
    let b_27: Array<Object[]> = cast_27(a_27)
    expect(a_27 instanceof Array).assertEqual(true)
    expect(a_27[0] instanceof Array).assertEqual(true)
    expect(a_27[1] instanceof Array).assertEqual(true)
    expect(b_27 instanceof Array).assertEqual(true)
    expect(b_27[0] instanceof Array).assertEqual(true)
    expect(b_27[1] instanceof Array).assertEqual(true)
    expect(b_27.length).assertEqual(2)
    expect(b_27[0].length).assertEqual(2)
    expect(b_27[1].length).assertEqual(2)
    expect(b_27[0][0] instanceof Object).assertEqual(true)
    expect(b_27[0][0]).assertEqual(1)
    expect(b_27[0][1] instanceof Object).assertEqual(true)
    expect(b_27[0][1]).assertEqual(5n)
    expect(b_27[1][0] instanceof Object).assertEqual(true)
    expect(b_27[1][0]).assertEqual("abc")
    expect(b_27[1][1] instanceof Object).assertEqual(true)
    expect(b_27[1][1]).assertEqual(17.6)
    a_27 = b_27
    expect(a_27 instanceof Array).assertEqual(true)
    expect(a_27[0] instanceof Array).assertEqual(true)
    expect(a_27[1] instanceof Array).assertEqual(true)
    expect(a_27.length).assertEqual(2)
    expect(a_27[0].length).assertEqual(2)
    expect(a_27[1].length).assertEqual(2)
    expect(a_27[0][0] instanceof Object).assertEqual(true)
    expect(a_27[0][0]).assertEqual(1)
    expect(a_27[0][1] instanceof Object).assertEqual(true)
    expect(a_27[0][1]).assertEqual(5n)
    expect(a_27[1][0] instanceof Object).assertEqual(true)
    expect(a_27[1][0]).assertEqual("abc")
    expect(a_27[1][1] instanceof Object).assertEqual(true)
    expect(a_27[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_28 {
  function cast_28(p: Object): Array<Array<Object | undefined>> {
    return p as Array<Array<Object | undefined>>
  }

  export function runTest_28(): boolean {
    let a_28: Array<Object | undefined>[] = [[undefined, 5n], ["abc", 17.6]]
    let b_28: Array<Object | undefined>[] = cast_28(a_28)
    expect(a_28 instanceof Array).assertEqual(true)
    expect(a_28[0] instanceof Array).assertEqual(true)
    expect(a_28[1] instanceof Array).assertEqual(true)
    expect(b_28 instanceof Array).assertEqual(true)
    expect(b_28[0] instanceof Array).assertEqual(true)
    expect(b_28[1] instanceof Array).assertEqual(true)
    expect(b_28.length).assertEqual(2)
    expect(b_28[0].length).assertEqual(2)
    expect(b_28[1].length).assertEqual(2)
    expect(b_28[0][0] === undefined || b_28[0][0] instanceof Object).assertEqual(true)
    expect(b_28[0][0]).assertEqual(undefined)
    expect(b_28[0][1] instanceof Object).assertEqual(true)
    expect(b_28[0][1]).assertEqual(5n)
    expect(b_28[1][0] instanceof Object).assertEqual(true)
    expect(b_28[1][0]).assertEqual("abc")
    expect(b_28[1][1] instanceof Object).assertEqual(true)
    expect(b_28[1][1]).assertEqual(17.6)
    a_28 = b_28
    expect(a_28 instanceof Array).assertEqual(true)
    expect(a_28[0] instanceof Array).assertEqual(true)
    expect(a_28[1] instanceof Array).assertEqual(true)
    expect(a_28.length).assertEqual(2)
    expect(a_28[0].length).assertEqual(2)
    expect(a_28[1].length).assertEqual(2)
    expect(a_28[0][0] === undefined || a_28[0][0] instanceof Object).assertEqual(true)
    expect(a_28[0][0]).assertEqual(undefined)
    expect(a_28[0][1] instanceof Object).assertEqual(true)
    expect(a_28[0][1]).assertEqual(5n)
    expect(a_28[1][0] instanceof Object).assertEqual(true)
    expect(a_28[1][0]).assertEqual("abc")
    expect(a_28[1][1] instanceof Object).assertEqual(true)
    expect(a_28[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_29 {
  function cast_29(p: Object): Array<Array<Object | undefined | null>> {
    return p as Array<Array<Object | undefined | null>>
  }

  export function runTest_29(): boolean {
    let a_29: Array<Object | undefined | null>[] = [[undefined, 5n], [null, 17.6]]
    let b_29: Array<Object | undefined | null>[] = cast_29(a_29)
    expect(a_29 instanceof Array).assertEqual(true)
    expect(a_29[0] instanceof Array).assertEqual(true)
    expect(a_29[1] instanceof Array).assertEqual(true)
    expect(b_29 instanceof Array).assertEqual(true)
    expect(b_29[0] instanceof Array).assertEqual(true)
    expect(b_29[1] instanceof Array).assertEqual(true)
    expect(b_29.length).assertEqual(2)
    expect(b_29[0].length).assertEqual(2)
    expect(b_29[1].length).assertEqual(2)
    expect(b_29[0][0] === undefined || b_29[0][0] === null || b_29[0][0] instanceof Object).assertEqual(true)
    expect(b_29[0][0]).assertEqual(undefined)
    expect(b_29[0][1] instanceof Object).assertEqual(true)
    expect(b_29[0][1]).assertEqual(5n)
    expect(b_29[1][0] === null).assertEqual(true)
    expect(b_29[1][0]).assertEqual(null)
    expect(b_29[1][1] instanceof Object).assertEqual(true)
    expect(b_29[1][1]).assertEqual(17.6)
    a_29 = b_29
    expect(a_29 instanceof Array).assertEqual(true)
    expect(a_29[0] instanceof Array).assertEqual(true)
    expect(a_29[1] instanceof Array).assertEqual(true)
    expect(a_29.length).assertEqual(2)
    expect(a_29[0].length).assertEqual(2)
    expect(a_29[1].length).assertEqual(2)
    expect(a_29[0][0] === undefined || a_29[0][0] === null || a_29[0][0] instanceof Object).assertEqual(true)
    expect(a_29[0][0]).assertEqual(undefined)
    expect(a_29[0][1] instanceof Object).assertEqual(true)
    expect(a_29[0][1]).assertEqual(5n)
    expect(a_29[1][0] === null).assertEqual(true)
    expect(a_29[1][0]).assertEqual(null)
    expect(a_29[1][1] instanceof Object).assertEqual(true)
    expect(a_29[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_30 {
  function cast_30(p: Object): Array<Array<Object | undefined | null>> {
    return p as Array<Array<Object | undefined | null>>
  }

  export function runTest_30(): boolean {
    let a_30: Array<Object | undefined | null>[] = [[undefined, 5n], [null, 17.6]]
    let b_30: Array<Object | undefined | null>[] = cast_30(a_30)
    expect(a_30 instanceof Array).assertEqual(true)
    expect(a_30[0] instanceof Array).assertEqual(true)
    expect(a_30[1] instanceof Array).assertEqual(true)
    expect(b_30 instanceof Array).assertEqual(true)
    expect(b_30[0] instanceof Array).assertEqual(true)
    expect(b_30[1] instanceof Array).assertEqual(true)
    expect(b_30.length).assertEqual(2)
    expect(b_30[0].length).assertEqual(2)
    expect(b_30[1].length).assertEqual(2)
    expect(b_30[0][0] === undefined || b_30[0][0] === null || b_30[0][0] instanceof Object).assertEqual(true)
    expect(b_30[0][0]).assertEqual(undefined)
    expect(b_30[0][1] instanceof Object).assertEqual(true)
    expect(b_30[0][1]).assertEqual(5n)
    expect(b_30[1][0] === null).assertEqual(true)
    expect(b_30[1][0]).assertEqual(null)
    expect(b_30[1][1] instanceof Object).assertEqual(true)
    expect(b_30[1][1]).assertEqual(17.6)
    a_30 = b_30
    expect(a_30 instanceof Array).assertEqual(true)
    expect(a_30[0] instanceof Array).assertEqual(true)
    expect(a_30[1] instanceof Array).assertEqual(true)
    expect(a_30.length).assertEqual(2)
    expect(a_30[0].length).assertEqual(2)
    expect(a_30[1].length).assertEqual(2)
    expect(a_30[0][0] === undefined || a_30[0][0] === null || a_30[0][0] instanceof Object).assertEqual(true)
    expect(a_30[0][0]).assertEqual(undefined)
    expect(a_30[0][1] instanceof Object).assertEqual(true)
    expect(a_30[0][1]).assertEqual(5n)
    expect(a_30[1][0] === null).assertEqual(true)
    expect(a_30[1][0]).assertEqual(null)
    expect(a_30[1][1] instanceof Object).assertEqual(true)
    expect(a_30[1][1]).assertEqual(17.6)
    return true
  }
}

function cast2(p: Object): Array<number>[] {
  return p as Array<number[]>
}


export default function ArrayOfArraysTypesIdentityTest13():void {
  describe('ArrayOfArraysTypesIdentityTest13', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_3100
     * @tc.name      testArrayOfArraysTypesIdentity0031
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
  types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testArrayOfArraysTypesIdentity0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = ' testArrayOfArraysTypesIdentity0031';
       

      let a: Array<number>[] = [[1, 3], [5, 7]]
      let b: Array<number[]> = cast1(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(typeof b[0][0] === 'number').assertEqual(true)
      expect(b[0][0]).assertEqual(1)
      expect(typeof b[0][1] === 'number').assertEqual(true)
      expect(b[0][1]).assertEqual(3)
      expect(typeof b[1][0] === 'number').assertEqual(true)
      expect(b[1][0]).assertEqual(5)
      expect(typeof b[1][1] === 'number').assertEqual(true)
      expect(b[1][1]).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(typeof a[0][0] === 'number').assertEqual(true)
      expect(a[0][0]).assertEqual(1)
      expect(typeof a[0][1] === 'number').assertEqual(true)
      expect(a[0][1]).assertEqual(3)
      expect(typeof a[1][0] === 'number').assertEqual(true)
      expect(a[1][0]).assertEqual(5)
      expect(typeof a[1][1] === 'number').assertEqual(true)
      expect(a[1][1]).assertEqual(7)

      expect(testNS_1.runTest_1()).assertEqual(true)
      expect(testNS_2.runTest_2()).assertEqual(true)
      expect(testNS_3.runTest_3()).assertEqual(true)
      expect(testNS_4.runTest_4()).assertEqual(true)
      expect(testNS_5.runTest_5()).assertEqual(true)
      expect(testNS_6.runTest_6()).assertEqual(true)
      expect(testNS_7.runTest_7()).assertEqual(true)
      expect(testNS_8.runTest_8()).assertEqual(true)
      expect(testNS_9.runTest_9()).assertEqual(true)
      expect(testNS_10.runTest_10()).assertEqual(true)
      expect(testNS_11.runTest_11()).assertEqual(true)
      expect(testNS_12.runTest_12()).assertEqual(true)
      expect(testNS_13.runTest_13()).assertEqual(true)
      expect(testNS_14.runTest_14()).assertEqual(true)
      expect(testNS_15.runTest_15()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_3200
     * @tc.name      testArrayOfArraysTypesIdentity0032
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
  types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testArrayOfArraysTypesIdentity0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = ' testArrayOfArraysTypesIdentity0032';
       

      let a: Array<number>[] = [[1, 3], [5, 7]]
      let b: Array<number[]> = cast2(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(typeof b[0][0] === 'number').assertEqual(true)
      expect(b[0][0]).assertEqual(1)
      expect(typeof b[0][1] === 'number').assertEqual(true)
      expect(b[0][1]).assertEqual(3)
      expect(typeof b[1][0] === 'number').assertEqual(true)
      expect(b[1][0]).assertEqual(5)
      expect(typeof b[1][1] === 'number').assertEqual(true)
      expect(b[1][1]).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(typeof a[0][0] === 'number').assertEqual(true)
      expect(a[0][0]).assertEqual(1)
      expect(typeof a[0][1] === 'number').assertEqual(true)
      expect(a[0][1]).assertEqual(3)
      expect(typeof a[1][0] === 'number').assertEqual(true)
      expect(a[1][0]).assertEqual(5)
      expect(typeof a[1][1] === 'number').assertEqual(true)
      expect(a[1][1]).assertEqual(7)

      expect(testNS_16.runTest_16()).assertEqual(true)
      expect(testNS_17.runTest_17()).assertEqual(true)
      expect(testNS_18.runTest_18()).assertEqual(true)
      expect(testNS_19.runTest_19()).assertEqual(true)
      expect(testNS_20.runTest_20()).assertEqual(true)
      expect(testNS_21.runTest_21()).assertEqual(true)
      expect(testNS_22.runTest_22()).assertEqual(true)
      expect(testNS_23.runTest_23()).assertEqual(true)
      expect(testNS_24.runTest_24()).assertEqual(true)
      expect(testNS_25.runTest_25()).assertEqual(true)
      expect(testNS_26.runTest_26()).assertEqual(true)
      expect(testNS_27.runTest_27()).assertEqual(true)
      expect(testNS_28.runTest_28()).assertEqual(true)
      expect(testNS_29.runTest_29()).assertEqual(true)
      expect(testNS_30.runTest_30()).assertEqual(true)

    });
  })
}