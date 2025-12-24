import { describe, it, xit, expect, TestType, Size, Level, afterEach, beforeAll } from "../../../hypium/index";

class Person {
  name: string;
  age: number;
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

function createAddSingleTask(set: containers.ConcurrentSet<number>, value: number): taskpool.Task {
  return new taskpool.Task((localSet: containers.ConcurrentSet<number>, v: number) => {
    localSet.add(v);
  }, set, value);
}

function createDeleteHasTask(set: containers.ConcurrentSet<number>, start: number): taskpool.Task {
  return new taskpool.Task((localSet: containers.ConcurrentSet<number>, s: number) => {
    for (let i = s; i < s + 10; i++) {
      localSet.has(i);
      localSet.delete(i);
    }
  }, set, start);
}

function createAddForDeleteHasTask(set: containers.ConcurrentSet<number>, start: number): taskpool.Task {
  return new taskpool.Task((localSet: containers.ConcurrentSet<number>, s: number) => {
    for (let i = s; i < s + 10; i++) {
      localSet.add(i);
    }
  }, set, start);
}

function createDeleteHasTaskHundred(set: containers.ConcurrentSet<number>, start: number): taskpool.Task {
  return new taskpool.Task((localSet: containers.ConcurrentSet<number>, s: number) => {
    for (let i = s; i < s + hundredTimes; i++) {
      localSet.delete(i);
    }
  }, set, start);
}

function createAddForDeleteHasTaskHundred(set: containers.ConcurrentSet<number>, start: number): taskpool.Task {
  return new taskpool.Task((localSet: containers.ConcurrentSet<number>, s: number) => {
    for (let i = s; i < s + hundredTimes; i++) {
      localSet.add(i);
    }
  }, set, start);
}

function createAddTask(set: containers.ConcurrentSet<number>, start: number, end: number): taskpool.Task {
  return new taskpool.Task((localSet: containers.ConcurrentSet<number>, s: number, e: number) => {
    for (let i = s; i < e; i++) {
      localSet.add(i);
    }
  }, set, start, end);
}

function createDeleteTaskEnd(set: containers.ConcurrentSet<number>, start: number, end: number): taskpool.Task {
  return new taskpool.Task((localSet: containers.ConcurrentSet<number>, s: number, e: number) => {
    for (let i = s; i < e; i++) {
      localSet.delete(i);
    }
  }, set, start, end);
}

function createDeleteTask(set: containers.ConcurrentSet<number>, start: number): taskpool.Task {
  return new taskpool.Task((localSet: containers.ConcurrentSet<number>, s: number) => {
    for (let i = s; i < s + hundredTimes; i++) {
      localSet.delete(i);
    }
  }, set, start);
}

function createAddDeleteHasTask(set: containers.ConcurrentSet<number>, start: number): taskpool.Task {
  return new taskpool.Task((localSet: containers.ConcurrentSet<number>, s: number) => {
    for (let i = 0; i < loopTenTimes; i++) {
      localSet.add(i);
      localSet.delete(i);
      localSet.has(i);
    }
  }, set, start);
}

function createConcurrentSetFromArrayLikeTask(arrayLikeTemp: ArrayLike<number>): taskpool.Task {
  return new taskpool.Task(async (arrayLike: ArrayLike<number>): Promise<containers.ConcurrentSet<number>> => {
    return new containers.ConcurrentSet<number>(arrayLike)
  }, arrayLikeTemp);
}

function createConcurrentSetFromIterTask(iterTemp: IterableIterator<number>): taskpool.Task {
  return new taskpool.Task(async (iter: IterableIterator<number>): Promise<containers.ConcurrentSet<number>> => {
    return new containers.ConcurrentSet<number>(iter)
  }, iterTemp);
}

// The expected value is 100 and to prevent runtime timeout, change the value to 10.
const hundredTimes: number = 10;
// The expected value is 10 and to prevent runtime timeout, change the value to 2.
const loopTenTimes: number = 2;
// The expected value is 5 and to prevent runtime timeout, change the value to 2.
const loopFiveTimes: number = 2;
// The expected value is 1000 and to prevent runtime timeout, change the value to 100.
const thousandTimes: number = 100;

export default function ConcurrentSetTest() {
  let intervalId: int | undefined = -1;

  describe("ConcurrentSetTest", (): void => {

    beforeAll((): void => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      intervalId = undefined;
    })

    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      if (intervalId !== undefined) {
        clearInterval(intervalId as int);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__001
     * @tc.name concurrent_Set_Constructor_Test_static_001
     * @tc.desc Initialize a ConcurrentSet using a parameterless initializer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__002
     * @tc.name concurrent_Set_Constructor_Test_static_002
     * @tc.desc Initialize the concurrentSet with an empty set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(set);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__003
     * @tc.name concurrent_Set_Constructor_Test_static_003
     * @tc.desc Initialize a concurrentSet with a set that contains a single element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(0);
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(set);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__004
     * @tc.name concurrent_Set_Constructor_Test_static_004
     * @tc.desc Initialize a concurrentSet with a set containing one thousand elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const totalCount: number = 1000;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(i);
      }
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(set);
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__005
     * @tc.name concurrent_Set_Constructor_Test_static_005
     * @tc.desc Initialize a ConcurrentSet with an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<number> = new Array<number>();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arrayTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__006
     * @tc.name concurrent_Set_Constructor_Test_static_006
     * @tc.desc Initialize a ConcurrentSet with an array containing a single element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<number> = new Array<number>();
      arrayTest.push(0);
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arrayTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__007
     * @tc.name concurrent_Set_Constructor_Test_static_007
     * @tc.desc Initialize the concurrentSet with an empty tuple.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let str = new Array<[number, number]>();
      let arrayLike = str as ArrayLike<[number, number]>;
      let concurrentSet = new containers.ConcurrentSet<[number, number]>(arrayLike);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__008
     * @tc.name concurrent_Set_Constructor_Test_static_008
     * @tc.desc Initialize a ConcurrentSet with a tuple containing a single element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const str = new Array<[number, number]>(1);
      str[0] = [0, 1];
      const arrayLike = str as ArrayLike<[number, number]>;
      const concurrentSet = new containers.ConcurrentSet<[number, number]>(arrayLike);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__010
     * @tc.name concurrent_Set_Constructor_Test_static_010
     * @tc.desc Initialize the `concurrentSet` with an empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const stringTest: string = '';
      const concurrentSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>(stringTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__011
     * @tc.name concurrent_Set_Constructor_Test_static_011
     * @tc.desc Initialize a ConcurrentSet with a non-empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const stringTest: string = 'abc';
      const concurrentSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>(stringTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('3');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__012
     * @tc.name concurrent_Set_Constructor_Test_static_012
     * @tc.desc Initialize a concurrentSet using an array-like object with keys and values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrKeys: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      const arrValues: string[] = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];
      const array = Array<[number, string]>(10);
      for (let i = 0; i < 10; i++) {
        const arrKV: [number, string] = [arrKeys[i], arrValues[i]]
        array[i] = arrKV;
      }
      const arrayLike = array as ArrayLike<[number, string]>;
      const concurrentSet: containers.ConcurrentSet<[number, string]> = new containers.ConcurrentSet<[number, string]>(arrayLike);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('10');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__013
     * @tc.name concurrent_Set_Constructor_Test_static_013
     * @tc.desc Initialize the concurrentSet with an empty iteration of the keys of a set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const iter = set.keys();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__014
     * @tc.name concurrent_Set_Constructor_Test_static_014
     * @tc.desc Initialize a concurrentSet with an empty iteration of the values from a set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const iter = set.values();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__015
     * @tc.name concurrent_Set_Constructor_Test_static_015
     * @tc.desc Initialize a concurrentSet with an empty iteration of entries from a set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const iter = set.entries();
      const concurrentSet: containers.ConcurrentSet<[Double, Double]> = new containers.ConcurrentSet<[Double, Double]>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__016
     * @tc.name concurrent_Set_Constructor_Test_static_016
     * @tc.desc Initialize a ConcurrentSet with an empty iteration of the values of an Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const array: Array<number> = new Array<number>();
      const iter = array.values();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__017
     * @tc.name concurrent_Set_Constructor_Test_static_017
     * @tc.desc Initialize a concurrentSet by iterating over the values of a set that contains only one element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(0);
      const iter = set.values();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      const res = concurrentSet.delete(0);
      expect(res).assertTrue();
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__018
     * @tc.name concurrent_Set_Constructor_Test_static_018
     * @tc.desc Initialize a concurrentSet by iterating over the keys of a set that contains only one element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(0);
      const iter = set.keys();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      const res = concurrentSet.delete(0);
      expect(res).assertTrue();
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__019
     * @tc.name concurrent_Set_Constructor_Test_static_019
     * @tc.desc Initialize a concurrentSet by iterating over the values of a array that contains only one element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const array: Array<number> = new Array<number>();
      array.push(0);
      const iter = array.values();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      const res = concurrentSet.delete(0);
      expect(res).assertTrue();
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__020
     * @tc.name concurrent_Set_Constructor_Test_static_020
     * @tc.desc Initialize a concurrentSet by iterating over the keys of a set containing one thousand elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let set: Set<number> = new Set<number>();
      const totalCount: number = 1000;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(i);
      }
      const iter = set.keys();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__021
     * @tc.name concurrent_Set_Constructor_Test_static_021
     * @tc.desc Initialize a concurrentSet by iterating over the values of a set containing one thousand elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const totalCount: number = 1000;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(i);
      }
      const iter = set.values();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__022
     * @tc.name concurrent_Set_Constructor_Test_static_022
     * @tc.desc Initialize a concurrentSet by iterating over the values of a array containing one thousand elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const array: Array<number> = new Array<number>();
      const totalCount: number = 1000;
      for (let i: int = 0; i < totalCount; i++) {
        array.push(i);
      }
      const iter = array.values();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__023
     * @tc.name concurrent_Set_Constructor_Test_static_023
     * @tc.desc Initialize a ConcurrentSet by iterating over the values of an array with 10 null elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const array: Array<null> = new Array<null>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        array.push(null);
      }
      const iter = array.values();
      const concurrentSet: containers.ConcurrentSet<null> = new containers.ConcurrentSet<null>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__024
     * @tc.name concurrent_Set_Constructor_Test_static_024
     * @tc.desc Initialize a ConcurrentSet by iterating over the keys of a Set that contains 10 elements all being null.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<null> = new Set<null>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(null);
      }
      const iter = set.keys();
      const concurrentSet: containers.ConcurrentSet<null> = new containers.ConcurrentSet<null>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__025
     * @tc.name concurrent_Set_Constructor_Test_static_025
     * @tc.desc Initialize a ConcurrentSet by iterating over the values of a Set that contains 10 elements all being null.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<null> = new Set<null>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(null);
      }
      const iter = set.values();
      const concurrentSet: containers.ConcurrentSet<null> = new containers.ConcurrentSet<null>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__026
     * @tc.name concurrent_Set_Constructor_Test_static_026
     * @tc.desc Initialize a ConcurrentSet by iterating over the values of a Set that contains 11 elements with values of either null or numbers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<null | number> = new Set<null | number>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(null);
      }
      for (let i: int = 0; i < totalCount; i++) {
        set.add(i);
      }
      const iter = set.values();
      const concurrentSet: containers.ConcurrentSet<null | number> = new containers.ConcurrentSet<null | number>(iter);
      expect(concurrentSet.size).assertEqual(totalCount + 1);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__027
     * @tc.name concurrent_Set_Constructor_Test_static_027
     * @tc.desc Initialize a ConcurrentSet by iterating over the keys of a Set that contains 11 elements with values of either null or numbers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<null | number> = new Set<null | number>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(null);
      }
      for (let i: int = 0; i < totalCount; i++) {
        set.add(i);
      }
      const iter = set.keys();
      const concurrentSet: containers.ConcurrentSet<null | number> = new containers.ConcurrentSet<null | number>(iter);
      expect(concurrentSet.size).assertEqual(totalCount + 1);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__028
     * @tc.name concurrent_Set_Constructor_Test_static_028
     * @tc.desc Initialize a ConcurrentSet by iterating over the values of a Array that contains 11 elements with values of either null or numbers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const array: Array<null | number> = new Array<null | number>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        array.push(null);
      }
      for (let i: int = 0; i < totalCount; i++) {
        array.push(i);
      }
      const iter = array.values();
      const concurrentSet: containers.ConcurrentSet<null | number> = new containers.ConcurrentSet<null | number>(iter);
      expect(concurrentSet.size).assertEqual(totalCount + 1);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__029
     * @tc.name concurrentSetTest_constructor_static_029
     * @tc.desc Initialize a concurrentSet by iterating over the values of an array that has 10 elements all with the value of undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrentSetTest_constructor_static_029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const array: Array<undefined> = new Array<undefined>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        array.push(undefined);
      }
      const iter = array.values();
      const concurrentSet: containers.ConcurrentSet<undefined> = new containers.ConcurrentSet<undefined>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__030
     * @tc.name  concurrent_Set_Constructor_Test_static_030
     * @tc.desc Initialize a concurrentSet by iterating over the keys of an set that has 10 elements all with the value of undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<undefined> = new Set<undefined>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(undefined);
      }
      const iter = set.keys();
      const concurrentSet: containers.ConcurrentSet<undefined> = new containers.ConcurrentSet<undefined>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__031
     * @tc.name concurrent_Set_Constructor_Test_static_031
     * @tc.desc Initialize a concurrentSet by iterating over the values of an set that has one elements with the value of undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<undefined> = new Set<undefined>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(undefined);
      }
      const iter = set.values();
      const concurrentSet: containers.ConcurrentSet<undefined> = new containers.ConcurrentSet<undefined>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__032
     * @tc.name concurrent_Set_Constructor_Test_static_032
     * @tc.desc Initialize a concurrentSet using the values iterator of a Set that contains 11 elements, where the element values are either undefined or numbers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<undefined | number> = new Set<undefined | number>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(undefined);
      }
      for (let i: int = 0; i < totalCount; i++) {
        set.add(i);
      }
      const iter = set.values();
      const concurrentSet: containers.ConcurrentSet<undefined | number> = new containers.ConcurrentSet<undefined | number>(iter);
      expect(concurrentSet.size).assertEqual(totalCount + 1);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__033
     * @tc.name concurrent_Set_Constructor_Test_static_033
     * @tc.desc Initialize a concurrentSet using the values iterator of a Set that contains 11 elements, where the element values are either undefined or numbers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<undefined | number> = new Set<undefined | number>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(undefined);
      }
      for (let i: int = 0; i < totalCount; i++) {
        set.add(i);
      }
      const iter = set.keys();
      const concurrentSet: containers.ConcurrentSet<undefined | number> = new containers.ConcurrentSet<undefined | number>(iter);
      expect(concurrentSet.size).assertEqual(totalCount + 1);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__034
     * @tc.name concurrent_Set_Constructor_Test_static_034
     * @tc.desc Initialize a concurrentSet using the values iterator of a Array that contains 20 elements, where the element values are either undefined or numbers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const array: Array<undefined | number> = new Array<undefined | number>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        array.push(undefined);
      }
      for (let i: int = 0; i < totalCount; i++) {
        array.push(i);
      }
      const iter = array.values();
      const concurrentSet: containers.ConcurrentSet<undefined | number> = new containers.ConcurrentSet<undefined | number>(iter);
      expect(concurrentSet.size).assertEqual(totalCount + 1);
    })


    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__043
     * @tc.name concurrent_Set_Constructor_Test_static_043
     * @tc.desc Initialize a concurrentSet with a nested array containing 0 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<Array<Array<number>>> = new Array<Array<Array<number>>>();
      const concurrentSet: containers.ConcurrentSet<Array<Array<number>>> = new containers.ConcurrentSet<Array<Array<number>>>(arrayTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__044
     * @tc.name concurrent_Set_Constructor_Test_static_044
     * @tc.desc Initialize a concurrentSet with a nested array containing one elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<Array<Array<number>>> = new Array<Array<Array<number>>>();
      arrayTest.push(new Array<Array<number>>(new Array<number>(0)));
      const concurrentSet: containers.ConcurrentSet<Array<Array<number>>> = new containers.ConcurrentSet<Array<Array<number>>>(arrayTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__045
     * @tc.name concurrent_Set_Constructor_Test_static_045
     * @tc.desc Initialize a concurrentSet with a nested array containing 1000 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<Array<Array<number>>> = new Array<Array<Array<number>>>();
      const totalCount: number = 1000;
      for (let index = 0; index < totalCount; index++) {
        arrayTest.push(new Array<Array<number>>(new Array<number>(index)));
      }
      const concurrentSet: containers.ConcurrentSet<Array<Array<number>>> = new containers.ConcurrentSet<Array<Array<number>>>(arrayTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__046
     * @tc.name concurrent_Set_Constructor_Test_static_046
     * @tc.desc Initialize a ConcurrentSet by iterating over the values of a nested array with 0 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<Array<Array<number>>> = new Array<Array<Array<number>>>();
      const iter = arrayTest.values();
      const concurrentSet: containers.ConcurrentSet<Array<Array<number>>> = new containers.ConcurrentSet<Array<Array<number>>>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__047
     * @tc.name concurrent_Set_Constructor_Test_static_047
     * @tc.desc Initialize a ConcurrentSet by iterating over the values of a nested array with 1 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<Array<Array<number>>> = new Array<Array<Array<number>>>();
      arrayTest.push(new Array<Array<number>>(new Array<number>(0)));
      const iter = arrayTest.values();
      const concurrentSet: containers.ConcurrentSet<Array<Array<number>>> = new containers.ConcurrentSet<Array<Array<number>>>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Constructor_Test_static__048
     * @tc.name concurrent_Set_Constructor_Test_static_048
     * @tc.desc Initialize a ConcurrentSet by iterating over the values of a nested array with 1000 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Constructor_Test_static_048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<Array<Array<number>>> = new Array<Array<Array<number>>>();
      const totalCount: number = 1000;
      for (let index = 0; index < totalCount; index++) {
        arrayTest.push(new Array<Array<number>>(new Array<number>(index)));
      }
      const iter = arrayTest.values();
      const concurrentSet: containers.ConcurrentSet<Array<Array<number>>> = new containers.ConcurrentSet<Array<Array<number>>>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__049
     * @tc.name concurrent_Set_Add_Test_static_001
     * @tc.desc Add a null element to the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<null> = new containers.ConcurrentSet<null>();
      concurrentSet.add(null);
      concurrentSet.add(null);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__050
     * @tc.name concurrent_Set_Add_Test_static_002
     * @tc.desc Add a undefined element to the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<undefined> = new containers.ConcurrentSet<undefined>();
      concurrentSet.add(undefined);
      concurrentSet.add(undefined);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__051
     * @tc.name concurrent_Set_Add_Test_static_003
     * @tc.desc Add a object element to the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<object> = new containers.ConcurrentSet<object>();
      const obj = new Object();
      concurrentSet.add(obj);
      concurrentSet.add(obj);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__052
     * @tc.name concurrent_Set_Add_Test_static_004
     * @tc.desc Add elements of mixed types to the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number | undefined | object | null> = new containers.ConcurrentSet<number | undefined | object | null>();
      const obj = new Object();
      concurrentSet.add(obj);
      concurrentSet.add(obj);
      concurrentSet.add(undefined);
      concurrentSet.add(undefined);
      concurrentSet.add(null);
      concurrentSet.add(null);
      concurrentSet.add(0);
      concurrentSet.add(1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('5');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__053
     * @tc.name concurrent_Set_Add_Test_static_005
     * @tc.desc Add elements of the numeric type to the concurrentSet
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      concurrentSet.add(42);
      concurrentSet.add(3.14);
      concurrentSet.add(Number.MAX_VALUE);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('3');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__054
     * @tc.name concurrent_Set_Add_Test_static_006
     * @tc.desc Add elements of ordinary numeric types and boxed numeric types to the ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Number> = new containers.ConcurrentSet<Number>();
      concurrentSet.add(42);
      concurrentSet.add(3.14);
      concurrentSet.add(new Number(43));
      concurrentSet.add(Number.MAX_VALUE);
      concurrentSet.add(Number(80));
      expect(JSON.stringify(concurrentSet.size)).assertEqual('5');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__055
     * @tc.name concurrent_Set_Add_Test_static_007
     * @tc.desc Add elements of ordinary string type and boxed string type to the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<String> = new containers.ConcurrentSet<String>();
      concurrentSet.add("hello");
      concurrentSet.add("world");
      concurrentSet.add(`template ${1 + 1}`);
      concurrentSet.add(new String("string"));
      expect(JSON.stringify(concurrentSet.size)).assertEqual('4');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__056
     * @tc.name concurrent_Set_Add_Test_static_008
     * @tc.desc Add elements of the BigInt type to the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<BigInt> = new containers.ConcurrentSet<BigInt>();
      concurrentSet.add(BigInt(123));
      concurrentSet.add(BigInt('567'));
      concurrentSet.add(456n);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('3');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__057
     * @tc.name concurrent_Set_Add_Test_static_009
     * @tc.desc Add elements of the Boolean type to the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Boolean> = new containers.ConcurrentSet<Boolean>();
      concurrentSet.add(new Boolean(true));
      concurrentSet.add(false);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__058
     * @tc.name concurrent_Set_Add_Test_static_010
     * @tc.desc Add a class element to the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Person> = new containers.ConcurrentSet<Person>();
      concurrentSet.add(new Person('aimi', 15));
      concurrentSet.add(new Person('kimi', 13));
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__059
     * @tc.name concurrent_Set_Add_Test_static_011
     * @tc.desc Add a array element to the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Array<number>> = new containers.ConcurrentSet<Array<number>>();
      concurrentSet.add(new Array<number>(15, 16));
      concurrentSet.add(new Array<number>(20, 21));
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__060
     * @tc.name concurrent_Set_Add_Test_static_012
     * @tc.desc Add multiple elements of type Object to the ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Object> = new containers.ConcurrentSet<Object>();
      concurrentSet.add(new Object());
      concurrentSet.add(new Object());
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__061
     * @tc.name concurrent_Set_Add_Test_static_013
     * @tc.desc Add multiple types of elements to the concurrentSet, and some elements are added repeatedly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number | null | undefined | Person> = new containers.ConcurrentSet<number | null | undefined | Person>();
      concurrentSet.add(1);
      concurrentSet.add(2);
      concurrentSet.add(1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      concurrentSet.add(null);
      concurrentSet.add(null);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('3');
      concurrentSet.add(undefined);
      concurrentSet.add(undefined);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('4');
      const person1: Person = new Person('aimi', 15);
      const person2: Person = new Person('aimi', 15);
      concurrentSet.add(person1);
      concurrentSet.add(person2);
      concurrentSet.add(person1);
      concurrentSet.add(person2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('6');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__062
     * @tc.name concurrent_Set_Add_Test_static_014
     * @tc.desc After clearing all elements of a non-empty set, add elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        concurrentSet.add(i);
      }
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
      concurrentSet.clear();
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      concurrentSet.add(0);
      concurrentSet.add(1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(0)).assertTrue();
      expect(concurrentSet.has(1)).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__063
     * @tc.name concurrent_Set_Add_Test_static_015
     * @tc.desc A non-empty set deletes all elements and then adds elements after deletion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      const totalCount: number = 10;
      for (let i: int = 0; i < totalCount; i++) {
        concurrentSet.add(i);
      }
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
      for (let i: int = 0; i < totalCount; i++) {
        concurrentSet.delete(i);
      }
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      concurrentSet.add(0);
      concurrentSet.add(1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(0)).assertTrue();
      expect(concurrentSet.has(1)).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Add_Test_static__064
     * @tc.name concurrent_Set_Add_Test_static_016
     * @tc.desc Insert 100 pieces of data every 10 milliseconds and repeat this operation 100 times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Add_Test_static_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Number> = new containers.ConcurrentSet<Number>();
      let insertCount: Number = 0;
      let intervalId: Number;
      intervalId = setInterval((): void => {
        for (let i: Number = 0; i < 100; i++) {
          const value: Number = insertCount * 100 + i;
          concurrentSet.add(value);
        }
        insertCount++;
        if (insertCount === 100) {
          if (intervalId !== undefined) {
            clearInterval(intervalId.toInt());
          }
          const expectedSize: Number = 100 * 100;
          expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(expectedSize));
        }
      }, 10);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__065
     * @tc.name concurrent_Set_Delete_Test_static_001
     * @tc.desc Remove null from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<null> = new containers.ConcurrentSet<null>();
      concurrentSet.add(null);
      concurrentSet.add(null);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(null)).assertTrue();
      concurrentSet.delete(null);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(null)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__066
     * @tc.name concurrent_Set_Delete_Test_static_002
     * @tc.desc Remove undefined from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<undefined> = new containers.ConcurrentSet<undefined>();
      concurrentSet.add(undefined);
      concurrentSet.add(undefined);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(undefined)).assertTrue();
      concurrentSet.delete(undefined);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(undefined)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__067
     * @tc.name concurrent_Set_Delete_Test_static_003
     * @tc.desc Remove object from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Object> = new containers.ConcurrentSet<Object>();
      const obj: Object = new Object();
      const object2: Object = new Object();
      concurrentSet.add(obj);
      concurrentSet.add(object2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(obj)).assertTrue();
      concurrentSet.delete(obj);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(obj)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__068
     * @tc.name concurrent_Set_Delete_Test_static_004
     * @tc.desc Remove BigInt from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<BigInt> = new containers.ConcurrentSet<BigInt>();
      const bigInt: BigInt = BigInt(123);
      const bigInt2: BigInt = 456n;
      concurrentSet.add(bigInt);
      concurrentSet.add(bigInt2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(bigInt)).assertTrue();
      concurrentSet.delete(bigInt);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(bigInt)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__069
     * @tc.name concurrent_Set_Delete_Test_static_005
     * @tc.desc Remove string from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<String> = new containers.ConcurrentSet<String>();
      const string1: String = new String("123");
      const string2: String = "456";
      concurrentSet.add(string1);
      concurrentSet.add(string2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(string1)).assertTrue();
      concurrentSet.delete(string1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(string1)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__070
     * @tc.name concurrent_Set_Delete_Test_static_006
     * @tc.desc Remove boolean from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Boolean> = new containers.ConcurrentSet<Boolean>();
      const boolean1: Boolean = new Boolean(false);
      const boolean2: Boolean = new Boolean(true);
      concurrentSet.add(boolean1);
      concurrentSet.add(boolean2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(boolean1)).assertTrue();
      concurrentSet.delete(boolean1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(boolean1)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__071
     * @tc.name concurrent_Set_Delete_Test_static_007
     * @tc.desc Remove class from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Person> = new containers.ConcurrentSet<Person>();
      const person: Person = new Person('kimi', 13);
      const person2: Person = new Person('kimi', 13);
      concurrentSet.add(person);
      concurrentSet.add(person2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(person)).assertTrue();
      concurrentSet.delete(person);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(person)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__072
     * @tc.name concurrent_Set_Delete_Test_static_008
     * @tc.desc Remove array from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Array<number>> = new containers.ConcurrentSet<Array<number>>();
      const array: Array<number> = new Array<number>();
      array.push(0);
      const array2: Array<number> = new Array<number>();
      array2.push(0);
      concurrentSet.add(array);
      concurrentSet.add(array2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(array)).assertTrue();
      concurrentSet.delete(array);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(array)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__073
     * @tc.name concurrent_Set_Delete_Test_static_009
     * @tc.desc Remove number from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Number> = new containers.ConcurrentSet<Number>();
      const num: Number = new Number(10);
      const number2: Number = new Number(11);
      concurrentSet.add(num);
      concurrentSet.add(number2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(num)).assertTrue();
      concurrentSet.delete(num);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(num)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__074
     * @tc.name concurrent_Set_Delete_Test_static_010
     * @tc.desc Delete a non-existent element from the `concurrentSet`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      const num: number = 10;
      concurrentSet.add(num);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(num)).assertTrue();
      concurrentSet.delete(2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(num)).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__075
     * @tc.name concurrent_Set_Delete_Test_static_011
     * @tc.desc Remove the set that has only one element which is null from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<null> = new containers.ConcurrentSet<null>();
      concurrentSet.add(null);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(null)).assertTrue();
      concurrentSet.delete(null);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(null)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__076
     * @tc.name concurrent_Set_Delete_Test_static_012
     * @tc.desc Remove the set that has only one element which is undefined from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<undefined> = new containers.ConcurrentSet<undefined>();
      concurrentSet.add(undefined);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(undefined)).assertTrue();
      concurrentSet.delete(undefined);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(undefined)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__077
     * @tc.name concurrent_Set_Delete_Test_static_013
     * @tc.desc Remove the set that has only one element which is object from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Object> = new containers.ConcurrentSet<Object>();
      const obj: Object = new Object();
      concurrentSet.add(obj);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(obj)).assertTrue();
      concurrentSet.delete(obj);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(obj)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__078
     * @tc.name concurrent_Set_Delete_Test_static_014
     * @tc.desc Remove the set that has only one element which is bigInt from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<BigInt> = new containers.ConcurrentSet<BigInt>();
      const bigInt: BigInt = BigInt(123);
      concurrentSet.add(bigInt);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(bigInt)).assertTrue();
      concurrentSet.delete(bigInt);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(bigInt)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__079
     * @tc.name concurrent_Set_Delete_Test_static_015
     * @tc.desc Remove the set that has only one element which is string from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<String> = new containers.ConcurrentSet<String>();
      const string1: String = new String("123");
      concurrentSet.add(string1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(string1)).assertTrue();
      concurrentSet.delete(string1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(string1)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__080
     * @tc.name concurrent_Set_Delete_Test_static_016
     * @tc.desc Remove the set that has only one element which is boolean from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Boolean> = new containers.ConcurrentSet<Boolean>();
      const boolean1: Boolean = new Boolean(false);
      concurrentSet.add(boolean1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(boolean1)).assertTrue();
      concurrentSet.delete(boolean1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(boolean1)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__081
     * @tc.name concurrent_Set_Delete_Test_static_017
     * @tc.desc Remove the set that has only one element which is class from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Person> = new containers.ConcurrentSet<Person>();
      const person: Person = new Person('kimi', 13);
      concurrentSet.add(person);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(person)).assertTrue();
      concurrentSet.delete(person);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(person)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__082
     * @tc.name concurrent_Set_Delete_Test_static_018
     * @tc.desc Remove the set that has only one element which is array from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Array<number>> = new containers.ConcurrentSet<Array<number>>();
      const array: Array<number> = new Array<number>();
      array.push(0);
      concurrentSet.add(array);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(array)).assertTrue();
      concurrentSet.delete(array);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(array)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Delete_Test_static__083
     * @tc.name concurrent_Set_Delete_Test_static_019
     * @tc.desc Remove the set that has only one element which is number from the concurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Delete_Test_static_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Number> = new containers.ConcurrentSet<Number>();
      const num: Number = new Number(10);
      concurrentSet.add(num);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(num)).assertTrue();
      concurrentSet.delete(num);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(num)).assertFalse();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Has_Test_static__084
     * @tc.name concurrent_Set_Has_Test_static_001
     * @tc.desc Determine whether there is a null value in the ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Has_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<null> = new containers.ConcurrentSet<null>();
      concurrentSet.add(null);
      concurrentSet.add(null);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(null)).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Has_Test_static__085
     * @tc.name concurrent_Set_Has_Test_static_002
     * @tc.desc Determine whether there is a undefined value in the ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Has_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<undefined> = new containers.ConcurrentSet<undefined>();
      concurrentSet.add(undefined);
      concurrentSet.add(undefined);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(undefined)).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Has_Test_static__086
     * @tc.name concurrent_Set_Has_Test_static_003
     * @tc.desc Determine whether there is a object value in the ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Has_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Object> = new containers.ConcurrentSet<Object>();
      const obj: Object = new Object();
      const object2: Object = new Object();
      concurrentSet.add(obj);
      concurrentSet.add(object2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(obj)).assertTrue();
      expect(concurrentSet.has(object2)).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Has_Test_static__087
     * @tc.name concurrent_Set_Has_Test_static_004
     * @tc.desc Determine whether there is a bigInt value in the ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Has_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<BigInt> = new containers.ConcurrentSet<BigInt>();
      const bigInt: BigInt = BigInt(123);
      const bigInt2: BigInt = 456n;
      concurrentSet.add(bigInt);
      concurrentSet.add(bigInt2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(bigInt)).assertTrue();
      expect(concurrentSet.has(bigInt2)).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Has_Test_static__088
     * @tc.name concurrent_Set_Has_Test_static_005
     * @tc.desc Determine whether there is a string value in the ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Has_Test_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<String> = new containers.ConcurrentSet<String>();
      const string1: String = new String("123");
      const string2: String = "456";
      concurrentSet.add(string1);
      concurrentSet.add(string2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(string1)).assertTrue();
      expect(concurrentSet.has(string2)).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Has_Test_static__089
     * @tc.name concurrent_Set_Has_Test_static_006
     * @tc.desc Determine whether there is a boolean value in the ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Has_Test_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Boolean> = new containers.ConcurrentSet<Boolean>();
      const boolean1: Boolean = new Boolean(false);
      const boolean2: Boolean = new Boolean(true);
      concurrentSet.add(boolean1);
      concurrentSet.add(boolean2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(boolean1)).assertTrue();
      expect(concurrentSet.has(boolean2)).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Has_Test_static__090
     * @tc.name concurrent_Set_Has_Test_static_007
     * @tc.desc Determine whether there is a class value in the ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Has_Test_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Person> = new containers.ConcurrentSet<Person>();
      const person: Person = new Person('kimi', 13);
      const person2: Person = new Person('kimi', 13);
      concurrentSet.add(person);
      concurrentSet.add(person2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(person)).assertTrue();
      expect(concurrentSet.has(person2)).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Has_Test_static__091
     * @tc.name concurrent_Set_Has_Test_static_008
     * @tc.desc Determine whether there is a array value in the ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Has_Test_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Array<number>> = new containers.ConcurrentSet<Array<number>>();
      const array: Array<number> = new Array<number>();
      array.push(0);
      const array2: Array<number> = new Array<number>();
      array2.push(0);
      concurrentSet.add(array);
      concurrentSet.add(array2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(array)).assertTrue();
      expect(concurrentSet.has(array2)).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Has_Test_static__092
     * @tc.name concurrent_Set_Has_Test_static_009
     * @tc.desc Determine whether there is a number value in the ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Has_Test_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Number> = new containers.ConcurrentSet<Number>();
      const num: Number = new Number(10);
      const number2: Number = new Number(11);
      concurrentSet.add(num);
      concurrentSet.add(number2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(num)).assertTrue();
      expect(concurrentSet.has(number2)).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Clear_And_Size_Test_static__093
     * @tc.name concurrent_Set_Clear_And_Size_Test_static_001
     * @tc.desc The concurrentSet element is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Clear_And_Size_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      concurrentSet.clear();
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Clear_And_Size_Test_static__094
     * @tc.name concurrent_Set_Clear_And_Size_Test_static_002
     * @tc.desc There is one element in the concurrent set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Clear_And_Size_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      concurrentSet.add(0);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      concurrentSet.clear();
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Clear_And_Size_Test_static__095
     * @tc.name concurrent_Set_Clear_And_Size_Test_static_003
     * @tc.desc There are multiple elements in the ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Clear_And_Size_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      concurrentSet.add(0);
      concurrentSet.add(1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      concurrentSet.clear();
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Clear_And_Size_Test_static__096
     * @tc.name concurrent_Set_Clear_And_Size_Test_static_004
     * @tc.desc Repeatedly add, clear, and remove elements from the `concurrentSet`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Clear_And_Size_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      concurrentSet.add(0);
      concurrentSet.add(1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      concurrentSet.clear();
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      concurrentSet.add(2);
      concurrentSet.add(3);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      concurrentSet.delete(2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      concurrentSet.add(4);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      concurrentSet.add(5);
      concurrentSet.delete(4);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      concurrentSet.add(6);
      concurrentSet.add(7);
      concurrentSet.add(8);
      concurrentSet.add(9);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('6');
      concurrentSet.delete(6);
      concurrentSet.delete(7);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('4');
      concurrentSet.clear();
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_ToString_Test_static__097
     * @tc.name concurrent_Set_ToString_Test_static_001
     * @tc.desc Test the toString method when the concurrentSet is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_ToString_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      expect(concurrentSet.toString()).assertEqual("ConcurrentSet[]");
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_ToString_Test_static__098
     * @tc.name concurrent_Set_ToString_Test_static_002
     * @tc.desc Test of the toString method when the elements of concurrentSet are numbers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_ToString_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      concurrentSet.add(0);
      concurrentSet.add(1);
      concurrentSet.add(2);
      expect(concurrentSet.toString()).assertEqual("ConcurrentSet[0,1,2]");
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_ToString_Test_static__099
     * @tc.name concurrent_Set_ToString_Test_static_003
     * @tc.desc Test of the toString method when the elements of concurrentSet are boolean.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_ToString_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<boolean> = new containers.ConcurrentSet<boolean>();
      concurrentSet.add(true);
      concurrentSet.add(false);
      expect(concurrentSet.toString()).assertEqual("ConcurrentSet[true,false]");
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_ToString_Test_static__100
     * @tc.name concurrent_Set_ToString_Test_static_004
     * @tc.desc Test of the toString method when the elements of concurrentSet are string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_ToString_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>();
      concurrentSet.add('A');
      concurrentSet.add('B');
      concurrentSet.add('C');
      expect(concurrentSet.toString()).assertEqual("ConcurrentSet[A,B,C]");
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrentSetKeysTest_101
     * @tc.name concurrent_SetKeys_Test_static_001
     * @tc.desc The elements are empty in the keys iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_SetKeys_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      const iter = concurrentSet.keys();
      const arrayForSet: Array<number> = new Array<number>();
      while (true) {
        const v = iter.next()
        if (v.done) {
          break;
        }
        const value = v.value;
        if (value !== undefined) {
          arrayForSet.push(value);
        }
      };
      expect(JSON.stringify(arrayForSet.length)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrentSetKeysTest_102
     * @tc.name concurrent_SetKeys_Test_static_002
     * @tc.desc Iterate with keys when there is a single element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_SetKeys_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      concurrentSet.add(0);
      const iter = concurrentSet.keys();
      const arrayForSet: Array<number> = new Array<number>();
      while (true) {
        const v = iter.next()
        if (v.done) {
          break;
        }
        const value = v.value;
        if (value !== undefined) {
          arrayForSet.push(value);
        }
      };
      expect(JSON.stringify(arrayForSet.length)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrentSetKeysTest_103
     * @tc.name concurrent_SetKeys_Test_static_003
     * @tc.desc Iteration over keys when there are one hundred elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_SetKeys_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      for (let i: int = 0; i < 100; i++) {
        concurrentSet.add(i);
      }
      const iter = concurrentSet.keys();
      const arrayForSet: Array<number> = new Array<number>();
      while (true) {
        const v = iter.next()
        if (v.done) {
          break;
        }
        const value = v.value;
        if (value !== undefined) {
          arrayForSet.push(value);
        }
      };
      expect(JSON.stringify(arrayForSet.length)).assertEqual('100');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrentSetKeysTest_104
     * @tc.name concurrent_SetKeys_Test_static_004
     * @tc.desc As an input parameter, pass in a new set to perform element judgment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_SetKeys_Test_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      const totalCount: number = 100;
      for (let i: int = 0; i < totalCount; i++) {
        concurrentSet.add(i);
      }
      const iter = concurrentSet.keys();
      const concurrentSet2: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet2.size)).assertEqual(JSON.stringify(totalCount));
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Values_Test_static__105
     * @tc.name concurrent_Set_Values_Test_static_001
     * @tc.desc Iterating over the values when the concurrentSet is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Values_Test_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      const iter = concurrentSet.values();
      const arrayForSet: Array<number> = new Array<number>();
      while (true) {
        const v = iter.next()
        if (v.done) {
          break;
        }
        const value = v.value;
        if (value !== undefined) {
          arrayForSet.push(value);
        }
      };
      expect(JSON.stringify(arrayForSet.length)).assertEqual('0');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Values_Test_static__106
     * @tc.name concurrent_Set_Values_Test_static_002
     * @tc.desc Iterate over the values when adding an element to a ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Values_Test_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      concurrentSet.add(0);
      const iter = concurrentSet.values();
      const arrayForSet: Array<number> = new Array<number>();
      while (true) {
        const v = iter.next()
        if (v.done) {
          break;
        }
        const value = v.value;
        if (value !== undefined) {
          arrayForSet.push(value);
        }
      };
      expect(JSON.stringify(arrayForSet.length)).assertEqual('1');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_concurrent_Set_Values_Test_static__107
     * @tc.name concurrent_Set_Values_Test_static_003
     * @tc.desc Iterate over the values when adding 100 elements to a ConcurrentSet.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("concurrent_Set_Values_Test_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      for (let i: int = 0; i < 100; i++) {
        concurrentSet.add(i);
      }
      const iter = concurrentSet.values();
      const arrayForSet: Array<number> = new Array<number>();
      while (true) {
        const v = iter.next()
        if (v.done) {
          break;
        }
        const value = v.value;
        if (value !== undefined) {
          arrayForSet.push(value);
        }
      };
      expect(JSON.stringify(arrayForSet.length)).assertEqual('100');
    })
