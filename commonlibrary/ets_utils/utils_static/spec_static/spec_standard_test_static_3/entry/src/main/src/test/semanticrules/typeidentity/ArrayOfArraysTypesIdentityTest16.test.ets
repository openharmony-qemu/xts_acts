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

class C1 {
  data: number = 0
}

namespace testNS_1 {
  class C_1 {
    data_1: number = 0
  }

  function cast_1(p: Object): Array<C_1[]> {
    return p as Array<C_1>[]
  }

  export function runTest_1(): boolean {
    let a_1: C_1[][] = [[{data_1: 1} as C_1, {data_1: 3} as C_1], [{data_1: 5} as C_1, {data_1: 7} as C_1]]
    let b_1: Array<Array<C_1>> = cast_1(a_1)
    expect(a_1 instanceof Array).assertEqual(true)
    expect(a_1[0] instanceof Array).assertEqual(true)
    expect(a_1[1] instanceof Array).assertEqual(true)
    expect(b_1 instanceof Array).assertEqual(true)
    expect(b_1[0] instanceof Array).assertEqual(true)
    expect(b_1[1] instanceof Array).assertEqual(true)
    expect(b_1.length).assertEqual(2)
    expect(b_1[0].length).assertEqual(2)
    expect(b_1[1].length).assertEqual(2)
    expect(b_1[0][0] instanceof C_1).assertEqual(true)
    expect(typeof b_1[0][0].data_1 === 'number').assertEqual(true)
    expect(b_1[0][0].data_1).assertEqual(1)
    expect(b_1[0][1] instanceof C_1).assertEqual(true)
    expect(typeof b_1[0][1].data_1 === 'number').assertEqual(true)
    expect(b_1[0][1].data_1).assertEqual(3)
    expect(b_1[1][0] instanceof C_1).assertEqual(true)
    expect(typeof b_1[1][0].data_1 === 'number').assertEqual(true)
    expect(b_1[1][0].data_1).assertEqual(5)
    expect(b_1[1][1] instanceof C_1).assertEqual(true)
    expect(typeof b_1[1][1].data_1 === 'number').assertEqual(true)
    expect(b_1[1][1].data_1).assertEqual(7)
    a_1 = b_1
    expect(a_1 instanceof Array).assertEqual(true)
    expect(a_1[0] instanceof Array).assertEqual(true)
    expect(a_1[1] instanceof Array).assertEqual(true)
    expect(a_1.length).assertEqual(2)
    expect(a_1[0].length).assertEqual(2)
    expect(a_1[1].length).assertEqual(2)
    expect(a_1[0][0] instanceof C_1).assertEqual(true)
    expect(typeof a_1[0][0].data_1 === 'number').assertEqual(true)
    expect(a_1[0][0].data_1).assertEqual(1)
    expect(a_1[0][1] instanceof C_1).assertEqual(true)
    expect(typeof a_1[0][1].data_1 === 'number').assertEqual(true)
    expect(a_1[0][1].data_1).assertEqual(3)
    expect(a_1[1][0] instanceof C_1).assertEqual(true)
    expect(typeof a_1[1][0].data_1 === 'number').assertEqual(true)
    expect(a_1[1][0].data_1).assertEqual(5)
    expect(a_1[1][1] instanceof C_1).assertEqual(true)
    expect(typeof a_1[1][1].data_1 === 'number').assertEqual(true)
    expect(a_1[1][1].data_1).assertEqual(7)
    return true
  }
}

function cast1(p: Object): Array<C1[]> {
  return p as Array<C1>[]
}

class C2 {
  data: number = 0
}

namespace testNS_2 {
  class C_2 {
    data_2: number = 0
  }

  function cast_2(p: Object): Array<C_2>[] {
    return p as Array<C_2[]>
  }

