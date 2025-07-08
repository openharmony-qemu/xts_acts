import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, xit, Level, Size, TestType } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'

class CustomClass {
  id: number;
  name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }
}
class Person {
  name: string;

  constructor(name: string) {
    this.name = name;
  }
}

class Person2 {
  age: number;

  constructor(age: number) {
    this.age = age;
  }
}

interface TestObject {
  id: number;
  name: string;
}

interface KeyType {
  id: number;
}

interface KeyType2 {
  a: number;
  b: number
}
interface CustomClass2 {
  a: number;
  b: number;
}

function createSetTask(map:  containers.ConcurrentHashMap<string, string>, key: string, value: string): taskpool.Task {
  return new taskpool.Task(async (localMap:  containers.ConcurrentHashMap<string, string>, k: string, v: string) => {
    localMap.set(k, v);
  }, map, key, value);
}

function createDeleteTask(map:  containers.ConcurrentHashMap<string, string>, key: string): taskpool.Task {
  return new taskpool.Task(async (localMap:  containers.ConcurrentHashMap<string, string>, k: string) => {
    localMap.delete(k);
  }, map, key);
}

function createReplaceTask(map:  containers.ConcurrentHashMap<string, string>, key: string, newValue: string): taskpool.Task {
  return new taskpool.Task(async (localMap:  containers.ConcurrentHashMap<string, string>, k: string, v: string) => {
    localMap.set(k, v);
  }, map, key, newValue);
}

function createModifyTask(map:  containers.ConcurrentHashMap<string, string>, key: string, value: string): taskpool.Task {
  return new taskpool.Task(async (localMap:  containers.ConcurrentHashMap<string, string>, k: string, v: string) => {
    localMap.set(k, v);
  }, map, key, value);
}

