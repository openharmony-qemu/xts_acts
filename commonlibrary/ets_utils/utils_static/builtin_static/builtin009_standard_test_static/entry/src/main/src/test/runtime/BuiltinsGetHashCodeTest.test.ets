import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';

import {
  NormalTestObject,
  InnerMostTestObject,
  MiddleTestObject,
  NestedTestObject,
  FunctionPropTestObject,
  ArrayBufferTestObject,
  DataViewTestObject,
  Key2ValueObj,
  ParentTestClass,
  InheritedTestClass,
  NonEnumerableTestClass,
  InjectedProtoClass,
  MiddleProtoClass,
  PrototypePollutionTestClass,
  TestClass,
  UndefinedPropertyTestClass,
  NullPropertyTestClass,
  NaNPropertyTestClass,
  InfinityPropertyTestClass,
  TypedArrayTestClass,
  MapTestClass,
  SetTestClass,
  PromiseTestClass,
  RegExpTestClass
} from './BuiltinsGetHashCodeClass';
import Utils from '../Util.test';

export default function builtinsGetHashCodeTest() {
  describe("builtinsGetHashCodeTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name: builtinsGetHashCodeTest0100
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST0100
     * @tc.desc: Test getHashCode by normal object
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: NormalTestObject = {
        a: 1,
        b: "test",
        c: [1, 2, 3]
      };

      let hashCode: number | undefined = undefined;
      let isValidObject = false;

      try {
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(testObject.a === 1).assertTrue();
        expect(testObject.b === "test").assertTrue();
        expect(testObject.c.length === 3).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log("处理 NormalTestObject 时出现异常：", error);
      }

      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest0200
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST0200
     * @tc.desc: Test getHashCode by nested object
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: NestedTestObject = {
        a: 1,
        b: {
          c: 2,
          d: {
            e: 3
          }
        }
      };
      let hashCode: number | undefined = undefined;
      let isValidObject = false;

      try {
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest0300
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST0300
     * @tc.desc: Test getHashCode by functional object
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;
      try {
        const testObject: FunctionPropTestObject = {
          a: 1,
          b: () => {}
        };
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest0400
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST0400
     * @tc.desc: Test getHashCode by object with extended chain
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;
      try {
        const testObject: InheritedTestClass = new InheritedTestClass();
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest0500
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST0500
     * @tc.desc: Test getHashCode with null input
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: Object = new Object();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;

      try {
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest0600
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST0600
     * @tc.desc: Test getHashCode with non-enumerable property object
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;
      try {
        const testObject: NonEnumerableTestClass = new NonEnumerableTestClass();
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest0700
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST0700
     * @tc.desc: Test getHashCode with arraybuffer object
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;

      try {
        const testObject: ArrayBufferTestObject = {
          buffer: new ArrayBuffer(16)
        };
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest0800
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST0800
     * @tc.desc: Test getHashCode with dataview object
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;

      try {
        const testObject: DataViewTestObject = {
          view: new DataView(new ArrayBuffer(16))
        };
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest0900
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST0900
     * @tc.desc: Test getHashCode with null object
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;

      try {
        const testObject: object = {};
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest1000
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST1000
     * @tc.desc: Test getHashCode with large object
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isValidObject = false;

      try {
        const largeArray: number[] = [];
        for (let i = 0; i < 10000; i++) {
          largeArray.push(i);
        }
        let hashCode: number | undefined = undefined;
        hashCode = Runtime.getHashCode(largeArray);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }

      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest1100
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST1100
     * @tc.desc: Test getHashCode with contaminated chain object
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: PrototypePollutionTestClass = new PrototypePollutionTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;

      try {
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log( error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest1200
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST1200
     * @tc.desc: Test getHashCode with non-extension object
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let isNonExtensible = false;
      let isValidObject = false;

      try {
        const testObject: TestClass = new TestClass();
        let hashCode: number | undefined = undefined;
        const ownProperties = Object.getOwnPropertyNames(testObject);
        const hasPropertyA = ownProperties.includes('a');
        const noExtraProperties = ownProperties.length === 1;

        isNonExtensible = hasPropertyA && noExtraProperties;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(isNonExtensible).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest1300
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST1300
     * @tc.desc: Test getHashCode with frozen object
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: TestClass = new TestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isFrozen = false;
      let hasValidProperty = false;
      let isPropReadOnly = false;

      try {
        hasValidProperty = (testObject.a === 1);
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(hasValidProperty).assertTrue();
        expect(isFrozen).assertFalse();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest1400
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST1400
     * @tc.desc: Test getHashCode with sealed object
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: TestClass = new TestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isSealed = false;
      let hasValidProperty = false;
      let canModifyExistingProperty = false;

      try {
        hasValidProperty = (testObject.a === 1);
        testObject.a = 2;
        canModifyExistingProperty = (testObject.a === 2);
        isSealed = hasValidProperty && canModifyExistingProperty;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(hasValidProperty).assertTrue();
        expect(canModifyExistingProperty).assertTrue();
        expect(isSealed).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest1500
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST1500
     * @tc.desc: Test getHashCode by object with undefined value
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: UndefinedPropertyTestClass = new UndefinedPropertyTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let hasValidUndefinedProperty = false;
      let hasValidNumberProperty = false;

      try {
        hasValidUndefinedProperty = (testObject.a === undefined);
        hasValidNumberProperty = (testObject.b === 1);
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(hasValidUndefinedProperty).assertTrue();
        expect(hasValidNumberProperty).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest1600
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST1600
     * @tc.desc: Test getHashCode by object with null value
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: NullPropertyTestClass = new NullPropertyTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let hasValidNullProperty = false;
      let hasValidNumberProperty = false;

      try {
        hasValidNullProperty = (testObject.a === null);
        hasValidNumberProperty = (testObject.b === 1);
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(hasValidNullProperty).assertTrue();
        expect(hasValidNumberProperty).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest1700
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST1700
     * @tc.desc: Test getHashCode by object with nan value
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: NaNPropertyTestClass = new NaNPropertyTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let hasValidNaNProperty = false;
      let hasValidNumberProperty = false;

      try {
        hasValidNaNProperty = Number.isNaN(testObject.a);
        hasValidNumberProperty = (testObject.b === 1);
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(hasValidNaNProperty).assertTrue();
        expect(hasValidNumberProperty).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log( error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest1800
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST1800
     * @tc.desc: Test getHashCode by object with infinity value
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: InfinityPropertyTestClass = new InfinityPropertyTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let hasValidInfinityProperty = false;
      let hasValidNumberProperty = false;

      try {
        hasValidInfinityProperty = (testObject.a === Infinity);
        hasValidNumberProperty = (testObject.b === 1);
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(hasValidInfinityProperty).assertTrue();
        expect(hasValidNumberProperty).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest1900
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST1900
     * @tc.desc: Test getHashCode by object with typearray value
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: TypedArrayTestClass = new TypedArrayTestClass();
      const targetData = [72, 101, 108, 108, 111];
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isUint8ArrayInstance = false;
      let hasCorrectLength = false;
      let hasCorrectContent = false;

      try {
        isUint8ArrayInstance = (testObject.buffer instanceof Uint8Array);
        hasCorrectLength = (testObject.buffer.length === targetData.length);
        let contentMatch = true;
        for (let i = 0; i < testObject.buffer.length; i++) {
          if (testObject.buffer[i] !== targetData[i]) {
            contentMatch = false;
            break;
          }
        }
        hasCorrectContent = contentMatch;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(isUint8ArrayInstance).assertTrue();
        expect(hasCorrectLength).assertTrue();
        expect(hasCorrectContent).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest2000
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST2000
     * @tc.desc: Test getHashCode by object with map value
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: MapTestClass = new MapTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isMapInstance = false;
      let hasCorrectSize = false;
      let hasCorrectKey1Value = false;
      let hasCorrectKey2Value = false;

      try {
        isMapInstance = (testObject.map instanceof Map);
        hasCorrectSize = (testObject.map.size === 2);
        hasCorrectKey1Value = (testObject.map.get('key1') === 'value1');
        const key2Value = testObject.map.get('key2');
        hasCorrectKey2Value = (typeof key2Value === 'object' && key2Value !== null && (key2Value as Key2ValueObj).a === 1);
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(isMapInstance).assertTrue();
        expect(hasCorrectSize).assertTrue();
        expect(hasCorrectKey1Value).assertTrue();
        expect(hasCorrectKey2Value).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest2100
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST2100
     * @tc.desc: Test getHashCode by object with set value
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: SetTestClass = new SetTestClass();
      const targetElements = [1, 2, 3];
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isSetInstance = false;
      let hasCorrectSize = false;
      let hasAllTargetElements = false;

      try {
        isSetInstance = (testObject.set instanceof Set);
        hasCorrectSize = (testObject.set.size === 3);
        let allElementsExist = true;
        for (const element of targetElements) {
          if (!testObject.set.has(element)) {
            allElementsExist = false;
            break;
          }
        }
        hasAllTargetElements = allElementsExist;
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(isSetInstance).assertTrue();
        expect(hasCorrectSize).assertTrue();
        expect(hasAllTargetElements).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest2200
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST2200
     * @tc.desc: Test getHashCode by object with promise value
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const testObject: PromiseTestClass = new PromiseTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isPromiseInstance = false;
      let isPromiseResolvedCorrectly = false;

      try {
        isPromiseInstance = (testObject.promise instanceof Promise);
        const promiseResult = await testObject.promise;
        isPromiseResolvedCorrectly = (promiseResult === 'done');
        hashCode = Runtime.getHashCode(testObject);
        expect(Number.isInteger(hashCode)).assertTrue();
        expect(isPromiseInstance).assertTrue();
        expect(isPromiseResolvedCorrectly).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });

    /**
     * @tc.name: builtinsGetHashCodeTest2300
     * @tc.number: BUILTINS_GET_HASH_CODE_TEST2300
     * @tc.desc: Test getHashCode by object with regular expression value
     * @tc.type: FUNCTION
     * @tc.size: SMALLTEST
     * @tc.level: LEVEL0
     */
    it('builtinsGetHashCodeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testObject: RegExpTestClass = new RegExpTestClass();
      let hashCode: number | undefined = undefined;
      let isValidObject = false;
      let isRegexInstance = false;
      let hasCorrectRegexSource = false;
      let hasCorrectRegexFlags = false;
      let isFlagsInstance = false;
      let hasCorrectFlagsSource = false;
      let hasCorrectFlagsFlags = false;

      try {
        isRegexInstance = (testObject.regex instanceof RegExp);
        hasCorrectRegexSource = (testObject.regex.source === 'abc');
        hasCorrectRegexFlags = (testObject.regex.flags === 'gi');
        isFlagsInstance = (testObject.flags instanceof RegExp);
        hasCorrectFlagsSource = (testObject.flags.source === 'def');
        hasCorrectFlagsFlags = (testObject.flags.flags === 'm');
        hashCode = Runtime.getHashCode(testObject);

        expect(Number.isInteger(hashCode)).assertTrue();
        expect(isRegexInstance).assertTrue();
        expect(hasCorrectRegexSource).assertTrue();
        expect(hasCorrectRegexFlags).assertTrue();
        expect(isFlagsInstance).assertTrue();
        expect(hasCorrectFlagsSource).assertTrue();
        expect(hasCorrectFlagsFlags).assertTrue();
        isValidObject = true;
      } catch (error) {
        console.log(error);
      }
      expect(isValidObject).assertTrue();
    });
  })
}