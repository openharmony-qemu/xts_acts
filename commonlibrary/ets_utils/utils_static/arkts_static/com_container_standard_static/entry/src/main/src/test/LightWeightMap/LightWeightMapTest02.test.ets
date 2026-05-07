'use static'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../../../hypium';
import { LightWeightMap } from '@kit.ArkTS';

interface GeneratedObjectLiteralInterface_1 {}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function testLightWeightMapTest02(): void {
  describe('testLightWeightMapTest02', () => {
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
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_0100
    * @tc.name      testLightWeightMapTest02Chapter0100
    * @tc.desc      Verify hasKey with boolean type keys (true/false)
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter0100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<boolean, number>();
      lightWeightMap.set(true, 1);
      lightWeightMap.set(false, 0);

      expect(lightWeightMap.hasKey(true)).assertEqual(true);
      expect(lightWeightMap.hasKey(false)).assertEqual(true);
      expect(lightWeightMap.get(true)).assertEqual(1);
      expect(lightWeightMap.get(false)).assertEqual(0);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_0200
    * @tc.name      testLightWeightMapTest02Chapter0200
    * @tc.desc      Verify hasKey distinguishes falsy values: 0, NaN, "", null, undefined
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter0200';
      console.log(TAG + 'start');

      // Test 0 as key
      const map1 = new LightWeightMap<number, string>();
      map1.set(0, 'zero');
      expect(map1.hasKey(0)).assertEqual(true);
      expect(map1.hasKey(1)).assertEqual(false);

      // Test empty string as key
      const map2 = new LightWeightMap<string, string>();
      map2.set('', 'empty');
      expect(map2.hasKey('')).assertEqual(true);
      expect(map2.hasKey('non-empty')).assertEqual(false);

      // Test null as key
      const map3 = new LightWeightMap<null, string>();
      map3.set(null, 'null-value');
      expect(map3.hasKey(null)).assertEqual(true);

      // Test undefined as key
      const map4 = new LightWeightMap<undefined, string>();
      map4.set(undefined, 'undefined-value');
      expect(map4.hasKey(undefined)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_0300
    * @tc.name      testLightWeightMapTest02Chapter0300
    * @tc.desc      Verify hasKey with NaN as key (NaN !== NaN)
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter0300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number, string>();
      lightWeightMap.set(NaN, 'nan-value');

      // NaN as key is stored and can be found
      expect(lightWeightMap.hasKey(NaN)).assertEqual(true);
      expect(lightWeightMap.get(NaN)).assertEqual('nan-value');

      // Different NaN reference still works
      const anotherNaN = Number('not-a-number');
      expect(lightWeightMap.hasKey(anotherNaN)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_0400
    * @tc.name      testLightWeightMapTest02Chapter0400
    * @tc.desc      Verify hasKey with boolean negation expressions: !'s', !0
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter0400';
      console.log(TAG + 'start');

      // !'s' evaluates to false
      const map1 = new LightWeightMap<boolean, string>();
      map1.set(!'s', 'false-value');
      expect(map1.hasKey(false)).assertEqual(true);
      expect(map1.hasKey(!'s')).assertEqual(true);

      // !0 evaluates to true
      const map2 = new LightWeightMap<boolean, string>();
      map2.set(!0, 'true-value');
      expect(map2.hasKey(true)).assertEqual(true);
      expect(map2.hasKey(!0)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_0500
    * @tc.name      testLightWeightMapTest02Chapter0500
    * @tc.desc      Verify hasKey with double negation: !!0, !!1
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter0500';
      console.log(TAG + 'start');

      // !!0 evaluates to false
      const map1 = new LightWeightMap<boolean, string>();
      map1.set(!!0, 'double-neg-zero');
      expect(map1.hasKey(false)).assertEqual(true);
      expect(map1.hasKey(!!0)).assertEqual(true);

      // !!1 evaluates to true
      const map2 = new LightWeightMap<boolean, string>();
      map2.set(!!1, 'double-neg-one');
      expect(map2.hasKey(true)).assertEqual(true);
      expect(map2.hasKey(!!1)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_0600
    * @tc.name      testLightWeightMapTest02Chapter0600
    * @tc.desc      Verify hasKey distinguishes different falsy primitive types
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter0600';
      console.log(TAG + 'start');

      // Map that can hold multiple falsy types
      const lightWeightMap = new LightWeightMap<number | boolean | string | null | undefined, string>();

      lightWeightMap.set(0, 'number-zero');
      lightWeightMap.set(false, 'boolean-false');
      lightWeightMap.set('', 'empty-string');
      lightWeightMap.set(null, 'null-value');
      lightWeightMap.set(undefined, 'undefined-value');

      // Verify each falsy value is distinct
      expect(lightWeightMap.hasKey(0)).assertEqual(true);
      expect(lightWeightMap.hasKey(false)).assertEqual(true);
      expect(lightWeightMap.hasKey('')).assertEqual(true);
      expect(lightWeightMap.hasKey(null)).assertEqual(true);
      expect(lightWeightMap.hasKey(undefined)).assertEqual(true);

      // Verify they map to different values
      expect(lightWeightMap.get(0)).assertEqual('number-zero');
      expect(lightWeightMap.get(false)).assertEqual('boolean-false');
      expect(lightWeightMap.get('')).assertEqual('empty-string');
      expect(lightWeightMap.get(null)).assertEqual('null-value');
      expect(lightWeightMap.get(undefined)).assertEqual('undefined-value');

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_0700
    * @tc.name      testLightWeightMapTest02Chapter0700
    * @tc.desc      Verify hasKey does not perform type coercion (0 vs "0", false vs "false")
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter0700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number | boolean | string, string>();

      lightWeightMap.set(0, 'number-zero');
      lightWeightMap.set('0', 'string-zero');
      lightWeightMap.set(false, 'boolean-false');
      lightWeightMap.set('false', 'string-false');

      // Verify no type coercion occurs
      expect(lightWeightMap.hasKey(0)).assertEqual(true);
      expect(lightWeightMap.hasKey('0')).assertEqual(true);
      expect(lightWeightMap.hasKey(false)).assertEqual(true);
      expect(lightWeightMap.hasKey('false')).assertEqual(true);

      // Verify they are distinct entries
      expect(lightWeightMap.length).assertEqual(4);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_0800
    * @tc.name      testLightWeightMapTest02Chapter0800
    * @tc.desc      Verify hasKey with complex boolean expressions: !(1+2), !!"hello"
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter0800';
      console.log(TAG + 'start');

      // !(1+2) evaluates to false (truthy expression negated)
      const map1 = new LightWeightMap<boolean, string>();
      map1.set(!(1+2), 'complex-false');
      expect(map1.hasKey(false)).assertEqual(true);

      // !!"hello" evaluates to true (non-empty string is truthy)
      const map2 = new LightWeightMap<boolean, string>();
      map2.set(!!'hello', 'complex-true');
      expect(map2.hasKey(true)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_0900
    * @tc.name      testLightWeightMapTest02Chapter0900
    * @tc.desc      Verify hasKey with truthy values: 1, "string", {}, []
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter0900';
      console.log(TAG + 'start');

      // Number 1 (truthy)
      const map1 = new LightWeightMap<number, string>();
      map1.set(1, 'one');
      expect(map1.hasKey(1)).assertEqual(true);

      // Non-empty string (truthy)
      const map2 = new LightWeightMap<string, string>();
      map2.set('non-empty', 'value');
      expect(map2.hasKey('non-empty')).assertEqual(true);

      // Empty object (truthy)
      const map3 = new LightWeightMap<object, string>();
      const obj: GeneratedObjectLiteralInterface_1 = {};
      map3.set(obj, 'empty-object');
      expect(map3.hasKey(obj)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_1000
    * @tc.name      testLightWeightMapTest02Chapter1000
    * @tc.desc      Verify hasKey with union type keys containing multiple falsy types
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter1000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<number | boolean | string | null | undefined, string>();

      lightWeightMap.set(false, 'false');
      lightWeightMap.set(0, 'zero');
      lightWeightMap.set('', 'empty');
      lightWeightMap.set(null, 'null');
      lightWeightMap.set(undefined, 'undefined');

      // Test each type can be found
      expect(lightWeightMap.hasKey(false)).assertEqual(true);
      expect(lightWeightMap.hasKey(0)).assertEqual(true);
      expect(lightWeightMap.hasKey('')).assertEqual(true);
      expect(lightWeightMap.hasKey(null)).assertEqual(true);
      expect(lightWeightMap.hasKey(undefined)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_1100
    * @tc.name      testLightWeightMapTest02Chapter1100
    * @tc.desc      Verify hasValue with basic string key and number value
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter1100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set("squirrel", 123);
      expect(lightWeightMap.hasValue(123)).assertEqual(true);
      expect(lightWeightMap.hasValue(456)).assertEqual(false);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_1200
    * @tc.name      testLightWeightMapTest02Chapter1200
    * @tc.desc      Verify hasValue with boolean values (true/false)
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter1200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, boolean>();
      lightWeightMap.set("yes", true);
      lightWeightMap.set("no", false);
      lightWeightMap.set("zero", false);

      expect(lightWeightMap.hasValue(true)).assertEqual(true);
      expect(lightWeightMap.hasValue(false)).assertEqual(true);
      expect(lightWeightMap.hasValue(true)).assertEqual(true); // true exists
      expect(lightWeightMap.hasValue(false)).assertEqual(true); // false exists from "no" and "zero"

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_1300
    * @tc.name      testLightWeightMapTest02Chapter1300
    * @tc.desc      Verify hasValue with falsy values: 0, NaN, "", null, undefined
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter1300';
      console.log(TAG + 'start');

      // Test 0 as value
      const map1 = new LightWeightMap<string, number>();
      map1.set('zero', 0);
      expect(map1.hasValue(0)).assertEqual(true);

      // Test empty string as value
      const map2 = new LightWeightMap<string, string>();
      map2.set('empty', '');
      expect(map2.hasValue('')).assertEqual(true);

      // Test null as value
      const map3 = new LightWeightMap<string, null>();
      map3.set('null', null);
      expect(map3.hasValue(null)).assertEqual(true);

      // Test undefined as value
      const map4 = new LightWeightMap<string, undefined>();
      map4.set('undefined', undefined);
      expect(map4.hasValue(undefined)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_1400
    * @tc.name      testLightWeightMapTest02Chapter1400
    * @tc.desc      Verify hasValue with NaN as value (NaN !== NaN)
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter1400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('nan', NaN);
      lightWeightMap.set('number', 123);

      // NaN as value can be found (implementation-dependent)
      expect(lightWeightMap.hasValue(NaN)).assertEqual(true);
      expect(lightWeightMap.hasValue(123)).assertEqual(true);
      expect(lightWeightMap.hasValue(456)).assertEqual(false);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_1500
    * @tc.name      testLightWeightMapTest02Chapter1500
    * @tc.desc      Verify hasValue with boolean negation expressions: !'s', !0
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter1500';
      console.log(TAG + 'start');

      // !'s' evaluates to false
      const map1 = new LightWeightMap<string, boolean>();
      map1.set('test1', !'s');
      expect(map1.hasValue(false)).assertEqual(true);

      // !0 evaluates to true
      const map2 = new LightWeightMap<string, boolean>();
      map2.set('test2', !0);
      expect(map2.hasValue(true)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_1600
    * @tc.name      testLightWeightMapTest02Chapter1600
    * @tc.desc      Verify hasValue with double negation: !!0, !!1
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter1600';
      console.log(TAG + 'start');

      // !!0 evaluates to false
      const map1 = new LightWeightMap<string, boolean>();
      map1.set('test1', !!0);
      expect(map1.hasValue(false)).assertEqual(true);

      // !!1 evaluates to true
      const map2 = new LightWeightMap<string, boolean>();
      map2.set('test2', !!1);
      expect(map2.hasValue(true)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_1700
    * @tc.name      testLightWeightMapTest02Chapter1700
    * @tc.desc      Verify hasValue with complex boolean expressions: !(1+2), !!"hello"
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter1700';
      console.log(TAG + 'start');

      // !(1+2) evaluates to false
      const map1 = new LightWeightMap<string, boolean>();
      map1.set('test1', !(1+2));
      expect(map1.hasValue(false)).assertEqual(true);

      // !!"hello" evaluates to true
      const map2 = new LightWeightMap<string, boolean>();
      map2.set('test2', !!"hello");
      expect(map2.hasValue(true)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_1800
    * @tc.name      testLightWeightMapTest02Chapter1800
    * @tc.desc      Verify hasValue does not perform type coercion (0 vs "0", false vs "false")
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter1800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number | string | boolean>();

      lightWeightMap.set('numZero', 0);
      lightWeightMap.set('strZero', '0');
      lightWeightMap.set('boolFalse', false);
      lightWeightMap.set('strFalse', 'false');

      // Verify no type coercion
      expect(lightWeightMap.hasValue(0)).assertEqual(true);
      expect(lightWeightMap.hasValue('0')).assertEqual(true);
      expect(lightWeightMap.hasValue(false)).assertEqual(true);
      expect(lightWeightMap.hasValue('false')).assertEqual(true);

      // Verify they are distinct
      expect(lightWeightMap.length).assertEqual(4);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_1900
    * @tc.name      testLightWeightMapTest02Chapter1900
    * @tc.desc      Verify hasValue with truthy values: 1, "string", {}
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter1900';
      console.log(TAG + 'start');

      // Number 1 (truthy)
      const map1 = new LightWeightMap<string, number>();
      map1.set('one', 1);
      expect(map1.hasValue(1)).assertEqual(true);

      // Non-empty string (truthy)
      const map2 = new LightWeightMap<string, string>();
      map2.set('str', 'non-empty');
      expect(map2.hasValue('non-empty')).assertEqual(true);

      // Empty object (truthy)
      const map3 = new LightWeightMap<string, object>();
      const obj: GeneratedObjectLiteralInterface_1 = {};
      map3.set('obj', obj);
      expect(map3.hasValue(obj)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_2000
    * @tc.name      testLightWeightMapTest02Chapter2000
    * @tc.desc      Verify hasValue distinguishes different falsy primitive types
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter2000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number | boolean | string | null | undefined>();

      lightWeightMap.set('numZero', 0);
      lightWeightMap.set('boolFalse', false);
      lightWeightMap.set('emptyStr', '');
      lightWeightMap.set('nullVal', null);
      lightWeightMap.set('undefinedVal', undefined);

      // Verify each falsy value is distinct
      expect(lightWeightMap.hasValue(0)).assertEqual(true);
      expect(lightWeightMap.hasValue(false)).assertEqual(true);
      expect(lightWeightMap.hasValue('')).assertEqual(true);
      expect(lightWeightMap.hasValue(null)).assertEqual(true);
      expect(lightWeightMap.hasValue(undefined)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_2100
    * @tc.name      testLightWeightMapTest02Chapter2100
    * @tc.desc      Verify hasValue after setting and removing values
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter2100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 100);
      lightWeightMap.set('key2', 200);

      expect(lightWeightMap.hasValue(100)).assertEqual(true);

      lightWeightMap.remove('key1');
      expect(lightWeightMap.hasValue(100)).assertEqual(false);
      expect(lightWeightMap.hasValue(200)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_2200
    * @tc.name      testLightWeightMapTest02Chapter2200
    * @tc.desc      Verify hasValue method binding error handling
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter2200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key', 100);

      // ArkTS does not support .call(), directly test unbound call
      const method = lightWeightMap.hasValue;
      try {
        method(100); // Not bound to instance, should throw 10200011
        expect(false).assertTrue(); // Expect exception to be thrown
      } catch (e) {
        expect(e.code).assertEqual(10200011);
        expect(e.message).assertContain('cannot be bound');
      }

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_2300
    * @tc.name      testLightWeightMapTest02Chapter2300
    * @tc.desc      Verify hasValue with duplicate values
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter2300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 100);
      lightWeightMap.set('key2', 100); // Same value
      lightWeightMap.set('key3', 100); // Same value

      expect(lightWeightMap.hasValue(100)).assertEqual(true);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_2400
    * @tc.name      testLightWeightMapTest02Chapter2400
    * @tc.desc      Verify hasValue after clearing the map
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter2400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 100);
      lightWeightMap.set('key2', 200);

      expect(lightWeightMap.hasValue(100)).assertEqual(true);

      lightWeightMap.clear();
      expect(lightWeightMap.hasValue(100)).assertEqual(false);
      expect(lightWeightMap.hasValue(200)).assertEqual(false);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_2500
    * @tc.name      testLightWeightMapTest02Chapter2500
    * @tc.desc      Verify hasValue on empty map
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter2500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      expect(lightWeightMap.hasValue(100)).assertEqual(false);
      expect(lightWeightMap.hasValue(null as number)).assertEqual(false);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_2600
    * @tc.name      testLightWeightMapTest02Chapter2600
    * @tc.desc      Verify empty LightWeightMap capacity expansion to specified capacity
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter2600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.increaseCapacityTo(10);

      // Verify map functions correctly after expansion
      lightWeightMap.set('key1', 1);
      expect(lightWeightMap.get('key1')).assertEqual(1);
      expect(lightWeightMap.length).assertEqual(1);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_2700
    * @tc.name      testLightWeightMapTest02Chapter2700
    * @tc.desc      Verify non-empty LightWeightMap capacity expansion to capacity larger than current element count
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter2700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 100);
      lightWeightMap.set('key2', 200);

      // Current length is 2, expand to 5
      lightWeightMap.increaseCapacityTo(5);

      // Verify data integrity
      expect(lightWeightMap.get('key1')).assertEqual(100);
      expect(lightWeightMap.get('key2')).assertEqual(200);
      expect(lightWeightMap.length).assertEqual(2);

      // Verify new elements can be added
      lightWeightMap.set('key3', 300);
      expect(lightWeightMap.length).assertEqual(3);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_2800
    * @tc.name      testLightWeightMapTest02Chapter2800
    * @tc.desc      Verify LightWeightMap capacity expansion to capacity equal to current element count
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter2800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, string>();
      lightWeightMap.set('a', 'value1');
      lightWeightMap.set('b', 'value2');

      // Current length is 2, expand to 2 (capacity should change)
      lightWeightMap.increaseCapacityTo(2);

      // Verify data integrity
      expect(lightWeightMap.get('a')).assertEqual('value1');
      expect(lightWeightMap.get('b')).assertEqual('value2');
      expect(lightWeightMap.length).assertEqual(2);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_2900
    * @tc.name      testLightWeightMapTest02Chapter2900
    * @tc.desc      Verify LightWeightMap capacity expansion to capacity smaller than current element count (should not take effect)
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter2900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 1);
      lightWeightMap.set('key2', 2);
      lightWeightMap.set('key3', 3);

      // Current length is 3, expand to 1 (should not take effect)
      lightWeightMap.increaseCapacityTo(1);

      // Verify data is unaffected
      expect(lightWeightMap.get('key1')).assertEqual(1);
      expect(lightWeightMap.get('key2')).assertEqual(2);
      expect(lightWeightMap.get('key3')).assertEqual(3);
      expect(lightWeightMap.length).assertEqual(3);

      // Verify new elements can still be added
      lightWeightMap.set('key4', 4);
      expect(lightWeightMap.length).assertEqual(4);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_3000
    * @tc.name      testLightWeightMapTest02Chapter3000
    * @tc.desc      Verify consecutive multiple capacity expansion operations
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter3000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.increaseCapacityTo(5);
      lightWeightMap.increaseCapacityTo(10);
      lightWeightMap.increaseCapacityTo(15);

      // Verify functionality is normal
      lightWeightMap.set('key1', 100);
      expect(lightWeightMap.get('key1')).assertEqual(100);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_3100
    * @tc.name      testLightWeightMapTest02Chapter3100
    * @tc.desc      Verify capacity expansion boundary value 0
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter3100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.increaseCapacityTo(0);

      // Verify map works correctly
      lightWeightMap.set('key1', 1);
      expect(lightWeightMap.get('key1')).assertEqual(1);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_3200
    * @tc.name      testLightWeightMapTest02Chapter3200
    * @tc.desc      Verify capacity expansion boundary value negative number
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter3200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 1);

      // Pass negative number, should not take effect
      lightWeightMap.increaseCapacityTo(-100);

      // Verify data is unaffected
      expect(lightWeightMap.get('key1')).assertEqual(1);
      expect(lightWeightMap.length).assertEqual(1);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_3300
    * @tc.name      testLightWeightMapTest02Chapter3300
    * @tc.desc      Verify behavior when passing NaN
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter3300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      try {
        // Try calling with NaN, expect exception to be thrown
        console.log(TAG + ': Try calling increaseCapacityTo(NaN)');
        lightWeightMap.increaseCapacityTo(NaN.toInt());

        // If execution reaches here, no exception was thrown, this is wrong
        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue(); // Force test failure

      } catch (e) {
        // Expect to catch type error exception
        console.log(TAG + ': Caught expected exception');

        // FIX: Use explicit Error type
        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        // Verify error message contains key content
        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain('NaN');

        console.log(TAG + ': Test passed - Type error caught correctly');
      }

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_3400
    * @tc.name      testLightWeightMapTest02Chapter3400
    * @tc.desc      Verify boundary value Infinity
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter3400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      try {
        // Try calling with Infinity, expect exception to be thrown
        console.log(TAG + ': Calling increaseCapacityTo(Infinity)');
        lightWeightMap.increaseCapacityTo(Infinity.toInt());

        // If execution reaches here, no exception was thrown - this is wrong
        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue(); // Force test failure

      } catch (e) {
        // Expect to catch type error exception
        console.log(TAG + ': Caught expected exception');

        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        // Verify error message contains key content
        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain('Infinity');

        console.log(TAG + ': Test passed - Type error caught correctly');
      }

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_3500
    * @tc.name      testLightWeightMapTest02Chapter3500
    * @tc.desc      Verify boundary value -Infinity
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter3500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 1);

      try {
        // Try calling with -Infinity, expect exception to be thrown
        console.log(TAG + ': Calling increaseCapacityTo(-Infinity)');
        lightWeightMap.increaseCapacityTo((-Infinity).toInt());

        // If execution reaches here, no exception was thrown - this is wrong
        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue(); // Force test failure

      } catch (e) {
        // Expect to catch type error exception
        console.log(TAG + ': Caught expected exception');

        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        // Verify error message contains key content
        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain('-Infinity');

        console.log(TAG + ': Test passed - Type error caught correctly');
      }

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_3600
    * @tc.name      testLightWeightMapTest02Chapter3600
    * @tc.desc      Verify capacity expansion boundary value decimal
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter3600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 1);

      try {
        // Try calling with 10.5, expect exception to be thrown (requires small integer)
        console.log(TAG + ': Calling increaseCapacityTo(10.5)');
        lightWeightMap.increaseCapacityTo((10.5).toInt());

        // If execution reaches here, no exception was thrown - this is wrong
        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue(); // Force test failure

      } catch (e) {
        // Expect to catch type error exception
        console.log(TAG + ': Caught expected exception');

        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        // Verify error message contains key content
        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain('10.5');

        console.log(TAG + ': Test passed - Type error caught correctly');
      }

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_3700
    * @tc.name      testLightWeightMapTest02Chapter3700
    * @tc.desc      Verify passing Number.MAX_SAFE_INTEGER large value
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter3700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      try {
        // Try calling with Number.MAX_SAFE_INTEGER, expect exception to be thrown
        console.log(TAG + ': Calling increaseCapacityTo(Number.MAX_SAFE_INTEGER)');
        lightWeightMap.increaseCapacityTo(Number.MAX_SAFE_INTEGER.toInt());

        // If execution reaches here, no exception was thrown - this is wrong
        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue(); // Force test failure

      } catch (e) {
        // Expect to catch type error exception
        console.log(TAG + ': Caught expected exception');

        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        // Verify error message contains key content
        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain(String(Number.MAX_SAFE_INTEGER));

        console.log(TAG + ': Test passed - Type error caught correctly');
      }

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_3800
    * @tc.name      testLightWeightMapTest02Chapter3800
    * @tc.desc      Verify capacity expansion functionality under large data scenarios
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter3800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // Add 1000 elements
      for (let i: int = 0; i < 1000; i++) {
        lightWeightMap.set(`key${i}`, i);
      }
      expect(lightWeightMap.length).assertEqual(1000);

      // Expand to 2000
      lightWeightMap.increaseCapacityTo(2000);

      // Verify data integrity
      expect(lightWeightMap.get('key0')).assertEqual(0);
      expect(lightWeightMap.get('key500')).assertEqual(500);
      expect(lightWeightMap.get('key999')).assertEqual(999);

      // Verify new elements can be added
      lightWeightMap.set('key1000', 1000);
      expect(lightWeightMap.length).assertEqual(1001);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_3900
    * @tc.name      testLightWeightMapTest02Chapter3900
    * @tc.desc      Verify method binding functionality is normal
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter3900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // ArkTS does not support .call(), directly test unbound call
      const method = lightWeightMap.increaseCapacityTo;
      try {
        method(10); // Not bound to instance, should throw 10200011
        expect(false).assertTrue(); // Expect exception to be thrown
      } catch (e) {
        expect(e.code).assertEqual(10200011);
        expect(e.message).assertContain('cannot be bound');
      }

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_4000
    * @tc.name      testLightWeightMapTest02Chapter4000
    * @tc.desc      Verify iterator functionality is normal after capacity expansion
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter4000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('a', 1);
      lightWeightMap.set('b', 2);
      lightWeightMap.set('c', 3);

      // After capacity expansion
      lightWeightMap.increaseCapacityTo(10);

      // Verify iterator works correctly
      const keys: string[] = [];
      for (const key of lightWeightMap.keys()) {
        keys.push(key);
      }
      expect(keys.length).assertEqual(3);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_4100
    * @tc.name      testLightWeightMapTest02Chapter4100
    * @tc.desc      Verify byte type boundary value (-128~127) capacity expansion behavior
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter4100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // Test byte minimum value -128 (negative, should not take effect)
      lightWeightMap.increaseCapacityTo(-128);
      lightWeightMap.set('key1', 1);
      expect(lightWeightMap.length).assertEqual(1);

      // Test byte maximum value 127
      lightWeightMap.clear();
      lightWeightMap.increaseCapacityTo(127);
      // Fill up to 127 elements to verify capacity
      for (let i: int = 0; i < 127; i++) {
        lightWeightMap.set(`key${i}`, i);
      }
      expect(lightWeightMap.length).assertEqual(127);

      // Test byte out-of-bound value 128 (should expand normally)
      lightWeightMap.increaseCapacityTo(128);
      lightWeightMap.set('key128', 128);
      expect(lightWeightMap.length).assertEqual(128);

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_4200
    * @tc.name      testLightWeightMapTest02Chapter4200
    * @tc.desc      Verify short type boundary value (-32768~32767) capacity expansion behavior
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter4200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // Test short minimum value -32768 (negative, should not take effect)
      lightWeightMap.increaseCapacityTo(-32768);
      lightWeightMap.set('key1', 1);
      expect(lightWeightMap.get('key1')).assertEqual(1);

      // Test short maximum value 32767
      lightWeightMap.increaseCapacityTo(32767);
      lightWeightMap.set('key0', 0);
      expect(lightWeightMap.length).assertEqual(2);

      // Test short out-of-bound value 32768 (should expand normally)
      lightWeightMap.increaseCapacityTo(32768);
      expect(lightWeightMap.length).assertEqual(2); // Original data unaffected

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_4300
    * @tc.name      testLightWeightMapTest02Chapter4300
    * @tc.desc      Verify int type boundary value (-2147483648~2147483647) capacity expansion behavior
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter4300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // Test negative integer -2147483648 (negative, should not take effect)
      console.log(TAG + ': Testing -2147483648');
      lightWeightMap.increaseCapacityTo(-2147483648);
      lightWeightMap.set('key1', 1);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + ': Negative integer test passed');

      // Note: Testing 2147483647 causes OOM which is expected but cannot be gracefully handled
      // This boundary is documented but not tested to avoid test framework errors

      console.log(TAG + 'end');
    });

    /**
    * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_4400
    * @tc.name      testLightWeightMapTest02Chapter4400
    * @tc.desc      Verify long type boundary value (beyond Number safe integer range)
    * @tc.size      MEDIUMTEST
    * @tc.type      FUNCTION
    * @tc.level     LEVEL2
    */
    it("testLightWeightMapTest02Chapter4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter4400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // Test Case 1: Large negative number -9223372036854775808
      try {
        console.log(TAG + ': Testing -9223372036854775808');
        lightWeightMap.increaseCapacityTo((-9223372036854775808).toInt());

        // If no exception thrown, fail the test
        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue();

      } catch (e) {
        console.log(TAG + ': Caught expected exception');
        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        // Verify error message contains key content
        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain('-9223372036854776000'); // Note: precision loss

        console.log(TAG + ': Test passed - Type error caught correctly');
      }
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_5500
     * @tc.name      testLightWeightMapTest02Chapter5500
     * @tc.desc      Verify long type boundary value (beyond Number safe integer range)
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter5500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      // Test Case 2: Large positive number 9223372036854775807
      try {
        console.log(TAG + ': Testing 9223372036854775807');
        lightWeightMap.increaseCapacityTo((9223372036854775807).toInt());

        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue();

      } catch (e) {
        console.log(TAG + ': Caught expected exception');
        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain('9223372036854776000'); // Note: precision loss

        console.log(TAG + ': Test passed - Type error caught correctly');
      }

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_4500
     * @tc.name      testLightWeightMapTest02Chapter4500
     * @tc.desc      Verify float type boundary value and precision handling
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter4500';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // Test Case 1: Float minimum positive value
      try {
        console.log(TAG + ': Testing 1.40129846432481707e-45');
        lightWeightMap.increaseCapacityTo((1.40129846432481707e-45).toInt());

        // If no exception thrown, fail the test
        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue();

      } catch (e) {
        console.log(TAG + ': Caught expected exception');
        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        // Verify error message contains key content
        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain('1.401298464324817e-45');

        console.log(TAG + ': Test passed - Type error caught correctly');
      }
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_5600
     * @tc.name      testLightWeightMapTest02Chapter5600
     * @tc.desc      Verify float type boundary value and precision handling
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter5600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      // Test Case 2: Float maximum value
      try {
        console.log(TAG + ': Testing 3.40282346638528860e+38');
        lightWeightMap.increaseCapacityTo((3.40282346638528860e+38).toInt());

        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue();

      } catch (e) {
        console.log(TAG + ': Caught expected exception');
        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain('3.4028234663852886e+38');

        console.log(TAG + ': Test passed - Type error caught correctly');
      }

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_4600
     * @tc.name      testLightWeightMapTest02Chapter4600
     * @tc.desc      Verify double type boundary value and precision handling
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter4600';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // Test Case 1: Double minimum positive value
      try {
        console.log(TAG + ': Testing 4.94065645841246544e-324');
        lightWeightMap.increaseCapacityTo((4.94065645841246544e-324).toInt());

        // If no exception thrown, fail the test
        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue();

      } catch (e) {
        console.log(TAG + ': Caught expected exception');
        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        // Verify error message contains key content
        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain('5e-324');

        console.log(TAG + ': Test passed - Type error caught correctly');
      }
    });
    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_5700
     * @tc.name      testLightWeightMapTest02Chapter5700
     * @tc.desc      Verify double type boundary value and precision handling
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter5700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      // Test Case 2: Double maximum value
      try {
        console.log(TAG + ': Testing 1.79769313486231570e+308');
        lightWeightMap.increaseCapacityTo((1.79769313486231570e+308).toInt());

        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue();

      } catch (e) {
        console.log(TAG + ': Caught expected exception');
        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain('1.7976931348623157e+308');

        console.log(TAG + ': Test passed - Type error caught correctly');
      }

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_4700
     * @tc.name      testLightWeightMapTest02Chapter4700
     * @tc.desc      Verify char type boundary value (0~65535)
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter4700';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // Test char minimum value 0
      lightWeightMap.increaseCapacityTo(0);
      lightWeightMap.set('key1', 1);
      expect(lightWeightMap.length).assertEqual(1);

      // Test char maximum value 65535
      lightWeightMap.clear();
      lightWeightMap.increaseCapacityTo(65535);
      lightWeightMap.set('key0', 0);
      expect(lightWeightMap.length).assertEqual(1);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_4800
     * @tc.name      testLightWeightMapTest02Chapter4800
     * @tc.desc      Verify passing BigInt type (converted via Number)
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter4800';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();
      lightWeightMap.set('key1', 1);

      const numberValue = Number.MAX_SAFE_INTEGER;

      try {
        console.log(TAG + ': Calling increaseCapacityTo(' + numberValue + ')');
        lightWeightMap.increaseCapacityTo(numberValue.toInt());

        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue();

      } catch (e) {
        console.log(TAG + ': Caught expected exception');

        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        expect(errorMessage).assertContain('must be small integer');

        console.log(TAG + ': Test passed - Type error caught correctly');
      }

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_4900
     * @tc.name      testLightWeightMapTest02Chapter4900
     * @tc.desc      Verify hexadecimal value capacity expansion
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter4900';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // Test hexadecimal value 0x0102 = 258
      lightWeightMap.increaseCapacityTo(0x0102);
      lightWeightMap.set('key0', 0);
      expect(lightWeightMap.length).assertEqual(1);

      // Test 32-base numeric value (ArkTS not supported, use octal instead)
      lightWeightMap.increaseCapacityTo(0o102); // 0o prefix is octal

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_5000
     * @tc.name      testLightWeightMapTest02Chapter5000
     * @tc.desc      Verify octal value capacity expansion
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter5000';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // Test octal value 0o3 = 3
      lightWeightMap.increaseCapacityTo(0o3);
      // Verify capacity for 3 elements
      lightWeightMap.set('key1', 1);
      lightWeightMap.set('key2', 2);
      lightWeightMap.set('key3', 3);
      expect(lightWeightMap.length).assertEqual(3);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_5100
     * @tc.name      testLightWeightMapTest02Chapter5100
     * @tc.desc      Verify capacity expansion value calculated by exponentiation operator
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter5100';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // Test exponentiation operator 2 ** 3 = 8
      lightWeightMap.increaseCapacityTo(8);
      // Verify capacity for 8 elements
      for (let i: int = 1; i <= 8; i++) {
        lightWeightMap.set(`key${i}`, i);
      }
      expect(lightWeightMap.length).assertEqual(8);

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_5200
     * @tc.name      testLightWeightMapTest02Chapter5200
     * @tc.desc      Verify scientific notation value capacity expansion
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter5200';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      // Test 1: Scientific notation 1e3 = 1000 (integer, should succeed)
      console.log(TAG + ': Testing 1e3 (1000)');
      lightWeightMap.increaseCapacityTo((1e3).toInt());
      lightWeightMap.set('key0', 0);
      expect(lightWeightMap.length).assertEqual(1);
      console.log(TAG + ': 1e3 test succeeded');

      // Test 2: Decimal scientific notation 2.5e-2 = 0.025 (floating-point, should throw exception)
      console.log(TAG + ': Testing 2.5e-2 (0.025)');

      try {
        lightWeightMap.increaseCapacityTo((2.5e-2).toInt());

        // If execution reaches here, no exception was thrown - this is wrong
        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue(); // Force test failure

      } catch (e) {
        // Expect to catch type error exception
        console.log(TAG + ': Caught expected exception');

        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        // Verify error message contains key content
        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain('0.025');

        console.log(TAG + ': Test passed - Type error caught correctly');
      }

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_5300
     * @tc.name      testLightWeightMapTest02Chapter5300
     * @tc.desc      Verify passing Number.MAX_SAFE_INTEGER large value scenario
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter5300';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      try {
        // Try calling with Number.MAX_SAFE_INTEGER, expect exception to be thrown
        console.log(TAG + ': Calling increaseCapacityTo(Number.MAX_SAFE_INTEGER)');
        lightWeightMap.increaseCapacityTo(Number.MAX_SAFE_INTEGER.toInt());

        // If execution reaches here, no exception was thrown - this is wrong
        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue(); // Force test failure

      } catch (e) {
        // Expect to catch type error exception
        console.log(TAG + ': Caught expected exception');

        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        // Verify error message contains key content
        expect(errorMessage).assertContain('must be small integer');
        expect(errorMessage).assertContain('9007199254740991');

        console.log(TAG + ': Test passed - Type error caught correctly');
      }

      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTMAP_TESTTWO_5400
     * @tc.name      testLightWeightMapTest02Chapter5400
     * @tc.desc      Verify passing Number.MAX_SAFE_INTEGER + 1 boundary value scenario
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it("testLightWeightMapTest02Chapter5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightMapTest02Chapter5400';
      console.log(TAG + 'start');

      const lightWeightMap = new LightWeightMap<string, number>();

      try {
        const unsafeInt = Number.MAX_SAFE_INTEGER + 1;
        console.log(TAG + ': Calling increaseCapacityTo(Number.MAX_SAFE_INTEGER + 1):', unsafeInt);

        lightWeightMap.increaseCapacityTo(unsafeInt.toInt());

        // If execution reaches here, no exception was thrown - this is wrong
        console.error(TAG + ': Error! Should throw exception but did not');
        expect(false).assertTrue(); // Force test failure

      } catch (e) {
        // Expect to catch type error exception
        console.log(TAG + ': Caught expected exception');

        const error = e as Error;
        const errorMessage = error.message;

        console.log(TAG + ': Error message:', errorMessage);

        // Verify error message contains key content
        expect(errorMessage).assertContain('must be small integer');
        // Note: After precision loss may display as 9007199254740992
        expect(errorMessage).assertContain('9007199254740992');

        console.log(TAG + ': Test passed - Type error caught correctly');
      }

      console.log(TAG + 'end');

    });
  })
}