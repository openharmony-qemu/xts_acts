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

namespace testNS_31 {
  function cast_31(p: Object) {
    return p as Array<int>[]
  }

  export function runTest_31(): boolean {
    let a_31: Array<int>[] = [[1, 3], [5, 7]]
    let b_31: Array<int[]> = cast_31(a_31)
    expect(a_31 instanceof Array).assertEqual(true)
    expect(a_31[0] instanceof Array).assertEqual(true)
    expect(a_31[1] instanceof Array).assertEqual(true)
    expect(b_31 instanceof Array).assertEqual(true)
    expect(b_31[0] instanceof Array).assertEqual(true)
    expect(b_31[1] instanceof Array).assertEqual(true)
    expect(b_31.length).assertEqual(2)
    expect(b_31[0].length).assertEqual(2)
    expect(b_31[1].length).assertEqual(2)
    expect(b_31[0][0] instanceof int).assertEqual(true)
    expect(b_31[0][0]).assertEqual(1)
    expect(b_31[0][1] instanceof int).assertEqual(true)
    expect(b_31[0][1]).assertEqual(3)
    expect(b_31[1][0] instanceof int).assertEqual(true)
    expect(b_31[1][0]).assertEqual(5)
    expect(b_31[1][1] instanceof int).assertEqual(true)
    expect(b_31[1][1]).assertEqual(7)
    a_31 = b_31
    expect(a_31 instanceof Array).assertEqual(true)
    expect(a_31[0] instanceof Array).assertEqual(true)
    expect(a_31[1] instanceof Array).assertEqual(true)
    expect(a_31.length).assertEqual(2)
    expect(a_31[0].length).assertEqual(2)
    expect(a_31[1].length).assertEqual(2)
    expect(a_31[0][0] instanceof int).assertEqual(true)
    expect(a_31[0][0]).assertEqual(1)
    expect(a_31[0][1] instanceof int).assertEqual(true)
    expect(a_31[0][1]).assertEqual(3)
    expect(a_31[1][0] instanceof int).assertEqual(true)
    expect(a_31[1][0]).assertEqual(5)
    expect(a_31[1][1] instanceof int).assertEqual(true)
    expect(a_31[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_32 {
  function cast_32(p: Object) {
    return p as Array<long>[]
  }

  export function runTest_32(): boolean {
    let a_32: Array<long>[] = [[1, 3], [5, 7]]
    let b_32: Array<long[]> = cast_32(a_32)
    expect(a_32 instanceof Array).assertEqual(true)
    expect(a_32[0] instanceof Array).assertEqual(true)
    expect(a_32[1] instanceof Array).assertEqual(true)
    expect(b_32 instanceof Array).assertEqual(true)
    expect(b_32[0] instanceof Array).assertEqual(true)
    expect(b_32[1] instanceof Array).assertEqual(true)
    expect(b_32.length).assertEqual(2)
    expect(b_32[0].length).assertEqual(2)
    expect(b_32[1].length).assertEqual(2)
    expect(b_32[0][0] instanceof long).assertEqual(true)
    expect(b_32[0][0]).assertEqual(1)
    expect(b_32[0][1] instanceof long).assertEqual(true)
    expect(b_32[0][1]).assertEqual(3)
    expect(b_32[1][0] instanceof long).assertEqual(true)
    expect(b_32[1][0]).assertEqual(5)
    expect(b_32[1][1] instanceof long).assertEqual(true)
    expect(b_32[1][1]).assertEqual(7)
    a_32 = b_32
    expect(a_32 instanceof Array).assertEqual(true)
    expect(a_32[0] instanceof Array).assertEqual(true)
    expect(a_32[1] instanceof Array).assertEqual(true)
    expect(a_32.length).assertEqual(2)
    expect(a_32[0].length).assertEqual(2)
    expect(a_32[1].length).assertEqual(2)
    expect(a_32[0][0] instanceof long).assertEqual(true)
    expect(a_32[0][0]).assertEqual(1)
    expect(a_32[0][1] instanceof long).assertEqual(true)
    expect(a_32[0][1]).assertEqual(3)
    expect(a_32[1][0] instanceof long).assertEqual(true)
    expect(a_32[1][0]).assertEqual(5)
    expect(a_32[1][1] instanceof long).assertEqual(true)
    expect(a_32[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_33 {
  function cast_33(p: Object) {
    return p as Array<byte>[]
  }

  export function runTest_33(): boolean {
    let a_33: Array<byte>[] = [[1, 3], [5, 7]]
    let b_33: Array<byte[]> = cast_33(a_33)
    expect(a_33 instanceof Array).assertEqual(true)
    expect(a_33[0] instanceof Array).assertEqual(true)
    expect(a_33[1] instanceof Array).assertEqual(true)
    expect(b_33 instanceof Array).assertEqual(true)
    expect(b_33[0] instanceof Array).assertEqual(true)
    expect(b_33[1] instanceof Array).assertEqual(true)
    expect(b_33.length).assertEqual(2)
    expect(b_33[0].length).assertEqual(2)
    expect(b_33[1].length).assertEqual(2)
    expect(b_33[0][0] instanceof byte).assertEqual(true)
    expect(b_33[0][0]).assertEqual(1)
    expect(b_33[0][1] instanceof byte).assertEqual(true)
    expect(b_33[0][1]).assertEqual(3)
    expect(b_33[1][0] instanceof byte).assertEqual(true)
    expect(b_33[1][0]).assertEqual(5)
    expect(b_33[1][1] instanceof byte).assertEqual(true)
    expect(b_33[1][1]).assertEqual(7)
    a_33 = b_33
    expect(a_33 instanceof Array).assertEqual(true)
    expect(a_33[0] instanceof Array).assertEqual(true)
    expect(a_33[1] instanceof Array).assertEqual(true)
    expect(a_33.length).assertEqual(2)
    expect(a_33[0].length).assertEqual(2)
    expect(a_33[1].length).assertEqual(2)
    expect(a_33[0][0] instanceof byte).assertEqual(true)
    expect(a_33[0][0]).assertEqual(1)
    expect(a_33[0][1] instanceof byte).assertEqual(true)
    expect(a_33[0][1]).assertEqual(3)
    expect(a_33[1][0] instanceof byte).assertEqual(true)
    expect(a_33[1][0]).assertEqual(5)
    expect(a_33[1][1] instanceof byte).assertEqual(true)
    expect(a_33[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_34 {
  function cast_34(p: Object) {
    return p as Array<short>[]
  }

  export function runTest_34(): boolean {
    let a_34: Array<short>[] = [[1, 3], [5, 7]]
    let b_34: Array<short[]> = cast_34(a_34)
    expect(a_34 instanceof Array).assertEqual(true)
    expect(a_34[0] instanceof Array).assertEqual(true)
    expect(a_34[1] instanceof Array).assertEqual(true)
    expect(b_34 instanceof Array).assertEqual(true)
    expect(b_34[0] instanceof Array).assertEqual(true)
    expect(b_34[1] instanceof Array).assertEqual(true)
    expect(b_34.length).assertEqual(2)
    expect(b_34[0].length).assertEqual(2)
    expect(b_34[1].length).assertEqual(2)
    expect(b_34[0][0] instanceof short).assertEqual(true)
    expect(b_34[0][0]).assertEqual(1)
    expect(b_34[0][1] instanceof short).assertEqual(true)
    expect(b_34[0][1]).assertEqual(3)
    expect(b_34[1][0] instanceof short).assertEqual(true)
    expect(b_34[1][0]).assertEqual(5)
    expect(b_34[1][1] instanceof short).assertEqual(true)
    expect(b_34[1][1]).assertEqual(7)
    a_34 = b_34
    expect(a_34 instanceof Array).assertEqual(true)
    expect(a_34[0] instanceof Array).assertEqual(true)
    expect(a_34[1] instanceof Array).assertEqual(true)
    expect(a_34.length).assertEqual(2)
    expect(a_34[0].length).assertEqual(2)
    expect(a_34[1].length).assertEqual(2)
    expect(a_34[0][0] instanceof short).assertEqual(true)
    expect(a_34[0][0]).assertEqual(1)
    expect(a_34[0][1] instanceof short).assertEqual(true)
    expect(a_34[0][1]).assertEqual(3)
    expect(a_34[1][0] instanceof short).assertEqual(true)
    expect(a_34[1][0]).assertEqual(5)
    expect(a_34[1][1] instanceof short).assertEqual(true)
    expect(a_34[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_35 {
  function cast_35(p: Object) {
    return p as Array<double>[]
  }

  export function runTest_35(): boolean {
    let a_35: Array<double>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_35: Array<double[]> = cast_35(a_35)
    expect(a_35 instanceof Array).assertEqual(true)
    expect(a_35[0] instanceof Array).assertEqual(true)
    expect(a_35[1] instanceof Array).assertEqual(true)
    expect(b_35 instanceof Array).assertEqual(true)
    expect(b_35[0] instanceof Array).assertEqual(true)
    expect(b_35[1] instanceof Array).assertEqual(true)
    expect(b_35.length).assertEqual(2)
    expect(b_35[0].length).assertEqual(2)
    expect(b_35[1].length).assertEqual(2)
    expect(b_35[0][0] instanceof double).assertEqual(true)
    expect(b_35[0][0]).assertEqual(1.5)
    expect(b_35[0][1] instanceof double).assertEqual(true)
    expect(b_35[0][1]).assertEqual(3.7)
    expect(b_35[1][0] instanceof double).assertEqual(true)
    expect(b_35[1][0]).assertEqual(5.4)
    expect(b_35[1][1] instanceof double).assertEqual(true)
    expect(b_35[1][1]).assertEqual(7.8)
    a_35 = b_35
    expect(a_35 instanceof Array).assertEqual(true)
    expect(a_35[0] instanceof Array).assertEqual(true)
    expect(a_35[1] instanceof Array).assertEqual(true)
    expect(a_35.length).assertEqual(2)
    expect(a_35[0].length).assertEqual(2)
    expect(a_35[1].length).assertEqual(2)
    expect(a_35[0][0] instanceof double).assertEqual(true)
    expect(a_35[0][0]).assertEqual(1.5)
    expect(a_35[0][1] instanceof double).assertEqual(true)
    expect(a_35[0][1]).assertEqual(3.7)
    expect(a_35[1][0] instanceof double).assertEqual(true)
    expect(a_35[1][0]).assertEqual(5.4)
    expect(a_35[1][1] instanceof double).assertEqual(true)
    expect(a_35[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_36 {
  function cast_36(p: Object) {
    return p as Array<number>[]
  }

  export function runTest_36(): boolean {
    let a_36: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_36: Array<number[]> = cast_36(a_36)
    expect(a_36 instanceof Array).assertEqual(true)
    expect(a_36[0] instanceof Array).assertEqual(true)
    expect(a_36[1] instanceof Array).assertEqual(true)
    expect(b_36 instanceof Array).assertEqual(true)
    expect(b_36[0] instanceof Array).assertEqual(true)
    expect(b_36[1] instanceof Array).assertEqual(true)
    expect(b_36.length).assertEqual(2)
    expect(b_36[0].length).assertEqual(2)
    expect(b_36[1].length).assertEqual(2)
    expect(b_36[0][0] instanceof number).assertEqual(true)
    expect(b_36[0][0]).assertEqual(1.5)
    expect(b_36[0][1] instanceof number).assertEqual(true)
    expect(b_36[0][1]).assertEqual(3.7)
    expect(b_36[1][0] instanceof number).assertEqual(true)
    expect(b_36[1][0]).assertEqual(5.4)
    expect(b_36[1][1] instanceof number).assertEqual(true)
    expect(b_36[1][1]).assertEqual(7.8)
    a_36 = b_36
    expect(a_36 instanceof Array).assertEqual(true)
    expect(a_36[0] instanceof Array).assertEqual(true)
    expect(a_36[1] instanceof Array).assertEqual(true)
    expect(a_36.length).assertEqual(2)
    expect(a_36[0].length).assertEqual(2)
    expect(a_36[1].length).assertEqual(2)
    expect(a_36[0][0] instanceof number).assertEqual(true)
    expect(a_36[0][0]).assertEqual(1.5)
    expect(a_36[0][1] instanceof number).assertEqual(true)
    expect(a_36[0][1]).assertEqual(3.7)
    expect(a_36[1][0] instanceof number).assertEqual(true)
    expect(a_36[1][0]).assertEqual(5.4)
    expect(a_36[1][1] instanceof number).assertEqual(true)
    expect(a_36[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_37 {
  function cast_37(p: Object) {
    return p as Array<number>[]
  }

  export function runTest_37(): boolean {
    let a_37: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_37: Array<number[]> = cast_37(a_37)
    expect(a_37 instanceof Array).assertEqual(true)
    expect(a_37[0] instanceof Array).assertEqual(true)
    expect(a_37[1] instanceof Array).assertEqual(true)
    expect(b_37 instanceof Array).assertEqual(true)
    expect(b_37[0] instanceof Array).assertEqual(true)
    expect(b_37[1] instanceof Array).assertEqual(true)
    expect(b_37.length).assertEqual(2)
    expect(b_37[0].length).assertEqual(2)
    expect(b_37[1].length).assertEqual(2)
    expect(b_37[0][0] instanceof number).assertEqual(true)
    expect(b_37[0][0]).assertEqual(1.5)
    expect(b_37[0][1] instanceof number).assertEqual(true)
    expect(b_37[0][1]).assertEqual(3.7)
    expect(b_37[1][0] instanceof number).assertEqual(true)
    expect(b_37[1][0]).assertEqual(5.4)
    expect(b_37[1][1] instanceof number).assertEqual(true)
    expect(b_37[1][1]).assertEqual(7.8)
    a_37 = b_37
    expect(a_37 instanceof Array).assertEqual(true)
    expect(a_37[0] instanceof Array).assertEqual(true)
    expect(a_37[1] instanceof Array).assertEqual(true)
    expect(a_37.length).assertEqual(2)
    expect(a_37[0].length).assertEqual(2)
    expect(a_37[1].length).assertEqual(2)
    expect(a_37[0][0] instanceof number).assertEqual(true)
    expect(a_37[0][0]).assertEqual(1.5)
    expect(a_37[0][1] instanceof number).assertEqual(true)
    expect(a_37[0][1]).assertEqual(3.7)
    expect(a_37[1][0] instanceof number).assertEqual(true)
    expect(a_37[1][0]).assertEqual(5.4)
    expect(a_37[1][1] instanceof number).assertEqual(true)
    expect(a_37[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_38 {
  function cast_38(p: Object) {
    return p as Array<bigint>[]
  }

  export function runTest_38(): boolean {
    let a_38: Array<bigint>[] = [[1n, 3n], [5n, 7n]]
    let b_38: Array<bigint[]> = cast_38(a_38)
    expect(a_38 instanceof Array).assertEqual(true)
    expect(a_38[0] instanceof Array).assertEqual(true)
    expect(a_38[1] instanceof Array).assertEqual(true)
    expect(b_38 instanceof Array).assertEqual(true)
    expect(b_38[0] instanceof Array).assertEqual(true)
    expect(b_38[1] instanceof Array).assertEqual(true)
    expect(b_38.length).assertEqual(2)
    expect(b_38[0].length).assertEqual(2)
    expect(b_38[1].length).assertEqual(2)
    expect(b_38[0][0] instanceof bigint).assertEqual(true)
    expect(b_38[0][0]).assertEqual(1n)
    expect(b_38[0][1] instanceof bigint).assertEqual(true)
    expect(b_38[0][1]).assertEqual(3n)
    expect(b_38[1][0] instanceof bigint).assertEqual(true)
    expect(b_38[1][0]).assertEqual(5n)
    expect(b_38[1][1] instanceof bigint).assertEqual(true)
    expect(b_38[1][1]).assertEqual(7n)
    a_38 = b_38
    expect(a_38 instanceof Array).assertEqual(true)
    expect(a_38[0] instanceof Array).assertEqual(true)
    expect(a_38[1] instanceof Array).assertEqual(true)
    expect(a_38.length).assertEqual(2)
    expect(a_38[0].length).assertEqual(2)
    expect(a_38[1].length).assertEqual(2)
    expect(a_38[0][0] instanceof bigint).assertEqual(true)
    expect(a_38[0][0]).assertEqual(1n)
    expect(a_38[0][1] instanceof bigint).assertEqual(true)
    expect(a_38[0][1]).assertEqual(3n)
    expect(a_38[1][0] instanceof bigint).assertEqual(true)
    expect(a_38[1][0]).assertEqual(5n)
    expect(a_38[1][1] instanceof bigint).assertEqual(true)
    expect(a_38[1][1]).assertEqual(7n)
    return true
  }
}

namespace testNS_39 {
  function cast_39(p: Object) {
    return p as Array<string>[]
  }

  export function runTest_39(): boolean {
    let a_39: Array<string>[] = [["ab", "c"], ["de", "f"]]
    let b_39: Array<string[]> = cast_39(a_39)
    expect(a_39 instanceof Array).assertEqual(true)
    expect(a_39[0] instanceof Array).assertEqual(true)
    expect(a_39[1] instanceof Array).assertEqual(true)
    expect(b_39 instanceof Array).assertEqual(true)
    expect(b_39[0] instanceof Array).assertEqual(true)
    expect(b_39[1] instanceof Array).assertEqual(true)
    expect(b_39.length).assertEqual(2)
    expect(b_39[0].length).assertEqual(2)
    expect(b_39[1].length).assertEqual(2)
    expect(b_39[0][0] instanceof string).assertEqual(true)
    expect(b_39[0][0]).assertEqual("ab")
    expect(b_39[0][1] instanceof string).assertEqual(true)
    expect(b_39[0][1]).assertEqual("c")
    expect(b_39[1][0] instanceof string).assertEqual(true)
    expect(b_39[1][0]).assertEqual("de")
    expect(b_39[1][1] instanceof string).assertEqual(true)
    expect(b_39[1][1]).assertEqual("f")
    a_39 = b_39
    expect(a_39 instanceof Array).assertEqual(true)
    expect(a_39[0] instanceof Array).assertEqual(true)
    expect(a_39[1] instanceof Array).assertEqual(true)
    expect(a_39.length).assertEqual(2)
    expect(a_39[0].length).assertEqual(2)
    expect(a_39[1].length).assertEqual(2)
    expect(a_39[0][0] instanceof string).assertEqual(true)
    expect(a_39[0][0]).assertEqual("ab")
    expect(a_39[0][1] instanceof string).assertEqual(true)
    expect(a_39[0][1]).assertEqual("c")
    expect(a_39[1][0] instanceof string).assertEqual(true)
    expect(a_39[1][0]).assertEqual("de")
    expect(a_39[1][1] instanceof string).assertEqual(true)
    expect(a_39[1][1]).assertEqual("f")
    return true
  }
}

namespace testNS_40 {
  function cast_40(p: Object) {
    return p as Array<char>[]
  }

  export function runTest_40(): boolean {
    let a_40: Array<char>[] = [[c'a', c'b'], [c'c', c'd']]
    let b_40: Array<char[]> = cast_40(a_40)
    expect(a_40 instanceof Array).assertEqual(true)
    expect(a_40[0] instanceof Array).assertEqual(true)
    expect(a_40[1] instanceof Array).assertEqual(true)
    expect(b_40 instanceof Array).assertEqual(true)
    expect(b_40[0] instanceof Array).assertEqual(true)
    expect(b_40[1] instanceof Array).assertEqual(true)
    expect(b_40.length).assertEqual(2)
    expect(b_40[0].length).assertEqual(2)
    expect(b_40[1].length).assertEqual(2)
    expect(b_40[0][0] instanceof char).assertEqual(true)
    expect(b_40[0][0]).assertEqual(c'a')
    expect(b_40[0][1] instanceof char).assertEqual(true)
    expect(b_40[0][1]).assertEqual(c'b')
    expect(b_40[1][0] instanceof char).assertEqual(true)
    expect(b_40[1][0]).assertEqual(c'c')
    expect(b_40[1][1] instanceof char).assertEqual(true)
    expect(b_40[1][1]).assertEqual(c'd')
    a_40 = b_40
    expect(a_40 instanceof Array).assertEqual(true)
    expect(a_40[0] instanceof Array).assertEqual(true)
    expect(a_40[1] instanceof Array).assertEqual(true)
    expect(a_40.length).assertEqual(2)
    expect(a_40[0].length).assertEqual(2)
    expect(a_40[1].length).assertEqual(2)
    expect(a_40[0][0] instanceof char).assertEqual(true)
    expect(a_40[0][0]).assertEqual(c'a')
    expect(a_40[0][1] instanceof char).assertEqual(true)
    expect(a_40[0][1]).assertEqual(c'b')
    expect(a_40[1][0] instanceof char).assertEqual(true)
    expect(a_40[1][0]).assertEqual(c'c')
    expect(a_40[1][1] instanceof char).assertEqual(true)
    expect(a_40[1][1]).assertEqual(c'd')
    return true
  }
}

namespace testNS_41 {
  function cast_41(p: Object) {
    return p as Array<boolean>[]
  }

  export function runTest_41(): boolean {
    let a_41: Array<boolean>[] = [[false, true], [true, false]]
    let b_41: Array<boolean[]> = cast_41(a_41)
    expect(a_41 instanceof Array).assertEqual(true)
    expect(a_41[0] instanceof Array).assertEqual(true)
    expect(a_41[1] instanceof Array).assertEqual(true)
    expect(b_41 instanceof Array).assertEqual(true)
    expect(b_41[0] instanceof Array).assertEqual(true)
    expect(b_41[1] instanceof Array).assertEqual(true)
    expect(b_41.length).assertEqual(2)
    expect(b_41[0].length).assertEqual(2)
    expect(b_41[1].length).assertEqual(2)
    expect(b_41[0][0] instanceof boolean).assertEqual(true)
    expect(b_41[0][0]).assertEqual(false)
    expect(b_41[0][1] instanceof boolean).assertEqual(true)
    expect(b_41[0][1]).assertEqual(true)
    expect(b_41[1][0] instanceof boolean).assertEqual(true)
    expect(b_41[1][0]).assertEqual(true)
    expect(b_41[1][1] instanceof boolean).assertEqual(true)
    expect(b_41[1][1]).assertEqual(false)
    a_41 = b_41
    expect(a_41 instanceof Array).assertEqual(true)
    expect(a_41[0] instanceof Array).assertEqual(true)
    expect(a_41[1] instanceof Array).assertEqual(true)
    expect(a_41.length).assertEqual(2)
    expect(a_41[0].length).assertEqual(2)
    expect(a_41[1].length).assertEqual(2)
    expect(a_41[0][0] instanceof boolean).assertEqual(true)
    expect(a_41[0][0]).assertEqual(false)
    expect(a_41[0][1] instanceof boolean).assertEqual(true)
    expect(a_41[0][1]).assertEqual(true)
    expect(a_41[1][0] instanceof boolean).assertEqual(true)
    expect(a_41[1][0]).assertEqual(true)
    expect(a_41[1][1] instanceof boolean).assertEqual(true)
    expect(a_41[1][1]).assertEqual(false)
    return true
  }
}

namespace testNS_42 {
  function cast_42(p: Object) {
    return p as Array<Object>[]
  }

  export function runTest_42(): boolean {
    let a_42: Array<Object>[] = [[1, 5n], ["abc", 17.6]]
    let b_42: Array<Object[]> = cast_42(a_42)
    expect(a_42 instanceof Array).assertEqual(true)
    expect(a_42[0] instanceof Array).assertEqual(true)
    expect(a_42[1] instanceof Array).assertEqual(true)
    expect(b_42 instanceof Array).assertEqual(true)
    expect(b_42[0] instanceof Array).assertEqual(true)
    expect(b_42[1] instanceof Array).assertEqual(true)
    expect(b_42.length).assertEqual(2)
    expect(b_42[0].length).assertEqual(2)
    expect(b_42[1].length).assertEqual(2)
    expect(typeof b_42[0][0] === 'number' || typeof b_42[0][0] === 'int').assertEqual(true)
    expect(b_42[0][0]).assertEqual(1)
    expect(typeof b_42[0][1] === 'bigint').assertEqual(true)
    expect(b_42[0][1]).assertEqual(5n)
    expect(typeof b_42[1][0] === 'string').assertEqual(true)
    expect(b_42[1][0]).assertEqual("abc")
    expect(typeof b_42[1][1] === 'number').assertEqual(true)
    expect(b_42[1][1]).assertEqual(17.6)
    a_42 = b_42
    expect(a_42 instanceof Array).assertEqual(true)
    expect(a_42[0] instanceof Array).assertEqual(true)
    expect(a_42[1] instanceof Array).assertEqual(true)
    expect(a_42.length).assertEqual(2)
    expect(a_42[0].length).assertEqual(2)
    expect(a_42[1].length).assertEqual(2)
    expect(typeof a_42[0][0] === 'number' || typeof a_42[0][0] === 'int').assertEqual(true)
    expect(a_42[0][0]).assertEqual(1)
    expect(typeof a_42[0][1] === 'bigint').assertEqual(true)
    expect(a_42[0][1]).assertEqual(5n)
    expect(typeof a_42[1][0] === 'string').assertEqual(true)
    expect(a_42[1][0]).assertEqual("abc")
    expect(typeof a_42[1][1] === 'number').assertEqual(true)
    expect(a_42[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_43 {
  function cast_43(p: Object) {
    return p as Array<(Object | undefined)>[]
  }

  export function runTest_43(): boolean {
    let a_43: Array<(Object | undefined)>[] = [[undefined, 5n], ["abc", 17.6]]
    let b_43: Array<(Object | undefined)[]> = cast_43(a_43)
    expect(a_43 instanceof Array).assertEqual(true)
    expect(a_43[0] instanceof Array).assertEqual(true)
    expect(a_43[1] instanceof Array).assertEqual(true)
    expect(b_43 instanceof Array).assertEqual(true)
    expect(b_43[0] instanceof Array).assertEqual(true)
    expect(b_43[1] instanceof Array).assertEqual(true)
    expect(b_43.length).assertEqual(2)
    expect(b_43[0].length).assertEqual(2)
    expect(b_43[1].length).assertEqual(2)
    expect(b_43[0][0] instanceof (Object | undefined)).assertEqual(true)
    expect(b_43[0][0]).assertEqual(undefined)
    expect(b_43[0][1] instanceof (Object | undefined)).assertEqual(true)
    expect(b_43[0][1]).assertEqual(5n)
    expect(b_43[1][0] instanceof (Object | undefined)).assertEqual(true)
    expect(b_43[1][0]).assertEqual("abc")
    expect(b_43[1][1] instanceof (Object | undefined)).assertEqual(true)
    expect(b_43[1][1]).assertEqual(17.6)
    a_43 = b_43
    expect(a_43 instanceof Array).assertEqual(true)
    expect(a_43[0] instanceof Array).assertEqual(true)
    expect(a_43[1] instanceof Array).assertEqual(true)
    expect(a_43.length).assertEqual(2)
    expect(a_43[0].length).assertEqual(2)
    expect(a_43[1].length).assertEqual(2)
    expect(a_43[0][0] instanceof (Object | undefined)).assertEqual(true)
    expect(a_43[0][0]).assertEqual(undefined)
    expect(a_43[0][1] instanceof (Object | undefined)).assertEqual(true)
    expect(a_43[0][1]).assertEqual(5n)
    expect(a_43[1][0] instanceof (Object | undefined)).assertEqual(true)
    expect(a_43[1][0]).assertEqual("abc")
    expect(a_43[1][1] instanceof (Object | undefined)).assertEqual(true)
    expect(a_43[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_44 {
  function cast_44(p: Object) {
    return p as Array<(Object | undefined | null)>[]
  }

  export function runTest_44(): boolean {
    let a_44: Array<(Object | undefined | null)>[] = [[undefined, 5n], [null, 17.6]]
    let b_44: Array<(Object | undefined | null)[]> = cast_44(a_44)
    expect(a_44 instanceof Array).assertEqual(true)
    expect(a_44[0] instanceof Array).assertEqual(true)
    expect(a_44[1] instanceof Array).assertEqual(true)
    expect(b_44 instanceof Array).assertEqual(true)
    expect(b_44[0] instanceof Array).assertEqual(true)
    expect(b_44[1] instanceof Array).assertEqual(true)
    expect(b_44.length).assertEqual(2)
    expect(b_44[0].length).assertEqual(2)
    expect(b_44[1].length).assertEqual(2)
    expect(b_44[0][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b_44[0][0]).assertEqual(undefined)
    expect(b_44[0][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b_44[0][1]).assertEqual(5n)
    expect(b_44[1][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b_44[1][0]).assertEqual(null)
    expect(b_44[1][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b_44[1][1]).assertEqual(17.6)
    a_44 = b_44
    expect(a_44 instanceof Array).assertEqual(true)
    expect(a_44[0] instanceof Array).assertEqual(true)
    expect(a_44[1] instanceof Array).assertEqual(true)
    expect(a_44.length).assertEqual(2)
    expect(a_44[0].length).assertEqual(2)
    expect(a_44[1].length).assertEqual(2)
    expect(a_44[0][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a_44[0][0]).assertEqual(undefined)
    expect(a_44[0][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a_44[0][1]).assertEqual(5n)
    expect(a_44[1][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a_44[1][0]).assertEqual(null)
    expect(a_44[1][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a_44[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_45 {
  function cast_45(p: Object) {
    return p as Array<Array<Object | null | undefined>>
  }

  export function runTest_45(): boolean {
    let a_45: Array<Object | null | undefined>[] = [[undefined, 5n], [null, 17.6]]
    let b_45: Array<Object | null | undefined>[] = cast_45(a_45)
    expect(a_45 instanceof Array).assertEqual(true)
    expect(a_45[0] instanceof Array).assertEqual(true)
    expect(a_45[1] instanceof Array).assertEqual(true)
    expect(b_45 instanceof Array).assertEqual(true)
    expect(b_45[0] instanceof Array).assertEqual(true)
    expect(b_45[1] instanceof Array).assertEqual(true)
    expect(b_45.length).assertEqual(2)
    expect(b_45[0].length).assertEqual(2)
    expect(b_45[1].length).assertEqual(2)
    expect(b_45[0][0] === undefined || b_45[0][0] === null || b_45[0][0] instanceof Object).assertEqual(true)
    expect(b_45[0][0]).assertEqual(undefined)
    expect(b_45[0][1] === undefined || b_45[0][1] === null || b_45[0][1] instanceof Object).assertEqual(true)
    expect(b_45[0][1]).assertEqual(5n)
    expect(b_45[1][0] === undefined || b_45[1][0] === null || b_45[1][0] instanceof Object).assertEqual(true)
    expect(b_45[1][0]).assertEqual(null)
    expect(b_45[1][1] === undefined || b_45[1][1] === null || b_45[1][1] instanceof Object).assertEqual(true)
    expect(b_45[1][1]).assertEqual(17.6)
    a_45 = b_45
    expect(a_45 instanceof Array).assertEqual(true)
    expect(a_45[0] instanceof Array).assertEqual(true)
    expect(a_45[1] instanceof Array).assertEqual(true)
    expect(a_45.length).assertEqual(2)
    expect(a_45[0].length).assertEqual(2)
    expect(a_45[1].length).assertEqual(2)
    expect(a_45[0][0] === undefined || a_45[0][0] === null || a_45[0][0] instanceof Object).assertEqual(true)
    expect(a_45[0][0]).assertEqual(undefined)
    expect(a_45[0][1] === undefined || a_45[0][1] === null || a_45[0][1] instanceof Object).assertEqual(true)
    expect(a_45[0][1]).assertEqual(5n)
    expect(a_45[1][0] === undefined || a_45[1][0] === null || a_45[1][0] instanceof Object).assertEqual(true)
    expect(a_45[1][0]).assertEqual(null)
    expect(a_45[1][1] === undefined || a_45[1][1] === null || a_45[1][1] instanceof Object).assertEqual(true)
    expect(a_45[1][1]).assertEqual(17.6)
    return true
  }
}

function cast3(p: Object) {
  return p as Array<int>[]
}

namespace testNS_46 {
  function cast_46(p: Object) {
    return p as Array<int[]>
  }

  export function runTest_46(): boolean {
    let a_46: Array<int>[] = [[1, 3], [5, 7]]
    let b_46: Array<int[]> = cast_46(a_46)
    expect(a_46 instanceof Array).assertEqual(true)
    expect(a_46[0] instanceof Array).assertEqual(true)
    expect(a_46[1] instanceof Array).assertEqual(true)
    expect(b_46 instanceof Array).assertEqual(true)
    expect(b_46[0] instanceof Array).assertEqual(true)
    expect(b_46[1] instanceof Array).assertEqual(true)
    expect(b_46.length).assertEqual(2)
    expect(b_46[0].length).assertEqual(2)
    expect(b_46[1].length).assertEqual(2)
    expect(b_46[0][0] instanceof int).assertEqual(true)
    expect(b_46[0][0]).assertEqual(1)
    expect(b_46[0][1] instanceof int).assertEqual(true)
    expect(b_46[0][1]).assertEqual(3)
    expect(b_46[1][0] instanceof int).assertEqual(true)
    expect(b_46[1][0]).assertEqual(5)
    expect(b_46[1][1] instanceof int).assertEqual(true)
    expect(b_46[1][1]).assertEqual(7)
    a_46 = b_46
    expect(a_46 instanceof Array).assertEqual(true)
    expect(a_46[0] instanceof Array).assertEqual(true)
    expect(a_46[1] instanceof Array).assertEqual(true)
    expect(a_46.length).assertEqual(2)
    expect(a_46[0].length).assertEqual(2)
    expect(a_46[1].length).assertEqual(2)
    expect(a_46[0][0] instanceof int).assertEqual(true)
    expect(a_46[0][0]).assertEqual(1)
    expect(a_46[0][1] instanceof int).assertEqual(true)
    expect(a_46[0][1]).assertEqual(3)
    expect(a_46[1][0] instanceof int).assertEqual(true)
    expect(a_46[1][0]).assertEqual(5)
    expect(a_46[1][1] instanceof int).assertEqual(true)
    expect(a_46[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_47 {
  function cast_47(p: Object) {
    return p as Array<long[]>
  }

  export function runTest_47(): boolean {
    let a_47: Array<long>[] = [[1, 3], [5, 7]]
    let b_47: Array<long[]> = cast_47(a_47)
    expect(a_47 instanceof Array).assertEqual(true)
    expect(a_47[0] instanceof Array).assertEqual(true)
    expect(a_47[1] instanceof Array).assertEqual(true)
    expect(b_47 instanceof Array).assertEqual(true)
    expect(b_47[0] instanceof Array).assertEqual(true)
    expect(b_47[1] instanceof Array).assertEqual(true)
    expect(b_47.length).assertEqual(2)
    expect(b_47[0].length).assertEqual(2)
    expect(b_47[1].length).assertEqual(2)
    expect(b_47[0][0] instanceof long).assertEqual(true)
    expect(b_47[0][0]).assertEqual(1)
    expect(b_47[0][1] instanceof long).assertEqual(true)
    expect(b_47[0][1]).assertEqual(3)
    expect(b_47[1][0] instanceof long).assertEqual(true)
    expect(b_47[1][0]).assertEqual(5)
    expect(b_47[1][1] instanceof long).assertEqual(true)
    expect(b_47[1][1]).assertEqual(7)
    a_47 = b_47
    expect(a_47 instanceof Array).assertEqual(true)
    expect(a_47[0] instanceof Array).assertEqual(true)
    expect(a_47[1] instanceof Array).assertEqual(true)
    expect(a_47.length).assertEqual(2)
    expect(a_47[0].length).assertEqual(2)
    expect(a_47[1].length).assertEqual(2)
    expect(a_47[0][0] instanceof long).assertEqual(true)
    expect(a_47[0][0]).assertEqual(1)
    expect(a_47[0][1] instanceof long).assertEqual(true)
    expect(a_47[0][1]).assertEqual(3)
    expect(a_47[1][0] instanceof long).assertEqual(true)
    expect(a_47[1][0]).assertEqual(5)
    expect(a_47[1][1] instanceof long).assertEqual(true)
    expect(a_47[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_48 {
  function cast_48(p: Object) {
    return p as Array<byte[]>
  }

  export function runTest_48(): boolean {
    let a_48: Array<byte>[] = [[1, 3], [5, 7]]
    let b_48: Array<byte[]> = cast_48(a_48)
    expect(a_48 instanceof Array).assertEqual(true)
    expect(a_48[0] instanceof Array).assertEqual(true)
    expect(a_48[1] instanceof Array).assertEqual(true)
    expect(b_48 instanceof Array).assertEqual(true)
    expect(b_48[0] instanceof Array).assertEqual(true)
    expect(b_48[1] instanceof Array).assertEqual(true)
    expect(b_48.length).assertEqual(2)
    expect(b_48[0].length).assertEqual(2)
    expect(b_48[1].length).assertEqual(2)
    expect(b_48[0][0] instanceof byte).assertEqual(true)
    expect(b_48[0][0]).assertEqual(1)
    expect(b_48[0][1] instanceof byte).assertEqual(true)
    expect(b_48[0][1]).assertEqual(3)
    expect(b_48[1][0] instanceof byte).assertEqual(true)
    expect(b_48[1][0]).assertEqual(5)
    expect(b_48[1][1] instanceof byte).assertEqual(true)
    expect(b_48[1][1]).assertEqual(7)
    a_48 = b_48
    expect(a_48 instanceof Array).assertEqual(true)
    expect(a_48[0] instanceof Array).assertEqual(true)
    expect(a_48[1] instanceof Array).assertEqual(true)
    expect(a_48.length).assertEqual(2)
    expect(a_48[0].length).assertEqual(2)
    expect(a_48[1].length).assertEqual(2)
    expect(a_48[0][0] instanceof byte).assertEqual(true)
    expect(a_48[0][0]).assertEqual(1)
    expect(a_48[0][1] instanceof byte).assertEqual(true)
    expect(a_48[0][1]).assertEqual(3)
    expect(a_48[1][0] instanceof byte).assertEqual(true)
    expect(a_48[1][0]).assertEqual(5)
    expect(a_48[1][1] instanceof byte).assertEqual(true)
    expect(a_48[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_49 {
  function cast_49(p: Object) {
    return p as Array<short[]>
  }

  export function runTest_49(): boolean {
    let a_49: Array<short>[] = [[1, 3], [5, 7]]
    let b_49: Array<short[]> = cast_49(a_49)
    expect(a_49 instanceof Array).assertEqual(true)
    expect(a_49[0] instanceof Array).assertEqual(true)
    expect(a_49[1] instanceof Array).assertEqual(true)
    expect(b_49 instanceof Array).assertEqual(true)
    expect(b_49[0] instanceof Array).assertEqual(true)
    expect(b_49[1] instanceof Array).assertEqual(true)
    expect(b_49.length).assertEqual(2)
    expect(b_49[0].length).assertEqual(2)
    expect(b_49[1].length).assertEqual(2)
    expect(b_49[0][0] instanceof short).assertEqual(true)
    expect(b_49[0][0]).assertEqual(1)
    expect(b_49[0][1] instanceof short).assertEqual(true)
    expect(b_49[0][1]).assertEqual(3)
    expect(b_49[1][0] instanceof short).assertEqual(true)
    expect(b_49[1][0]).assertEqual(5)
    expect(b_49[1][1] instanceof short).assertEqual(true)
    expect(b_49[1][1]).assertEqual(7)
    a_49 = b_49
    expect(a_49 instanceof Array).assertEqual(true)
    expect(a_49[0] instanceof Array).assertEqual(true)
    expect(a_49[1] instanceof Array).assertEqual(true)
    expect(a_49.length).assertEqual(2)
    expect(a_49[0].length).assertEqual(2)
    expect(a_49[1].length).assertEqual(2)
    expect(a_49[0][0] instanceof short).assertEqual(true)
    expect(a_49[0][0]).assertEqual(1)
    expect(a_49[0][1] instanceof short).assertEqual(true)
    expect(a_49[0][1]).assertEqual(3)
    expect(a_49[1][0] instanceof short).assertEqual(true)
    expect(a_49[1][0]).assertEqual(5)
    expect(a_49[1][1] instanceof short).assertEqual(true)
    expect(a_49[1][1]).assertEqual(7)
    return true
  }
}

namespace testNS_50 {
  function cast_50(p: Object) {
    return p as Array<double[]>
  }

  export function runTest_50(): boolean {
    let a_50: Array<double>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_50: Array<double[]> = cast_50(a_50)
    expect(a_50 instanceof Array).assertEqual(true)
    expect(a_50[0] instanceof Array).assertEqual(true)
    expect(a_50[1] instanceof Array).assertEqual(true)
    expect(b_50 instanceof Array).assertEqual(true)
    expect(b_50[0] instanceof Array).assertEqual(true)
    expect(b_50[1] instanceof Array).assertEqual(true)
    expect(b_50.length).assertEqual(2)
    expect(b_50[0].length).assertEqual(2)
    expect(b_50[1].length).assertEqual(2)
    expect(b_50[0][0] instanceof double).assertEqual(true)
    expect(b_50[0][0]).assertEqual(1.5)
    expect(b_50[0][1] instanceof double).assertEqual(true)
    expect(b_50[0][1]).assertEqual(3.7)
    expect(b_50[1][0] instanceof double).assertEqual(true)
    expect(b_50[1][0]).assertEqual(5.4)
    expect(b_50[1][1] instanceof double).assertEqual(true)
    expect(b_50[1][1]).assertEqual(7.8)
    a_50 = b_50
    expect(a_50 instanceof Array).assertEqual(true)
    expect(a_50[0] instanceof Array).assertEqual(true)
    expect(a_50[1] instanceof Array).assertEqual(true)
    expect(a_50.length).assertEqual(2)
    expect(a_50[0].length).assertEqual(2)
    expect(a_50[1].length).assertEqual(2)
    expect(a_50[0][0] instanceof double).assertEqual(true)
    expect(a_50[0][0]).assertEqual(1.5)
    expect(a_50[0][1] instanceof double).assertEqual(true)
    expect(a_50[0][1]).assertEqual(3.7)
    expect(a_50[1][0] instanceof double).assertEqual(true)
    expect(a_50[1][0]).assertEqual(5.4)
    expect(a_50[1][1] instanceof double).assertEqual(true)
    expect(a_50[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_51 {
  function cast_51(p: Object) {
    return p as Array<number[]>
  }

  export function runTest_51(): boolean {
    let a_51: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_51: Array<number[]> = cast_51(a_51)
    expect(a_51 instanceof Array).assertEqual(true)
    expect(a_51[0] instanceof Array).assertEqual(true)
    expect(a_51[1] instanceof Array).assertEqual(true)
    expect(b_51 instanceof Array).assertEqual(true)
    expect(b_51[0] instanceof Array).assertEqual(true)
    expect(b_51[1] instanceof Array).assertEqual(true)
    expect(b_51.length).assertEqual(2)
    expect(b_51[0].length).assertEqual(2)
    expect(b_51[1].length).assertEqual(2)
    expect(b_51[0][0] instanceof number).assertEqual(true)
    expect(b_51[0][0]).assertEqual(1.5)
    expect(b_51[0][1] instanceof number).assertEqual(true)
    expect(b_51[0][1]).assertEqual(3.7)
    expect(b_51[1][0] instanceof number).assertEqual(true)
    expect(b_51[1][0]).assertEqual(5.4)
    expect(b_51[1][1] instanceof number).assertEqual(true)
    expect(b_51[1][1]).assertEqual(7.8)
    a_51 = b_51
    expect(a_51 instanceof Array).assertEqual(true)
    expect(a_51[0] instanceof Array).assertEqual(true)
    expect(a_51[1] instanceof Array).assertEqual(true)
    expect(a_51.length).assertEqual(2)
    expect(a_51[0].length).assertEqual(2)
    expect(a_51[1].length).assertEqual(2)
    expect(a_51[0][0] instanceof number).assertEqual(true)
    expect(a_51[0][0]).assertEqual(1.5)
    expect(a_51[0][1] instanceof number).assertEqual(true)
    expect(a_51[0][1]).assertEqual(3.7)
    expect(a_51[1][0] instanceof number).assertEqual(true)
    expect(a_51[1][0]).assertEqual(5.4)
    expect(a_51[1][1] instanceof number).assertEqual(true)
    expect(a_51[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_52 {
  function cast_52(p: Object) {
    return p as Array<number[]>
  }

  export function runTest_52(): boolean {
    let a_52: Array<number>[] = [[1.5, 3.7], [5.4, 7.8]]
    let b_52: Array<number[]> = cast_52(a_52)
    expect(a_52 instanceof Array).assertEqual(true)
    expect(a_52[0] instanceof Array).assertEqual(true)
    expect(a_52[1] instanceof Array).assertEqual(true)
    expect(b_52 instanceof Array).assertEqual(true)
    expect(b_52[0] instanceof Array).assertEqual(true)
    expect(b_52[1] instanceof Array).assertEqual(true)
    expect(b_52.length).assertEqual(2)
    expect(b_52[0].length).assertEqual(2)
    expect(b_52[1].length).assertEqual(2)
    expect(b_52[0][0] instanceof number).assertEqual(true)
    expect(b_52[0][0]).assertEqual(1.5)
    expect(b_52[0][1] instanceof number).assertEqual(true)
    expect(b_52[0][1]).assertEqual(3.7)
    expect(b_52[1][0] instanceof number).assertEqual(true)
    expect(b_52[1][0]).assertEqual(5.4)
    expect(b_52[1][1] instanceof number).assertEqual(true)
    expect(b_52[1][1]).assertEqual(7.8)
    a_52 = b_52
    expect(a_52 instanceof Array).assertEqual(true)
    expect(a_52[0] instanceof Array).assertEqual(true)
    expect(a_52[1] instanceof Array).assertEqual(true)
    expect(a_52.length).assertEqual(2)
    expect(a_52[0].length).assertEqual(2)
    expect(a_52[1].length).assertEqual(2)
    expect(a_52[0][0] instanceof number).assertEqual(true)
    expect(a_52[0][0]).assertEqual(1.5)
    expect(a_52[0][1] instanceof number).assertEqual(true)
    expect(a_52[0][1]).assertEqual(3.7)
    expect(a_52[1][0] instanceof number).assertEqual(true)
    expect(a_52[1][0]).assertEqual(5.4)
    expect(a_52[1][1] instanceof number).assertEqual(true)
    expect(a_52[1][1]).assertEqual(7.8)
    return true
  }
}

namespace testNS_53 {
  function cast_53(p: Object) {
    return p as Array<bigint[]>
  }

  export function runTest_53(): boolean {
    let a_53: Array<bigint>[] = [[1n, 3n], [5n, 7n]]
    let b_53: Array<bigint[]> = cast_53(a_53)
    expect(a_53 instanceof Array).assertEqual(true)
    expect(a_53[0] instanceof Array).assertEqual(true)
    expect(a_53[1] instanceof Array).assertEqual(true)
    expect(b_53 instanceof Array).assertEqual(true)
    expect(b_53[0] instanceof Array).assertEqual(true)
    expect(b_53[1] instanceof Array).assertEqual(true)
    expect(b_53.length).assertEqual(2)
    expect(b_53[0].length).assertEqual(2)
    expect(b_53[1].length).assertEqual(2)
    expect(b_53[0][0] instanceof bigint).assertEqual(true)
    expect(b_53[0][0]).assertEqual(1n)
    expect(b_53[0][1] instanceof bigint).assertEqual(true)
    expect(b_53[0][1]).assertEqual(3n)
    expect(b_53[1][0] instanceof bigint).assertEqual(true)
    expect(b_53[1][0]).assertEqual(5n)
    expect(b_53[1][1] instanceof bigint).assertEqual(true)
    expect(b_53[1][1]).assertEqual(7n)
    a_53 = b_53
    expect(a_53 instanceof Array).assertEqual(true)
    expect(a_53[0] instanceof Array).assertEqual(true)
    expect(a_53[1] instanceof Array).assertEqual(true)
    expect(a_53.length).assertEqual(2)
    expect(a_53[0].length).assertEqual(2)
    expect(a_53[1].length).assertEqual(2)
    expect(a_53[0][0] instanceof bigint).assertEqual(true)
    expect(a_53[0][0]).assertEqual(1n)
    expect(a_53[0][1] instanceof bigint).assertEqual(true)
    expect(a_53[0][1]).assertEqual(3n)
    expect(a_53[1][0] instanceof bigint).assertEqual(true)
    expect(a_53[1][0]).assertEqual(5n)
    expect(a_53[1][1] instanceof bigint).assertEqual(true)
    expect(a_53[1][1]).assertEqual(7n)
    return true
  }
}

namespace testNS_54 {
  function cast_54(p: Object) {
    return p as Array<string[]>
  }

  export function runTest_54(): boolean {
    let a_54: Array<string>[] = [["ab", "c"], ["de", "f"]]
    let b_54: Array<string[]> = cast_54(a_54)
    expect(a_54 instanceof Array).assertEqual(true)
    expect(a_54[0] instanceof Array).assertEqual(true)
    expect(a_54[1] instanceof Array).assertEqual(true)
    expect(b_54 instanceof Array).assertEqual(true)
    expect(b_54[0] instanceof Array).assertEqual(true)
    expect(b_54[1] instanceof Array).assertEqual(true)
    expect(b_54.length).assertEqual(2)
    expect(b_54[0].length).assertEqual(2)
    expect(b_54[1].length).assertEqual(2)
    expect(b_54[0][0] instanceof string).assertEqual(true)
    expect(b_54[0][0]).assertEqual("ab")
    expect(b_54[0][1] instanceof string).assertEqual(true)
    expect(b_54[0][1]).assertEqual("c")
    expect(b_54[1][0] instanceof string).assertEqual(true)
    expect(b_54[1][0]).assertEqual("de")
    expect(b_54[1][1] instanceof string).assertEqual(true)
    expect(b_54[1][1]).assertEqual("f")
    a_54 = b_54
    expect(a_54 instanceof Array).assertEqual(true)
    expect(a_54[0] instanceof Array).assertEqual(true)
    expect(a_54[1] instanceof Array).assertEqual(true)
    expect(a_54.length).assertEqual(2)
    expect(a_54[0].length).assertEqual(2)
    expect(a_54[1].length).assertEqual(2)
    expect(a_54[0][0] instanceof string).assertEqual(true)
    expect(a_54[0][0]).assertEqual("ab")
    expect(a_54[0][1] instanceof string).assertEqual(true)
    expect(a_54[0][1]).assertEqual("c")
    expect(a_54[1][0] instanceof string).assertEqual(true)
    expect(a_54[1][0]).assertEqual("de")
    expect(a_54[1][1] instanceof string).assertEqual(true)
    expect(a_54[1][1]).assertEqual("f")
    return true
  }
}

namespace testNS_55 {
  function cast_55(p: Object) {
    return p as Array<char[]>
  }

  export function runTest_55(): boolean {
    let a_55: Array<char>[] = [[c'a', c'b'], [c'c', c'd']]
    let b_55: Array<char[]> = cast_55(a_55)
    expect(a_55 instanceof Array).assertEqual(true)
    expect(a_55[0] instanceof Array).assertEqual(true)
    expect(a_55[1] instanceof Array).assertEqual(true)
    expect(b_55 instanceof Array).assertEqual(true)
    expect(b_55[0] instanceof Array).assertEqual(true)
    expect(b_55[1] instanceof Array).assertEqual(true)
    expect(b_55.length).assertEqual(2)
    expect(b_55[0].length).assertEqual(2)
    expect(b_55[1].length).assertEqual(2)
    expect(b_55[0][0] instanceof char).assertEqual(true)
    expect(b_55[0][0]).assertEqual(c'a')
    expect(b_55[0][1] instanceof char).assertEqual(true)
    expect(b_55[0][1]).assertEqual(c'b')
    expect(b_55[1][0] instanceof char).assertEqual(true)
    expect(b_55[1][0]).assertEqual(c'c')
    expect(b_55[1][1] instanceof char).assertEqual(true)
    expect(b_55[1][1]).assertEqual(c'd')
    a_55 = b_55
    expect(a_55 instanceof Array).assertEqual(true)
    expect(a_55[0] instanceof Array).assertEqual(true)
    expect(a_55[1] instanceof Array).assertEqual(true)
    expect(a_55.length).assertEqual(2)
    expect(a_55[0].length).assertEqual(2)
    expect(a_55[1].length).assertEqual(2)
    expect(a_55[0][0] instanceof char).assertEqual(true)
    expect(a_55[0][0]).assertEqual(c'a')
    expect(a_55[0][1] instanceof char).assertEqual(true)
    expect(a_55[0][1]).assertEqual(c'b')
    expect(a_55[1][0] instanceof char).assertEqual(true)
    expect(a_55[1][0]).assertEqual(c'c')
    expect(a_55[1][1] instanceof char).assertEqual(true)
    expect(a_55[1][1]).assertEqual(c'd')
    return true
  }
}

namespace testNS_56 {
  function cast_56(p: Object) {
    return p as Array<boolean[]>
  }

  export function runTest_56(): boolean {
    let a_56: Array<boolean>[] = [[false, true], [true, false]]
    let b_56: Array<boolean[]> = cast_56(a_56)
    expect(a_56 instanceof Array).assertEqual(true)
    expect(a_56[0] instanceof Array).assertEqual(true)
    expect(a_56[1] instanceof Array).assertEqual(true)
    expect(b_56 instanceof Array).assertEqual(true)
    expect(b_56[0] instanceof Array).assertEqual(true)
    expect(b_56[1] instanceof Array).assertEqual(true)
    expect(b_56.length).assertEqual(2)
    expect(b_56[0].length).assertEqual(2)
    expect(b_56[1].length).assertEqual(2)
    expect(b_56[0][0] instanceof boolean).assertEqual(true)
    expect(b_56[0][0]).assertEqual(false)
    expect(b_56[0][1] instanceof boolean).assertEqual(true)
    expect(b_56[0][1]).assertEqual(true)
    expect(b_56[1][0] instanceof boolean).assertEqual(true)
    expect(b_56[1][0]).assertEqual(true)
    expect(b_56[1][1] instanceof boolean).assertEqual(true)
    expect(b_56[1][1]).assertEqual(false)
    a_56 = b_56
    expect(a_56 instanceof Array).assertEqual(true)
    expect(a_56[0] instanceof Array).assertEqual(true)
    expect(a_56[1] instanceof Array).assertEqual(true)
    expect(a_56.length).assertEqual(2)
    expect(a_56[0].length).assertEqual(2)
    expect(a_56[1].length).assertEqual(2)
    expect(a_56[0][0] instanceof boolean).assertEqual(true)
    expect(a_56[0][0]).assertEqual(false)
    expect(a_56[0][1] instanceof boolean).assertEqual(true)
    expect(a_56[0][1]).assertEqual(true)
    expect(a_56[1][0] instanceof boolean).assertEqual(true)
    expect(a_56[1][0]).assertEqual(true)
    expect(a_56[1][1] instanceof boolean).assertEqual(true)
    expect(a_56[1][1]).assertEqual(false)
    return true
  }
}

namespace testNS_57 {
  function cast_57(p: Object) {
    return p as Array<Object[]>
  }

  export function runTest_57(): boolean {
    let a_57: Array<Object>[] = [[1, 5n], ["abc", 17.6]]
    let b_57: Array<Object[]> = cast_57(a_57)
    expect(a_57 instanceof Array).assertEqual(true)
    expect(a_57[0] instanceof Array).assertEqual(true)
    expect(a_57[1] instanceof Array).assertEqual(true)
    expect(b_57 instanceof Array).assertEqual(true)
    expect(b_57[0] instanceof Array).assertEqual(true)
    expect(b_57[1] instanceof Array).assertEqual(true)
    expect(b_57.length).assertEqual(2)
    expect(b_57[0].length).assertEqual(2)
    expect(b_57[1].length).assertEqual(2)
    expect(typeof b_57[0][0] === 'number' || typeof b_57[0][0] === 'int').assertEqual(true)
    expect(b_57[0][0]).assertEqual(1)
    expect(typeof b_57[0][1] === 'bigint').assertEqual(true)
    expect(b_57[0][1]).assertEqual(5n)
    expect(typeof b_57[1][0] === 'string').assertEqual(true)
    expect(b_57[1][0]).assertEqual("abc")
    expect(typeof b_57[1][1] === 'number').assertEqual(true)
    expect(b_57[1][1]).assertEqual(17.6)
    a_57 = b_57
    expect(a_57 instanceof Array).assertEqual(true)
    expect(a_57[0] instanceof Array).assertEqual(true)
    expect(a_57[1] instanceof Array).assertEqual(true)
    expect(a_57.length).assertEqual(2)
    expect(a_57[0].length).assertEqual(2)
    expect(a_57[1].length).assertEqual(2)
    expect(typeof a_57[0][0] === 'number' || typeof a_57[0][0] === 'int').assertEqual(true)
    expect(a_57[0][0]).assertEqual(1)
    expect(typeof a_57[0][1] === 'bigint').assertEqual(true)
    expect(a_57[0][1]).assertEqual(5n)
    expect(typeof a_57[1][0] === 'string').assertEqual(true)
    expect(a_57[1][0]).assertEqual("abc")
    expect(typeof a_57[1][1] === 'number').assertEqual(true)
    expect(a_57[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_58 {
  function cast_58(p: Object) {
    return p as Array<(Object | undefined)[]>
  }

  export function runTest_58(): boolean {
    let a_58: Array<(Object | undefined)>[] = [[undefined, 5n], ["abc", 17.6]]
    let b_58: Array<(Object | undefined)[]> = cast_58(a_58)
    expect(a_58 instanceof Array).assertEqual(true)
    expect(a_58[0] instanceof Array).assertEqual(true)
    expect(a_58[1] instanceof Array).assertEqual(true)
    expect(b_58 instanceof Array).assertEqual(true)
    expect(b_58[0] instanceof Array).assertEqual(true)
    expect(b_58[1] instanceof Array).assertEqual(true)
    expect(b_58.length).assertEqual(2)
    expect(b_58[0].length).assertEqual(2)
    expect(b_58[1].length).assertEqual(2)
    expect(b_58[0][0] instanceof (Object | undefined)).assertEqual(true)
    expect(b_58[0][0]).assertEqual(undefined)
    expect(b_58[0][1] instanceof (Object | undefined)).assertEqual(true)
    expect(b_58[0][1]).assertEqual(5n)
    expect(b_58[1][0] instanceof (Object | undefined)).assertEqual(true)
    expect(b_58[1][0]).assertEqual("abc")
    expect(b_58[1][1] instanceof (Object | undefined)).assertEqual(true)
    expect(b_58[1][1]).assertEqual(17.6)
    a_58 = b_58
    expect(a_58 instanceof Array).assertEqual(true)
    expect(a_58[0] instanceof Array).assertEqual(true)
    expect(a_58[1] instanceof Array).assertEqual(true)
    expect(a_58.length).assertEqual(2)
    expect(a_58[0].length).assertEqual(2)
    expect(a_58[1].length).assertEqual(2)
    expect(a_58[0][0] instanceof (Object | undefined)).assertEqual(true)
    expect(a_58[0][0]).assertEqual(undefined)
    expect(a_58[0][1] instanceof (Object | undefined)).assertEqual(true)
    expect(a_58[0][1]).assertEqual(5n)
    expect(a_58[1][0] instanceof (Object | undefined)).assertEqual(true)
    expect(a_58[1][0]).assertEqual("abc")
    expect(a_58[1][1] instanceof (Object | undefined)).assertEqual(true)
    expect(a_58[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_59 {
  function cast_59(p: Object) {
    return p as Array<(Object | undefined | null)[]>
  }

  export function runTest_59(): boolean {
    let a_59: Array<(Object | undefined | null)>[] = [[undefined, 5n], [null, 17.6]]
    let b_59: Array<(Object | undefined | null)[]> = cast_59(a_59)
    expect(a_59 instanceof Array).assertEqual(true)
    expect(a_59[0] instanceof Array).assertEqual(true)
    expect(a_59[1] instanceof Array).assertEqual(true)
    expect(b_59 instanceof Array).assertEqual(true)
    expect(b_59[0] instanceof Array).assertEqual(true)
    expect(b_59[1] instanceof Array).assertEqual(true)
    expect(b_59.length).assertEqual(2)
    expect(b_59[0].length).assertEqual(2)
    expect(b_59[1].length).assertEqual(2)
    expect(b_59[0][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b_59[0][0]).assertEqual(undefined)
    expect(b_59[0][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b_59[0][1]).assertEqual(5n)
    expect(b_59[1][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b_59[1][0]).assertEqual(null)
    expect(b_59[1][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(b_59[1][1]).assertEqual(17.6)
    a_59 = b_59
    expect(a_59 instanceof Array).assertEqual(true)
    expect(a_59[0] instanceof Array).assertEqual(true)
    expect(a_59[1] instanceof Array).assertEqual(true)
    expect(a_59.length).assertEqual(2)
    expect(a_59[0].length).assertEqual(2)
    expect(a_59[1].length).assertEqual(2)
    expect(a_59[0][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a_59[0][0]).assertEqual(undefined)
    expect(a_59[0][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a_59[0][1]).assertEqual(5n)
    expect(a_59[1][0] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a_59[1][0]).assertEqual(null)
    expect(a_59[1][1] instanceof (Object | undefined | null)).assertEqual(true)
    expect(a_59[1][1]).assertEqual(17.6)
    return true
  }
}

namespace testNS_60 {
  function cast_60(p: Object) {
    return p as Array<Array<Object | null | undefined>>
  }

  export function runTest_60(): boolean {
    let a_60: Array<Object | null | undefined>[] = [[undefined, 5n], [null, 17.6]]
    let b_60: Array<Object | null | undefined>[] = cast_60(a_60)
    expect(a_60 instanceof Array).assertEqual(true)
    expect(a_60[0] instanceof Array).assertEqual(true)
    expect(a_60[1] instanceof Array).assertEqual(true)
    expect(b_60 instanceof Array).assertEqual(true)
    expect(b_60[0] instanceof Array).assertEqual(true)
    expect(b_60[1] instanceof Array).assertEqual(true)
    expect(b_60.length).assertEqual(2)
    expect(b_60[0].length).assertEqual(2)
    expect(b_60[1].length).assertEqual(2)
    expect(b_60[0][0] === undefined || b_60[0][0] === null || b_60[0][0] instanceof Object).assertEqual(true)
    expect(b_60[0][0]).assertEqual(undefined)
    expect(b_60[0][1] === undefined || b_60[0][1] === null || b_60[0][1] instanceof Object).assertEqual(true)
    expect(b_60[0][1]).assertEqual(5n)
    expect(b_60[1][0] === undefined || b_60[1][0] === null || b_60[1][0] instanceof Object).assertEqual(true)
    expect(b_60[1][0]).assertEqual(null)
    expect(b_60[1][1] === undefined || b_60[1][1] === null || b_60[1][1] instanceof Object).assertEqual(true)
    expect(b_60[1][1]).assertEqual(17.6)
    a_60 = b_60
    expect(a_60 instanceof Array).assertEqual(true)
    expect(a_60[0] instanceof Array).assertEqual(true)
    expect(a_60[1] instanceof Array).assertEqual(true)
    expect(a_60.length).assertEqual(2)
    expect(a_60[0].length).assertEqual(2)
    expect(a_60[1].length).assertEqual(2)
    expect(a_60[0][0] === undefined || a_60[0][0] === null || a_60[0][0] instanceof Object).assertEqual(true)
    expect(a_60[0][0]).assertEqual(undefined)
    expect(a_60[0][1] === undefined || a_60[0][1] === null || a_60[0][1] instanceof Object).assertEqual(true)
    expect(a_60[0][1]).assertEqual(5n)
    expect(a_60[1][0] === undefined || a_60[1][0] === null || a_60[1][0] instanceof Object).assertEqual(true)
    expect(a_60[1][0]).assertEqual(null)
    expect(a_60[1][1] === undefined || a_60[1][1] === null || a_60[1][1] instanceof Object).assertEqual(true)
    expect(a_60[1][1]).assertEqual(17.6)
    return true
  }
}

function cast4(p: Object) {
  return p as Array<int[]>
}

export default function ArrayOfArraysTypesIdentityTest12(): void {
  describe('ArrayOfArraysTypesIdentityTest12', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_2900
     * @tc.name      testArrayOfArraysTypesIdentity0029
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
  types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0029';
       

      let a: Array<int>[] = [[1, 3], [5, 7]]
      let b: Array<int[]> = cast3(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof int).assertEqual(true)
      expect(b[0][0]).assertEqual(1)
      expect(b[0][1] instanceof int).assertEqual(true)
      expect(b[0][1]).assertEqual(3)
      expect(b[1][0] instanceof int).assertEqual(true)
      expect(b[1][0]).assertEqual(5)
      expect(b[1][1] instanceof int).assertEqual(true)
      expect(b[1][1]).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof int).assertEqual(true)
      expect(a[0][0]).assertEqual(1)
      expect(a[0][1] instanceof int).assertEqual(true)
      expect(a[0][1]).assertEqual(3)
      expect(a[1][0] instanceof int).assertEqual(true)
      expect(a[1][0]).assertEqual(5)
      expect(a[1][1] instanceof int).assertEqual(true)
      expect(a[1][1]).assertEqual(7)

      expect(testNS_31.runTest_31()).assertEqual(true)
      expect(testNS_32.runTest_32()).assertEqual(true)
      expect(testNS_33.runTest_33()).assertEqual(true)
      expect(testNS_34.runTest_34()).assertEqual(true)
      expect(testNS_35.runTest_35()).assertEqual(true)
      expect(testNS_36.runTest_36()).assertEqual(true)
      expect(testNS_37.runTest_37()).assertEqual(true)
      expect(testNS_38.runTest_38()).assertEqual(true)
      expect(testNS_39.runTest_39()).assertEqual(true)
      expect(testNS_40.runTest_40()).assertEqual(true)
      expect(testNS_41.runTest_41()).assertEqual(true)
      expect(testNS_42.runTest_42()).assertEqual(true)
      expect(testNS_43.runTest_43()).assertEqual(true)
      expect(testNS_44.runTest_44()).assertEqual(true)
      expect(testNS_45.runTest_45()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_3000
     * @tc.name      testArrayOfArraysTypesIdentity0030
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
    types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0030';


      let a: Array<int>[] = [[1, 3], [5, 7]]
      let b: Array<int[]> = cast4(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof int).assertEqual(true)
      expect(b[0][0]).assertEqual(1)
      expect(b[0][1] instanceof int).assertEqual(true)
      expect(b[0][1]).assertEqual(3)
      expect(b[1][0] instanceof int).assertEqual(true)
      expect(b[1][0]).assertEqual(5)
      expect(b[1][1] instanceof int).assertEqual(true)
      expect(b[1][1]).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof int).assertEqual(true)
      expect(a[0][0]).assertEqual(1)
      expect(a[0][1] instanceof int).assertEqual(true)
      expect(a[0][1]).assertEqual(3)
      expect(a[1][0] instanceof int).assertEqual(true)
      expect(a[1][0]).assertEqual(5)
      expect(a[1][1] instanceof int).assertEqual(true)
      expect(a[1][1]).assertEqual(7)

      expect(testNS_46.runTest_46()).assertEqual(true)
      expect(testNS_47.runTest_47()).assertEqual(true)
      expect(testNS_48.runTest_48()).assertEqual(true)
      expect(testNS_49.runTest_49()).assertEqual(true)
      expect(testNS_50.runTest_50()).assertEqual(true)
      expect(testNS_51.runTest_51()).assertEqual(true)
      expect(testNS_52.runTest_52()).assertEqual(true)
      expect(testNS_53.runTest_53()).assertEqual(true)
      expect(testNS_54.runTest_54()).assertEqual(true)
      expect(testNS_55.runTest_55()).assertEqual(true)
      expect(testNS_56.runTest_56()).assertEqual(true)
      expect(testNS_57.runTest_57()).assertEqual(true)
      expect(testNS_58.runTest_58()).assertEqual(true)
      expect(testNS_59.runTest_59()).assertEqual(true)
      expect(testNS_60.runTest_60()).assertEqual(true)

    });
  })
}