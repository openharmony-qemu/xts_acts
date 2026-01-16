import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import util from '@ohos.util';


interface TestObject {
    name: string;
    value: number;
}

interface ConfigWithFunction {
    capacity: number | (() => number);
}
		
export default function LRUCacheTest() {
  describe('LRUCacheTest', () => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_0100
     * @tc.name     testLRUCacheConstructorPositive0001
     * @tc.desc     Constructor accepts positive integer capacity (5)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(5);

        expect(lruCache != undefined && lruCache.length === 0).assertTrue();
        
      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_0200
     * @tc.name     testLRUCacheConstructorPositive0002
     * @tc.desc     Positive verification: Constructor accepts minimum positive integer capacity (1)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0002";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<number, number> = new util.LRUCache<number, number>(1);
        expect(lruCache != undefined && lruCache.length === 0).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_0300
     * @tc.name     testLRUCacheConstructorPositive0003
     * @tc.desc     Positive verification: Constructor accepts large positive integer capacity (1000)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0003";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<string, number> = new util.LRUCache<string, number>(1000);
        expect(lruCache != undefined && lruCache.length === 0).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_0400
     * @tc.name     testLRUCacheConstructorPositive0004
     * @tc.desc     Positive verification: Normal execution of updateCapacity after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorPositive0004";
      console.log(TAG + " start");

      const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);
      lruCache.put("key1", "value1");
      lruCache.put("key2", "value2");
      lruCache.put("key3", "value3");

      expect(lruCache.length === 3).assertTrue();
      expect(lruCache.get("key1") === "value1").assertTrue();
      expect(lruCache.get("key2") === "value2").assertTrue();
      expect(lruCache.get("key3") === "value3").assertTrue();
      lruCache.updateCapacity(5);
      lruCache.put("key4", "value4");
      lruCache.put("key5", "value5");

      expect(lruCache.length === 5).assertTrue();
      expect(lruCache.get("key1") === "value1").assertTrue();
      expect(lruCache.get("key4") === "value4").assertTrue();
      expect(lruCache.get("key5") === "value5").assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_0500
     * @tc.name     testLRUCacheConstructorPositive0005
     * @tc.desc     Positive verification: Constructor accepts common capacity value (10)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0005";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<number, string> = new util.LRUCache<number, string>(10);
        expect(lruCache != undefined && lruCache.length === 0).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_0600
     * @tc.name     testLRUCacheConstructorPositive0006
     * @tc.desc     Positive verification: Normal execution of put operation after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0006";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);
        lruCache.put("key1", "value1");
        expect(lruCache.length === 1).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_0700
     * @tc.name     testLRUCacheConstructorPositive0007
     * @tc.desc     Positive verification: Normal execution of get operation after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0007";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);
        lruCache.put("key1", "value1");
        const value = lruCache.get("key1");
        expect(value === "value1").assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_0800
     * @tc.name     testLRUCacheConstructorPositive0008
     * @tc.desc     Positive verification: Normal execution of remove operation after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0008";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);
        lruCache.put("key1", "value1");
        lruCache.remove("key1");
        expect(lruCache.length === 0).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_0900
     * @tc.name     testLRUCacheConstructorPositive0009
     * @tc.desc     Positive verification: Verify normal operation of LRU eviction mechanism after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0009";
        console.log(TAG + " start");


        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(2);

        let initialLength = lruCache.length;
        expect(initialLength).assertEqual(0);


        lruCache.put("key1", "value1");
        lruCache.put("key2", "value2");

        expect(lruCache.length).assertEqual(2);
        expect(lruCache.get("key1") === "value1").assertTrue();
        expect(lruCache.get("key2") === "value2").assertTrue();

        lruCache.put("key3", "value3");

        expect(lruCache.length).assertEqual(2);
        expect(lruCache.get("key1") == undefined).assertTrue();
        expect(lruCache.get("key2") === "value2").assertTrue();
        expect(lruCache.get("key3") === "value3").assertTrue();

        lruCache.get("key2");
        lruCache.put("key4", "value4");

        expect(lruCache.length).assertEqual(2);
        expect(lruCache.get("key3") == undefined).assertTrue();
        expect(lruCache.get("key2") === "value2").assertTrue();
        expect(lruCache.get("key4") === "value4").assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_1000
     * @tc.name     testLRUCacheConstructorPositive0010
     * @tc.desc     Positive verification: Constructor supports different key-value types (number, boolean)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0010";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<number, boolean> = new util.LRUCache<number, boolean>(5);
        lruCache.put(1, true);
        lruCache.put(2, false);

        expect(lruCache.get(1) === true && lruCache.get(2) === false).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_1100
     * @tc.name     testLRUCacheConstructorPositive0011
     * @tc.desc     Positive verification: Constructor supports different key-value types (string, object)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0011";
        console.log(TAG + " start");

        const obj1: TestObject = { name: "obj1", value: 1 };
        const obj2: TestObject = { name: "obj2", value: 2 };

        const lruCache: util.LRUCache<string, TestObject> = new util.LRUCache<string, TestObject>(5);
        lruCache.put("obj1", obj1);
        lruCache.put("obj2", obj2);

        const retrievedObj: TestObject | undefined = lruCache.get("obj1");

        if (retrievedObj) {
          expect(retrievedObj.name === "obj1" && retrievedObj.value === 1).assertTrue();
        } else {
          expect(false).assertTrue();
        }

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_1200
     * @tc.name     testLRUCacheConstructorPositive0012
     * @tc.desc     Positive verification: Normal execution of updateCapacity after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0012";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);
        lruCache.updateCapacity(5);

        lruCache.put("key1", "value1");
        lruCache.put("key2", "value2");
        lruCache.put("key3", "value3");
        lruCache.put("key4", "value4");
        lruCache.put("key5", "value5");

        expect(lruCache.length === 5).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_1300
     * @tc.name     testLRUCacheConstructorPositive0013
     * @tc.desc     Positive verification: Normal execution of clear operation after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0013";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(5);
        lruCache.put("key1", "value1");
        lruCache.put("key2", "value2");
        lruCache.clear();

        expect(lruCache.length === 0).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_1400
     * @tc.name     testLRUCacheConstructorPositive0014
     * @tc.desc     Positive verification: Normal execution of toString operation after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0014";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(5);
        const str = lruCache.toString();

        expect(str != undefined && typeof str === 'string').assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_1500
     * @tc.name     testLRUCacheConstructorPositive0015
     * @tc.desc     Positive verification: Normal execution of values operation after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0015";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<string, number> = new util.LRUCache<string, number>(3);
        lruCache.put("a", 1);
        lruCache.put("b", 2);
        lruCache.put("c", 3);

        const values = lruCache.values();
        expect(values.length === 3).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_1600
     * @tc.name     testLRUCacheConstructorPositive0016
     * @tc.desc     Positive verification: Normal execution of keys operation after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0016";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<string, number> = new util.LRUCache<string, number>(3);
        lruCache.put("a", 1);
        lruCache.put("b", 2);
        lruCache.put("c", 3);

        const keys = lruCache.keys();
        expect(keys.length === 3).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_1700
     * @tc.name     testLRUCacheConstructorPositive0017
     * @tc.desc     Positive verification: Normal execution of getAfterPut operation after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0017";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);
        lruCache.put("key1", "value1");
        const value = lruCache.get("key1");

        expect(value === "value1").assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_1800
     * @tc.name     testLRUCacheConstructorPositive0018
     * @tc.desc     Positive verification: Normal execution of LRU eviction policy after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0018";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(2);
        lruCache.put("key1", "value1");
        lruCache.put("key2", "value2");
        lruCache.get("key1");
        lruCache.put("key3", "value3");

        expect(lruCache.get("key2") == undefined && lruCache.get("key1") === "value1").assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_1900
     * @tc.name     testLRUCacheConstructorPositive0019
     * @tc.desc     Positive verification: isEmpty check after creating empty cache via constructor
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0019";
        console.log(TAG + " start");

        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(5);

        expect(lruCache.length === 0).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_2000
     * @tc.name     testLRUCacheConstructorPositive0020
     * @tc.desc     Positive verification: Verify correct capacity property after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorPositive0020";
        console.log(TAG + " start");

        const capacity = 10;
        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(capacity);

        lruCache.put("key1", "value1");
        lruCache.put("key2", "value2");
        expect(lruCache.length === 2).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_2100
     * @tc.name     testLRUCacheConstructorPositive0021
     * @tc.desc     Positive verification: Verify access order affects eviction policy after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testLRUCacheConstructorPositive0021";
      console.log(TAG + " start");

      const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);

      lruCache.put("key1", "value1");
      lruCache.put("key2", "value2");
      lruCache.put("key3", "value3");

      lruCache.get("key1");

      lruCache.put("key4", "value4");

      expect(lruCache.get("key2") == undefined).assertTrue();
      expect(lruCache.get("key1") === "value1").assertTrue();
      expect(lruCache.get("key3") === "value3").assertTrue();
      expect(lruCache.get("key4") === "value4").assertTrue();
      expect(lruCache.length === 3).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_2200
     * @tc.name     testLRUCacheConstructorPositive0022
     * @tc.desc     Positive verification: Normal execution of updateCapacity after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorPositive0022";
      console.log(TAG + " start");

      const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);

      lruCache.put("key1", "value1");
      lruCache.put("key2", "value2");
      lruCache.put("key3", "value3");

      expect(lruCache.length === 3).assertTrue();

      lruCache.updateCapacity(5);

      lruCache.put("key4", "value4");
      lruCache.put("key5", "value5");

      expect(lruCache.length === 5).assertTrue();
      expect(lruCache.get("key1") === "value1").assertTrue();
      expect(lruCache.get("key4") === "value4").assertTrue();
      expect(lruCache.get("key5") === "value5").assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_2300
     * @tc.name     testLRUCacheConstructorPositive0023
     * @tc.desc     Positive verification: Normal execution of values operation after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorPositive0023";
      console.log(TAG + " start");

      const lruCache: util.LRUCache<string, number> = new util.LRUCache<string, number>(3);
      lruCache.put("a", 1);
      lruCache.put("b", 2);
      lruCache.put("c", 3);

      const values: Array<number> = lruCache.values();
      expect(values.length === 3).assertTrue();

      expect(values.includes(1)).assertTrue();
      expect(values.includes(2)).assertTrue();
      expect(values.includes(3)).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_2400
     * @tc.name     testLRUCacheConstructorPositive0024
     * @tc.desc     Positive verification: Normal execution of keys operation after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorPositive0024";
      console.log(TAG + " start");

      const lruCache: util.LRUCache<string, number> = new util.LRUCache<string, number>(3);
      lruCache.put("a", 1);
      lruCache.put("b", 2);
      lruCache.put("c", 3);

      const keys: Array<string> = lruCache.keys();
      expect(keys.length === 3).assertTrue();

      expect(keys.includes("a")).assertTrue();
      expect(keys.includes("b")).assertTrue();
      expect(keys.includes("c")).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_POSITIVE_2500
     * @tc.name     testLRUCacheConstructorPositive0025
     * @tc.desc     Positive verification: Normal execution of toString operation after constructor creation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorPositive0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorPositive0025";
      console.log(TAG + " start");

      const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(5);
      const str: string = lruCache.toString();

      expect(str != undefined && typeof str === 'string').assertTrue();
      expect(str.length > 0).assertTrue();


    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_2600
     * @tc.name     testLRUCacheConstructorNegative0026
     * @tc.desc     Negative verification: Constructor accepts 0 capacity, verify exception handling for invalid parameters
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0026";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(0);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_2700
     * @tc.name     testLRUCacheConstructorNegative0027
     * @tc.desc     Negative verification: Constructor accepts negative capacity (-1)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0027";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(-1);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_2800
     * @tc.name     testLRUCacheConstructorNegative0028
     * @tc.desc     Negative verification: Constructor accepts negative capacity (-100)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0028";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(-100);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_3000
     * @tc.name     testLRUCacheConstructorNegative0030
     * @tc.desc     Negative verification: Constructor accepts decimal capacity (3.14)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0030";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(3.14);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_3100
     * @tc.name     testLRUCacheConstructorNegative0031
     * @tc.desc     Negative verification: Constructor accepts NaN as capacity
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0031";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(NaN);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_3200
     * @tc.name     testLRUCacheConstructorNegative0032
     * @tc.desc     Negative verification: Constructor accepts Infinity as capacity
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0032";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(Infinity);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_3300
     * @tc.name     testLRUCacheConstructorNegative0033
     * @tc.desc     Negative verification: Constructor accepts -Infinity as capacity
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0033";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(-Infinity);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_3400
     * @tc.name     testLRUCacheConstructorNegative0034
     * @tc.desc     Negative verification: Test negative capacity in hexadecimal notation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorNegative0034";
      console.log(TAG + " start");

      let isExceptionThrown: boolean = false;
      try {
        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(-0xFF);
      } catch (error) {
        isExceptionThrown = true;
        expect(error instanceof Error).assertTrue();
      }

      expect(isExceptionThrown).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_3500
     * @tc.name     testLRUCacheConstructorNegative0035
     * @tc.desc     Negative verification: Test invalid capacity in binary notation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorNegative0035";
      console.log(TAG + " start");

      let isExceptionThrown: boolean = false;
      try {
        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(0b0);
      } catch (error) {
        isExceptionThrown = true;
        expect(error instanceof Error).assertTrue();
      }

      expect(isExceptionThrown).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_3600
     * @tc.name     testLRUCacheConstructorNegative0036
     * @tc.desc     Negative verification: Test invalid capacity in octal notation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorNegative0036";
      console.log(TAG + " start");

      let isExceptionThrown: boolean = false;
      try {
        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(0o0);
      } catch (error) {
        isExceptionThrown = true;
        expect(error instanceof Error).assertTrue();
      }

      expect(isExceptionThrown).assertTrue();

    });


    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_3700
     * @tc.name     testLRUCacheConstructorNegative0037
     * @tc.desc     Negative verification: Test negative zero as capacity
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorNegative0037";
      console.log(TAG + " start");

      let isExceptionThrown: boolean = false;
      try {
        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(-0);
      } catch (error) {
        isExceptionThrown = true;
        expect(error instanceof Error).assertTrue();
      }

      expect(isExceptionThrown).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_3800
     * @tc.name     testLRUCacheConstructorNegative0038
     * @tc.desc     Negative verification: Test function as capacity
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0038";
        console.log(TAG + " start");

        const configWithFunction: ConfigWithFunction = {
          capacity: (): number => { return 5; }
        };

        let isExceptionThrown = false;
        try {
          const invalidCapacity: number = configWithFunction.capacity as number;
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(invalidCapacity);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_3900
     * @tc.name     testLRUCacheConstructorNegative0039
     * @tc.desc     Negative verification: Test boundary value capacity (Number.MAX_SAFE_INTEGER + 1)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorNegative0039";
      console.log(TAG + " start");

      let isExceptionThrown: boolean = false;
      try {
        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(Number.MAX_SAFE_INTEGER + 1);
      } catch (error) {
        isExceptionThrown = true;
        expect(error instanceof Error).assertTrue();
      }

      expect(isExceptionThrown).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_4000
     * @tc.name     testLRUCacheConstructorNegative0040
     * @tc.desc     Negative verification: Constructor accepts capacity exceeding Number.MAX_SAFE_INTEGER
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0040";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(Number.MAX_SAFE_INTEGER + 1);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_4100
     * @tc.name     testLRUCacheConstructorNegative0041
     * @tc.desc     Negative verification: Constructor accepts negative decimal capacity (-3.14)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0041";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(-3.14);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_4200
     * @tc.name     testLRUCacheConstructorNegative0042
     * @tc.desc     Negative verification: Test very small positive decimal
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0042";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(Number.MIN_VALUE);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }
        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_4300
     * @tc.name     testLRUCacheConstructorNegative0043
     * @tc.desc     Negative verification: Test invalid capacity in scientific notation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0043";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(1e-10);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_4400
     * @tc.name     testLRUCacheConstructorNegative0044
     * @tc.desc     Negative verification: Test negative zero as capacity
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0044";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(-0);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_4500
     * @tc.name     testLRUCacheConstructorNegative0045
     * @tc.desc     Negative verification: Verify instance not created after invalid capacity in constructor
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorNegative0045";
      console.log(TAG + " start");

      let lruCache: util.LRUCache<string, string> | undefined = undefined;
      try {
        lruCache = new util.LRUCache<string, string>(-1);
      } catch (error) {
      }

      expect(lruCache == undefined).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_4600
     * @tc.name     testLRUCacheConstructorNegative0046
     * @tc.desc     Negative verification: Test invalid capacity from conditional branch
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorNegative0046";
      console.log(TAG + " start");

      let isExceptionThrown: boolean = false;

      const getCapacityFromCondition = (useInvalid: boolean): number => {
        if (useInvalid) {
          return -5;
        } else {
          return 10;
        }
      };

      try {
        const capacityValue: number = getCapacityFromCondition(true);
        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(capacityValue);
      } catch (error) {
        isExceptionThrown = true;
        expect(error instanceof Error).assertTrue();
      }

      expect(isExceptionThrown).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_4700
     * @tc.name     testLRUCacheConstructorNegative0047
     * @tc.desc     Negative verification: Test invalid capacity from array operation
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorNegative0047";
      console.log(TAG + " start");

      let isExceptionThrown: boolean = false;

      const capacityArray: number[] = [5, -3, 10, 15];

      try {
        const invalidCapacity: number = capacityArray[1];
        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(invalidCapacity);
      } catch (error) {
        isExceptionThrown = true;
        expect(error instanceof Error).assertTrue();
      }

      expect(isExceptionThrown).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_4800
     * @tc.name     testLRUCacheConstructorNegative0048
     * @tc.desc     Negative verification: Constructor accepts negative zero (-0) as capacity
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorNegative0048";
      console.log(TAG + " start");

      let isExceptionThrown: boolean = false;
      try {
        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(-0);
      } catch (error) {
        isExceptionThrown = true;
        expect(error instanceof Error).assertTrue();
      }

      expect(isExceptionThrown).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_4900
     * @tc.name     testLRUCacheConstructorNegative0049
     * @tc.desc     Negative verification: Constructor accepts very large negative capacity
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorNegative0049";
      console.log(TAG + " start");

      let isExceptionThrown: boolean = false;
      try {
        const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(-Number.MAX_SAFE_INTEGER);
      } catch (error) {
        isExceptionThrown = true;
        expect(error instanceof Error).assertTrue();
      }

      expect(isExceptionThrown).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_5000
     * @tc.name     testLRUCacheConstructorNegative0050
     * @tc.desc     Negative verification: Constructor accepts invalid capacity in scientific notation (1e-10)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0050";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(1e-10);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_5100
     * @tc.name     testLRUCacheConstructorNegative0051
     * @tc.desc     Negative verification: Constructor accepts negative capacity in hexadecimal notation (-0xFF)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0051";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(-0xFF);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_5200
     * @tc.name     testLRUCacheConstructorNegative0052
     * @tc.desc     Negative verification: Constructor accepts invalid capacity in binary notation (0b0)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0052";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(0b0);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_5300
     * @tc.name     testLRUCacheConstructorNegative0053
     * @tc.desc     Negative verification: Constructor accepts invalid capacity in octal notation (0o0)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0053";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(0o0);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_5400
     * @tc.name     testLRUCacheConstructorNegative0054
     * @tc.desc     Negative verification: Constructor accepts very small positive decimal (Number.MIN_VALUE)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0054";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(Number.MIN_VALUE);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_5500
     * @tc.name     testLRUCacheConstructorNegative0055
     * @tc.desc     Negative verification: Constructor accepts 0 capacity, verify exception handling for invalid parameters
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0055";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(0);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_5600
     * @tc.name     testLRUCacheConstructorNegative0056
     * @tc.desc     Negative verification: Constructor accepts negative capacity (-1)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0056";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(-1);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_5700
     * @tc.name     testLRUCacheConstructorNegative0057
     * @tc.desc     Negative verification: Constructor accepts large negative integer capacity (-1000)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0057";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<string, number> = new util.LRUCache<string, number>(-1000);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_5800
     * @tc.name     testLRUCacheConstructorNegative0058
     * @tc.desc     Negative verification: updateCapacity accepts 0 capacity
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => { 
      const TAG: string = "testLRUCacheConstructorNegative0058";
      console.log(TAG + " start");

      const lruCache: util.LRUCache<string, string> = new util.LRUCache<string, string>(3);
      let isExceptionThrown = false;

      try {
        lruCache.updateCapacity(0);
      } catch (error) {
        isExceptionThrown = true;
        expect(error instanceof Error).assertTrue();
      }

      expect(isExceptionThrown).assertTrue();

    });

    /**
     * @tc.number   SUB_UTIL_LRUCACHE_CONSTRUCTOR_NEGATIVE_5900
     * @tc.name     testLRUCacheConstructorNegative0059
     * @tc.desc     Negative verification: Constructor accepts negative capacity (-10)
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 2
     */
    it("testLRUCacheConstructorNegative0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
        const TAG = "testLRUCacheConstructorNegative0059";
        console.log(TAG + " start");

        let isExceptionThrown = false;
        try {
          const lruCache: util.LRUCache<number, string> = new util.LRUCache<number, string>(-10);
        } catch (error) {
          isExceptionThrown = true;
          expect(error instanceof Error).assertTrue();
        }

        expect(isExceptionThrown).assertTrue();

      });
  });
};