  export function runTest_2(): boolean {
    let a_2: C_2[][] = [[{data_2: 1} as C_2, {data_2: 3} as C_2], [{data_2: 5} as C_2, {data_2: 7} as C_2]]
    let b_2: Array<Array<C_2>> = cast_2(a_2)
    expect(a_2 instanceof Array).assertEqual(true)
    expect(a_2[0] instanceof Array).assertEqual(true)
    expect(a_2[1] instanceof Array).assertEqual(true)
    expect(b_2 instanceof Array).assertEqual(true)
    expect(b_2[0] instanceof Array).assertEqual(true)
    expect(b_2[1] instanceof Array).assertEqual(true)
    expect(b_2.length).assertEqual(2)
    expect(b_2[0].length).assertEqual(2)
    expect(b_2[1].length).assertEqual(2)
    expect(b_2[0][0] instanceof C_2).assertEqual(true)
    expect(typeof b_2[0][0].data_2 === 'number').assertEqual(true)
    expect(b_2[0][0].data_2).assertEqual(1)
    expect(b_2[0][1] instanceof C_2).assertEqual(true)
    expect(typeof b_2[0][1].data_2 === 'number').assertEqual(true)
    expect(b_2[0][1].data_2).assertEqual(3)
    expect(b_2[1][0] instanceof C_2).assertEqual(true)
    expect(typeof b_2[1][0].data_2 === 'number').assertEqual(true)
    expect(b_2[1][0].data_2).assertEqual(5)
    expect(b_2[1][1] instanceof C_2).assertEqual(true)
    expect(typeof b_2[1][1].data_2 === 'number').assertEqual(true)
    expect(b_2[1][1].data_2).assertEqual(7)
    a_2 = b_2
    expect(a_2 instanceof Array).assertEqual(true)
    expect(a_2[0] instanceof Array).assertEqual(true)
    expect(a_2[1] instanceof Array).assertEqual(true)
    expect(a_2.length).assertEqual(2)
    expect(a_2[0].length).assertEqual(2)
    expect(a_2[1].length).assertEqual(2)
    expect(a_2[0][0] instanceof C_2).assertEqual(true)
    expect(typeof a_2[0][0].data_2 === 'number').assertEqual(true)
    expect(a_2[0][0].data_2).assertEqual(1)
    expect(a_2[0][1] instanceof C_2).assertEqual(true)
    expect(typeof a_2[0][1].data_2 === 'number').assertEqual(true)
    expect(a_2[0][1].data_2).assertEqual(3)
    expect(a_2[1][0] instanceof C_2).assertEqual(true)
    expect(typeof a_2[1][0].data_2 === 'number').assertEqual(true)
    expect(a_2[1][0].data_2).assertEqual(5)
    expect(a_2[1][1] instanceof C_2).assertEqual(true)
    expect(typeof a_2[1][1].data_2 === 'number').assertEqual(true)
    expect(a_2[1][1].data_2).assertEqual(7)
    return true
  }
}

function cast2(p: Object): Array<C2>[] {
  return p as Array<C2[]>
}

class C3 {
  data: number = 0
}

namespace testNS_3 {
  class C_3 {
    data_3: number = 0
  }

  function cast_3(p: Object): Array<Array<C_3>> {
    return p as Array<Array<C_3>>
  }

  export function runTest_3(): boolean {
    let a_3: Array<Array<C_3>> = [[{data_3: 1} as C_3, {data_3: 3} as C_3], [{data_3: 5} as C_3, {data_3: 7} as C_3]]
    let b_3: C_3[][] = cast_3(a_3)
    expect(a_3 instanceof Array).assertEqual(true)
    expect(a_3[0] instanceof Array).assertEqual(true)
    expect(a_3[1] instanceof Array).assertEqual(true)
    expect(b_3 instanceof Array).assertEqual(true)
    expect(b_3[0] instanceof Array).assertEqual(true)
    expect(b_3[1] instanceof Array).assertEqual(true)
    expect(b_3.length).assertEqual(2)
    expect(b_3[0].length).assertEqual(2)
    expect(b_3[1].length).assertEqual(2)
    expect(b_3[0][0] instanceof C_3).assertEqual(true)
    expect(typeof b_3[0][0].data_3 === 'number').assertEqual(true)
    expect(b_3[0][0].data_3).assertEqual(1)
    expect(b_3[0][1] instanceof C_3).assertEqual(true)
    expect(typeof b_3[0][1].data_3 === 'number').assertEqual(true)
    expect(b_3[0][1].data_3).assertEqual(3)
    expect(b_3[1][0] instanceof C_3).assertEqual(true)
    expect(typeof b_3[1][0].data_3 === 'number').assertEqual(true)
    expect(b_3[1][0].data_3).assertEqual(5)
    expect(b_3[1][1] instanceof C_3).assertEqual(true)
    expect(typeof b_3[1][1].data_3 === 'number').assertEqual(true)
    expect(b_3[1][1].data_3).assertEqual(7)
    a_3 = b_3
    expect(a_3 instanceof Array).assertEqual(true)
    expect(a_3[0] instanceof Array).assertEqual(true)
    expect(a_3[1] instanceof Array).assertEqual(true)
    expect(a_3.length).assertEqual(2)
    expect(a_3[0].length).assertEqual(2)
    expect(a_3[1].length).assertEqual(2)
    expect(a_3[0][0] instanceof C_3).assertEqual(true)
    expect(typeof a_3[0][0].data_3 === 'number').assertEqual(true)
    expect(a_3[0][0].data_3).assertEqual(1)
    expect(a_3[0][1] instanceof C_3).assertEqual(true)
    expect(typeof a_3[0][1].data_3 === 'number').assertEqual(true)
    expect(a_3[0][1].data_3).assertEqual(3)
    expect(a_3[1][0] instanceof C_3).assertEqual(true)
    expect(typeof a_3[1][0].data_3 === 'number').assertEqual(true)
    expect(a_3[1][0].data_3).assertEqual(5)
    expect(a_3[1][1] instanceof C_3).assertEqual(true)
    expect(typeof a_3[1][1].data_3 === 'number').assertEqual(true)
    expect(a_3[1][1].data_3).assertEqual(7)
    return true
  }
}

