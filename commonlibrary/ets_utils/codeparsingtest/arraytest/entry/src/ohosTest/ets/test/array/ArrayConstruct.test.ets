import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testArrayConstructorJs0018,
  testArrayConstructorJs0033,
  testArrayConstructorJs0038,
  testArrayConstructorJs0039,
  testArrayConstructorJs0043,
  testArrayConstructorJs0047,
  testArrayConstructorJs0048,
  testArrayConstructorJs0049,
  testArrayConstructorJs0050,
  testArrayConstructorJs0064,
  testArrayConstructorJs0065,
  testArrayConstructorJs0137,
  testArrayConstructorJs0141
} from './ArrayConstruct';

interface GeneratedObjectLiteralInterface_1 {
  id: number;
  name: string;
}

interface GeneratedObjectLiteralInterface_2 {
  length: number;
  __0: string;
  __1: string;
  __2: string;
}

interface GeneratedObjectLiteralInterface_3 {
  value: number;
}

interface GeneratedObjectLiteralInterface_4 {
  id: number;
  value: number;
}

interface GeneratedObjectLiteralInterface_5 {
  name: string;
  role: string;
}

interface GeneratedObjectLiteralInterface_6 {
  enabled: boolean;
  visible: boolean;
}

interface GeneratedObjectLiteralInterface_7 {
  id: number;
  name: string;
  active: boolean;
}

interface GeneratedObjectLiteralInterface_8 {
  name: string;
  members: number[];
}

interface GeneratedObjectLiteralInterface_9 {
  color: string;
  size: string;
}

