import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testIsArray0096,
  testIsArray0098,
  testIsArray0100,
  testIsArrayJs0007,
  testIsArrayJs0032,
  testIsArrayJs0033,
  testIsArrayJs0039,
  testIsArrayJs0045,
  testIsArrayJs0046,
  testIsArrayJs0072,
  testIsArrayJs0076,
  testIsArrayJs0080,
  testIsArrayJs0086
} from './ArrayIsArray';

class CustomArray extends Array<number> {
  customProperty: string = "custom";
}

class ArrayLikeClass {
  length: number;

  constructor(length: number) {
    this.length = length;
  }
}

interface EmptyObjectInterface {}

class ExtendedArray<T> extends Array<T> {
  constructor(items: T[]) {
    super(...items);
  }

  getFirst(): T | undefined {
    return this[0];
  }
}

interface GeneratedTypeLiteralInterface_1 {
  type: string;
  size: number;
}

interface GeneratedTypeLiteralInterface_2 {
  width: number;
  height: number;
  data: Uint8ClampedArray;
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayIsArrayTest() {
  describe('ArrayIsArrayTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0001
     * @tc.name testIsArray0001
     * @tc.desc Verify Array.isArray() returns true for empty array literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: never[] = [];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0002
     * @tc.name testIsArray0002
     * @tc.desc Verify Array.isArray() returns true for non-empty array literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0003
     * @tc.name testIsArray0003
     * @tc.desc Verify Array.isArray() returns true for array created with new Array()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = new Array();
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0004
     * @tc.name testIsArray0004
     * @tc.desc Verify Array.isArray() returns true for array created with new Array(length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = new Array(5);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0005
     * @tc.name testIsArray0005
     * @tc.desc Verify Array.isArray() returns true for array created with new Array(elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = new Array('a', 'b', 'c');
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0006
     * @tc.name testIsArray0006
     * @tc.desc Verify Array.isArray() returns false for empty object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: Record<string, never> = {};
      expect(Array.isArray(obj)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0007
     * @tc.name testIsArray0007
     * @tc.desc Verify Array.isArray() returns false for array-like object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArrayJs0007()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0008
     * @tc.name testIsArray0008
     * @tc.desc Verify Array.isArray() returns false for null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const value: null = null;
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0009
     * @tc.name testIsArray0009
     * @tc.desc Verify Array.isArray() returns false for undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const value: undefined = undefined;
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0010
     * @tc.name testIsArray0010
     * @tc.desc Verify Array.isArray() returns false for string primitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = 'hello';
      expect(Array.isArray(str)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0011
     * @tc.name testIsArray0011
     * @tc.desc Verify Array.isArray() returns false for String object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const strObj: String = new String('hello');
      expect(Array.isArray(strObj)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0012
     * @tc.name testIsArray0012
     * @tc.desc Verify Array.isArray() returns false for number primitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const num: number = 123;
      expect(Array.isArray(num)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0013
     * @tc.name testIsArray0013
     * @tc.desc Verify Array.isArray() returns false for Number object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const numObj: Number = new Number(123);
      expect(Array.isArray(numObj)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0014
     * @tc.name testIsArray0014
     * @tc.desc Verify Array.isArray() returns false for boolean primitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const bool: boolean = true;
      expect(Array.isArray(bool)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0015
     * @tc.name testIsArray0015
     * @tc.desc Verify Array.isArray() returns false for Boolean object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const boolObj: Boolean = new Boolean(true);
      expect(Array.isArray(boolObj)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0016
     * @tc.name testIsArray0016
     * @tc.desc Verify Array.isArray() returns false for function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func: () => void = () => {
      };
      expect(Array.isArray(func)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0017
     * @tc.name testIsArray0017
     * @tc.desc Verify Array.isArray() returns false for Date object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date();
      expect(Array.isArray(date)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0018
     * @tc.name testIsArray0018
     * @tc.desc Verify Array.isArray() returns false for RegExp object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex: RegExp = /pattern/;
      expect(Array.isArray(regex)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0019
     * @tc.name testIsArray0019
     * @tc.desc Verify Array.isArray() returns false for Set object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      expect(Array.isArray(set)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0020
     * @tc.name testIsArray0020
     * @tc.desc Verify Array.isArray() returns false for Map object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<string, number> = new Map();
      expect(Array.isArray(map)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0021
     * @tc.name testIsArray0021
     * @tc.desc Verify Array.isArray() returns false for Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const uint8: Uint8Array = new Uint8Array();
      expect(Array.isArray(uint8)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0022
     * @tc.name testIsArray0022
     * @tc.desc Verify Array.isArray() returns false for Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const int16: Int16Array = new Int16Array([1, 2, 3]);
      expect(Array.isArray(int16)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0023
     * @tc.name testIsArray0023
     * @tc.desc Verify Array.isArray() returns false for Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const float32: Float32Array = new Float32Array([1.5, 2.5]);
      expect(Array.isArray(float32)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0024
     * @tc.name testIsArray0024
     * @tc.desc Verify Array.isArray() returns true for Array subclass instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const customArr: CustomArray = new CustomArray();
      expect(Array.isArray(customArr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0025
     * @tc.name testIsArray0025
     * @tc.desc Verify Array.isArray() returns true for Array subclass with elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const customArr: CustomArray = new CustomArray(1, 2, 3);
      expect(Array.isArray(customArr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0026
     * @tc.name testIsArray0026
     * @tc.desc Verify Array.isArray() returns false for array-like class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arrayLike: ArrayLikeClass = new ArrayLikeClass(5);
      expect(Array.isArray(arrayLike)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0027
     * @tc.name testIsArray0027
     * @tc.desc Verify Array.isArray() returns true for nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const nestedArr = [1, [2, [3]]];
      expect(Array.isArray(nestedArr)).assertTrue();
      expect(Array.isArray(nestedArr[1])).assertTrue();
      expect(Array.isArray((nestedArr[1] as Array<number>)[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0028
     * @tc.name testIsArray0028
     * @tc.desc Verify Array.isArray() returns false for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const value: number = NaN;
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0029
     * @tc.name testIsArray0029
     * @tc.desc Verify Array.isArray() returns false for Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const value: number = Infinity;
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0030
     * @tc.name testIsArray0030
     * @tc.desc Verify Array.isArray() returns true for array with mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mixedArr: Array<number | string | boolean | null | EmptyObjectInterface> = [1, 'a', true, null, {}];
      expect(Array.isArray(mixedArr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0031
     * @tc.name testIsArray0031
     * @tc.desc Verify Array.isArray() returns false for arguments object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testArgs: (...args: number[]) => IArguments = (...args: number[]): IArguments => {
        return arguments;
      };
      const args: IArguments = testArgs(1, 2, 3);
      expect(Array.isArray(args)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0032
     * @tc.name testIsArray0032
     * @tc.desc Verify Array.isArray() returns true for array with Symbol elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArrayJs0032()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0033
     * @tc.name testIsArray0033
     * @tc.desc Verify Array.isArray() returns false for Symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArrayJs0033()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0034
     * @tc.name testIsArray0034
     * @tc.desc Verify Array.isArray() returns false for WeakMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const weakMap: WeakMap<object, number> = new WeakMap();
      expect(Array.isArray(weakMap)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0035
     * @tc.name testIsArray0035
     * @tc.desc Verify Array.isArray() returns false for WeakSet
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const weakSet: WeakSet<object> = new WeakSet();
      expect(Array.isArray(weakSet)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0036
     * @tc.name testIsArray0036
     * @tc.desc Verify Array.isArray() returns true for array with 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.length = 0;
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0037
     * @tc.name testIsArray0037
     * @tc.desc Verify Array.isArray() returns true for array with large length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = new Array(10000);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0038
     * @tc.name testIsArray0038
     * @tc.desc Verify Array.isArray() returns false for Error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error: Error = new Error('test');
      expect(Array.isArray(error)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0039
     * @tc.name testIsArray0039
     * @tc.desc Verify Array.isArray() returns false for JSON object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArrayJs0039()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0040
     * @tc.name testIsArray0040
     * @tc.desc Verify Array.isArray() returns false for Math object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const math = Math;
      expect(Array.isArray(math)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0041
     * @tc.name testIsArray0041
     * @tc.desc Verify Array.isArray() returns true for array created with Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = Array.of(1, 2, 3);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0042
     * @tc.name testIsArray0042
     * @tc.desc Verify Array.isArray() returns true for array created with Array.from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = Array.from([1, 2, 3]);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0043
     * @tc.name testIsArray0043
     * @tc.desc Verify Array.isArray() returns false for DOM element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface MockElement {
        tagName: string;
      }

      const mockElement: MockElement = { tagName: 'DIV' };
      expect(Array.isArray(mockElement)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0044
     * @tc.name testIsArray0044
     * @tc.desc Verify Array.isArray() returns false for NodeList
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface MockNodeList {
        length: number;
        item: (index: number) => null;
      }

      const mockNodeList: MockNodeList = { length: 0, item: (index: number) => null };
      expect(Array.isArray(mockNodeList)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0045
     * @tc.name testIsArray0045
     * @tc.desc Verify Array.isArray() works with frozen array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArrayJs0045()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0046
     * @tc.name testIsArray0046
     * @tc.desc Verify Array.isArray() works with sealed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArrayJs0046()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0047
     * @tc.name testIsArray0047
     * @tc.desc Verify Array.isArray() returns false for array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      expect(Array.isArray(buffer)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0048
     * @tc.name testIsArray0048
     * @tc.desc Verify Array.isArray() returns false for data view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const view: DataView = new DataView(buffer);
      expect(Array.isArray(view)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0049
     * @tc.name testIsArray0049
     * @tc.desc Verify Array.isArray() returns true for empty array from Array.from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = Array.from([]);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0050
     * @tc.name testIsArray0050
     * @tc.desc Verify Array.isArray() returns true for array with holes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr[0] = 1;
      arr[2] = 3;
      arr.length = 3;
      expect(Array.isArray(arr)).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0051
     * @tc.name testIsArray0051
     * @tc.desc Verify Array.isArray() returns true for array with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [-1, -2, -3];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0052
     * @tc.name testIsArray0052
     * @tc.desc Verify Array.isArray() returns false for BigInt primitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const bigInt: bigint = 123n;
      expect(Array.isArray(bigInt)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0053
     * @tc.name testIsArray0053
     * @tc.desc Verify Array.isArray() returns true for array containing BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: bigint[] = [1n, 2n, 3n];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0054
     * @tc.name testIsArray0054
     * @tc.desc Verify Array.isArray() returns false for Blob object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mockBlob: GeneratedTypeLiteralInterface_1 = { type: 'text/plain', size: 1024 };
      expect(Array.isArray(mockBlob)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0055
     * @tc.name testIsArray0055
     * @tc.desc Verify Array.isArray() returns true for array with function elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Array<() => void> = [() => {
      }, () => {
      }];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0056
     * @tc.name testIsArray0056
     * @tc.desc Verify Array.isArray() returns false for array buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const view: Uint32Array = new Uint32Array(buffer);
      expect(Array.isArray(view)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0057
     * @tc.name testIsArray0057
     * @tc.desc Verify Array.isArray() returns true for array with Date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Date[] = [new Date(), new Date(2023, 0, 1)];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0058
     * @tc.name testIsArray0058
     * @tc.desc Verify Array.isArray() returns false for ImageData object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mockImageData: GeneratedTypeLiteralInterface_2 = {
        width: 100,
        height: 100,
        data: new Uint8ClampedArray(40000)
      };
      expect(Array.isArray(mockImageData)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0059
     * @tc.name testIsArray0059
     * @tc.desc Verify Array.isArray() returns true for array with null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null)[] = [1, null, 3];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0060
     * @tc.name testIsArray0060
     * @tc.desc Verify Array.isArray() returns false for RangeError object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error: RangeError = new RangeError('Out of range');
      expect(Array.isArray(error)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0061
     * @tc.name testIsArray0061
     * @tc.desc Verify Array.isArray() returns true for array with undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (string | undefined)[] = ['a', undefined, 'c'];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0062
     * @tc.name testIsArray0062
     * @tc.desc Verify Array.isArray() returns false for ReferenceError object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error: ReferenceError = new ReferenceError('Not defined');
      expect(Array.isArray(error)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0063
     * @tc.name testIsArray0063
     * @tc.desc Verify Array.isArray() returns true for array with mixed object types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (Date | RegExp | Map<string, number>)[] = [new Date(), /pattern/, new Map()];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0064
     * @tc.name testIsArray0064
     * @tc.desc Verify Array.isArray() returns false for SyntaxError object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error: SyntaxError = new SyntaxError('Invalid syntax');
      expect(Array.isArray(error)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0065
     * @tc.name testIsArray0065
     * @tc.desc Verify Array.isArray() returns true for array with very large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1e20, 1e30, 1e40];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0066
     * @tc.name testIsArray0066
     * @tc.desc Verify Array.isArray() returns false for TypeError object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error: TypeError = new TypeError('Invalid type');
      expect(Array.isArray(error)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0067
     * @tc.name testIsArray0067
     * @tc.desc Verify Array.isArray() returns true for array with very small numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1e-20, 1e-30, 1e-40];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0068
     * @tc.name testIsArray0068
     * @tc.desc Verify Array.isArray() returns false for URIError object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error: URIError = new URIError('Invalid URI');
      expect(Array.isArray(error)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0069
     * @tc.name testIsArray0069
     * @tc.desc Verify Array.isArray() returns true for array with regex elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: RegExp[] = [/a/, /b/, /c/];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0070
     * @tc.name testIsArray0070
     * @tc.desc Verify Array.isArray() returns false for Promise object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise: Promise<number> = new Promise(resolve => resolve(1));
      expect(Array.isArray(promise)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0071
     * @tc.name testIsArray0071
     * @tc.desc Verify Array.isArray() returns true for array with Set elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Set<number>[] = [new Set([1, 2]), new Set([3, 4])];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0072
     * @tc.name testIsArray0072
     * @tc.desc Verify Array.isArray() returns false for Generator object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArrayJs0072()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0073
     * @tc.name testIsArray0073
     * @tc.desc Verify Array.isArray() returns true for array with Map elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Map<string, number>[] = [new Map([['a', 1]]), new Map([['b', 2]])];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0074
     * @tc.name testIsArray0074
     * @tc.desc Verify Array.isArray() returns false for Proxy object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const target: EmptyObjectInterface = {};
      const proxy: EmptyObjectInterface = new Proxy(target, {} as EmptyObjectInterface);
      expect(Array.isArray(proxy)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0075
     * @tc.name testIsArray0075
     * @tc.desc Verify Array.isArray() returns true for empty typed array converted to array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArr: Uint8Array = new Uint8Array();
      const arr: number[] = Array.from(typedArr);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0076
     * @tc.name testIsArray0076
     * @tc.desc Verify Array.isArray() returns false for module namespace object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArrayJs0076()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0077
     * @tc.name testIsArray0077
     * @tc.desc Verify Array.isArray() returns true for array created by spreading another array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: string[] = ['a', 'b', 'c'];
      const arr: string[] = [...original];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0078
     * @tc.name testIsArray0078
     * @tc.desc Verify Array.isArray() returns false for WeakRef object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const target: EmptyObjectInterface = {};
      const weakRef: WeakRef<EmptyObjectInterface> = new WeakRef(target);
      expect(Array.isArray(weakRef)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0079
     * @tc.name testIsArray0079
     * @tc.desc Verify Array.isArray() returns true for array returned by filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: number[] = [1, 2, 3, 4, 5];
      const filtered: number[] = original.filter(x => x % 2 === 0);
      expect(Array.isArray(filtered)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0080
     * @tc.name testIsArray0080
     * @tc.desc Verify Array.isArray() returns false for FinalizationRegistry object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArrayJs0080()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0081
     * @tc.name testIsArray0081
     * @tc.desc Verify Array.isArray() returns true for array returned by map method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: number[] = [1, 2, 3];
      const mapped: number[] = original.map(x => x * 2);
      expect(Array.isArray(mapped)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0083
     * @tc.name testIsArray0083
     * @tc.desc Verify Array.isArray() returns true for array returned by slice method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: string[] = ['a', 'b', 'c', 'd'];
      const sliced: string[] = original.slice(1, 3);
      expect(Array.isArray(sliced)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0085
     * @tc.name testIsArray0085
     * @tc.desc Verify Array.isArray() returns true for array returned by concat method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const concatenated: number[] = arr1.concat(arr2);
      expect(Array.isArray(concatenated)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0086
     * @tc.name testIsArray0086
     * @tc.desc Verify Array.isArray() returns false for Performance object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArrayJs0086()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0087
     * @tc.name testIsArray0087
     * @tc.desc Verify Array.isArray() returns true for array with array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1], [2, 3], [4, 5, 6]];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0089
     * @tc.name testIsArray0089
     * @tc.desc Verify Array.isArray() returns true for array with typed array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Uint8Array[] = [new Uint8Array([1, 2]), new Uint8Array([3, 4])];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0091
     * @tc.name testIsArray0091
     * @tc.desc Verify Array.isArray() returns true for array with class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class TestClass {
        id: number;

        constructor(id: number) {
          this.id = id;
        }
      }

      const arr: TestClass[] = [new TestClass(1), new TestClass(2)];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0092
     * @tc.name testIsArray0092
     * @tc.desc Verify Array.isArray() returns false for DataView object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const view: DataView = new DataView(buffer);
      expect(Array.isArray(view)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0093
     * @tc.name testIsArray0093
     * @tc.desc Verify Array.isArray() returns true for array with extended array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const extArr1: ExtendedArray<number> = new ExtendedArray([1, 2, 3]);
      const extArr2: ExtendedArray<number> = new ExtendedArray([4, 5, 6]);
      const arr: ExtendedArray<number>[] = [extArr1, extArr2];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0094
     * @tc.name testIsArray0094
     * @tc.desc Verify Array.isArray() returns false for Intl objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const intl: Intl.DateTimeFormat = new Intl.DateTimeFormat();
      expect(Array.isArray(intl)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0095
     * @tc.name testIsArray0095
     * @tc.desc Verify Array.isArray() returns true for array with sparse elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [];
      arr[0] = 1;
      arr[5] = 6;
      arr.length = 10;
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0096
     * @tc.name testIsArray0096
     * @tc.desc Verify Array.isArray() returns false for Crypto object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArray0096()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0097
     * @tc.name testIsArray0097
     * @tc.desc Verify Array.isArray() returns true for array with deeply nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][][][] = [[[[1]]]];
      expect(Array.isArray(arr)).assertTrue();
      expect(Array.isArray(arr[0])).assertTrue();
      expect(Array.isArray(arr[0][0])).assertTrue();
      expect(Array.isArray(arr[0][0][0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0098
     * @tc.name testIsArray0098
     * @tc.desc Verify Array.isArray() returns false for array-like nested object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArray0098()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0099
     * @tc.name testIsArray0099
     * @tc.desc Verify Array.isArray() returns true for array created with Array.from on Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);
      const arr: string[] = Array.from(set);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0100
     * @tc.name testIsArray0100
     * @tc.desc Verify Array.isArray() returns false for array-like object with array methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testIsArray0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testIsArray0100()).assertFalse();
    });
  });
}