function cast3(p: Object): Array<Array<C3>> {
  return p as Array<Array<C3>>
}

class C4 {
  data: number = 0
}

namespace testNS_4 {
  class C_4 {
    data_4: number = 0
  }

  function cast_4(p: Object): C_4[][] {
    return p as C_4[][]
  }

  export function runTest_4(): boolean {
    let a_4: Array<Array<C_4>> = [[{data_4: 1} as C_4, {data_4: 3} as C_4], [{data_4: 5} as C_4, {data_4: 7} as C_4]]
    let b_4: C_4[][] = cast_4(a_4)
    expect(a_4 instanceof Array).assertEqual(true)
    expect(a_4[0] instanceof Array).assertEqual(true)
    expect(a_4[1] instanceof Array).assertEqual(true)
    expect(b_4 instanceof Array).assertEqual(true)
    expect(b_4[0] instanceof Array).assertEqual(true)
    expect(b_4[1] instanceof Array).assertEqual(true)
    expect(b_4.length).assertEqual(2)
    expect(b_4[0].length).assertEqual(2)
    expect(b_4[1].length).assertEqual(2)
    expect(b_4[0][0] instanceof C_4).assertEqual(true)
    expect(typeof b_4[0][0].data_4 === 'number').assertEqual(true)
    expect(b_4[0][0].data_4).assertEqual(1)
    expect(b_4[0][1] instanceof C_4).assertEqual(true)
    expect(typeof b_4[0][1].data_4 === 'number').assertEqual(true)
    expect(b_4[0][1].data_4).assertEqual(3)
    expect(b_4[1][0] instanceof C_4).assertEqual(true)
    expect(typeof b_4[1][0].data_4 === 'number').assertEqual(true)
    expect(b_4[1][0].data_4).assertEqual(5)
    expect(b_4[1][1] instanceof C_4).assertEqual(true)
    expect(typeof b_4[1][1].data_4 === 'number').assertEqual(true)
    expect(b_4[1][1].data_4).assertEqual(7)
    a_4 = b_4
    expect(a_4 instanceof Array).assertEqual(true)
    expect(a_4[0] instanceof Array).assertEqual(true)
    expect(a_4[1] instanceof Array).assertEqual(true)
    expect(a_4.length).assertEqual(2)
    expect(a_4[0].length).assertEqual(2)
    expect(a_4[1].length).assertEqual(2)
    expect(a_4[0][0] instanceof C_4).assertEqual(true)
    expect(typeof a_4[0][0].data_4 === 'number').assertEqual(true)
    expect(a_4[0][0].data_4).assertEqual(1)
    expect(a_4[0][1] instanceof C_4).assertEqual(true)
    expect(typeof a_4[0][1].data_4 === 'number').assertEqual(true)
    expect(a_4[0][1].data_4).assertEqual(3)
    expect(a_4[1][0] instanceof C_4).assertEqual(true)
    expect(typeof a_4[1][0].data_4 === 'number').assertEqual(true)
    expect(a_4[1][0].data_4).assertEqual(5)
    expect(a_4[1][1] instanceof C_4).assertEqual(true)
    expect(typeof a_4[1][1].data_4 === 'number').assertEqual(true)
    expect(a_4[1][1].data_4).assertEqual(7)
    return true
  }
}

function cast4(p: Object): C4[][] {
  return p as C4[][]
}

class C5 {
  data: number = 0
}

namespace testNS_5 {
  class C_5 {
    data_5: number = 0
  }

  function cast_5(p: Object): Array<C_5>[] {
    return p as Array<C_5>[]
  }