interface GeneratedObjectLiteralInterface_10 {
  id: number;
  details: GeneratedObjectLiteralInterface_9;
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayConstructTest() {
  describe('ArrayConstructTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0001
     * @tc.name testArrayConstructor0001
     * @tc.desc Verify Array constructor creates empty array with single positive integer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(8);
      expect(arr.length).assertEqual(8);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[7]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0002
     * @tc.name testArrayConstructor0002
     * @tc.desc Verify Array constructor handles single large positive integer length (10000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const largeLength = 10000;
      const arr = new Array<string>(largeLength);
      expect(arr.length).assertEqual(largeLength);
      expect(arr[9999]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0003
     * @tc.name testArrayConstructor0003
     * @tc.desc Verify Array constructor creates array with multiple string element arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>('apple', 'banana', 'cherry', 'date');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual('apple');
      expect(arr[2]).assertEqual('cherry');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0004
     * @tc.name testArrayConstructor0004
     * @tc.desc Verify Array constructor creates array with multiple boolean element arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<boolean>(true, false, true, false);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(false);
      expect(arr[3]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0005
     * @tc.name testArrayConstructor0005
     * @tc.desc Verify Array constructor throws error when argument is non-integer float (3.7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let isErrorThrown = false;
      try {
        new Array<number>(3.7);
      } catch (error) {
        isErrorThrown = true;
      }
      expect(isErrorThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0006
     * @tc.name testArrayConstructor0006
     * @tc.desc Verify Array constructor throws error when argument is negative integer (-5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let isErrorThrown = false;
      try {
        new Array<number>(-5);
      } catch (error) {
        isErrorThrown = true;
      }
      expect(isErrorThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0007
     * @tc.name testArrayConstructor0007
     * @tc.desc Verify Array constructor creates empty array with 0 as single argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(0);
      expect(arr.length).assertEqual(0);
      expect(arr).assertDeepEquals([]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0008
     * @tc.name testArrayConstructor0008
     * @tc.desc Verify Array works without 'new' keyword for multiple number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = Array<number>(10, 20, 30, 40);
      expect(arr.length).assertEqual(4);
      expect(arr[2]).assertEqual(30);
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0009
     * @tc.name testArrayConstructor0009
     * @tc.desc Verify Array works without 'new' keyword for single length argument (6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = Array<number>(6);
      expect(arr.length).assertEqual(6);
      expect(arr[4]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0010
     * @tc.name testArrayConstructor0010
     * @tc.desc Verify Array constructor creates array with nested array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const nestedArr1 = [1, 2];
      const nestedArr2 = [3, 4];
      const arr = new Array<number[]>(nestedArr1, nestedArr2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertDeepEquals([1, 2]);
      expect(arr[1]).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0011
     * @tc.name testArrayConstructor0011
     * @tc.desc Verify Array constructor creates array with object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: GeneratedObjectLiteralInterface_1 = { id: 1, name: 'Alice' };
      const obj2: GeneratedObjectLiteralInterface_1 = { id: 2, name: 'Bob' };
      const arr = new Array<GeneratedObjectLiteralInterface_1>(obj1, obj2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].id).assertEqual(1);
      expect(arr[1].name).assertEqual('Bob');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0012
     * @tc.name testArrayConstructor0012
     * @tc.desc Verify Array constructor preserves order of mixed-type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number | string | boolean | null>(5, 'test', true, null);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual('test');
      expect(arr[2]).assertEqual(true);
      expect(arr[3]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0013
     * @tc.name testArrayConstructor0013
     * @tc.desc Verify Array constructor with no arguments creates empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>();
      expect(arr.length).assertEqual(0);
      expect(arr).assertDeepEquals([]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0014
     * @tc.name testArrayConstructor0014
     * @tc.desc Verify empty array from constructor can be modified with push()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>();
      arr.push('orange', 'grape');
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('orange');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0015
     * @tc.name testArrayConstructor0015
     * @tc.desc Verify Array constructor treats array-like object as single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arrayLike: GeneratedObjectLiteralInterface_2 = {
        length: 3,
        __0: 'x',
        __1: 'y',
        __2: 'z'
      };
      const arr = new Array<GeneratedObjectLiteralInterface_2>(arrayLike);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(arrayLike);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0016
     * @tc.name testArrayConstructor0016
     * @tc.desc Verify Array constructor preserves duplicate primitive elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(2, 2, 3, 3, 3);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(arr[1]);
      expect(arr[2]).assertEqual(arr[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0017
     * @tc.name testArrayConstructor0017
     * @tc.desc Verify Array constructor handles duplicate reference-type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const sharedObj: GeneratedObjectLiteralInterface_3 = { value: 100 };
      const arr = new Array<GeneratedObjectLiteralInterface_3>(sharedObj, sharedObj);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(arr[1]);
      arr[0].value = 200;
      expect(arr[1].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0018
     * @tc.name testArrayConstructor0018
     * @tc.desc Verify Array constructor creates array with Symbol elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testArrayConstructorJs0018()).assertDeepEquals([true, true, true])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0019
     * @tc.name testArrayConstructor0019
     * @tc.desc Verify Array constructor creates array with Date object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date('2024-01-01');
      const date2 = new Date('2024-01-02');
      const arr = new Array<Date>(date1, date2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].toISOString()).assertEqual('2024-01-01T00:00:00.000Z');
      expect(arr[1].toISOString()).assertEqual('2024-01-02T00:00:00.000Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0020
     * @tc.name testArrayConstructor0020
     * @tc.desc Verify Array constructor creates array with function elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1 = (a: number, b: number) => a + b;
      const func2 = (str: string) => str.toUpperCase();
      const arr = new Array<((a: number, b: number) => number) | ((str: string) => string)>(func1, func2);
      expect(arr.length).assertEqual(2);
      expect((arr[0] as Function)(2, 3)).assertEqual(5);
      expect((arr[1] as Function)('hello')).assertEqual('HELLO');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0021
     * @tc.name testArrayConstructor0021
     * @tc.desc Verify Array constructor creates array with BigInt elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const big1 = BigInt(100);
      const big2 = BigInt(200);
      const arr = new Array<bigint>(big1, big2);
      expect(arr[0]).assertEqual(big1);
      expect(arr[1]).assertEqual(big2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0022
     * @tc.name testArrayConstructor0022
     * @tc.desc Verify Array constructor handles single string argument as element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>('single');
      const expected = ['single'];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0023
     * @tc.name testArrayConstructor0023
     * @tc.desc Verify Array constructor creates array with multi-line string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str1 = 'line1\nline2';
      const str2 = 'line3\nline4';
      const arr = new Array<string>(str1, str2);
      const expected = [str1, str2];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0024
     * @tc.name testArrayConstructor0024
     * @tc.desc Verify Array constructor with single boolean argument as element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<boolean>(true);
      const expected = [true];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0025
     * @tc.name testArrayConstructor0025
     * @tc.desc Verify Array constructor with single null argument as element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<null>(null);
      const expected = [null];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0026
     * @tc.name testArrayConstructor0026
     * @tc.desc Verify Array constructor with single undefined argument as element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<undefined>(undefined);
      const expected = [undefined];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0027
     * @tc.name testArrayConstructor0027
     * @tc.desc Verify Array constructor with Infinity as element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(Infinity, -Infinity);
      const expected = [Infinity, -Infinity];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0028
     * @tc.name testArrayConstructor0028
     * @tc.desc Verify Array constructor with NaN as element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(NaN, 1, NaN);
      expect(arr.length).assertEqual(3);
      expect(isNaN(arr[0])).assertTrue();
      expect(isNaN(arr[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0029
     * @tc.name testArrayConstructor0029
     * @tc.desc Verify Array constructor creates array with regexp elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1 = /test/;
      const regex2 = /pattern/g;
      const arr = new Array<RegExp>(regex1, regex2);
      const expected = [regex1, regex2];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0030
     * @tc.name testArrayConstructor0030
     * @tc.desc Verify Array constructor creates array with typed array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typed1 = new Uint8Array([1, 2, 3]);
      const typed2 = new Float32Array([4.5, 5.5]);
      const arr = new Array<Uint8Array | Float32Array>(typed1, typed2);
      const expected = [typed1, typed2];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0031
     * @tc.name testArrayConstructor0031
     * @tc.desc Verify Array constructor creates array with Map elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1 = new Map<string, number>([['a', 1]]);
      const map2 = new Map<number, string>([[2, 'b']]);
      const arr = new Array<Map<string, number> | Map<number, string>>(map1, map2);
      const expected = [map1, map2];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0032
     * @tc.name testArrayConstructor0032
     * @tc.desc Verify Array constructor creates array with Set elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set1 = new Set<number>([1, 2]);
      const set2 = new Set<string>(['a', 'b']);
      const arr = new Array<Set<number> | Set<string>>(set1, set2);
      const expected = [set1, set2];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0033
     * @tc.name testArrayConstructor0033
     * @tc.desc Verify Array constructor with very large element count (5000 elements)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0033', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      expect(testArrayConstructorJs0033()).assertDeepEquals([5000, 4999])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0034
     * @tc.name testArrayConstructor0034
     * @tc.desc Verify Array constructor with sparse array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3); // Note the intentional comma creating sparse element
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(undefined);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0035
     * @tc.name testArrayConstructor0035
     * @tc.desc Verify Array constructor with single element that is an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const emptyArr = [];
      const arr = new Array(emptyArr);
      const expected = [emptyArr];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0036
     * @tc.name testArrayConstructor0036
     * @tc.desc Verify Array constructor with deeply nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const nested = [[[1]]];
      const arr = new Array<number[][][]>(nested);
      const expected = [[[[1]]]];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0037
     * @tc.name testArrayConstructor0037
     * @tc.desc Verify Array constructor with elements that are class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class TestClass {
        public value: string;

        constructor(value: string) {
          this.value = value;
        }
      }

      const inst1 = new TestClass('one');
      const inst2 = new TestClass('two');
      const arr = new Array<TestClass>(inst1, inst2);
      const expected = [inst1, inst2];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0038
     * @tc.name testArrayConstructor0038
     * @tc.desc Verify Array constructor with element that is a proxy object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testArrayConstructorJs0038()).assertDeepEquals(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0039
     * @tc.name testArrayConstructor0039
     * @tc.desc Verify Array constructor with generator function elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testArrayConstructorJs0039()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0040
     * @tc.name testArrayConstructor0040
     * @tc.desc Verify Array constructor with promise elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise1 = Promise.resolve('success');
      const promise2 = Promise.reject(new Error('fail'));
      const arr = new Array<Promise<string>>(promise1, promise2);
      const expected = [promise1, promise2];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0041
     * @tc.name testArrayConstructor0041
     * @tc.desc Verify Array constructor with single element that is a function returning array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func = () => [1, 2, 3];
      const arr = new Array<() => number[]>(func);
      const expected = [func];
      expect(arr).assertDeepEquals(expected);
      expect(arr[0]()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0042
     * @tc.name testArrayConstructor0042
     * @tc.desc Verify Array constructor with elements that are error objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const err1 = new Error('Error 1');
      const err2 = new TypeError('Type Error');
      const arr = new Array<Error>(err1, err2);
      const expected = [err1, err2];
      expect(arr).assertDeepEquals(expected);
      expect(arr[0].message).assertEqual('Error 1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0043
     * @tc.name testArrayConstructor0043
     * @tc.desc Verify Array constructor with elements that are JSON objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testArrayConstructorJs0043()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0044
     * @tc.name testArrayConstructor0044
     * @tc.desc Verify Array constructor with Unicode string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>('café', 'naïve', 'cœur');
      const expected = ['café', 'naïve', 'cœur'];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0045
     * @tc.name testArrayConstructor0045
     * @tc.desc Verify Array constructor with emoji elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>('😊', '🌍', '🚀', '🔥');
      const expected = ['😊', '🌍', '🚀', '🔥'];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0046
     * @tc.name testArrayConstructor0046
     * @tc.desc Verify Array constructor with elements added via spread operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const base = [1, 2, 3];
      const arr = new Array<number>(...base, 4, 5);
      const expected = [1, 2, 3, 4, 5];
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0047
     * @tc.name testArrayConstructor0047
     * @tc.desc Verify Array constructor with elements that are the array itself (circular reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testArrayConstructorJs0047()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0048
     * @tc.name testArrayConstructor0048
     * @tc.desc Verify Array constructor with elements that are frozen objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testArrayConstructorJs0048()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0049
     * @tc.name testArrayConstructor0049
     * @tc.desc Verify Array constructor with elements that are sealed objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testArrayConstructorJs0049()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0050
     * @tc.name testArrayConstructor0050
     * @tc.desc Verify Array constructor with elements that are multiple types including special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testArrayConstructorJs0050()).assertDeepEquals(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0063
     * @tc.name testArrayConstructor0063
     * @tc.desc Verify Array constructor with BigInt elements (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const big1 = BigInt(-1000);
      const big2 = BigInt(-2000);
      const arr = new Array<bigint>(big1, big2);
      expect(arr[0]).assertEqual(big1);
      expect(arr[1]).assertEqual(big2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0064
     * @tc.name testArrayConstructor0064
     * @tc.desc Verify Array constructor with Symbol elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testArrayConstructorJs0064()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0065
     * @tc.name testArrayConstructor0065
     * @tc.desc Verify Array constructor with unique Symbol elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testArrayConstructorJs0065()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0066
     * @tc.name testArrayConstructor0066
     * @tc.desc Verify Array constructor with Date objects (past dates)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date('2020-01-01');
      const date2 = new Date('2010-05-15');
      const arr = new Array<Date>(date1, date2);
      expect(arr).assertDeepEquals([date1, date2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0067
     * @tc.name testArrayConstructor0067
     * @tc.desc Verify Array constructor with Date objects (future dates)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date('2030-12-31');
      const date2 = new Date('2040-06-20');
      const arr = new Array<Date>(date1, date2);
      expect(arr).assertDeepEquals([date1, date2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0068
     * @tc.name testArrayConstructor0068
     * @tc.desc Verify Array constructor with RegExp objects (different flags)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1 = /pattern/i;
      const regex2 = /pattern/g;
      const regex3 = /pattern/m;
      const arr = new Array<RegExp>(regex1, regex2, regex3);
      expect(arr).assertDeepEquals([regex1, regex2, regex3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0069
     * @tc.name testArrayConstructor0069
     * @tc.desc Verify Array constructor with RegExp objects (different patterns)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1 = /^start/;
      const regex2 = /end$/;
      const arr = new Array<RegExp>(regex1, regex2);
      expect(arr).assertDeepEquals([regex1, regex2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0070
     * @tc.name testArrayConstructor0070
     * @tc.desc Verify Array constructor with Uint8Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typed1 = new Uint8Array([0, 1, 255]);
      const typed2 = new Uint8Array([10, 20, 30]);
      const arr = new Array<Uint8Array>(typed1, typed2);
      expect(arr).assertDeepEquals([typed1, typed2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0071
     * @tc.name testArrayConstructor0071
     * @tc.desc Verify Array constructor with Float64Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typed1 = new Float64Array([1.1, 2.2, 3.3]);
      const typed2 = new Float64Array([4.4, 5.5]);
      const arr = new Array<Float64Array>(typed1, typed2);
      expect(arr).assertDeepEquals([typed1, typed2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0072
     * @tc.name testArrayConstructor0072
     * @tc.desc Verify Array constructor with Map elements (string keys)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1 = new Map<string, string>([['a', 'apple'], ['b', 'banana']]);
      const map2 = new Map<string, number>([['x', 10], ['y', 20]]);
      const arr = new Array<Map<string, string> | Map<string, number>>(map1, map2);
      expect(arr).assertDeepEquals([map1, map2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0073
     * @tc.name testArrayConstructor0073
     * @tc.desc Verify Array constructor with Map elements (number keys)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1 = new Map<number, string>([[1, 'one'], [2, 'two']]);
      const map2 = new Map<number, boolean>([[10, true], [20, false]]);
      const arr = new Array<Map<number, string> | Map<number, boolean>>(map1, map2);
      expect(arr).assertDeepEquals([map1, map2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0074
     * @tc.name testArrayConstructor0074
     * @tc.desc Verify Array constructor with Set elements (numbers)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set1 = new Set<number>([1, 2, 3]);
      const set2 = new Set<number>([4, 5, 6]);
      const arr = new Array<Set<number>>(set1, set2);
      expect(arr).assertDeepEquals([set1, set2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0075
     * @tc.name testArrayConstructor0075
     * @tc.desc Verify Array constructor with Set elements (strings)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set1 = new Set<string>(['a', 'b']);
      const set2 = new Set<string>(['c', 'd', 'e']);
      const arr = new Array<Set<string>>(set1, set2);
      expect(arr).assertDeepEquals([set1, set2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0076
     * @tc.name testArrayConstructor0076
     * @tc.desc Verify Array constructor with arrays of numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5];
      const arr = new Array<number[]>(arr1, arr2);
      expect(arr).assertDeepEquals([arr1, arr2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0077
     * @tc.name testArrayConstructor0077
     * @tc.desc Verify Array constructor with arrays of strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1 = ['red', 'green'];
      const arr2 = ['blue', 'yellow', 'purple'];
      const arr = new Array<string[]>(arr1, arr2);
      expect(arr).assertDeepEquals([arr1, arr2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0078
     * @tc.name testArrayConstructor0078
     * @tc.desc Verify Array constructor with objects with number properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: GeneratedObjectLiteralInterface_4 = { id: 1, value: 100 };
      const obj2: GeneratedObjectLiteralInterface_4 = { id: 2, value: 200 };
      const arr = new Array<GeneratedObjectLiteralInterface_4>(obj1, obj2);
      expect(arr).assertDeepEquals([obj1, obj2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0079
     * @tc.name testArrayConstructor0079
     * @tc.desc Verify Array constructor with objects with string properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: GeneratedObjectLiteralInterface_5 = { name: 'Alice', role: 'admin' };
      const obj2: GeneratedObjectLiteralInterface_5 = { name: 'Bob', role: 'user' };
      const arr = new Array<GeneratedObjectLiteralInterface_5>(obj1, obj2);
      expect(arr).assertDeepEquals([obj1, obj2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0080
     * @tc.name testArrayConstructor0080
     * @tc.desc Verify Array constructor with objects with boolean properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: GeneratedObjectLiteralInterface_6 = { enabled: true, visible: false };
      const obj2: GeneratedObjectLiteralInterface_6 = { enabled: false, visible: true };
      const arr = new Array<GeneratedObjectLiteralInterface_6>(obj1, obj2);
      expect(arr).assertDeepEquals([obj1, obj2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0081
     * @tc.name testArrayConstructor0081
     * @tc.desc Verify Array constructor with objects with mixed properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: GeneratedObjectLiteralInterface_7 = { id: 1, name: 'Item 1', active: true };
      const obj2: GeneratedObjectLiteralInterface_7 = { id: 2, name: 'Item 2', active: false };
      const arr = new Array<GeneratedObjectLiteralInterface_7>(obj1, obj2);
      expect(arr).assertDeepEquals([obj1, obj2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0082
     * @tc.name testArrayConstructor0082
     * @tc.desc Verify Array constructor with objects containing arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: GeneratedObjectLiteralInterface_8 = { name: 'Group 1', members: [1, 2, 3] };
      const obj2: GeneratedObjectLiteralInterface_8 = { name: 'Group 2', members: [4, 5] };
      const arr = new Array<GeneratedObjectLiteralInterface_8>(obj1, obj2);
      expect(arr).assertDeepEquals([obj1, obj2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0083
     * @tc.name testArrayConstructor0083
     * @tc.desc Verify Array constructor with objects containing objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: GeneratedObjectLiteralInterface_10 =
        { id: 1, details: ({ color: 'red', size: 'large' } as GeneratedObjectLiteralInterface_9) };
      const obj2: GeneratedObjectLiteralInterface_10 =
        { id: 2, details: ({ color: 'blue', size: 'small' } as GeneratedObjectLiteralInterface_9) };
      const arr = new Array<GeneratedObjectLiteralInterface_10>(obj1, obj2);
      expect(arr).assertDeepEquals([obj1, obj2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0084
     * @tc.name testArrayConstructor0084
     * @tc.desc Verify Array constructor with simple function elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1 = (a: number, b: number) => a + b;
      const func2 = (a: number, b: number) => a * b;
      const arr = new Array<(a: number, b: number) => number>(func1, func2);
      expect(arr).assertDeepEquals([func1, func2]);
      expect(arr[0](2, 3)).assertEqual(5);
      expect(arr[1](2, 3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0085
     * @tc.name testArrayConstructor0085
     * @tc.desc Verify Array constructor with string-returning function elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1 = (s: string) => s.toUpperCase();
      const func2 = (s: string) => s.toLowerCase();
      const arr = new Array<(s: string) => string>(func1, func2);
      expect(arr).assertDeepEquals([func1, func2]);
      expect(arr[0]('test')).assertEqual('TEST');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0086
     * @tc.name testArrayConstructor0086
     * @tc.desc Verify Array constructor with boolean-returning function elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1 = (n: number) => n % 2 === 0;
      const func2 = (n: number) => n > 0;
      const arr = new Array<(n: number) => boolean>(func1, func2);
      expect(arr).assertDeepEquals([func1, func2]);
      expect(arr[0](4)).assertTrue();
      expect(arr[1](-2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0087
     * @tc.name testArrayConstructor0087
     * @tc.desc Verify Array constructor with class instances (simple class)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Person {
        public name: string;
        public age: number;

        constructor(name: string, age: number) {
          this.name = name;
          this.age = age;
        }
      }

      const person1 = new Person('Alice', 30);
      const person2 = new Person('Bob', 25);
      const arr = new Array<Person>(person1, person2);
      expect(arr).assertDeepEquals([person1, person2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0088
     * @tc.name testArrayConstructor0088
     * @tc.desc Verify Array constructor with class instances (with methods)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Calculator {
        add(a: number, b: number): number {
          return a + b;
        }
      }

      const calc1 = new Calculator();
      const calc2 = new Calculator();
      const arr = new Array<Calculator>(calc1, calc2);
      expect(arr).assertDeepEquals([calc1, calc2]);
      expect(arr[0].add(2, 3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0089
     * @tc.name testArrayConstructor0089
     * @tc.desc Verify Array constructor with Error objects (different types)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const err1 = new Error('General error');
      const err2 = new TypeError('Type mismatch');
      const err3 = new RangeError('Out of range');
      const arr = new Array<Error>(err1, err2, err3);
      expect(arr).assertDeepEquals([err1, err2, err3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0090
     * @tc.name testArrayConstructor0090
     * @tc.desc Verify Array constructor with Error objects (same type)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const err1 = new SyntaxError('Invalid syntax');
      const err2 = new SyntaxError('Another syntax error');
      const arr = new Array<SyntaxError>(err1, err2);
      expect(arr).assertDeepEquals([err1, err2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0091
     * @tc.name testArrayConstructor0091
     * @tc.desc Verify Array constructor with Promises (resolved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise1 = Promise.resolve(100);
      const promise2 = Promise.resolve('success');
      const arr = new Array<Promise<number> | Promise<string>>(promise1, promise2);
      expect(arr).assertDeepEquals([promise1, promise2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0092
     * @tc.name testArrayConstructor0092
     * @tc.desc Verify Array constructor with Promises (rejected)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise1 = Promise.reject(new Error('Fail 1'));
      const promise2 = Promise.reject(new Error('Fail 2'));
      const arr = new Array<Promise<never>>(promise1, promise2);
      expect(arr).assertDeepEquals([promise1, promise2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0093
     * @tc.name testArrayConstructor0093
     * @tc.desc Verify Array constructor with mixed number and string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number | string>(1, 'two', 3, 'four');
      expect(arr).assertDeepEquals([1, 'two', 3, 'four']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0094
     * @tc.name testArrayConstructor0094
     * @tc.desc Verify Array constructor with mixed number and boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number | boolean>(10, true, 20, false);
      expect(arr).assertDeepEquals([10, true, 20, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0095
     * @tc.name testArrayConstructor0095
     * @tc.desc Verify Array constructor with mixed string and boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string | boolean>('yes', true, 'no', false);
      expect(arr).assertDeepEquals(['yes', true, 'no', false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0096
     * @tc.name testArrayConstructor0096
     * @tc.desc Verify Array constructor with mixed primitive and object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: GeneratedObjectLiteralInterface_3 = { value: 10 };
      const arr = new Array<number | string | GeneratedObjectLiteralInterface_3>(5, 'text', obj);
      expect(arr).assertDeepEquals([5, 'text', obj]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0097
     * @tc.name testArrayConstructor0097
     * @tc.desc Verify Array constructor with mixed Date and string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date('2024-01-01');
      const arr = new Array<Date | string>(date, 'today', new Date('2024-01-02'));
      expect(arr).assertDeepEquals([date, 'today', new Date('2024-01-02')]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0098
     * @tc.name testArrayConstructor0098
     * @tc.desc Verify Array constructor with mixed Map and Set elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>([[1, 'one']]);
      const set = new Set<number>([2, 3]);
      const arr = new Array<Map<number, string> | Set<number>>(map, set);
      expect(arr).assertDeepEquals([map, set]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0099
     * @tc.name testArrayConstructor0099
     * @tc.desc Verify Array constructor with elements created via spread from another array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const base = [1, 2, 3];
      const arr = new Array<number>(...base, 4, 5);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0100
     * @tc.name testArrayConstructor0100
     * @tc.desc Verify Array constructor with elements created via spread from a Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<number>([10, 20, 30]);
      const arr = new Array<number>(...Array.from(set));
      expect(arr).assertDeepEquals([10, 20, 30]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0101
     * @tc.name testArrayConstructor0101
     * @tc.desc Verify Array constructor with positive integers and map method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const mapped = arr.map(x => x * 2);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(mapped).assertDeepEquals([2, 4, 6, 8, 10]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0102
     * @tc.name testArrayConstructor0102
     * @tc.desc Verify Array constructor with negative integers and filter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-1, -2, -3, -4, -5);
      const filtered = arr.filter(x => x > -4);
      expect(arr).assertDeepEquals([-1, -2, -3, -4, -5]);
      expect(filtered).assertDeepEquals([-1, -2, -3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0103
     * @tc.name testArrayConstructor0103
     * @tc.desc Verify Array constructor with floating-point numbers and reduce method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1.1, 2.2, 3.3, 4.4);
      const sum = arr.reduce((acc, val) => acc + val, 0);
      expect(arr).assertDeepEquals([1.1, 2.2, 3.3, 4.4]);
      expect(sum).assertEqual(11.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0104
     * @tc.name testArrayConstructor0104
     * @tc.desc Verify Array constructor with boolean values and every method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, true, true);
      const allTrue = arr.every(x => x === true);
      expect(arr).assertDeepEquals([true, true, true]);
      expect(allTrue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0105
     * @tc.name testArrayConstructor0105
     * @tc.desc Verify Array constructor with mixed booleans and some method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const hasFalse = arr.some(x => x === false);
      expect(arr).assertDeepEquals([true, false, true]);
      expect(hasFalse).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0106
     * @tc.name testArrayConstructor0106
     * @tc.desc Verify Array constructor with string elements and includes method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('red', 'green', 'blue');
      expect(arr).assertDeepEquals(['red', 'green', 'blue']);
      expect(arr.includes('green')).assertTrue();
      expect(arr.includes('yellow')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0107
     * @tc.name testArrayConstructor0107
     * @tc.desc Verify Array constructor with empty strings and join method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', 'hello', '');
      const joined = arr.join('-');
      expect(arr).assertDeepEquals(['', 'hello', '']);
      expect(joined).assertEqual('-hello-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0108
     * @tc.name testArrayConstructor0108
     * @tc.desc Verify Array constructor with null values and fill method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<null>(null, null, null);
      const filled = [...arr].fill(null, 0, 2);
      expect(arr).assertDeepEquals([null, null, null]);
      expect(filled).assertDeepEquals([null, null, null]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0109
     * @tc.name testArrayConstructor0109
     * @tc.desc Verify Array constructor with undefined values and findIndex method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<undefined>(undefined, undefined, undefined);
      const index = arr.findIndex(x => x === undefined);
      expect(arr).assertDeepEquals([undefined, undefined, undefined]);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0110
     * @tc.name testArrayConstructor0110
     * @tc.desc Verify Array constructor with mixed primitives and forEach method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string | boolean>(10, 'test', false);
      const types: string[] = [];
      arr.forEach(item => types.push(typeof item));
      expect(arr).assertDeepEquals([10, 'test', false]);
      expect(types).assertDeepEquals(['number', 'string', 'boolean']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0111
     * @tc.name testArrayConstructor0111
     * @tc.desc Verify Array constructor with nested arrays and flat method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array([1, 2], [3, [4, 5]]);
      const flatOnce = arr.flat();
      const flatDeep = arr.flat(2);
      expect(arr).assertDeepEquals([[1, 2], [3, [4, 5]]]);
      expect(flatOnce).assertDeepEquals([1, 2, 3, [4, 5]]);
      expect(flatDeep).assertDeepEquals([1, 2, 3, 4, 5]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0112
     * @tc.name testArrayConstructor0112
     * @tc.desc Verify Array constructor with spread operator and concat method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const part1 = [1, 2, 3];
      const part2 = [4, 5];
      const arr = new Array<number>(...part1, ...part2);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0113
     * @tc.name testArrayConstructor0113
     * @tc.desc Verify Array constructor with empty array and push method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.push(1);
      arr.push(2);
      arr.push(3);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0114
     * @tc.name testArrayConstructor0114
     * @tc.desc Verify Array constructor with array and pop method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const last = arr.pop();
      expect(arr).assertDeepEquals([1, 2]);
      expect(last).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0115
     * @tc.name testArrayConstructor0115
     * @tc.desc Verify Array constructor with array and shift method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const first = arr.shift();
      expect(arr).assertDeepEquals([2, 3]);
      expect(first).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0116
     * @tc.name testArrayConstructor0116
     * @tc.desc Verify Array constructor with array and unshift method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4, 5);
      arr.unshift(1, 2);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0117
     * @tc.name testArrayConstructor0117
     * @tc.desc Verify Array constructor with large array and slice method
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0117', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const elements: number[] = [];
      for (let i = 0; i < 1000; i++) {
        elements.push(i);
      }
      const arr = new Array<number>(...elements);
      const sliced = arr.slice(500, 505);
      expect(arr.length).assertEqual(1000);
      expect(sliced).assertDeepEquals([500, 501, 502, 503, 504]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0118
     * @tc.name testArrayConstructor0118
     * @tc.desc Verify Array constructor with array and splice method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const removed = arr.splice(2, 2, 6, 7);
      expect(arr).assertDeepEquals([1, 2, 6, 7, 5]);
      expect(removed).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0119
     * @tc.name testArrayConstructor0119
     * @tc.desc Verify Array constructor with numbers and reverse method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const reversed = [...arr].reverse();
      expect(arr).assertDeepEquals([1, 2, 3, 4]);
      expect(reversed).assertDeepEquals([4, 3, 2, 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0120
     * @tc.name testArrayConstructor0120
     * @tc.desc Verify Array constructor with strings and reverse method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      const reversed = [...arr].reverse();
      expect(arr).assertDeepEquals(['a', 'b', 'c', 'd']);
      expect(reversed).assertDeepEquals(['d', 'c', 'b', 'a']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0121
     * @tc.name testArrayConstructor0121
     * @tc.desc Verify Array constructor with numbers and sort method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 4, 2);
      const sorted = [...arr].sort((a, b) => a - b);
      expect(arr).assertDeepEquals([3, 1, 4, 2]);
      expect(sorted).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0122
     * @tc.name testArrayConstructor0122
     * @tc.desc Verify Array constructor with strings and sort method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('dog', 'cat', 'elephant', 'bird');
      const sorted = [...arr].sort();
      expect(arr).assertDeepEquals(['dog', 'cat', 'elephant', 'bird']);
      expect(sorted).assertDeepEquals(['bird', 'cat', 'dog', 'elephant']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0123
     * @tc.name testArrayConstructor0123
     * @tc.desc Verify Array constructor with dates and sort method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date('2023-03-01');
      const date2 = new Date('2023-01-15');
      const date3 = new Date('2023-02-10');
      const arr = new Array<Date>(date1, date2, date3);
      const sorted = [...arr].sort((a, b) => a.getTime() - b.getTime());
      expect(arr).assertDeepEquals([date1, date2, date3]);
      expect(sorted).assertDeepEquals([date2, date3, date1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0124
     * @tc.name testArrayConstructor0124
     * @tc.desc Verify Array constructor with typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const uintArr = new Uint8Array([0, 1, 255]);
      const floatArr = new Float32Array([1.5, 2.5, 3.5]);
      const arr = new Array<Uint8Array | Float32Array>(uintArr, floatArr);

      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertDeepEquals(uintArr);
      expect(arr[1]).assertDeepEquals(floatArr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0125
     * @tc.name testArrayConstructor0125
     * @tc.desc Verify Array constructor with Maps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map<number, string>();
      map1.set(1, 'one');
      map1.set(2, 'two');

      const map2 = new Map<string, boolean>();
      map2.set('active', true);
      map2.set('visible', false);

      const arr = new Array<Map<number, string> | Map<string, boolean>>(map1, map2);

      expect(arr.length).assertEqual(2);
      expect((arr[0] as Map<number, string>).get(1)).assertEqual('one');
      expect((arr[1] as Map<string, boolean>).get('active')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0126
     * @tc.name testArrayConstructor0126
     * @tc.desc Verify Array constructor with Sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set1 = new Set<number>([1, 2, 3]);
      const set2 = new Set<string>(['a', 'b', 'c']);
      const arr = new Array<Set<number> | Set<string>>(set1, set2);

      expect(arr.length).assertEqual(2);
      expect(set1.has(2)).assertTrue();
      expect(set2.has('d')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0127
     * @tc.name testArrayConstructor0127
     * @tc.desc Verify Array constructor with Error objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err1 = new Error('Error message 1');
      const err2 = new TypeError('Type error message');
      const arr = new Array<Error>(err1, err2);

      expect(arr).assertDeepEquals([err1, err2]);
      expect(arr[0].message).assertEqual('Error message 1');
      expect(arr[1] instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0128
     * @tc.name testArrayConstructor0128
     * @tc.desc Verify Array constructor with Date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date('2023-01-01');
      const date2 = new Date('2023-12-31');
      const arr = new Array<Date>(date1, date2);

      expect(arr).assertDeepEquals([date1, date2]);
      expect(date1.getFullYear()).assertEqual(2023);
      expect(date2.getMonth()).assertEqual(11); // Months are 0-based
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0129
     * @tc.name testArrayConstructor0129
     * @tc.desc Verify Array constructor with RegExp objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regex1 = /test/;
      const regex2 = /pattern/i;
      const arr = new Array<RegExp>(regex1, regex2);

      expect(arr).assertDeepEquals([regex1, regex2]);
      expect(regex1.test('test')).assertTrue();
      expect(regex2.test('Pattern')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0130
     * @tc.name testArrayConstructor0130
     * @tc.desc Verify Array constructor with functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const func1 = (a: number, b: number): number => a + b;
      const func2 = (s: string): string => s.toUpperCase();
      const arr = new Array<((a: number, b: number) => number) | ((s: string) => string)>(func1, func2);

      expect(arr.length).assertEqual(2);
      expect((arr[0] as Function)(2, 3)).assertEqual(5);
      expect((arr[1] as Function)('hello')).assertEqual('HELLO');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0131
     * @tc.name testArrayConstructor0131
     * @tc.desc Verify Array constructor with class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class Person {
        public name: string;
        public age: number;

        constructor(name: string, age: number) {
          this.name = name;
          this.age = age;
        }

        greet(): string {
          return `Hello, my name is ${this.name}`;
        }
      }

      const person1 = new Person('Alice', 30);
      const person2 = new Person('Bob', 25);
      const arr = new Array<Person>(person1, person2);

      expect(arr).assertDeepEquals([person1, person2]);
      expect(arr[0].greet()).assertEqual('Hello, my name is Alice');
      expect(arr[1].age).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0132
     * @tc.name testArrayConstructor0132
     * @tc.desc Verify Array constructor with Promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const promise1 = Promise.resolve(100);
      const promise2 = Promise.resolve('success');
      const arr = new Array<Promise<number> | Promise<string>>(promise1, promise2);

      expect(arr.length).assertEqual(2);
      expect(await arr[0]).assertEqual(100);
      expect(await arr[1]).assertEqual('success');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0133
     * @tc.name testArrayConstructor0133
     * @tc.desc Verify Array constructor with single numeric argument (length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<undefined>(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[4]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0134
     * @tc.name testArrayConstructor0134
     * @tc.desc Verify Array constructor with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<never>();
      expect(arr).assertDeepEquals([]);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0135
     * @tc.name testArrayConstructor0135
     * @tc.desc Verify Array works without 'new' keyword
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Using Array as function due to ArkTS constraints
      const arr = Array(1, 2, 3) as number[];
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0136
     * @tc.name testArrayConstructor0136
     * @tc.desc Verify Array constructor with sparse array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Creating sparse array using Array constructor with length
      const arr = new Array<number>(5);
      arr[0] = 1;
      arr[4] = 5;

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(undefined);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0137
     * @tc.name testArrayConstructor0137
     * @tc.desc Verify Array constructor with array-like object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayConstructorJs0137()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0138
     * @tc.name testArrayConstructor0138
     * @tc.desc Verify Array constructor with Unicode strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('café', 'naïve', 'cœur', 'piñata');
      expect(arr).assertDeepEquals(['café', 'naïve', 'cœur', 'piñata']);
      expect(arr.includes('café')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0139
     * @tc.name testArrayConstructor0139
     * @tc.desc Verify Array constructor with emoji strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('😊', '👍', '🎉', '❤️');
      expect(arr).assertDeepEquals(['😊', '👍', '🎉', '❤️']);
      expect(arr.indexOf('🎉')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0140
     * @tc.name testArrayConstructor0140
     * @tc.desc Verify Array constructor with special numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Infinity, -Infinity, NaN, 0, -0);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(Infinity);
      expect(arr[1]).assertEqual(-Infinity);
      expect(isNaN(arr[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0141
     * @tc.name testArrayConstructor0141
     * @tc.desc Verify Array constructor with mixed types and flatMap method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayConstructorJs0141()).assertDeepEquals([1, 2, 'two', 'TWO', 3, 6, 'four', 'FOUR']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0142
     * @tc.name testArrayConstructor0142
     * @tc.desc Verify Array constructor with array and copyWithin method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const copied = [...arr].copyWithin(0, 3, 5);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(copied).assertDeepEquals([4, 5, 3, 4, 5]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0143
     * @tc.name testArrayConstructor0143
     * @tc.desc Verify Array constructor with array and entries method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const entries = Array.from(arr.entries());
      expect(arr).assertDeepEquals(['a', 'b', 'c']);
      expect(entries).assertDeepEquals([[0, 'a'], [1, 'b'], [2, 'c']]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0144
     * @tc.name testArrayConstructor0144
     * @tc.desc Verify Array constructor with array and keys method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const keys = Array.from(arr.keys());
      expect(arr).assertDeepEquals([10, 20, 30]);
      expect(keys).assertDeepEquals([0, 1, 2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0145
     * @tc.name testArrayConstructor0145
     * @tc.desc Verify Array constructor with array and values method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const values = Array.from(arr.values());
      expect(arr).assertDeepEquals([true, false, true]);
      expect(values).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0146
     * @tc.name testArrayConstructor0146
     * @tc.desc Verify Array constructor with array and toString method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const str = arr.toString();
      expect(arr).assertDeepEquals([1, 2, 3, 4]);
      expect(str).assertEqual('1,2,3,4');
    });

  });
}