export default function ConcurrentHashMapTest() {
  describe('ConcurrentHashMapTest', (): void => {
    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorwitharrayliketest_0100
     * @tc.name      : constructorWithArrayLikeTest001
     * @tc.desc      : Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithArrayLikeTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMapNull:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      expect(String(concurrentHashMapNull.size)).assertEqual('0');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithArrayLikeTest_0101
     * @tc.name      : constructorWithArrayLikeTest002
     * @tc.desc      : Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithArrayLikeTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      let result = concurrentHashMap.set(1, "one");
      expect(String(result.size)).assertEqual('1');
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithArrayLikeTest_0102
     * @tc.name      : constructorWithArrayLikeTest003
     * @tc.desc      : Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithArrayLikeTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let emptyArray: Array<[Number, string]> = new Array<[Number, string]>();
      let arrayLike = emptyArray as ArrayLike<[Number, string]>;
      let constructorWithEmpty:  containers.ConcurrentHashMap<Number, string> = new  containers.ConcurrentHashMap<Number, string>(arrayLike);
      expect(String(constructorWithEmpty.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithArrayLikeTest_0103
     * @tc.name      : constructorWithArrayLikeTest004
     * @tc.desc      : Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithArrayLikeTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let emptyArray: [string, Boolean][] = [];
      let arrayLike = emptyArray as ArrayLike<[string, Boolean]>;
      let concurrentHashMap:  containers.ConcurrentHashMap<string, Boolean> = new  containers.ConcurrentHashMap<string, Boolean>(arrayLike);
      let constructorWithTuple = concurrentHashMap.set("test", true);
      expect(String(constructorWithTuple.size)).assertEqual('1');
      expect(String(concurrentHashMap.has("test"))).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithArrayLikeTest_0104
     * @tc.name      : constructorWithArrayLikeTest005
     * @tc.desc      : Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithArrayLikeTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: [string, Number][] = [["", 100], ["key1", 200]];
      let arrayLike = entries as ArrayLike<[string, Number]>;
      let concurrentHashMap:  containers.ConcurrentHashMap<string, Number> = new  containers.ConcurrentHashMap<string, Number>(arrayLike);
      expect(String(concurrentHashMap.has(""))).assertEqual('true');
      expect(String(concurrentHashMap.get(""))).assertEqual('100');
      expect(String(concurrentHashMap.has("key1"))).assertEqual('true');
      expect(String(concurrentHashMap.size)).assertEqual('2');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithArrayLikeTest_0105
     * @tc.name      : constructorWithArrayLikeTest006
     * @tc.desc      : Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithArrayLikeTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: [Number, string][] = [[1, ""], [2, "value1"]];
      let arrayLike = entries as ArrayLike<[Number, string]>;
      let concurrentHashMap:  containers.ConcurrentHashMap<Number, string> = new  containers.ConcurrentHashMap<Number, string>(arrayLike);
      expect(String(concurrentHashMap.get(1))).assertEqual('');
      expect(String(concurrentHashMap.get(2))).assertEqual('value1');
      expect(String(concurrentHashMap.size)).assertEqual('2');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithArrayLikeTest_0106
     * @tc.name      : constructorWithArrayLikeTest007
     * @tc.desc      : Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithArrayLikeTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let longKey = "this_is_a_very_long_string_key_with_multiple_characters_1234567890";
      let entries: [string, Boolean][] = [[longKey, true], ["short", false]];
      let arrayLike = entries as ArrayLike<[string, Boolean]>;
      let concurrentHashMap:  containers.ConcurrentHashMap<string, Boolean> = new  containers.ConcurrentHashMap<string, Boolean>(arrayLike);
      expect(String(concurrentHashMap.has(longKey))).assertEqual('true');
      expect(String(concurrentHashMap.get(longKey))).assertEqual('true');
      expect(String(concurrentHashMap.get("short"))).assertEqual('false');
      expect(String(concurrentHashMap.size)).assertEqual('2');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithArrayLikeTest_0107
     * @tc.name      : constructorWithArrayLikeTest008
     * @tc.desc      : Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithArrayLikeTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let longValue = "this_is_a_very_long_string_value_with_multiple_characters_0987654321";
      let entries: [Number, string][] = [[1, longValue], [2, "short"]];
      let arrayLike = entries as ArrayLike<[Number, string]>;
      let concurrentHashMap:  containers.ConcurrentHashMap<Number, string> = new  containers.ConcurrentHashMap<Number, string>(arrayLike);
      expect(String(concurrentHashMap.get(1))).assertEqual(longValue);
      expect(String(concurrentHashMap.get(2))).assertEqual('short');
      expect(String(concurrentHashMap.size)).assertEqual('2');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithArrayLikeTest_0108
     * @tc.name      : constructorWithArrayLikeTest009
     * @tc.desc      : Initialize map correctly from ArrayLike<[K,V]>
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithArrayLikeTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arrKeys: Number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      let arrValues: string[] = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];
      let array = Array<[Number, string]>(10);
      for (let i = 0; i < 10; i++) {
        let arrKV: [Number, string] = [arrKeys[i], arrValues[i]]
        array[i] = arrKV;
      }
      let arrayLike = array as ArrayLike<[Number, string]>;
      let concurrentHashMap:  containers.ConcurrentHashMap<Number, string> = new  containers.ConcurrentHashMap<Number, string>(arrayLike);
      expect(String(concurrentHashMap.get(0))).assertEqual('zero');
      expect(String(concurrentHashMap.get(2))).assertEqual('two');
      expect(String(concurrentHashMap.size)).assertEqual('10');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithIterableTest_0109
     * @tc.name      : constructorWithIterableTest001
     * @tc.desc      : Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithIterableTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      let iterable = concurrentHashMap.entries();
      let concurrentIter:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>(iterable);
      expect(String(concurrentIter.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithIterableTest_0110
     * @tc.name      : constructorWithIterableTest002
     * @tc.desc      : Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithIterableTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      concurrentHashMap.set(1, "one");
      let iterable = concurrentHashMap.entries();
      let concurrentIter:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>(iterable);
      expect(String(concurrentIter.size)).assertEqual('1');
      concurrentIter.delete(1);
      expect(String(concurrentIter.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithIterableTest_0111
     * @tc.name      : constructorWithIterableTest003
     * @tc.desc      : Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithIterableTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      for (let i = 0; i < 1000; i++) {
        concurrentHashMap.set(i, `value${i}`);
      }
      let iterable = concurrentHashMap.entries();
      let concurrentIter:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>(iterable);
      expect(String(concurrentIter.size)).assertEqual('1000');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithIterableTest_0112
     * @tc.name      : constructorWithIterableTest006
     * @tc.desc      : Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithIterableTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new Map<number | null | undefined, string | null | undefined>();
      map.set(null, "nullKey");
      map.set(undefined, "undefinedKey");
      map.set(1, null);
      map.set(2, undefined);

      let iterable = map.entries();
      let concurrentMap = new  containers.ConcurrentHashMap<number | null | undefined, string | null | undefined>(iterable);
      expect(String(concurrentMap.size)).assertEqual('4');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithIterableTest_0113
     * @tc.name      : constructorWithIterableTest007
     * @tc.desc      : Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithIterableTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentHashMap = new Map<number, string>();
      const totalCount: number = 10;
      for (let i = 0; i < totalCount; i++) {
        concurrentHashMap.set(i, `value${i}`);
      }
      const iter = concurrentHashMap.entries();
      let concurrentMap = new  containers.ConcurrentHashMap<number, string>(iter);
      expect(String(concurrentMap.size)).assertEqual(String(totalCount));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithIterableTest_0114
     * @tc.name      : constructorWithIterableTest008
     * @tc.desc      : Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithIterableTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const concurrentHashMap = new  containers.ConcurrentHashMap<number, string>();
      const totalCount: number = 10;
      for (let i: number = 0; i < totalCount; i++) {
        concurrentHashMap.set(i, `value${i}`);
      }
      const iter = concurrentHashMap.entries();
      let concurrentIter:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>(iter);
      expect(String(concurrentIter.size)).assertEqual(String(totalCount));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithIterableTest_0115
     * @tc.name      : constructorWithIterableTest009
     * @tc.desc      : Initialize ConcurrentHashMap correctly from Iterable<[K,V]> with existing map entries
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithIterableTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      concurrentHashMap.set(1, "one");
      concurrentHashMap.set(2, "two");
      let entriesIterable = concurrentHashMap.entries();
      let concurrentIter:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>(entriesIterable);
      expect(String(concurrentIter.size)).assertEqual('2');
      expect(concurrentIter.get(1)).assertEqual("one");
      expect(concurrentIter.get(2)).assertEqual("two");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithRemoveTest_0116
     * @tc.name      : constructorWithRemoveTest001
     * @tc.desc      : Verify remove operation returns correct value and updates map state
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithRemoveTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      hashMap.set(1, "one");
      hashMap.set(2, "two");
      hashMap.set(3, "three");
      expect(hashMap.remove(1)).assertEqual("one");
      expect(hashMap.remove(2)).assertEqual("two");
      expect(String(hashMap.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithRemoveTest_0117
     * @tc.name      : constructorWithRemoveTest002
     * @tc.desc      : Verify remove operation returns correct value and updates map state
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithRemoveTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap:  containers.ConcurrentHashMap<string, number> = new  containers.ConcurrentHashMap<string, number>();
      hashMap.set("a", 100);
      hashMap.set("b", 200);
      hashMap.set("c", 300);
      expect(String(hashMap.remove("a"))).assertEqual('100');
      expect(String(hashMap.remove("b"))).assertEqual('200');
      expect(String(hashMap.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithRemoveTest_0118
     * @tc.name      : constructorWithRemoveTest003
     * @tc.desc      : Verify remove operation returns correct value and updates map state
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithRemoveTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "first");
      expect(map.remove(1)).assertEqual("first");
      expect(String(map.size)).assertEqual('0');
      map.set(1, "newValue");
      expect(map.get(1)).assertEqual("newValue");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithRemoveTest_0119
     * @tc.name      : constructorWithRemoveTest004
     * @tc.desc      : Verify remove operation returns correct value and updates map state
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithRemoveTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<BigInt, string>();
      const bigNum = BigInt(9999999999999999);
      map.set(bigNum, "bigNumber");
      expect(map.remove(bigNum)).assertEqual("bigNumber");
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithRemoveTest_0120
     * @tc.name      : constructorWithRemoveTest005
     * @tc.desc      : Verify remove operation returns correct value and updates map state
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithRemoveTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<boolean, string>();
      map.set(true, "yes");
      map.set(false, "no");
      expect(map.remove(true)).assertEqual("yes");
      expect(map.remove(false)).assertEqual("no");
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithRemoveTest_0121
     * @tc.name      : constructorWithRemoveTest006
     * @tc.desc      : Verify remove operation returns correct value and updates map state
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithRemoveTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<Person, string>();
      const person = new Person("Alice");
      map.set(person, "developer");
      expect(map.remove(person)).assertEqual("developer");
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithRemoveTest_0122
     * @tc.name      : constructorWithRemoveTest007
     * @tc.desc      : Verify remove operation returns correct value and updates map state
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithRemoveTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<Person2, number>();
      const person = new Person2(13);
      map.set(person, 13);
      expect(map.remove(person)).assertEqual(13);
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithRemoveTest_0123
     * @tc.name      : constructorWithRemoveTest008
     * @tc.desc      : Verify remove operation returns correct value and updates map state
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithRemoveTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number[], string>();
      const arr: number[] = [1, 2, 3];

      map.set(arr, "numbers");
      expect(String(map.remove(arr))).assertEqual("numbers");
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithRemoveTest_0124
     * @tc.name      : constructorWithRemoveTest009
     * @tc.desc      : Verify remove operation returns correct value and updates map state
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithRemoveTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<TestObject, string>();
      const obj: TestObject = {
        id: 123,
        name: "test"
      };
      map.set(obj, "objectData");
      expect(map.remove(obj)).assertEqual("objectData");
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithGetTest_0125
     * @tc.name      : constructorWithGetTest001
     * @tc.desc      : Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithGetTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "one");
      expect(String(ConcurrentHashMap.get(1))).assertEqual('one');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithGetTest_0126
     * @tc.name      : constructorWithGetTest002
     * @tc.desc      : Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithGetTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "one");
      ConcurrentHashMap.set(2, "two");
      ConcurrentHashMap.set(3, "three");
      expect(String(ConcurrentHashMap.get(1))).assertEqual('one');
      expect(String(ConcurrentHashMap.get(2))).assertEqual('two');
      expect(String(ConcurrentHashMap.get(3))).assertEqual('three');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithGetTest_0127
     * @tc.name      : constructorWithGetTest003
     * @tc.desc      : Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithGetTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "value");
      ConcurrentHashMap.set(2, "value");
      ConcurrentHashMap.set(3, "value");
      expect(String(ConcurrentHashMap.get(1))).assertEqual('value');
      expect(String(ConcurrentHashMap.get(2))).assertEqual('value');
      expect(String(ConcurrentHashMap.get(3))).assertEqual('value');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithGetTest_0128
     * @tc.name      : constructorWithGetTest004
     * @tc.desc      : Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithGetTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "value");
      ConcurrentHashMap.set(1, "newvalue");
      expect(String(ConcurrentHashMap.get(1))).assertEqual('newvalue');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithGetTest_0129
     * @tc.name      : constructorWithGetTest005
     * @tc.desc      : Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithGetTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      expect(String(ConcurrentHashMap.get(999))).assertEqual('undefined');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithGetTest_0130
     * @tc.name      : constructorWithGetTest006
     * @tc.desc      : Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithGetTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      map.set("key", "new");
      map.set("KEY", "NEW");
      expect(String(map.get("key"))).assertEqual("new");
      expect(String(map.get("KEY"))).assertEqual("NEW");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithGetTest_0131
     * @tc.name      : constructorWithGetTest007
     * @tc.desc      : Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithGetTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "");
      expect(String(map.get(1))).assertEqual("");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithGetTest_0132
     * @tc.name      : constructorWithGetTest008
     * @tc.desc      : Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithGetTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, undefined> = new  containers.ConcurrentHashMap<number, undefined>();
      map.set(1, undefined);
      expect(String(map.get(1))).assertEqual('undefined');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithGetTest_0133
     * @tc.name      : constructorWithGetTest009
     * @tc.desc      : Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithGetTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, null> = new  containers.ConcurrentHashMap<number, null>();
      map.set(1, null);
      expect(String(map.get(1))).assertEqual("null");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithGetTest_0134
     * @tc.name      : constructorWithGetTest0010
     * @tc.desc      : Get the value corresponding to the specified key. If it does not exist, return undefined.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithGetTest0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      expect(String(map.get(1))).assertEqual('undefined');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithisEmptyTest_0135
     * @tc.name      : constructorWithisEmptyTest001
     * @tc.desc      : Judge whether this ConcurrentHashMap is empty.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithisEmptyTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      expect(String(ConcurrentHashMap.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithisEmptyTest_0136
     * @tc.name      : constructorWithisEmptyTest001
     * @tc.desc      : Judge whether this ConcurrentHashMap is empty.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithisEmptyTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "value");
      expect(String(ConcurrentHashMap.isEmpty())).assertEqual('false');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithisEmptyTest_0137
     * @tc.name      : constructorWithisEmptyTest003
     * @tc.desc      : Judge whether this ConcurrentHashMap is empty.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithisEmptyTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "value");
      expect(String(ConcurrentHashMap.isEmpty())).assertEqual('false');
      ConcurrentHashMap.delete(1)
      expect(String(ConcurrentHashMap.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithisEmptyTest_0138
     * @tc.name      : constructorWithisEmptyTest004
     * @tc.desc      : Judge whether this ConcurrentHashMap is empty.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithisEmptyTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      for (let i = 0; i < 100; i++) {
        map.set(i, `value${i}`)
      }
      expect(String(map.isEmpty())).assertEqual('false');
      for (let i = 0; i < 100; i++) {
        map.delete(i)
      }
      expect(String(map.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithisEmptyTest_0139
     * @tc.name      : constructorWithisEmptyTest005
     * @tc.desc      : Verify isEmpty after clear operation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithisEmptyTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "value1");
      map.set(2, "value2");
      map.clear();
      expect(String(map.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithisEmptyTest_0140
     * @tc.name      : constructorWithisEmptyTest006
     * @tc.desc      : Verify isEmpty with concurrent modifications
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithisEmptyTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "value1");
      map.delete(1);
      expect(String(map.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithisEmptyTest_0141
     * @tc.name      : constructorWithisEmptyTest007
     * @tc.desc      : Verify isEmpty after adding and removing same key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithisEmptyTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "value1");
      map.set(1, "value2");
      map.delete(1);
      expect(String(map.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithisEmptyTest_0142
     * @tc.name      : constructorWithisEmptyTest008
     * @tc.desc      : Verify isEmpty with null values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithisEmptyTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, null>();
      map.set(1, null);
      expect(String(map.isEmpty())).assertEqual('false');
      map.delete(1);
      expect(String(map.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithisEmptyTest_0143
     * @tc.name      : constructorWithisEmptyTest009
     * @tc.desc      : Verify isEmpty with undefined values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithisEmptyTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, undefined>();
      map.set(1, undefined);
      expect(String(map.isEmpty())).assertEqual('false');
      map.delete(1);
      expect(String(map.isEmpty())).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithtoStringTest_0144
     * @tc.name      : constructorWithtoStringTest001
     * @tc.desc      : Verify toString after removing elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithtoStringTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      ConcurrentHashMap.set(1, "one");
      ConcurrentHashMap.set(2, "two");
      let str = ConcurrentHashMap.toString();
      expect(str).assertEqual('1,one,2,two');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithtoStringTest_0145
     * @tc.name      : constructorWithtoStringTest002
     * @tc.desc      : Verify toString after removing elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithtoStringTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      for (let i = 0; i < 100; i++) {
        ConcurrentHashMap.set(i, `value${i}`)
      }
      let str = ConcurrentHashMap.toString();
      expect(str).assertEqual(String(ConcurrentHashMap));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithtoStringTest_0146
     * @tc.name      : constructorWithtoStringTest003
     * @tc.desc      : Verify toString after removing elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithtoStringTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let ConcurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      let str = ConcurrentHashMap.toString();
      expect(str).assertEqual('');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithtoStringTest_0147
     * @tc.name      : constructorWithtoStringTest005
     * @tc.desc      : Verify toString after removing elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithtoStringTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      map.delete(1);
      let str = map.toString();
      expect(str).assertEqual('2,two');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithtoStringTest_0148
     * @tc.name      : constructorWithtoStringTest006
     * @tc.desc      : Verify toString with null values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithtoStringTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string | null>();
      map.set(1, null);
      map.set(2, "two");
      let str = map.toString();
      expect(str).assertEqual('1,null,2,two');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithtoStringTest_0149
     * @tc.name      : constructorWithtoStringTest007
     * @tc.desc      : Verify toString with null values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithtoStringTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new  containers.ConcurrentHashMap<number, string | undefined>();
      map.set(1, undefined);
      map.set(2, "two");
      let str = map.toString();
      expect(str).assertEqual('1,undefined,2,two');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithvaluesTest_0150
     * @tc.name      : constructorWithvaluesTest001
     * @tc.desc      : Verify values iterator with values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithvaluesTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      const iterator = map.values();
      const result = iterator.next();
      expect(result.value).assertUndefined();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithvaluesTest_0151
     * @tc.name      : constructorWithvaluesTest002
     * @tc.desc      : Verify values iterator with values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithvaluesTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      const keys = Array.from(map.values());
      expect(JSON.stringify(keys)).assertEqual(JSON.stringify(["one", "two"]));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithvaluesTest_0152
     * @tc.name      : constructorWithvaluesTest003
     * @tc.desc      : Verify values iterator with values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithvaluesTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      let iter = map.values();
      let result = '';
      while (true) {
        const v = iter.next();
        if (v.done) {
          break;
        }
        result += v.value!.toString() + ',';
      }
      expect(result).assertEqual('');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithvaluesTest_0153
     * @tc.name      : constructorWithvaluesTest004
     * @tc.desc      : Verify values iterator with values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithvaluesTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, boolean> = new  containers.ConcurrentHashMap<string, boolean>();
      map.set('aaa', true);
      let iter = map.values();
      let result = '';
      const v = iter.next();
      if (!v.done) {
        result = v.value!.toString();
      }
      expect(result).assertEqual('true');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithvaluesTest_0154
     * @tc.name      : constructorWithvaluesTest005
     * @tc.desc      : Verify values iterator with null/undefined values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithvaluesTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string | null | undefined>();
      map.set(1, null);
      map.set(2, undefined);
      const values = Array.from(map.values());
      expect(String(values[0])).assertEqual('null');
      expect(String(values[1])).assertEqual('undefined');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithvaluesTest_0155
     * @tc.name      : constructorWithvaluesTest006
     * @tc.desc      : Verify values iterator after map modification
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithvaluesTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      const iterator = map.values();
      map.set(2, "two");
      const values = Array.from(iterator);
      expect(String(values.length)).assertEqual('2');
      expect(String(values[0])).assertEqual("one");
      expect(String(values[1])).assertEqual("two");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithKeysTest_0156
     * @tc.name      : constructorWithKeysTest001
     * @tc.desc      : Return a new iterator object that contains the keys contained in this mapping.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithKeysTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      const iterator = map.keys();
      const result = iterator.next();
      expect(result.value).assertUndefined();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithKeysTest_0157
     * @tc.name      : constructorWithKeysTest002
     * @tc.desc      : Return a new iterator object that contains the keys contained in this mapping.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithKeysTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      const keys = Array.from(map.keys());
      expect(JSON.stringify(keys)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithKeysTest_0158
     * @tc.name      : constructorWithKeysTest003
     * @tc.desc      : Verify keys iterator with duplicate keys (shouldn't happen but verify behavior)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithKeysTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "first");
      map.set(1, "second");
      const keys = Array.from(map.keys());
      expect(String(keys.length)).assertEqual('1');
      expect(String(keys[0])).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithKeysTest_0159
     * @tc.name      : constructorWithKeysTest004
     * @tc.desc      : Verify keys iterator with various key types
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithKeysTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number | string | null, string>();
      map.set(1, "number");
      map.set("1", "string");
      map.set(null, "null");
      const keys = Array.from(map.keys());
      expect(String(keys.length)).assertEqual('3');
      expect(String(keys[0])).assertEqual('1');
      expect(String(keys[1])).assertEqual("1");
      expect(String(keys[2])).assertEqual('null');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithKeysTest_0160
     * @tc.name      : constructorWithKeysTest005
     * @tc.desc      : Return a new iterator object that contains the keys contained in this mapping.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithKeysTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      let iter = map.keys();
      let result = '';
      while (true) {
        const v = iter.next();
        if (v.done) {
          break;
        }
        result += v.value!.toString() + ',';
      }
      expect(result).assertEqual('');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithKeysTest_0161
     * @tc.name      : constructorWithKeysTest006
     * @tc.desc      : Return a new iterator object that contains the keys contained in this mapping.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithKeysTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<string, boolean> = new  containers.ConcurrentHashMap<string, boolean>();
      map.set('aaa', true);

      let iter = map.keys();
      let result = '';
      const v = iter.next();
      if (!v.done) {
        result = v.value!.toString();
      }
      expect(result).assertEqual('aaa');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithforEachTest_0162
     * @tc.name      : constructorWithforEachTest001
     * @tc.desc      : Test forEach() iteration with value/key/map callback params.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithforEachTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      map.set(3, "three");

      let count = 0;
      map.forEach(() => {
        count++;
      });
      expect(String(count)).assertEqual('3');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithforEachTest_0163
     * @tc.name      : constructorWithforEachTest002
     * @tc.desc      : Test forEach() iteration with value/key/map callback params.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithforEachTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      map.set(3, "three");
      const values = new Array<string>();
      map.forEach((value: string) => {
        values.push(value);
      });
      expect(String(values.length)).assertEqual('3');
      expect(values[0]).assertEqual("one");
      expect(values[1]).assertEqual("two");
      expect(values[2]).assertEqual("three");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithforEachTest_0164
     * @tc.name      : constructorWithforEachTest003
     * @tc.desc      : Test forEach() iteration with value/key/map callback params.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithforEachTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      map.set(3, "three");
      let count = 0;
      map.forEach((value: string, key: number, m:  containers.ConcurrentHashMap<number, string>) => {
        expect(m.get(key)).assertEqual(value);
        count++;
      });
      expect(String(count)).assertEqual('3');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithforEachTest_0165
     * @tc.name      : constructorWithforEachTest004
     * @tc.desc      : Test forEach() iteration with value/key/map callback params.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithforEachTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, "one");
      map.set(2, "two");
      map.set(3, "three");

      map.forEach((value: string, key: number) => {
        if (key === 2) {
          map.set(4, "four");
        }
      });
      expect(String(map.size)).assertEqual('4');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithforEachTest_0166
     * @tc.name      : constructorWithforEachTest005
     * @tc.desc      : Test forEach() iteration with value/key/map callback params.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithforEachTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map = new  containers.ConcurrentHashMap<number, string>();
      let count = 0;
      map.forEach(() => {
        count++;
      });
      expect(String(count)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithMapTest_0167
     * @tc.name      : constructorWithMapTest001
     * @tc.desc      : To create an empty set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithMapTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      expect(String(map.size)).assertEqual('0');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithMapTest_0168
     * @tc.name      : Contains an element
     * @tc.desc      : The collection contains an element
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithMapTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      map.set(1, 'one');
      expect(String(map.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithMapTest_0169
     * @tc.name      : constructorWithMapTest003
     * @tc.desc      : A map of a thousand elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithMapTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      for (let i = 0; i < 1000; i++) {
        concurrentHashMap.set(i, `value${i}`);
      }
      expect(String(concurrentHashMap.size)).assertEqual('1000');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorTest_0170
     * @tc.name      : constructorTest001
     * @tc.desc      : Map of two elements
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let concurrentHashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      concurrentHashMap.set(1, 'one');
      concurrentHashMap.set(2, 'two');
      expect(String(concurrentHashMap.size)).assertEqual('2');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_constructorWithSetTest_0167
     * @tc.name      : constructorWithSetTest001
     * @tc.desc      : Hashmap of different parameters
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("constructorWithSetTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const WithSet:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      WithSet.set(10, '10');
      expect(String(WithSet.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0168
     * @tc.name      : setWithSetTest001
     * @tc.desc      : The value is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let SetTest:  containers.ConcurrentHashMap<number, null> = new  containers.ConcurrentHashMap<number, null>();
      SetTest.set(10, null);
      expect(String(SetTest.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0169
     * @tc.name      : setWithSetTest002
     * @tc.desc      : The value is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let SetTest1:  containers.ConcurrentHashMap<number, undefined> = new  containers.ConcurrentHashMap<number, undefined>();
      SetTest1.set(10, undefined);
      expect(String(SetTest1.size)).assertEqual('1');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0170
     * @tc.name      : setWithSetTest003
     * @tc.desc      : Set different key values to undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, undefined> = new  containers.ConcurrentHashMap<number, undefined>();
      keyData.set(10, undefined);
      keyData.set(20, undefined);
      expect(String(keyData.size)).assertEqual('2');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0171
     * @tc.name      : setWithSetTest004
     * @tc.desc      : Duplicate key data already exists
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, undefined> = new  containers.ConcurrentHashMap<number, undefined>();
      keyData.set(10, undefined);
      expect(String(keyData.size)).assertEqual('1');
      keyData.set(10, undefined);
      expect(String(keyData.size)).assertEqual('1');
      keyData.set(20, undefined);
      expect(String(keyData.size)).assertEqual('2');
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0172
     * @tc.name      : setWithSetTest005
     * @tc.desc      : Set BigInt to a value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<boolean, BigInt> = new  containers.ConcurrentHashMap<boolean, BigInt>();
      const key = true;
      const value = BigInt(12345678901234567890n);
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0173
     * @tc.name      : setWithSetTest006
     * @tc.desc      : Set BigInt to a key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<BigInt, boolean> = new  containers.ConcurrentHashMap<BigInt, boolean>();
      const key = BigInt(9007199254740991);
      const value = true;
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0174
     * @tc.name      : setWithSetTest007
     * @tc.desc      : Set object to a value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<object, CustomClass> = new  containers.ConcurrentHashMap<object, CustomClass>();
      const key: KeyType = {
        id: 1
      };
      const value = new CustomClass(2, "Bob");
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0175
     * @tc.name      : setWithSetTest008
     * @tc.desc      : Set array to a value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<CustomClass, number[]> = new  containers.ConcurrentHashMap<CustomClass, number[]>();
      const key = new CustomClass(1, "Alice");
      const value = [1, 2, 3];
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0176
     * @tc.name      : setWithSetTest009
     * @tc.desc      : Set object to a value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number[], object> = new  containers.ConcurrentHashMap<number[], object>();
      const key = [1, 2, 3];
      const value: KeyType2 = {
        a: 1, b: 2
      };
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0177
     * @tc.name      : setWithSetTest010
     * @tc.desc      : Set BigInt to a key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<BigInt, string> = new  containers.ConcurrentHashMap<BigInt, string>();
      const key = BigInt(9007199254740991);
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0178
     * @tc.name      : setWithSetTest011
     * @tc.desc      : Set boolean to a key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<boolean, string> = new  containers.ConcurrentHashMap<boolean, string>();
      const key = false;
      const value = "TestBooleanKey";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0179
     * @tc.name      : setWithSetTest012
     * @tc.desc      : Set class to a key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<CustomClass, string> = new  containers.ConcurrentHashMap<CustomClass, string>();
      const key = new CustomClass(1, "Alice");
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0180
     * @tc.name      : setWithSetTest013
     * @tc.desc      : Set array to a key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number[], boolean> = new  containers.ConcurrentHashMap<number[], boolean>();
      const key: number[] = [1, 2, 3];
      const value = true;
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0181
     * @tc.name      : setWithSetTest014
     * @tc.desc      : Set object to a key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<object, number[]> = new  containers.ConcurrentHashMap<object, number[]>();
      const key: KeyType = {
        id: 2
      };
      const value = [4, 5, 6];
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0182
     * @tc.name      : setWithSetTest015
     * @tc.desc      : The value of the replacement key is one
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      keyData.set(1, "one");
      expect(keyData.get(1)).assertEqual("one");
      keyData.set(1, "newOne");
      expect(String(keyData.get(1))).assertEqual("newOne");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0183
     * @tc.name      : setWithSetTest016
     * @tc.desc      : Test whether the key exists after being deleted
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      keyData.set(1, "one");
      expect(keyData.delete(1)).assertTrue();
      expect(keyData.delete(1)).assertFalse();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_setWithSetTest_0184
     * @tc.name      : setWithSetTest017
     * @tc.desc      : Undefined is returned when any key is obtained in an empty mapping
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("setWithSetTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      keyData.set(1, "one");
      expect(keyData.get(1)).assertEqual('one');
      expect(keyData.has(1)).assertTrue();

    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0185
     * @tc.name      : deleteKeyWithTest001
     * @tc.desc      : The value is deleted as null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, null> = new  containers.ConcurrentHashMap<string, null>();
      const key = '1';
      const value = null;
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0186
     * @tc.name      : deleteKeyWithTest002
     * @tc.desc      : The value is deleted as undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number, undefined> = new  containers.ConcurrentHashMap<number, undefined>();
      const key = 1;
      const value = undefined;
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.delete(2))).assertEqual('false');
      expect(String(keyData.size)).assertEqual("0");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0187
     * @tc.name      : deleteKeyWithTest003
     * @tc.desc      : Map with one element
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let hashMap:  containers.ConcurrentHashMap<number, string> = new  containers.ConcurrentHashMap<number, string>();
      hashMap.set(1, "one");
      let flag: boolean = hashMap.delete(1);
      expect(String(hashMap.size)).assertEqual("0");
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0188
     * @tc.name      : deleteKeyWithTest004
     * @tc.desc      : The value of Bigin in the property is deleted as key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<BigInt, string> = new  containers.ConcurrentHashMap<BigInt, string>();
      const key = BigInt(9007199254740991);
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0189
     * @tc.name      : deleteKeyWithTest005
     * @tc.desc      : The value of boolean in the property is deleted as key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<boolean, string> = new  containers.ConcurrentHashMap<boolean, string>();
      const key = true;
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0190
     * @tc.name      : deleteKeyWithTest006
     * @tc.desc      : The value of class in the property is deleted as key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<CustomClass, string> = new  containers.ConcurrentHashMap<CustomClass, string>();
      const key = new CustomClass(1, "Alice");
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0191
     * @tc.name      : deleteKeyWithTest007
     * @tc.desc      : The value of array in the property is deleted as key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<number[], string> = new  containers.ConcurrentHashMap<number[], string>();
      const key = [1, 2, 3];
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0192
     * @tc.name      : deleteKeyWithTest008
     * @tc.desc      : The value of object in the property is deleted as key
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<object, string> = new  containers.ConcurrentHashMap<object, string>();
      const key: CustomClass2 = {
        a: 1, b: 2
      };
      const value = "TestString";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0193
     * @tc.name      : deleteKeyWithTest009
     * @tc.desc      : The value of bigin in the property is deleted as value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, BigInt> = new  containers.ConcurrentHashMap<string, BigInt>();
      const key = "key1";
      const value = BigInt(9007199254740991);
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0194
     * @tc.name      : deleteKeyWithTest010
     * @tc.desc      : The value of boolean in the property is deleted as value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, boolean> = new  containers.ConcurrentHashMap<string, boolean>();
      const key = "key1";
      const value = true;
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(String(keyData.get(key))).assertEqual(String(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0195
     * @tc.name      : deleteKeyWithTest011
     * @tc.desc      : The value of class in the property is deleted as value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, CustomClass> = new  containers.ConcurrentHashMap<string, CustomClass>();
      const key = "key1";
      const value = new CustomClass(1, "Alice");
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(JSON.stringify(keyData.get(key))).assertEqual(JSON.stringify(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0196
     * @tc.name      : deleteKeyWithTest012
     * @tc.desc      : The value of array in the property is deleted as value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, number[]> = new  containers.ConcurrentHashMap<string, number[]>();
      const key = "key1";
      const value = [1, 2, 3];
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(JSON.stringify(keyData.get(key))).assertEqual(JSON.stringify(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0197
     * @tc.name      : deleteKeyWithTest013
     * @tc.desc      : The value of object in the property is deleted as value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, object> = new  containers.ConcurrentHashMap<string, object>();
      const key = "key1";
      const value: CustomClass2 = {
        a: 1, b: 2
      };
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(JSON.stringify(keyData.get(key))).assertEqual(JSON.stringify(value));
      keyData.delete(key);
      expect(String(keyData.size)).assertEqual("0");
      expect(keyData.get(key)).assertUndefined();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_deleteKeyWithTest_0198
     * @tc.name      : deleteKeyWithTest014
     * @tc.desc      : Data that does not exist
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("deleteKeyWithTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let keyData:  containers.ConcurrentHashMap<string, string> = new  containers.ConcurrentHashMap<string, string>();
      const key = "key1";
      const value = "value1";
      keyData.set(key, value);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(key)).assertEqual(value);
      const nonExistentKey = "nonExistentKey";
      keyData.delete(nonExistentKey);
      expect(String(keyData.size)).assertEqual("1");
      expect(keyData.get(nonExistentKey)).assertUndefined();
    });

    /**
     * @tc.number    : SUB_COMMONLIBRARY_UTIL_BASE_ARRAYLIST_hasWithTest_0199
     * @tc.name      : hasWithTest001