  export function runTest_5(): boolean {
    let a_5: Array<Array<C_5>> = [[{data_5: 1} as C_5, {data_5: 3} as C_5], [{data_5: 5} as C_5, {data_5: 7} as C_5]]
    let b_5: C_5[][] = cast_5(a_5)
    expect(a_5 instanceof Array).assertEqual(true)
    expect(a_5[0] instanceof Array).assertEqual(true)
    expect(a_5[1] instanceof Array).assertEqual(true)
    expect(b_5 instanceof Array).assertEqual(true)
    expect(b_5[0] instanceof Array).assertEqual(true)
    expect(b_5[1] instanceof Array).assertEqual(true)
    expect(b_5.length).assertEqual(2)
    expect(b_5[0].length).assertEqual(2)
    expect(b_5[1].length).assertEqual(2)
    expect(b_5[0][0] instanceof C_5).assertEqual(true)
    expect(typeof b_5[0][0].data_5 === 'number').assertEqual(true)
    expect(b_5[0][0].data_5).assertEqual(1)
    expect(b_5[0][1] instanceof C_5).assertEqual(true)
    expect(typeof b_5[0][1].data_5 === 'number').assertEqual(true)
    expect(b_5[0][1].data_5).assertEqual(3)
    expect(b_5[1][0] instanceof C_5).assertEqual(true)
    expect(typeof b_5[1][0].data_5 === 'number').assertEqual(true)
    expect(b_5[1][0].data_5).assertEqual(5)
    expect(b_5[1][1] instanceof C_5).assertEqual(true)
    expect(typeof b_5[1][1].data_5 === 'number').assertEqual(true)
    expect(b_5[1][1].data_5).assertEqual(7)
    a_5 = b_5
    expect(a_5 instanceof Array).assertEqual(true)
    expect(a_5[0] instanceof Array).assertEqual(true)
    expect(a_5[1] instanceof Array).assertEqual(true)
    expect(a_5.length).assertEqual(2)
    expect(a_5[0].length).assertEqual(2)
    expect(a_5[1].length).assertEqual(2)
    expect(a_5[0][0] instanceof C_5).assertEqual(true)
    expect(typeof a_5[0][0].data_5 === 'number').assertEqual(true)
    expect(a_5[0][0].data_5).assertEqual(1)
    expect(a_5[0][1] instanceof C_5).assertEqual(true)
    expect(typeof a_5[0][1].data_5 === 'number').assertEqual(true)
    expect(a_5[0][1].data_5).assertEqual(3)
    expect(a_5[1][0] instanceof C_5).assertEqual(true)
    expect(typeof a_5[1][0].data_5 === 'number').assertEqual(true)
    expect(a_5[1][0].data_5).assertEqual(5)
    expect(a_5[1][1] instanceof C_5).assertEqual(true)
    expect(typeof a_5[1][1].data_5 === 'number').assertEqual(true)
    expect(a_5[1][1].data_5).assertEqual(7)
    return true
  }
}

function cast5(p: Object): Array<C5>[] {
  return p as Array<C5>[]
}

class C6 {
  data: number = 0
}

namespace testNS_6 {
  class C_6 {
    data_6: number = 0
  }

  function cast_6(p: Object): Array<C_6[]> {
    return p as Array<C_6[]>
  }

  export function runTest_6(): boolean {
    let a_6: Array<Array<C_6>> = [[{data_6: 1} as C_6, {data_6: 3} as C_6], [{data_6: 5} as C_6, {data_6: 7} as C_6]]
    let b_6: C_6[][] = cast_6(a_6)
    expect(a_6 instanceof Array).assertEqual(true)
    expect(a_6[0] instanceof Array).assertEqual(true)
    expect(a_6[1] instanceof Array).assertEqual(true)
    expect(b_6 instanceof Array).assertEqual(true)
    expect(b_6[0] instanceof Array).assertEqual(true)
    expect(b_6[1] instanceof Array).assertEqual(true)
    expect(b_6.length).assertEqual(2)
    expect(b_6[0].length).assertEqual(2)
    expect(b_6[1].length).assertEqual(2)
    expect(b_6[0][0] instanceof C_6).assertEqual(true)
    expect(typeof b_6[0][0].data_6 === 'number').assertEqual(true)
    expect(b_6[0][0].data_6).assertEqual(1)
    expect(b_6[0][1] instanceof C_6).assertEqual(true)
    expect(typeof b_6[0][1].data_6 === 'number').assertEqual(true)
    expect(b_6[0][1].data_6).assertEqual(3)
    expect(b_6[1][0] instanceof C_6).assertEqual(true)
    expect(typeof b_6[1][0].data_6 === 'number').assertEqual(true)
    expect(b_6[1][0].data_6).assertEqual(5)
    expect(b_6[1][1] instanceof C_6).assertEqual(true)
    expect(typeof b_6[1][1].data_6 === 'number').assertEqual(true)
    expect(b_6[1][1].data_6).assertEqual(7)
    a_6 = b_6
    expect(a_6 instanceof Array).assertEqual(true)
    expect(a_6[0] instanceof Array).assertEqual(true)
    expect(a_6[1] instanceof Array).assertEqual(true)
    expect(a_6.length).assertEqual(2)
    expect(a_6[0].length).assertEqual(2)
    expect(a_6[1].length).assertEqual(2)
    expect(a_6[0][0] instanceof C_6).assertEqual(true)
    expect(typeof a_6[0][0].data_6 === 'number').assertEqual(true)
    expect(a_6[0][0].data_6).assertEqual(1)
    expect(a_6[0][1] instanceof C_6).assertEqual(true)
    expect(typeof a_6[0][1].data_6 === 'number').assertEqual(true)
    expect(a_6[0][1].data_6).assertEqual(3)
    expect(a_6[1][0] instanceof C_6).assertEqual(true)
    expect(typeof a_6[1][0].data_6 === 'number').assertEqual(true)
    expect(a_6[1][0].data_6).assertEqual(5)
    expect(a_6[1][1] instanceof C_6).assertEqual(true)
    expect(typeof a_6[1][1].data_6 === 'number').assertEqual(true)
    expect(a_6[1][1].data_6).assertEqual(7)
    return true
  }
}

