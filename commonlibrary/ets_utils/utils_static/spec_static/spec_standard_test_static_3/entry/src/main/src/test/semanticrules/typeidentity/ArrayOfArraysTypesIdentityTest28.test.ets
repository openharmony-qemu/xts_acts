import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

namespace testNS301 {
  class C {data: int = 0}
  function cast(p: Object) {
    return p as Array<C[]>
  }

  export function runTest(): boolean {
    let a: Array<C>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C[]> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}

class C {data: int = 0}
function cast(p: Object) {
  return p as Array<C[]>
}

namespace testNS302 {
  class C {data: int = 0}
  function cast(p: Object): Array<C[]> {
    return p as Array<C>[]
  }

  export function runTest(): boolean {
    let a: Array<C>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
    let b: Array<C[]> = cast(a)
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(b instanceof Array).assertEqual(true)
    expect(b[0] instanceof Array).assertEqual(true)
    expect(b[1] instanceof Array).assertEqual(true)
    expect(b.length).assertEqual(2)
    expect(b[0].length).assertEqual(2)
    expect(b[1].length).assertEqual(2)
    expect(b[0][0] instanceof C).assertEqual(true)
    expect(b[0][0].data instanceof int).assertEqual(true)
    expect(b[0][0].data).assertEqual(1)
    expect(b[0][1] instanceof C).assertEqual(true)
    expect(b[0][1].data instanceof int).assertEqual(true)
    expect(b[0][1].data).assertEqual(3)
    expect(b[1][0] instanceof C).assertEqual(true)
    expect(b[1][0].data instanceof int).assertEqual(true)
    expect(b[1][0].data).assertEqual(5)
    expect(b[1][1] instanceof C).assertEqual(true)
    expect(b[1][1].data instanceof int).assertEqual(true)
    expect(b[1][1].data).assertEqual(7)
    a = b
    expect(a instanceof Array).assertEqual(true)
    expect(a[0] instanceof Array).assertEqual(true)
    expect(a[1] instanceof Array).assertEqual(true)
    expect(a.length).assertEqual(2)
    expect(a[0].length).assertEqual(2)
    expect(a[1].length).assertEqual(2)
    expect(a[0][0] instanceof C).assertEqual(true)
    expect(a[0][0].data instanceof int).assertEqual(true)
    expect(a[0][0].data).assertEqual(1)
    expect(a[0][1] instanceof C).assertEqual(true)
    expect(a[0][1].data instanceof int).assertEqual(true)
    expect(a[0][1].data).assertEqual(3)
    expect(a[1][0] instanceof C).assertEqual(true)
    expect(a[1][0].data instanceof int).assertEqual(true)
    expect(a[1][0].data).assertEqual(5)
    expect(a[1][1] instanceof C).assertEqual(true)
    expect(a[1][1].data instanceof int).assertEqual(true)
    expect(a[1][1].data).assertEqual(7)
    return true
  }
}


export default function ArrayOfArraysTypesIdentityTest28(): void {
  describe('ArrayOfArraysTypesIdentityTest28', () => {
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

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_7400
     * @tc.name      testArrayOfArraysTypesIdentity0074
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0074';
      let a: Array<C>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C[]> = cast(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS301.runTest()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_7500
     * @tc.name      testArrayOfArraysTypesIdentity0075
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0075';
      let a: Array<C>[] = [[{data: 1}, {data: 3}], [{data: 5}, {data: 7}]]
      let b: Array<C[]> = cast(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C).assertEqual(true)
      expect(b[0][0].data instanceof int).assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C).assertEqual(true)
      expect(b[0][1].data instanceof int).assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C).assertEqual(true)
      expect(b[1][0].data instanceof int).assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C).assertEqual(true)
      expect(b[1][1].data instanceof int).assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C).assertEqual(true)
      expect(a[0][0].data instanceof int).assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C).assertEqual(true)
      expect(a[0][1].data instanceof int).assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C).assertEqual(true)
      expect(a[1][0].data instanceof int).assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C).assertEqual(true)
      expect(a[1][1].data instanceof int).assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS302.runTest()).assertEqual(true)
    });
  })
}