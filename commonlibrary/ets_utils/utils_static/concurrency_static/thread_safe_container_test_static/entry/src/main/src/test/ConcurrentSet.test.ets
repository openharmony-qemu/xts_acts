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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_001
     * @tc.name: concurrentSetConstructorTest001
     * @tc.desc: Initialize a ConcurrentSet using a parameterless initializer.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_002
     * @tc.name: concurrentSetConstructorTest002
     * @tc.desc: Initialize the concurrentSet with an empty set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(set);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_003
     * @tc.name: concurrentSetConstructorTest003
     * @tc.desc: Initialize a concurrentSet with a set that contains a single element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(0);
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(set);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_004
     * @tc.name: concurrentSetConstructorTest004
     * @tc.desc: Initialize a concurrentSet with a set containing one thousand elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const totalCount: number = 1000;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(i);
      }
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(set);
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_005
     * @tc.name: concurrentSetConstructorTest005
     * @tc.desc: Initialize a ConcurrentSet with an empty array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<number> = new Array<number>();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arrayTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_006
     * @tc.name: concurrentSetConstructorTest006
     * @tc.desc: Initialize a ConcurrentSet with an array containing a single element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<number> = new Array<number>();
      arrayTest.push(0);
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(arrayTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_007
     * @tc.name: concurrentSetConstructorTest007
     * @tc.desc: Initialize the concurrentSet with an empty tuple.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let str = new Array<[number, number]>();
      let arrayLike = str as ArrayLike<[number, number]>;
      let concurrentSet = new containers.ConcurrentSet<[number, number]>(arrayLike);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_008
     * @tc.name: concurrentSetConstructorTest008
     * @tc.desc: Initialize a ConcurrentSet with a tuple containing a single element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const str = new Array<[number, number]>(1);
      str[0] = [0, 1];
      const arrayLike = str as ArrayLike<[number, number]>;
      const concurrentSet = new containers.ConcurrentSet<[number, number]>(arrayLike);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_009
     * @tc.name: concurrentSetConstructorTest009
     * @tc.desc: Initialize a concurrentSet using two tuple.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const str = new Array<[number, number, number]>();
      str[0] = [0, 1, 2];
      str[1] = [3, 4, 5];
      const arrayLike = str as ArrayLike<[number, number, number]>;
      const concurrentSet: containers.ConcurrentSet<[number, number, number]> = new containers.ConcurrentSet<[number, number, number]>(arrayLike);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_010
     * @tc.name: concurrentSetConstructorTest010
     * @tc.desc: Initialize the `concurrentSet` with an empty string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const stringTest: string = '';
      const concurrentSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>(stringTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_011
     * @tc.name: concurrentSetConstructorTest011
     * @tc.desc: Initialize a ConcurrentSet with a non-empty string.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const stringTest: string = 'abc';
      const concurrentSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>(stringTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('3');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_012
     * @tc.name: concurrentSetConstructorTest012
     * @tc.desc: Initialize a concurrentSet using an array-like object with keys and values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_013
     * @tc.name: concurrentSetConstructorTest013
     * @tc.desc: Initialize the concurrentSet with an empty iteration of the keys of a set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const iter = set.keys();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_014
     * @tc.name: concurrentSetConstructorTest014
     * @tc.desc: Initialize a concurrentSet with an empty iteration of the values from a set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const iter = set.values();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_015
     * @tc.name: concurrentSetConstructorTest015
     * @tc.desc: Initialize a concurrentSet with an empty iteration of entries from a set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const iter = set.entries();
      const concurrentSet: containers.ConcurrentSet<[Double, Double]> = new containers.ConcurrentSet<[Double, Double]>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_016
     * @tc.name: concurrentSetConstructorTest016
     * @tc.desc: Initialize a ConcurrentSet with an empty iteration of the values of an Array.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const array: Array<number> = new Array<number>();
      const iter = array.values();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_017
     * @tc.name: concurrentSetConstructorTest017
     * @tc.desc: Initialize a concurrentSet by iterating over the values of a set that contains only one element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_018
     * @tc.name: concurrentSetConstructorTest018
     * @tc.desc: Initialize a concurrentSet by iterating over the keys of a set that contains only one element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_019
     * @tc.name: concurrentSetConstructorTest019
     * @tc.desc: Initialize a concurrentSet by iterating over the values of a array that contains only one element.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_020
     * @tc.name: concurrentSetConstructorTest020
     * @tc.desc: Initialize a concurrentSet by iterating over the keys of a set containing one thousand elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_021
     * @tc.name: concurrentSetConstructorTest021
     * @tc.desc: Initialize a concurrentSet by iterating over the values of a set containing one thousand elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_022
     * @tc.name: concurrentSetConstructorTest022
     * @tc.desc: Initialize a concurrentSet by iterating over the values of a array containing one thousand elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_023
     * @tc.name: concurrentSetConstructorTest023
     * @tc.desc: Initialize a ConcurrentSet by iterating over the values of an array with 10 null elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_024
     * @tc.name: concurrentSetConstructorTest024
     * @tc.desc: Initialize a ConcurrentSet by iterating over the keys of a Set that contains 10 elements all being null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_025
     * @tc.name: concurrentSetConstructorTest025
     * @tc.desc: Initialize a ConcurrentSet by iterating over the values of a Set that contains 10 elements all being null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_026
     * @tc.name: concurrentSetConstructorTest026
     * @tc.desc: Initialize a ConcurrentSet by iterating over the values of a Set that contains 11 elements with values of either null or numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_027
     * @tc.name: concurrentSetConstructorTest027
     * @tc.desc: Initialize a ConcurrentSet by iterating over the keys of a Set that contains 11 elements with values of either null or numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_028
     * @tc.name: concurrentSetConstructorTest028
     * @tc.desc: Initialize a ConcurrentSet by iterating over the values of a Array that contains 11 elements with values of either null or numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_029
     * @tc.name: concurrentSetConstructorTest029
     * @tc.desc: Initialize a concurrentSet by iterating over the values of an array that has 10 elements all with the value of undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetTest_constructor_029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_030
     * @tc.name: concurrentSetConstructorTest030
     * @tc.desc: Initialize a concurrentSet by iterating over the keys of an set that has 10 elements all with the value of undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_031
     * @tc.name: concurrentSetConstructorTest031
     * @tc.desc: Initialize a concurrentSet by iterating over the values of an set that has one elements with the value of undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_032
     * @tc.name: concurrentSetConstructorTest032
     * @tc.desc: Initialize a concurrentSet using the values iterator of a Set that contains 11 elements, where the element values are either undefined or numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_033
     * @tc.name: concurrentSetConstructorTest033
     * @tc.desc: Initialize a concurrentSet using the values iterator of a Set that contains 11 elements, where the element values are either undefined or numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_034
     * @tc.name: concurrentSetConstructorTest034
     * @tc.desc: Initialize a concurrentSet using the values iterator of a Array that contains 20 elements, where the element values are either undefined or numbers.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_035
     * @tc.name: concurrentSetConstructorTest035
     * @tc.desc: Initialize a ConcurrentSet by iterating over the values of an array with Integer.MAX_VALUE elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    xit("concurrentSetConstructorTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const array: Array<number> = new Array<number>();
      const totalCount: number = Int.MAX_VALUE;
      for (let i: int = 0; i < totalCount; i++) {
        array.push(i);
      }
      const iter = array.values();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_036
     * @tc.name: concurrentSetConstructorTest036
     * @tc.desc: Initialize a ConcurrentSet by iterating over the values of an set with Integer.MAX_VALUE elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    xit("concurrentSetConstructorTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const totalCount: number = Int.MAX_VALUE;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(i);
      }
      const iter = set.values();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_037
     * @tc.name: concurrentSetConstructorTest037
     * @tc.desc: Initialize a ConcurrentSet by iterating over the keys of an set with Integer.MAX_VALUE elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    xit("concurrentSetConstructorTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const set: Set<number> = new Set<number>();
      const totalCount: number = Int.MAX_VALUE;
      for (let i: int = 0; i < totalCount; i++) {
        set.add(i);
      }
      const iter = set.keys();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_038
     * @tc.name: concurrentSetConstructorTest038
     * @tc.desc: Initialize a ConcurrentSet by iterating over the keys of a Map.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('zero', 0);
      map.set('one', 1);
      map.set('two', 2);
      const iter = map.keys();
      const concurrentSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('3');
      const keysArray: Array<string | undefined> = new Array<string | undefined>();
      while (true) {
        const v = iter.next()
        if (v.done) {
          break;
        }
        let value = v.value;
        keysArray.push(value);
      };
      expect(keysArray[0]).assertEqual('zero');
      expect(keysArray[1]).assertEqual('one');
      expect(keysArray[2]).assertEqual('two');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_039
     * @tc.name: concurrentSetConstructorTest039
     * @tc.desc: Initialize a ConcurrentSet by iterating over the values of a Map.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('zero', 0);
      map.set('one', 1);
      map.set('two', 2);
      const iter = map.values();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('3');
      const valuesArray: Array<number | undefined> = new Array<number | undefined>();
      while (true) {
        const v = iter.next()
        if (v.done) {
          break;
        }
        let value = v.value;
        valuesArray.push(value);
      };
      expect(valuesArray[0]).assertEqual('0');
      expect(valuesArray[1]).assertEqual('1');
      expect(valuesArray[2]).assertEqual('2');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_040
     * @tc.name: concurrentSetConstructorTest040
     * @tc.desc: Initialize a ConcurrentSet by iterating over the keys of a concurrentHashMap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: containers.ConcurrentHashMap<string, number> = new containers.ConcurrentHashMap<string, number>();
      map.set('zero', 0);
      map.set('one', 1);
      map.set('two', 2);
      const iter = map.keys();
      const concurrentSet: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('3');
      const keysArray: Array<string | undefined> = new Array<string | undefined>();
      while (true) {
        const v = iter.next()
        if (v.done) {
          break;
        }
        let value = v.value;
        keysArray.push(value);
      };
      expect(keysArray[0]).assertEqual('zero');
      expect(keysArray[1]).assertEqual('one');
      expect(keysArray[2]).assertEqual('two');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_041
     * @tc.name: concurrentSetConstructorTest041
     * @tc.desc: Initialize a ConcurrentSet by iterating over the values of a concurrentHashMap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map: containers.ConcurrentHashMap<string, number> = new containers.ConcurrentHashMap<string, number>();
      map.set('zero', 0);
      map.set('one', 1);
      map.set('two', 2);
      const iter = map.values();
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('3');
      const valuesArray: Array<number | undefined> = new Array<number | undefined>();
      while (true) {
        const v = iter.next()
        if (v.done) {
          break;
        }
        let value = v.value;
        valuesArray.push(value);
      };
      expect(valuesArray[0]).assertEqual('0');
      expect(valuesArray[1]).assertEqual('1');
      expect(valuesArray[2]).assertEqual('2');
    })



    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_043
     * @tc.name: concurrentSetConstructorTest043
     * @tc.desc: Initialize a concurrentSet with a nested array containing 0 elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<Array<Array<number>>> = new Array<Array<Array<number>>>();
      const concurrentSet: containers.ConcurrentSet<Array<Array<number>>> = new containers.ConcurrentSet<Array<Array<number>>>(arrayTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_044
     * @tc.name: concurrentSetConstructorTest044
     * @tc.desc: Initialize a concurrentSet with a nested array containing one elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<Array<Array<number>>> = new Array<Array<Array<number>>>();
      arrayTest.push(new Array<Array<number>>(new Array<number>(0)));
      const concurrentSet: containers.ConcurrentSet<Array<Array<number>>> = new containers.ConcurrentSet<Array<Array<number>>>(arrayTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_045
     * @tc.name: concurrentSetConstructorTest045
     * @tc.desc: Initialize a concurrentSet with a nested array containing 1000 elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<Array<Array<number>>> = new Array<Array<Array<number>>>();
      const totalCount: number = 1000;
      for (let index = 0; index < totalCount; index++) {
        arrayTest.push(new Array<Array<number>>(new Array<number>(index)));
      }
      const concurrentSet: containers.ConcurrentSet<Array<Array<number>>> = new containers.ConcurrentSet<Array<Array<number>>>(arrayTest);
      expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(totalCount));
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_046
     * @tc.name: concurrentSetConstructorTest046
     * @tc.desc: Initialize a ConcurrentSet by iterating over the values of a nested array with 0 elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<Array<Array<number>>> = new Array<Array<Array<number>>>();
      const iter = arrayTest.values();
      const concurrentSet: containers.ConcurrentSet<Array<Array<number>>> = new containers.ConcurrentSet<Array<Array<number>>>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_047
     * @tc.name: concurrentSetConstructorTest047
     * @tc.desc: Initialize a ConcurrentSet by iterating over the values of a nested array with 1 elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arrayTest: Array<Array<Array<number>>> = new Array<Array<Array<number>>>();
      arrayTest.push(new Array<Array<number>>(new Array<number>(0)));
      const iter = arrayTest.values();
      const concurrentSet: containers.ConcurrentSet<Array<Array<number>>> = new containers.ConcurrentSet<Array<Array<number>>>(iter);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetConstructorTest_048
     * @tc.name: concurrentSetConstructorTest048
     * @tc.desc: Initialize a ConcurrentSet by iterating over the values of a nested array with 1000 elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetConstructorTest048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_049
     * @tc.name: concurrentSetAddTest001
     * @tc.desc: Add a null element to the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<null> = new containers.ConcurrentSet<null>();
      concurrentSet.add(null);
      concurrentSet.add(null);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_050
     * @tc.name: concurrentSetAddTest002
     * @tc.desc: Add a undefined element to the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<undefined> = new containers.ConcurrentSet<undefined>();
      concurrentSet.add(undefined);
      concurrentSet.add(undefined);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_051
     * @tc.name: concurrentSetAddTest003
     * @tc.desc: Add a object element to the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<object> = new containers.ConcurrentSet<object>();
      const obj = new Object();
      concurrentSet.add(obj);
      concurrentSet.add(obj);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_052
     * @tc.name: concurrentSetAddTest004
     * @tc.desc: Add elements of mixed types to the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_053
     * @tc.name: concurrentSetAddTest005
     * @tc.desc: Add elements of the numeric type to the concurrentSet
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
      concurrentSet.add(42);
      concurrentSet.add(3.14);
      concurrentSet.add(Number.MAX_VALUE);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('3');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_054
     * @tc.name: concurrentSetAddTest006
     * @tc.desc: Add elements of ordinary numeric types and boxed numeric types to the ConcurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Number> = new containers.ConcurrentSet<Number>();
      concurrentSet.add(42);
      concurrentSet.add(3.14);
      concurrentSet.add(new Number(43));
      concurrentSet.add(Number.MAX_VALUE);
      concurrentSet.add(Number(80));
      expect(JSON.stringify(concurrentSet.size)).assertEqual('5');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_055
     * @tc.name: concurrentSetAddTest007
     * @tc.desc: Add elements of ordinary string type and boxed string type to the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<String> = new containers.ConcurrentSet<String>();
      concurrentSet.add("hello");
      concurrentSet.add("world");
      concurrentSet.add(`template ${1 + 1}`);
      concurrentSet.add(new String("string"));
      expect(JSON.stringify(concurrentSet.size)).assertEqual('4');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_056
     * @tc.name: concurrentSetAddTest008
     * @tc.desc: Add elements of the BigInt type to the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<BigInt> = new containers.ConcurrentSet<BigInt>();
      concurrentSet.add(BigInt(123));
      concurrentSet.add(BigInt('567'));
      concurrentSet.add(456n);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('3');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_057
     * @tc.name: concurrentSetAddTest009
     * @tc.desc: Add elements of the Boolean type to the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Boolean> = new containers.ConcurrentSet<Boolean>();
      concurrentSet.add(new Boolean(true));
      concurrentSet.add(false);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_058
     * @tc.name: concurrentSetAddTest010
     * @tc.desc: Add a class element to the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Person> = new containers.ConcurrentSet<Person>();
      concurrentSet.add(new Person('aimi', 15));
      concurrentSet.add(new Person('kimi', 13));
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_059
     * @tc.name: concurrentSetAddTest011
     * @tc.desc: Add a array element to the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Array<number>> = new containers.ConcurrentSet<Array<number>>();
      concurrentSet.add(new Array<number>(15, 16));
      concurrentSet.add(new Array<number>(20, 21));
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_060
     * @tc.name: concurrentSetAddTest012
     * @tc.desc: Add multiple elements of type Object to the ConcurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Object> = new containers.ConcurrentSet<Object>();
      concurrentSet.add(new Object());
      concurrentSet.add(new Object());
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_061
     * @tc.name: concurrentSetAddTest013
     * @tc.desc: Add multiple types of elements to the concurrentSet, and some elements are added repeatedly.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_062
     * @tc.name: concurrentSetAddTest014
     * @tc.desc: After clearing all elements of a non-empty set, add elements.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_063
     * @tc.name: concurrentSetAddTest015
     * @tc.desc: A non-empty set deletes all elements and then adds elements after deletion.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetAddTest_064
     * @tc.name: concurrentSetAddTest016
     * @tc.desc: Insert 100 pieces of data every 10 milliseconds and repeat this operation 100 times.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetAddTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
            clearInterval(intervalId);
          }
          const expectedSize: Number = 100 * 100;
          expect(JSON.stringify(concurrentSet.size)).assertEqual(JSON.stringify(expectedSize));
        }
      }, 10);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_065
     * @tc.name: concurrentSetDeleteTest001
     * @tc.desc: Remove null from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_066
     * @tc.name: concurrentSetDeleteTest002
     * @tc.desc: Remove undefined from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_067
     * @tc.name: concurrentSetDeleteTest003
     * @tc.desc: Remove object from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_068
     * @tc.name: concurrentSetDeleteTest004
     * @tc.desc: Remove BigInt from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_069
     * @tc.name: concurrentSetDeleteTest005
     * @tc.desc: Remove string from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<String> = new containers.ConcurrentSet<String>();
      const string: String = new String("123");
      const string2: String = "456";
      concurrentSet.add(string);
      concurrentSet.add(string2);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('2');
      expect(concurrentSet.has(string)).assertTrue();
      concurrentSet.delete(string);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(string)).assertFalse();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_070
     * @tc.name: concurrentSetDeleteTest006
     * @tc.desc: Remove boolean from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_071
     * @tc.name: concurrentSetDeleteTest007
     * @tc.desc: Remove class from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_072
     * @tc.name: concurrentSetDeleteTest008
     * @tc.desc: Remove array from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_073
     * @tc.name: concurrentSetDeleteTest009
     * @tc.desc: Remove number from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_074
     * @tc.name: concurrentSetDeleteTest010
     * @tc.desc: Delete a non-existent element from the `concurrentSet`.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_075
     * @tc.name: concurrentSetDeleteTest011
     * @tc.desc: Remove the set that has only one element which is null from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<null> = new containers.ConcurrentSet<null>();
      concurrentSet.add(null);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(null)).assertTrue();
      concurrentSet.delete(null);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(null)).assertFalse();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_076
     * @tc.name: concurrentSetDeleteTest012
     * @tc.desc: Remove the set that has only one element which is undefined from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<undefined> = new containers.ConcurrentSet<undefined>();
      concurrentSet.add(undefined);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(undefined)).assertTrue();
      concurrentSet.delete(undefined);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(undefined)).assertFalse();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_077
     * @tc.name: concurrentSetDeleteTest013
     * @tc.desc: Remove the set that has only one element which is object from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_078
     * @tc.name: concurrentSetDeleteTest014
     * @tc.desc: Remove the set that has only one element which is bigInt from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
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
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_079
     * @tc.name: concurrentSetDeleteTest015
     * @tc.desc: Remove the set that has only one element which is string from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<String> = new containers.ConcurrentSet<String>();
      const string: String = new String("123");
      concurrentSet.add(string);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(string)).assertTrue();
      concurrentSet.delete(string);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(string)).assertFalse();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_concurrentSetDeleteTest_080
     * @tc.name: concurrentSetDeleteTest016
     * @tc.desc: Remove the set that has only one element which is boolean from the concurrentSet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it("concurrentSetDeleteTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentSet: containers.ConcurrentSet<Boolean> = new containers.ConcurrentSet<Boolean>();
      const boolean1: Boolean = new Boolean(false);
      concurrentSet.add(boolean1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('1');
      expect(concurrentSet.has(boolean1)).assertTrue();
      concurrentSet.delete(boolean1);
      expect(JSON.stringify(concurrentSet.size)).assertEqual('0');
      expect(concurrentSet.has(boolean1)).assertFalse();
    })