function cast6(p: Object): Array<C6[]> {
  return p as Array<C6[]>
}

class C7 {
  data: number = 0
}

namespace testNS_7 {
  class C_7 {
    data_7: number = 0
  }

  function cast_7(p: Object): Array<C_7[]> {
    return p as Array<C_7>[]
  }

  export function runTest_7(): boolean {
    let a_7: Array<Array<C_7>> = [[{data_7: 1} as C_7, {data_7: 3} as C_7], [{data_7: 5} as C_7, {data_7: 7} as C_7]]
    let b_7: C_7[][] = cast_7(a_7)
    expect(a_7 instanceof Array).assertEqual(true)
    expect(a_7[0] instanceof Array).assertEqual(true)
    expect(a_7[1] instanceof Array).assertEqual(true)
    expect(b_7 instanceof Array).assertEqual(true)
    expect(b_7[0] instanceof Array).assertEqual(true)
    expect(b_7[1] instanceof Array).assertEqual(true)
    expect(b_7.length).assertEqual(2)
    expect(b_7[0].length).assertEqual(2)
    expect(b_7[1].length).assertEqual(2)
    expect(b_7[0][0] instanceof C_7).assertEqual(true)
    expect(typeof b_7[0][0].data_7 === 'number').assertEqual(true)
    expect(b_7[0][0].data_7).assertEqual(1)
    expect(b_7[0][1] instanceof C_7).assertEqual(true)
    expect(typeof b_7[0][1].data_7 === 'number').assertEqual(true)
    expect(b_7[0][1].data_7).assertEqual(3)
    expect(b_7[1][0] instanceof C_7).assertEqual(true)
    expect(typeof b_7[1][0].data_7 === 'number').assertEqual(true)
    expect(b_7[1][0].data_7).assertEqual(5)
    expect(b_7[1][1] instanceof C_7).assertEqual(true)
    expect(typeof b_7[1][1].data_7 === 'number').assertEqual(true)
    expect(b_7[1][1].data_7).assertEqual(7)
    a_7 = b_7
    expect(a_7 instanceof Array).assertEqual(true)
    expect(a_7[0] instanceof Array).assertEqual(true)
    expect(a_7[1] instanceof Array).assertEqual(true)
    expect(a_7.length).assertEqual(2)
    expect(a_7[0].length).assertEqual(2)
    expect(a_7[1].length).assertEqual(2)
    expect(a_7[0][0] instanceof C_7).assertEqual(true)
    expect(typeof a_7[0][0].data_7 === 'number').assertEqual(true)
    expect(a_7[0][0].data_7).assertEqual(1)
    expect(a_7[0][1] instanceof C_7).assertEqual(true)
    expect(typeof a_7[0][1].data_7 === 'number').assertEqual(true)
    expect(a_7[0][1].data_7).assertEqual(3)
    expect(a_7[1][0] instanceof C_7).assertEqual(true)
    expect(typeof a_7[1][0].data_7 === 'number').assertEqual(true)
    expect(a_7[1][0].data_7).assertEqual(5)
    expect(a_7[1][1] instanceof C_7).assertEqual(true)
    expect(typeof a_7[1][1].data_7 === 'number').assertEqual(true)
    expect(a_7[1][1].data_7).assertEqual(7)
    return true
  }
}

function cast7(p: Object): Array<C7[]> {
  return p as Array<C7>[]
}

class C8 {
  data: number = 0
}

namespace testNS_8 {
  class C_8 {
    data_8: number = 0
  }

  function cast_8(p: Object): Array<C_8>[] {
    return p as Array<C_8[]>
  }

  export function runTest_8(): boolean {
    let a_8: Array<Array<C_8>> = [[{data_8: 1} as C_8, {data_8: 3} as C_8], [{data_8: 5} as C_8, {data_8: 7} as C_8]]
    let b_8: C_8[][] = cast_8(a_8)
    expect(a_8 instanceof Array).assertEqual(true)
    expect(a_8[0] instanceof Array).assertEqual(true)
    expect(a_8[1] instanceof Array).assertEqual(true)
    expect(b_8 instanceof Array).assertEqual(true)
    expect(b_8[0] instanceof Array).assertEqual(true)
    expect(b_8[1] instanceof Array).assertEqual(true)
    expect(b_8.length).assertEqual(2)
    expect(b_8[0].length).assertEqual(2)
    expect(b_8[1].length).assertEqual(2)
    expect(b_8[0][0] instanceof C_8).assertEqual(true)
    expect(typeof b_8[0][0].data_8 === 'number').assertEqual(true)
    expect(b_8[0][0].data_8).assertEqual(1)
    expect(b_8[0][1] instanceof C_8).assertEqual(true)
    expect(typeof b_8[0][1].data_8 === 'number').assertEqual(true)
    expect(b_8[0][1].data_8).assertEqual(3)
    expect(b_8[1][0] instanceof C_8).assertEqual(true)
    expect(typeof b_8[1][0].data_8 === 'number').assertEqual(true)
    expect(b_8[1][0].data_8).assertEqual(5)
    expect(b_8[1][1] instanceof C_8).assertEqual(true)
    expect(typeof b_8[1][1].data_8 === 'number').assertEqual(true)
    expect(b_8[1][1].data_8).assertEqual(7)
    a_8 = b_8
    expect(a_8 instanceof Array).assertEqual(true)
    expect(a_8[0] instanceof Array).assertEqual(true)
    expect(a_8[1] instanceof Array).assertEqual(true)
    expect(a_8.length).assertEqual(2)
    expect(a_8[0].length).assertEqual(2)
    expect(a_8[1].length).assertEqual(2)
    expect(a_8[0][0] instanceof C_8).assertEqual(true)
    expect(typeof a_8[0][0].data_8 === 'number').assertEqual(true)
    expect(a_8[0][0].data_8).assertEqual(1)
    expect(a_8[0][1] instanceof C_8).assertEqual(true)
    expect(typeof a_8[0][1].data_8 === 'number').assertEqual(true)
    expect(a_8[0][1].data_8).assertEqual(3)
    expect(a_8[1][0] instanceof C_8).assertEqual(true)
    expect(typeof a_8[1][0].data_8 === 'number').assertEqual(true)
    expect(a_8[1][0].data_8).assertEqual(5)
    expect(a_8[1][1] instanceof C_8).assertEqual(true)
    expect(typeof a_8[1][1].data_8 === 'number').assertEqual(true)
    expect(a_8[1][1].data_8).assertEqual(7)
    return true
  }
}

function cast8(p: Object): Array<C8>[] {
  return p as Array<C8[]>
}

class C9 {
  data: number = 0
}

namespace testNS_9 {
  class C_9 {
    data_9: number = 0
  }

  function cast_9(p: Object): Array<Array<C_9>> {
    return p as Array<Array<C_9>>
  }

  export function runTest_9(): boolean {
    let a_9: Array<C_9[]> = [[{data_9: 1} as C_9, {data_9: 3} as C_9], [{data_9: 5} as C_9, {data_9: 7} as C_9]]
    let b_9: Array<C_9>[] = cast_9(a_9)
    expect(a_9 instanceof Array).assertEqual(true)
    expect(a_9[0] instanceof Array).assertEqual(true)
    expect(a_9[1] instanceof Array).assertEqual(true)
    expect(b_9 instanceof Array).assertEqual(true)
    expect(b_9[0] instanceof Array).assertEqual(true)
    expect(b_9[1] instanceof Array).assertEqual(true)
    expect(b_9.length).assertEqual(2)
    expect(b_9[0].length).assertEqual(2)
    expect(b_9[1].length).assertEqual(2)
    expect(b_9[0][0] instanceof C_9).assertEqual(true)
    expect(typeof b_9[0][0].data_9 === 'number').assertEqual(true)
    expect(b_9[0][0].data_9).assertEqual(1)
    expect(b_9[0][1] instanceof C_9).assertEqual(true)
    expect(typeof b_9[0][1].data_9 === 'number').assertEqual(true)
    expect(b_9[0][1].data_9).assertEqual(3)
    expect(b_9[1][0] instanceof C_9).assertEqual(true)
    expect(typeof b_9[1][0].data_9 === 'number').assertEqual(true)
    expect(b_9[1][0].data_9).assertEqual(5)
    expect(b_9[1][1] instanceof C_9).assertEqual(true)
    expect(typeof b_9[1][1].data_9 === 'number').assertEqual(true)
    expect(b_9[1][1].data_9).assertEqual(7)
    a_9 = b_9
    expect(a_9 instanceof Array).assertEqual(true)
    expect(a_9[0] instanceof Array).assertEqual(true)
    expect(a_9[1] instanceof Array).assertEqual(true)
    expect(a_9.length).assertEqual(2)
    expect(a_9[0].length).assertEqual(2)
    expect(a_9[1].length).assertEqual(2)
    expect(a_9[0][0] instanceof C_9).assertEqual(true)
    expect(typeof a_9[0][0].data_9 === 'number').assertEqual(true)
    expect(a_9[0][0].data_9).assertEqual(1)
    expect(a_9[0][1] instanceof C_9).assertEqual(true)
    expect(typeof a_9[0][1].data_9 === 'number').assertEqual(true)
    expect(a_9[0][1].data_9).assertEqual(3)
    expect(a_9[1][0] instanceof C_9).assertEqual(true)
    expect(typeof a_9[1][0].data_9 === 'number').assertEqual(true)
    expect(a_9[1][0].data_9).assertEqual(5)
    expect(a_9[1][1] instanceof C_9).assertEqual(true)
    expect(typeof a_9[1][1].data_9 === 'number').assertEqual(true)
    expect(a_9[1][1].data_9).assertEqual(7)
    return true
  }
}

function cast9(p: Object): Array<Array<C9>> {
  return p as Array<Array<C9>>
}

class C10 {
  data: number = 0
}

namespace testNS_10 {
  class C_10 {
    data_10: number = 0
  }

  function cast_10(p: Object): C_10[][] {
    return p as C_10[][]
  }

  export function runTest_10(): boolean {
    let a_10: Array<C_10[]> = [[{data_10: 1} as C_10, {data_10: 3} as C_10], [{data_10: 5} as C_10, {data_10: 7} as C_10]]
    let b_10: Array<C_10>[] = cast_10(a_10)
    expect(a_10 instanceof Array).assertEqual(true)
    expect(a_10[0] instanceof Array).assertEqual(true)
    expect(a_10[1] instanceof Array).assertEqual(true)
    expect(b_10 instanceof Array).assertEqual(true)
    expect(b_10[0] instanceof Array).assertEqual(true)
    expect(b_10[1] instanceof Array).assertEqual(true)
    expect(b_10.length).assertEqual(2)
    expect(b_10[0].length).assertEqual(2)
    expect(b_10[1].length).assertEqual(2)
    expect(b_10[0][0] instanceof C_10).assertEqual(true)
    expect(typeof b_10[0][0].data_10 === 'number').assertEqual(true)
    expect(b_10[0][0].data_10).assertEqual(1)
    expect(b_10[0][1] instanceof C_10).assertEqual(true)
    expect(typeof b_10[0][1].data_10 === 'number').assertEqual(true)
    expect(b_10[0][1].data_10).assertEqual(3)
    expect(b_10[1][0] instanceof C_10).assertEqual(true)
    expect(typeof b_10[1][0].data_10 === 'number').assertEqual(true)
    expect(b_10[1][0].data_10).assertEqual(5)
    expect(b_10[1][1] instanceof C_10).assertEqual(true)
    expect(typeof b_10[1][1].data_10 === 'number').assertEqual(true)
    expect(b_10[1][1].data_10).assertEqual(7)
    a_10 = b_10
    expect(a_10 instanceof Array).assertEqual(true)
    expect(a_10[0] instanceof Array).assertEqual(true)
    expect(a_10[1] instanceof Array).assertEqual(true)
    expect(a_10.length).assertEqual(2)
    expect(a_10[0].length).assertEqual(2)
    expect(a_10[1].length).assertEqual(2)
    expect(a_10[0][0] instanceof C_10).assertEqual(true)
    expect(typeof a_10[0][0].data_10 === 'number').assertEqual(true)
    expect(a_10[0][0].data_10).assertEqual(1)
    expect(a_10[0][1] instanceof C_10).assertEqual(true)
    expect(typeof a_10[0][1].data_10 === 'number').assertEqual(true)
    expect(a_10[0][1].data_10).assertEqual(3)
    expect(a_10[1][0] instanceof C_10).assertEqual(true)
    expect(typeof a_10[1][0].data_10 === 'number').assertEqual(true)
    expect(a_10[1][0].data_10).assertEqual(5)
    expect(a_10[1][1] instanceof C_10).assertEqual(true)
    expect(typeof a_10[1][1].data_10 === 'number').assertEqual(true)
    expect(a_10[1][1].data_10).assertEqual(7)
    return true
  }
}

function cast10(p: Object): C10[][] {
  return p as C10[][]
}

export default function ArrayOfArraysTypesIdentityTest16(): void {
  describe('ArrayOfArraysTypesIdentityTest16', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_3700
     * @tc.name      testArrayOfArraysTypesIdentity0037
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0037';

      let a: C1[][] = [[{data: 1} as C1, {data: 3} as C1], [{data: 5} as C1, {data: 7} as C1]]
      let b: Array<Array<C1>> = cast1(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C1).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C1).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C1).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C1).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C1).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C1).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C1).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C1).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_1.runTest_1()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_3800
     * @tc.name      testArrayOfArraysTypesIdentity0038
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0038';

      let a: C2[][] = [[{data: 1} as C2, {data: 3} as C2], [{data: 5} as C2, {data: 7} as C2]]
      let b: Array<Array<C2>> = cast2(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C2).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C2).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C2).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C2).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C2).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C2).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C2).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C2).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_2.runTest_2()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_3900
     * @tc.name      testArrayOfArraysTypesIdentity0039
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0039';

      let a: Array<Array<C3>> = [[{data: 1} as C3, {data: 3} as C3], [{data: 5} as C3, {data: 7} as C3]]
      let b: C3[][] = cast3(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C3).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C3).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C3).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C3).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C3).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C3).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C3).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C3).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_3.runTest_3()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_4000
     * @tc.name      testArrayOfArraysTypesIdentity0040
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0040';
      console.log(TAG + ' start');

      let a: Array<Array<C4>> = [[{data: 1} as C4, {data: 3} as C4], [{data: 5} as C4, {data: 7} as C4]]
      let b: C4[][] = cast4(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C4).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C4).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C4).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C4).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C4).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C4).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C4).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C4).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_4.runTest_4()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_4100
     * @tc.name      testArrayOfArraysTypesIdentity0041
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0041';

      let a: Array<Array<C5>> = [[{data: 1} as C5, {data: 3} as C5], [{data: 5} as C5, {data: 7} as C5]]
      let b: C5[][] = cast5(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C5).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C5).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C5).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C5).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C5).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C5).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C5).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C5).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_5.runTest_5()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_4200
     * @tc.name      testArrayOfArraysTypesIdentity0042
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0042';

      let a: Array<Array<C6>> = [[{data: 1} as C6, {data: 3} as C6], [{data: 5} as C6, {data: 7} as C6]]
      let b: C6[][] = cast6(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C6).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C6).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C6).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C6).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C6).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C6).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C6).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C6).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_6.runTest_6()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_4300
     * @tc.name      testArrayOfArraysTypesIdentity0043
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0043';

      let a: Array<Array<C7>> = [[{data: 1} as C7, {data: 3} as C7], [{data: 5} as C7, {data: 7} as C7]]
      let b: C7[][] = cast7(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C7).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C7).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C7).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C7).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C7).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C7).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C7).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C7).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_7.runTest_7()).assertEqual(true)


    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_4400
     * @tc.name      testArrayOfArraysTypesIdentity0044
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0044';

      let a: Array<Array<C8>> = [[{data: 1} as C8, {data: 3} as C8], [{data: 5} as C8, {data: 7} as C8]]
      let b: C8[][] = cast8(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C8).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C8).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C8).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C8).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C8).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C8).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C8).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C8).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_8.runTest_8()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_4500
     * @tc.name      testArrayOfArraysTypesIdentity0045
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0045';

      let a: Array<C9[]> = [[{data: 1} as C9, {data: 3} as C9], [{data: 5} as C9, {data: 7} as C9]]
      let b: Array<C9>[] = cast9(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C9).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C9).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C9).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C9).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C9).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C9).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C9).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C9).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_9.runTest_9()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_4600
     * @tc.name      testArrayOfArraysTypesIdentity0046
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0046';

      let a: Array<C10[]> = [[{data: 1} as C10, {data: 3} as C10], [{data: 5} as C10, {data: 7} as C10]]
      let b: Array<C10>[] = cast10(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C10).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C10).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C10).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C10).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C10).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C10).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C10).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C10).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_10.runTest_10()).assertEqual(true)

    });
  })
}